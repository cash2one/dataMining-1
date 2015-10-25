<?php
/*
 * 用户BBS类 增改查
 * author: huasong
 * 小组f(版块) -> 帖子t -> 评论c 三层结构 后2个存储在哪个表里是依赖于前一个的ex字段。
 * 小组f(版块)有关注的用户uin列表f_uin 存储在哪个表里是依赖于f的ex字段。
 * 帖子t有点赞的用户uin列表t_dianzan_uin 存储在哪个表里是依赖于t的ex字段。
 *
 * 活动逻辑结构和上述的类似 ainfo -> atinfo -> (at_comment & at_dianzan_uin)
 * 
 * 缓存的都以函数的参数字符串连接作为KEY 在前冠予大写关键词 如FT FL TINFO C等 默认存七天
 * 因为用的很多是 where 这样的语句传递参数 数据库有更新时 得清空一下相关的key
 * 清掉相关缓存的时候会遍历所有相关KEY TODO 后续可以把这个做在后端此处可只做PUSH
 * TODO 在取消点赞/取消关注的时候不更新缓存,只在加入小组的时候更新,那么显示的数字就会大一些
 * */

//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";
require_once SYSDIR_UTILS. "/DB.php";
require_once SYSDIR_UTILS. "/REDIS.php";

class UserBbs
{
    /* */
    public $db;
    public $redis;
    public $default_f_ex = 'ab';//默认 帖子ex 小组关注ex
    public $default_t_ex = 'ab';//默认 帖子评论ex 帖子点赞ex
    public $default_at_ex = 'ab';//默认 活动跟帖被点赞ex
    public $default_fb_ex = 'ab';//默认 FileObject记录存储ex
    public $pic_dpre = '';// 果盘累论坛系统图像域名
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
     * 获取小组分类列表
     * type_status 分类状态
     * */
    function getFtype_infoList( $where="type_status='1'" ){
        $this->redis->use_redis( 'gpbbs' );
        $key = "FT_".str_replace( array("'", '"', '='), array('', '', ''), $where );//缓存
        if( $cached = $this->redis->redis->get($key) ){
            return json_decode( $cached, true );
        }

        $this->db->use_db( 'gpbbs' );
        $data = $this->db->select( 'ftype_info', '*', $where, 'id DESC', 256 );

        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, json_encode($data), 86400*7 );

