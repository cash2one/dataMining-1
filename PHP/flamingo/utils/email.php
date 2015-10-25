<?php

/* 
 * 1、XXMGuserAccount.php push 邮箱key
 * 2、sendEmail.sh文件定时执行email.php
 * 3、获取redis中的key	redisQueue 发邮件
 *  */

require_once dirname(dirname(__FILE__)) . "/include/config.inc.php";
require_once dirname(dirname(__FILE__)) . "/include/smarty_init.php";
require_once SYSDIR_UTILS. "/REDIS.php";

require_once dirname(dirname(__FILE__)) . "/PHPMailer/class.smtp.php";
require_once dirname(dirname(__FILE__)) . "/PHPMailer/class.phpmailer.php";
require_once "User.php";

if ($_GET['code']) {
	$email = new Email;	
	$code = $email->url_decode($_GET['code']);
	file_put_contents( '/tmp/XXMGsendEmail.log', date('Y-m-d H:i:s ',time()) . '  ' . $_GET['code'] . '  ' . 'register_verify() Succeed ' . "\n" , FILE_APPEND );	
	$code_arr = explode(';',$code);	
	$time_out = $code_arr[3] + (72*60*60);
	if ($code_arr[1] == 'register_verify') {
		if ($time_out > time()) {//72*60*60秒失效
			if ($email->register_verify($code_arr)) {
				$smarty->display(dirname(dirname(__FILE__)) . "/templates/registerSucceed.tpl");
				file_put_contents( '/tmp/XXMGsendEmail.log', date('Y-m-d H:i:s ',time()) . '  ' . $code_arr[0] . '  ' . 'register_verify() Succeed ' . "\n" , FILE_APPEND );
			}else{
				file_put_contents( '/tmp/XXMGsendEmail.log', date('Y-m-d H:i:s ',time()) . '  ' . $code_arr[0] . '  ' . 'register_verify() Faill ' . "\n" , FILE_APPEND );
			}
		}else {
			$smarty->display(dirname(dirname(__FILE__)) . "/templates/registerTimeOut.tpl");
			file_put_contents( '/tmp/XXMGsendEmail.log', date('Y-m-d H:i:s ',time()) . '  ' . $code_arr[0] . '  ' . 'register_verify() Faill ' . "\n" , FILE_APPEND );
		}
	}elseif($code_arr[1] == 'forpwd_verify') {
		$smarty->assign("uemail", $code_arr[0]);
		file_put_contents( '/tmp/XXMGsendEmail.log', date('Y-m-d H:i:s ',time()) . '  ' . $code_arr[0] . '  ' . 'forpwd_verify page ' . "\n" , FILE_APPEND );
		$smarty->display(dirname(dirname(__FILE__)) . "/templates/changePassword.tpl");
	}
	exit();
}else if($_POST){
	$email = new Email;
	$code_arr = $email -> forpwd_verify($_POST);
	if (!$code_arr['error']) {
		$smarty->display(dirname(dirname(__FILE__)) . "/templates/changePasswordSucceed.tpl");
		file_put_contents( '/tmp/XXMGsendEmail.log', date('Y-m-d H:i:s ',time()) . '  ' . $_POST['uemail'] . '  ' . 'forpwd_verify() Succeed ' . "\n" , FILE_APPEND );
	}else {
		$smarty->assign("uemail", $code_arr[uemail]);
		$smarty->assign("error", $code_arr[error]);
		$smarty->display(dirname(dirname(__FILE__)) . "/templates/changePassword.tpl");
		file_put_contents( '/tmp/XXMGsendEmail.log', date('Y-m-d H:i:s ',time()) . '  ' . $_POST['uemail'] . '  ' . 'forpwd_verify() Faill ' . "\n" , FILE_APPEND );
	}
}else {
	$Email = new Email();
	$info = $Email->getRedisEmailQueue();
	print_r($info);//exit;
	echo $info->uemail.$info->verify;
	if ($info) {	
		if ($Email -> main($info->uemail,'',$info->verify)) {
			file_put_contents( '/tmp/XXMGsendEmail.log', date('Y-m-d H:i:s ',time()) . '  ' . $info->uemail . '  ' . $info->verify . ' Succeed ' . "\n" , FILE_APPEND );
		}else{
			file_put_contents( '/tmp/XXMGsendEmail.log', date('Y-m-d H:i:s ',time()) . '  ' . $info->uemail . '  ' . $info->verify . ' Faill ' . "\n" , FILE_APPEND );
		}
	}
}


/* 忘记密码修改 */

class Email{

	public $mail;
	public $address;
	public $url;
	public $code;
	public $redis;
	
	function __construct(){
		$this->redis = new myRedis();
		$this->redis->use_redis( 'write' );
	}
	
	function __destruct(){}

