<?php
/**
 * @author Hofai
 * @example BbsUserReturn.php
 * 
 * ++++++++++++++++++++++++++
 * A、app已经登陆的情况、BBS默认为登陆
 * 1、app登陆  保存值。同时
 * 2、shell 
 *  (12*200*2)+(5*2000) = 14800
 **/

//请求xmodgames app接口校检   数据返回

require_once "./REDIS.php";
require_once "./User.php";

class BbsUserReturn{
	
	public $safe_key;
	/**
	 *@example 初始化验证数据
	 *@access $safe_key 被加密的数据
	 *
	 **/
	function __construct(){
		$ciphertext = $_GET['ciphertext'];//echo $ciphertext;
		$this->CiphertextDeal($ciphertext);
	}
	
	function __destruct(){
		
	}
	
	/**
	 *调用User.php处理登陆
	 *@param String $string 加密后的字符串(含有账号密码)
	 **/
	function UserLoginReturn($string = array()){
		if ($string) {
			
		}else {
			echo json_decode($res);
		}
	}
	
	/**
	 * PC或者正常登陆
	 * @param String URL传入你参数   *.php?ciphertext=$code
	 * @param String $skey 解密KEY
	 * @return String
	 */
	function CheckAppLogin($string) {
		$obj = new User();
		$loginKey = $string['loginKey'];
		$login_str = $obj->redis->redis->get( $loginKey );//解码
	}
	
	/**
	 * 检测app是否已经登陆
	 * @param String $string = array
	 * @param String $skey 解密KEY
	 * @return json_encode("1") 登陆成功    json_encode("-1")  登陆失败
	 */
	function UserPcLogin($string) {
		$obj = new User();
		if ($obj -> login($string['acc'], $string['pwd'])) {
			echo json_encode("3");
		}else {
			echo json_encode("-1");
		}
	}
	
	/**
	 * Facebook登陆或者祖册处理
	 * UfbLoginOrRegister
	 * getUser true//返回数据值
	 * getUser true//返回数据值
	 **/
	function UfbLoginOrRegister($string) {
		$obj = new User();
		if ($obj -> getUser($string['ufb'])) {
			echo json_encode("3");
		}else{
			if ($obj -> addUser($string)){
				echo json_encode("999");//array_merge($obj -> getUser($string['ufb']), array('IsUfbRegister' => '1'))
			}
		}
	}
	
	/**
	 *论坛注册
	 * */
	function UcpRegister($string) {
		$obj = new User();
		if ($obj -> addUser($string)){
			echo json_encode($obj -> getUser($string['uname']));
		}
	}
	
	/**
	 *'SetUemail', 'unickname'=>'SetUnickname', 'upwd'=>'SetUpwd', 'uico'=>'SetUico'
	 *设置用户邮箱
	 **/
	function SetUnickname($string) {
		$obj = new User();
		$user = array('uid' => $string['uid']);
		unset($string['uid']);
		$info = $string;
		if($obj -> updateUser($user,$info)){
		echo json_encode($user);}
	}



	function SetMagna($string) {
		$obj = new User();
		$user = array('uid' => $string['uid']);
		
		//检查邮箱设置
		$email = $string['uemail'] ? $string['uemail'] : $string['newuemail'];
		if($email)$email_exit = $obj -> getUser($email);
		
		if (empty($email_exit)) {
			if(in_array('verify',array_keys($string))){//检查是否有邮箱，有的话就是发送
				$info = array('uemail' => $string['uemail'] ? $string['uemail'] : $string['newuemail'],'verify' => $string['verify'],'time' => time());
				$obj -> setRedisEmailQueue($info);
				unset($string['verify']);
			}
		
			if(empty($string['uid']) && empty($string['verify'])){
				echo json_encode("1");
			}else{
				unset($string['uid']);
				$info = $string;
				if($obj -> updateUser($user,$info)){
					$str = $obj -> getUser($user['uid']);
					echo json_encode($str);
				}
			}
		}else {
			echo json_encode("-1");
		}
	}



	function SetMagna0($string) {
		$obj = new User();
		$user = array('uid' => $string['uid']);
	//	file_put_contents( '/tmp/XXMGsendEmail.log', date('Y-m-d H:i:s ',time()) );	
		if(in_array('verify',array_keys($string))){//检查是否有邮箱，有的话就是发送
			//$info = array('uemail' => $user['uemail'],'verify' => 'forpwd_verify','time' => time());

			$info = array('uemail' => $string['uemail'] ? $string['uemail'] : $string['newuemail'],'verify' => $string['verify'],'time' => time());
			$obj -> setRedisEmailQueue($info);
			unset($string['verify']);
		}
	
		if(empty($string['uid']) && empty($string['verify'])){
			echo json_encode("1");
		}else{
			unset($string['uid']);
			$info = $string;
			if($obj -> updateUser($user,$info)){
				$str = $obj -> getUser($user['uid']);
				echo json_encode($str);
			}
		}
	
	//	unset($string['uid']);
	//	$info = $string;
	//	if($obj -> updateUser($user,$info)){
	//	$str = $obj -> getUser($user['uid']);
	//	echo json_encode($str);}
	}	
	/**
	 *返回用户信息
	 */
	function GetUserInfo($string) {
		$obj = new User();
		echo json_encode($obj -> getUser($string['username']));
	}
	
	/**
	 * 密文解密后处理
	 *@param String $string 解码后的密文     email;name;action
	 **/
	function CiphertextDeal($string) {
		$citext = $this->decode($string);
		$citext = json_decode($citext, true);
		$method = $citext['action'];
		$this->$method($citext);
	}
	
	/**
	 * PC或者正常登陆 简单对称加密算法之解密
	 * @param String $string 需要解密的字串
	 * @param String $skey 解密KEY
	 * @return String
	 */
	function decode($string = '', $skey = '!$#%^%&^*&') {
	    $strArr = str_split(str_replace(array('O0O0O', 'o000o', 'oo00o'), array('=', '+', '/'), $string), 2);
	    $strCount = count($strArr);
	    foreach (str_split($skey) as $key => $value)
	        $key <= $strCount && $strArr[$key][1] === $value && $strArr[$key] = $strArr[$key][0];
	    return base64_decode(join('', $strArr));
	}
}
new BbsUserReturn;