        return $data;
    }

    /*
     * 获取小组列表
     * 
     * 新增小组 更改小组 新增帖子的时候要更新缓存
     *
     * */
    function getFinfoList( $where="f_status=1", $orderby='id DESC', $limit=256 ){
        $this->redis->use_redis( 'gpbbs' );
        preg_match( "/id='(\d+)'/", $where, $match );//鸡肋 暂且如此 //很多地方调用此函数在where传递id='(\d+)'这样的参数
        $key = "FL_".str_replace( array("'", '"', '=', ' '), array('', '', '', ''), ($match[1] ? "{$match[1]}_":"")."{$where}_{$orderby}{$limit}" );//缓存//FL_{$fid}_XXX
        if( $cached = $this->redis->redis->get($key) ){
            return json_decode( $cached, true );
        }

        $this->db->use_db( 'gpbbs' );
        $data = $this->db->select( 'finfo', '*', $where, $orderby, $limit );

        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, json_encode($data), 86400*7 );

        return $data;
    }

    /*
     * 获取帖子列表
     * 
     * 新增帖子 更改帖子 新增评论的时候要更新缓存
     * */
    function getTinfoList( $fid=1, $and_where="1=1", $orderby='id DESC', $limit=256 ){
        $this->redis->use_redis( 'gpbbs' );
        $key = "TL_".str_replace( array("'", '"', '=', ' '), array('', '', '', ''), "{$fid}_{$and_where}_{$orderby}{$limit}" );//缓存TL_{$fid}_XXX
        if( $cached = $this->redis->redis->get($key) ){
            return unserialize( $cached );
        }

        $finfo = $this->getFinfoList( "id='{$fid}' AND f_status=1", 'id', 1 );
        if( empty($finfo) ) return false;
        $this->db->use_db( 'gpbbs' );
        $ex = $finfo[0]['f_ex'];
        $t_tb = "tinfo_{$ex}";
        $data = $this->db->select( $t_tb, '*', "fid='{$fid}' AND t_status=1 AND {$and_where}", $orderby, $limit );

        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, serialize($data), 600 );
        
        return $data;
    }

    /*
     * 获取帖子内容
     * 
     *
     * */
    function getTinfo( $fid=1, $tid=1, $orderby='id DESC', $limit=1 ,$and_where='AND t_status=1'){
        $this->redis->use_redis( 'gpbbs' );
        $key = "TINFO_".str_replace( array("'", '"', '=', ' '), array('', '', '', ''), "{$fid}_{$tid}_{$and_where}_{$orderby}{$limit}" );//加入and_where防止 t_status=0和1的缓存混乱
        if( $cached = $this->redis->redis->get($key) ){
            return unserialize( $cached );
        }

        $finfo = $this->getFinfoList( "id='{$fid}' AND f_status=1", 'id', 1 );
        if( empty($finfo) ) return false;
        $ex = $finfo[0]['f_ex'];
        $t_tb = "tinfo_{$ex}";
        $this->db->use_db( 'gpbbs' );
        $tinfo = $this->db->select( $t_tb, '*', "id='{$tid}' AND fid='{$fid}' {$and_where}", $orderby, $limit );
        if( ! $tinfo[0] ) $tinfo[0] = array();
        else $tinfo[0]['finfo'] = $finfo[0];
        $this->redis->redis->set( $key, serialize($tinfo[0]), 86400*7 );

        return $tinfo[0];//直接返回内容数组
    }

    /*
     * 获取帖子的评论列表
     * direction决定orderby
     * */
    function getCommentList( $fid=1, $tid=1, $limit=256, $begin_cid=0, $and_where='' ,$direction = 0){
        $tinfo = $this->getTinfo( $fid, $tid, 'id', 1, '');//帖子被删除，但可以返回评论,所以不加 t_status=1
        if( empty($tinfo) ) return false;
        $ex = $tinfo['t_ex'];
        $c_tb = "comment_{$ex}";
        $this->db->use_db( 'gpbbs' );
        //总是取最近
        if( $direction==0 ){
            $orderby = "c_addtime ASC";
            $and = "AND id>'{$begin_cid}'";//从begin_cid往新的取 升序
        }
        else{
            $orderby = "c_addtime DESC";
            $and = $begin_cid>0 ? "AND id<'{$begin_cid}'" : "";//从begin_cid往旧的取 降序 //特例0
        }

        return $this->db->select( $c_tb, '*', "tid='{$tid}' AND fid='{$fid}' {$and} {$and_where}", $orderby, $limit );
    }

    /*
     * 获取小组被关注的用户列表
     * 
     * */
    function getFUinList( $fid=1, $orderby='id DESC', $limit=256 ){
        $finfo = $this->getFinfoList( "id='{$fid}' AND f_status=1", 'id', 1 );
        if( empty($finfo) ) return false;
        $ex = $finfo[0]['f_ex'];
        $f_uin_tb = "f_uin_{$ex}";
        $this->db->use_db( 'gpbbs' );
        return $this->db->select( $f_uin_tb, 'uin', "fid='{$fid}' AND status=1", $orderby, $limit );
    }

    /*
     * 获取帖子被点赞的用户列表
     * 
     * */
    function getTDianzanUinList( $fid=1, $tid=1, $orderby='id DESC', $limit=256 ){
        $tinfo = $this->getTinfo( $fid, $tid, 'id', 1 );
        if( empty($tinfo) ) return false;
        $ex = $tinfo['t_ex'];
        $t_dianzan_tb = "t_dianzan_uin_{$ex}";
        $this->db->use_db( 'gpbbs' );
        return $this->db->select( $t_dianzan_tb, 'uin', "tid='{$tid}' AND fid='{$fid}' AND status=1", $orderby, $limit );
    }

    /*
     * 新增小组
     *
     * */
    function addFinfo( $finfo ){
        $this->db->use_db( 'gpbbs' );
        if( empty($finfo['ftypeid']) || empty($finfo['f_create_uin']) ) return false;
        $finfo['f_ex'] = $this->default_f_ex;
        $finfo['f_addtime'] = time();
        $result = $this->db->insert( 'finfo', $finfo );

        if( $result ){
            //更新小组List缓存
            //貌似此处不需要缓存
            $this->redis->use_redis( 'gpbbs' );
            $keys = $this->redis->redis->keys( "FL_*" );//这个是否有点过于广了?
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $key_fsl = $this->redis->redis->keys( "FSL_*" );//更新小组信息分类排行缓存
            if( $key_fsl ){
                $this->redis->redis->delete( $key_fsl );
            }
        }

        return $result;
    }

    /*
     * 新增帖子
     * 发帖
     * 1. tinfo_XX
     * 2. u_t_XX 
     * 3. uex_bbs_statistic_XX 已完成
     * 4. 更新finfo里的帖子数量
     * 5.$copyArray=array()不是转载发帖 
     *
     * */
    function addTinfo($tinfo, $uex='aa', $copyArray=array()){
        if( empty($tinfo['fid']) || empty($tinfo['t_create_uin']) || empty($uex)) return 1999;
        $finfo = $this->getFinfoList( "id='{$tinfo['fid']}' AND f_status=1", 'id', 1 );
        if( empty($finfo) ) return 1001;

        $this->db->use_db( 'gpbbs' );
        //start Transaction
        $this->db->query('start transaction');

        $ex = $finfo[0]['f_ex']; 
        $t_tb = "tinfo_{$ex}";
        $tinfo['t_ex'] = $this->default_t_ex;
        $tieTime = time(); 
        $tinfo['t_addtime'] = $tieTime;
        $tinfo['t_ding_lasttime'] = $tieTime;
        $re_t = $this->db->insert( $t_tb, $tinfo );
        $next_id = $this->db->next_id();

        //用户都发表的贴子
        $u_tb = "u_t_{$uex}";
        $u_t['uin'] = $tinfo['t_create_uin'];
        $u_t['fid'] = $tinfo['fid'];
        $u_t['tid'] =$this->db->next_id();
        $u_t['addtime'] =$tinfo['t_addtime'];
        if(isset($tinfo['video_fb'])){
            $u_t['video'] = 1;
        }

        $re_u = $this->db->insert($u_tb,$u_t);

        //finfo 的 f_t_count+1
        $f_new['f_t_count'] = $finfo[0]['f_t_count']+1;
        $re_f = $this->db->update('finfo', $f_new, "id='{$tinfo['fid']}'");

        //更新用户发帖数量
        $statistic_uex = "uex_bbs_statistic_{$uex}";
        $sql = "insert into {$statistic_uex}(uid, post_count) values({$tinfo['t_create_uin']}, 1) on duplicate key update post_count=post_count+1";
        $u_t_c = $this->db->query($sql);

        //后台操作帖子转载
        $re_copy = true;
        if($copyArray){
            $copyArray['new_tid'] = $next_id;
            $re_copy = $this->db->insert( "t_copy_to_f_log", $copyArray );
        }

        if( $re_t && $re_u && $re_f && $u_t_c && $re_copy && $this->db->query('commit')){

            //测试用
           
            if($tinfo['t_create_uin'] == 86){
                if(isset($tinfo['video_fb'])){
                    $this->setTinfoToVideoRecomend($tinfo['fid'] , $next_id);
                }else{
                   // $this->setTinfoToRecomend($tinfo['fid'] , $next_id);
                }
            }
            
            $this->redis->use_redis( 'gpbbs' );

            //清掉相关缓存
            $keys = $this->redis->redis->keys( "FL_{$tinfo['fid']}*" );//相关小组列表
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $keys = $this->redis->redis->keys( "TL_{$tinfo['fid']}*" );//相关帖子列表
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $key_fsl = $this->redis->redis->keys( "FSL_*" );//清除小组分类缓存
            if( $key_fsl ){
                $this->redis->redis->delete( $key_fsl );
            }
            $key_uc = $this->redis->redis->keys( "UC_*" );//清除小组分类缓存
            if( $key_uc ){
                $this->redis->redis->delete( $key_uc );
            }

            //帖子加载到信息流缓冲区
            $newtinfo = $this->getTinfo( $tinfo['fid'], $u_t['tid'], 'id', 1, 'AND t_status=1');
            if(!empty($newtinfo)){
                $this->redis->redis->zadd("TS_{$newtinfo['fid']}", $newtinfo['t_ding_lasttime'], serialize($newtinfo));
            }
            return true;
        }     
        else{
            $this->db->query('rollback');      	
            return 1001;
        }
    }

    /*
     * 新增评论
     * 更新帖子List缓存
     * 1.用户发的评论 u_c_xx
     * 2.用户评论过的帖 u_c_t_xx
     * 3.更新用户评论数量 uex_bbs_statistic_xx
     * 4.更新帖被评论数量 tinfo_xx
     * 5.更新帖最后顶贴时间 tinfo_xx
     * 6.评论成功后插入reply消息中心
     *
     *
     * TODO 事务其他属性要更新,参看删除部分
     */
    function addComment($cinfo, $uex='aa'){
        if( empty($cinfo['fid']) || empty($cinfo['tid']) || empty($cinfo['c_create_uin']) || empty($uex)) return 1999;

        $tinfo = $this->getTinfo( $cinfo['fid'], $cinfo['tid'], 'id', 1 );
        $finfo = $this->getFinfoList( "id='{$cinfo['fid']}' AND f_status=1", 'id', 1 );//更新帖被评论数量时用到
        if( empty($tinfo) || empty($finfo) ) return 1003;

        $this->db->use_db( 'gpbbs' );
        //start Transaction
        $this->db->query('start transaction');

        $ex = $tinfo['t_ex']; 
        $c_tb = "comment_{$ex}";
        $cinfo['c_addtime'] = time();
        $re_c = $this->db->insert( $c_tb, $cinfo );

        //该用户都发了哪些评论
        $u_tb = "u_c_{$uex}";
        $u_c['uin'] = $cinfo['c_create_uin'];
        $u_c['fid'] = $cinfo['fid'];
        $u_c['tid'] = $cinfo['tid'];
        $u_c['cid'] = $this->db->next_id();
        $u_c['addtime'] = $cinfo['c_addtime'];
        $u_c['t_addtime'] = $tinfo['t_addtime'];//同步发帖时间
        $re_u = $this->db->insert( $u_tb, $u_c );

        //该用户都评论了哪些帖
        $u_c_t_ex = "u_c_t_{$uex}";
        $u_c_t['uid'] = $cinfo['c_create_uin'];
        $u_c_t['fid'] = $cinfo['fid'];
        $u_c_t['tid'] = $cinfo['tid'];
        $u_c_t['addtime'] = $cinfo['c_addtime'];
        $u_c_t['t_addtime'] = $tinfo['t_addtime'];
        $c_tinfo = $this->db->select($u_c_t_ex, '*', " uid='{$u_c_t['uid']}' AND fid='{$u_c_t['fid']}' AND tid='{$u_c_t['tid']}'");
        $re_c_t = true;
        $set = "";
        if( !$c_tinfo ){//未评论过
            $re_c_t = $this->db->insert($u_c_t_ex, $u_c_t);
            $set = "commented_t_count=commented_t_count+1, ";
        }else if( $c_tinfo && $c_tinfo[0]['c_t_status']==0 ){//评论过，但已删除
            $re_c_t = $this->db->update($u_c_t_ex, array('c_t_status'=>1), " uid='{$u_c_t['uid']}' AND tid='{$u_c_t['tid']}'");
            $set = "commented_t_count=commented_t_count+1, ";
        }else if( $c_tinfo && $c_tinfo[0]['c_t_status']==1){//已评论
            $set = ' ';
        }else{
            $re_c_t = false;
        }

        //更新用户评论数量,uex_bbs_statistic_xx
        $statistic_uex = "uex_bbs_statistic_{$uex}";
        $set .= ' comment_count=comment_count+1 ';//发评论增加
        $sql = "insert into {$statistic_uex}(uid, comment_count, commented_t_count) values({$cinfo['c_create_uin']}, 1, 1) on duplicate key update {$set}";
        
        $u_c_c = $this->db->query($sql);

        //更新帖被评论数量tinfo_xx 的 t_comment_count+1
        //更新顶贴时间 t_ding_lasttime
        $t_tb = "tinfo_{$finfo[0]['f_ex']}";
        $re_t = $this->db->query("update {$t_tb} set t_comment_count = t_comment_count +1 , t_ding_lasttime='{$cinfo['c_addtime']}'  where id ={$cinfo['tid']}");

        if( $re_c && $re_u && $re_t && $u_c_c && $re_c_t && $this->db->query('commit')){
            //$this->updateDingTieTime($cinfo['tid'], $cinfo['fid']);//评论成功，更新顶贴时间

            if( $cinfo['c_target_cid'] ){//评论成功插入reply通知中心
                $_cinfo = $this->getCommentList( $cinfo['fid'], $cinfo['tid'], 1, 0, "AND c_status=1 AND id='{$cinfo['c_target_cid']}'" );
                if( $_cinfo && $_cinfo[0]['c_create_uin'] != $cinfo['c_create_uin']){//回复自己时，不插入reply
                    $this->addReply( $cinfo['fid'], $cinfo['tid'], $u_c['cid'], $_cinfo[0]['c_create_uin'] );//对别人评论的回复
                }
            }
            else{
                if($cinfo['c_create_uin'] != $tinfo['t_create_uin']){//评论自己的帖时，不插入reply
                    $this->addReply( $cinfo['fid'], $cinfo['tid'], $u_c['cid'], $tinfo['t_create_uin'] );
                }
            }

            $this->redis->use_redis( 'gpbbs' );
            //清掉帖子相关缓存
            $keys = $this->redis->redis->keys( "TINFO_{$cinfo['fid']}_{$cinfo['tid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }

            //清空帖子列表相关缓存
            $keys = $this->redis->redis->keys( "TL_{$cinfo['fid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }

            $key_trl = $this->redis->redis->keys( "TRL_*" );//推荐信息流缓存
            if( $key_trl ){
                $this->redis->redis->delete( $key_trl );
            }

            $key_vrl = $this->redis->redis->keys( "VRL_*" );
            if( $key_vrl ){
                $this->redis->redis->delete( $key_vrl );
            }

            $key_uc = $this->redis->redis->keys( "UC_*" );//个人数据
            if( $key_uc ){
                $this->redis->redis->delete( $key_uc );
            }

            if($tinfo['t_top'] == 1){
                $keys = $this->redis->redis->keys( "TTL_{$tinfo['fid']}*" );//清理帖子置顶缓存，其中记录了被置顶的帖子信息
                if( $keys ){
                    $this->redis->redis->delete( $keys );
                }
            }

            //重新加载到信息流缓存
            $this->clearAndLoadStreamRedis($tinfo);

            return true;
        }
        else{
            $this->db->query('rollback');
            return 1001;
        }
    }

    /*
     * 帖子新增点赞
     * 
     * */
    function addTDianzan($dianzan){
        if( empty($dianzan['fid']) || empty($dianzan['tid']) ) return 1999;
        $tinfo = $this->getTinfo( $dianzan['fid'], $dianzan['tid'], 'id', 1 );
        $finfo = $this->getFinfoList( "id='{$dianzan['fid']}' AND f_status=1", 'id', 1 );//更新帖被评论数量时用到
        if( empty($tinfo) || empty($finfo)) return 1003;

        $this->db->use_db( 'gpbbs' );
        //start Transaction
        $this->db->query('start transaction');

        $ex = $tinfo['t_ex'];
        $t_dianzan_uin_tb = "t_dianzan_uin_{$ex}";
        $dianzan['t_dianzan_updatetime'] = time();
        $dianzan['status'] = 1;

        $t_d_info = $this->db->select($t_dianzan_uin_tb,'id,status',"tid = {$dianzan['tid']} and fid = {$dianzan['fid']} and uin = {$dianzan['uin']}");


        if($t_d_info){

            if($t_d_info[0]['status']==1){ //已经点赞
                return true;
            }
            else{
                $re_t_d = $this->db->update( $t_dianzan_uin_tb, $dianzan ,"id = {$t_d_info[0]['id']}" );
            }
        }
        else{
            $re_t_d = $this->db->insert( $t_dianzan_uin_tb, $dianzan );
        }

        //tinfo_xx 的 t_dianzan_count+1
        $t_tb = "tinfo_{$finfo[0]['f_ex']}";
        $re_t = $this->db->query("update {$t_tb} set t_dianzan_count = t_dianzan_count + 1 where id ={$dianzan['tid']}");

        if( $re_t_d && $re_t && $this->db->query('commit')){
            //点赞和取消点赞不更新顶贴时间
            //$this->updateDingTieTime($dianzan['tid'],$dianzan['fid']);//更新顶贴时间

            //清掉帖子相关缓存
            $this->redis->use_redis( 'gpbbs' );
            $keys = $this->redis->redis->keys( "TINFO_{$dianzan['fid']}_{$dianzan['tid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }

            $this->redis->redis->HSET( "UDZ_{$dianzan['fid']}", "{$dianzan['tid']}_{$dianzan['uin']}", 1 );//设置点赞

            //$key = "UTDZ_{$dianzan['uin']}_{$dianzan['fid']}_{$dianzan['tid']}";//已点赞
            //$this->redis->redis->set( $key, json_encode(1), 86400*7 );




            //清空帖子列表相关缓存
            $keys = $this->redis->redis->keys( "TL_{$tinfo['fid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $key_trl = $this->redis->redis->keys( "TRL_*" );//推荐信息流缓存
            if( $key_trl ){
                $this->redis->redis->delete( $key_trl );
            }
            if($key_vrl = $this->redis->redis->keys('VRL_*')){
                $this->redis->redis->delete($key_vrl);
            }
            if($tinfo['t_top'] == 1){
                $keys = $this->redis->redis->keys( "TTL_{$tinfo['fid']}*" );//清理帖子置顶缓存，其中记录了被置顶的帖子信息
                if( $keys ){
                    $this->redis->redis->delete( $keys );
                }
            }
            //重新加载到信息流的缓冲区
            $this->clearAndLoadStreamRedis($tinfo);

            return true;
        }
        else{
            $this->db->query('rollback');
            return 1001;
        }

    }

    /* 帖子置顶
     * 1.发橄榄邮通知用户帖子被置顶了
     * 2.将被置顶的帖子记录到t_manager_del_log表中
     * 3.在tinfo_xx表中记录t_top=1
     *
     * */
    function addTTop($top, $user_obj){
        if(empty($top) || empty($top['tid']) || empty($top['fid']) || empty($top['uin'])) return 1999;
        $tinfo = $this->getTinfo($top['fid'], $top['tid'], 'id', 1, ' AND t_status=1 ');
        $finfo = $this->getFinfoList(" id='{$top['fid']}' AND f_status=1 ", 'id', 1);
        if(empty($tinfo) || empty($finfo)) return 1003;
        $f_man_json = $finfo[0]['f_manager'];
        if($f_man_json){
            if($f_manager = json_decode($f_man_json, true)){
                if(!in_array($top['uin'], $f_manager)){
                    return 1999;
                }
            }else{
                return 1999;
            }
        }else{
            return 1999;
        }

        $this->db->use_db('gpbbs');
        $this->db->query('start transaction');

        //私信通知用户<亲爱的果酱，你的贴子<贴子名称>被管理员置顶了。>
        require_once SYSDIR_UTILS. "/UserMessage.php";
        $uinfo2 = $user_obj->getUser('', $tinfo['t_create_uin']);//获取用户uex
        $uinfo1 = $user_obj->getUser('', 827257);//获取用户uex
        $obj_msg = new UserMessage();
        $msg = "亲爱的果酱，你的贴子<{$tinfo['t_title']}>被管理员置顶了。";
        $re_msg = $obj_msg->sendMsgUser2User( 827257, $uinfo1['uex'], $tinfo['t_create_uin'], $uinfo2['uex'], $msg );

        //将置顶的帖子添加到t_manager_del_log表中
        $t = time();
        //a.查看帖子是否被置顶了
        $re_maninfo = $this->getManagerDelTinfoList($top['fid'] , "(type=3 or type=2) AND tid='{$tinfo['id']}'" , 'id DESC', 1);

        //b.更新
        if(empty($re_maninfo)){
            $t_m = $this->db->insert( 't_manager_del_log', array(
                'fid' => $tinfo['fid'],
                'tid' => $tinfo['id'],
                //       'reason' => $tinfo['reason'],
                't_addtime' => $tinfo['t_addtime'],        
                'addtime' => $t,
                'type' => 3,//3是置顶
                'uid' => $tinfo['t_create_uin'],        
            ));
        }else{
            $t_m = $this->db->update('t_manager_del_log', array('type' => 3, 'uid'=> $tinfo['t_create_uin'], 'addtime'=>$t, 'reason'=>$tinfo['reason']), " id={$re_maninfo[0]['id']} AND tid={$re_maninfo[0]['tid']} AND fid={$re_maninfo[0]['fid']}");
        }

        $ex = $finfo[0]['f_ex'];
        $re_top = $this->db->update("tinfo_{$ex}", array('t_top' => 1), " id={$top['tid']} AND fid={$top['fid']} AND t_status=1");
        if($re_msg && $re_top && $t_m && $this->db->query('commit')){
            $this->redis->use_redis('gpbbs');

            //清理帖子缓存
            if($key_t = $this->redis->redis->keys("TINFO_{$top['fid']}_{$top['tid']}*")){
                $this->redis->redis->delete($key_t);
            }
            //清理帖子列表缓存
            if($key_tl = $this->redis->redis->keys("TL_{$top['fid']}*")){
                $this->redis->redis->delete($key_tl);
            }
            //清理推荐信息流缓存
            if($key_trl = $this->redis->redis->keys('TRL_*')){
                $this->redis->redis->delete($key_trl);
            }
            if($key_vrl = $this->redis->redis->keys('VRL_*')){
                $this->redis->redis->delete($key_vrl);
            }
            $keys = $this->redis->redis->keys( "TTL_{$tinfo['fid']}*" );//清理置顶缓存
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $keys = $this->redis->redis->keys( "MDTL_{$tinfo['fid']}*" );//清理t_manager_del_log缓存
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            //重新加载到信息流的缓冲区
            $this->clearAndLoadStreamRedis($tinfo);
            return true;
        }else{
            $this->db->query('rollback');
            return 1001;
        }

    }

    /* 帖子加精
     *
     * */
    function addTBest($best, $user_obj){
        if(empty($best) || empty($best['tid']) || empty($best['fid']) || empty($best['uin'])) return 1999;
        $tinfo = $this->getTinfo($best['fid'], $best['tid'], 'id', 1, ' AND t_status=1');
        $finfo = $this->getFinfoList("id='{$best['fid']}' AND f_status=1", 'id', 1);
        if(empty($tinfo) || empty($finfo)) return 1003;
        $f_man_json = $finfo[0]['f_manager'];
        if($f_man_json){
            if($f_manager = json_decode($f_man_json, true)){
                if(!in_array($best['uin'], $f_manager)){
                    return 1999;
                }
            }else{
                return 1999;
            }
        }else{
            return 1999;
        }


        $this->db->use_db('gpbbs');
        $this->db->query('start transaction');

        $ex = $finfo[0]['f_ex'];
        $re_best = $this->db->update("tinfo_{$ex}", array('t_best' => 1), " id={$best['tid']} AND fid={$best['fid']} AND t_status=1");

        //私信通知用户<亲爱的果酱，你的贴子<贴子名称>被管理员加精华了。>
        require_once SYSDIR_UTILS. "/UserMessage.php";
        $uinfo2 = $user_obj->getUser('', $tinfo['t_create_uin']);//获取用户uex
        $uinfo1 = $user_obj->getUser('', 827257);//获取用户uex
        $obj_msg = new UserMessage();
        $msg = "亲爱的果酱，你的贴子<{$tinfo['t_title']}>被管理员加精华了。";
        $re_msg = $obj_msg->sendMsgUser2User( 827257, $uinfo1['uex'], $tinfo['t_create_uin'], $uinfo2['uex'], $msg );

        if($re_msg && $re_best && $this->db->query('commit')){
            $this->redis->use_redis('gpbbs');

            //清理帖子缓存
            if($key_t = $this->redis->redis->keys("TINFO_{$best['fid']}_{$best['tid']}*")){
                $this->redis->redis->delete($key_t);
            }
            //清理帖子列表缓存
            if($key_tl = $this->redis->redis->keys("TL_{$best['fid']}*")){
                $this->redis->redis->delete($key_tl);
            }
            //清理推荐信息流缓存
            if($key_trl = $this->redis->redis->keys('TRL_*')){
                $this->redis->redis->delete($key_trl);
            }
            if($key_vrl = $this->redis->redis->keys('VRL_*')){
                $this->redis->redis->delete($key_vrl);
            }
            $keys = $this->redis->redis->keys( "TTL_{$tinfo['fid']}*" );//清理帖子置顶缓存，其中记录了被置顶的帖子信息
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            //重新加载到信息流的缓冲区
            $this->clearAndLoadStreamRedis($tinfo);

            return true;

        }else{
            $this->db->query('rollback');
            return 1001;
        }

    }


    /*
     * 帖子取消点赞
     * 
     * */
    function delTDianzan($dianzan){
        if( empty($dianzan['fid']) || empty($dianzan['tid']) ) return 1999;
        $tinfo = $this->getTinfo( $dianzan['fid'], $dianzan['tid'], 'id', 1 );
        $finfo = $this->getFinfoList( "id='{$dianzan['fid']}' AND f_status=1", 'id', 1 );//更新帖被评论数量时用到
        if( empty($tinfo) || empty($finfo)) return 1003;

        $this->db->use_db( 'gpbbs' );
        //start Transaction
        $this->db->query('start transaction');

        $ex = $tinfo['t_ex'];
        $t_dianzan_uin_tb = "t_dianzan_uin_{$ex}";
        $dianzan['t_dianzan_updatetime'] = time();
        $dianzan['status'] = 0;
        $this->db->use_db( 'gpbbs' );

        $t_d_info = $this->db->select($t_dianzan_uin_tb,'id,status',"tid = {$dianzan['tid']} and fid = {$dianzan['fid']} and uin = {$dianzan['uin']}");
        if($t_d_info){
            if($t_d_info[0]['status']==0){ //已经取消点赞
                return true;
            }
            else{
                $re_t_d = $this->db->update( $t_dianzan_uin_tb, $dianzan, "fid='{$dianzan['fid']}' AND tid='{$dianzan['tid']}' AND uin='{$dianzan['uin']}'" );
            }
        }

        $t_tb = "tinfo_{$finfo[0]['f_ex']}";
        $re_t = $this->db->query("update {$t_tb} set t_dianzan_count = if( t_dianzan_count, t_dianzan_count-1, 0 ) where id ={$dianzan['tid']}");

        if( $re_t_d && $re_t && $this->db->query('commit')){


            //清掉帖子相关缓存 //此处可以不更新缓存*只在新增的时候更新
            $this->redis->use_redis( 'gpbbs' );
            $keys = $this->redis->redis->keys( "TINFO_{$dianzan['fid']}_{$dianzan['tid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }


            $this->redis->redis->HSET( "UDZ_{$dianzan['fid']}", "{$dianzan['tid']}_{$dianzan['uin']}", 0 );//取消点赞

            //$key = "UTDZ_{$dianzan['uin']}_{$dianzan['fid']}_{$dianzan['tid']}";//取消点赞
            //$this->redis->redis->set( $key, json_encode(0), 86400*7 );



            //清空帖子列表相关缓存
            $keys = $this->redis->redis->keys( "TL_{$tinfo['fid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $key_trl = $this->redis->redis->keys( "TRL_*" );//推荐信息流缓存
            if( $key_trl ){
                $this->redis->redis->delete( $key_trl );
            }
            if($key_vrl = $this->redis->redis->keys('VRL_*')){
                $this->redis->redis->delete($key_vrl);
            }
            $keys = $this->redis->redis->keys( "TTL_{$dianzan['fid']}*" );//清理帖子置顶缓存，其中记录了被置顶的帖子信息
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }

            //重新加载帖子到信息流缓冲区
            $this->clearAndLoadStreamRedis($tinfo);

            return true;
        }
        else{
            $this->db->query('rollback');
            return 1001;
        }
    }

    /* 帖子取消置顶
     * 1.更新tinfo_xx表中的t_top=0也就是取消置顶
     * 2.更新t_manager_del_log表中的记录type=2也就是取消置顶
     *
     *
     * */

    function delTTop($top){
        if(empty($top) || empty($top['tid']) || empty($top['fid'])) return 1999;
        $tinfo = $this->getTinfo($top['fid'], $top['tid'], 'id', 1, ' AND t_status=1 ');
        $finfo = $this->getFinfoList(" id='{$top['fid']}' AND f_status=1 ", 'id', 1);
        if(empty($tinfo) || empty($finfo)) return 1003;
        $f_man_json = $finfo[0]['f_manager'];
        if($f_man_json){
            if($f_manager = json_decode($f_man_json, true)){
                if(!in_array($top['uin'], $f_manager)){
                    return 1999;
                }
            }else{
                return 1999;
            }
        }else{
            return 19999;
        }


        $this->db->use_db('gpbbs');
        $this->db->query('start transaction');

        //将置顶的帖子添加到t_manager_del_log表中
        $t = time();
        //a.查看帖子是否被置顶了
        $re_maninfo = $this->getManagerDelTinfoList($top['fid'] , "type=3 AND tid='{$tinfo['id']}'" , 'id DESC', 1);
        
        //b.更新
        $t_m = false;
        if(!empty($re_maninfo)){
            $t_m = $this->db->update('t_manager_del_log', array('type' => 2, 'uid'=> $tinfo['t_create_uin'], 'addtime'=>$t, 'reason'=>$tinfo['reason']), " id={$re_maninfo[0]['id']} AND tid={$re_maninfo[0]['tid']} AND fid={$re_maninfo[0]['fid']}");
        }

        $ex = $finfo[0]['f_ex'];
        $re_top = $this->db->update("tinfo_{$ex}", array('t_top' => 0), " id={$top['tid']} AND fid={$top['fid']} AND t_status=1");

        if($re_top && $t_m && $this->db->query('commit')){
            $this->redis->use_redis('gpbbs');

            //清理帖子缓存
            if($key_t = $this->redis->redis->keys("TINFO_{$top['fid']}_{$top['tid']}*")){
                $this->redis->redis->delete($key_t);
            }
            //清理帖子列表缓存
            if($key_tl = $this->redis->redis->keys("TL_{$top['fid']}*")){
                $this->redis->redis->delete($key_tl);
            }
            //清理推荐信息流缓存
            if($key_trl = $this->redis->redis->keys('TRL_*')){
                $this->redis->redis->delete($key_trl);
            }
            if($key_vrl = $this->redis->redis->keys('VRL_*')){
                $this->redis->redis->delete($key_vrl);
            }
            $keys = $this->redis->redis->keys( "TTL_{$tinfo['fid']}*" );//清理置顶缓存
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $keys = $this->redis->redis->keys( "MDTL_{$tinfo['fid']}*" );//清理t_manager_del_log缓存
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }

            //重新加载到信息流的缓冲区
            $this->clearAndLoadStreamRedis($tinfo);
            return true;
        }else{
            $this->db->query('rollback');
            return 1001;
        }

    }



    /* 帖子取消加精
     *
     *
     *
     * */
    function delTBest($best){
        if(empty($best) || empty($best['tid']) || empty($best['fid'])) return 1999;
        $tinfo = $this->getTinfo($best['fid'], $best['tid'], 'id', 1, ' AND t_status=1');
        $finfo = $this->getFinfoList("id='{$best['fid']}' AND f_status=1", 'id', 1);
        if(empty($tinfo) || empty($finfo)) return 1003;
        $f_man_json = $finfo[0]['f_manager'];
        if($f_man_json){
            if($f_manager = json_decode($f_man_json, true)){
                if(!in_array($best['uin'], $f_manager)){
                    return 1999;
                }
            }else{
                return 1999;
            }
        }else{
            return 1999;
        }

        $this->db->use_db('gpbbs');
        $this->db->query('start transaction');

        $ex = $finfo[0]['f_ex'];
        $re_best = $this->db->update("tinfo_{$ex}", array('t_best' => 0), " id={$best['tid']} AND fid={$best['fid']} AND t_status=1");

        if($re_best && $this->db->query('commit')){
            $this->redis->use_redis('gpbbs');

            //清理帖子缓存
            if($key_t = $this->redis->redis->keys("TINFO_{$best['fid']}_{$best['tid']}*")){
                $this->redis->redis->delete($key_t);
            }
            //清理帖子列表缓存
            if($key_tl = $this->redis->redis->keys("TL_{$best['fid']}*")){
                $this->redis->redis->delete($key_tl);
            }
            //清理推荐信息流缓存
            if($key_trl = $this->redis->redis->keys('TRL_*')){
                $this->redis->redis->delete($key_trl);
            }
            if($key_vrl = $this->redis->redis->keys('VRL_*')){
                $this->redis->redis->delete($key_vrl);
            }
            $keys = $this->redis->redis->keys( "TTL_{$tinfo['fid']}*" );//清理帖子置顶缓存，其中记录了被置顶的帖子信息
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            //重新加载到信息流的缓冲区
            $this->clearAndLoadStreamRedis($tinfo);

            return true;

        }else{
            $this->db->query('rollback');
            return 1001;
        }

    }


    /*
     * 更新小组
     * 
     * */
    function updateFinfo( $finfo ){
        if( empty($finfo['id']) || empty($finfo['ftypeid']) || empty($finfo['f_create_uin']) ) return false;
        $this->db->use_db( 'gpbbs' );
        $result = $this->db->update( 'finfo', $finfo, "id='{$finfo['id']}'" );
        if( $result ){
            //清掉相关缓存
            $this->redis->use_redis( 'gpbbs' );
            $keys = $this->redis->redis->keys( "FL_{$finfo['id']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $key_fsl = $this->redis->redis->keys( "FSL_*" );//更新小组信息分类排行缓存
            if( $key_fsl ){
                $this->redis->redis->delete( $key_fsl );
            }
        }
        return $result;
    }

    /*
     * 更新帖子
     *
     * 删除帖子
     * 1. tinfo_XX
     * 2. u_t_XX
     * 3. uex_bbs_statistic_XX 已更新用户发帖数量 2014.9.10
     * 4. 删除对应的评论
     * 5. 更新finfo里的帖子计数-1
     * 6.管理员删帖同时更新帖子的顶贴时间
     *
     *
     * */
    function updateTinfo($tinfo, $uex='aa', $user_obj){// $uex为删除帖子时更新u_t_XX的t_status用
        if( empty($tinfo['id']) || empty($tinfo['fid']) ) return 1999;
        //判断是否为创建者
        $_tinfo = $this->getTinfo( $tinfo['fid'], $tinfo['id'] );
        
        if( empty($_tinfo) ){
            return 1003;
        }
        if( $_tinfo['t_status']===0 ){//已处于删除状态
            return 1003;
        }
        $finfo = $this->getFinfoList( "id='{$tinfo['fid']}' AND f_status=1", 'id', 1 );
        $f_man_json = $finfo[0]['f_manager'];
        $f_manager = json_decode($f_man_json, true);

        //作者或者管理员可以删除
        if( $tinfo['t_create_uin'] == $_tinfo['t_create_uin'] ){

        }elseif(in_array($tinfo['t_create_uin'], $f_manager) ){
            $uex_info = $user_obj->getUser('', $_tinfo['t_create_uin']);//获取用户uex
            if(empty($uex_info)) return 1999;
            $uex = $uex_info['uex'];
        }else{  
            return 1999;
        }

        if( empty($finfo) ) return 1001;
        $ex = $finfo[0]['f_ex'];
        $this->db->use_db( 'gpbbs' );
        $this->db->query('start transaction');// t_status=0时,要更新u_t_XX
        $up_t = $up_c = $up_u_tex = $up_u_cex = $u_t_c = $t_m = $re_msg = $up_f = $del_vr = $del_copy = true;
        //删除帖子
        if($up_t && $tinfo['t_status']===0){

            //删除u_t_xx表中的记录
            $up_u_tex = $this->db->update( "u_t_{$uex}", array('t_status'=>0), "fid='{$tinfo['fid']}' AND tid={$tinfo['id']}" );

            $re_c = $this->db->select("comment_{$ex}", '*', " c_create_uin='{$_tinfo['t_create_uin']}' AND fid='{$tinfo['fid']}' AND tid='{$tinfo['id']}' AND c_status=1");
            if(!empty($re_c)){
                $re_c_t = $this->db->update("u_c_t_{$uex}", array('c_t_status'=>0), " uid='{$_tinfo['t_create_uin']}' AND fid='{$tinfo['fid']}' AND tid='{$tinfo['tid']}'");
                $set_comment = ' , commented_t_count=commented_t_count-1 ';
            }

            //更新用户发帖数量,(有自评的还要更新我的回复数量)
            $statistic_uex = "uex_bbs_statistic_{$uex}";
            $sql = "insert into {$statistic_uex}(uid, post_count) values({$_tinfo['t_create_uin']}, 1) on duplicate key update post_count=post_count-1 {$set_comment}";
            $u_t_c = $this->db->query($sql);
            $del_vr = $this->delTinfoFromVideoRecomend($tinfo['t_create_uin'], $tinfo['fid'], $tinfo['id']);//删除推荐视频中的记录

            if( $tinfo['t_create_uin'] != $_tinfo['t_create_uin'] ){
                //管理员删帖
                $t_m = false;//防止没有评论理由时删帖
                $t = time();
                //a.查是否被删除了
                $re_maninfo = $this->getManagerDelTinfoList($tinfo['fid'] , "(type=0 or type=1) AND tid='{$tinfo['id']}'" , 'id DESC', 1);
                $this->db->use_db( 'gpbbs' );
                if(!empty($tinfo['reason'])){//删除理由为空，不允许操作
                    $tinfo['t_ding_lasttime'] = $t;//更新顶贴时间，同步回收站中的删除时间(客户端约定)
                    //b.更新
                    if(empty($re_maninfo)){
                        $t_m = $this->db->insert( 't_manager_del_log', array(
                            'fid' => $tinfo['fid'],
                            'tid' => $tinfo['id'],
                            'reason' => $tinfo['reason'],
                            't_addtime' => $_tinfo['t_addtime'],        
                            'addtime' => $t,
                            'uid' => $tinfo['t_create_uin'],        
                        ));
                    }else{
                        $t_m = $this->db->update('t_manager_del_log', array('type' => 0, 'uid'=> $tinfo['t_create_uin'], 'addtime'=>$t, 'reason'=>$tinfo['reason']), " id={$re_maninfo[0]['id']} AND tid={$re_maninfo[0]['tid']} AND fid={$re_maninfo[0]['fid']}");
                    }

                    //删帖通知
                    require_once SYSDIR_UTILS. "/UserMessage.php";
                    $uinfo2 = $user_obj->getUser('', $_tinfo['t_create_uin']);//获取用户uex
                    $uinfo1 = $user_obj->getUser('', 827257);//获取用户uex
                    $obj_msg = new UserMessage();
                    $msg = "你的贴子<{$_tinfo['t_title']}>由于违反相关版规，已被管理员删除。";
                    $re_msg = $obj_msg->sendMsgUser2User( 827257, $uinfo1['uex'], $_tinfo['t_create_uin'], $uinfo2['uex'], $msg );
                }
            }
            unset($tinfo['reason']);
            //对应的小组帖子数-1
            $f_t_new_count = $finfo[0]['f_t_count'] - 1;
            $up_f = $this->db->update( 'finfo', array('f_t_count'=>$f_t_new_count), "id='{$finfo[0]['id']}'");

            //删除转帖记录
            $del_copy = $this->db->del( "t_copy_to_f_log", "new_tid='{$tinfo['id']}' and new_fid='{$finfo[0]['id']}'" );

        }else{//更改帖子
            //更新u_t_xx表中的video字段
            if(isset($tinfo['video_fb'])){
                $up_u_tex = $this->db->update( "u_t_{$uex}", array('video'=>1), "fid='{$tinfo['fid']}' AND tid={$tinfo['id']}" );
            }else{
                $up_u_tex = $this->db->update( "u_t_{$uex}", array('video'=>0), "fid='{$tinfo['fid']}' AND tid={$tinfo['id']}" );
            }
        }

        unset($tinfo['t_create_uin']);
        //帖子
        $t_tb = "tinfo_{$ex}";
        if(isset($tinfo['video_fb']) === false && $tinfo['t_status'] !== 0){
            $tinfo['video_fb'] = '';
        }
        $up_t = $this->db->update( $t_tb, $tinfo, "id='{$tinfo['id']}'" ); 

        //@file_put_contents('/tmp/UserBbs.log', print_r($f_ma, true)."\n".date('d-H-i-s')."[updateTinfo]re_msg:{$re_msg},up_t:{$up_t},up_c:{$up_c},up_u_tex:{$up_u_tex},u_t_c:{$u_t_c},t_m:{$t_m},up_f:{$up_f},del_vr:{$del_vr}\n", FILE_APPEND);//如果是re_msg==false,有可能是sixin_msg_xx表没建立
        if( $re_msg && $up_t && $up_c && $up_u_tex && $up_u_cex && $u_t_c && $t_m && $up_f && $del_vr && $this->db->query('commit')){
            $this->updateDingTieTime($tinfo['id'], $tinfo['fid']);//更新顶贴时间

            $this->redis->use_redis( 'gpbbs' );
            //清掉相关缓存
            $keys = $this->redis->redis->keys( "TINFO_{$tinfo['fid']}_{$tinfo['id']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $keys = $this->redis->redis->keys( "TL_{$tinfo['fid']}*" );//相关帖子列表
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $key_trl = $this->redis->redis->keys( "TRL_*" );//推荐信息流缓存
            if( $key_trl ){
                $this->redis->redis->delete( $key_trl );
            }
            if($key_vrl = $this->redis->redis->keys('VRL_*')){
                $this->redis->redis->delete($key_vrl);
            }
            $key_uc = $this->redis->redis->keys( "UC_*" );//清除小组分类缓存
            if( $key_uc ){
                $this->redis->redis->delete( $key_uc );
            }
            $keyM = $this->redis->redis->keys( "MDTL_{$tinfo['fid']}*" );//清理回收站缓存
            if( $keyM ){
                $this->redis->redis->delete( $keyM );
            }
            if($_tinfo['t_top'] == 1)
                $keys = $this->redis->redis->keys( "TTL_{$tinfo['fid']}*" );//清理帖子置顶缓存，其中记录了被置顶的帖子信息
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }

            $keys = $this->redis->redis->keys( "FL_{$finfo['id']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $key_fsl = $this->redis->redis->keys( "FSL_*" );//更新小组信息分类排行缓存
            if( $key_fsl ){
                $this->redis->redis->delete( $key_fsl );
            }

            //重新加载到信息流缓存
            $this->clearAndLoadStreamRedis($_tinfo);
            return true;
        }
        else{
            $this->db->query('rollback');      	
            return 1001;
        }
    }


    /*
     * 更新评论
     *
     * 删除评论
     * 1. comment_XX
     * 2. u_c_XX
     * 3. uex_bbs_statistic_XX 已完成
     * 4. 更新tinfo里的评论计数-1
     * 5. 顶贴时间 TODO
     * 6. 更新u_c_t_xx表
     * 
     * 
     * */
    function updateComment($cinfo, $user_obj){// $uex为删除评论时更新u_c_XX的c_status用
        if( empty($cinfo['id']) || empty($cinfo['fid']) || empty($cinfo['tid']) ) return 1999;
        //验证是否为创建者
        $_cinfo = $this->getCommentList( $cinfo['fid'], $cinfo['tid'], 1, 0, "AND c_status=1 AND id='{$cinfo['id']}'" );
        $tinfo = $this->getTinfo($cinfo['fid'], $cinfo['tid'], 'id', 1, 'AND t_status=1');
        if( empty($tinfo) ) return 1003;
        if( ($_cinfo[0]['c_create_uin'] != $cinfo['c_create_uin']) && ($tinfo['t_create_uin'] != $cinfo['c_create_uin']) ) return 1999;
        unset( $cinfo['c_create_uin'] );

	    $uinfo = $user_obj->getUser( '', $_cinfo[0]['c_create_uin'] );
        $uex = $uinfo['uex'];//评论者的uex

        $ex = $tinfo['t_ex'];
        $c_tb = "comment_{$ex}";
        $this->db->use_db( 'gpbbs' );
        $this->db->query('start transaction');// c_status=0时,要更新u_c_XX
        $up_c = $up_t = $up_c_tex = $u_c_c = $re_t = $re_c_t =  true;
        $up_c = $this->db->update( $c_tb, $cinfo, "id='{$cinfo['id']}'" );

        if(isset($cinfo['c_status']) && $cinfo['c_status'] == 0){//删
            //更新帖子被评论数量
            $finfo = $this->getFinfoList( "id='{$cinfo['fid']}' AND f_status=1", 'id', 1 );
            $re_t = false;
            if($finfo){
                $t_tb = "tinfo_{$finfo[0]['f_ex']}";
                $re_t = $this->db->query("update {$t_tb} set t_comment_count = if( t_comment_count,  t_comment_count-1, 0 ) where id ={$cinfo['tid']}");
            }
            //更新用户与评论关系表
            $up_c_tex = $this->db->update( "u_c_{$uex}", array('c_status'=>0), "fid='{$tinfo['fid']}' AND tid={$tinfo['id']} AND cid='{$cinfo['id']}'" );


            //更新用户评论过的帖子数量
            $re_c_t = true;
            $re_c = $this->db->select("comment_{$ex}", '*', " c_create_uin='{$_cinfo[0]['c_create_uin']}' AND fid='{$cinfo['fid']}' AND tid='{$cinfo['tid']}' AND c_status=1");
            $set = "";
            if(empty($re_c)){
                $re_c_t = $this->db->update("u_c_t_{$uex}", array('c_t_status'=>0), " uid='{$_cinfo[0]['c_create_uin']}' AND fid='{$cinfo['fid']}' AND tid='{$cinfo['tid']}'");
                $set = 'commented_t_count=commented_t_count-1, ';
            }

            //更新用户评论数量,uex_bbs_statistic_xx
            $statistic_uex = "uex_bbs_statistic_{$uex}";
            $set .= 'comment_count=comment_count-1';//发评论增加
            $sql = "insert into {$statistic_uex}(uid, comment_count) values({$_cinfo[0]['c_create_uin']}, 1) on duplicate key update {$set}";
            
            $u_c_c = $this->db->query($sql);

        }
        //unset( $cinfo['c_create_uin'] );//前面已经unset过一次
        if( $up_c && $up_t && $up_c_tex && $u_c_c && $re_c_t && $re_t  &&$this->db->query('commit')){
            if( $cinfo['c_status']!==0 ){//更新
                $this->updateDingTieTime($cinfo['tid'],$cinfo['fid']);//更新顶贴时间
            }elseif($cinfo['c_status'] === 0){//删除
                $this->redis->use_redis( 'gpbbs' );
                //清掉帖子相关缓存
                $keys = $this->redis->redis->keys( "TINFO_{$cinfo['fid']}_{$cinfo['tid']}*" );
                if( $keys ){
                    $this->redis->redis->delete( $keys );
                }
                //清空帖子列表相关缓存
                $keys = $this->redis->redis->keys( "TL_{$cinfo['fid']}*" );
                if( $keys ){
                    $this->redis->redis->delete( $keys );
                }
                $key_trl = $this->redis->redis->keys( "TRL_*" );//推荐信息流缓存
                if( $key_trl ){
                    $this->redis->redis->delete( $key_trl );
                }
                $key_vrl = $this->redis->redis->keys( "VRL_*" );
                if( $key_vrl ){
                    $this->redis->redis->delete( $key_vrl );
                }
                $key_uc = $this->redis->redis->keys( "UC_*" );//个人数据
                if( $key_uc ){
                    $this->redis->redis->delete( $key_uc );
                }
                if($tinfo['t_top'] == 1){
                    $keys = $this->redis->redis->keys( "TTL_{$cinfo['fid']}*" );//清理帖子置顶缓存，其中记录了被置顶的帖子信息
                    if( $keys ){
                        $this->redis->redis->delete( $keys );
                    }
                }
                //重新加载到信息流缓存
                $this->clearAndLoadStreamRedis($tinfo);
            }

            return true;
        }
        else{
            $this->db->query('rollback');      	
            return 1001;
        }
    }

    /*
     * 用户加入小组(fid)
     * 1.更新频道用户关注对应表f_uin_aa
     * 2.更新finfo表中的关注数量
     *
     * */
    function addF_uin($f_uin){
        if( empty($f_uin['fid']) || empty($f_uin['uin']) ) return false;
        $finfo = $this->getFinfoList( "id='{$f_uin['fid']}' AND f_status=1", 'id', 1 );
        if( empty($finfo) ) return false;

        $this->db->use_db( 'gpbbs' );
        //start Transaction
        $this->db->query('start transaction');


        $ex = $finfo[0]['f_ex'];
        $f_uin_tb = "f_uin_{$ex}";
        $f_uin['status'] = 1;


        $f_uin_info = $this->db->select($f_uin_tb,'id,status',"fid = {$f_uin['fid']} and uin = {$f_uin['uin']}");

        if($f_uin_info){
            if($f_uin_info[0]['status']==1){ //已经加入
                return true;
            }
            else{
                $re_f_uin = $this->db->update( $f_uin_tb, $f_uin ,"id = {$f_uin_info[0]['id']}" );
            }
        }
        else{
            $re_f_uin =  $this->db->insert( $f_uin_tb, $f_uin );
        }


        //finfo  的 f_uin_count+1
        $f_tb = "finfo";
        $re_f = $this->db->query("update {$f_tb} set f_uin_count = f_uin_count + 1 where id ={$f_uin['fid']}");

        if( $re_f_uin && $re_f && $this->db->query('commit')){
            //清掉相关缓存
            $this->redis->use_redis( 'gpbbs' );
            $keys = $this->redis->redis->keys( "FL_{$f_uin['fid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            //清掉相关缓存
            $keyuc = $this->redis->redis->keys( "UC_*" );
            if( $keyuc ){
                $this->redis->redis->delete( $keyuc );
            }
            $key_fsl = $this->redis->redis->keys( "FSL_*" );//更新小组信息分类排行缓存
            if( $key_fsl ){
                $this->redis->redis->delete( $key_fsl );
            }
            //该用户是否关注该小组的清除空值
            if( $this->redis->redis->keys( "UFIN_{$f_uin['uin']}_{$f_uin['fid']}" ) ){
                $this->redis->redis->delete( "UFIN_{$f_uin['uin']}_{$f_uin['fid']}" );
            }

            return true;
        }
        else{
            $this->db->query('rollback');
            return false;
        }

    }

    /*
     * 用户退出小组(fid)
     * 
     * */
    function delF_uin($f_uin){
        if( empty($f_uin['fid']) || empty($f_uin['uin']) ) return false;
        $finfo = $this->getFinfoList( "id='{$f_uin['fid']}' AND f_status=1", 'id', 1 );
        if( empty($finfo) ) return false;


        $this->db->use_db( 'gpbbs' );
        //start Transaction
        $this->db->query('start transaction');


        $ex = $finfo[0]['f_ex'];
        $f_uin_tb = "f_uin_{$ex}";
        $f_uin['status'] = 0;

        $f_uin_info = $this->db->select($f_uin_tb,'id,status',"fid = {$f_uin['fid']} and uin = {$f_uin['uin']}");
        if($f_uin_info){
            if($f_uin_info[0]['status']==0){ //已经退出
                return true;
            }
            else{
                $re_f_uin = $this->db->update( $f_uin_tb, $f_uin ,"id = {$f_uin_info[0]['id']}" );
            }
        }
        else{
            $re_f_uin = $this->db->update( $f_uin_tb, $f_uin, "fid='{$f_uin['fid']}' AND uin='{$f_uin['uin']}'" );
        }


        //finfo  的 f_uin_count-1
        $f_tb = "finfo";
        $re_f = $this->db->query("update {$f_tb} set f_uin_count = f_uin_count - 1 where id ={$f_uin['fid']}");

        if( $re_f_uin && $re_f && $this->db->query('commit')){
            //清掉相关缓存 //此处可以不更新缓存*只在加入小组的时候更新
            $this->redis->use_redis( 'gpbbs' );
            $keys = $this->redis->redis->keys( "FL_{$f_uin['fid']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            //清掉相关缓存
            $keyuc = $this->redis->redis->keys( "UC_*" );
            if( $keyuc ){
                $this->redis->redis->delete( $keyuc );
            }
            $key_fsl = $this->redis->redis->keys( "FSL_*" );//更新小组信息分类排行缓存
            if( $key_fsl ){
                $this->redis->redis->delete( $key_fsl );
            }
            //已关注
            if( $this->redis->redis->keys( "UFIN_{$f_uin['uin']}_{$f_uin['fid']}" ) ){
                $this->redis->redis->delete( "UFIN_{$f_uin['uin']}_{$f_uin['fid']}" );
            }

            return true;
        }
        else{
            $this->db->query('rollback');
            return false;
        }

    }

    /*
     * 新增FileObject记录
     * 仅作记录 //TODO 相同的文件(md5)重复使用
     * */
    function addFb( $fbinfo ){
        $this->db->use_db( 'gpbbs' );
        if( empty($fbinfo['url']) ) return false;
        $fb_tb = "fb_{$this->default_fb_ex}";
        return $this->db->insert( $fb_tb, $fbinfo );
    }

    /*
     * 获得帖子图片保存的目录
     * 
     * */
    function getTDir(){
        $dir = SYSDIR_ROOT ."/bpic/t/".date('ymd')."/";
        if( ! file_exists( $dir ) ){
            @mkdir( $dir, 0777 );
        }
        return $dir;
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
     * 获得视频截图保存的目录
     * liuzhi 添加于2015-01-12
     * 
     * */
    function getVDir(){
        $dir = SYSDIR_ROOT ."/bpic/v/".date('ymd')."/";
        if( ! file_exists( $dir ) ){
            @mkdir( $dir, 0777 );
        }
        return $dir;
    }

    /*
     * 更新顶贴时间
     *
     * */
    function updateDingTieTime($tid, $fid){
        if( empty($tid) || empty($fid) ) return false;
        $finfo = $this->getFinfoList( "id='{$fid}' AND f_status=1", 'id', 1 );
        if(!$finfo) return false;
        $t_tb = "tinfo_{$finfo[0]['f_ex']}";
        $lasteTime = time();
        $this->db->use_db('gpbbs');
        $info = array('t_ding_lasttime'=> $lasteTime);
        return $this->db->update( $t_tb, $info, "id='{$tid}'" );
    }

    /*
     * 插入reply记录
     *
     * */
    function addReply($fid, $tid, $cid, $uin){
        if( empty($fid) || empty($tid) || empty($uin) ) return false;
        $this->db->use_db( 'gpreply' );
        $date = date('ymd');
        $data  = array(
            'post_type' => 0,
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
     * 更新用户发帖数量的记录
     * 弃用，已在发帖删帖时更新数量
     *
     */
    function updateTieCount($uin, $uex,$action=0){
        if(empty($uin) || empty($uex)) return false;
        $statistic_uex = "uex_bbs_statistic_{$uex}";
        $this->db->use_db( 'gpbbs' );
        if($action){
            $set = 'post_count=post_count-1';//删帖减少
        }else{
            $set = 'post_count=post_count+1';//发帖增加
        }
        $sql = "insert into {$statistic_uex}(uid, post_count) values({$uin}, 1) on duplicate key update {$set}";
        $result = $this->db->query($sql);

        //清除用户个人数据缓存
        $keys = "UC_{$uin}";
        $this->redis->use_redis('gpbbs');
        $key = $this->redis->redis->keys($keys);
        if($result && $key){
            $this->redis->redis->delete($keys);
        }
        return $result;
    }

    /* 
     * 更新用户评论数量的记录
     * 弃用，已在评论时，删除评论时更新 
     */
    function updateCommentCount($uin, $uex, $action=0){
        if(empty($uin) || empty($uex)) return false;
        $statistic_uex = "uex_bbs_statistic_{$uex}";
        $this->db->use_db( 'gpbbs' );
        if($action){
            $set = 'comment_count=comment_count-1';//删评论减少
        }else{
            $set = 'comment_count=comment_count+1';//发评论增加
        }
        $sql = "insert into {$statistic_uex}(uid, comment_count) values({$uin}, 1) on duplicate key update {$set}";
        $result = $this->db->query($sql);

        //清除用户个人数据缓存
        $keys = "UC_{$uin}";
        $this->redis->use_redis('gpbbs');
        $key = $this->redis->redis->keys($keys);
        if($result && $key){
            $this->redis->redis->delete($keys);
        }
        return $result;
    }

    /*
     * 删帖时，更新用户评论数量
     * 弃用，删帖是删帖，不影响评论
     *
     * */


    function delTAndUpdateCommentCount($uin , $uex)
    {
        if(empty($uin) || empty($uex)) return false;
        $comment_ex = "comment_{$uex}";
        $sql = "select * from {$comment_ex} where c_create_uin={$uin} AND c_status=1";
        $this->db->use_db('gpbbs');
        $cinfo = $this->db->query($sql);
        if($cinfo){
            $statistic_uex = "uex_bbs_statistic_{$uex}";
            $c_count = count($cinfo);
            $statistic_info = array('comment_count'=>$c_count);
            $re = $this->db->update($statistic_uex, array('comment_count'=>$c_count), "uid={$uin}");

            //清除用户个人数据缓存
            $keys = "UC_{$uin}";
            $this->redis->use_redis('gpbbs');
            $key = $this->redis->redis->keys($keys);
            if($cinfo && $re && $key){
                $this->redis->redis->delete($keys);
            }
        }

        return $re;
    }

    /*
     * 清理信息流缓存
     *
     * */
    function clearAndLoadStreamRedis($tinfo){
        $r_tinfo =  $this->redis->redis->zrevrangebyscore("TS_{$tinfo['fid']}", $tinfo['t_ding_lasttime'], $tinfo['t_ding_lasttime']);
        if(count($r_tinfo) > 1){
            foreach($r_tinfo as $v){
                $old_tinfo = unserialize($v);
                if($old_tinfo['id'] == $tinfo['id'] && $old_tinfo['fid'] == $tinfo['fid']){
                    $this->redis->redis->zremrangebyscore("TS_{$tinfo['fid']}", $tinfo['t_ding_lasttime'], $tinfo['t_ding_lasttime']);//删除原有的
                    break;
                }
            }
        }else{
            $this->redis->redis->zremrangebyscore("TS_{$tinfo['fid']}", $tinfo['t_ding_lasttime'], $tinfo['t_ding_lasttime']);//删除原有的
        }
        $newtinfo = $this->getTinfo($tinfo['fid'], $tinfo['id'], 'id', 1, 'AND t_status=1');
        if(!empty($newtinfo)){
            $this->redis->redis->zadd("TS_{$newtinfo['fid']}", $newtinfo['t_ding_lasttime'],serialize($newtinfo));//加载新的
        }
    }


    /* 管理员恢复被删除的帖子
     * a.查询t_manager_del_log表,检测帖是否被管理员删除
     * b.查finfo获得小组信息和管理员信息
     * c.更新t_manager_del_log、tinfo_xx、uex_bbs_statistic_XX、u_t_xx五个表的状态和数量
     * d.finfo中发帖的数量  TODO
     * $simu_user 是所有管理员的数组
     *
     * */
    function restoreTinfo($tinfo, $simu_user, $user_obj){
        if(empty($tinfo['fid']) || empty($tinfo['id']) || ( empty($tinfo['man_uin']) &&  empty($simu_user)) && empty($user_obj)) return 1999;
        $this->db->use_db('gpbbs');
        $re_maninfo = $this->getManagerDelTinfoList($tinfo['fid'] , "type=0 AND tid={$tinfo['id']}" , 'id DESC', 1);
        $_tinfo = $this->getTinfo( $tinfo['fid'], $tinfo['id'] , 'id DESC', 1, ' AND t_status=0');
        $finfo = $this->getFinfoList( "id='{$tinfo['fid']}' AND f_status=1", 'id', 1 );
        if(empty($re_maninfo) || empty($_tinfo) || empty($finfo)) return 1003;

        $uex_info = $user_obj->getUser( '', $_tinfo['t_create_uin'] );			
        if(empty($uex_info)) return 1999;
        $uex = $uex_info['uex'];//帖作者的uex

        $f_manager_arr = json_decode($finfo[0]['f_manager'], true);
        if( !in_array($tinfo['man_uin'], $f_manager_arr) && !in_array($tinfo['man_uin'], $simu_user)){//验证是否为该小组管理员
            return 1999;
        }

        $this->db->use_db('gpbbs');
        $this->db->query('start transaction');

        //a.恢复t_manager_del_log表中的状态
        $re_t_m = $this->db->update('t_manager_del_log', array('type' => 1), " id={$re_maninfo[0]['id']} AND tid={$re_maninfo[0]['tid']} AND fid={$re_maninfo[0]['fid']}");

        //b.恢复u_t_xx表中的状态
        $re_u_t = $this->db->update( "u_t_{$uex}", array('t_status'=>1), "fid='{$tinfo['fid']}' AND tid={$tinfo['id']}" );

        //c.恢复uex_bbs_statistic_XX中用户发帖、评论的数量
        $re_stat = $this->db->query( "update uex_bbs_statistic_{$uex} set post_count=post_count+1, commented_t_count=commented_t_count+1 where uid='{$_tinfo['t_create_uin']}'" );

        //d.恢复tinfo_xx中的帖子
        $t = time();
        $re_t = $this->db->update( "tinfo_{$finfo[0]['f_ex']}", array('t_status'=>1), "id='{$_tinfo['id']}' AND fid='{$_tinfo['fid']}'" );

        //e.恢复t_badreport_log表中的状态
        $re_b_l = $this->db->update('t_badreport_log', array('status' => 2), " tid={$re_maninfo[0]['tid']} AND fid={$re_maninfo[0]['fid']}");      
        if($re_t_m && $re_u_t && $re_stat && $re_t && $re_b_l && $this->db->query('commit')){

            $this->redis->use_redis( 'gpbbs' );
            //清掉相关缓存
            $keys = $this->redis->redis->keys( "TINFO_{$tinfo['fid']}_{$tinfo['id']}*" );
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $keys = $this->redis->redis->keys( "TL_{$tinfo['fid']}*" );//相关帖子列表
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            $key_trl = $this->redis->redis->keys( "TRL_*" );//推荐信息流缓存
            if( $key_trl ){
                $this->redis->redis->delete( $key_trl );
            }
            if($key_vrl = $this->redis->redis->keys('VRL_*')){
                $this->redis->redis->delete($key_vrl);
            }
            $key_uc = $this->redis->redis->keys( "UC_*" );//清除小组分类缓存
            if( $key_uc ){
                $this->redis->redis->delete( $key_uc );
            }
            $keyM = $this->redis->redis->keys( "MDTL_{$tinfo['fid']}*" );//清理回收站缓存
            if( $keyM ){
                $this->redis->redis->delete( $keyM );
            }
            $keys = $this->redis->redis->keys( "TTL_{$tinfo['fid']}*" );//清理帖子置顶缓存，其中记录了被置顶的帖子信息
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            //重新加载到信息流缓存
            $this->clearAndLoadStreamRedis($_tinfo);

            return true;
        }else{
            $this->db->query('rollback');
            return 1001;
        }  
    }

    /* 获取回收站t_manager_del_log中的记录
     * 
     *
     * */
    function getManagerDelTinfoList($fid , $and_where= 'type=0 ' ,$orderby='id DESC', $count=20){
        if(empty($fid)) return false;
        $this->redis->use_redis( 'gpbbs' );
        $key = "MDTL_".str_replace( array("'", '"', '=', ' '), array('', '', '', ''), "{$fid}_{$and_where}_{$orderby}{$limit}" );//加入and_where防止 t_status=0和1的缓存混乱
        if( $cached = $this->redis->redis->get($key) ){
            return unserialize( $cached );
        }

        $and_where .= " AND fid={$fid} ";

        $this->db->use_db('gpbbs');
        $t_maninfos = $this->db->select('t_manager_del_log', '*', "{$and_where} ", $orderby, $count);
        $this->redis->redis->set( $key, serialize($t_maninfos) , 86400 * 7);
        return $t_maninfos;
    }

    /* 获取小组置顶的帖子列表
     * 1.先在t_manager_del_log表中获取type=3的置顶帖子记录
     * 2.在到tinfo_xx表中获取数据
     *
     * */
    function getFinfoTopTinfoList( $fid=0, $and_where='1=1', $orderby='id DESC', $limit ){
        if( empty($fid) ) return false;
        $this->redis->use_redis( 'gpbbs' );
        $key = "TTL_".str_replace( array("'", '"', '=', ' '), array('', '', '', ''), "{$fid}_{$and_where}_{$orderby}{$limit}" );
        if( $cached = $this->redis->redis->get($key) ){
            return unserialize( $cached );
        }

        $finfo = $this->getFinfoList( "id='{$fid}' AND f_status=1", 'id', 1 );
        if( empty($finfo) ) return false;
        $this->db->use_db( 'gpbbs' );

        //a.获取t_manager_del_log表中置顶帖子的记录
        $t_minfos = $this->db->select('t_manager_del_log', '*', "fid={$fid} AND type=3 $and_where", $orderby, '');

        $data = array();
        if($t_minfos){
            foreach($t_minfos as $t_minfo){
                $data[] = $this->getTinfo( $fid, $t_minfo['tid'], 'id', 1, ' AND t_status=1 AND t_top=1');
            }
        }
        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, serialize($data), 86400*7 );

        return $data;
    }

    /*
     * 禁言用户
     * */
    function checkIsBlockUser($userUin){
        $this->redis->use_redis('dm_level');
        $block_time = $this->redis->redis->hGet('GUOPAN_BLOCK',$userUin);

        if($block_time&&($block_time-time()>=0)){
            return true;
        }
        return false;
    }

    /*
     * 屏蔽词
     * TODO 替换为*
     * */
    function checkHasBlockKw($content){
        $this->redis->use_redis('dm_level');
        $kw_arr = $this->redis->redis->hGetAll('GUOPAN_KeyShield');
        if( empty( $kw_arr ) ) return false;
        foreach( $kw_arr as $kw => $type ){
            if( strpos( $content, $kw )!==false ){
                @file_put_contents( '/tmp/GUOPAN_KeyShield', $kw."\n", FILE_APPEND );
                return true;
            }
        }
        return false;
    }

    /*
     * 举报帖子，举报原因沿用删除原因
     * 2014-10-8创建
     *
     * */
    function addBadReportTinfo($badTinfo){
        if( empty($badTinfo['uid']) || empty($badTinfo['fid']) || empty($badTinfo['id']) || empty($badTinfo['reason']) ) return 1999;
        $_tinfo = $this->getTinfo( $badTinfo['fid'], $badTinfo['id'] );
        if( empty($_tinfo) ) return 1003;

        $t = time();
        $this->db->use_db('gpbbs');
        $c_tinfo = $this->db->insert('t_badreport_log', array(
            'uid' => $badTinfo['uid'],
            'fid' => $badTinfo['fid'],
            'tid' => $badTinfo['id'],
            'reason' => $badTinfo['reason'],
            'addtime' => $t,
            ) 
        );

        return $c_tinfo;
    }


    /* (仅仅测试用到)
     * 将帖子设置为 推荐视频
     *
     * */
    function setTinfoToVideoRecomend($fid , $tid, $sort=0){
        if(empty($fid) || empty($tid)) return false;
        //写入推荐视频
        $this->db->use_db('gpbbs');
        $sort = $sort > 0 ? $sort:rand(1, 100);
        $this->db->insert('t_recomend_video_list', 
            array( 'fid' => $fid,
                'tid' => $tid,
                'sort' => $sort,
            )
        );

        $this->redis->use_redis( 'gpbbs' );
        $keys = $this->redis->redis->keys( "VRL_*" );//相关小组列表
        if( $keys ){
            $this->redis->redis->delete( $keys );
        }
    }

    /* 
     * 删除推荐视频中的帖子,即删除表 t_recomend_video_list中的tie
     * 
     * */
    function delTinfoFromVideoRecomend($uin, $fid, $tid){
        if(empty($uin) || empty($fid) || empty($tid)) return false;
        $this->db->use_db('gpbbs');
        $re = $this->db->del('t_recomend_video_list', "tid='{$tid}' and fid='{$fid}'");
        if($re && $this->db->db->affected_rows){
            $this->redis->use_redis( 'gpbbs' );
            $keys = $this->redis->redis->keys( "VRL_*" );//相关小组列表
            if( $keys ){
                $this->redis->redis->delete( $keys );
            }
            @file_put_contents( "/data/logs/gperror/t.log", date('y-m-d H-i-s')."user del VideoRecomend Tie uin:{$uin}, fid:{$fid}, tid:{$tid}\n", FILE_APPEND );
        } 
        return $re;
    }


    /* (仅仅测试用到)
     * 将帖子设置为 推荐列表帖子
     *
     * */
    function setTinfoToRecomend($fid , $tid, $sort=0){
        if(empty($fid) || empty($tid)) return false;

        $this->db->use_db('gpbbs');
        $sort = $sort > 0 ? $sort:rand(1, 100);
        $this->db->insert('t_recomend_list', 
            array( 'fid' => $fid,
                'tid' => $tid,
                'sort' => $sort,
            )
        );

        $this->redis->use_redis( 'gpbbs' );
        $keys = $this->redis->redis->keys( "TRL_*" );//相关小组列表
        if( $keys ){
            $this->redis->redis->delete( $keys );
        }
    }
    
    /* lz 2015-02-12
     * 检查用户N分钟内发帖的相似度
     * 1.查用户time时间内发的帖子
     * 2.新旧帖子相互对比
     * 3.返回相似度 0-100
     *
     * */
    function cheackUserTinfoSimilar($uin, $fid, $text, $time=600){
        if(empty($text)|| empty($fid)) return false;

        $finfo = $this->getFinfoList( "id='{$fid}' AND f_status=1", 'id', 1 );
        if( empty($finfo) ) return false;

        $ex = $finfo[0]['f_ex'];
        $t_tb = "tinfo_{$ex}";
        
        $t_get = time() - $time;
        $this->db->use_db( 'gpbbs' );
        $tinfo = $this->db->select( $t_tb, 't_content', "t_create_uin='{$uin}' and t_status='1' and t_addtime>'{$t_get}'", 'id DESC' );
        if($tinfo){
            foreach($tinfo as $k => $v){
                similar_text($v['t_content'], $text, $percent);
                $result[] = $percent;
            }
            rsort($result); 
            return $result[0];
        }

        return 0;
    }

    
    /*
     * 目前实现了评论的处理，待处理帖子
     *
     * 返回数据时如果遇到utf8序列化出错，调用此方法去除序列化出错的项目
     * type 是数据类型，帖子列表，评论列表等
     * $xxDataProto_res 是XXBBSDataProto
     * $user_obj 是查询用户信息的对象
     * */
    function clearSerializeUtf8Error( &$xxDataProto_res, $type, &$user_obj ){
        if(empty($xxDataProto_res)) return false;

        include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSBase.proto.php";
        include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSData.proto.php";
        switch($type){
            case XXProto_XXBBSDataProto_SUBCMD::SUBCMD_XXBBSDataProto_COMMENTSLISTREQ://评论
                $XXBBSDataCommentsListRes = $xxDataProto_res->getComments_list_res(); 
                $XXBBSCommentInfos = $XXBBSDataCommentsListRes->getComment_info_list();
                foreach($XXBBSCommentInfos as $k => $XXBBSCommentInfo){
                    try{
                        $XXBBSCommentInfo->serializeToString(); 
                    }catch(Exception $e){
                        $cinfo = array(
                            'c_status' => 0,
                            'id' => $XXBBSCommentInfo->getCid(),
                            'tid' => $XXBBSCommentInfo->getTid(),
                            'fid' => $XXBBSCommentInfo->getFid(), 
                            'c_create_uin' => $XXBBSCommentInfo->getRole_info()->getUin(),
                        );
    
                        $re = $this->updateComment($cinfo, $user_obj);
                        unset($XXBBSCommentInfos[$k]);                                         
                    }
                }

                $XXBBSDataCommentsListRes->clearComment_info_list();
                $XXBBSDataCommentsListRes->setComment_info_list($XXBBSCommentInfos);
                $xxDataProto_res->setComments_list_res($XXBBSDataCommentsListRes);

                break;
            default:
               //nothing 
                break;
        }


    
    }

}

?>