	//去除所     队列的值
	//lrange redisEmailQueue 0 -1
	//rPop redisEmailQueue
	
	//获取redis 
	
	function getRedisEmailQueue( $num = 0 ) {
		for ( $i = 0;  $i >= $num;  $i++) {
			$getQueue = $this->redis->redis->rPop( "redisEmailQueue" );
			return json_decode($getQueue);
		}
	}
	
	function main($email,$res='',$action='register_verify') {
		$this->mail = new PHPMailer(); //建立邮件发送类
		$this->address = $email;
		$this->mail->IsSMTP(); // 使用SMTP方式发送
		$this->mail->Host = "smtp.126.com"; // 您的企业邮局域名
		$this->mail->SMTPAuth = true; // 启用SMTP验证功能
		$this->mail->Username = "hehui199135@126.com"; // 邮局用户名(请填写完整的email地址)
		$this->mail->Password = "banian@199135"; // 邮局密码
		$this->mail->From = "hehui199135@126.com"; //邮件发送者email地址
		$this->mail->AddAddress($this->address, "");//收件人地址，可以替换成任何想要接收邮件的email信箱,格式是AddAddress("收件人email","收件人姓名")
		if ( !$res ){
			$url_arr = $this->url_encode($this->address,$action);
			$res = $this->res_action($url_arr,$action);
		}
		$this->mail->FromName = $res['FromName'];
		$this->mail->Subject = $res['Subject']; //邮件标题
		$this->mail->Body = $res['Body']; //邮件内容
		$this->mail->AltBody = " "; //附加信息，可以省略
		if($this->mail->Send()){//
			return true;
		}else{
			return false;
		}
	}
	
	//邮箱地址加密函数
	public function url_encode($email,$action) {
		$hash = $this->generate_rand_character();
		$this->url = $email.';'.$action.';'.$hash.';'.time();
		$this->url = base64_encode($this->url);
		$this->url = "http://www.xmodgames.com/user/utils/email.php?code=$this->url";
		$this->redis->use_redis( 'write' );
		$this->redis->redis->set( "verCode_".$email.$hash, $hash, 30*60 );//30分钟过期
		$url_arr = array(
			'url' => $this->url,
			'hash' => $hash,
			'email' => $email,
		);
		
		return $url_arr;
	}
	
