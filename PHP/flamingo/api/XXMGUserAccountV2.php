<?php
/**
 * ++++++++++++++++++++++++++xmodgaems账号协议接口+++++++++++++++++++++++++++++
 * xmodgaems账号协议
 * 注册请求XXMGAccountRegisterReq
 * 注册应答XXMGAccountRegisterRes
 *  
 * 检查邮箱、昵称唯一性请求XXMGAccountVerfityAccountReq
 * 检查邮箱、昵称唯一性应答XXMGAccountVerfityAccountRes
 *
 * 统一登录登出请求XXMGAccountUnityLoginReq*****
 * 统一登录登出应答XXMGAccountUnityLoginRes*****
 * 
 * 获取我的信息请求XXMGAccountInfoReq
 * 获取我的信息应答XXMGAccountInfoRes
 * 
 * 修改我的信息请求XXMGAccountInfoModifyReq
 * 修改我的信息应答XXMGAccountInfoModifyRes
 * 
 * 修改密码请求XXMGAccountSetPwdReq
 * 修改密码请求XXMGAccountSetPwdRes
 * 
 * 忘记密码请求XXMGAccoutForgetPwdReq
 * 忘记密码请求XXMGAccoutForgetPwdRes
 * 
 * 
 * @author		FaiHo 
 * ++++++++++++++++++++++++++xmodgaems账号协议接口+++++++++++++++++++++++++++++
 **/
$date = date("Y-m-d h:i:s", time());
@file_put_contents( '/tmp/XXMGUserAccountV2.log', "\n\n++++++++++++++++++++++++++{$date}+++++++++++++++++++++++++++++\n", FILE_APPEND );
@file_put_contents( '/tmp/XXMGUserAccountV2.log', "xmodgaems账号协议接口\n", FILE_APPEND );
include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXPBBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXMGUserAccountV2.proto.php";
if( isset($_GET['appid'] ) ){//SDK
	$APPID = $_GET['appid'];
	$redis_config = 'write';
	include_once dirname(dirname(__FILE__)) . "/utils/XXServerBase.php";
}
else{
	$redis_config = 'write';
	include_once dirname(dirname(__FILE__)) . "/apiutils/XXServerBase.php";
}
$postData = getRequest();

