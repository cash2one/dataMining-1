<?php
/*
 * XX UC 改进类
 * 用户同步注册 同步登录 同步退出 同步密码
 * author: huasong
 * */
require_once dirname(dirname(__FILE__)) . "/include/config.php";

class BBS
{
    function __construct(){
        /*
         * UC/BBS不允许直接注册 
         * UC的uid与自有用户中心的一致
         * 登录/注册/修改密码 连接到自有用户中心
         * 用户中心在注册/登录时判断来源是UC/BBS时才调用这里去通知
         * 登录 主要写2个cookie saltkey 与 auth .
         * 1. 产生 1saltkey 随机8个值
         * 2. 产生 2authkey md5( ['config']['security']['authkey'] . 1saltkey );
         * 3. 产出authcode的 KEY 用 md5( md5( 2authkey ) ) 来达到
         *
         * source/class/discuz/discuz_application.php 267 saltkey 随机产生 ['config']['security']['authkey'] 来自 /config/config_global.php
         * api/uc.php  是使用 ./source/function/function_core.php 里边的authcode来加密
         * api/uc.php synlogin 里的 authcode 使用的 key 来自于 source/class/discuz/discuz_application.php 270 产生
         *
         */
    }

    /*
     * 同步登录
     */
    function syncLoginUc($uinfo){
        if( $uinfo['ubbspwd']=='' ) return false;
        global $UC_CONFIG;
        switch ( $UC_CONFIG['sync_method'] ){
        case 1:
            // 1. 可以直接设置cookie 同一个域名下
            //setcookie( $UC_CONFIG['cookiepre'].'sid', '', time()+31536000, '/', '.xxzhushou.com');
            //setcookie( $UC_CONFIG['cookiepre'].'auth', $this->authcode("46c8a44bd6e7837b4d4b664f0c10980d\t$uinfo[uid]", 'ENCODE', $UC_CONFIG['authkey']), time()+31536000, '/', '.xxzhushou.com');
            $saltkey = $_COOKIE[ $UC_CONFIG['cookiepre'].'saltkey' ];
            if( empty($saltkey) ){
                setcookie( $UC_CONFIG['cookiepre'].'saltkey', '', time()+31536000, '/', '.xxzhushou.cn' );//先置空 再赋值 否则BBS那边的已存在的值有优先级
                $saltkey = 'x'.rand(0,9).'e'.rand(0,9).'Ad'.rand(10,99);
                setcookie( $UC_CONFIG['cookiepre'].'saltkey', $saltkey, time()+31536000, '/', '.xxzhushou.cn' );
            }
            // pwd 得用论坛用户表对应的字段
            // $password = md5(random(10));
            $KEY = md5( md5( $UC_CONFIG['security_authkey'].$saltkey ) );
            setcookie( $UC_CONFIG['cookiepre'].'auth', $this->fc_authcode("{$uinfo['ubbspwd']}\t{$uinfo['uid']}", 'ENCODE', $KEY ), time()+31536000, '/', '.xxzhushou.cn' );
            return true;
            break;

        case 2:
            // 2. 输出JS给浏览器去请求接口
            $time = time();
            //'.$app['url'].'/api/'.$app['apifilename'].'?time='.$this->time.'&code='.urlencode($this->authcode('action=synlogin&username='.$this->user['username'].'&uid='.$this->user['uid'].'&password='.$this->user['password']."&time=".$this->time, 'ENCODE', $app['authkey'])).'
            $code = urlencode( $this->authcode('action=synlogin&username='.$uinfo['uname'].'&uid='.$uinfo['uid'].'&password='."&time=".$time, 'ENCODE', $UC_CONFIG['authkey']) );//密码为空
            $url = $UC_CONFIG['api_url']."?time={$time}&code={$code}";
            return $url;
            //echo $url,"<br>";
            //$response = $this->makeRequest( $url );
            //if( $response['code']!='200' ) return false;
            //return true;
            break;
        }
    }
    /*
     * 同步退出
     */
    function syncLogoutUc(){
        // 设置cookie
        setcookie( $UC_CONFIG['cookiepre'].'auth', '', time()-86400, '/', '.xxzhushou.cn' );
        return true;
    }

    /*
     * "同步注册" 写需要激活的cookie
     * 点击BBS的相关链接来激活 该链接代码要重写
     */
    function syncReg($uinfo){
        //1. 设置cookie
        //setcookie('activationauth', $this->authcode($uinfo['uname'], 'ENCODE', $UC_CONFIG['authkey']), time()+31536000, '/', '.xxzhushou.com');
        //return true;
        //2. 请求接口或者直接连接数据库 写入到BBS的 pre_commen_member 表, 主要是uid username password 字段,其中password要更新在用户中心的库里，同步登录的时候要用到
        require_once SYSDIR_UTILS . '/User.php';//业务层可直接调用User的类
        $user_obj = new User();
        return $user_obj->syncBbs( $uinfo );
    }


