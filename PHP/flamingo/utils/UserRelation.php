<?php
/*
 * XX用户好友关系类
 * author: huasong
 * 2个uid间关系的确立会写入2个记录
 * */

//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";
require_once SYSDIR_UTILS. "/DB.php";
require_once SYSDIR_UTILS. "/REDIS.php";

class UserRelation
{
    /*
     * u_r_status 0 关系归零 删除好友后的标记
     *
     * u_r_status 1 邀请
     * u_r_status 2 拒绝
     * u_r_status 4 将对方拉黑
     *
     * u_r_status 3 好友
     *
     * u_r_status 5 被邀请
     * u_r_status 6 被拒绝
     * u_r_status 7 被拉黑
     *
     * u_r_status 8 被删除好友关系 字段里不标识该值 只在u_r_change_log里标记
     *
     * TODO: u_r_change_log 存储超过长度时的应对策略
     * */
    public $db;
    public $redis;
    public $uid;

    function __construct(){
        $this->redis = new myRedis();
        $this->redis->use_redis( 'write' );
        $this->db = new DB();
    }
    function __destruct(){
    }
    function userFriend($uid=0){
        if( $uid=='' ) return;
        $this->uid = $uid;
    }

    /*
     * 获取用户好友关系列表
     */
    function getUserFriend($uid=0){
        if( $uid=='' && $this->uid=='' ) return false;
        if( $uid=='' ){
            $uid = $this->uid;
        }
        $redis_key = "userFriend:".$uid;
        $user_friend = $this->redis->redis->get( $redis_key );
        if( $user_friend ) return json_decode( $user_friend, true );
        $uid_ex = $this->uidEx( $uid );
        $_sql = "SELECT * FROM user_relation_{$uid_ex} WHERE uid='{$uid}' AND u_r_status='3'";
        $this->db->use_db( 'read' );
        $user_friend = $this->db->query( $_sql );
        if( $user_friend ){
            $this->redis->redis->set( $redis_key, json_encode( $user_friend ), 86400*7 );
        }
        return $user_friend;
    }
    /*
     * 获取两uid间关系
     */
    function getUserRelation($uid=0, $uid2=0){
        if( $uid2=='' ) return false;
        if( $uid=='' && $this->uid=='' ) return false;
        if( $uid=='' ){
            $uid = $this->uid;
        }
        $uid_ex = $this->uidEx( $uid );
        $_sql = "SELECT * FROM user_relation_{$uid_ex} WHERE uid='{$uid}' AND uid2='{$uid2}'";
        $this->db->use_db( 'read' );
        $user_relation = $this->db->query( $_sql );
        if( $user_relation ){
            return $user_relation[0];
        }
        return false;
    }

    /*
     * 邀请加为好友
     * 
     */
    function inviteUserFriend($uid=0, $uid2=0, $uid2_mod=0){
        if( $uid2=='' ) return false;
        if( $uid=='' && $this->uid=='' ) return false;
        if( $uid=='' ){
            $uid = $this->uid;
        }
        $uid_u_r_status = 1;
        $uid2_u_r_status = 5;
        if( $uid2_mod==1 ){/*1 默认允许被加好友 */
            $uid2_u_r_status = $uid_u_r_status = 3;
        }
        $_t = time();
        $t = time()-strtotime('2014-04-01');//取该时刻为起点，减少该字段的存储空间
        $user_relation = $this->getUserRelation( $uid, $uid2 );
        $user2_relation = $this->getUserRelation( $uid2, $uid );
        $uid_result = $uid2_result = true;
        if( $user_relation ){
            /*
             * u_r_status 0 关系归零
             *
             * u_r_status 1 邀请
             * u_r_status 2 拒绝
             * u_r_status 4 将对方拉黑
             *
             * u_r_status 3 好友
             *
             * u_r_status 5 被邀请
             * u_r_status 6 被拒绝
             * u_r_status 7 被拉黑
             * */
            if( $user_relation['u_r_status']==3 ){//已是好友 
                return true;
            }
            elseif( $user_relation['u_r_status']==7 ){//已被拉黑 不能邀请只能被邀请
                return false;
            }
            elseif( $user_relation['u_r_status']==1 ){//已邀请过 返回true
                return true;
            }
            /* 更新逻辑一样 移到下方的代码段里
            elseif(  $user_relation['u_r_status']==5 ){//互相邀请 等于通过对方邀请
            }
             */
            elseif( $user_relation['u_r_status']==0 || $user_relation['u_r_status']==2 || $user_relation['u_r_status']==4 || $user_relation['u_r_status']==6 
                || $user_relation['u_r_status']==5 /*被邀请*/){
                    if($user_relation['u_r_status']==5){
                        $uid_u_r_status = $uid2_u_r_status = 3;
                        $redis_key1 = "userFriend:".$uid;
                        $redis_key2 = "userFriend:".$uid2;
                        $this->redis->redis->delete( $redis_key1, $redis_key2 );
                    }
                    return $this->updateUserFriend( $user_relation, $user2_relation, $uid_u_r_status, $uid2_u_r_status );
                }
        }
        else{
            $this->db->use_db( 'write' );
            $this->db->db->autocommit(FALSE);
            $uid_ex = $this->uidEx( $uid );
            $uid_result = $this->db->insert( "user_relation_{$uid_ex}", array('uid'=>$uid, 'uid2'=>$uid2, 'u_r_status'=>$uid_u_r_status, 'u_r_time'=>$_t ) );
            $uid2_ex = $this->uidEx( $uid2 );
            $uid2_result = $this->db->insert( "user_relation_{$uid2_ex}", array('uid'=>$uid2, 'uid2'=>$uid, 'u_r_status'=>$uid2_u_r_status, 'u_r_time'=>$_t ) );
            if( ! $uid_result || ! $uid2_result || ! $this->db->db->commit() ){
                $this->db->db->rollback();
                $this->db->db->autocommit(TRUE);
                return false;
            }
            $this->db->db->autocommit(TRUE);
            return true;
        }
    }

