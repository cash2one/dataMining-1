<?php
/*
 *协议:XXBBSData.proto、XXBBSBase.proto、XXPBBase.proto
 *功能:
 * */
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXPBBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSH5Data.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiutils/XXServerBase.php";
include_once dirname(dirname(__FILE__)) . "/utils/UserBbsList.php";
include_once dirname(dirname(__FILE__)) . "/utils/User.php";

// 数据打包返回
$response = new XXProto_XXUnityCSPkg();
$head_res = new XXProto_XXUnityCSPkgHead();
$head_res->setCmd(1052);
$response->setResult(0);//正常 默认
$response->setHead($head_res);

//$postData = getRequest();
$postData=file_get_contents("php://input");
if($postData == "")
{
    $response->setResult(XXProto_XXUnityCSErrorCode::XXUnityCS_Err_Unknown_Req);//异常1005  无法解包
    echo base64_encode( $response->serializeToString() );
    //sendProtobufResponse($response);
    exit();
}

//解包数据
//$xxCSPkgproto = XXProto_XXUnityCSPkg::parseFromString($postData);
$xxCSPkgproto = XXProto_XXUnityCSPkg::parseFromString(base64_decode($postData));
$head_req = $xxCSPkgproto->getHead();
$body_req = $xxCSPkgproto->getBody();
$cmd_req = $head_req->getCmd();
$obj = new UserBbsList();
$user_obj = new User();
$uin == 102; //用于后面跳过setPBGroup()

