<?php
/*
 * 活动ActivityBbs类 增改查
 * author: huasong
 * 小组f(版块) -> 帖子t -> 评论c 三层结构 后2个存储在哪个表里是依赖于前一个的ex字段。
 * 小组f(版块)有关注的用户uin列表f_uin 存储在哪个表里是依赖于f的ex字段。
 * 帖子t有点赞的用户uin列表t_dianzan_uin 存储在哪个表里是依赖于t的ex字段。
 *
 * 活动逻辑结构和上述的类似 ainfo -> atinfo -> (at_comment & at_dianzan_uin)

 * 缓存key规则
 * 单个活动 "A_{$ainfo('id')}"
 * 活动列表 "AL_{$ainfo['fid']}*"
 * 帖子列表 "ATL_{$atinfo['afid']}*"
 * 评论列表 "ATCL_{$atcinfo['atid']}*"
 * 帖子信息 "ATINFO_{$atdinfo['atid']}"
 *
 * */

//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";
require_once SYSDIR_UTILS. "/DB.php";
require_once SYSDIR_UTILS. "/REDIS.php";

class ActivityBbs
{
    /* */
    public $db;
    public $redis;
    public $default_f_ex = 'aa';//默认 帖子ex 小组关注ex
    public $default_t_ex = 'aa';//默认 帖子评论ex 帖子点赞ex
    public $default_at_ex = 'aa';//默认 活动跟帖被点赞ex
    public $default_fb_ex = 'aa';//默认 FileObject记录存储ex
    public $pic_dpre = 'http://www.guopan.cn/user/bpic/';// 果盘累论坛系统图像域名
    /* 帖子 活动 活动跟帖 三种情况会有图片
     * 帖子图片 保存目录为 t/{yymmdd}/{fid}_{tid}_{time}_{random}.{ext} {tid}可以为空
     * 活动或活动跟帖图片 保存目录为 a/{yymmdd}/{afid}_{atid}_{time}_{random}.{ext} {atid}可以为空
     * */

    function __construct(){
        $this->redis = new myRedis();
        $this->redis->use_redis( 'gpbbs' );
        $this->db = new DB();
        $this->pic_dpre = 'http://'.DOMAIN.'/user/bpic/';

    }
    function __destruct(){
    }   

