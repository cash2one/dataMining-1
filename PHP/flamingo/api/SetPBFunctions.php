<?php
/*
 * 设置PB中XXBBSGroupInfo的信息
 * */

//设置PB中XXBBSGroupInfo的信息
function setPBGroupInfo($group, $uin, $obj, $user_obj,$group_banner=0){
    if(empty($group)) return false; 
	$XXBBSGroupInfo_res = new XXProto_XXBBSGroupInfo();
    if($group['f_name']){
	    $XXBBSGroupInfo_res->setName($group['f_name']);
    }
	$XXBBSGroupInfo_res->setFid($group['id']);
	if( $group['f_icon_url'] ){
		$XXBBSGroupInfo_res->setIcon_url( $obj->pic_dpre . $group['f_icon_url'] );
	}
	if( $group['f_bgimg_url'] ){
		$XXBBSGroupInfo_res->setBackground_img_url( $obj->pic_dpre . $group['f_bgimg_url'] );
    }
	$XXBBSGroupInfo_res->setCreate_time($group['f_addtime']);
	$XXBBSGroupInfo_res->setMember_count($group['f_uin_count']);
	$XXBBSGroupInfo_res->setBrief_introduction($group['f_desc']);//简介
	$XXBBSGroupInfo_res->setHas_others($group['has_others']);//游戏宝典开关，废弃
    //游戏宝典url
    if($group['f_baodian_url']){
        $XXBBSGroupInfo_res->setGamecenter_url($group['f_baodian_url']);
    }

	$grouptype_res = $obj->getFtype_infoList("id='{$group['ftypeid']}'");//获取分类分类小组信息
	if( $grouptype_res ){
		$grouptypeinfo_res = new XXProto_XXBBSGroupTypeInfo();
		$grouptypeinfo_res->setFtypeid( $grouptype_res[0]['id'] );
		$grouptypeinfo_res->setType_name( $grouptype_res[0]['type_name'] );;
		$XXBBSGroupInfo_res->setType_info( $grouptypeinfo_res );;
	}
	if( $group_banner == XXProto_XXBBSGroupListType::XXBBSGroupListType_Banner ){//处于banner时填写
		if($group['img_url']){
			$XXBBSGroupInfo_res->setBanner_img_url( $obj->pic_dpre . $group['img_url'] );
		}
	}
	//获取小组作者信息
	$groupuinfo = $user_obj->getUser('',$group['f_create_uin']);//获取作者信息 
	if($groupuinfo){
		$groupuserinfo_res = new XXProto_UserRoleInfo();
		$groupuserinfo_res->setUin($groupuinfo['uid']);
		if($groupuinfo['unickname']){
			$groupuserinfo_res->setNick_name( $groupuinfo['unickname'] );
		}
		if($groupuinfo['uico']){
			$gsmall_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $groupuinfo['uico'] );
			$groupuserinfo_res->setHead_url( $gsmall_head_url );
            $groupuserinfo_res->setBig_head_url( $user_obj->uico_dpre . $groupuinfo['uico'] );
		}
		$XXBBSGroupInfo_res->setMaster_role_info($groupuserinfo_res);
	}

    //管理员们
    $f_manager_arr = json_decode($group['f_manager'], true);
    if($f_manager_arr){
        foreach($f_manager_arr as $f_man){
            $groupuinfo = $user_obj->getUser('', $f_man);//获取作者信息
	        if($groupuinfo){
		        $groupuserinfo_res = new XXProto_UserRoleInfo();
		        $groupuserinfo_res->setUin($groupuinfo['uid']);
		        if($groupuinfo['unickname']){
			        $groupuserinfo_res->setNick_name( $groupuinfo['unickname'] );
		        }
		        if($groupuinfo['uico']){
			        $gsmall_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $groupuinfo['uico'] );
			        $groupuserinfo_res->setHead_url( $gsmall_head_url );
                    $groupuserinfo_res->setBig_head_url( $user_obj->uico_dpre . $groupuinfo['uico'] );
		        }
                $XXBBSGroupInfo_res->appendManager_rolo_info($groupuserinfo_res);
            }
        }
    }

	$XXBBSGroupInfo_res->setPost_count( $group['f_t_count'] );
	$XXBBSGroupInfo_res->setActivity_count($group['f_a_count']);
	//获取是否已加入
	$has_in = $obj->checkUserFIn( $uin, $group['id'], $group['f_ex'] );
	if( $has_in ){
		$XXBBSGroupInfo_res->setHas_in(1);
	}
	else{
		$XXBBSGroupInfo_res->setHas_in(0);
    }

	return $XXBBSGroupInfo_res;
}

//这是一个活动
function setPBActivityInfo($uin, $ainfo, $user_obj, $obj){
    if($ainfo){
    $v = $ainfo;

	$activity_info_res = new XXProto_XXBBSActivityInfo();
    if($v['a_title']){
	    $activity_info_res->setTitle($v['a_title']);
    }
    if($v['a_content']){
	    $activity_info_res->setContent($v['a_content']);
    }
	$activity_info_res->setAfid($v['id']);
	$activity_info_res->setCreate_time($v['a_addtime']);
	$activity_info_res->setModyfied_time(strtotime($v['a_updatetime']));
	$activity_info_res->setMember_count($v['a_uin_count']);
	
	$activity_info_res->setPost_count($v['a_t_count']); //内容数量
	
	$group_info = new XXProto_XXBBSGroupInfo();
	$group_info->setFid($v['fid']);
	$activity_info_res->setGroup_info($group_info); //活动所属小组
	
	$role_info = new XXProto_UserRoleInfo();
	$role_info->setUin($v['a_create_uin']);
	$uinfo = $user_obj->getUser('',$v['a_create_uin']);//获取作者信息
	if($uinfo){
		if($uinfo['unickname']){
			$role_info->setNick_name( $uinfo['unickname'] );	
		}
		if($uinfo['uico']){
			$small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $uinfo['uico'] );
			$role_info->setHead_url( $small_head_url );					
            $role_info->setBig_head_url( $user_obj->uico_dpre . $uinfo['uico'] );
		}
	}
	$activity_info_res->setRole_info($role_info); //活动创建者

	//图片
	$a_pic = json_decode($v['a_pics'], true);
    if($a_pic){
	    $Photo = new XXProto_FileObject();	
	    $Photo->setID(1);
	    $Photo->setUrl($obj->pic_dpre . $a_pic[0]['url']);
	    $activity_info_res->setPhoto($Photo);
    }	
	//活动时间
	$time_control = new XXProto_TimeControl();
	$time_control->setStartTime($v['a_starttime']);
	$time_control->setEndTime($v['a_endtime']);
	$activity_info_res->setTime_control($time_control);


	//是否关注
	if( $obj->checkUserAIn($uin,$v['id']) ){
		$activity_info_res->setHas_in(1);
	}else{
		$activity_info_res->setHas_in(0);
    }

    return $activity_info_res;
    }else{
        return false;
    }
}

?>
