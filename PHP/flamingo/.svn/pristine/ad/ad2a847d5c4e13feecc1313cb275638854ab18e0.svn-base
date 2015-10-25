<?php
/*
 * XX用户类 增改查
 * author: huasong
 * */

//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";
require_once SYSDIR_UTILS. "/REDIS.php";

class Sms
{
    /*TODO: uuid匹配 */
    public $redis;
    public $url;
    public $arr;
    public $log_dir;

    function __construct(){
        $this->redis = new myRedis();
        $this->redis->use_redis( 'write' );
        $this->url = 'http://si.800617.com:4400/SendSms.aspx';
        $this->arr = array(
            'un'=>'gzhln-1',
            'pwd'=>'6883e3',
        );
        $this->log_dir = '/data/logs/sms/'.date('ymd');
        if( ! file_exists( $this->log_dir ) ){
            @mkdir( $this->log_dir, 0777, true );
        }
    }
    function __destruct(){
        /*
         * 查询账号：gzhln、查询密码：7f0027
         * 平台地址：http://si.800617.com:8006/App/admin/logon.aspx 
         * 接口账号和密码如下：
         * 账户1　账号：gzhln-1，密码：6883e3
         * */
    }

    /*
     * 发送短信
     * -1 尚在发送间隔内 60s
     */
    function sendSms( $phone_num , $type, $str='' )
    {
        $redisKey = $phone_num."_".$type;
        if( $sms_sended = $this->redis->redis->get( $redisKey ) ){
            $sms_arr = json_decode( $sms_sended, true );
            if( abs(time()-$sms_arr['t'])<=120 ){//上一次发送的尚在时限内
                return -1;
            }
        }
        $redisDateCountKey = $phone_num."_".date('ymd')."_count";
        if( $sms_date_count = $this->redis->redis->get( $redisDateCountKey ) ){
            if( $sms_date_count>=6 ){//一个号 一天 10条
                return -2;
            }
        }
        else{
            $sms_date_count = 0;
        }
        //TODO 一定时间内限制N次
        $code = rand(100000, 1000000);
        if( $type!=999 ){// 999 后台发送
            $str = "{$code} (果盘".( $type==101 ? '注册' : ( $type==102 ? '绑定' : ( $type==103 ? '找回或修改密码' : '其他' ) ) )." 验证码 请勿泄露)【果盘】";
        }
        //echo strlen( $str ),"\n";
        $this->arr['mobile'] = $phone_num;
        $this->arr['msg'] = iconv( 'UTF-8', 'GB2312', $str );
        //echo strlen( $this->arr['msg'] ),"\n";
        require_once SYSDIR_INCLUDE. "/global.php";
        $result = makeRequest( $this->url, $this->arr, 10 , 'GET' );
        if( strpos( $result['result'], 'result=1&' )!==false ){//成功
            $sms_arr['t'] = time();
            $sms_arr['code'] = $code;
            $sms_arr['type'] = $type;
            $sms_arr['status'] = 1;//已发送
            $this->redis->redis->set( $redisKey, json_encode( $sms_arr ), 3600 );
            $sms_date_count+=1;
            $this->redis->redis->set( $redisDateCountKey, $sms_date_count, 86400 );
            //写入文件日志
            $file = "{$phone_num}.txt";
            $str = "{$type}\t{$code}\t1\t{$sms_arr['t']}\n";
            @file_put_contents( $this->log_dir."/{$file}", $str, FILE_APPEND );

            return true;
        }
        else{
            $file = "{$phone_num}_err.txt";
            $str = "{$type}\t{$code}\t{$result['result']}\t{$sms_arr['t']}\n";
            @file_put_contents( $this->log_dir."/{$file}", $str, FILE_APPEND );
            
            return false;
        }
    }

    /*
     * 验证
     */
    function verifySmsCode( $phone_num, $type, $code ){
        $redisKey = $phone_num."_".$type;
        $sms_json = $this->redis->redis->get( $redisKey );
        if( ! $sms_json ){
            return -1;
        }
        $sms_arr = json_decode( $sms_json, true );
        if( abs(time()-$sms_arr['t'])>10*60 ){ // 有效期 十分钟
            return -2;
        }
        if( $code!=$sms_arr['code'] ){
            //写入文件日志
            $t = time();
            $file = "{$phone_num}.txt";
            $str = "{$type}\t{$code}\t-2\t{$t}\n";
            @file_put_contents( $this->log_dir."/{$file}", $str, FILE_APPEND );

            return false;
        }
        if( $sms_arr['status']==2 ){//已验证过
            return -3;
        }
        if( $sms_arr['status']==3 ){//已被使用
            return -4;
        }
        $sms_arr['status'] = 2; //已验证
        $this->redis->redis->set( $redisKey, json_encode( $sms_arr ), 3600 );

        //写入文件日志
        $t = time();
        $file = "{$phone_num}.txt";
        $str = "{$type}\t{$code}\t2\t{$t}\n";
        @file_put_contents( $this->log_dir."/{$file}", $str, FILE_APPEND );

        return true;
    }

    /*
     * 设置验证码状态
     */
    function setSmsCodeStatus( $phone_num, $type, $status ){
        $redisKey = $phone_num."_".$type;
        $sms_json = $this->redis->redis->get( $redisKey );
        if( ! $sms_json ){
            return -1;
        }
        $sms_arr = json_decode( $sms_json, true );
        $sms_arr['status'] = $status;
        $this->redis->redis->set( $redisKey, json_encode( $sms_arr ), 3600 );

        //写入文件日志
        $t = time();
        $file = "{$phone_num}.txt";
        $str = "{$type}\t{$sms_arr['code']}\t{$status}\t{$t}\n";
        @file_put_contents( $this->log_dir."/{$file}", $str, FILE_APPEND );

        return true;
    }

}