	//邮箱地址加密函数
	public function url_decode($url) {
		return base64_decode($url);
	}
	
	
	//请求事件操作
	function res_action($url_arr = array(),$action = 'register_verify') {
		if ($action == 'register_verify') {
			$newtime = date('M d, Y',(time()+(72*60*60)));
			$Body = "
				<div  style='width:100%;'>	
					<div class='Email' style='width:800px;border: 1px solid #D2D2D2;margin-left: auto;margin-right: auto;' >
						<div class='header' style='background: #0874B4;width:100%;'>
							<img src='http://www.xmodgames.com/user/templates/xmodgame.png' style='margin: 17px 20px;' />
						</div>
						<div class='content' style=''>
							<p style='margin-left: 15px;'>Dear {$url_arr['email']}:</p>
							<p style='margin-left: 15px;'>Thanks so much for joining Xmodgames!  <br />For retrieving password and information, you just need to confirm that we got your email right.</p>
							<p style='margin-left: 15px;'><a href='{$url_arr['url']}' target='_blank' style='margin-left: auto;margin-right: auto;background: none repeat scroll 0% 0% #549ECB;color: #FFF;border-radius: 5px;border: medium none;padding: 16px;display: block;width: 200px;font-size: 20px;text-align: center;text-decoration: none;' >Confirm</a></p>
							<br/>
							<p style='margin-left: 15px;'>1.In order to protect the security of your account , please complete the verification within 72 hours.The button will be invalid once you verified.</p>
							<p style='margin-left: 15px;'>2.Please verify as soon as possible, and this will be overdue on {$newtime}.
							After that day, you need to give us a request again in Xmodgames account to send the verification email.</p>
						</div>
						<div class='footer' style='background: #E6F1F7;width:100%;color:#0B72B4;font-size:14px;font-weight:bold;padding: 10px 0;'>
							&nbsp;&nbsp;Feel free to visit the following pages for more information about Xmodgames:<br />
							&nbsp;&nbsp;<a href='https://www.facebook.com/xmodgames' target='_blank' style='color:#0B72B4;text-decoration: none;'>https://www.facebook.com/xmodgames</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://www.xmodgames.com/' target='_blank' style='color:#0B72B4;text-decoration: none;'>http://www.xmodgames.com/</a><br />
							&nbsp;&nbsp;<a href='https://twitter.com/xmodgames' target='_blank' style='color:#0B72B4;text-decoration: none;' >https://twitter.com/xmodgames</a><br />
							&nbsp;&nbsp;If you have any questions or need assistance, please contact us at xmodgames@gmail.com
						</div>
					</div>	
				</div>
			";
			
			$res = array(
				'FromName' => 'XModGames',
				'Subject' => 'Xmodgames confirm your Email [System Mail DO NOT REPLY]', 
				'Body' => $Body,
			);
			
		}elseif ($action == 'forpwd_verify'){
			$Body = "
				<div  style='width:100%;'>	
					<div class='Email' style='width:800px;border: 1px solid #D2D2D2;margin-left: auto;margin-right: auto;' >
						<div class='header' style='background: #0874B4;width:100%;'>
							<img src='http://www.xmodgames.com/user/templates/xmodgame.png' style='margin: 17px 20px;' />
						</div>
						<div class='content' style=''>
							<p style='margin-left: 15px;'>Dear {$url_arr['email']}:</p>
							<p style='margin-left: 15px;'>Welcome to use  retrieve password function. <br />This time your verification code is:<strong style='color:red'>{$url_arr['hash']}</strong>. <br />Please enter this code in retrieve page within 30 minutes.</p>
							<p style='margin-left: 15px;'><a href='{$url_arr['url']}' target='_blank' >{$url_arr['url']}</a></p>
						</div>
						<div class='footer' style='background: #E6F1F7;width:100%;color:#0B72B4;font-size:14px;font-weight:bold;padding: 10px 0;'>
							&nbsp;&nbsp;Feel free to visit the following pages for more information about Xmodgames:<br />
							&nbsp;&nbsp;<a href='https://www.facebook.com/xmodgames' target='_blank' style='color:#0B72B4;text-decoration: none;'>https://www.facebook.com/xmodgames</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://www.xmodgames.com/' target='_blank' style='color:#0B72B4;text-decoration: none;'>http://www.xmodgames.com/</a><br />
							&nbsp;&nbsp;<a href='https://twitter.com/xmodgames' target='_blank' style='color:#0B72B4;text-decoration: none;' >https://twitter.com/xmodgames</a><br />
							&nbsp;&nbsp;If you have any questions or need assistance, please contact us at xmodgames@gmail.com
						</div>
					</div>
				</div>
			";

			$res = array(
					'FromName' => 'XModGames',
					'Subject' => 'Xmodgames password [System Mail DO NOT REPLY]',
					'Body' => $Body,
			);
			
		}
		
		return $res;
	}
	
	
	//注册验证register_verify
	function register_verify($arr) {
		$obj = new User();
		$user = $obj->getUser($arr[0]);//echo $user[uid];
		//file_put_contents('/tmp/test_zzzzzzzzzzzzzzzzzzzzzzzzzzid_'.$user['newuemail'].'_'.$user['uid'].'-'.$arr[0],$user);
		if( $user['newuemail'] ){
			$res = $obj->updateUser(array('uid'=>$user[uid]), array('email_verify'=>'1','uemail'=>$user[newuemail],'newuemail'=>''));
		}else{
			$res = $obj->updateUser(array('uid'=>$user[uid]), array('email_verify'=>'1'));
		}
		
		if ($res) {
			return true;
		}
	}
	
	//忘记密码验证
	function forpwd_verify($post_arr) {
		if ( $post_arr['pwd'] == $post_arr['apwd'] ) {
				$token = "^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d]{6,16}$";
				
				if (  strlen($post_arr['pwd']) >= 6 && preg_match($token) && strlen($post_arr['pwd']) <= 16 ) {
				$verCode = "verCode_".$post_arr['uemail'].$post_arr['code'];
				$red_code = $this->redis->redis->get( $verCode );
				if ( $red_code ) {
					if ( $red_code == $post_arr['code'] ) {
						$obj = new User();//echo '3';
						$user = $obj->getUser($post_arr['uemail']);//echo $user['uid'];file_put_contents('/tmp/test_id_'.$post_arr['uemail'].'_'.$user['uid'],$user);
						$res = $obj->updateUser(array('uid'=>$user['uid']), array('upwd'=>$post_arr['pwd']));
						if ($res) {
							return true;
						}
					}else{
						return array( 'error'=>'ERROR:The verification code is incorrect , please request again.', 'uemail'=>$post_arr['uemail'] );
					}
				}else {
					return array( 'error'=>'ERROR:Your verification code has failed , please request again.', 'uemail'=>$post_arr['uemail'] );
				}
			}else {
				return  array( 'error'=>'ERROR:6-16 letters or numbers,case sensitive.', 'uemail'=>$post_arr['uemail'] );
			}			
		}else {
			return  array( 'error'=>'ERROR:The new password is inconsistent.', 'uemail'=>$post_arr['uemail'] );
		}
	}
	
	//生成验证码
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
}