	/*
     * 新增活动
     * 
     * */
    function addAinfo( $ainfo ){
        if( empty($ainfo['a_create_uin']) ){
            return false;
        }
		$this->db->use_db( 'gpbbs' );
        $this->db->query("start transaction");

        $ainfo['a_addtime'] = time();
        $ainfo['a_uin_count'] = 1;
        $r_a = $this->db->insert( 'ainfo', $ainfo );
        //添加关注
        $afid =  $this->db->next_id();
        $r_u = $this->db->insert( 'a_uin', array('afid'=>$afid, 'uin'=>$ainfo['a_create_uin'], 'a_addtime'=>$ainfo['a_addtime']) );
        
        if( $ainfo['fid'] ){
            $r_f = $this->db->query("update finfo set f_a_count=f_a_count+1 where id={$ainfo['fid']}");
        }else{
            $r_f = true;
        }

        if( $r_a && $r_f && $r_u && $this->db->query("commit") ){
            //清掉相关活动列表缓存
            $this->redis->use_redis( 'gpbbs' );
            $keys = $this->redis->redis->keys( "AL_*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }

            //删除小组缓存
            $keysf = $this->redis->redis->keys( "FL_*" );
            if( $keysf ){
                $this->redis->redis->delete( $keysf );
            } 
            //用户关注活动列表
            if($keysaul = $this->redis->redis->keys( "AUL_{$auinfo['uin']}*" ) ){
                $this->redis->redis->delete( $keysaul );
            }
            return true;
        }
        else{
            $this->db->query("rollback");
            return false;
        }
    }
	
	/*
     * 新增活动跟帖
     * 
     * */

    function addATinfo($atinfo){
        if( empty($atinfo['afid']) || empty($atinfo['at_create_uin']) ) return false;
        $atinfo['at_addtime'] = time();
        $atinfo['at_ex'] = $this->default_at_ex;
        $atinfo['at_ding_lasttime'] = time();
        $this->db->use_db( 'gpbbs' );
        //开启事物
        $this->db->query('start transaction');
        $re_t = $this->db->insert( 'atinfo', $atinfo ); //新增跟帖
        
        //新增关注
        $_res = $this->db->select( 'a_uin', '*', "afid={$atinfo['afid']} AND uin={$atinfo['at_create_uin']}" );
        $auinfo = array('afid'=>$atinfo['afid'],'uin'=>$atinfo['at_create_uin'],'status'=>1);
        if( empty($_res) ){
            $set = "a_uin_count=a_uin_count+1 , a_t_count=a_t_count+1";
            $re_u = $this->db->insert('a_uin',$auinfo); 
        }else{
            $set = "a_t_count=a_t_count+1";
            $re_u = $this->db->update( 'a_uin', $auinfo, "afid={$auinfo['afid']} AND uin={$auinfo['uin']}" );

            $this->redis->use_redis( 'gpbbs' );
            $key = "UAIN_{$atinfo['at_create_uin']}_{$atinfo['afid']}";//清除关注缓存
            $key = $this->redis->redis->keys($key);
            if($key){
                $this->redis->redis->delete($key);
            }
        }

        //ainfo 的 a_t_count+1 ，a_uin_count+1
        $re_f = $this->db->query("update ainfo set {$set} where id={$atinfo['afid']}");  
        $r_a = $this->db->query("select fid from ainfo where id={$atinfo['afid']}");

        if( $re_t && $re_u && $re_f && $r_a && $this->db->query('commit')){
            $this->redis->use_redis( 'gpbbs' );
            //单个活动缓存
            if($keya = $this->redis->redis->keys("A_{$ainfo['id']}")){
                $this->redis->redis->delete( $keya );
            }
            //清掉相关活动跟帖列表缓存
            $keys = $this->redis->redis->keys( "ATL_{$atinfo['afid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $keys = $this->redis->redis->keys( "ATL_0*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            if( $keysa = $this->redis->redis->keys( "AL_*" ) ){
                $this->redis->redis->delete( $keysa );
            }
            //用户关注活动列表
            if($keysaul = $this->redis->redis->keys( "AUL_{$auinfo['uin']}*" ) ){
                $this->redis->redis->delete( $keysaul );
            }
            return true;
        }     
        else{
            $this->db->query('rollback');       
            return false;
        }
    }

    /*
     * 新增活动跟帖评论
     * 
     * */
    function addATComment($atcinfo){
        if( empty($atcinfo['atid']) || empty($atcinfo['atc_create_uin']) ) return false;
        $atinfo = $this->getATinfo( $atcinfo['atid'] );
        if( empty($atinfo) ) return false;
        $ex = $atinfo[0]['at_ex'];
        $atc_tb = "at_comment_{$ex}";
        $atcinfo['atc_addtime'] = time();
		$atcinfo['afid'] = $atinfo[0]['afid'];

        $this->db->use_db( 'gpbbs' );
        $this->db->query('start transaction');

        $re_c = $this->db->insert( $atc_tb, $atcinfo );
        $u_c['cid'] = $this->db->next_id();
        //atinfo 的 at_comment_count+1
        $re_t = $this->db->query("update atinfo set at_comment_count=at_comment_count+1 where id={$atcinfo['atid']}");

        if( $re_c && $re_t && $this->db->query('commit')){
            $this->updateDingATieTime($atcinfo['atid']);//更新顶贴时间
            //清掉相关活动跟帖评论列表缓存
            $this->redis->use_redis( 'gpbbs' );
            $keys = $this->redis->redis->keys( "ATCL_{$atcinfo['atid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            //删除帖子列表缓存
            if( $keyst = $this->redis->redis->keys( "ATL_{$atcinfo['afid']}*" ) ){
                $this->redis->redis->delete( $keyst );
            }
            //评论成功插入reply通知中心
            if( $atcinfo['atc_target_cid'] ){
                $_cinfo = $this->getATCommentList( $atcinfo['atid'], "AND atc_status=1 AND id='{$atcinfo['atc_target_cid']}'", '', 1 );
                if( $_cinfo && $_cinfo[0]['atc_create_uin'] != $atcinfo['atc_create_uin']){
                    $this->addAReply( $atcinfo['afid'], $atcinfo['atid'], $u_c['cid'], $_cinfo[0]['atc_create_uin'] );//对别人评论的回复
                }
            }
            else{
                if($atcinfo['atc_create_uin'] != $atinfo['at_create_uin']){//评论自己的帖时，不插入reply
                    $this->addAReply( $atcinfo['afid'], $atcinfo['atid'], $u_c['cid'], $atinfo[0]['at_create_uin'] );
                }
            }

            return true;
        }     
        else{
            $this->db->query('rollback');       
            return false;
        }
    }
	
	/*
     * 新增活动跟帖点赞
     * 
     * */
    function addATDianzan($atdinfo){
        if( empty($atdinfo['atid']) || empty($atdinfo['uin']) ) return false;
        $atinfo = $this->getATinfo( $atdinfo['atid'] );
        if( empty($atinfo) ) return false;
        $ex = $atinfo[0]['at_ex'];
        $atd_tb = "at_dianzan_uin_{$ex}";
        $atdinfo['at_dianzan_updatetime'] = time();

        $this->db->use_db( 'gpbbs' );
        $this->db->query('start transaction');

        $atdinfo['status'] = 1;
        //$re_d = $this->db->insert( $atd_tb, $atdinfo );
        $udinfo = $this->db->select($atd_tb, '*', "uin={$atdinfo['uin']} AND atid={$atdinfo['atid']}");
		unset($atdinfo['afid']);
        if($udinfo){
            if($udinfo[0]['status'] == 1){
                return true;
            }else{
                $re_d = $this->db->update($atd_tb, $atdinfo, "id={$udinfo[0]['id']} AND uin={$atdinfo['uin']}" );
            }
        }else{
            $re_d = $this->db->insert($atd_tb, $atdinfo);
        }

        //atinfo 的 at_dianzan_count+1
        $re_t = $this->db->query("update atinfo set at_dianzan_count=at_dianzan_count+1 where id={$atdinfo['atid']}");

        if( $re_d && $re_t && $this->db->query('commit')){
            $this->updateDingATieTime($atdinfo['atid']);//更新顶贴时间
            //清掉活动帖子信息相关缓存
            $this->redis->use_redis( 'gpbbs' );
            $keys = $this->redis->redis->keys( "ATINFO_{$atdinfo['atid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            //删除帖子列表缓存
            if( $keyst = $this->redis->redis->keys( "ATL_{$atdinfo['afid']}*" ) ){
                $this->redis->redis->delete( $keyst );
            }
            $keys = $this->redis->redis->keys( "ATL_0*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            //清掉是否点赞缓存
            $keyd = $this->redis->redis->keys("UATDZ_{$atdinfo['uin']}_{$atdinfo['atid']}");//缓存
            if($keyd){
                $this->redis->redis->delete($keyd);
            }
            //清除个人数据
            $keys = $this->redis->redis->keys( "UC_*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }

            return true;
        }     
        else{
            $this->db->query('rollback');       
            return false;
        }
    }
	
	/*
	 * 更新活动
	 *
	 **/
	function updateAinfo($ainfo){
		if( !strlen($ainfo['fid']) || empty($ainfo['id']) ) return false;
		$this->db->use_db( 'gpbbs' );
        $this->redis->use_redis( 'gpbbs' );
        if( !$_ainfo = $this->db->query("select * from ainfo where id={$ainfo['id']}") ) return false;
        $_ainfo = $_ainfo[0];
        
        //改变有效性
        if( strlen($ainfo['a_status']) && $ainfo['a_status'] != $_ainfo['a_status'] ){
            $this->db->query("start transaction");
            $r_a = $this->db->update( 'ainfo', $ainfo, "id={$ainfo['id']}" );
            $r_f = true; 
            //删除
            if($ainfo['a_status'] == 0){
                if($ainfo['fid']) $r_f = $this->db->query("update finfo set f_a_count=f_a_count-1 where id={$ainfo['fid']}");//更新小组f_a_count
                $r_u = $this->db->query("update a_uin set status=0 where afid={$ainfo['id']}");//删除所有关注
            //恢复
            }else{
                if($ainfo['fid']) $r_f = $this->db->query("update finfo set f_a_count=f_a_count+1 where id={$ainfo['fid']}");//更新小组f_a_count
                $r_u = true;
            }
            if( $r_a && $r_f && $r_u && $this->db->query("commit") ){
                //单个活动缓存
                if($keya = $this->redis->redis->keys("A_{$ainfo['id']}")){
                    $this->redis->redis->delete( $keya );
                }

                //删除缓存
                if( $keys = $this->redis->redis->keys( "AL_*" ) ){
                    $this->redis->redis->delete( $keys );
                }
                //删除小组缓存
                if( $keysf = $this->redis->redis->keys( "FL_*" ) ){
                    $this->redis->redis->delete( $keysf );
                } 
                //删除关注缓存
                if( $keysu = $this->redis->redis->keys("UAIN_*_{$ainfo['id']}") ){
                    $this->redis->redis->delete($keysu);
                }
                //用户关注活动列表
                if($keysaul = $this->redis->redis->keys( "AUL_{$auinfo['uin']}*" ) ){
                    $this->redis->redis->delete( $keysaul );
                }
                return true;
            }else{
                $this->db->query("rollback");
                return false;
            }
        //改变分组
        }else if( $ainfo['fid'] != $_ainfo['fid'] ){
            $this->db->query("start transaction");
            $r_a = $this->db->update( 'ainfo', $ainfo, "id={$ainfo['id']}" );
            $r_f1 = $r_f2 = true;
            if( $_ainfo['fid'] ) $r_f1 = $this->db->query("update finfo set f_a_count=f_a_count-1 where id={$_ainfo['fid']}");//f_a_count-1
            if( $ainfo['fid']) $r_f2 = $this->db->query("update finfo set f_a_count=f_a_count+1 where id={$ainfo['fid']}");//f_a_count+1
            if( $r_a && $r_f1 && $r_f2 && $this->db->query("commit") ){
                //单个活动缓存
                if($keya = $this->redis->redis->keys("A_{$ainfo['id']}")){
                    $this->redis->redis->delete( $keya );
                }
                //删除缓存
                if( $keys = $this->redis->redis->keys( "AL_*" ) ){
                    $this->redis->redis->delete( $keys );
                }
                //删除小组缓存
                if( $keysf1 = $this->redis->redis->keys( "FL_*" ) ){
                    $this->redis->redis->delete( $keysf1 );
                } 
                return true;
            }else{
                $this->db->query("rollback");
                return false;
            }
        }else{
            $result = $this->db->update( 'ainfo', $ainfo, "id={$ainfo['id']}" );
            if( $result ){
                //单个活动缓存
                if($keya = $this->redis->redis->keys("A_{$ainfo['id']}")){
                    $this->redis->redis->delete( $keya );
                }
                if( $keys = $this->redis->redis->keys( "AL_*" )){
                    $this->redis->redis->delete( $keys );
                }
            }
            return $result;
        }
	}
	
	/*
     * 更新活动跟帖
     * 
     * */
    function updateATinfo($atinfo){
        if(empty($atinfo['id']) ) return false;
        $this->db->use_db( 'gpbbs' );
        $this->redis->use_redis( 'gpbbs' );
        if( !$_atinfo = $this->db->query("select * from atinfo where id={$atinfo['id']}") ) return false;
        $_atinfo = $_atinfo[0];
        
        //改变有效性
        if( strlen($atinfo['at_status']) &&  $atinfo['at_status'] != $_atinfo['at_status'] ){
            $this->db->query("start transaction");
            $r_t = $this->db->update( 'atinfo', $atinfo, "id={$atinfo['id']}" );
            $r_f = $this->db->query("select fid from ainfo where id={$atinfo['afid']}");
            //删除
            if($ainfo['at_status'] == 0){
                $r_a = $this->db->query("update ainfo set a_t_count=a_t_count-1 where id={$atinfo['afid']}");//a_t_count-1
            //恢复
            }else{
                $r_a = $this->db->query("update ainfo set a_t_count=a_t_count-1 where id={$atinfo['afid']}");//a_t_count+1
            }
            if( $r_t && $r_f && $r_a && $this->db->query("commit") ){
                //删除缓存
                if( $keys = $this->redis->redis->keys( "ATL_{$atinfo['afid']}*" ) ){
                    $this->redis->redis->delete( $keys );
                }
                if( $keysa = $this->redis->redis->keys( "AL_*" ) ){
                    $this->redis->redis->delete( $keysa );
                }
                return true;
            }else{
                $this->db->query("rollback");
                return false;
            }
        }else{
            $result = $this->db->update( 'atinfo', $atinfo, "id={$atinfo['id']}" );
            if( $result ){
                //删除帖列表缓存
                if( $keys = $this->redis->redis->keys( "ATL_{$atinfo['afid']}*" ) ){
                    $this->redis->redis->delete( $keys );
                }
                $keys = $this->redis->redis->keys( "ATL_0*" );
                if( $keys ){
                    $this->redis->redis->delete( $keys );
                }
            }
            return $result;
        }
    }

	/*
     * 更新活动跟帖评论
     * 
     * */
    function updateATComment($atcinfo){
        if( empty($atcinfo['atid']) || empty($atcinfo['id']) ) return false;
        $atinfo = $this->getATinfo( $atcinfo['atid'] );
        if( empty($atinfo) ) return false;
        $ex = $atinfo[0]['at_ex'];
        $atc_tb = "at_comment_{$ex}";
        $this->db->use_db( 'gpbbs' );
        $this->redis->use_redis( 'gpbbs' );

        $_atcinfo = $this->db->query("select * from {$atc_tb} where id={$atcinfo['id']}");
        $_atcinfo = $_atcinfo[0];

        //改变有效性
        if( strlen($atcinfo['atc_status']) &&  $atcinfo['atc_status'] != $_atcinfo['atc_status'] ){
            $this->db->query("start transaction");
            $r_c = $this->db->update( $atc_tb, $atcinfo, "id={$atcinfo['id']}" );
            //删除
            if($atcinfo['at_status'] == 0){
                $r_t = $this->db->query("update atinfo set at_comment_count=at_comment_count-1 where id={$atcinfo['atid']}");//at_comment_count-1
            //恢复
            }else{
                $r_t = $this->db->query("update atinfo set at_comment_count=at_comment_count+1 where id={$atcinfo['atid']}");//at_comment_count+1
            }
            //var_dump($r_c);
            //var_dump($r_t);
            if( $r_c && $r_t && $this->db->query("commit") ){
                //删除评论列表缓存
                if( $keys = $this->redis->redis->keys( "ATCL_{$atcinfo['atid']}*" ) ){
                    $this->redis->redis->delete( $keys );
                }
                //删除帖子列表缓存
                if( $keyst = $this->redis->redis->keys( "ATL_{$atinfo['afid']}*" ) ){
                    $this->redis->redis->delete( $keyst );
                }
                return true;
            }else{
                $this->db->query("rollback");
                return false;
            }
        }else{
            $result = $this->db->update( $atc_tb, $atcinfo, "id={$atcinfo['id']}" );
            if( $result ){
                $this->updateDingATieTime($atcinfo['atid']);//更新顶贴时间
                //删除评论列表缓存
                if( $keys = $this->redis->redis->keys( "ATCL_{$atcinfo['atid']}*" ) ){
                    $this->redis->redis->delete( $keys );
                }
            }
            return $result;
        }
    }

	
	/*
     * 更新活动跟帖点赞
     * 
     * */
    function updateATDianzan($atdinfo){
      //  if( empty($atdinfo['atid']) || empty($atdinfo['id']) ) return false;
        if( empty($atdinfo['atid']) || empty($atdinfo['uin']) ) return false;
        $atinfo = $this->getATinfo( $atdinfo['atid'] );
        if( empty($atinfo) ) return false;
        $ex = $atinfo[0]['at_ex'];
        $atd_tb = "at_dianzan_uin_{$ex}";
        $atdinfo['at_dianzan_updatetime'] = time();
        $this->db->use_db( 'gpbbs' );
        
        $udinfo = $this->db->select($atd_tb, '*', "uin={$atdinfo['uin']} AND atid={$atdinfo['atid']}");
		unset($atdinfo['afid']);
        if($udinfo){
            if($udinfo[0]['status'] == 0){
                return true;
            }else{
                $result = $this->db->update($atd_tb, $atdinfo, "id={$udinfo[0]['id']} AND uin={$atdinfo['uin']}" );
            }
        }else{
            return false;
        }

       // $result = $this->db->update( $atd_tb, $atdinfo, "id={$atdinfo['id']}" );
        if( $result ){
            //更新atinfo中的点赞数量
            $re_t = $this->db->query("update atinfo set at_dianzan_count=at_dianzan_count-1 where id={$atdinfo['atid']}");
            if($re_t){
                //清掉相关缓存
                $this->redis->use_redis( 'gpbbs' );
               // $keys = $this->redis->redis->keys( "AL_{$ainfo['fid']}*" );
                if( $keys ){
                    $this->redis->redis->delete( $keys );
                }  
            }

            $this->updateDingATieTime($atdinfo['atid']);//更新顶贴时间
            //清掉活动帖子信息相关缓存
            $this->redis->use_redis( 'gpbbs' );
            $keys = $this->redis->redis->keys( "ATINFO_{$atdinfo['atid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            //删除帖子列表缓存
            if( $keyst = $this->redis->redis->keys( "ATL_{$atdinfo['afid']}*" ) ){
                $this->redis->redis->delete( $keyst );
            }
            $keys = $this->redis->redis->keys( "ATL_0*" );
            if($keys){
                $this->redis->redis->delete( $keys );
            }
            //清除个人数据
            $keys = $this->redis->redis->keys( "UC_*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            //清掉是否点赞缓存
            $keyd = $this->redis->redis->keys("UATDZ_{$atdinfo['uin']}_{$atdinfo['atid']}");//缓存
            if($keyd){
                $this->redis->redis->delete($keyd);
            }
        }
        return $result;
	}

	/*
	 * 获取单个活动
     * 删除活动，修改活动，有用户关注活动，用户跟帖，需要更新缓存
     *
	 * */
	function getAinfo($afid, $where){
		if(empty($afid)) return false;
        
        $keys = "A_{$afid}"; 
        $this->redis->use_redis('gpbbs');
        if($this->redis->redis->keys($keys)){
            return unserialize($this->redis->redis->get($keys));
        }
            
		$where = " id={$afid} {$where} ";
		$this->db->use_db('gpbbs');
		$ainfo = $this->db->select('ainfo', '*', "{$where}");
        
        //设置缓存
        if($ainfo){
            $this->redis->redis->set($keys,serialize($ainfo), 86400 * 7);
        }
		return $ainfo;  

	}

    /*
     * 获取活动列表
     * 
     * */
    function getAinfoList( $fid, $where='', $orderby='', $limit=256 ,$begin_timestamp=0, $direction=0 ){
        $where .= $fid ? " AND fid={$fid}" : "";
        if( $direction==0 ){
            $where .= " AND a_addtime>'{$begin_timestamp}'";
        }
        else{
            $where .= " AND a_addtime<'{$begin_timestamp}'";
        }
        $orderby = $orderby ? $orderby : 'id DESC';
        $this->redis->use_redis( 'gpbbs' );
        $key = "AL_".str_replace( array("'", '"', '=', ' '), array('', '', '', ''), "{$fid}_{$where}_{$orderby}{$limit}" );
        if( $cached = json_decode($this->redis->redis->get($key), true) ){
            return $cached;
        }
        
        $this->db->use_db( 'gpbbs' );
        $data = $this->db->select( 'ainfo', '*', "a_status=1 {$where}", $orderby, $limit );

        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, json_encode($data), 84600*7 );

        return $data;
    }

    /*
     * 获取活动跟帖列表
     * 
     * */
	function getATinfoList( $afid=1, $where='', $orderby='', $limit=256, $begin_timestamp=0 ){     
        if($begin_timestamp == 0){
            $where .= " AND at_addtime>'{$begin_timestamp}'"; 
        }else{
            $where .= " AND at_addtime<'{$begin_timestamp}'"; 
        }
        if($afid){//!0获取具体afid的数据，0时获取所有
            $where .= " AND afid='{$afid}'";
        }

		$orderby = $orderby ? $orderby : "at_addtime DESC";
        $this->redis->use_redis( 'gpbbs' );
        $key = "ATL_".str_replace( array("'", '"', '=', ' '), array('', '', '', ''), "{$afid}_{$where}_{$orderby}{$limit}" );

        if( $cached = json_decode($this->redis->redis->get($key), true) ){
            return $cached;
        }

		$this->db->use_db( 'gpbbs' );
        $data = $this->db->select( 'atinfo', '*', "at_status=1 {$where}", $orderby, $limit );

        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, json_encode($data), 84600*7 );

        return $data;
    }
	
	/*
     * 获取单条跟帖
     * 
     * */
	function getATinfo( $id ){
        if( ! $id ) return false;
        $this->redis->use_redis( 'gpbbs' );
        $key = "ATINFO_{$id}";
        if( $cached = json_decode($this->redis->redis->get($key), true) ){
            return $cached;
        }
        $this->db->use_db( 'gpbbs' );
        $data = $this->db->select( 'atinfo', '*', "at_status=1 AND id='{$id}'", 'id DESC', 1 );
        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, json_encode($data), 84600*7 );

        return $data;
    }
	
    /*
     * 获取活动跟帖的评论列表
     * 
     * */
    function getATCommentList( $atid=1, $where='', $orderby='', $limit=256, $begin_timestamp=0 ){
        if($begin_timestamp == 0){
		    $where .= " AND atc_addtime>'{$begin_timestamp}'"; 
        }else{
		    $where .= " AND atc_addtime<'{$begin_timestamp}'"; 
        }

        $orderby = $orderby ? $orderby : 'atc_addtime DESC';
        $this->redis->use_redis( 'gpbbs' );
        $key = "ATCL_{$atid}_{$where}_{$orderby}{$limit}";
        if( $cached = json_decode($this->redis->redis->get($key), true) ){
            return $cached;
        }

        $atinfo = $this->getATinfo( $atid );
        if( empty($atinfo) ) return false;
        $ex = $atinfo[0]['at_ex'];
        $c_tb = "at_comment_{$ex}";
        $this->db->use_db( 'gpbbs' );
		$data = $this->db->select( $c_tb, '*', "atid='{$atid}' AND atc_status=1 {$where}", $orderby, $limit  );
        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, json_encode($data), 86400*7 );
        return $data;
    }

    /*
     * 获取活动跟帖被点赞的用户列表
     * 
     * */
    function getATDianzanUinList( $atid=1, $orderby='', $limit=256 ){
        $orderby = $orderby ? $orderby : 'id DESC';
        $atinfo = $this->getATinfo( $atid );
        if( empty($atinfo) ) return false;
        $ex = $atinfo[0]['at_ex'];
        $c_tb = "at_dianzan_uin_{$ex}";
        $this->db->use_db( 'gpbbs' );
        return $this->db->select( $c_tb, 'uin', "atid='{$atid}' AND status=1", $orderby, $limit );
	}

	/*
	 * 获取参与活动的图片
	 * */
	function getATPhoto($where='1=1', $orderby='at_addtime DESC', $limit=256){
		$this->db->use_db('gpbbs');
		return $this->db->select('atinfo', '*', $where, $orderby, $limit);
	}
	
	/*
     * 添加、更新用户关注
     * 
     * */
    function updateAUininfo( $auinfo ){
        if( (! strlen($auinfo['afid']) ) || empty($auinfo['uin']) ) return false;
		$this->db->use_db( 'gpbbs' );
		$res = $this->db->select( 'a_uin', '*', "afid={$auinfo['afid']} AND uin={$auinfo['uin']}" );
		$this->db->query('start transaction');
        $set = "a_uin_count=a_uin_count";
        if( empty($res) ){
            $re_u = $this->db->insert( 'a_uin', $auinfo );
            $set = "a_uin_count=a_uin_count+1";
		}else{
            if( $auinfo['status'] == $res[0]['status'] ) return true;//状态相等无需更新
			$re_u = $this->db->update( 'a_uin', $auinfo, "afid={$auinfo['afid']} AND uin={$auinfo['uin']}" );
            if($auinfo['status'] == 1) $set = "a_uin_count=a_uin_count+1";
            if($auinfo['status'] == 0) $set = "a_uin_count=a_uin_count-1";
		}
        $sql = "update ainfo set {$set} where id={$auinfo['afid']}";
        $re_a = $this->db->query($sql);
        if( $re_u && $re_a && $this->db->query('commit')){
            $ainfo = $this->getAinfoList('', "AND id={$auinfo['afid']}", '', 1);
            $this->redis->use_redis( 'gpbbs' );
            //单个活动缓存
            if($keya = $this->redis->redis->keys("A_{$ainfo['id']}")){
                $this->redis->redis->delete( $keya );
            }
            //活动列表
            if($keysal = $this->redis->redis->keys( "AL_*" ) ){
                $this->redis->redis->delete( $keysal );
            }
            //清除关注缓存
            $key = "UAIN_{$auinfo['uin']}_{$auinfo['afid']}";
            if( $keys = $this->redis->redis->keys($key) ){
                $this->redis->redis->delete($keys);
            }
            //用户关注活动列表
            if($keysaul = $this->redis->redis->keys( "AUL_{$auinfo['uin']}*" ) ){
                $this->redis->redis->delete( $keysaul );
            }

            return true;
        }     
        else{
            $this->db->query('rollback');       
            return false;
        }
    }

	/*
     * 获得活动图片保存的目录
     * 
     * */
    function getADir(){
        $dir = SYSDIR_ROOT ."/bpic/a/".date('ymd')."/";
        if( ! file_exists( $dir ) ){
            @mkdir( $dir, 0777 );
        }
        return $dir;
    }

	/*
     * 新增FileObject记录
     * 仅作记录 
     * */
    function addFb( $fbinfo ){
        $this->db->use_db( 'gpbbs' );
        if( empty($fbinfo['url']) ) return false;
        $fb_tb = "fb_{$this->default_fb_ex}";
		return $this->db->insert( $fb_tb, $fbinfo );
    }

    /*
     * 更新顶贴时间
     *
     * */
    function updateDingATieTime($tid){
        if( empty($tid) ) return false;
        $lasteTime = time();
        $this->db->use_db('gpbbs');
        $info = array('at_ding_lasttime'=> $lasteTime);
        return $this->db->update( "atinfo", $info, "id='{$tid}'" );
    }

    /*
     * 活动 插入reply记录
     *
     * */
    function addAReply($fid, $tid, $cid, $uin){
        if( empty($tid) || empty($uin) ) return false;
        $this->db->use_db( 'gpreply' );
        $date = date('ymd');
        $data = array(
                'post_type' => 1,
                'uin' => $uin,
                'fid' => $fid,
                'tid' => $tid,
                'cid' => $cid,
                'addtime' => time(),
            );
        $result = $this->db->insert( "reply_{$date}", $data );
        if( $result ){
            //unread_reply_count + 1
            $this->redis->use_redis( 'gpsixin' );
            $this->redis->redis->hIncrBy( 'unread_reply_count', $uin, 1 );//未读回复数+1
            //Push到推送队列
            $this->redis->redis->lPush( 'push_list_tmp', json_encode($data) );//
        }
        return $result;
    }

    /*
     * 举报帖子，举报原因沿用删除原因
     * 2014-10-8创建
     *
     * */
    function addBadReportATinfo($badATinfo){
        if( empty($badATinfo['uid']) || empty($badATinfo['afid']) || empty($badATinfo['atid']) || empty($badATinfo['reason']) ) return false;
        $this->db->use_db('gpbbs');

        $c_tinfo = $this->db->insert('at_badreport_log', array(
                'uid' => $badATinfo['uid'],
                'aid' => $badATinfo['afid'],
                'atid' => $badATinfo['atid'],
                'reason' => $badATinfo['reason'],
                'addtime' => time(),
            ));

        return $c_tinfo;
    }


}
?>