// 数据打包返回
$response = new XXProto_XXUnityCSPkg();
$head = new XXProto_XXUnityCSPkgHead();
$head->setCmd(1604);
$response->setResult(0);//正常 默认
$response->setHead($head);
if($postData == ""){
	$response->setResult(1);//异常1 空包
	sendProtobufResponse($response);
	exit();
}
@file_put_contents( '/tmp/XXMGUserAccountV2.log', "程序执行功能开始\n", FILE_APPEND );
$XXUnityCSPkg = XXProto_XXUnityCSPkg::parseFromString($postData);
$head = $XXUnityCSPkg->getHead();
$body = $XXUnityCSPkg->getBody();
if( $head->getCmd()==1604 ){
	$uid = $head->getUin();
	$loginKey = $head->getLogin_key();
	//获取用户user_info
	//$version = $head->getVersion();
	$seq_num = $head->getSeq_num();
	$UserInfo = $head->getUser_info();	
	$uuid = $UserInfo->getUuid();
	$productID = $UserInfo->getProductID(); 
	$version = $UserInfo->getVersion(); 
	
	$XXMGuserAccount = XXProto_XXMGAccountProto::parseFromString( $body );
	$subcmd = $XXMGuserAccount->getSubcmd();
	$res_XXMGAccount = new XXProto_XXMGAccountProto();
	$res_XXMGAccount->setResult(0);//正常

	//++++++++++++++++++++++++++用户注册+++++++++++++++++++++++++++++
	if( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_REGISTERREQ ){
		@file_put_contents( '/tmp/XXMGUserAccountV2.log', "程开始注册\n", FILE_APPEND );
		$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_REGISTERRES );
		$XXMGAccountRegisterReq = $XXMGuserAccount->getRegister_req();	
		//获取用户信息
		$email = $XXMGAccountRegisterReq -> getEmail();
		$nick_name = $XXMGAccountRegisterReq -> getNick_name();
		$upwd = $XXMGAccountRegisterReq -> getPwd();		
		$File_object = $XXMGAccountRegisterReq -> getFile_object();//对象集合
		$fileID = $File_object->getID();
        
		if( $upwd=='' || $nick_name=='' || $email=='' ){
			$res_XXMGAccount->setResult(1999);//密码为空
		}elseif( $nick_name && preg_match( '/[,|*| ]/', $nick_name ) ){
			$res_XXMGAccount->setResult(1005);//用户名含非法字符
		}else{
			
			if( $res_XXMGAccount->getResult()==0 ){
				include_once dirname(dirname(__FILE__)) . "/utils/User.php";
				$obj = new User();
				//$nick_name_exist = $obj->getUser( $nick_name );//验证唯一
				//$email_exist = $obj->getUser( $email );//验证唯一	
							
				//if( $nick_name_exist ){
				//	$res_XXMGAccount->setResult(1007);
			//	}elseif ( $email_exist ){
			//		$res_XXMGAccount->setResult(1003);
			//	}else {
					$_user = array(
							'upwd' 		=>	 $upwd,
							'uemail' 	=>	 $email,
							'unickname' =>	 $nick_name,
					);
					if ($fileID) $_user['uico'] = $fileID;
					
					$reg_result = $obj->addUser( $_user );	
					if( $reg_result===true ){//注册成功、登陆并缓存
                        @file_put_contents( '/tmp/XXMGUserAccountV2.log', "注册成功、登陆并缓存\n", FILE_APPEND );
						$XXMGAccountUnityLoginRes = new XXProto_XXMGAccountUnityLoginRes();
						$XXMGAccountUnityLoginRes->setRequest_function(102);
						$user = $_SESSION['user'] ? $_SESSION['user'] : $obj->getUser( $email );
						if( $APPID ){//记录GameSdk注册日志
							$obj->addGameSdkRegLog( $user['uid'], $APPID, $UserInfo->serializeToString() );
						}
						$login_key = "Login_{$user['uid']}_".md5( $user['uid'].$uuid.$productID.time() );
						if( $APPID ){
							$login_key = "Login_{$user['uid']}_{$APPID}_".md5( $user['uid'].$uuid.$productID.time() );
						}
						@file_put_contents( '/tmp/XXMGUserAccountV2.log', "login_key:{$login_key}\n", FILE_APPEND );
						include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
						$login_data = new XXProto_XXRedisUnityLoginData();
						$login_data->setUin( $user['uid'] );
						$login_data->setUser_info( $UserInfo );
						$login_data->setCreateTime( time() );
						$login_data->setIp( ip2long($ip) );
						@file_put_contents( '/tmp/XXMGUserAccountV2.log', "login_data\n", FILE_APPEND );
						$obj->redis->use_redis($redis_config);
						$set_result = $obj->redis->redis->set( $login_key, $login_data->serializeToString(), 86400*30 );
						if( $set_result==true ){
							$XXMGAccountUnityLoginRes->setUin($user['uid']);
							$XXMGAccountUnityLoginRes->setSalt($user['usalt']);
							$XXMGAccountUnityLoginRes->setLoginKey($login_key);
						}else{//记录Redis失败 其他原因
							$res_XXMGAccount->setResult(1999);
						}
                        $XXMGAccountRegisterRes = new XXProto_XXMGAccountRegisterRes();
						$XXMGAccountRegisterRes->setUnity_login_res($XXMGAccountUnityLoginRes);
						$res_XXMGAccount->setRegister_res( $XXMGAccountRegisterRes );
						@file_put_contents( '/tmp/XXMGUserAccountV2.log', "setUnity_login_res\n", FILE_APPEND );
						$obj->redis->use_redis($redis_config);
						$ip_date_count += 1;
						$t = strtotime(date('Y-m-d', strtotime('+1 days'))) - time();
						$obj->redis->redis->set( "chatRegIpDateCount_{$md}_{$ip}", $ip_date_count, $t );
                        @file_put_contents( '/tmp/XXMGUserAccountV2.log', "chatRegIpDateCount_{$md}_{$ip}\n", FILE_APPEND );
						$res_XXMGAccount->setResult(0);
					}else{
						$res_XXMGAccount->setResult(1998);//注册失败
					}
				//}
			}
        }
	}
	//++++++++++++++++++++++++++检查邮箱、昵称唯一性+++++++++++++++++++++++++++++
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_VERFITYACCOUNTREQ ){
    	@file_put_contents( '/tmp/XXMGUserAccountV2.log', "检查邮箱、昵称唯一性\n", FILE_APPEND );
		$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_VERFITYACCOUNTRES );
		$XXMGVerfityAccoutReq = $XXMGuserAccount->getVerfity_accout_req();
		//获取传参进行校检
		$email = $XXMGVerfityAccoutReq -> getEmail();
		$nick_name = $XXMGVerfityAccoutReq -> getNick_name();
		if( $nick_name && preg_match( '/[,|*| ]/', $nick_name ) ){
			$res_XXMGAccount->setResult(1005);//用户名含非法字符
		}elseif ( !$email && !$nick_name ){
			$res_XXMGAccount->setResult(1999);
		}else {
			include_once dirname(dirname(__FILE__)) . "/utils/User.php";
			$obj = new User();			
			if ($nick_name) $nick_name_exist = $obj->getUser( $nick_name );//验证唯一
			if ($email) $email_exist = $obj->getUser( $email );//验证唯一
			$XXMGXXMGAccountVerfityAccountRes = new XXProto_XXMGAccountVerfityAccountRes();			
			
			if( $nick_name_exist ){
				$res_XXMGAccount->setResult(0);
			}elseif ( $email_exist ) {
				$res_XXMGAccount->setResult(0);
			}else {
				if (!$nick_name_exist) $XXMGXXMGAccountVerfityAccountRes -> setIs_nick_name_ok(1);
				if (!$email_exist) $XXMGXXMGAccountVerfityAccountRes -> setIs_email_ok(1);
				$res_XXMGAccount->setVerfity_accout_res($XXMGXXMGAccountVerfityAccountRes);
				$res_XXMGAccount->setResult(0);
			}
		}
	}
	//++++++++++++++++++++++++++统一登录登出+++++++++++++++++++++++++++++
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_UNITYLOGINREQ ){
    	@file_put_contents( '/tmp/XXMGUserAccountV2.log', "统一登录登出\n", FILE_APPEND );
		$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_UNITYLOGINRES );
		$XXMGLoginReq = $XXMGuserAccount->getLogin_req();
		$request_function = $XXMGLoginReq -> getRequest_function();
		$email = $XXMGLoginReq -> getEmail();
		$passwd = $XXMGLoginReq -> getPasswd();
		
		include_once dirname(dirname(__FILE__)) . "/utils/User.php";
		$obj = new User();
		$user = $obj->getUser( $email );
		$XXMGAccountUnityLoginRes = new XXProto_XXMGAccountUnityLoginRes();
		
		if( ! $user ) $res_XXMGAccount->setResult(1028);
		if( $request_function==101 ){//请求salt
    	@file_put_contents( '/tmp/XXMGUserAccountV2.log', "101请求salt\n", FILE_APPEND );
			$XXMGAccountUnityLoginRes->setRequest_function(101);
			if( $user ){
				$XXMGAccountUnityLoginRes->setSalt($user['usalt']);
				$res_XXMGAccount->setLogin_res($XXMGAccountUnityLoginRes);
				$res_XXMGAccount->setResult(1034);
			}
		}elseif ( $request_function==102 ) {//102登陆验证
    	@file_put_contents( '/tmp/XXMGUserAccountV2.log', "102登陆验证\n", FILE_APPEND );
			$XXMGAccountUnityLoginRes->setRequest_function(102);
			 
			$obj->redis->use_redis( $redis_config );
			// 1. 是否在IP黑名单 1030 chatLoginIpBlockHashT
			$ip = $obj->getIp();
			if( $obj->redis->redis->hExists( 'chatLoginIpBlockHashT', $ip ) ){
				$ip_over_time = $obj->redis->redis->hGet( 'chatLoginIpBlockHashT', $ip );
				if( $ip_over_time<=time() ){
					$obj->redis->redis->hDel( 'chatLoginIpBlockHashT', $ip );
				}else{
					$res_XXMGAccount->setResult(1030);
				}
			}
			
			// 2.用户设备是否在黑名单 1033 chatLoginUuidBlockHashT
			if( $obj->redis->redis->hExists( 'chatLoginUuidBlockHashT', $uuid ) ){
				$uuid_over_time = $obj->redis->redis->hGet( 'chatLoginUuidBlockHashT', $uuid );
				if( $uuid_over_time<=time() ){
					$obj->redis->redis->hDel( 'chatLoginUuidBlockHashT', $uuid );
				}else{
					$res_XXMGAccount->setResult(1033);
				}
			}
			// 3. 验证码 1027 TODO
			// 4. 检测用户状态
			if( $res_XXMGAccount->getResult()==0 ){
				if( $user['ustatus']==1029 ){//账号被冻结
					$res_XXMGAccount->setResult(1029);
				}elseif( $user['ustatus']==1031 ){//被列入黑名单（封号）
					$res_XXMGAccount->setResult(1031);
				}elseif( $passwd ){//检测密码   $v = md5( md5( $_user['usalt'].$v ) );
					if( md5( $passwd ) != $user['upwd'] ){
						$res_XXMGAccount->setResult(1026);
					}else{
						//写入KEY /*loginKeyHashT 废弃*/
						$login_key = "Login_{$user['uid']}_".md5( $user['uid'].$uuid.$productID.time() );
						if( $APPID ){
							$login_key = "Login_{$user['uid']}_{$APPID}_".md5( $user['uid'].$uuid.$productID.time() );
						}
						
						include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
						$login_data = new XXProto_XXRedisUnityLoginData();
						$login_data->setUin( $user['uid'] );
						$login_data->setUser_info( $userInfo );
						$login_data->setCreateTime( time() );
						$login_data->setIp( ip2long($ip) );
						 
						$obj->redis->use_redis($redis_config);
						$set_result = $obj->redis->redis->set( $login_key, $login_data->serializeToString(), 86400*30 );
                        @file_put_contents( '/tmp/XXMGUserAccountV2.log', "{$login_key} \n", FILE_APPEND );
						if( $set_result==true ){
							//删除旧的KEY
							if( $APPID ){
								$keys = $obj->redis->redis->keys( "Login_{$user['uid']}_{$APPID}_*" );
								//记录GameSdk注册日志
								$obj->addGameSdkLoginLog( $user['uid'], $APPID, $userInfo->serializeToString() );
							}else{
								$keys = $obj->redis->redis->keys( "Login_{$user['uid']}_*" );
							}
							foreach( $keys as $key ){
								if( $key != $login_key ){
									$obj->redis->redis->delete( $key );
								}
							}
							$XXMGAccountUnityLoginRes->setUin($user['uid']);
							$XXMGAccountUnityLoginRes->setLoginKey($login_key);
							$res_XXMGAccount->setLogin_res($XXMGAccountUnityLoginRes);
                            $res_XXMGAccount->setResult(0);	
                        }else{//登录失败 其他原因
							$res_XXMGAccount->setResult(1999);
						}
					}
				}
				else{//登录失败 其他原因
                    @file_put_contents( '/tmp/XXMGUserAccountV2.log', "检测密码错误 \n", FILE_APPEND );
					$res_XXMGAccount->setResult(1999);
				}
			}
		}else {//退出
    	@file_put_contents( '/tmp/XXMGUserAccountV2.log', "退出\n", FILE_APPEND );
			$XXMGAccountUnityLoginRes->setRequest_function(0);
			$login_str = $obj->redis->redis->get( $loginKey );
			if( ! $login_str ){
				$res_XXMGAccount->setResult(1004);//登陆状态已失效
			}
			else{
				include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
				$login_data = XXProto_XXRedisUnityLoginData::parseFromString($login_str);
				$loginKey_uin = $login_data->getUin();
				$loginKey_UserInfo = $login_data->getUser_info();
				$loginKey_createTime = $login_data->getCreateTime();
				if( $loginKey_uin!=$uid || $loginKey_UserInfo->getUuid()!==$userInfo->getUuid() || abs(time()-$loginKey_createTime)>86400*7 ){// 7天 ?
					$res_XXMGAccount->setResult(1004);//登陆状态已失效
				}
				$obj->redis->use_redis($redis_config);
				$result = $obj->redis->redis->delete( $loginKey );
				if( $result ){
					$res_XXMGAccount->setLogin_res($XXMGAccountUnityLoginRes);
					$res_XXMGAccount->setResult(0);//登出失败
				}else {
					$res_XXMGAccount->setResult(1998);//登出失败
				}
			}
		}
	}
	//++++++++++++++++++++++++++获取我的信息+++++++++++++++++++++++++++++
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_ACCOUNTINFOREQ ){
    	@file_put_contents( '/tmp/XXMGUserAccountV2.log', "获取我的信息\n", FILE_APPEND );
		$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_ACCOUNTINFORES );
		
		$AccountInfoReq = $XXMGuserAccount->getAccount_info_req();
		include_once dirname(dirname(__FILE__)) . "/utils/User.php";
		$obj = new User();
		$obj->redis->use_redis($redis_config);
		$login_str = $obj->redis->redis->get( $loginKey );
		if( ! $login_str ){
			$res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
		}
		else{
			include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
			$login_data = XXProto_XXRedisUnityLoginData::parseFromString($login_str);
			$loginKey_uin = $login_data->getUin();
			$loginKey_UserInfo = $login_data->getUser_info();
			$loginKey_createTime = $login_data->getCreateTime();
			if( $loginKey_uin!=$uid || $loginKey_UserInfo->getUuid()!==$UserInfo->getUuid() || abs(time()-$loginKey_createTime)>86400*7 ){// 7天 ?
				$res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
			}
		}
		
		if( $res_XXMGAccount->getResult()==0 ){
			$user = $obj->getUser( '', $uid );
			if( empty( $user ) ){
				$res_XXMGAccount->setResult(1998);//失败了
			}
			else{
				$user['dm_level'] = $obj->getUserDmLevel( $uid );
				$XXMGAccountInfoRes = new XXProto_XXMGAccountInfoRes();
				
				$XXMGAccountInfoRes->setNick_name( $user['unickname'] );
		
				$XXMGAccountInfoRes->setEmail( $user['uemail'] );
				$XXMGAccountInfoRes->setEmail_verfity( $user['email_verify'] ? $user['email_verify'] : '0' );//email_verfity
				$XXMGAccountInfoRes->setCountry( $user['country'] ? $user['country'] : '' );
		
				if( $user['uico'] ){
					$uico_dir = $obj->getUicoDir( $user );
					$abs_dir = SYSDIR_ROOT ."/uico/".$uico_dir;
					$file_name = substr( $user['uico'], (strrpos( $user['uico'], '/' )+1) );
					$abs_file = $abs_dir . '/' . $file_name;
					if( file_exists( $abs_file ) ){
						$head_icon = new XXProto_FileObject();
						$head_icon->setID(1);
						$head_icon->setUrl( $obj->uico_dpre . $user['uico'] );
						$head_icon->setFileType( strpos($user['uico'], 'png') ? 105 : 106 );//只允许 png jpg, 非此即彼
		
						$size = filesize( $abs_file );
						$checksum = $obj->calculFileCrc32( $abs_file );
						$head_icon->setSize( $size );
						$head_icon->setChecksum( $checksum );
						$XXMGAccountInfoRes->setHead_icon( $head_icon );
					}
					$small_file_name = 'small_'.$file_name;
					$small_abs_file = $abs_dir.'/'.$small_file_name;
					if( file_exists( $small_abs_file ) ){
						$icon = new XXProto_FileObject();
						$icon->setID(2);
						$icon->setUrl( $obj->uico_dpre . $uico_dir . '/' . $small_file_name );
						$icon->setFileType( strpos($user['uico'], 'png') ? 105 : 106 );//只允许 png jpg, 非此即彼
						$size = filesize( $small_abs_file );
						$checksum = $obj->calculFileCrc32( $small_abs_file );
						$icon->setSize( $size );
						$icon->setChecksum( $checksum );
						$XXMGAccountInfoRes->setSmall_head_icon( $icon );
					}
				}
				$res_XXMGAccount->setAccount_info_res( $XXMGMyAccountInfoRes );
				$res_XXMGAccount->setResult(0);//登陆状态失效，需重新登陆
			}
		}
		
	}
	//++++++++++++++++++++++++++修改我的信息+++++++++++++++++++++++++++++
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_ACCOUNTINFOMODIFYREQ ){
    	@file_put_contents( '/tmp/XXMGUserAccountV2.log', "修改我的信息\n", FILE_APPEND );
		$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_ACCOUNTINFOMODIFYRES );
		$AccountInfoModifyReq = $XXMGuserAccount->getAccount_info_modify_req();
		$XXMGAccountInfoModifyRes = new XXProto_XXMGAccountInfoModifyRes();
