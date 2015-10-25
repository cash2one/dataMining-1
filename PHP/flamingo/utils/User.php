<?php
/*
 * XX用户类 增改查
 * author: huasong
 * */

//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";
require_once SYSDIR_UTILS. "/DB.php";
require_once SYSDIR_UTILS. "/REDIS.php";

class User
{
    /* 一个user的 redis KEY 可以有四个: user:$uid user:$uname user:$uphone user:$uemail */
    public $db;
    public $redis;
    public $base_column;
    public $ex_column;
    public $default_ex = 'ab';
    public $uico_dir = 'uico';//用户头像存放目录
    public $uico_dpre = 'http://www.xmodgames.cn/user/uico/';// 用户头像调用的域名前缀

    /*TODO: umod 用户受邀加好友的应答 状态 0邀请通过才允许 1默认允许被加好友 */

    function __construct(){
    	$this->base_column = array( 'uname', 'uphone', 'uemail', 'upwd', 'usalt', 'ufb', 'newuemail');
        $this->ex_column = array( 'cid', 'usex', 'usfz', 'urealname', 'ubbspwd', 'unickname', 'uico', 'ufid', 'usignature', 'email_verify', 'country' );
        $this->redis = new myRedis();
        $this->redis->use_redis( 'write' );
        $this->db = new DB();
        $this->uico_dpre = 'http://www.xmodgames.com/user/uico/';

        /*
        global $DB_CONFIG;
        if( $DB_CONFIG['write'][0]['host']=='localhost' ){//调试模式
            $this->uico_dpre = 'http://14.18.239.131:82/user/uico/';
        }
         */
    }
    function __destruct(){
    }

//设置redis的值
    function setRedisEmailQueue( $info = array() ){
    	$this->redis->use_redis( 'write' );
    	$_val = json_encode( $info );
    	$this->redis->redis->lpush( "redisEmailQueue", $_val );
	file_put_contents('/tmp/test_re_'.$_val,$user);
    }



	
    /*
     * 获取用户信息
     * 1. 从redis获取
     * 2. 从热表获取 (写入到redis)
     * 3. 从冷表获取 (写入到热表+redis)
     * */
    function getUser( $u='', $uid=0 ){
        if( ! $u && ! $uid ) return false;
        if( $uid ){
            $user_redis_key = 'user:'.$uid;
        }
        else{
            $user_redis_key = 'user:'.$u;
        }
        $this->redis->use_redis( 'write' );
        $user = $this->redis->redis->get( $user_redis_key );
        if( $user ) return json_decode( $user, true );
        $this->db->use_db( 'read' );
        if( $uid ){
            $_wh = " uid='{$uid}' ";
        }
        else{
            $_wh = " uname='{$u}'";
            if( strpos( $u, '@' ) ){
                $_wh .= " OR uemail='{$u}' OR newuemail='{$u}' ";
            }
            elseif( strlen($u)==11 && is_numeric($u) ){
                $_wh .= " OR uphone='{$u}'";
            }
            elseif( is_numeric($u) ){
                $_wh .= " OR ufb='{$u}'";
            }
        }
        $_sql = "SELECT * FROM user_base WHERE {$_wh} LIMIT 1";
        $user_base = $this->db->query( $_sql );
        //var_dump( $user_base );
        if( ! $user_base ){
            // 查询冷表
            $user_base = $this->db->query( str_replace( 'user_base', 'user_base_cold', $_sql ) );
            if( ! $user_base ) return false;
            $this->db->use_db( 'write' );
            /* 写入到热表 */
            // ->db 自定义数据库对象 ->db->db mysqli对象
            $this->db->db->autocommit(FALSE);
            $del_result = $this->db->del( 'user_base_cold', "uid='{$user_base[0]['uid']}'", " 1 LIMIT 1" );
            $insert_result = $this->db->insert( 'user_base', $user_base[0] );
            if( ! $del_result || ! $insert_result || ! $this->db->db->commit() ){
                $this->db->db->rollback();
                $this->db->db->autocommit(TRUE);
            }
            $this->db->db->autocommit(TRUE);
        }
        $user_ex = $this->db->select( "uex_{$user_base[0]['uex']}", '*', "uid='{$user_base[0]['uid']}'", '', 1 );
        $user_ex[0]['dm_level'] = $this->getUserDmLevel( $user_base[0]['uid'] );
        $user = array_merge( $user_base[0], $user_ex[0] );
        // 更新 四个 redis KEY
        $this->updateUserRedis( $user );
        return $user;
       
    }