    /*
     * CURL发送请求
     */
    function makeRequest($url, $argument = array(), $ttl = 5, $method = "GET", $cookie='', $follow=0){

        if (!$url) {
            throw new LogicException('$url不能为空');
        }

        if (substr($url, 0, 7) != 'http://' && substr($url, 0, 8) != 'https://') {
            return array('result' => NULL, 'code' => '400');
        }
        if ($method == 'GET' && count($argument) > 0) {
            $url .= "?" . (http_build_query($argument));
            //echo $url;
        }
        $header = array(
            'Accept-Language: zh-cn,zh;q=0.8',
            'Connection: Keep-alive',
            'Cache-Control: max-age=0'
        );

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        if ($method == 'POST') {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $argument);
        }
        if( file_exists($cookie) ){
            curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie);
            curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie);
        }
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, $ttl);
        curl_setopt($ch, CURLOPT_USERAGENT, 'SYNC .xxzhushou.cn');
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        if( $follow==1 ){
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION,1);
        }
        $return = array();
        $return['result'] = curl_exec($ch);
        $return['code'] = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        unset($ch);

        return $return;

    }
    /*
     * 来自 source/function/function_core.php
     * */
    function fc_authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {
        $ckey_length = 4;
        //$key = md5($key != '' ? $key : getglobal('authkey'));
        $keya = md5(substr($key, 0, 16));
        $keyb = md5(substr($key, 16, 16));
        $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

        $cryptkey = $keya.md5($keya.$keyc);
        $key_length = strlen($cryptkey);

        $string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
        $string_length = strlen($string);

        $result = '';
        $box = range(0, 255);

        $rndkey = array();
        for($i = 0; $i <= 255; $i++) {
            $rndkey[$i] = ord($cryptkey[$i % $key_length]);
        }

        for($j = $i = 0; $i < 256; $i++) {
            $j = ($j + $box[$i] + $rndkey[$i]) % 256;
            $tmp = $box[$i];
            $box[$i] = $box[$j];
            $box[$j] = $tmp;
        }

        for($a = $j = $i = 0; $i < $string_length; $i++) {
            $a = ($a + 1) % 256;
            $j = ($j + $box[$a]) % 256;
            $tmp = $box[$a];
            $box[$a] = $box[$j];
            $box[$j] = $tmp;
            $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
        }

        if($operation == 'DECODE') {
            if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
                return substr($result, 26);
            } else {
                return '';
            }
        } else {
            return $keyc.str_replace('=', '', base64_encode($result));
        }
    }


    /*
     * 来自 uc_server/model/base.php
     */

    function uc_authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {

        $ckey_length = 4;

        $key = md5($key ? $key : UC_KEY);
        $keya = md5(substr($key, 0, 16));
        $keyb = md5(substr($key, 16, 16));
        $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

        $cryptkey = $keya.md5($keya.$keyc);
        $key_length = strlen($cryptkey);

        $string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$s;
        $string_length = strlen($string);

        $result = '';
        $box = range(0, 255);

        $rndkey = array();
        for($i = 0; $i <= 255; $i++) {
            $rndkey[$i] = ord($cryptkey[$i % $key_length]);
        }

        for($j = $i = 0; $i < 256; $i++) {
            $j = ($j + $box[$i] + $rndkey[$i]) % 256;
            $tmp = $box[$i];
            $box[$i] = $box[$j];
            $box[$j] = $tmp;
        }

        for($a = $j = $i = 0; $i < $string_length; $i++) {
            $a = ($a + 1) % 256;
            $j = ($j + $box[$a]) % 256;
            $tmp = $box[$a];
            $box[$a] = $box[$j];
            $box[$j] = $tmp;
            $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
        }

        if($operation == 'DECODE') {
            if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
                return substr($result, 26);
            } else {
                return '';
            }
        } else {
            return $keyc.str_replace('=', '', base64_encode($result));
        }
    }

    /*
     * 来自 uc_client/model/base.php
     */
    function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {

        $ckey_length = 4;   // 随机密钥长度 取值 0-32;
        // 加入随机密钥，可以令密文无任何规律，即便是原文和密钥完全相同，加密结果也会每次不同，增大破解难度。
        // 取值越大，密文变动规律越大，密文变化 = 16 的 $ckey_length 次方
        // 当此值为 0 时，则不产生随机密钥

        $key = md5($key ? $key : UC_KEY);
        $keya = md5(substr($key, 0, 16));
        $keyb = md5(substr($key, 16, 16));
        $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

        $cryptkey = $keya.md5($keya.$keyc);
        $key_length = strlen($cryptkey);

        $string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
        $string_length = strlen($string);

        $result = '';
        $box = range(0, 255);

        $rndkey = array();
        for($i = 0; $i <= 255; $i++) {
            $rndkey[$i] = ord($cryptkey[$i % $key_length]);
        }

        for($j = $i = 0; $i < 256; $i++) {
            $j = ($j + $box[$i] + $rndkey[$i]) % 256;
            $tmp = $box[$i];
            $box[$i] = $box[$j];
            $box[$j] = $tmp;
        }

        for($a = $j = $i = 0; $i < $string_length; $i++) {
            $a = ($a + 1) % 256;
            $j = ($j + $box[$a]) % 256;
            $tmp = $box[$a];
            $box[$a] = $box[$j];
            $box[$j] = $tmp;
            $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
        }

        if($operation == 'DECODE') {
            if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
                return substr($result, 26);
            } else {
                return '';
            }
        } else {
            return $keyc.str_replace('=', '', base64_encode($result));
        }
    }

}