// 		optional string nick_name = 1; //昵称
// 		optional XXSex sex = 2; //性别
// 		optional FileObject file_object = 3; //头像
		$nick_name = $AccountInfoModifyReq -> getNick_name();
		$Sex = $AccountInfoModifyReq -> getSex();
		$File_object = $AccountInfoModifyReq-> getFile_object();		
		if( $nick_name && preg_match( '/[,|*| ]/', $nick_name ) ){
			$res_XXMGAccount->setResult(1005);//用户名含非法字符
		}
		//check login
		include_once dirname(dirname(__FILE__)) . "/utils/User.php";
		$obj = new User();
		$obj->redis->use_redis($redis_config);
		$login_str = $obj->redis->redis->get( $loginKey );
		if( ! $login_str ){
			$res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
		}else{
			include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
			$login_data = XXProto_XXRedisUnityLoginData::parseFromString($login_str);
			$loginKey_uin = $login_data->getUin();
			$loginKey_UserInfo = $login_data->getUser_info();
			$loginKey_createTime = $login_data->getCreateTime();
			if( $loginKey_uin!=$uid || $loginKey_UserInfo->getUuid()!==$UserInfo->getUuid() || abs(time()-$loginKey_createTime)>86400*7 ){// 7天 ?
				$res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
			}else {
				include_once dirname(dirname(__FILE__)) . "/utils/User.php";
				$obj = new User();
				$result = $obj->updateUser( array('uid'=>$uid ), array('usex'=>$sex, 'unickname'=>$nick_name) );
				if(!$result){
					$res_XXMGAccount->setResult(1999);//更新失败
				}else {
					$res_XXMGAccount->setAccount_info_modify_res($XXMGAccountInfoModifyRes);
					$res_XXMGAccount->setResult(0);//更新失败
				}
			}
		}
				
	}
	//++++++++++++++++++++++++++修改密码+++++++++++++++++++++++++++++
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETPWDREQ ){
    	@file_put_contents( '/tmp/XXMGUserAccountV2.log', "修改密码\n", FILE_APPEND );
		$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETPWDRES );

		$SetPwdReq = $XXMGuserAccount->getSet_pwd_req();
		$upwd = $SetPwdReq->getPwd();
		$old_pwd = $SetPwdReq->getOld_pwd();
		include_once dirname(dirname(__FILE__)) . "/utils/User.php";
		$XXMGAccountSetPwdRes = new XXProto_XXMGAccountSetPwdRes();
		
		$obj = new User();
		if( $loginKey ){// 已登录
			$obj->redis->use_redis($redis_config);
			$login_str = $obj->redis->redis->get( $loginKey );
			if( ! $login_str ){
				$res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
			}
			else{
				include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
				$login_data = XXProto_XXRedisUnityLoginData::parseFromString($login_str);
				$loginKey_uin = $login_data->getUin();
				$loginKey_UserInfo = $login_data->getUser_info();
				$loginKey_createTime = $login_data->getCreateTime();
				if( $loginKey_uin!=$uid || $loginKey_UserInfo->getUuid()!==$UserInfo->getUuid() || abs(time()-$loginKey_createTime)>86400*7 ){// 7天 ?
					$res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
				}
				else{// 已登录 用旧密码更改的话
					$_user = $obj->getUser( '', $uid );
					if( $_user['upwd'] != md5( md5( $_user['usalt'].$old_pwd ) ) ){
						$res_XXMGAccount->setResult(1026);//旧密码不正确
					}
				}
			}
		}
		/*elseif( $phone_num && $sms_code ){//手机短信验证码
			include_once dirname(dirname(__FILE__)) . "/utils/Sms.php";
			$sms_obj = new Sms();
			$verify_result = $sms_obj->verifySmsCode( $phone_num, XXProto_XXSMSCodeReqType::XXSMSCodeReqType_Pwd, $sms_code );
			if( $verify_result!==-3 ){// -3 已验证过
				$res_XXMGAccount->setResult(1002);// sms_code 未验证通过或过期
			}
			else{
				$user = $obj->getUser( $phone_num );
				if( empty( $user ) ){
					$res_XXMGAccount->setResult(1999);// 手机号不存在
				}
				else{
					$uid = $user['uid'];
				}
			}
		}else{
			$res_XXMGAccount->setResult(1999);//非法操作
		}*/
		
		
		if( $upwd=='' ){
			$res_XXMGAccount->setResult(1999);//空值 其他错误
		}
		if( $res_XXMGAccount->getResult()==0 ){
			$update_result = $obj->updateUser( array('uid'=>$uid), array('upwd'=>$upwd) );
			if( $update_result===true ){ // 更新成功
				$res_XXMGAccount->setSet_pwd_res($XXMGAccountSetPwdRes);
				$res_XXMGAccount->setResult(0);
			}
			else{
				$res_XXMGAccount->setResult(1998);//更新失败
			}
		}
	}
	//++++++++++++++++++++++++++忘记密码+++++++++++++++++++++++++++++
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_FORGETPWDREQ ){
    	@file_put_contents( '/tmp/XXMGUserAccountV2.log', "忘记密码\n", FILE_APPEND );
		$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_FORGETPWDRES );
		$ForgetPwdReq = $XXMGuserAccount->getForget_pwd_req();
		$XXMGAccoutForgetPwdRes = new XXProto_XXMGAccoutForgetPwdRes();
		//获取用户信息
		$email = $ForgetPwdReq->getEmail();
		$pattern = "/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i";
		include_once dirname(dirname(__FILE__)) . "/utils/User.php";
		$obj = new User();
		if($email) {
			if ( ! preg_match( $pattern, $email ) )	$res_XXMGAccount->setResult(1999);
			$e_user = $obj->getUser( $email );//检验邮箱  并且更新user key
			if ($e_user) {
				$u = $email;
			}else {
				$res_XXMGAccount->setResult(1999);
			}
		}else {
			$res_XXMGAccount->setResult(1999);
		}
		$user = $obj->getUser( $u );//检验邮箱  并且更新user key
		 
		if ($u) {
			if ($user['email_verify']) {
				$info = array('uemail' => $user['uemail'],'verify' => 'forpwd_verify','time' => time());
				$obj->setRedisEmailQueue($info);
				$res_XXMGAccount->setForget_pwd_res($XXMGAccoutForgetPwdRes);
				$res_XXMGAccount->setResult(0);
			}
			else{
				$res_XXMGAccount->setResult(1006);
			}
		}
    }else{
        $res_XXMGAccount->setResult(1);//非法子命令字
        $res_XXMGAccount->setSubcmd($subcmd);
        $response->setResult(3);//异常3 非预定义命令字
    }
    @file_put_contents( '/tmp/XXMGUserAccountV2.log', "程开始成功\n", FILE_APPEND );
    $response->setBody( $res_XXMGAccount->serializeToString() );
    sendProtobufResponse($response);
    @file_put_contents( '/tmp/XXMGUserAccountV2.log', "程开\n", FILE_APPEND );
    exit();
}else{
    $response->setResult(2);//异常2 解不开包
    sendProtobufResponse($response);
    exit();
}
