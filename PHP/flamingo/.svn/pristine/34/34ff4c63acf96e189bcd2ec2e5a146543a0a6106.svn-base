<?php
    /*
     处理 用户上传头像
     */

include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXPBBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/apiutils/XXServerBase.php";
include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXMGUserAccount.proto.php";
require_once dirname(dirname(__FILE__)) . "/apiutils/XXTEA.php";
require_once dirname(dirname(__FILE__)) . "/include/config.php";

$getData = $_GET['uico'];
$getData = xxtea_decrypt( base64_decode(urldecode($getData)), $XX_KEY['decrypt'] );
if( empty($getData) ){
    $getData = xxtea_decrypt( base64_decode($_GET['uico']), $XX_KEY['decrypt'] );
}

$buff = file_get_contents('php://input', 'r');

// 数据打包返回
$response = new XXProto_XXUnityCSPkg();
$head = new XXProto_XXUnityCSPkgHead();
$head->setCmd(1601);
$response->setResult(0);//正常 默认
$response->setHead($head);
if($getData == "")
{
    $response->setResult(1);//异常1 空包
    sendProtobufResponse($response);
    exit();
}
$XXUnityCSPkg = XXProto_XXUnityCSPkg::parseFromString($getData);
$head = $XXUnityCSPkg->getHead();
$body = $XXUnityCSPkg->getBody();
if( $head->getCmd()==1601 ){
    $response->setHead($head);
    $uid = $head->getUin();
    $loginKey = $head->getLogin_key();
    $userAccount = XXProto_XXMGAccountProto::parseFromString( $body );
    $subcmd = $userAccount->getSubcmd();
    $res_XXAccount = new XXProto_XXMGAccountProto();
    $res_XXAccount->setResult(0);//正常

    if( $subcmd == XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETHEADREQ ){//设置头像
        $res_XXAccount->setSubcmd( XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETHEADRES );
        $XXProto_XXAccountSetHeadReq = $userAccount->getAccount_set_head_req();
        $UserInfo = $XXProto_XXAccountSetHeadReq->getUser_info();
        $fileObject = $XXProto_XXAccountSetHeadReq->getFile_object();
        if( empty( $buff ) ){
            $res_XXAccount->setResult(1999);//空值 其他错误
        }
        else{
        	
            include_once dirname(dirname(__FILE__)) . "/utils/User.php";
            $obj = new User();
            $obj->redis->use_redis('write');
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
                                	$obj->setUploadTime($user);
                                	//$res_XXAccount->setResult(0);
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
    else{
        $res_XXAccount->setResult(1);//非法子命令字
        $res_XXAccount->setSubcmd($subcmd);
        $response->setResult(3);//异常3 非预定义命令字
    }
    $response->setBody( $res_XXAccount->serializeToString() );
    sendProtobufResponse($response);
    exit();
}




else{
    $response->setResult(2);//异常2 解不开包
    sendProtobufResponse($response);
    exit();
}

?>
