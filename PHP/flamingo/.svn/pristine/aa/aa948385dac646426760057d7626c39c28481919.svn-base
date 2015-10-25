<?php
/*
 * 橄榄邮(私信)相关
 * author: huasong
 * 一个用户的私信会话列表是存储在sixin_sess_[XX] 这样的表结构里 [XX] 是该用户基本表里的ex
 * 具体私信内容存储在 sixin_msg_[yymm] 这样的表里 [yymm] 是表示年月 如 1408 //暂时如此TODO随业务发展变更为一天一张表
 * 注意: 每个月的新表起始自增ID应该比上月最末一个大 //这个读写压力都集中在一个表后续根据业务发展调整
 *
 * 未读状态标记在redis (gpsixin) 的 hashTable 里
 * 键为 unread_msg_count 及 unread_reply_count
 *
 * */

//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";
require_once SYSDIR_UTILS. "/DB.php";
require_once SYSDIR_UTILS. "/REDIS.php";

class UserMessage
{
    /* */
    public $db;
    public $redis;

    function __construct(){
        $this->redis = new myRedis();
        $this->redis->use_redis( 'gpsixin' );
        $this->db = new DB();

    }
    function __destruct(){
    }

    /*
     * 用户私信状态
     * */
    function getUserState( $uin=33 ){
        if( empty($uin) ) return false;
        $this->redis->use_redis( 'gpsixin' );
        $unread_msg_count = $this->redis->redis->hGet( 'unread_msg_count', $uin );
        $unread_reply_count = $this->redis->redis->hGet( 'unread_reply_count', $uin );
        if( $unread_msg_count<=0 ) $unread_msg_count=0;//避免为空
        if( $unread_reply_count<=0 ) $unread_reply_count=0;//避免为空
        return array( 'unread_msg_count'=>$unread_msg_count, 'unread_reply_count'=>$unread_reply_count );
    }

    /*
     * 用户的私信列表
     * */
    function getUserMailChatList( $uin=33, $ex='aa', $start_time=0, $direction=0, $count=30 ){
        if( empty($uin) || empty($ex) ) return false;
        $this->db->use_db('gpbbs');
        $tb_sixin_sess = "sixin_sess_{$ex}";
        if( $direction==0 ){
            $and_where = " AND last_updatetime>'{$start_time}'";
        }
        else{
            $and_where = " AND last_updatetime<='{$start_time}'";
        }
        $sess_list = $this->db->select( $tb_sixin_sess, '*', "uin1='{$uin}' AND status=1 {$and_where}", 'last_updatetime desc', $count );
        //@file_put_contents( '/tmp/abc.tt', $this->db->sql."\n", FILE_APPEND );
        if( empty($sess_list) ) return $sess_list;
        foreach( $sess_list as $k => $v ){//获取最新的一条信息
            $sess_list[$k]['latest_msg'] = $this->getUserSessLatestMsg( $v['sess_id'] );
        }
        return $sess_list;
    }

    /*
     * 获取单个会话最末的一条消息
     * */
    function getUserSessLatestMsg( $sess_id='33-1-1406789022' ){
        $uin = 33;
        if( empty($uin) || empty($sess_id) ) return false;
        $this->db->use_db('gpbbs');
        $current_month = date('ym');
        $tb = "sixin_msg_{$current_month}";
        $msg = $this->db->select( $tb, '*', "sess_id='{$sess_id}'", "id DESC", 1 );
        if( empty($msg) ){
            $last_month = date('ym', strtotime('-1 month'));
            $tb = "sixin_msg_{$last_month}";
            $msg = $this->db->select( $tb, '*', "sess_id='{$sess_id}'", "id DESC", 1 );
        }
        if( empty($msg) ){
            return false;
        }
        return $msg[0];
    }

    /*
     * 获取一个uin的和另一个uin的当前会话ID
     * */
    function getUser2UserSessID( $uin1=33, $ex='aa', $uin2=1 ){
        if( empty($uin1) || empty($ex) || empty($uin2) ) return false;
        $this->db->use_db('gpbbs');
        $tb_sixin_sess = "sixin_sess_{$ex}";
        return $this->db->select( $tb_sixin_sess, '*', "uin1='{$uin1}' AND uin2='{$uin2}' AND status=1", 'ID desc', 1 );
    }