    /*
     * 应答好友邀请
     */
    function ActInviteUserFriend( $uid, $uid2, $ac=true ){
        if( $uid2=='' ) return false;
        if( $uid=='' && $this->uid=='' ) return false;
        if( $uid=='' ){
            $uid = $this->uid;
        }
        $user_relation = $this->getUserRelation( $uid, $uid2 );
        $user2_relation = $this->getUserRelation( $uid2, $uid );
        if( $user_relation['u_r_status']==3 && $user2_relation['u_r_status']==3 ){//已应答过 已是好友
            return true;
        }
        if( $user_relation['u_r_status']==5 && $user2_relation['u_r_status']==1 ){//初次应答
            if( $ac==true ){
                $uid_u_r_status = $uid2_u_r_status = 3;
            }
            else{
                $uid_u_r_status = 2;
                $uid2_u_r_status = 6;
            }
            return $this->updateUserFriend( $user_relation, $user2_relation, $uid_u_r_status, $uid2_u_r_status );
        }
        return false;
    }

    /*
     * 删除好友关系
     * uid 发起
     */
    function deleteUserFriend( $uid, $uid2 ){
        if( $uid2=='' ) return false;
        if( $uid=='' && $this->uid=='' ) return false;
        if( $uid=='' ){
            $uid = $this->uid;
        }
        // 2个的 u_r_status 都归零
        $user_relation = $this->getUserRelation( $uid, $uid2 );
        $user2_relation = $this->getUserRelation( $uid2, $uid );
        if( $user_relation['u_r_status']==3 && $user2_relation['u_r_status']==3 ){
            $uid_u_r_status = $uid2_u_r_status = 0;
            return $this->updateUserFriend( $user_relation, $user2_relation, $uid_u_r_status, $uid2_u_r_status );
        }
        return false;
    }

    /*
     * 拉黑
     */
    function blockUserFriend( $uid, $uid2 ){
        if( $uid2=='' ) return false;
        if( $uid=='' && $this->uid=='' ) return false;
        if( $uid=='' ){
            $uid = $this->uid;
        }
        // 2个的 u_r_status 都归零
        $user_relation = $this->getUserRelation( $uid, $uid2 );
        $user2_relation = $this->getUserRelation( $uid2, $uid );
        if( ($user_relation['u_r_status']==3 && $user2_relation['u_r_status']==3 )//好友关系
            || ($user_relation['u_r_status']==0 && $user2_relation['u_r_status']==0 )/*曾经是好友关系*/ ){
                $uid_u_r_status = 4;
                $uid2_u_r_status = 7;
                return $this->updateUserFriend( $user_relation, $user2_relation, $uid_u_r_status, $uid2_u_r_status );
            }
        return false;
    }