    /*
     * 更新用户
     * 1. 更新热表
     * 2. 更新redis
     *
     * 参数举例 $user=array('uid'=>1) $info=array('upwd'=>'abcd123');
     * */
    function updateUser( $user=array(), $info=array() ){
        $_wh = $user['uname'] ? $user['uname'] : ( $user['uphone'] ? $user['uphone'] : ( $user['uemail'] ? $user['uemail'] : '' ) );
        $_user = $this->getUser( $_wh, $user['uid'] );
        if( ! $_user ) return -1;
        $base = $ex = array();
        foreach( $info as $k => $v ){
            // uid uex 禁止通过程序更新
            if( in_array( $k, array('uid', 'uex', 'usalt') ) ){
                continue;
            }
            if( in_array( $k, $this->base_column ) ){
                // 密码要跟usalt二次md5
                if( $k=='upwd' ){
                    $v = md5( md5( $_user['usalt'].$v ) );
                }
                $base[$k] = $v;
            }
            elseif( in_array( $k, $this->ex_column ) ){
                $ex[$k] = $v;
            }
            $_user[$k] = $v;//更新到用户对象变量 为后边的redis更新做准备
        }
        // ->db 自定义数据库对象 ->db->db mysqli对象
        
        $this->db->use_db( 'write' );
        $this->db->db->autocommit(FALSE);
        $base_result = $ex_result = true;
        if( ! empty($base) ){
            $base_result = $this->db->update( 'user_base', $base, "uid='{$_user['uid']}'" );
        }
        if( ! empty($ex) ){
            $ex_result = $this->db->update( "uex_{$_user['uex']}", $ex, "uid='{$_user['uid']}'" );
        }
        if( ! $base_result || ! $ex_result || ! $this->db->db->commit() ){
            $this->db->db->rollback();
            $this->db->db->autocommit(TRUE);
            return false;
        }
        $this->db->db->autocommit(TRUE);
        // 更新 四个 redis KEY
        $this->updateUserRedis( $_user );
        return true;
    }

    /*
     * 新增用户
     * 1. 插入热表+扩展表
     * 2. 写注册日志
     * 3. 插入redis
     * */
    function addUser( $info=array() ){
        if( empty( $info ) ) return false;
        $_u = $info['uname'] ? $info['uname'] : ( $info['uphone'] ? $info['uphone'] : ( $info['uemail'] ? $info['uemail'] : $info['ufb'] ) );
        $_user = $this->getUser( $_u );
        if( $_user ) return -2;//已存在
        $_user = $base = $ex = array();
        $base['usalt'] = $_user['usalt'] = $this->generate_rand_character( 8 );
        $_user['uex'] = $this->default_ex;
        foreach( $info as $k => $v ){
            if( in_array( $k, $this->base_column ) ){
                // 密码要跟usalt二次md5
                if( $k=='upwd' ){
                    $v = md5( md5( $_user['usalt'].$v ) );
                }
                if( $k=='ufb' ){
                    $v = $v;
                }
                $base[$k] = $v;
            }
            elseif( in_array( $k, $this->ex_column ) ){
                $ex[$k] = $v;
            }
            $_user[$k] = $v;//更新到用户对象变量 为后边的redis更新做准备
        }
        $this->db->use_db( 'write' );
        $this->db->db->autocommit(FALSE);
        if( ! empty($base) ){
            $_result = $this->db->insert( 'user_base', $base );
            if( ! $_result ){
                $this->db->db->rollback();
                return false;
            }
            // 拿到关联的uid
            $ex['uid'] = $_user['uid'] = $this->db->next_id();
        }
        if( ! empty($ex) ){
            $_user['uregtime'] = $ex['uregtime'] = time();
            $this->db->insert( "uex_{$_user['uex']}", $ex );
        }
        /* 注册日志 */
        $_reglog['regip'] = $this->getIp();
        if( ! $_reglog['regip'] ) $_reglog['regip'] = '0.0.0.0';
        $_reglog['reglogtime'] = time();
        $_reglog['cid'] = $_user['cid'];
        $_reglog['uid'] = $_user['uid'];
        $_result = $this->db->insert( 'reglog', $_reglog );
        if( ! $this->db->db->commit() ){
            $this->db->db->rollback();
            $this->db->db->autocommit(TRUE);
            return false;
        }
        $this->db->db->autocommit(TRUE);
        // 更新 四个 redis KEY
        $this->updateUserRedis( $_user );
        // 默认注册后登录
        $_SESSION["user"] = $_user;
        return true;
    }
    /*
     * 更新 用户相关的四个 redis KEY
     */

