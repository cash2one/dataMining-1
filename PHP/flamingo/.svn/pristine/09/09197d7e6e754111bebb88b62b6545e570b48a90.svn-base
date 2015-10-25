<?php
/*
 *协议:XXBBSData.proto、XXBBSBase.proto、XXPBBase.proto
 *功能:
 * */
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXPBBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSData.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiutils/XXServerBase.php";
include_once dirname(dirname(__FILE__)) . "/utils/UserBbsList.php";
include_once dirname(dirname(__FILE__)) . "/utils/User.php";

// 数据打包返回
$response = new XXProto_XXUnityCSPkg();
$head_res = new XXProto_XXUnityCSPkgHead();
$head_res->setCmd(1052);
$response->setResult(0);//正常 默认
$response->setHead($head_res);

$postData = getRequest();
if($postData == "")
{
    OssAttrInc(6, 0, 1);
    $response->setResult(XXProto_XXUnityCSErrorCode::XXUnityCS_Err_Unknown_Req);//异常1005  无法解包
    sendProtobufResponse($response);
    exit();
}
//解包数据
$xxCSPkgproto = XXProto_XXUnityCSPkg::parseFromString($postData);
$head_req = $xxCSPkgproto->getHead();
$body_req = $xxCSPkgproto->getBody();
$cmd_req = $head_req->getCmd();
$obj = new UserBbsList();
$user_obj = new User();
$uin = $head_req->getUin();