    /*
     * 公共部分提取出来
     */
    private function updateUserFriend( $user_relation, $user2_relation, $uid_u_r_status, $uid2_u_r_status ){
        if( ! is_array( $user_relation ) || ! is_array( $user2_relation ) ) return false;
        if( ! is_int( $uid_u_r_status ) || ! is_int( $uid2_u_r_status ) ) return false;
        $_t = time();
        //echo $_t,"\n";
        $t = time()-strtotime('2014-04-01');//取该时刻为起点，减少该字段的存储空间
        $this->db->use_db( 'write' );
        $this->db->db->autocommit(FALSE);
        $change_log = $change_log2 = array();

        if( $user_relation['u_r_chang_log'] ){
            $change_log = json_decode( $user_relation['u_r_chang_log'], true );
        }
        $change_log[] = "{$uid_u_r_status}_{$t}";
        $_json = json_encode( $change_log );
        $uid_ex = $this->uidEx( $user_relation['uid'] );
        $uid_result = $this->db->update( "user_relation_{$uid_ex}", array('u_r_status'=>$uid_u_r_status, 'u_r_time'=>$_t, 'u_r_chang_log'=>$_json), array('uid'=>$user_relation['uid'], 'uid2'=>$user2_relation['uid']) );
        //echo $this->db->sql,"\n";

        if( $user2_relation['u_r_chang_log'] ){
            $change_log2 = json_decode( $user2_relation['u_r_chang_log'], true );
        }
        if( $uid2_u_r_status==0 ){//被删除
            $change_log2[] = "8_{$t}";
        }
        else{
            $change_log[] = "{$uid2_u_r_status}_{$t}";
        }
        $_json2 = json_encode( $change_log2 );
        $uid2_ex = $this->uidEx( $user2_relation['uid'] );
        $uid2_result = $this->db->update( "user_relation_{$uid2_ex}", array('u_r_status'=>$uid2_u_r_status, 'u_r_time'=>$_t, 'u_r_chang_log'=>$_json2), array('uid'=>$user2_relation['uid'], 'uid2'=>$user_relation['uid']) );
        //echo $this->db->sql,"\n";

        if( ! $uid_result || ! $uid2_result || ! $this->db->db->commit() ){
            $this->db->db->rollback();
            $this->db->db->autocommit(TRUE);
            return false;
        }
        $this->db->db->autocommit(TRUE);
        return true;
    }

    /*
     * 标记分组
     */
    function updateUserGroupName( $uid, $uid2, $group_name='' ){
        if( $uid2=='' ) return false;
        if( $uid=='' && $this->uid=='' ) return false;
        if( $uid=='' ){
            $uid = $this->uid;
        }
        $this->db->use_db( 'write' );
        $uid_ex = $this->uidEx( $uid );
        $uid_result = $this->db->update( "user_relation_{$uid_ex}", array('u_group_name'=>$group_name ), array('uid'=>$uid, 'uid2'=>$uid2) );
        return $uid_result;
    }

    /*
     * 标记备注
     */
    function updateUserRemarkName( $uid, $uid2, $remark_name='' ){
        if( $uid2=='' ) return false;
        if( $uid=='' && $this->uid=='' ) return false;
        if( $uid=='' ){
            $uid = $this->uid;
        }
        $this->db->use_db( 'write' );
        $uid_ex = $this->uidEx( $uid );
        $uid_result = $this->db->update( "user_relation_{$uid_ex}", array('u_remark_name'=>$remark_name ), array('uid'=>$uid, 'uid2'=>$uid2) );
        return $uid_result;
    }

    /*
     * uid分布存储的表后缀 以30w uid分一个表
     */
    private function uidEx($uid=0){
        if( $uid=='' && $this->uid=='' ) return false;
        if( $uid=='' ){
            $uid = $this->uid;
        }
        $ex_index = floor($uid/300000);
        $ex_arr = $this->generExtArr();
        return $ex_arr[$ex_index];
    }
    /*
     * 分表下标数组产生 千万不能更改
     */
    private function generExtArr(){
        for( $i=0; $i<10; $i++ ){
            $base[] = $i;
        }
        for( $i=97; $i<=122; $i++ ){
            $base[] = chr( $i );
        }
        $ext=array();
        foreach( $base as $v ){
            foreach( $base as $v2 ){
                if( in_array( $v.$v2, $ext ) ) continue;
                $ext[] = $v.$v2;
            }
        }
        return $ext;
    }

}