    private function updateUserRedis( $user ){
        $this->redis->use_redis( 'write' );
        $_user = json_encode( $user );
        $this->redis->redis->set( "user:{$user['uid']}", $_user, 86400*30 );
        if( $user['uname'] ){
            $this->redis->redis->set( "user:{$user['uname']}", $_user, 86400*30 );
        }
        if( $user['uphone'] ){
            $this->redis->redis->set( "user:{$user['uphone']}", $_user, 86400*30 );
        }
        if( $user['uemail'] ){
            $this->redis->redis->set( "user:{$user['uemail']}", $_user, 86400*30 );
        }
    }

    /*
     * 登录
     * 1. 验证密码
     * 2. 写入SESSION
     * 3. 写入登录日志
     */
    function login( $u, $upwd, $md5ed=0 ){
        if( ! $u || ! $upwd ) return -1;
        $_user = $this->getUser( $u );
	
	
        if (empty($_user['usalt'])) {
        	require_once "./BbsOldPasswordAuto.php";
        	$BbsOldPasswordAuto = new BbsOldPasswordAuto();
        	$hash = $BbsOldPasswordAuto -> phpbb_check_hash($upwd, $_user['upwd']);
        	return $hash ? true : false ;
		//return $_user;
        }

        if( ! $_user ) return -2;
        if( $md5ed==0 ){
            $_pwd = md5( md5( $_user['usalt'].$upwd ) );
        }
        else{
            $_pwd = md5( $upwd );
        }
        if( $_pwd != $_user['upwd'] ){
            return false;
        }
        $_SESSION["user"] = $_user;
        /* 写入登录日志 */
        $_loginlog['loginip'] = $this->getIp();
        $_loginlog['loginlogtime'] = time();
        $_loginlog['uid'] = $_user['uid'];
        $this->db->use_db( 'write' );
        $loginlog_result = $this->db->insert( 'loginlog', $_loginlog );
        //var_dump( $loginlog_result );
        //echo $this->db->sql;
        return true;
    }

    /*
     * 同步到 BBS
     * 1. 写入到 bbs 服务数据库
     * 2. 更新 扩展表的 ubbspwd 字段(会自动更新redis)
     */
    function syncBbs( $uinfo ){
        if( $uinfo['ubbspwd'] ) return -1;
        if( !$uinfo['uid'] || !$uinfo['uname'] ) return -2;
        $ubbspwd = md5( $this->generate_rand_character(8) );
        $bbsinfo = array( 'uid'=> $uinfo['uid'], 'username'=>$uinfo['uname'], 'password'=>$ubbspwd, 'regdate'=>time() );
        $update_result = $this->updateUser( $uinfo, array('ubbspwd'=>$ubbspwd) );
        if( ! $update_result ){
            return -3;
        }
        $this->db->use_db( 'bbs' );
        $bbs_result = $this->db->insert( 'pre_common_member', $bbsinfo );
        if( ! $bbs_result ){
            return -4;
        }
        /* 积分表 初始化数据 */
        $bbs_result2 = $this->db->insert( 'pre_common_member_count', array('uid'=>$uinfo['uid']) );
        $_SESSION['user']['ubbspwd'] = $ubbspwd;
        return true;
    }