if($cmd_req == XXProto_XXBBSDataProto_CMD::CMD_XXBBSDataProto)//1052
{
    //回包
    $xxDataProto_res = new XXProto_XXBBSDataProto();
    $xxDataProto_res->setResult(0);//默认 正常  
    $xxDataProto = XXProto_XXBBSDataProto::parseFromString($body_req);
    $subcmd_req = $xxDataProto->getSubcmd();

    //记录 uuid
    $user_info = $head_req->getUser_info();
    if( $uin && $user_info->getUuid() ){
        $user_obj->addDevice( $uin, $user_info->getUuid() );
    }
    
    //获取信息流，推荐内容，或某个小组的帖子列表
    if($subcmd_req == XXProto_XXBBSDataProto_SUBCMD::SUBCMD_XXBBSDataProto_POSTSLISTREQ)
    {
        $datapost_res = new XXProto_XXBBSDataPostsListRes();
        $xxDataList = $xxDataProto->getPosts_list_req();
        $dataType = $xxDataList->getData_type();
        $fid = $xxDataList->getFid();
        $begin_timestamp = $xxDataList->getBegin_timestamp();
        $count = (int)$xxDataList->getCount();        
        $direction = $xxDataList->getDirection();//0新，1旧
        $sb_uin = $xxDataList->getSb_uin();

        $t_list = array();
        //无操作
        if($dataType == XXProto_XXBBSDataType::XXBBSDataType_None){
            OssAttrInc(6, 0, 1);
            //do nothing
        }	
        //信息流
        elseif($dataType == XXProto_XXBBSDataType::XXBBSDataType_StreamPosts){
            OssAttrInc(6, 1, 1);//信息流
            $uinfo = $user_obj->getUser( '',$uin );
            $fid_arr = json_decode( $uinfo['ufid'], true );
            if( $fid_arr ){
                $t_list = $obj->getStreamPostsList( $fid_arr, $begin_timestamp, $count, $direction );
            }
        }
        //小组信息流
        elseif($dataType == XXProto_XXBBSDataType::XXBBSDataType_GroupPosts){//单个小组 必有fid
            OssAttrInc(6, 2, 1);//小组信息流
            $t_list = $obj->getFinfoStreamPostsList( array($fid), $begin_timestamp, $count, $direction );
        }
        //推荐内容
        elseif($dataType == XXProto_XXBBSDataType::XXBBSDataType_RecomendPosts){//获取后台列表
            OssAttrInc(6, 3, 1);
            $t_list = $obj->getRecomendPostsList( $count );
        }
        //某个人发过的帖子
        elseif($dataType == XXProto_XXBBSDataType::XXBBSDataType_SBPosts){
            OssAttrInc(6, 4, 1);
            $uinfo = $user_obj->getUser( '',$sb_uin );
            $t_list = $obj->getMyPostsList( $uinfo['uex'], $sb_uin, $begin_timestamp, $count, $direction, $fid );
        }
        //某个人回复过的帖子
        elseif($dataType == XXProto_XXBBSDataType::XXBBSDataType_SBComments){
            OssAttrInc(6, 5, 1);
            $uinfo = $user_obj->getUser( '',$sb_uin );
            //$t_list = $obj->getMyCommentsList( $uinfo['uex'], $sb_uin, $begin_timestamp, $count, $direction, $fid );
            $t_list = $obj->getMyCommentsTinfoList( $uinfo['uex'], $sb_uin, $begin_timestamp, $count, $direction, $fid );
        }elseif($dataType == XXProto_XXBBSDataType::XXBBSDataType_RecomendVideo){//推荐视频
            OssAttrInc(6, 6, 1);
            $t_list = $obj->getRecomendVideoList( $count ); 
        }elseif($dataType == XXProto_XXBBSDataType::XXBBSDataType_SBVideo){//某人分享的视频
            //私人数据需要检查登陆太
            include_once dirname(dirname(__FILE__)) . "/api/publicFunctions.php";
            $re_login = checkUserLogin($sb_uin, $head_req->getLogin_key(), $user_info->getUuid(), $_SERVER['REMOTE_ADDR']);//检查登陆太
            if($re_login !== true){
                $response->setResult($re_login);
                sendProtobufResponse($response);
                exit();
            }

            $uinfo = $user_obj->getUser( '',$sb_uin );
            $t_list = $obj->getMyPostsList($uinfo['uex'], $sb_uin, $begin_timestamp, $count, $direction, $fid, ' AND t_status=1', 1);
            OssAttrInc(6, 7, 1);
        }
        else{
            OssAttrInc(6, 0, 1);
            $xxDataProto_res->setResult(1999);//未知错误
            $xxDataProto_res->setSubcmd($subcmd_req);
        }

        if($t_list){
			include_once dirname(__FILE__) . "/SetPBFunctions.php";
            foreach($t_list as $k => $v){
                if(empty($v)) continue;

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

                $group = $obj->getFOneinfo( $v['fid'] );//获取小组信息
                if($group){
					$XXBBSGroupInfo_res = setPBGroupInfo($group, $uin, $obj, $user_obj);
                    $postInfo_res->setGroup_info($XXBBSGroupInfo_res);
                }
                $has_zan = $obj->checkUserTDianzan( $uin, $v['fid'], $v['id'], $v['t_ex'] );
                if( $has_zan ){
                    $postInfo_res->setHas_zan(1);
                }
                else{
                    $postInfo_res->setHas_zan(0);
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
                if($v['video_fb']){
                    $VideoObject = XXProto_VideoObject::parseFromString($v['video_fb']);
                    $postInfo_res->setVideo($VideoObject);//返回视频
                }
                $datapost_res->appendPost_info_list($postInfo_res);
            }
        }else{ 
            OssAttrInc(6, 0, 1);
        }

        $datapost_res->setData_type($dataType);
        $xxDataProto_res->setPosts_list_res($datapost_res);
        $xxDataProto_res->setSubcmd(XXProto_XXBBSDataProto_SUBCMD::SUBCMD_XXBBSDataProto_POSTSLISTRES);
    }
    //评论列表
    else if($subcmd_req == XXProto_XXBBSDataProto_SUBCMD::SUBCMD_XXBBSDataProto_COMMENTSLISTREQ)
    {
        //评论列表回包
        $commentList_res = new XXProto_XXBBSDataCommentsListRes();
        //需要获取的评论
        $commentList = $xxDataProto->getComments_list_req();
        $fid = $commentList->getFid();
        $tid = $commentList->getTid();
        $begin_cid = $commentList->getBegin_cid();
        $count = $commentList->getCount();
        $direction = $commentList->getDirection();
        //获取帖列表

        OssAttrInc(6, 11, 1);
        $CommentList = $obj->getCommentList( $fid, $tid, $count, $begin_cid , "AND c_status=1", $direction);
        //print_r($CommentList);
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
                    if( $uinfo['unickname'] ){
                        $userinfo_res->setNick_name( $uinfo['unickname'] );	
                    }
                    if($uinfo['uico']){
                        $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $uinfo['uico'] );
                        $userinfo_res->setHead_url( $small_head_url );					
                        $userinfo_res->setBig_head_url( $user_obj->uico_dpre . $uinfo['uico'] );					
                    }
                    $commentInfo_res->setRole_info($userinfo_res);
                }


                    try{
                        $commentInfo_res->serializeToString();
                        //@file_put_contents( '/dev/shm/UserBbs.log', "==try".var_export($commentList_res, true)."\n", FILE_APPEND );
                    }catch(Exception $e){   
                        @file_put_contents( '/dev/shm/UserBbs.log', var_export($commentInfo_res, true)."\n", FILE_APPEND );
                        //@file_put_contents( '/dev/shm/UserBbs.log', var_export($v, true)."\n", FILE_APPEND );
                        $obj->updateSetcStatus($v['id'], $v['c_create_uin']);
                    
                    }


                $commentList_res->appendComment_info_list($commentInfo_res);//一个评论
            }
        }else{
            OssAttrInc(6, 12, 1);
        }





        $xxDataProto_res->setComments_list_res($commentList_res);
        $xxDataProto_res->setSubcmd(XXProto_XXBBSDataProto_SUBCMD::SUBCMD_XXBBSDataProto_COMMENTSLISTRES);
    }
    //获取个人页面的一些数据
    else if($subcmd_req == XXProto_XXBBSDataProto_SUBCMD::SUBCMD_XXBBSDataProto_PERSONALDATAREQ)
	{
		$xxPersonData_res = new XXProto_XXBBSDataProtoDataPersonDataRes();

		$xxPersonData = $xxDataProto->getPerson_data_req();
		$sb_uin = $xxPersonData->getSb_uin();

		$uinfo = $user_obj->getUser('', $sb_uin);
		$arr_fid = json_decode($uinfo['ufid'],true);
        if($uinfo['usex']){
    		$xxPersonData_res->setSex($uinfo['usex']);//性别
        }
        //暂用
        if(isset($uinfo['usignature']) && $uinfo['usignature']){
			$xxPersonData_res->setSignature($uinfo['usignature']);//个性签名
		}

        OssAttrInc(6, 13, 1);
		$statinfo = $obj->getPersonPageData($sb_uin, $uinfo['uex'], $uin, $arr_fid);
		include_once dirname(__FILE__) . "/SetPBFunctions.php";
        //常去的小组
        if(!empty($statinfo[0])){
			foreach($statinfo[0] as $group){
                if(!empty($group)){
				    $XXBBSGroupInfo_res = setPBGroupInfo($group, $uin, $obj, $user_obj);
                }
                if(!empty($XXBBSGroupInfo_res)){
                    $xxPersonData_res->appendGroup_info_list($XXBBSGroupInfo_res);
                }
                if(count($xxPersonData_res->getGroup_info_list()) == 4){//只显示4个小组
                    break;
                }
            } 
        }else{ 
            OssAttrInc(6, 14, 1);
        }
		if($statinfo[1]){//个人数据
            $xxPersonData_res->setMy_post_count($statinfo[1][0]['post_count']<0 ? 0 : $statinfo[1][0]['post_count']);
			//$xxPersonData_res->setMy_comment_count($statinfo[1][0]['comment_count']<0 ? 0 : $statinfo[1][0]['comment_count']);
			$xxPersonData_res->setMy_comment_count($statinfo[1][0]['commented_t_count']<0 ? 0 : $statinfo[1][0]['commented_t_count']);
			$xxPersonData_res->setMy_activity_count($statinfo[1][0]['activity_count']<0 ? 0 : $statinfo[1][0]['activity_count']);
			$xxPersonData_res->setMy_picture_count($statinfo[1][0]['picture_count']);
            $xxPersonData_res->setMy_group_count(count($arr_fid));
        }else{
            OssAttrInc(6, 14, 1); 
        }
        
        include_once dirname(dirname(__FILE__)) . "/utils/ActivityBbsList.php";//查找是否点赞用
        $at_obj = new ActivityBbsList(); 
        
		if($statinfo[2]){//最新的5个活动帖子
			foreach($statinfo[2] as $k => $v){
				$activity_post_info_res = new XXProto_XXBBSActivityPostInfo();
				$activity_post_info_res->setTitle($v['at_title']);

				$activity_post_info_res->setAtid($v['id']);

                $uinfo = $user_obj->getUser( '', $v['at_create_uin'] );
                if( $uinfo ){
                    $res_UserRoleInfo = new XXProto_UserRoleInfo();
                    $res_UserRoleInfo->setUin( $v['at_create_uin'] );
                    if( $uinfo['unickname']){
                        $res_UserRoleInfo->setNick_name( $uinfo['unickname'] );
                    }
                    if( $uinfo['uico'] ){
                        $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $uinfo['uico'] );
                        $res_UserRoleInfo->setHead_url( $small_head_url );
                        $res_UserRoleInfo->setBig_head_url( $user_obj->uico_dpre . $uinfo['uico'] );					
                    }
					$activity_post_info_res->setRole_info($res_UserRoleInfo); //活动创建者
                }
                
				//所属活动(此处是否需要，未定)
                include_once dirname(dirname(__FILE__)) . "/utils/ActivityBbsList.php";
                $act_obj = new ActivityBbsList();
				$ainfo = $act_obj->getAinfo($v['afid'], 'AND a_status=1');
                $XXBBSActivityInfo = setPBActivityInfo($uin, $ainfo[0], $user_obj, $act_obj);
                if($XXBBSActivityInfo){
				    $activity_post_info_res->setActivity_info($XXBBSActivityInfo);
                }
                
               // $XXBBSActivityInfo = new XXProto_XXBBSActivityInfo();
               // $XXBBSActivityInfo->setAfid($v['afid']);
			  // $activity_post_info_res->setActivity_info($XXBBSActivityInfo);



				$activity_post_info_res->setCreate_time($v['at_addtime']);
				$activity_post_info_res->setModyfied_time($v['at_updatetime']);
				$activity_post_info_res->setDianzan_count($v['at_dianzan_count']);
                $activity_post_info_res->setComment_count($v['at_comment_count']);

/*活动和活动跟帖图片存取修改，弃用 2014.8.5
                $at_photo = json_decode($v['at_photo']);
                foreach($at_photo as $key=>$val){
                    if(!$val) continue; 
                    $fileobj = new XXProto_FileObject();
                    $fileobj->setID(1);
                    $fileobj->setUrl($obj->pic_dpre . $val);
                    $activity_post_info_res->appendPhoto($fileobj);
                }
 */

				//照片
                $at_photo = json_decode($v['at_photo'], true);
                if($at_photo){
                    foreach($at_photo as $key=>$val){
                        if(!$val) continue;
                        $fileobj = new XXProto_FileObject();
                        $fileobj->setID(1);
                        $fileobj->setUrl($obj->pic_dpre . $val['url']);
                        $fileobj->setThumbnail_url( $obj->pic_dpre . str_replace(array('.png','.jpg'), array('_thumb.png','_thumb.jpg'), $val['url']) );
                        $fileobj->setImage_width($val['width']);
                        $fileobj->setImage_height($val['height']);
                        $activity_post_info_res->appendPhoto($fileobj);
                    }
               } 
    
                //是否点赞
                $at_obj->db->use_db('gpbbs');
                $u_dinfo = $at_obj->checkUserATDianzan($uin, $v['id'], $v['at_ex']);
                if($u_dinfo){
                    $activity_post_info_res->setHas_zan(1);
                }else{
                    $activity_post_info_res->setHas_zan(0);
                }

				$xxPersonData_res->appendMy_picture_list($activity_post_info_res);			
			}
        }else{ 
            OssAttrInc(6, 14, 1);
        }
        
        $xxDataProto_res->setPerson_data_res($xxPersonData_res);
        $xxDataProto_res->setSubcmd(XXProto_XXBBSDataProto_SUBCMD::SUBCMD_XXBBSDataProto_PERSONALDATARES);
    }
    //回收站
    elseif( $subcmd_req == XXProto_XXBBSDataProto_SUBCMD::SUBCMD_XXBBSDataProto_TRASHPOSTSLISTREQ ){
        $XXBBSDataTrashPostsListRes = new XXProto_XXBBSDataTrashPostsListRes();
        $XXBBSDataTrashPostsListReq = $xxDataProto->getTrash_posts_list_req();

        $trash = array();
        $trash['fid'] = $XXBBSDataTrashPostsListReq->getFid();
        $trash['begin_timestamp'] = $XXBBSDataTrashPostsListReq->getBegin_timestamp();
        $trash['count'] = $XXBBSDataTrashPostsListReq->getCount();
        $trash['direction'] = $XXBBSDataTrashPostsListReq->getDirection();
        $trash['sb_uin'] = $uin;
        OssAttrInc(6, 15, 1);
        if( !($t_list = $obj->getTrashTinfoList( $trash )) ){
            $xxDataProto_res->setResult(1999);//未知错误
            $xxDataProto_res->setSubcmd($subcmd_req);
        }

        //组包返回
        if($t_list){
			include_once dirname(__FILE__) . "/SetPBFunctions.php";
            foreach($t_list as $k => $v){
                if(empty($v)) continue;

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
                if( !empty($v['reason']) ){
                    $postInfo_res->setReason($v['reason']);
                }
                //获取删帖管理员信息
                $m_uinfo = $user_obj->getUser('', $v['man_uin']);
                if($m_uinfo){
                    $m_userinfo_res = new XXProto_UserRoleInfo();
                    $m_userinfo_res->setUin($v['man_uin']);
                    if($m_uinfo['unickname']){
                        $m_userinfo_res->setNick_name( $m_uinfo['unickname'] );	
                    }
                    if($m_uinfo['uico']){
                        $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $m_uinfo['uico'] );
                        $m_userinfo_res->setHead_url( $small_head_url );					
                        $m_userinfo_res->setBig_head_url( $user_obj->uico_dpre . $m_uinfo['uico'] );					
                    }
                    $postInfo_res->setDeleteManager($m_userinfo_res);
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

                $group = $obj->getFOneinfo( $v['fid'] );//获取小组信息
                if($group){
					$XXBBSGroupInfo_res = setPBGroupInfo($group, $uin, $obj, $user_obj);
                    $postInfo_res->setGroup_info($XXBBSGroupInfo_res);
                }
                $has_zan = $obj->checkUserTDianzan( $uin, $v['fid'], $v['id'], $v['t_ex'] );
                if( $has_zan ){
                    $postInfo_res->setHas_zan(1);
                }
                else{
                    $postInfo_res->setHas_zan(0);
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
                if($v['video_fb']){
                    $VideoObject = XXProto_VideoObject::parseFromString($v['video_fb']);
                    $postInfo_res->setVideo($VideoObject);//返回视频
                }
                $XXBBSDataTrashPostsListRes->appendPost_info_list($postInfo_res);
            }
            $xxDataProto_res->setTrash_posts_list_res($XXBBSDataTrashPostsListRes);
        }else{ 
            OssAttrInc(6, 16, 1);
        }
 
        $xxDataProto_res->setSubcmd(XXProto_XXBBSDataProto_SUBCMD::SUBCMD_XXBBSDataProto_TRASHPOSTSLISTRES);
    }
    else
    {
        OssAttrInc(6, 0, 1);
        $xxDataProto_res->setResult(1999);//未知错误
        $xxDataProto_res->setSbucmd($subcmd_req);//协议命令字
    }
    

    try{
        $response->setBody($xxDataProto_res->serializeToString());
    }catch(Exception $e){
        //处理序列化出错的数据
        if(empty($obj)){
            $obj = new UserBbsList();
        }
        if(empty($user_obj)){
            $user_obj = new User();
        }
        $obj->clearSerializeUtf8Error( $xxDataProto_res, $subcmd_req, $user_obj );
        $response->setBody($xxDataProto_res->serializeToString());
    }

    sendProtobufResponse($response);
    exit();
}
else
{
    OssAttrInc(6, 0, 1);
    $response->setResult(XXProto_XXUnityCSErrorCode::XXUnityCS_Err_Unknown_CMD);//异常1004 未知命令字
    sendProtobufResponse($response);
    exit();	
}


?>