    /*
     * 获取一个会话从某个id附近的数据
     *
     * */
    function getUserSessMsgList( $sess_id='33-1-1406789022', $start_mail_id=1, $direction=0, $count=30 ){
        if( empty($sess_id) || empty($count) ) return false;
        $this->db->use_db('gpbbs');
        $current_month = date('ym');
        $tb = "sixin_msg_{$current_month}";
        if( $direction==0 ){//此处  id  原来是ID
            $and_where = " AND id>'{$start_mail_id}'";
        }
        else{
            $and_where = " AND id<'{$start_mail_id}'";
        }
        $msg = $this->db->select( $tb, '*', "sess_id='{$sess_id}' {$and_where}", "id DESC", $count );
        $this->db->query( "UPDATE {$tb} SET status=1 WHERE sess_id='{$sess_id}' {$and_where} ORDER BY id DESC LIMIT $count" );
        if( count($msg)!=$count ){//当前月取的不足count条信息则到上月取 如果还不足则忽略了
            $count2 = $count-count($msg);
            $last_month = date('ym', strtotime('-1 month'));
            $tb = "sixin_msg_{$last_month}";
            $msg2 = $this->db->select( $tb, '*', "sess_id='{$sess_id}' {$and_where}", "id DESC", $count2 );
            $this->db->query( "UPDATE {$tb} SET status=1 WHERE sess_id='{$sess_id}' {$and_where} ORDER BY id DESC LIMIT {$count2}" );
            if( $msg2 ){
                foreach( $msg2 as $k => $v ){
                    $msg[] = $v;
                }
            }
        }
        return $msg;
    }

    /*
     * 获取一个会话从某个id附近的数据
     * */
    function getUser2UserMsgList( $uin1=33, $ex='aa', $uin2=1, $start_mail_id=1, $direction=0, $count=30 ){
        if( empty($uin1) || empty($ex) || empty($uin2) || empty($count) ) return false;
        $sess_info = $this->getUser2UserSessID( $uin1, $ex, $uin2 );
        if( empty($sess_info) ) return false;
        if( $direction==0 ){
            $this->redis->use_redis( 'gpsixin' );
            $unread_msg_count = $this->redis->redis->hGet( 'unread_msg_count', $uin1 );
            if( $unread_msg_count>=$sess_info[0]['unread_count'] ){
                $this->redis->redis->hIncrBy( 'unread_msg_count', $uin1, 0-$sess_info[0]['unread_count'] );//外层减去对应的
            }
            else{
                $this->redis->redis->hSet( 'unread_msg_count', $uin1, 0 );//置0
            }
            $this->db->use_db('gpbbs');
            $tb_sixin_sess = "sixin_sess_{$ex}";
            $this->db->update( $tb_sixin_sess, array('unread_count'=>0), array('sess_id'=>$sess_info[0]['sess_id']) );//内层置0
        }
        return $this->getUserSessMsgList( $sess_info[0]['sess_id'], $start_mail_id, $direction, $count );
    }

    /*
     * 删除会话
     * */
    function delUser2UserSess( $uin1=33, $ex='aa', $uin2=1 ){
        if( empty($uin1) || empty($ex) || empty($uin2) ) return false;
        $this->db->use_db('gpbbs');
        $tb_sixin_sess = "sixin_sess_{$ex}";
        return $this->db->update( $tb_sixin_sess, array('status'=>0), "uin1='{$uin1}' AND uin2='{$uin2}' AND status=1" );
    }

