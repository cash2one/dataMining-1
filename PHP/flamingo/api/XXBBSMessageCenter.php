<?php
/*
 *协议:XXBBSMessageCenter.proto、XXBBSBase.proto、XXPBBase.proto
 *功能:
 * */
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXPBBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSMessageCenter.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiutils/XXServerBase.php";
include_once dirname(dirname(__FILE__)) . "/utils/UserMessage.php";
include_once dirname(dirname(__FILE__)) . "/utils/User.php";
include_once dirname(dirname(__FILE__)) . "/utils/ActivityBbsList.php";



// 数据打包返回
$response = new XXProto_XXUnityCSPkg();
$head_res = new XXProto_XXUnityCSPkgHead();
$head_res->setCmd(1055);
$response->setResult(0);//正常 默认
$response->setHead($head_res);

$postData = getRequest();
if($postData == "")
{
    $response->setResult(XXProto_XXUnityCSErrorCode::XXUnityCS_Err_Unknown_Req);//异常1005  无法解包
    sendProtobufResponse($response);
    exit();
}
//解包数据
$xxCSPkgproto = XXProto_XXUnityCSPkg::parseFromString($postData);
$head_req = $xxCSPkgproto->getHead();
$body_req = $xxCSPkgproto->getBody();
$cmd_req = $head_req->getCmd();
$obj = new UserMessage();
$user_obj = new User();

