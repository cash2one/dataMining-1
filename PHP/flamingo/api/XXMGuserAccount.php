<?php
    /*
     * 
     * 海外版用户中心协议接口
     * 国外的用邮箱进行验证，而非手机
     * 
     */
include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXPBBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXMGUserAccount.proto.php";
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
$head->setCmd(1601);
$response->setResult(0);//正常 默认
$response->setHead($head);

if($postData == "")
{
    $response->setResult(1);//异常1 空包
    sendProtobufResponse($response);
    exit();
}


$XXUnityCSPkg = XXProto_XXUnityCSPkg::parseFromString($postData);
$head = $XXUnityCSPkg->getHead();
$body = $XXUnityCSPkg->getBody();
if( $head->getCmd()==1601 ){
    $response->setHead($head);

    $uid = $head->getUin();
    $loginKey = $head->getLogin_key();
    $XXMGuserAccount = XXProto_XXMGAccountProto::parseFromString( $body );
    $subcmd = $XXMGuserAccount->getSubcmd();
    $res_XXMGAccount = new XXProto_XXMGAccountProto();
    $res_XXMGAccount->setResult(0);//正常
	
    /* 
     * 1、注册请求
     *  */
    if( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_REGISTERREQ ){
        $res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_REGISTERRES );//注册应答XXMGAccountRegisterRes
        $XXMGAccountRegisterReq = $XXMGuserAccount->getAccount_register_req();
        
        //获取用户信息
        $UserInfo = $XXMGAccountRegisterReq->getUser_info();
        $uname = $XXMGAccountRegisterReq->getUser_name();
        $upwd = $XXMGAccountRegisterReq->getPwd();

        if( $upwd=='' ){
            $res_XXMGAccount->setResult(1999);//密码为空
        }
        elseif( $uname && preg_match( '/[,|*| ]/', $uname ) ){
            $res_XXMGAccount->setResult(1999);//用户名含非法字符
        }
        else{
        	
        	/* 
        	 * 注册流程
        	 *  */
            if( $res_XXMGAccount->getResult()==0 ){
                include_once dirname(dirname(__FILE__)) . "/utils/User.php";
                $obj = new User();
                if( $uname ) $uname_exist = $obj->getUser( $uname );
                if( $uname && $uname_exist ){
                    $res_XXMGAccount->setResult(1001);//用户名已存在
                }
                else{					
                    $cid = $UserInfo->getChannelID() ? $UserInfo->getChannelID() : 100;//没有标记渠道则标记为自有的100
                    $_user = array(
                        'upwd' => $upwd,
                        'cid' => $cid,
                    );
                    if( $uname ) $_user['uname'] = $uname;
                    $reg_result = $obj->addUser( $_user );
                    
                    if( $reg_result===true ){//注册
                    	
                        $XXProto_XXMGUnityLoginRes = new XXProto_XXMGUnityLoginRes();
                        $XXProto_XXMGUnityLoginRes->setRequest_function(102);
                        $user = $_SESSION['user'] ? $_SESSION['user'] : $obj->getUser( $uname );
                        if( $APPID ){//记录GameSdk注册日志
                            $obj->addGameSdkRegLog( $user['uid'], $APPID, $UserInfo->serializeToString() );
                        }
                        $productID = $UserInfo->getProductID();
                        $uuid = $UserInfo->getUuid();
                        $login_key = "Login_{$user['uid']}_".md5( $user['uid'].$uuid.$productID.time() );
                        if( $APPID ){
                            $login_key = "Login_{$user['uid']}_{$APPID}_".md5( $user['uid'].$uuid.$productID.time() );
                        }

                        $hash_table_arr = array(
                            'uuid' => $uuid,
                            'productID' => $productID,
                            'version' => $UserInfo->getVersion(),
                            'ip' => $ip,
                            'availTime' => time()+7*86400,
                        );

                        include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
                        $login_data = new XXProto_XXRedisUnityLoginData();
                        $login_data->setUin( $user['uid'] );
                        $login_data->setUser_info( $UserInfo );
                        $login_data->setCreateTime( time() );
                        $login_data->setIp( ip2long($ip) );

                        $obj->redis->use_redis($redis_config);
                        $set_result = $obj->redis->redis->set( $login_key, $login_data->serializeToString(), 86400*30 );
                        if( $set_result==true ){
                            $XXProto_XXMGUnityLoginRes->setUin($user['uid']);
                            $XXProto_XXMGUnityLoginRes->setSalt($user['usalt']);
                            $XXProto_XXMGUnityLoginRes->setLoginKey($login_key);
                        }
                        else{//记录Redis失败 其他原因
                            $res_XXMGAccount->setResult(1999);
                        }
                        $XXMGAccountRegisterRes = new XXProto_XXMGAccountRegisterRes();
                        $XXMGAccountRegisterRes->setUnity_login_res($XXProto_XXMGUnityLoginRes);
                        $res_XXMGAccount->setAccount_register_res( $XXMGAccountRegisterRes );

                        $obj->redis->use_redis($redis_config);
                        $ip_date_count += 1;
                        $t = strtotime(date('Y-m-d', strtotime('+1 days'))) - time();
                        $obj->redis->redis->set( "chatRegIpDateCount_{$md}_{$ip}", $ip_date_count, $t );
                        $res_XXMGAccount->setResult(0);
//                        print_r("注册成功");  
                    }
                    else{
                        $res_XXMGAccount->setResult(1998);//注册失败
                    }
                }
            }
        }
    }
    
    /* 
     * 
     * 2、 统一登陆登出请求，
     * 
     * */
    
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_UNITYLOGINREQ ){
	    $res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_UNITYLOGINRES );
	    
	    $XXUnityLoginReq = $XXMGuserAccount->getUnity_login_req();
	    
	    //request_function
	    //101 请求salt,102登陆验证,103登出,104 fb登录
	    $request_function = $XXUnityLoginReq->getRequest_function();
	    $uname = $XXUnityLoginReq->getUserName();
	    $checkPwd = $XXUnityLoginReq->getPasswd();
	    $userInfo = $XXUnityLoginReq->getUserInfo();
	    
	    include_once dirname(dirname(__FILE__)) . "/utils/User.php";
	    $obj = new User();
	    $user = $obj->getUser( $uname );
	    $XXProto_XXMGUnityLoginRes = new XXProto_XXMGUnityLoginRes();
	    
	    
	    if( ! $user ){
	    	$res_XXMGAccount->setResult(1028);
	    }
	    if( $request_function==101 ){//请求salt
	    	$XXProto_XXMGUnityLoginRes->setRequest_function(101);
	    	if( $user ){
	    		$res_XXMGAccount->setResult(1034);
	    		$XXProto_XXMGUnityLoginRes->setSalt($user['usalt']);
	    	}
	    }
	    elseif( $request_function==102 ){//102登陆验证
	    	$XXProto_XXMGUnityLoginRes->setRequest_function(102);
	    
	    	$obj->redis->use_redis('write');
	    	// 1. 是否在IP黑名单 1030 chatLoginIpBlockHashT
	    	$ip = $obj->getIp();
	    	if( $obj->redis->redis->hExists( 'chatLoginIpBlockHashT', $ip ) ){
	    		$ip_over_time = $obj->redis->redis->hGet( 'chatLoginIpBlockHashT', $ip );
	    		if( $ip_over_time<=time() ){
	    			$obj->redis->redis->hDel( 'chatLoginIpBlockHashT', $ip );
	    		}
	    		else{
	    			$res_XXMGAccount->setResult(1030);
	    		}
	    	}
	    	
	    	// 2.用户设备是否在黑名单 1033 chatLoginUuidBlockHashT
	    	$uuid = $userInfo->getUuid();
	    	if( $obj->redis->redis->hExists( 'chatLoginUuidBlockHashT', $uuid ) ){
	    		$uuid_over_time = $obj->redis->redis->hGet( 'chatLoginUuidBlockHashT', $uuid );
	    		if( $uuid_over_time<=time() ){
	    			$obj->redis->redis->hDel( 'chatLoginUuidBlockHashT', $uuid );
	    		}
	    		else{
	    			$res_XXMGAccount->setResult(1033);
	    		}
	    	}
	    	// 3. 验证码 1027 TODO
	    	// 4. 检测用户状态
	    	if( $res_XXMGAccount->getResult()==0 ){
	    		if( $user['ustatus']==1029 ){//账号被冻结
	    			$res_XXMGAccount->setResult(1029);
	    		}
	    		elseif( $user['ustatus']==1031 ){//被列入黑名单（封号）
	    			$res_XXMGAccount->setResult(1031);
	    		}
	    		elseif( $checkPwd ){//检测密码   $v = md5( md5( $_user['usalt'].$v ) );
	    			if( md5( $checkPwd ) != $user['upwd'] ){
	    				$res_XXMGAccount->setResult(1026);
	    			}
	    			else{
	    				//写入KEY /*loginKeyHashT 废弃*/
	    				$productID = $userInfo->getProductID();
	    				$login_key = "Login_{$user['uid']}_".md5( $user['uid'].$uuid.$productID.time() );
	    				if( $APPID ){
	    					$login_key = "Login_{$user['uid']}_{$APPID}_".md5( $user['uid'].$uuid.$productID.time() );
	    				}
	    
	    				$hash_table_arr = array(
	    						'uuid' => $uuid,
	    						'productID' => $productID,
	    						'version' => $userInfo->getVersion(),
	    						'ip' => $ip,
	    						'availTime' => time()+7*86400,
	    				);
	    
	    				include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
	    				$login_data = new XXProto_XXRedisUnityLoginData();
	    				$login_data->setUin( $user['uid'] );
	    				$login_data->setUser_info( $userInfo );
	    				$login_data->setCreateTime( time() );
	    				$login_data->setIp( ip2long($ip) );
	    
	    				$obj->redis->use_redis($redis_config);
	    				$set_result = $obj->redis->redis->set( $login_key, $login_data->serializeToString(), 86400*30 );
	    				if( $set_result==true ){
	    					//删除旧的KEY
	    					if( $APPID ){
	    						$keys = $obj->redis->redis->keys( "Login_{$user['uid']}_{$APPID}_*" );
	    						//记录GameSdk注册日志
	    						$obj->addGameSdkLoginLog( $user['uid'], $APPID, $userInfo->serializeToString() );
	    					}
	    					else{
	    						$keys = $obj->redis->redis->keys( "Login_{$user['uid']}_*" );
	    					}
	    					foreach( $keys as $key ){
	    						if( $key != $login_key ){
	    							$obj->redis->redis->delete( $key );
	    						}
	    					}
	    					$XXProto_XXMGUnityLoginRes->setUin($user['uid']);
	    					$XXProto_XXMGUnityLoginRes->setLoginKey($login_key);
	    			$res_XXMGAccount->setResult(0);	}
	    				else{//登录失败 其他原因
	    					$res_XXMGAccount->setResult(1999);
	    				}
	    			}
	    		}
	    		else{//登录失败 其他原因
	    			$res_XXMGAccount->setResult(1999);
	    		}
	    	}
	    }
	    
	    /*
	     * 登出
	    *
	    *  */
	    elseif( $request_function==103 ){
	    	$XXProto_XXMGUnityLoginRes->setRequest_function(103);
	    	$login_str = $obj->redis->redis->get( $loginKey );
	    	if( ! $login_str ){
	    		//$res_XXMGAccount->setResult(1004);//登陆状态已失效
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
	    		if( $result==0 ){
	    			$res_XXMGAccount->setResult(1998);//登出失败
	    		}
	    	}
	    }
	    elseif ( $request_function==104 ){//104 fb登录
	    	
	    	$XXProto_XXMGUnityLoginRes->setRequest_function(104);
	    	
	    	$obj->redis->use_redis('write');
	    	// 1. 是否在IP黑名单 1030 chatLoginIpBlockHashT
	    	$ip = $obj->getIp();
	    	if( $obj->redis->redis->hExists( 'chatLoginIpBlockHashT', $ip ) ){
	    		$ip_over_time = $obj->redis->redis->hGet( 'chatLoginIpBlockHashT', $ip );
	    		if( $ip_over_time<=time() ){
	    			$obj->redis->redis->hDel( 'chatLoginIpBlockHashT', $ip );
	    		}
	    		else{
	    			$res_XXMGAccount->setResult(1030);
	    		}
	    	}
	    	
	    	// 2.用户设备是否在黑名单 1033 chatLoginUuidBlockHashT
	    	$uuid = $userInfo->getUuid();
	    	if( $obj->redis->redis->hExists( 'chatLoginUuidBlockHashT', $uuid ) ){
	    		$uuid_over_time = $obj->redis->redis->hGet( 'chatLoginUuidBlockHashT', $uuid );
	    		if( $uuid_over_time<=time() ){
	    			$obj->redis->redis->hDel( 'chatLoginUuidBlockHashT', $uuid );
	    		}
	    		else{
	    			$res_XXMGAccount->setResult(1033);
	    		}
	    	}
	    	// 3. 验证码 1027 TODO
	    	// 4. 检测用户状态
	    	if( $res_XXMGAccount->getResult()==0 ){
	    		if( $user['ustatus']==1029 ){//账号被冻结
	    			$res_XXMGAccount->setResult(1029);
	    		}
	    		elseif( $user['ustatus']==1031 ){//被列入黑名单（封号）
	    			$res_XXMGAccount->setResult(1031);
	    		}
	    		elseif( $user ){//发奎用户信息
	    				$productID = $userInfo->getProductID();
	    				$login_key = "Login_{$user['uid']}_".md5( $user['uid'].$uuid.$productID.time() );
	    				if( $APPID ){
	    					$login_key = "Login_{$user['uid']}_{$APPID}_".md5( $user['uid'].$uuid.$productID.time() );
	    				}
	    				 
	    				$hash_table_arr = array(
	    						'uuid' => $uuid,
	    						'productID' => $productID,
	    						'version' => $userInfo->getVersion(),
	    						'ip' => $ip,
	    						'availTime' => time()+7*86400,
	    				);
	    				 
	    				include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
	    				$login_data = new XXProto_XXRedisUnityLoginData();
	    				$login_data->setUin( $user['uid'] );
	    				$login_data->setUser_info( $userInfo );
	    				$login_data->setCreateTime( time() );
	    				$login_data->setIp( ip2long($ip) );
	    				 
	    				$obj->redis->use_redis($redis_config);
	    				$set_result = $obj->redis->redis->set( $login_key, $login_data->serializeToString(), 86400*30 );
	    				if( $set_result==true ){
	    					//删除旧的KEY
	    					if( $APPID ){
	    						$keys = $obj->redis->redis->keys( "Login_{$user['uid']}_{$APPID}_*" );
	    						//记录GameSdk注册日志
	    						$obj->addGameSdkLoginLog( $user['uid'], $APPID, $userInfo->serializeToString() );
	    					}
	    					else{
	    						$keys = $obj->redis->redis->keys( "Login_{$user['uid']}_*" );
	    					}
	    					foreach( $keys as $key ){
	    						if( $key != $login_key ){
	    							$obj->redis->redis->delete( $key );
	    						}
	    					}
	    					$XXProto_XXMGUnityLoginRes->setUin($user['uid']);
	    					$XXProto_XXMGUnityLoginRes->setLoginKey($login_key);
	    					$res_XXMGAccount->setResult(0);	}
	    					else{//登录失败 其他原因
	    						$res_XXMGAccount->setResult(1999);
	    					}
	    		}
	    		
	    	}

	    	else {
	    		//用一个FB账号注册一个新的用户
	    		if( $uname ) $_user['ufb'] = $uname;
	    		$reg_result = $obj->addUser( $_user );
	    		if( $reg_result===true ){//注册
	    			$XXProto_XXMGUnityLoginRes = new XXProto_XXMGUnityLoginRes();
	    			$XXProto_XXMGUnityLoginRes->setRequest_function(102);
	    			$user = $_SESSION['user'] ? $_SESSION['user'] : $obj->getUser( $uname );
	    			if( $APPID ){//记录GameSdk注册日志
	    				$obj->addGameSdkRegLog( $user['uid'], $APPID, $userInfo->serializeToString() );
	    			}
	    			$productID = $userInfo->getProductID();
	    			$uuid = $userInfo->getUuid();
	    			$login_key = "Login_{$user['uid']}_".md5( $user['uid'].$uuid.$productID.time() );
	    			if( $APPID ){
	    				$login_key = "Login_{$user['uid']}_{$APPID}_".md5( $user['uid'].$uuid.$productID.time() );
	    			}
	    			 
	    			$hash_table_arr = array(
	    					'uuid' => $uuid,
	    					'productID' => $productID,
	    					'version' => $userInfo->getVersion(),
	    					'ip' => $ip,
	    					'availTime' => time()+7*86400,
	    			);
	    			 
	    			include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
	    			$login_data = new XXProto_XXRedisUnityLoginData();
	    			$login_data->setUin( $user['uid'] );
	    			$login_data->setUser_info( $userInfo );
	    			$login_data->setCreateTime( time() );
	    			$login_data->setIp( ip2long($ip) );
	    			 
	    			$obj->redis->use_redis($redis_config);
	    			$set_result = $obj->redis->redis->set( $login_key, $login_data->serializeToString(), 86400*30 );
	    			if( $set_result==true ){
	    				$XXProto_XXMGUnityLoginRes->setUin($user['uid']);
	    				$XXProto_XXMGUnityLoginRes->setSalt($user['usalt']);
	    				$XXProto_XXMGUnityLoginRes->setLoginKey($login_key);
	    			}
	    			else{//记录Redis失败 其他原因
	    				$res_XXMGAccount->setResult(1999);
	    			}
	    			$XXMGAccountRegisterRes = new XXProto_XXMGAccountRegisterRes();
	    			$XXMGAccountRegisterRes->setUnity_login_res($XXProto_XXMGUnityLoginRes);
	    			$res_XXMGAccount->setAccount_register_res( $XXMGAccountRegisterRes );
	    			 
	    			$obj->redis->use_redis($redis_config);
	    			$ip_date_count += 1;
	    			$t = strtotime(date('Y-m-d', strtotime('+1 days'))) - time();
	    			$obj->redis->redis->set( "chatRegIpDateCount_{$md}_{$ip}", $ip_date_count, $t );
	    			$res_XXMGAccount->setResult(0);
	    		}
	    		else{
	    			$res_XXMGAccount->setResult(1998);//注册失败
	    		}
	    	}
	    	
	    }
	    
	    else{
	    }
	    $res_XXMGAccount->setUnity_login_res( $XXProto_XXMGUnityLoginRes );
    }
    
     /* 
      * 
      * 设置邮箱请求
      * 
      *  */
	
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETEMAILREQ ){
    	$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETEMAILRES );
    	include_once dirname(dirname(__FILE__)) . "/utils/User.php";
    	$obj = new User();
    	// 解码 loginKey
    	$obj->redis->use_redis($redis_config);
    	$login_str = $obj->redis->redis->get( $loginKey );
    	if( ! $login_str ){
    		$res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
    	}
    	else{
    		$XXAccountSetEmailReq = $XXMGuserAccount->getAccount_set_email_req();
    		$email = $XXAccountSetEmailReq->getEmail();
    		$pattern = "/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i";
    		if ( ! $email ) {
    			$res_XXMGAccount->setResult(1999);//邮箱为空
    		}    		
    		elseif ( ! preg_match( $pattern, $email ) )
    		{
    			$res_XXMGAccount->setResult(1999);//邮箱格式错误
    		}
    		
    		//检查邮箱是否存在
    		elseif ($email){
    		file_put_contents( '/tmp/test_uname'.$email.$email, $user, FILE_APPEND );
	    		include_once dirname(dirname(__FILE__)) . "/utils/User.php";
	    		$obj = new User();
	    		if( $email ) $email_exist = $obj->getUser( $email );	    		
	    		
	    		$userInfo = $XXAccountSetEmailReq->getUser_info();
	    		include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
	    		$login_data = XXProto_XXRedisUnityLoginData::parseFromString($login_str);
	    		$loginKey_uin = $login_data->getUin();
	    		$loginKey_UserInfo = $login_data->getUser_info();
	    		$loginKey_createTime = $login_data->getCreateTime();
	    		$email_uid = $obj->getUser( $uid );
	    		
	    		//1、邮箱已经存在不   未验证  发邮件     2、邮箱不存在发邮件   已经验证   发邮件  3、邮箱不存在    未验证
	    		//if ( $email_uid['email_verify'] && $email_exist['uemail'] ){
	    		//	$res_XXMGAccount->setResult(1003);//邮箱已存在
	    		//}
if ( ( $email_exist['uemail'] == $email_uid['uemail'] && $email_uid['email_verify'] ) || (  $email_exist['uemail'] != $email_uid['uemail'] &&  $email_exist['uemail'] ) ){
					
					$res_XXMGAccount->setResult(1003);//邮箱已存在
					
	    		}
	    		elseif( (! $email_uid['email_verify'] && $email_exist['newuemail'] || $email_exist['uemail']) || ($email_uid['email_verify'] && !$email_exist['newuemail'] || !$email_exist['uemail']) || (!$email_uid['email_verify'] && !$email_exist['newuemail'] || !$email_exist['uemail']) ){
	    			//$res_XXMGAccount->setResult(1003);//邮箱已存在
	    			
	    			if ( $email_uid['email_verify'] ) {
	    				$update_result = $obj->updateUser( array('uid'=>$uid), array('newuemail'=>$email) );
	    			}else {
	    				$update_result = $obj->updateUser( array('uid'=>$uid), array('uemail'=>$email) );
	    			}
	    			if( $update_result===true ){
	    				$info = array('uemail' => $email,'verify' => 'register_verify','time' => time());
	    				$obj->setRedisEmailQueue($info);
	    				$res_XXMGAccount->setResult(0);//更新失败
	    			}
	    			else{
	    				$res_XXMGAccount->setResult(1998);//更新失败
	    			}
	    		}
	    		else{
	    			$res_XXMGAccount->setResult(1003);//邮箱已存在
	    		}
	    		
    		}
    		
    		
    	}
    }
    
    /* 
     * 
     * 忘记密码邮箱验证请求
     *  
     *  */
    
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_VERFITYRESETPWDREQ ){
    	$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_VERFITYRESETPWDRES );
    	$XXMGVerfitySetPwdReq = $XXMGuserAccount->getVerfity_set_pwd_req();
    	//获取用户信息
    	$UserInfo = $XXMGVerfitySetPwdReq->getUserInfo();
    	$uname = $XXMGVerfitySetPwdReq->getUsername();
    	$email = $XXMGVerfitySetPwdReq->getEmail();
    	$pattern = "/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i";
    	include_once dirname(dirname(__FILE__)) . "/utils/User.php";
    	$obj = new User();//file_put_contents( '/tmp/test_uname'.$u_userer = $obj->getUser( $email );//检验邮箱  并且更新user key:$uname, $user, FILE_APPEND );
	
	if ($uname) {
    		if( $uname && preg_match( '/[,|*| ]/', $uname ) ) $res_XXMGAccount->setResult(1999);
    		$u_user = $obj->getUser( $uname );//检验邮箱  并且更新user key
    		if ( $u_user ) {
    			file_put_contents( '/tmp/test_uname'.$u_user.$uname, $user, FILE_APPEND );
    			$u = $uname;
    		}else {
    			$res_XXMGAccount->setResult(1028);
    		}    		
    		
    	}elseif($email) {
    		if ( ! preg_match( $pattern, $email ) )	$res_XXMGAccount->setResult(1999);
    		$e_user = $obj->getUser( $email );//检验邮箱  并且更新user key
    		if ($e_user) {
    			$u = $email;
    		}else {
    			$res_XXMGAccount->setResult(1028);
    		}
    	}else {
    		$res_XXMGAccount->setResult(1999);
    	}
    	$user = $obj->getUser( $u );//检验邮箱  并且更新user key
    	
    	if ($u) { 
			if ($user['email_verify']) {				
		    	$info = array('uemail' => $user['uemail'],'verify' => 'forpwd_verify','time' => time());
		    	$obj->setRedisEmailQueue($info);
	    	
	    		$res_XXMGAccount->setResult(0);
			}
			else{
				$res_XXMGAccount->setResult(1006);
			}
    	}
    	
    }
    
    /* 
     * 
     * 设置昵称请求   
     *  
     *  */
    
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETNICKNAMEREQ ){
    	$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETNICKNAMERES );
    	include_once dirname(dirname(__FILE__)) . "/utils/User.php";
    	$obj = new User();
    	// 解码 loginKey
    	$obj->redis->use_redis($redis_config);
    	$login_str = $obj->redis->redis->get( $loginKey );
    	if( ! $login_str ){
    		$res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
    	}
    	else{
    		$XXAccountSetNickNameReq = $XXMGuserAccount->getAccount_set_nickname_req();
    		$nick_name = $XXAccountSetNickNameReq->getNick_name();
    		$obj->redis->use_redis('dm_level');
    		$kw_arr = $obj->redis->redis->sMembers( 'NicknameKeyShield' );
    		$kw_str = implode( '|', $kw_arr );
    		if( $nick_name=='' || ( $kw_str && preg_match( "/{$kw_str}/", $nick_name ) ) ){
    			$res_XXMGAccount->setResult(1005);//空值 其他错误
    		}
    		else{
    			$UserInfo = $XXAccountSetNickNameReq->getUser_info();
    			include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
    			$login_data = XXProto_XXRedisUnityLoginData::parseFromString($login_str);
    			$loginKey_uin = $login_data->getUin();
    			$loginKey_UserInfo = $login_data->getUser_info();
    			$loginKey_createTime = $login_data->getCreateTime();
    			if( $loginKey_uin!=$uid || $loginKey_UserInfo->getUuid()!==$UserInfo->getUuid() || abs(time()-$loginKey_createTime)>86400*7 ){// 7天 ?
    				$res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
    			}
    			else{
    				$update_result = $obj->updateUser( array('uid'=>$uid), array('unickname'=>$nick_name) );
    				if( $update_result===true ){ // 更新成功
    				}
    				else{
    					$res_XXMGAccount->setResult(1998);//更新失败
    				}
    			}
    		}
    	}
    }
    
    
    /* 
     * 
     *  注册和facebook登录设置信息XXMGSetInfoReq
     *  
     *  */
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETINFOREQ ){
    	$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETINFORES );
    	$XXMGAccountSetInfoReq = $XXMGuserAccount->getAccount_set_info_req();
    	$nick_name = $XXMGAccountSetInfoReq->getNick_name();
    	$email = $XXMGAccountSetInfoReq->getEmail();
    	$country = $XXMGAccountSetInfoReq->getCountry();
    	$pattern = "/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i";
    	if ( ! $email ) {
    		$res_XXMGAccount->setResult(1999);//邮箱为空
    	}
    	elseif ( ! preg_match( $pattern, $email ) )
    	{
    		$res_XXMGAccount->setResult(1999);//邮箱格式错误
    	}
    	
    	if ( ! $country ) {
    		$res_XXMGAccount->setResult(1999);//国家为空
    	}
    	
    	if ( ! $nick_name ) {
    		$res_XXMGAccount->setResult(1999);//用户名为空
    	}
    	//判断是否登陆
    	include_once dirname(dirname(__FILE__)) . "/utils/User.php";
    	$obj = new User();
    	if( $email ) $email_exist = $obj->getUser( $email );
	    if( $email_exist ){
	    	$res_XXMGAccount->setResult(1003);//邮箱已存在
	    }
    	else{
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
	     			if( $loginKey_uin!=$uid || abs(time()-$loginKey_createTime)>86400*7 ){// 7天 ?
	     				$res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
	     			}
	     			else{// 处理
	    					$user=array('uid'=>$uid) ;
	    					$info=array(
	    						'unickname'=>$nick_name,
	    						'uemail'=>$email,
	    						'country'=>$country,
	    					);
	    					$_user = $obj -> updateUser($user, $info);
	    				if( $_user ){
							$info = array('uemail' => $email,'verify' => 'register_verify','time' => time());
                            $obj->setRedisEmailQueue($info);  	
	    					
						$res_XXMGAccount->setResult(0);
	    				}
	     			}
	     		}
	     	}
	     	else {
	     		$res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
	     	}
    	}
    	
    				
    	
    }
    
    
    
    /* 
     * 
     * 修改密码请求
     *  
     *  */    
    
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETPWDREQ ){
    	$res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETPWDRES );
    	$XXAccountSetPwdReq = $XXMGuserAccount->getAccount_set_pwd_req();
    	$UserInfo = $XXAccountSetPwdReq->getUser_info();
    	$upwd = $XXAccountSetPwdReq->getPwd();
    	$old_pwd = $XXAccountSetPwdReq->getOld_pwd();
    	include_once dirname(dirname(__FILE__)) . "/utils/User.php";
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
    	elseif( $phone_num && $sms_code ){//手机短信验证码
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
    	}
    	else{
    		$res_XXMGAccount->setResult(1999);//非法操作
    	}
    
    
    	if( $upwd=='' ){
    		$res_XXMGAccount->setResult(1999);//空值 其他错误
    	}
    	if( $res_XXMGAccount->getResult()==0 ){
    		$update_result = $obj->updateUser( array('uid'=>$uid), array('upwd'=>$upwd) );
    		if( $update_result===true ){ // 更新成功
    			
    		}
    		else{
    			$res_XXMGAccount->setResult(1998);//更新失败
    		}
    	}
    }
    
    
    
    
    /* 
     * 获取验证码请求
     *  */
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_GETEMAILCODEREQ ){
        $XXSMSCodeReq = $XXMGuserAccount->getSms_code_req();
        $UserInfo = $XXSMSCodeReq->getUser_info();
        $email_value = $XXSMSCodeReq->getPhone_num();
        $XXSMSCodeReqType = $XXSMSCodeReq->getReq_type();
        if( $XXSMSCodeReqType == XXProto_XXSMSCodeReqType::XXSMSCodeReqType_Pwd ){
            include_once dirname(dirname(__FILE__)) . "/utils/User.php";
            $obj = new User();
            $uphone_exist = $obj->getUser( $email_value );
            if( ! $uphone_exist ){
                $res_XXMGAccount->setResult(1028);//手机号不存在 账号不存在
            }
        }
        if( $XXSMSCodeReqType == XXProto_XXSMSCodeReqType::XXSMSCodeReqType_Bind_SDK ){//SDK要验证用户名密码
            include_once dirname(dirname(__FILE__)) . "/utils/User.php";
            $obj = new User();
            $uname = $XXSMSCodeReq->getUsername();
            $passwd = $XXSMSCodeReq->getPasswd();
            $uphone_exist = $obj->getUser( $email_value );
            if( $uphone_exist ){
                $res_XXMGAccount->setResult(1003);//手机号已绑定
            }

            $user = $obj->getUser( $uname );
            if( empty($user) ){
                $res_XXMGAccount->setResult(1028);//不存在
            }
            elseif( md5($passwd) != $user['upwd'] ){//密码错误
                $res_XXMGAccount->setResult(1026);
            }
        }
        if( $res_XXMGAccount->getResult()==0 ){
            include_once dirname(dirname(__FILE__)) . "/utils/Sms.php";
            $obj = new Sms();
            $send_result = $obj->sendSms( $email_value, $XXSMSCodeReqType );

            //发送结果不返回告知客户端
            if( $send_result===true ){
            }
            else{
            }
            //
        }

        $res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_GETSMSCODERES );
        //$res_XXMGAccount->setSms_code_res( new XXProto_XXSMSCodeRes() );

    }
    
    /* 
     * 验证码验证请求
     *  */
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_GETEMAILCODEREQ ){
        $XXSMSCodeVerifyReq = $XXMGuserAccount->getSms_verify_req();
        $UserInfo = $XXSMSCodeVerifyReq->getUser_info();
        $email_value = $XXSMSCodeVerifyReq->getPhone_num();
        $sms_code = $XXSMSCodeVerifyReq->getSms_code();
        $XXSMSCodeReqType = $XXSMSCodeVerifyReq->getReq_type();
        include_once dirname(dirname(__FILE__)) . "/utils/Sms.php";
        $obj = new Sms();
        $verify_result = $obj->verifySmsCode( $email_value, $XXSMSCodeReqType, $sms_code );
        $res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SMSCODEVERIFYRES );
        if( $verify_result===true ){//result 0成功，非0失败
            //绑定手机的验证验证码 把绑定操作在这里一并做了
            if( $XXSMSCodeReqType==XXProto_XXSMSCodeReqType::XXSMSCodeReqType_Bind ){
                include_once dirname(dirname(__FILE__)) . "/utils/User.php";
                $obj = new User();
                $obj->redis->use_redis($redis_config);
                $login_str = $obj->redis->redis->get( $loginKey );
                if( ! $login_str ){
                    $res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
                }
                else{
                    $UserInfo = $XXSMSCodeVerifyReq->getUser_info();
                    include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
                    $login_data = XXProto_XXRedisUnityLoginData::parseFromString($login_str);
                    $loginKey_uin = $login_data->getUin();
                    $loginKey_UserInfo = $login_data->getUser_info();
                    $loginKey_createTime = $login_data->getCreateTime();
                    if( $loginKey_uin!=$uid || $loginKey_UserInfo->getUuid()!==$UserInfo->getUuid() || abs(time()-$loginKey_createTime)>86400*7 ){// 7天 ?
                        $res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
                    }
                    else{
                        $email_exist = $obj->getUser( $email_value );
                        if( $email_exist ){
                            $res_XXMGAccount->setResult(1003);//手机号已存在
                        }
                        else{
                            $_user = $obj->getUser( '', $uid );
                            $update_result = $obj->updateUser( array('uid'=>$uid), array('uphone'=>$email_value) );
                            if( $update_result===true ){ // 更新成功
                                //清除旧的手机号的redis
                                if( $_user['uphone'] ){
                                    $obj->redis->redis->delete( "user:{$_user['uphone']}" );
                                }
                            }
                            else{
                                $res_XXMGAccount->setResult(1999);//更新失败
                            }
                        }
                    }
                }
            }
            // SDK 绑定
            if( $XXSMSCodeReqType==XXProto_XXSMSCodeReqType::XXSMSCodeReqType_Bind_SDK ){
                include_once dirname(dirname(__FILE__)) . "/utils/User.php";
                $obj = new User();
                $uname = $XXSMSCodeVerifyReq->getUsername();
                $passwd = $XXSMSCodeVerifyReq->getPasswd();
                if( $uname && $passwd ){//是否SDK来绑定
                    $user = $obj->getUser( $uname );
                    if( empty($user) ){
                        $res_XXMGAccount->setResult(1028);//不存在
                    }
                    elseif( md5($passwd) != $user['upwd'] ){//密码错误
                        $res_XXMGAccount->setResult(1026);
                    }
                    else{
                        $email_exist = $obj->getUser( $email_value );
                        if( $email_exist ){
                            $res_XXMGAccount->setResult(1003);//手机号已存在
                        }
                        else{//绑定
                            $update_result = $obj->updateUser( array('uid'=>$user['uid']), array('uphone'=>$email_value) );
                            if( $update_result===true ){ // 更新成功
                                //清除旧的手机号的redis
                                if( $user['uphone'] ){
                                    $obj->redis->redis->delete( "user:{$user['uphone']}" );
                                }
                            }
                            else{
                                $res_XXMGAccount->setResult(1999);//更新失败
                            }
                        }
                    }
                }
                else{
                    $res_XXMGAccount->setResult(1999);//更新失败
                }
            }
            // 注册验证
            if( $XXSMSCodeReqType==XXProto_XXSMSCodeReqType::XXSMSCodeReqType_Reg ){
                include_once dirname(dirname(__FILE__)) . "/utils/User.php";
                $obj = new User();
                $email_exist = $obj->getUser( $email_value );
                if( $email_exist ){
                    $res_XXMGAccount->setResult(1003);//手机号已存在
                }
            }
        }
        else{
            if( $verify_result===false ){
                $res_XXMGAccount->setResult(1002);//验证码错误
            }
            else{//错误码 负的返回值 取绝对值*X*
                $res_XXMGAccount->setResult( 1002 );
            }
        }
        //$res_XXMGAccount->setSms_verify_res( new XXProto_XXSMSCodeVerifyRes() );
    }
    
    /* 
     * 设置昵称请求
     *  */
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETNICKNAMEREQ ){
        $res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETNICKNAMERES );
        include_once dirname(dirname(__FILE__)) . "/utils/User.php";
        $obj = new User();
        // 解码 loginKey
        $obj->redis->use_redis($redis_config);
        $login_str = $obj->redis->redis->get( $loginKey );
        if( ! $login_str ){
            $res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
        }
        else{
            $XXAccountSetNickNameReq = $XXMGuserAccount->getAccount_set_nickname_req();
            $nick_name = $XXAccountSetNickNameReq->getNick_name();
            $obj->redis->use_redis('dm_level');
            $kw_arr = $obj->redis->redis->sMembers( 'NicknameKeyShield' );
            $kw_str = implode( '|', $kw_arr );
            if( $nick_name=='' || ( $kw_str && preg_match( "/{$kw_str}/", $nick_name ) ) ){
                $res_XXMGAccount->setResult(1005);//空值 其他错误
            }
            else{
                $UserInfo = $XXAccountSetNickNameReq->getUser_info();
                include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
                $login_data = XXProto_XXRedisUnityLoginData::parseFromString($login_str);
                $loginKey_uin = $login_data->getUin();
                $loginKey_UserInfo = $login_data->getUser_info();
                $loginKey_createTime = $login_data->getCreateTime();
                if( $loginKey_uin!=$uid || $loginKey_UserInfo->getUuid()!==$UserInfo->getUuid() || abs(time()-$loginKey_createTime)>86400*7 ){// 7天 ?
                    $res_XXMGAccount->setResult(1004);//登陆状态失效，需重新登陆
                }
                else{
                    $update_result = $obj->updateUser( array('uid'=>$uid), array('unickname'=>$nick_name) );
                    if( $update_result===true ){ // 更新成功
                    }
                    else{
                        $res_XXMGAccount->setResult(1998);//更新失败
                    }
                }
            }
        }
    }
    
    /* 
     * 修改密码请求
     *  */
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETPWDREQ ){
        $res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETPWDRES );
        $XXAccountSetPwdReq = $XXMGuserAccount->getAccount_set_pwd_req();
        $UserInfo = $XXAccountSetPwdReq->getUser_info();
        $upwd = $XXAccountSetPwdReq->getPwd();
        $email_value = $XXAccountSetPwdReq->getPhone_num();
        $sms_code = $XXAccountSetPwdReq->getSms_code();
        $old_pwd = $XXAccountSetPwdReq->getOld_pwd();
        include_once dirname(dirname(__FILE__)) . "/utils/User.php";
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
        elseif( $email_value && $sms_code ){//手机短信验证码
            include_once dirname(dirname(__FILE__)) . "/utils/Sms.php";
            $sms_obj = new Sms();
            $verify_result = $sms_obj->verifySmsCode( $email_value, XXProto_XXSMSCodeReqType::XXSMSCodeReqType_Pwd, $sms_code );
            if( $verify_result!==-3 ){// -3 已验证过
                $res_XXMGAccount->setResult(1002);// sms_code 未验证通过或过期
            }
            else{
                $user = $obj->getUser( $email_value );
                if( empty( $user ) ){
                    $res_XXMGAccount->setResult(1999);// 手机号不存在
                }
                else{
                    $uid = $user['uid'];
                }
            }
        }
        else{
            $res_XXMGAccount->setResult(1999);//非法操作
        }


        if( $upwd=='' ){
            $res_XXMGAccount->setResult(1999);//空值 其他错误
        }
        if( $res_XXMGAccount->getResult()==0 ){
            $update_result = $obj->updateUser( array('uid'=>$uid), array('upwd'=>$upwd) );
            if( $update_result===true ){ // 更新成功
                /*
                if( $loginKey ){
                    $obj->redis->redis->delete( $loginKey );
                }
                 */
            }
            else{
                $res_XXMGAccount->setResult(1998);//更新失败
            }
        }
    }
    
    /* 
     * 设置头像
     *  */
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETHEADREQ ){
        $res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETHEADRES );

        //头像处理
        require_once dirname(dirname(__FILE__)) . "/apiutils/XXTEA.php";
        
        $getData = $_GET['uico'];
        $getData = xxtea_decrypt( base64_decode(urldecode($getData)), $XX_KEY['decrypt'] );
        if( empty($getData) ){
        	$getData = xxtea_decrypt( base64_decode($_GET['uico']), $XX_KEY['decrypt'] );
        }
        
        $buff = file_get_contents('php://input', 'r');
        
        
        
        $XXMGaccountSetHeadReq = $userAccount->getAccount_set_head_req();
        $UserInfo = $XXMGaccountSetHeadReq->getUser_info();
        $fileObject = $XXMGaccountSetHeadReq->getFile_object();
        if( empty( $buff ) ){
        	$res_XXAccount->setResult(1999);//空值 其他错误
        }
        else{
        	include_once dirname(dirname(__FILE__)) . "/utils/User.php";
        	$obj = new User();
        	$obj->redis->use_redis('login_key');
        	$login_str = $obj->redis->redis->get( $loginKey );
        	if( empty( $login_str ) ){
        		$res_XXAccount->setResult(1004);//登陆状态失效，需重新登陆
        	}
        	else{
        		include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
        		$login_data = XXProto_XXRedisUnityLoginData::parseFromString($login_str);
        		$loginKey_uin = $login_data->getUin();
        		$loginKey_UserInfo = $login_data->getUser_info();
        		$loginKey_createTime = $login_data->getCreateTime();
        		//@file_put_contents( '/tmp/userAccount.log', ($loginKey_uin." 2\n"), FILE_APPEND );
        		if( $loginKey_uin!=$uid || $loginKey_UserInfo->getUuid()!==$UserInfo->getUuid() || abs(time()-$loginKey_createTime)>86400*7 ){// 7天 ?
        			$res_XXAccount->setResult(1004);//登陆状态失效，需重新登陆
        		}
        	}
        	if( $res_XXAccount->getResult()==0 ){
        		$user = $obj->getUser( '', $uid );
        		$uico_dir = $obj->getUicoDir( $user );
        		$abs_dir = SYSDIR_ROOT ."/uico/".$uico_dir;
        		if( ! file_exists( $abs_dir ) ){
        			@mkdir( $abs_dir, 0777, true );
        		}
        		$file_ext = $fileObject->getFileType()==106 ? 'jpeg' : 'png';
        		$file_name = "u{$user['uid']}_".date("YmdHis").".{$file_ext}";
        		$abs_file = $abs_dir."/".$file_name;
        		$size = file_put_contents( $abs_file, $buff );
        		if( empty($size) ){
        			$res_XXAccount->setResult(1998);//保存失败
        		}
        		elseif( $size!=$fileObject->getSize() ){
        			//@file_put_contents( '/tmp/uico.log', $abs_file."\t".strlen($buff)."\n", FILE_APPEND );
        			$res_XXAccount->setResult(1999);//文件大小不一致
        		}
        		else{
        			$checksum = $obj->calculFileCrc32( $abs_file );
        			if( $checksum != $fileObject->getChecksum() ){
        				$res_XXAccount->setResult(1999);//checkSum不一致
        			}
        			else{
        				$user['uico'] = $uico_dir ."/". $file_name;
        				$update_result = $obj->updateUser( array('uid'=>$uid), array('uico'=>$user['uico']) );
        				if( $update_result ){//保存小头像
        					list($width, $height) = getimagesize($abs_file);
        					$source = $fileObject->getFileType()==106 ? imagecreatefromjpeg($abs_file) : imagecreatefrompng($abs_file);
        					$thumb = imagecreatetruecolor(128, 128);
        					if( imagecopyresampled($thumb, $source, 0, 0, 0, 0, 128, 128, $width, $height) ){
        						$abs_dest_file = $abs_dir."/small_".$file_name;
        						if( $file_ext=='png' && imagepng( $thumb, $abs_dest_file )==false ){
        							$res_XXAccount->setResult(1998);//保存小头像失败
        						}
        						elseif( $file_ext=='jpeg' && imagejpeg( $thumb, $abs_dest_file )==false ){
        							$res_XXAccount->setResult(1998);//保存小头像失败 2
        						}
        						else {
        							//$obj->setUploadTime($user);
        							$res_XXAccount->setResult(0);
        						}
        
        					}
        					else{
        						$res_XXAccount->setResult(1998);//保存小头像失败
        					}
        				}
        				else{
        					$res_XXAccount->setResult(1998);//更新数据库失败
        				}
        			}
        		}
        	}
        }
        
        
        
        
        
    }
    
    
    /* 
     * 获取"我的"信息
     * 
     *  */
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_MYACCOUNTINFOREQ ){
        $res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_MYACCOUNTINFORES );
        $XXMyAccountInfoReq = $XXMGuserAccount->getMy_account_info_req();
        $UserInfo = $XXMyAccountInfoReq->getUser_info();
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
		file_put_contents('/tmp/hah:'.$user['email_verfity'],$user);
            if( empty( $user ) ){
                $res_XXMGAccount->setResult(1998);//失败了
            }
            else{
                $user['dm_level'] = $obj->getUserDmLevel( $uid );
                $XXMGMyAccountInfoRes = new XXProto_XXMGMyAccountInfoRes();
                $XXMGMyAccountInfoRes->setXmg_account_name( $user['uname'] ? $user['uname'] : ( $user['email'] ? $user['email'] : ( $user['fb'] ? $user['fb'] : '' ) ) );//临时措施
                                
                $XXMGMyAccountInfoRes->setNick_name( $user['unickname'] ? $user['unickname'] : '' );
                
                $XXMGMyAccountInfoRes->setEmail( $user['uemail'] ? $user['uemail'] : '' );
                $XXMGMyAccountInfoRes->setEmail_verfity( $user['email_verify'] ? $user['email_verify'] : '' );//email_verfity
                $XXMGMyAccountInfoRes->setCountry( $user['country'] ? $user['country'] : '' );
                    
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
                        $XXMGMyAccountInfoRes->setHead_icon( $head_icon );
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
                        $XXMGMyAccountInfoRes->setSmall_head_icon( $icon );
                    }
                }
                $res_XXMGAccount->setMy_account_info_res( $XXMGMyAccountInfoRes );
            }
        }
    }
    
    /* 
     * 设置签名请求
     *  */
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETSIGNATUREREQ ){
        $res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETSIGNATURERES );
        $XXAccountSetSignatureReq = $XXMGuserAccount->getAccount_set_signature_req();
        $signature = $XXAccountSetSignatureReq->getSignature();
        include_once dirname(dirname(__FILE__)) . "/utils/User.php";
        $obj = new User();
        $result = $obj->updateUser( array('uid'=>$uid ), array('usignature'=>$signature) );
        if( ! $result ){
            $res_XXMGAccount->setResult(1999);//更新失败
        }
    }
    
    /* 
     * 设置性别请求
     *  */
    elseif( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETSEXREQ ){
        $res_XXMGAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETSEXRES );
		$XXAccountSetSexReq = $XXMGuserAccount->getAccount_set_sex_req();
		$sex = $XXAccountSetSexReq->getSex();
        include_once dirname(dirname(__FILE__)) . "/utils/User.php";
        $obj = new User();
        $result = $obj->updateUser( array('uid'=>$uid ), array('usex'=>$sex) );
		if(!$result){
            $res_XXMGAccount->setResult(1999);//更新失败
		}
	}
    else{
        $res_XXMGAccount->setResult(1);//非法子命令字
        $res_XXMGAccount->setSubcmd($subcmd);
        $response->setResult(3);//异常3 非预定义命令字
    }
    $response->setBody( $res_XXMGAccount->serializeToString() );
    sendProtobufResponse($response);
    exit();
}
else{
    $response->setResult(2);//异常2 解不开包
    sendProtobufResponse($response);
    exit();
}

?>