if($cmd_req == 1052)//1052
{
    //回包
    $xxDataProto_res = new XXProto_XXBBSH5DataProto();
    $xxDataProto_res->setResult(0);//默认 正常  
    $xxDataProto_res->setSubcmd(2);//协议命令字
    $xxDataProto = XXProto_XXBBSH5DataProto::parseFromString($body_req);
    $subcmd_req = $xxDataProto->getSubcmd();
    
    //帖子详情
    if($subcmd_req == XXProto_XXBBSH5DataProto_SUBCMD::SUBCMD_XXBBSH5DATAPROTO_POSTSREQ)
    {
        $XXBBSH5DataPostReq = $xxDataProto->getPost_req();
        $fid = $XXBBSH5DataPostReq->getFid();
        $tid = $XXBBSH5DataPostReq->getTid();

        $XXBBSH5DataPostRes = new XXProto_XXBBSH5DataPostRes();//回包

        //获取帖子
        $tinfo = $obj->getTinfo($fid, $tid, 'id', 1, ' AND t_status=1');
        if( !empty($tinfo) ){
            $v = $tinfo;

            $postInfo_res = new XXProto_XXBBSPostInfo();
            $postInfo_res->setTitle($v['t_title']);
            $postInfo_res->setContent($v['t_content']);
            $postInfo_res->setTid($v['id']);
            $postInfo_res->setCreate_time($v['t_addtime']);

            $postInfo_res->setModyfied_time($v['t_ding_lasttime']);
            $postInfo_res->setDianzan_count($v['t_dianzan_count']);//点赞数量
            $postInfo_res->setComment_count($v['t_comment_count']);//评论数量
            if(isset($v['t_top'])){
                $postInfo_res->setIs_top($v['t_top']);//置顶
            }
            if(isset($v['t_best'])){
                $postInfo_res->setIs_best($v['t_best']);//精帖
            }

            $uinfo = $user_obj->getUser('',$v['t_create_uin']);//获取作者信息
            if($uinfo){
                $userinfo_res = new XXProto_UserRoleInfo();
                $userinfo_res->setUin($v['t_create_uin']);
                if($uinfo['unickname']){
                    $userinfo_res->setNick_name( $uinfo['unickname'] ); 
                }
                if($uinfo['uico']){
                    $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $uinfo['uico'] );
                    $userinfo_res->setHead_url( $small_head_url );                  
                    $userinfo_res->setBig_head_url( $user_obj->uico_dpre . $uinfo['uico'] );                    
                }
                $postInfo_res->setRole_info($userinfo_res);
            }


            include_once dirname(__FILE__) . "/SetPBFunctions.php";
            $group = $obj->getFOneinfo( $v['fid'] );//获取小组信息
            if($group){
                $XXBBSGroupInfo_res = setPBGroupInfo($group, $uin, $obj, $user_obj);
                $postInfo_res->setGroup_info($XXBBSGroupInfo_res);
            }

            if( $v['t_fb'] ){
                try{
                    $_FileObjectArray = XXProto_FileObjectArray::parseFromString(stripslashes($v['t_fb']));
                    if( is_object($_FileObjectArray) ){
                        $FileObjectArray = $_FileObjectArray->getFileobject_list();
                        foreach( $FileObjectArray as $fileObject ){
                            $fileObject->clearFile_bytes();
                            $postInfo_res->appendPhotos( $fileObject );
                        }
                    }
                }catch(Exception $e){
                }
            }
            $XXBBSH5DataPostRes->setPost_info($postInfo_res);
            $xxDataProto_res->setPost_res($XXBBSH5DataPostRes);
        }else{

        }

    }
    else if($subcmd_req == 3){

        $XXBBSH5DataCommentReq = $xxDataProto->getComment_req();
        $fid = $XXBBSH5DataCommentReq->getFid();
        $tid = $XXBBSH5DataCommentReq->getTid();
        $begin_cid = $XXBBSH5DataCommentReq->getBegin_cid();
        $count = $XXBBSH5DataCommentReq->getCount();
        $direction = 0;

        $XXBBSH5DataCommentRes = new XXProto_XXBBSH5DataCommentRes();//回包

        //获取评论
        $CommentList = $obj->getCommentList( $fid, $tid, $count, $begin_cid , "AND c_status=1", $direction);

        //组包
        if( $CommentList ){
            foreach( $CommentList as $k => $v ){
                //一个评论
                $commentInfo_res = new XXProto_XXBBSCommentInfo();
                //$userRoleInfo = new XXProto_UserRoleInfo();
                $commentInfo_res->setContent( $v['c_content'] );//评论内容
                $commentInfo_res->setCreate_time( $v['c_addtime'] );//评论时间
                $commentInfo_res->setCid($v['id']);
                $commentInfo_res->setTid($v['tid']);
                $commentInfo_res->setFid($v['fid']);
                if( $v['c_target_cid'] ){
                    //$commentInfo_res->setTarget_cid($v['c_target_cid']);
                    //这是一个被评论的评论
                    $XXBBSCommentTargetInfo = new XXProto_XXBBSCommentTargetInfo();
                    $XXBBSCommentTargetInfo->setTarget_cid($v['c_target_cid']);
                    $target_cinfo = $obj->getCommentList( $v['fid'], $v['tid'], 1, 0, "AND c_status=1 AND id='{$v['c_target_cid']}'" );
                    if( $target_cinfo ){
                        $XXBBSCommentTargetInfo->setContent($target_cinfo[0]['c_content']);
                        $target_uinfo = $user_obj->getUser('',$target_cinfo[0]['c_create_uin']);//获取作者信息
                        if($target_uinfo){
                            $userinfo_res = new XXProto_UserRoleInfo();
                            $userinfo_res->setUin($target_cinfo[0]['c_create_uin']);
                            if($target_uinfo['unickname']){
                                $userinfo_res->setNick_name( $target_uinfo['unickname'] );  
                            }
                            if($target_uinfo['uico']){
                                $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $target_uinfo['uico'] );
                                $userinfo_res->setHead_url( $small_head_url );                  
                                $userinfo_res->setBig_head_url( $user_obj->uico_dpre . $target_uinfo['uico'] );                 
                            }
                            $XXBBSCommentTargetInfo->setRole_info($userinfo_res);
                        }
                    }
                    $commentInfo_res->setTarget_info($XXBBSCommentTargetInfo);
                }

                $uinfo = $user_obj->getUser('',$v['c_create_uin']);//获取作者信息
                if($uinfo){
                    $userinfo_res = new XXProto_UserRoleInfo();
                    $userinfo_res->setUin($v['c_create_uin']);
                    if($uinfo['unickname']){
                        $userinfo_res->setNick_name( $uinfo['unickname'] ); 
                    }
                    if($uinfo['uico']){
                        $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $uinfo['uico'] );
                        $userinfo_res->setHead_url( $small_head_url );                  
                        $userinfo_res->setBig_head_url( $user_obj->uico_dpre . $uinfo['uico'] );                    
                    }
                    $commentInfo_res->setRole_info($userinfo_res);
                }
                $XXBBSH5DataCommentRes->appendComment_info_list($commentInfo_res);//一个评论
            }
        }

        $xxDataProto_res->setComment_res($XXBBSH5DataCommentRes);
        $xxDataProto_res->setSubcmd(4);

    }
    else
    {
        $xxDataProto_res->setResult(1999);//未知错误
        $xxDataProto_res->setSbucmd($subcmd_req);//协议命令字
    }

    $response->setBody($xxDataProto_res->serializeToString());
    echo base64_encode( $response->serializeToString() );
    //sendProtobufResponse($response);
    exit();
}
else
{
    $response->setResult(XXProto_XXUnityCSErrorCode::XXUnityCS_Err_Unknown_CMD);//异常1004 未知命令字
    echo base64_encode( $response->serializeToString() );
    //sendProtobufResponse($response);
    exit();
}

?>