if($cmd_req == XXProto_XXBBSMessageCenterProto_CMD::CMD_XXBBSMessageCenterProto)//1055
{
    //回包
    $xxMessageCenterProto_res = new XXProto_XXBBSMessageCenterProto();
    $xxMessageCenterProto_res->setResult(0);//默认 正常  

    $xxMessageCenterProto = XXProto_XXBBSMessageCenterProto::parseFromString($body_req);
    $subcmd_req = $xxMessageCenterProto->getSubcmd();
    $uin = $head_req->getUin();
    $uinfo = $user_obj->getUser( '', $uin );


    if($subcmd_req == XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_STATEREQ){ //总的未读数请求
        $xxMessageCenterProto_res->setSubcmd( XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_STATERES );
        $XXBBSMessageCenterStateRes = new XXProto_XXBBSMessageCenterStateRes();
        $sixin_state = $obj->getUserState( $uin, $uinfo['uex'] );
        if( $sixin_state ){
            $XXBBSMessageCenterStateRes->setUnread_msg_count( $sixin_state['unread_msg_count'] );
            $XXBBSMessageCenterStateRes->setUnread_reply_count( $sixin_state['unread_reply_count'] );
        }
        $xxMessageCenterProto_res->setState_res( $XXBBSMessageCenterStateRes );
    }
    elseif($subcmd_req == XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_MAILTHREADLISTREQ){ //私信列表请求
        $xxMessageCenterProto_res->setSubcmd( XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_MAILTHREADLISTRES );
        $XXBBSMessageCenterMailThreadListRes = new XXProto_XXBBSMessageCenterMailThreadListRes();

        $XXBBSMessageCenterMailThreadListReq = $xxMessageCenterProto->getThread_list_req();
        $start_time = $XXBBSMessageCenterMailThreadListReq->getStart_time();
        $direction = $XXBBSMessageCenterMailThreadListReq->getDirection();
        $count = $XXBBSMessageCenterMailThreadListReq->getCount();

        //        $mail_chat_list = $obj->getUserMailChatList( $uin, $uinfo['uex'], $start_time, $direction, $count );
        $mail_chat_list = $obj->getUserMailChatList2( $uin, $uinfo['uex'], $start_time, $direction, $count);

        if( $mail_chat_list ){
            foreach( $mail_chat_list as $k => $v ){
                $mail_thread = new XXProto_XXMailThread();
                $to_u_info = $user_obj->getUser( '', $v['uin2'] );
                if( $to_u_info ){
                    $userrole_info = new XXProto_UserRoleInfo();
                    $userrole_info->setUin( $v['uin2'] );
                    if( $to_u_info['unickname'] ){
                        $userrole_info->setNick_name( $to_u_info['unickname'] );
                    }
                    if( $to_u_info['uico'] ){
                        $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $to_u_info['uico'] );
                        $userrole_info->setHead_url( $small_head_url );
                        $userrole_info->setBig_head_url( $user_obj->uico_dpre . $to_u_info['uico'] );
                    }
                    $mail_thread->setRole_info( $userrole_info );
                }
                else{//用户已被后台删除则略过
                    continue;
                }

                $mail_thread->setUnread_count( $v['unread_count'] );

                if( $v['latest_msg'] ){
                    $latest_msg = new XXProto_XXMailMessage();
                    $isMe = $v['latest_msg']['to_uin']==$uin ? 1 : 0;
                    $latest_msg->setMail_id( $v['latest_msg']['id'] );
                    $latest_msg->setTimestamp( $v['latest_msg']['addtime'] );
                    $latest_msg->setMsg( $v['latest_msg']['msg'] );
                    $latest_msg->setIsMe( $isMe );
                    $mail_thread->setLatest_msg( $latest_msg );
                }

                $XXBBSMessageCenterMailThreadListRes->appendMail_thread_list( $mail_thread );
            }
        }
        $xxMessageCenterProto_res->setThread_list_res( $XXBBSMessageCenterMailThreadListRes );
    }
    elseif($subcmd_req == XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_MAILCHATLISTREQ){ //聊天对话数据请求
        $xxMessageCenterProto_res->setSubcmd( XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_MAILCHATLISTRES );
        $XXBBSMessageCenterMailChatListRes = new XXProto_XXBBSMessageCenterMailChatListRes();

        $XXBBSMessageCenterMailChatListReq = $xxMessageCenterProto->getChat_list_req();
        $target_uin = $XXBBSMessageCenterMailChatListReq->getTarget_uin();
        $start_mail_id = $XXBBSMessageCenterMailChatListReq->getStart_mail_id();
        $direction = $XXBBSMessageCenterMailChatListReq->getDirection();
        $count = $XXBBSMessageCenterMailChatListReq->getCount();
        //$uinfo['ex']
        $msg_list = $obj->getUser2UserMsgList2( $uin, $uinfo['uex'], $target_uin, $start_mail_id, $direction, $count );
        if( $msg_list ){
            foreach( $msg_list as $k => $v ){
                $msg = new XXProto_XXMailMessage();
                $isMe = $v['from_uin']==$uin ? 1 : 0;
                $msg->setMail_id( $v['id'] );
                $msg->setTimestamp( $v['addtime'] );
                $msg->setMsg( $v['msg'] );
                $msg->setIsMe( $isMe );

                $XXBBSMessageCenterMailChatListRes->appendMail_message_list( $msg );
            }
        }

        $xxMessageCenterProto_res->setChat_list_res( $XXBBSMessageCenterMailChatListRes );

    }
    elseif($subcmd_req == XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_MAILDELETEREQ){ //thread删除请求
        $xxMessageCenterProto_res->setSubcmd( XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_MAILDELETERES );
        //$XXBBSMessageCenterMailDeleteRes = new XXProto_XXBBSMessageCenterMailDeleteRes();

        $XXBBSMessageCenterMailDeleteReq = $xxMessageCenterProto->getMail_delete_req();
        $target_uin = $XXBBSMessageCenterMailDeleteReq->getTarget_uin();
        $del_result = $obj->delUser2UserSess2( $uin, $uinfo['uex'], $target_uin );
        if( ! $del_result ){
            $xxMessageCenterProto_res->setResult(1999);//未成功
        }
        //$xxMessageCenterProto_res->setMail_delete_res( $XXBBSMessageCenterMailDeleteRes );
    }
    elseif($subcmd_req == XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_MAILCHATREQ){ //发私信请求
        $xxMessageCenterProto_res->setSubcmd( XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_MAILCHATRES );

        $XXBBSMessageCenterMailChatReq = $xxMessageCenterProto->getMail_chat_req();
        $target_uin = $XXBBSMessageCenterMailChatReq->getTarget_uin();
        $msg = $XXBBSMessageCenterMailChatReq->getMsg();
        $to_u_info = $user_obj->getUser( '', $target_uin );

        $mail_id = $obj->sendMsgUser2User( $uin, $uinfo['uex'], $target_uin, $to_u_info['uex'], $msg );
        if( $mail_id ){
            $XXBBSMessageCenterMailChatRes = new XXProto_XXBBSMessageCenterMailChatRes();
            $XXBBSMessageCenterMailChatRes->setMail_id($mail_id);
            $t = time();
            $XXBBSMessageCenterMailChatRes->setTimestamp($t);
            $xxMessageCenterProto_res->setMail_chat_res( $XXBBSMessageCenterMailChatRes );
        }
        else{
            $xxMessageCenterProto_res->setResult(1999);//未成功
        }
    }
    elseif($subcmd_req == XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_REPLYLISTREQ){ //评论(回复)列表请求
        $xxMessageCenterProto_res->setSubcmd( XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_REPLYLISTRES );

        $XXBBSMessageCenterReplyListReq = $xxMessageCenterProto->getReply_list_req();
        $start_time = $XXBBSMessageCenterReplyListReq->getStart_time();
        $direction = $XXBBSMessageCenterReplyListReq->getDirection();
        $count = $XXBBSMessageCenterReplyListReq->getCount();
        $id_map_list = $obj->getUserReply( $uin, $start_time, $direction, $count );
        $XXBBSMessageCenterReplyListRes = new XXProto_XXBBSMessageCenterReplyListRes();


        if( $id_map_list ){
            include_once dirname(dirname(__FILE__)) . "/utils/UserBbsList.php";
            $bbs_obj = new UserBbsList();
            include_once dirname(__FILE__) . "/SetPBFunctions.php";
            foreach( $id_map_list as $k => $v ){
                $info = array();
                $XXBBSMessageReplyInfo = new XXProto_XXBBSMessageReplyInfo();
                if( $v['post_type']==0 ){//普通帖子
                    $info = $bbs_obj->getUserReplyInfo( $v['fid'], $v['tid'], $v['cid'] );
                    @file_put_contents('/tmp/UserBbs.log', 'LINE:'.__LINE__.' '.date('d-H-i-s')."[71]======".print_r($info,true)."\n", FILE_APPEND);
                    if( $info ){//组装返回的数据
                        if( $v['cid'] && empty($info['cinfo']) ) continue;//评论或者回复已被删除，不返回
                        $XXBBSMessageReplyInfo->setPost_type(0);
                        if( $info['tinfo'] ){//帖子内容
                            $postInfo_res = new XXProto_XXBBSPostInfo();
                            $postInfo_res->setTitle($info['tinfo']['t_title']);
                            $postInfo_res->setContent($info['tinfo']['t_content']);
                            $postInfo_res->setTid($info['tinfo']['id']);
                            $postInfo_res->setCreate_time($info['tinfo']['t_addtime']);

                            $postInfo_res->setModyfied_time($info['tinfo']['t_ding_lasttime']);
                            $postInfo_res->setDianzan_count($info['tinfo']['t_dianzan_count']);//点赞数量
                            $postInfo_res->setComment_count($info['tinfo']['t_comment_count']);//评论数量

                            $uinfo = $user_obj->getUser('',$info['tinfo']['t_create_uin']);//获取作者信息
                            if($uinfo){
                                $userinfo_res = new XXProto_UserRoleInfo();
                                $userinfo_res->setUin($info['tinfo']['t_create_uin']);
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

                            $group = $bbs_obj->getFOneinfo( $info['tinfo']['fid'] );//获取小组信息
                            if($group){
                                $XXBBSGroupInfo_res = setPBGroupInfo($group, $uin, $bbs_obj, $user_obj);
                                $postInfo_res->setGroup_info($XXBBSGroupInfo_res);

                                // $postInfo_res->setGroup_info($XXBBSGroupInfo_res);
                            }
                            $has_zan = $bbs_obj->checkUserTDianzan( $uin, $info['tinfo']['fid'], $info['tinfo']['id'], $info['tinfo']['t_ex'] );
                            if( $has_zan ){
                                $postInfo_res->setHas_zan(1);
                            }
                            else{
                                $postInfo_res->setHas_zan(0);
                            }
                            if( $info['tinfo']['t_fb'] ){                                
                                try{
                                    $_FileObjectArray = XXProto_FileObjectArray::parseFromString(stripslashes($info['tinfo']['t_fb']));
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
                            if($info['tinfo']['video_fb']){//视频
                                $VideoObject = XXProto_VideoObject::parseFromString($info['tinfo']['video_fb']);
                                $postInfo_res->setVideo($VideoObject);//返回视频
                            }

                            //设置
                            $XXBBSMessageReplyInfo->setCommon_post_info( $postInfo_res );
                        }
                        if( $info['cinfo'] ){//评论内容
                            $commentInfo_res = new XXProto_XXBBSCommentInfo();
                            //$userRoleInfo = new XXProto_UserRoleInfo();
                            $commentInfo_res->setContent( $info['cinfo']['c_content'] );//评论内容
                            $commentInfo_res->setCreate_time( $info['cinfo']['c_addtime'] );//评论时间
                            $commentInfo_res->setCid($info['cinfo']['id']);
                            $commentInfo_res->setTid($info['cinfo']['tid']);
                            $commentInfo_res->setFid($info['cinfo']['fid']);
                            //
                            if( $info['cinfo']['c_target_cid'] ){
                                //这是一个被评论的评论
                                $XXBBSCommentTargetInfo = new XXProto_XXBBSCommentTargetInfo();
                                $XXBBSCommentTargetInfo->setTarget_cid($info['cinfo']['c_target_cid']);
                                $target_cinfo = $bbs_obj->getCommentList( $info['cinfo']['fid'], $info['cinfo']['tid'], 1, 0, "AND c_status=1 AND id='{$info['cinfo']['c_target_cid']}'" );
                                if( $target_cinfo ){
                                    $XXBBSCommentTargetInfo->setContent($target_cinfo[0]['c_content']);
                                    /*
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
                                     */
                                }
                                $commentInfo_res->setTarget_info($XXBBSCommentTargetInfo);
                            }

                            $uinfo = $user_obj->getUser('', $info['cinfo']['c_create_uin']);//获取作者信息
                            if($uinfo){
                                $userinfo_res = new XXProto_UserRoleInfo();
                                $userinfo_res->setUin($info['cinfo']['c_create_uin']);
                                if($uinfo['unickname'] ){
                                    $userinfo_res->setNick_name( $uinfo['unickname'] );	
                                }
                                if($uinfo['uico']){
                                    $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $uinfo['uico'] );
                                    $userinfo_res->setHead_url( $small_head_url );
                                    $userinfo_res->setBig_head_url( $user_obj->uico_dpre . $uinfo['uico'] );
                                }
                                $commentInfo_res->setRole_info($userinfo_res);
                            }
                            //设置
                            $XXBBSMessageReplyInfo->setComment_info( $commentInfo_res );
                        }
                    }
                }
                elseif( $v['post_type']==1 ){//活动帖子
                    $a_bbs_obj = new ActivityBbsList();
                    $info = $a_bbs_obj->getAUserReplyInfo( $v['tid'], $v['cid'] );
                    if( $info && $info['cinfo'] ){//组装返回的数据,评论或恢复不存在，不返回
                        $XXBBSMessageReplyInfo->setPost_type(1);

                        if( $info['tinfo'] ){//帖子内容
                            $activity_postInfo_res = new XXProto_XXBBSActivityPostInfo();
                            $activity_postInfo_res->setTitle($info['tinfo']['at_title']);

                            $at_photo = json_decode($info['tinfo']['at_photo'], true);
                            foreach($at_photo as $kf=>$vf){
                                $fb = new XXProto_FileObject();
                                $fb->setID(1);
                                $fb->setUrl($a_bbs_obj->pic_dpre.$vf['url']);
                                $activity_postInfo_res->appendPhoto($fb);
                            }
                            $activity_postInfo_res->setAtid($info['tinfo']['id']);

                            if($info['tinfo']['ainfo']){//活动,返回结束时间用于判断活动是否结束了,以便客户端判断是否可以回复评论
                                $XXBBSActivityInfo = new XXProto_XXBBSActivityInfo();
                                $TimeControl = new XXProto_TimeControl();//时间控制
                                $TimeControl->setStartTime($info['tinfo']['ainfo']['a_starttime']);
                                $TimeControl->setEndTime($info['tinfo']['ainfo']['a_endtime']);
                                $XXBBSActivityInfo->setTime_control($TimeControl);
                                $XXBBSActivityInfo->setAfid($info['tinfo']['ainfo']['id']);
                                $activity_postInfo_res->setActivity_info($XXBBSActivityInfo);
                            }

                            $activity_postInfo_res->setCreate_time($info['tinfo']['at_addtime']);
                            $activity_postInfo_res->setModyfied_time(strtotime($info['tinfo']['at_updatetime']));
                            $activity_postInfo_res->setComment_count($info['tinfo']['at_comment_count']);
                            $activity_postInfo_res->setDianzan_count($info['tinfo']['at_dianzan_count']);

                            $uinfo = $user_obj->getUser('',$info['tinfo']['at_create_uin']);//获取作者信息
                            if($uinfo){
                                $userinfo_res = new XXProto_UserRoleInfo();
                                $userinfo_res->setUin($info['tinfo']['at_create_uin']);
                                if($uinfo['unickname']){
                                    $userinfo_res->setNick_name( $uinfo['unickname'] ); 
                                }
                                if($uinfo['uico']){
                                    $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $uinfo['uico'] );
                                    $userinfo_res->setHead_url( $small_head_url );                  
                                    $userinfo_res->setBig_head_url( $user_obj->uico_dpre . $uinfo['uico'] );
                                }
                                $activity_postInfo_res->setRole_info($userinfo_res);
                            }


                            $has_zan = $a_bbs_obj->checkUserATDianzan( $uin, $info['tinfo']['id'], $info['tinfo']['t_ex'] );
                            if( $has_zan ){
                                $activity_postInfo_res->setHas_zan(1);
                            }
                            else{
                                $activity_postInfo_res->setHas_zan(0);
                            }
                            // if( $info['tinfo']['t_fb'] ){
                            //     try{
                            //         $_FileObjectArray = XXProto_FileObjectArray::parseFromString($info['tinfo']['t_fb']);
                            //         if( is_object($_FileObjectArray) ){
                            //             $FileObjectArray = $_FileObjectArray->getFileobject_list();
                            //             foreach( $FileObjectArray as $fileObject ){
                            //                 $fileObject->clearFile_bytes();
                            //                 $activity_postInfo_res->appendPhotos( $fileObject );
                            //             }
                            //         }
                            //     }catch(Exception $e){
                            //     }
                            // }
                            //设置
                            $XXBBSMessageReplyInfo->setActivity_post_info( $activity_postInfo_res );
                        }

                        if( $info['cinfo'] ){//评论内容
                            $commentInfo_res = new XXProto_XXBBSCommentInfo();
                            //$userRoleInfo = new XXProto_UserRoleInfo();
                            $commentInfo_res->setContent( $info['cinfo']['atc_content'] );//评论内容
                            $commentInfo_res->setCreate_time( $info['cinfo']['atc_addtime'] );//评论时间
                            $commentInfo_res->setCid($info['cinfo']['id']);
                            $commentInfo_res->setTid($info['cinfo']['atid']);
                            $commentInfo_res->setFid($info['cinfo']['afid']);
                            //
                            if( $info['cinfo']['atc_target_cid'] ){
                                //这是一个被评论的评论
                                $XXBBSCommentTargetInfo = new XXProto_XXBBSCommentTargetInfo();
                                $XXBBSCommentTargetInfo->setTarget_cid($info['cinfo']['atc_target_cid']);
                                $target_cinfo = $a_bbs_obj->getATCommentList( $info['cinfo']['atid'], "AND id='{$info['cinfo']['atc_target_cid']}'", "", 1 );
                                if( $target_cinfo ){
                                    $XXBBSCommentTargetInfo->setContent($target_cinfo[0]['atc_content']);
                                    $target_uinfo = $user_obj->getUser('',$target_cinfo[0]['atc_create_uin']);//获取作者信息
                                    if($target_uinfo){
                                        $userinfo_res = new XXProto_UserRoleInfo();
                                        $userinfo_res->setUin($target_cinfo[0]['atc_create_uin']);
                                        if($target_uinfo['unickname']){
                                            $userinfo_res->setNick_name( $target_uinfo['unickname'] );  
                                        }
                                        if($target_uinfo['uico']){
                                            $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $target_uinfo['uico'] );
                                            $userinfo_res->setHead_url( $small_head_url );                  
                                        }
                                        $XXBBSCommentTargetInfo->setRole_info($userinfo_res);
                                    }
                                }
                                $commentInfo_res->setTarget_info($XXBBSCommentTargetInfo);
                            }

                            $uinfo = $user_obj->getUser('', $info['cinfo']['atc_create_uin']);//获取作者信息
                            if($uinfo){
                                $userinfo_res = new XXProto_UserRoleInfo();
                                $userinfo_res->setUin($info['cinfo']['atc_create_uin']);
                                if($uinfo['unickname']){
                                    $userinfo_res->setNick_name( $uinfo['unickname'] ); 
                                }
                                if($uinfo['uico']){
                                    $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $uinfo['uico'] );
                                    $userinfo_res->setHead_url( $small_head_url );                  
                                }
                                $commentInfo_res->setRole_info($userinfo_res);
                            }
                            //设置
                            $XXBBSMessageReplyInfo->setComment_info( $commentInfo_res );
                        }
                    }
                    else{
                        continue;
                    }
                }

                if( $info ){//共用
                    $XXBBSMessageCenterReplyListRes->appendReply_info_list( $XXBBSMessageReplyInfo );
                }
            }
        }
        $xxMessageCenterProto_res->setReply_list_res( $XXBBSMessageCenterReplyListRes );
    }
    elseif($subcmd_req == XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_PUSHMSGREQ){ //安卓消息push请求
        $xxMessageCenterProto_res->setSubcmd( XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_PUSHMSGRES );
        $push_list = $obj->getUserPushInfo( $uin );
        $state = $obj->getUserState( $uin, $uinfo['uex'] );
        $period = 5;
        $XXBBSMessageCenterPushMsgRes = new XXProto_XXBBSMessageCenterPushMsgRes();
        $XXBBSMessageCenterPushMsgRes->setPeriod( $period );
        if( $state['unread_msg_count'] || $state['unread_reply_count'] ){
            $XXBBSMessageCenterPushMsgRes->setStatus( 1 );
        }
        else{
            $XXBBSMessageCenterPushMsgRes->setStatus( 0 );
        }
        if( $XXBBSMessageCenterPushMsgRes->getStatus()==1 && $push_list ){
            $info = end($push_list);
            $XXBBSMessageCenterPushMsgRes->setMsg_string( $info['msg'] );
        }

        $xxMessageCenterProto_res->setPush_msg_res( $XXBBSMessageCenterPushMsgRes );
    }
    elseif($subcmd_req == XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_MARKREADREQ){ //标记会话已读
        $xxMessageCenterProto_res->setSubcmd( XXProto_XXBBSMessageCenter_SUBCMD::SUBCMD_XXBBSMessageCenter_MARKREADRES );
        $XXBBSMessageCenterMarkReadReq = $xxMessageCenterProto->getMark_read_req();
        $target_uin = $XXBBSMessageCenterMarkReadReq->getTarget_uin();
        $mark_all = $XXBBSMessageCenterMarkReadReq->getMark_all();//所有会话,0为否，1为是

        $mail_id = $obj->markSessToRead( $uin, $uinfo['uex'], $target_uin, $mark_all );
        if($mark_all == 0){
            $XXBBSMessageCenterMarkReadRes = new XXProto_XXBBSMessageCenterMarkReadRes();
            $sixin_state = $obj->getUserState( $uin, $uinfo['uex'] );
            if($sixin_state){
                $XXBBSMessageCenterMarkReadRes->setUnread_msg_count($sixin_state['unread_msg_count']);
                $xxMessageCenterProto_res->setMark_read_res($XXBBSMessageCenterMarkReadRes);
            }
        }

        if( !$mail_id ){
            $xxMessageCenterProto_res->setResult(1999);//未成功
        }
    }
    else{
        $xxMessageCenterProto_res->setResult(1999);//未知错误
        $xxMessageCenterProto_res->setSubcmd($subcmd_req);//协议命令字
    }

    $response->setBody($xxMessageCenterProto_res->serializetostring());
    sendProtobufResponse($response);
    exit();
}
else
{
    $response->setResult(XXProto_XXUnityCSErrorCode::XXUnityCS_Err_Unknown_CMD);//异常1004 未知命令字
    sendProtobufResponse($response);
    exit();	
}


?>
