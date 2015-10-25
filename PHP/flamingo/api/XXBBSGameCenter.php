<?php
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXPBBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSGameCenter.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiutils/XXServerBase.php";
include_once dirname(dirname(__FILE__)) . "/utils/UserBbs2Game.php";

// 数据打包返回
$response = new XXProto_XXUnityCSPkg();
$resHead = new XXProto_XXUnityCSPkgHead();
$resHead->setCmd(1054);
$response->setResult(0);//正常 默认
$response->setHead($resHead);

$postData = getRequest();
if($postData == "")
{
    $response->setResult(XXProto_XXUnityCSErrorCode::XXUnityCS_Err_Unknown_Req);//异常1005  无法解包
    sendProtobufResponse($response);
    exit();
}

//解包数据
$XXUnityCSPkg = XXProto_XXUnityCSPkg::parseFromString($postData);
$head = $XXUnityCSPkg->getHead();
$response->setHead($head);
$obj = new UserBbs2Game();

if($head->getCmd() == XXProto_XXBBSGameCenterProto_CMD::CMD_XXBBSGameCenterProto)//1054
{
    $resXXBBSGameCenterProto = new XXProto_XXBBSGameCenterProto();
    $resXXBBSGameCenterProto->setResult(0);//默认正常

    $body = $XXUnityCSPkg->getBody();
    $XXBBSGameCenterProto = XXProto_XXBBSGameCenterProto::parseFromString($body);
    $subcmd = $XXBBSGameCenterProto->getSubcmd();
    $user_info = $head->getUser_info();
    $platform = $user_info->getPlatformType()==101 ? 'ios' : 'android';

    if($subcmd == XXProto_XXBBSGameCenter_SUBCMD::SUBCMD_XXBBSGameCenterProto_GROUPAPPREQ)//小组推荐游戏请求
    {
        $XXBBSGameCenterGroupAPPReq = $XXBBSGameCenterProto->getGroup_app_req();
        $fid = $XXBBSGameCenterGroupAPPReq->getFid();
        $app_info = $obj->getF2Game( $fid, $platform );
        if( $app_info ){
            //应答
            $resXXBBSGameCenterGroupAPPRes = new XXProto_XXBBSGameCenterGroupAPPRes();
            $resXXSoftwareObject = new XXProto_XXSoftwareObject();
            $resXXSoftwareObject->setApp_name($app_info['Name']);//软件名字
            $resXXSoftwareObject->setPkg_name($app_info['Package']);//包名
            $resXXSoftwareObject->setVersion($app_info['Version']);//版本
            $resXXSoftwareObject->setUpdate_time(strtotime($app_info['UpdateTime']));//更新时间
            $resXXSoftwareObject->setPlatform_type($app_info['recommend']);//支持平台
            $resXXSoftwareObject->setSupport_min($app_info['SystemRequired']);//支持最低系统版本
            //$resXXSoftwareObject->setSoftware_type($app_info['Type']);//类型 
            $resXXSoftwareObject->setDescription($app_info['Description']);//介绍简介
            $resXXSoftwareObject->setUpdate_details($app_info['UpdateDescription']);//更新说明
            if($app_info['app_file']){
                $FileObject = fun_FileObject($app_info['app_file'][0]);
                $resXXSoftwareObject->setPkg_file($FileObject);//安装包
            }
            if($app_info['thumb_file']){
                $FileObject = fun_FileObject($app_info['thumb_file'][0]);
                $resXXSoftwareObject->setIcon_file($FileObject);//图标
            }
            if($app_info['scheme_url']){
                $resXXSoftwareObject->setScheme_url($app_info['scheme_url']);//iOS appStore
            }
            if($app_info['install_link']){
                $resXXSoftwareObject->setInstall_link($app_info['install_link']);//iOS appStore
            }
            if($app_info['pic_file']){
                foreach($app_info['pic_file'] as $k => $v){
                    $FileObject = fun_FileObject($v[0]);
                    $resXXSoftwareObject->appendPictures($FileObject);//宣传图
                }
            }

            $resXXSoftwareObject->setDownload_count($app_info['Downloads']);//下载次数
            $resXXSoftwareObject->setScore($app_info['SuggestScore']);//评分

            $resXXSoftwareObject->setLanguage($app_info['Languages']);//语言
            if(!empty($app_info['Type'])){
                $resXXSoftwareObject->setType_des($app_info['Type']);//游戏类型
            }

            $resXXBBSGameCenterGroupAPPRes->setSoftware_object($resXXSoftwareObject); 
            //回包
            $resXXBBSGameCenterProto->setGroup_app_res($resXXBBSGameCenterGroupAPPRes);
        }
        $resXXBBSGameCenterProto->setSubcmd(XXProto_XXBBSGameCenter_SUBCMD::SUBCMD_XXBBSGameCenterProto_GROUPAPPRES);
    }
    elseif($subcmd == XXProto_XXBBSGameCenter_SUBCMD::SUBCMD_XXBBSGameCenterProto_LOCALAPPREQ)//请求本地游戏列表
    {
        $XXBBSGameCenterLocalAppReq = $XXBBSGameCenterProto->getLocal_app_req();
        $XXSoftwareObject = $XXBBSGameCenterLocalAppReq->getSoftware_object_list();
        if( $XXSoftwareObject ){
            $resXXBBSGameCenterLocalAppRes = new XXProto_XXBBSGameCenterLocalAppRes();
            foreach( $XXSoftwareObject as $k => $v ){
                $info = $obj->getPkg2F( $v->getPkg_name(), $platform, $v->getApp_name );
                if( $info ){
                    //应答
                    $resXXGameApp2Group = new XXProto_XXGameApp2Group();
                    $resXXGameApp2Group->setApp_name($info['app_name']);
                    $resXXGameApp2Group->setPkg_name($info['pkg_name']);
                    if( $info['fid'] ){
                        $resXXGameApp2Group->setFid($info['fid']);
                    }
                    $resXXBBSGameCenterLocalAppRes->appendGameapp_list($resXXGameApp2Group);
                }
            }
            //回包
            $resXXBBSGameCenterProto->setLocal_app_res($resXXBBSGameCenterLocalAppRes);
        }
        $resXXBBSGameCenterProto->setSubcmd(XXProto_XXBBSGameCenter_SUBCMD::SUBCMD_XXBBSGameCenterProto_LOCALAPPRES);
    }
    else//异常
    {
        $resXXBBSGameCenterProto->setResult(1999);//未知错误
    }

    $response->setBody($resXXBBSGameCenterProto->serializeToString());
    sendProtobufResponse($response);
    exit();
}
else
{
    $response->setResult(XXProto_XXBBSGameCenterProto_CMD::CMD_XXBBSGameCenterProto);//未知命令字
    sendProtobufResponse($response);
    exit();
}


function fun_FileObject($file)
{
    $FileObject = new XXProto_FileObject();
    $FileObject->setID($file['ID']);
    $FileObject->setUrl($file['URL']);
    $FileObject->setFileType($file['Filetype']);
    if(isset($file['Size'])){
        $FileObject->setSize($file['Size']);
    }
    if(isset($file['Checksum'])){
        $FileObject->setChecksum($file['Checksum']);
    }
    return $FileObject;
}

?>