    /**
     * @function generate_rand_character
     * 
     * @param int $length 随机字符串长度
     * @param int $base_str 基础字符集
     * @return  string 随机字符串
     */
    public function generate_rand_character($length=10,$base_str='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'){
        if(!$length) $length=10;
        if(!$base_str) $base_str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $max = strlen($base_str) - 1;
        mt_srand( (double) microtime()*1000000 );
        for($i=0; $i<$length; $i++)
        {
            $hash .= $base_str[mt_rand(0, $max)];
        }

        return $hash;
    } 
    /**
     * 获取客户IP地址
     */
    function getIp(){
        $ip=false;
        if(!empty($_SERVER["HTTP_CLIENT_IP"])){
            $ip = $_SERVER["HTTP_CLIENT_IP"];
        }
        if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ips = explode (", ", $_SERVER['HTTP_X_FORWARDED_FOR']);
            if ($ip) { array_unshift($ips, $ip); $ip = FALSE; }
            for ($i = 0; $i < count($ips); $i++) {
                if (!preg_match ("/^(10|172\.16|192\.168)\./", $ips[$i])) {
                    $ip = $ips[$i];
                    break;
                }
            }
        }
        return ($ip ? $ip : $_SERVER['REMOTE_ADDR']);
    }
    /**
     *  获取设备信息
     */
    function getDevice($uid=0, $device_uuid=''){
        if( empty($uid) && empty($device_uuid) ){
            return -1;
        }
        $_wh = '';
        if( $uid ){
            $_wh .= " AND uid='{$uid}'";
        }
        if( $device_uuid ){
            $_wh .= " AND device_uuid='{$device_uuid}'";
        }
        $this->db->use_db( 'read' );
        $_sql = "SELECT * FROM device WHERE 1=1 {$_wh} LIMIT 1";
        $device = $this->db->query( $_sql );
        return $device[0];
    }
    /**
     * 用户绑定设备
     */
    function addDevice($uid=0, $device_uuid='', $device_sys='', $device_ver=''){
        if( empty($uid) || empty($device_uuid) || empty($device_sys) ){
            return -1;
        }
        $exist = $this->getDevice( $uid, $device_uuid );
        if( is_array($exist) ){
            return -2;
        }
        $this->db->use_db( 'write' );
        $add_result = $this->db->insert( 'device', array(
            'uid'=>$uid,
            'device_uuid'=>$device_uuid,
            'device_sys'=>$device_sys,
            'device_ver'=>$device_ver,
            'device_addtime'=>time(),
            ) );
        return $add_result;
    }

    function getUicoDir( $user ){
    /* 头像存放的目录初始编排规则为 uico/{$user.ex}/[substr(md5({$user.uid}),-2)]/
     * 如uid=1 的 md5值为 c4ca4238a0b923820dcc509a6f75849b,则其头像存放目录为 uico/aa/9b/ 数据库存的是 aa/9b/u1_[date('YmdHis')].jpg 这样的
     小头像为 small_u1_[date('YmdHis')].jpg */
        if( ! is_array($user) ) return false;
        return "{$user['uex']}/" . substr(md5($user['uid']), -2);
    }

    //计算校验串
    function calculFileCrc32( $filename ){
        $calculWay = 0;
        $fileSize = filesize( $filename );
        if( $fileSize > 1024*300 ){
            $calculWay = 1;
        }
        $crc32 = 0;
        if( $calculWay==0 ){
            $file_str = file_get_contents( $filename );
            $crc32 = crc32( $file_str );
        }
        else if($calculWay==1) {
            $file_handle = fopen( $filename, 'r' );
            $file_str = fread( $file_handle, 128*1024 );
            fseek( $file_handle, $fileSize-128*1024 );
            $file_str .= fread( $file_handle, 128*1024 );
            fclose( $file_handle );
            $crc32 = crc32( $file_str );
        }
        return $crc32;
    }

    //弹幕等级 如 主播 管理员 等等
    function getUserDmLevel( $uid ){
        if( empty($uid) ) return false;
        $redis_key = "dm_{$uid}";
        $this->redis->use_redis( 'dm_level' );
        $dm_level = $this->redis->redis->get( $redis_key );
        if( $dm_level ) return $dm_level;
        $this->db->use_db( 'read' );
        $dm_level = $this->db->select( 'user_dm_level', "uid,dm_level", "uid='{$uid}'", '', 1 );
        if( empty( $dm_level ) ) return 0;//默认
        $this->redis->redis->set( $redis_key, $dm_level[0]['dm_level'], 86400*30 );
        return $dm_level[0]['dm_level'];
    }
    
    function setUploadTime($user){
        $this->db->use_db( 'write' );
    	$t=time();
    	$this->db->insert('uppiclog',array('uid'=>$user['uid'],'uploadtime'=>$t,'uico'=>$user['uico']));
    	return true;
    }

    /*
     * GAMESDK 注册日志
     * */
    function addGameSdkRegLog($uid, $appid, $pb_str){
        $this->db->use_db( 'write' );
    	return $this->db->insert('gamesdk_reglog',array('uid'=>$uid,'appid'=>$appid,'user_info'=>$pb_str, 'time'=>time()));
    }

    /*
     * GAMESDK 登录日志
     * */
    function addGameSdkLoginLog($uid, $appid, $pb_str){
        $this->db->use_db( 'write' );
    	return $this->db->insert('gamesdk_loginlog',array('uid'=>$uid,'appid'=>$appid,'user_info'=>$pb_str, 'time'=>time()));
    }
    
    function transUserFromWarmToCold()
    {
    	/*查询超过半年未登录的用户*/
    	$t=time();
    	$e_t=$t-60*60*24*180;
    	$s_t=$t-60*60*24*181;
    	$userid= array();
    	
    	$sql = "select distinct(uid) from (select uid from loginlog where loginlogtime between {$s_t} and {$e_t}) as B";  //查询半年前一天到半年前登陆过的用户id
    	//$sql = "select max(loginlogtime),uid from loginlog group by uid";
    	//$sql = "select uid,loginlogtime from loginlog as A where A.loginlogtime between {$s_t} AND {$e_t} and  not exists(select 1 from loginlog where loginlog.uid = A.uid and loginlog.loginlogtime>A.loginlogtime)";
   
    	$user = $this->db->query($sql);
    	
    	foreach($user as $k=>$v){
    		//对于这些用户id，逐个判断半年内是否登陆过 
    		
    		$_sql = "select loginlogtime from loginlog where uid = {$v['uid']}";
    		$logintime = $this->db->query($_sql);
    		$flag = true;
    		foreach ($logintime as $key => $val){ //循环判断是否登陆过
    			if($val['loginlogtime']>$e_t){ 
    				$flag = false;
    				break;
    			}
    		}
    		if($flag){
    			array_push($userid,"{$v['uid']}");   //半年内未登陆的uid加入到$userid
    		}
    	}
    	
    	
    	//执行转移表流程
    	$this->db->use_db( 'write' );
    	$this->db->db->autocommit(FALSE);
    	
    	foreach($userid as $k=>$v){
    	
    		$_user = $this->db->select('user_base',"*","uid = {$v['uid']}",'','');
	    	$del_result = $this->db->del( 'user_base', "uid={$v['uid']}", " 1 LIMIT 1" );
	    	$insert_result=$this->db->insert('user_base_cold', $_user[0]);
	    	if( ! $del_result || ! $insert_result || ! $this->db->db->commit() ){
	    		$this->db->db->rollback();	    		
	    	}
    	}
    	$this->db->db->autocommit(TRUE);

    }
    
    
}