    /*
     * uin1发送消息给uin2
     * 双写
     * */
    function sendMsgUser2User( $uin1=33, $ex1='aa', $uin2=1, $ex2='aa', $msg='..' ){
        if( empty($uin1) || empty($ex1) || empty($uin2) || empty($ex2) || $msg=='' || $uin1==$uin2 ) return false;
        $this->db->use_db( 'gpbbs' );
        //start Transaction
        $this->db->query('start transaction');
        $t = time();

        $uin1_sess = $this->getUser2UserSessID( $uin1, $ex1, $uin2 );
        if( empty($uin1_sess) ){
            $uin1_sess_id = "{$uin1}-{$uin2}-{$t}-1";
            if( ! $this->db->insert( "sixin_sess_{$ex1}", array('uin1'=>$uin1, 'uin2'=>$uin2, 'sess_id'=>$uin1_sess_id, 'ask_accept'=>1, 'addtime'=>$t) ) ){
                $this->db->query('rollback');
                return false;
            }
        }
        else{
            $uin1_sess_id = $uin1_sess[0]['sess_id'];
        }
        $uin2_sess = $this->getUser2UserSessID( $uin2, $ex2, $uin1 );
        if( empty($uin2_sess) ){
            $uin2_sess_id = "{$uin1}-{$uin2}-{$t}-2";
            if( ! $this->db->insert( "sixin_sess_{$ex2}", array('uin1'=>$uin2, 'uin2'=>$uin1, 'sess_id'=>$uin2_sess_id, 'ask_accept'=>2, 'addtime'=>$t) ) ){
                $this->db->query('rollback');
                return false;
            }
        }
        else{
            $uin2_sess_id = $uin2_sess[0]['sess_id'];
        }
        $ym = date('ym', $t);
        if( $this->db->insert( "sixin_msg_{$ym}", array('from_uin'=>$uin1, 'to_uin'=>$uin2, 'sess_id'=>$uin2_sess_id, 'msg'=>$msg, 'addtime'=>$t) ) //收信者的默认是0
            && $this->db->update( "sixin_sess_{$ex1}", array('last_updatetime'=>$t), array('sess_id'=>$uin1_sess_id) ) //最后更新时间
            && $this->db->update( "sixin_sess_{$ex2}", array('last_updatetime'=>$t, 'unread_count'=>($uin2_sess[0]['unread_count']+1)), array('sess_id'=>$uin2_sess_id) ) //最后更新时间 未读+1
            && $this->db->insert( "sixin_msg_{$ym}", array('from_uin'=>$uin1, 'to_uin'=>$uin2, 'sess_id'=>$uin1_sess_id, 'msg'=>$msg, 'addtime'=>$t, 'status'=>1) ) //发信者的默认是1
            ){//双写
            $id = $this->db->next_id();
            if( $this->db->query('commit') ){
                $this->redis->use_redis( 'gpsixin' );
                $this->redis->redis->hIncrBy( 'unread_msg_count', $uin2, 1 );// 未读橄榄邮+1
                $this->redis->redis->lPush( 'push_list_tmp', json_encode( array( 'post_type'=>2, 'tuin'=>$uin2, 'fuin'=>$uin1, 'msg'=>$msg ) ) );//
                return $id;
            }
        }
        $this->db->query('rollback');
        return false;
    }

    /*
     * 获取通知消息列表
     * direction 方向， 0是取新的，1是取旧的
     * */
    function getUserReply( $uin=33, $start_time, $direction=0, $count=30 ){
        if( empty($uin) || empty($count) ) return false;
        if( $start_time==0 ){//首次取最新
            $start_time = time();
            $direction = 1;
            $_direct = true;
        }
        $date = date('ymd', $start_time);
        if( $date<140811 ) return false;
        if( $date>date('ymd') ) return false;
        if( $direction==0 ){
            $where = "AND addtime>'{$start_time}'";
            $orderby = 'id ASC';
        }
        else{
            $where = "AND addtime<'{$start_time}'";
            $orderby = 'id DESC';
        }
        $this->db->use_db( 'gpreply' );
        $data = $this->db->select( "reply_{$date}", '*', "uin='{$uin}' {$where}" , $orderby, $count );
        $d_c = count($data);
        if( $d_c==$count ){
            if( $direction==0 || isset($_direct) ){
                $this->redis->use_redis( 'gpsixin' );
                $this->redis->redis->hSet( 'unread_reply_count', $uin, 0 );// 未读回复数量置0 
            }
            return $data;//空或者个数相等
        }
        //个数不足 补全
        $cc = date('Y-m-d',$start_time);
        $t_0 = strtotime($cc);
        if( $direction==0 ){
            $_t = $t_0  + 86400;//得到后一天的 23:59:59的时间
        }
        else{
            $_t = $t_0 - 1;//得到前一天的  23:59:59的时间
        }
        $d2 = $this->getUserReply( $uin, $_t, $direction, $count-$d_c );//递归
        if( $d2 ){
            foreach( $d2 as $_d ){
                $data[] = $_d;
            }
        }
        if( $direction==0  || isset($_direct) ){
            $this->redis->use_redis( 'gpsixin' );
            $this->redis->redis->hSet( 'unread_reply_count', $uin, 0 );// 未读回复数量置0 
        }
        return $data;
    }

    /*
     * 安卓用户push消息
     * */
    function getUserPushInfo( $uin=33 ){
        if( empty($uin) ) return false;
        $this->redis->use_redis( 'gpsixin' );
        $arr = array();
        while( $tmp = $this->redis->redis->rPop( "push_list_{$uin}" ) ){
            $arr[] = json_decode( $tmp, true );
        }
        return $arr;
    }

    /*
     * 读取用户某个月份单个会话未读信息数
     * XXX 废弃 用一个字段代替这个 在API接口里应避免大量的计算量
     * */
    function getUserSessMonthUnreadCount( $uin=33, $sess_id='33-1-1406789022', $month='1408' ){
        return false;
        if( empty($uin) || empty($sess_id) ) return false;
        $this->db->use_db('gpbbs');
        $tb = "sixin_msg_{$month}";
        $count = $this->db->query( "SELECT count(id) as c FROM {$tb} WHERE to_uin='{$uin}' AND sess_id='{$sess_id}' AND status=0" );
    }

}
