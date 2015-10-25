<?php
/*
 *协议:XXBBSGroup.proto、XXBBSBase.proto、XXPBBase.proto
 *功能:小组请求、应答
 * */
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXPBBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSGroup.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiutils/XXServerBase.php";
include_once dirname(dirname(__FILE__)) . "/utils/UserBbsList.php";
include_once dirname(dirname(__FILE__)) . "/utils/User.php";

// 数据打包返回
$response = new XXProto_XXUnityCSPkg();
$resCsHead = new XXProto_XXUnityCSPkgHead();
$resCsHead->setCmd(1050);
$response->setResult(0);//正常 默认
$response->setHead($resCsHead);

$postData = getRequest();
if($postData == "")
{
    $response->setResult(XXProto_XXUnityCSErrorCode::XXUnityCS_Err_Unknown_Req);//异常1005  无法解包
    sendProtobufResponse($response);
    exit();
}

//解包数据
$xxCSPkgproto = XXProto_XXUnityCSPkg::parseFromString($postData);
$reqCsHead = $xxCSPkgproto->getHead();
$reqCsbody = $xxCSPkgproto->getBody();
$reqCsCmd = $reqCsHead->getCmd();

$response->setHead($reqCsHead);

if($reqCsCmd == XXProto_XXBBSGroupProto_CMD::CMD_XXBBSGroupProto)//1050
{
    $xxGroupProto = XXProto_XXBBSGroupProto::parseFromString($reqCsbody);
    $subcmdReq = $xxGroupProto->getSubcmd();

    $res_xxGroupProto = new XXProto_XXBBSGroupProto();
    $res_xxGroupProto->setResult(0);//默认正常	
    $obj = new UserBbsList();
    $user_obj = new User();
    $uin = $reqCsHead->getUin();

    if( $subcmdReq == XXProto_XXBBSGroupProto_SUBCMD::SUBCMD_XXBBSGroupProto_JOINREQ )//加入小组请求
    {
        $res_xxGroupProto->setSubcmd( XXProto_XXBBSGroupProto_SUBCMD::SUBCMD_XXBBSGroupProto_JOINRES );

        $groupJoinReq = $xxGroupProto->getGroup_join_req();
        $fid_lists = $groupJoinReq->getFid_list();
        $action = $groupJoinReq->getAction();
        $fail_count = 0;

        foreach($fid_lists as $fid)
        {
            if( $action==0 ){//加入
                $result = $obj->addF_uin( array('fid'=>$fid, 'uin'=>$uin) );
            }
            elseif( $action==1 ){//退出
                $result = $obj->delF_uin( array('fid'=>$fid, 'uin'=>$uin) );
            }
            else{
                $result = false;
            }

            if( ! $result ){
                //@file_put_contents( '/tmp/abcd.log', $obj->db->sql." $fid $uin addF_uin \n", FILE_APPEND );
                $fail_count += 1;
            }
            else{//同步更新到User
                $user = $user_obj->getUser( '', $uin );
                $ufid_arr = json_decode( $user['ufid'], true );
                if( $action==0 ){//加入
                    if( is_array($ufid_arr) && in_array( (int)$fid, $ufid_arr ) ){
                        continue;
                    }
                    $ufid_arr[] = (int)$fid;
                }
                elseif( $action==1 ){//退出
                    foreach( $ufid_arr as $_k => $_fid ){
                        if( $_fid==$fid ){
                            unset( $ufid_arr[$_k] );
                            break;
                        }
                    }
                }
                $ufid = json_encode( $ufid_arr );
                $user_obj->updateUser( array('uid'=>$uin), array('ufid'=>$ufid) );
            }
        }
        if( $fail_count && $fail_count==count($fid_lists) ){//全部失败
            $res_xxGroupProto->setResult( 1999 );
        }

    }
    elseif( $subcmdReq == XXProto_XXBBSGroupProto_SUBCMD::SUBCMD_XXBBSGroupProto_LISTREQ )//小组list请求
    {
        $res_xxGroupProto->setSubcmd( XXProto_XXBBSGroupProto_SUBCMD::SUBCMD_XXBBSGroupProto_LISTRES );

        $group_list_req = $xxGroupProto->getGroup_list_req();

        $group_list_type = $group_list_req->getGroup_list_type();
        $begin_value = $group_list_req->getBegin_value();
        $count = $group_list_req->getCount();
        $sb_uin = $group_list_req->getSb_uin();

        $f_list = array();
        if( $group_list_type==XXProto_XXBBSGroupListType::XXBBSGroupListType_None ){
            // do nothing
        }
        elseif( $group_list_type==XXProto_XXBBSGroupListType::XXBBSGroupListType_Banner ){
            $user_info = $reqCsHead->getUser_info();
            $platform = $user_info->getPlatformType()==101 ? 'ios' : 'android';
            $f_list = $obj->getFSortList( 'banner', $begin_value, $count, $platform );
        }
        elseif( $group_list_type==XXProto_XXBBSGroupListType::XXBBSGroupListType_Recommend ){
            $user_info = $reqCsHead->getUser_info();
            $platform = $user_info->getPlatformType()==101 ? 'ios' : 'android';
            $f_list = $obj->getFSortList( 'recommend', $begin_value, $count, $platform );
        }
        elseif( $group_list_type==XXProto_XXBBSGroupListType::XXBBSGroupListType_Game ){
            $f_list = $obj->getFSortList( 'game', $begin_value, $count );
        }
        elseif( $group_list_type==XXProto_XXBBSGroupListType::XXBBSGroupListType_Interest ){
            $f_list = $obj->getFSortList( 'interest', $begin_value, $count );
        }
        elseif( $group_list_type==XXProto_XXBBSGroupListType::XXBBSGroupListType_SB ){//某人的小组列表
            $uinfo = $user_obj->getUser( '', $sb_uin );
            $f_list = $obj->getMyFList( json_decode($uinfo['ufid'], true) , $begin_value, $count);
        }
        else{
            $res_xxGroupProto->setResult( 1999 );
        }
        if( $f_list ){
            $res_XXBBSGroupListRes = new XXProto_XXBBSGroupListRes();
            $res_XXBBSGroupListRes->setGroup_list_type( $group_list_type );
            include_once dirname(__FILE__) . "/SetPBFunctions.php";
            foreach( $f_list as $k => $v ){
                if(!empty($v)){
                    $res_XXBBSGroupInfo = setPBGroupInfo($v, $uin, $obj, $user_obj, $group_list_type);
                }
                if(!empty($res_XXBBSGroupInfo)){
                    $res_XXBBSGroupListRes->appendGroup_list( $res_XXBBSGroupInfo );
                }
            }
            $res_xxGroupProto->setGroup_list_res( $res_XXBBSGroupListRes );
        }
    }
    elseif( $subcmdReq == XXProto_XXBBSGroupProto_SUBCMD::SUBCMD_XXBBSGroupProto_GUIDERECOMMENDREQ )//引导推荐小组列表请求
    {
        $res_xxGroupProto->setSubcmd( XXProto_XXBBSGroupProto_SUBCMD::SUBCMD_XXBBSGroupProto_GUIDERECOMMENDRES );
        $group_guide_recommend_req = $xxGroupProto->getGroup_guide_recommend_req();
        $XXSoftwareObject = $group_guide_recommend_req->getSoftware_object_list();
        $XXBBSGroupGuideRecommendRes = new XXProto_XXBBSGroupGuideRecommendRes();
        $fid_arr = array();
        if( $XXSoftwareObject ){
            $user_info = $reqCsHead->getUser_info();
            $platform = $user_info->getPlatformType()==101 ? 'ios' : 'android';
            include_once dirname(dirname(__FILE__)) . "/utils/UserBbs2Game.php";
            $b2g_obj = new UserBbs2Game();
            foreach( $XXSoftwareObject as $k => $v ){
                $info = $b2g_obj->getPkg2F( $v->getPkg_name(), $platform, $v->getApp_name() );
                if( $info ){
                    if( in_array($info, $fid_arr) ) continue;
                    $fid_arr[] = $info;
                }
            }
        }
        include_once dirname(__FILE__) . "/SetPBFunctions.php";
        foreach( $fid_arr as $k => $v ){
            $group_info = $obj->getFOneinfo( $v['fid'] );
            if( $group_info ){
                $res_XXBBSGroupInfo = setPBGroupInfo($group_info, $uin, $obj, $user_obj, 0);
                $XXBBSGroupGuideRecommendRes->appendGame_group_list( $res_XXBBSGroupInfo );
            }
        }
        if( empty($fid_arr) ){//空 则推荐六个
            $f_list = $obj->getFSortList( 'game', 0, 4 );
            //$f_list[] = $obj->getFOneinfo( 41 );;
            foreach( $f_list as $k => $v ){
                $res_XXBBSGroupInfo = setPBGroupInfo($v, $uin, $obj, $user_obj, 0);
                $XXBBSGroupGuideRecommendRes->appendGame_group_list( $res_XXBBSGroupInfo );
            }
        }

        $f_list = $obj->getFSortList( 'interest', 0, 6 );
        foreach( $f_list as $k => $v ){
            $res_XXBBSGroupInfo = setPBGroupInfo($v, $uin, $obj, $user_obj, 0);
            $XXBBSGroupGuideRecommendRes->appendOther_group_list( $res_XXBBSGroupInfo );
        }

        $res_xxGroupProto->setGroup_guide_recommend_res( $XXBBSGroupGuideRecommendRes );
    }
    elseif( $subcmdReq == XXProto_XXBBSGroupProto_SUBCMD::SUBCMD_XXBBSGroupProto_REQUIREGROUPINFOREQ )//请求小组信息
    {
        $res_xxGroupProto->setSubcmd( XXProto_XXBBSGroupProto_SUBCMD::SUBCMD_XXBBSGroupProto_REQUIREGROUPINFORES );
        $XXBBSGroupRequireGroupInfoRes = new XXProto_XXBBSGroupRequireGroupInfoRes();
        $require_group_info_req = $xxGroupProto->getRequire_group_info_req();
        $fid = $require_group_info_req->getFid();
        $finfo = $obj->getFOneinfo( $fid );;
        include_once dirname(__FILE__) . "/SetPBFunctions.php";
        $res_XXBBSGroupInfo = setPBGroupInfo($finfo, $uin, $obj, $user_obj, 0);
        $XXBBSGroupRequireGroupInfoRes->setGroup_info( $res_XXBBSGroupInfo );
        $res_xxGroupProto->setRequire_group_info_res( $XXBBSGroupRequireGroupInfoRes );
    }
    else
    {
        $res_xxGroupProto->setResult( 1999 );
        $res_xxGroupProto->setSubcmd( $subcmdReq );
    }
    $response->setBody( $res_xxGroupProto->serializetostring() );
    sendProtobufResponse($response);

}
else
{
    $response->setResult(XXProto_XXUnityCSErrorCode::XXUnityCS_Err_Unknown_CMD);//异常1004 未知命令字
    sendProtobufResponse($response);
    exit();	
}


?>
