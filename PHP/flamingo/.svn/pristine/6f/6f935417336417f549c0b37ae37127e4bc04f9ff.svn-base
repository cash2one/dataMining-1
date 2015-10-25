<?php
/*
        协议:XXBBSPostsProto
        功能:发帖、改帖、删帖;评论,修改评论,删除评论;点赞,取消点赞
        TODO: 用户鉴权
        TODO: uex_bbs_statistic_aa的更新移动到内层里的逻辑去
        //
 */
@ini_set('memory_limit','512M');
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXPBBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSPosts.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiutils/XXServerBase.php";
include_once dirname(dirname(__FILE__)) . "/utils/UserBbs.php";
include_once dirname(dirname(__FILE__)) . "/utils/User.php";

OssAttrInc(6, 25, 1);

SeasLog::debug('enter XXBBSPosts');

$postData = getRequest();//获取请求消息

// 数据打包返回
$response = new XXProto_XXUnityCSPkg();
$reshead = new XXProto_XXUnityCSPkgHead();
$reshead->setCmd(1051);
$response->setResult(0);//正常 默认
$response->setHead($reshead);

if($postData == "")
{
    SeasLog::error('XXBBSPosts postData == NULL');
    $response->setResult(1005);//未知请求(无法解包)
    sendProtobufResponse($response);
    OssAttrInc(6, 26, 1);
    exit();
}

//解包数据
$XXUnityCSPkg = XXProto_XXUnityCSPkg::parseFromString($postData);
if( !is_object($XXUnityCSPkg ) ){
    SeasLog::error('XXBBSPosts XXUnityCSPkg is not object');
    $response->setResult(1005);//未知请求(无法解包)
    sendProtobufResponse($response);
    OssAttrInc(6, 27, 1);
    exit();
}

$head = $XXUnityCSPkg->getHead();//同样变量名 复写
$body = $XXUnityCSPkg->getBody();
//验证登录态
$loginKey = $head->getLogin_key();
$userUin = $head->getUin();//作者UIN
$obj = new UserBbs();
$obj->redis->use_redis('login_key');
$login_str = $obj->redis->redis->get( $loginKey );

/*
if( ! $login_str ){//登录态已失效
@file_put_contents( '/tmp/eeror.log', "fuck here 11.fdasfsda....", FILE_APPEND );
    OssAttrInc(6, 28, 1);
    //管理后台随机用户
    $simu_user = array(
            808528,808529,808530,808531,808532,808533,808534,808535,808536,808537,808538,808539,808540,808541,808542,808543,808544,808545,808546,808547,808548,808549,
            808550,808551,808552,808553,808554,808555,808556,808557,808558,808559,808560,808561,808562,808563,808564,808565,808566,808567,808568,808569,808570,808571,
            808572,808573,808574,808575,808576,808577,808578,808579,808580,808581,808582,808583,808584,808585,808586,808587,808588,808589,808590,808591,808592,808593,
            808594,808595,808596,808597,808598,808599,808600,808601,808602,808603,808604,808605,808606,808607,808608,808609,808610,808611,808612,808613,808614,808615,
            808616,808617,808618,808619,808620,808621,808622,808623,808624,808625,808626,808627,808628,808629,808630,808631,808632,808633,808634,808635,808636,808637,
            808638,808639,808640,808641,808642,808643,808644,808645,808646,808647,808648,808649,808650,808651,808652,808653,808654,808655,808656,808657,808658,808659,
            808660,808661,808662,808663,808664,808665,808666,808667,808668,808669,808670,808671,808672,808673,808674,808675,808676,808677,808678,808679,808680,808681,
            808682,808683,808684,808685,808686,808687,808688,808689,808690,808691,808692,808693,808694,808695,808696,808697,808698,808699,808700,808701,808702,808703,
            808704,808705,808706,808707,808708,808709,808710,808711,808712,808713,808714,808715,808716,808717,808718,808719,808720,808721,808722,808723,808724,808725,
            808726,808727,808728,808729,808730,808731,808732,808733,808734,808735,808736,808737,808738,808739,808740,808741,808742,808743,808744,808745,808746,808747,
            808748,808749,808750,808751,808752,808753,808754,808755,808756,808757,808758,808759,808760,808761,808762,808763,808764,808765,808766,808767,808768,808769,
            808770,808771,808772,808773,808774,808775,808776,808777,808778,808779,808780,808781,808782,808783,808784,808785,808786,808787,808788,808789,808790,808791,
            808792,808793,808794,808795,808796,808797,808798,808799,808800,808801,808802,808803,808804,808805,808806,808807,808808,808809,808810,808811,808812,808813,
            808814,808815,808816,808817,808818,808819,808820,808821,808822,808823,808824,808825,808826,808827,808828,808829,808830,808831,808832,808833,808834,808835,
            808836,808837,808838,808839,808840,808841,808842,808843,808844,808845,808846,808847,808848,808849,808850,808851,808852,808853,808854,808855,808856,808857,
            808858,808859,808860,808861,808862,808863,808864,808865,808866,808867,808868,808869,808870,808871,808872,808873,808874,808875,808876,808877,808878,808879,
            808880,808881,808882,808883,808884,808885,808886,808887,808888,808889,808890,808891,808892,808893,808894,808895,808896,808897,808898,808899,808900,808901,
            808902,808903,808904,808905,808906,808907,808908,808909,808910,808911,808912,808913,808914,808915,808916,808917,808918,808919,808920,808921,808922,808923,
            808924,808925,808926,808927,808928,808929,808930,808931,808932,808933,808934,808935,808936,808937,808938,808939,808940,808941,808942,808943,808944,808945,
            808946,808947,808948,808949,808950,808951,808952,808953,808954,808955,808956,808957,808958,808959,808960,808961,808962,808963,808964,808965,808966,808967,
            808968,808969,808970,808971,808972,808973,808974,808975,808976,808977,808978,808979,808980,808981,808982,808983,808984,808985,808986,808987,808988,808989,
            808990,808991,808992,808993,808994,808995,808996,808997,808998,808999,809000,809001,809002,809003,809004,809005,809006,809007,809008,809009,809010,809011,
            809012,809013,809014,809015,809016,809017,809018,809019,809020,809021,809022,809023,809024,809025,809026,809027,2684,787121,865245,677327,660462
    );
    if( ! in_array( $userUin, $simu_user ) && $_SERVER['REMOTE_ADDR']!='125.88.168.100' ){
@file_put_contents( '/tmp/eeror.log', "fuck here 33 login \n", FILE_APPEND );
        OssAttrInc(6, 29, 1);
        $response->setResult(1002);//登录态验证失败（需要登陆或者重新登陆）1002=XXUnityCS_Err_Not_Login是登陆态失效
        sendProtobufResponse($response);
        exit();
    }

}
else{
    $UserInfo = $head->getUser_info();
    include_once dirname(dirname(__FILE__)) . "/apiprotocols/XXRedisUnityLogin.proto.php";
    $login_data = XXProto_XXRedisUnityLoginData::parseFromString($login_str);
    $loginKey_uin = $login_data->getUin();
    $loginKey_UserInfo = $login_data->getUser_info();
    $loginKey_createTime = $login_data->getCreateTime();
    if( $loginKey_uin!=$userUin || !is_object($loginKey_UserInfo) || $loginKey_UserInfo->getUuid()!==$UserInfo->getUuid() || abs(time()-$loginKey_createTime)>86400*30 ){// 7天 ?
        OssAttrInc(6, 30, 1);
        $response->setResult(1001);//登录态验证失败（需要登陆或者重新登陆）1001=XXUnityCS_Err_Auth_Fail 是鉴权失效
        sendProtobufResponse($response);
        exit();
    }
    else{
        OssAttrInc(6, 31, 1);
        $obj->redis->redis->setTimeout( $loginKey, 86400*30 );
    }
}
 */

//处理禁言逻辑
if( $obj->checkIsBlockUser($userUin) ){
    SeasLog::debug('XXBBSPosts uin : {uin} blockUser', array('{uin}' => $userUin));
    OssAttrInc(6, 32, 1);
	$response->setResult(1001);
	sendProtobufResponse($response);
	exit();
}

if($head->getCmd() == XXProto_XXBBSPostsProto_CMD::CMD_XXBBSPostsProto)
{
    SeasLog::debug('XXBBSPosts uin : {uin} enter cmd == CMD_XXBBSPostsProto', array('{uin}' => $userUin));
    OssAttrInc(6, 33, 1);
    $XXBBSPostsProto = XXProto_XXBBSPostsProto::parseFromString($body);
    $subcmd = $XXBBSPostsProto->getSubcmd();//协议命令字
    $resXXBBSPostsProto = new XXProto_XXBBSPostsProto();
    $resXXBBSPostsProto->setResult(0);//正常 默认
    $user_obj = new User();
	$uinfo = $user_obj->getUser( '', $userUin );			

    //发帖、编辑更新帖、删除帖子 请求
    if($subcmd == XXProto_XXBBSPostsProto_SUBCMD::SUBCMD_XXBBSPostsProto_POSTREQ)
    {
        OssAttrInc(6, 34, 1);
        $resXXBBSPostsProto->setSubcmd( XXProto_XXBBSPostsProto_SUBCMD::SUBCMD_XXBBSPostsProto_POSTRES );
        $XXBBSPostsPostReq = $XXBBSPostsProto->getPost_req();//帖子操作请求
        $XxBBSEditType = $XXBBSPostsPostReq->getEdit_type();//帖子操作类型
        $XXBBSPostInfo = $XXBBSPostsPostReq->getPost_info();//一个贴

        //小组
        $XXBBSGroupInfo = $XXBBSPostInfo->getGroup_info();
        $fid = $XXBBSGroupInfo->getFid();//fid
        $content = $XXBBSPostInfo->getContent();//内容
        $title = $XXBBSPostInfo->getTitle();//标题
        $FileObjects = $XXBBSPostInfo->getPhotos();//图片
        $VideoObject = $XXBBSPostInfo->getVideo();//视频
		
		SeasLog::debug('XXBBSPosts uin : {uin} enter SUBCMD == POSTREQ, fid : {fid}', array('{uin}' => $userUin, '{fid}' => $fid));   
        
		if( $_SERVER['REMOTE_ADDR']!='14.23.164.59' && $userUin!=825479 ){//公司ip和果妹不检查相似性
            OssAttrInc(6, 35, 1);
            $similar = $obj->cheackUserTinfoSimilar($userUin, $fid, $content, 600);
        }

        //处理屏蔽词,相似度处理
        if( $obj->checkHasBlockKw($content) || $obj->checkHasBlockKw($title) || $similar > 80){
            OssAttrInc(6, 36, 1);
			SeasLog::debug('XXBBSPosts uin : {uin} enter checkHasBlockKw similar, fid : {fid}', array('{uin}' => $userUin, '{fid}' => $fid)); 
            $errorNum = $similar > 80 ? 1999 : 1002;
            $resXXBBSPostsProto->setResult($errorNum);
            $response->setBody( $resXXBBSPostsProto->serializeToString() );
            sendProtobufResponse($response);
            exit();
        }

        try{
            $XXBBSPostInfo->serializeToString();
        }catch(Exception $e){
            OssAttrInc(6, 37, 1);
			SeasLog::error('XXBBSPosts uin : {uin} XXBBSPostInfo->serializeToString fail', array('{uin}' => $userUin));
            $resXXBBSPostsProto->setResult(1002);//正常 默认
            $response->setBody( $resXXBBSPostsProto->serializeToString() );
            sendProtobufResponse($response);
            exit();
        }

        $tinfo = array();
        //a. 处理图片
        $time = time();
        $t_haved_pic = 0;
        //读取图片的内容并存储
        if( is_array($FileObjects) ){
            OssAttrInc(6, 38, 1);
            $FileObjectArray = new XXProto_FileObjectArray();
            $tdir = $obj->getTDir();
            //$urls = $fb_ids = array();
            foreach( $FileObjects as $FileObject ){
                OssAttrInc(6, 39, 1);
                $FileObject_ID = $FileObject->getID();
                $FileObject_fileType = $FileObject->getFileType();//图片类型
                $FileObject_size = $FileObject->getSize();
                $FileObject_checksum = $FileObject->getChecksum();
                $FileObject_file_bytes = $FileObject->getFile_bytes();//文件内容

                //存图片
                $random = rand(1000,10000);
                $ext = "";
                switch($FileObject_fileType)
                {
                case XXProto_FileType::FT_PNG: $ext = "png";break;
                case XXProto_FileType::FT_JPG: $ext = "jpg";break;
                }

                $file = $tdir . "{$fid}_0_{$time}_{$random}.{$ext}";
                $url = str_replace( SYSDIR_ROOT ."/bpic/", '', $file );
                //将图片写入文件
                if( file_put_contents($file, $FileObject_file_bytes) ){
                    OssAttrInc(6, 40, 1);
                    $fbinfo = array(
                        'url' => $url,
                        'fileType' => $FileObject_fileType,
                        'size' => $FileObject_size,
                        'checksum' => $FileObject_checksum,
                        'addtime' => $time,
                    );
                    $obj->addFb( $fbinfo );
                    //$urls[] = "<img>". $obj->pic_dpre . $url . "</img>";
                    $FileObject->setUrl( $obj->pic_dpre . $url );
                    $FileObject->clearFile_bytes();
                    //PNG要转JPG
                    if( $ext=='png' ){
                        OssAttrInc(6, 42, 1);
                        @imagejpeg( imagecreatefrompng( $file ), str_replace('.png', '.jpg', $file), 80 );
                        $FileObject->setUrl( $obj->pic_dpre . str_replace('.png', '.jpg', $url) );
                        $file = str_replace('.png', '.jpg', $file);
                        $url = str_replace('.png', '.jpg', $url);
                        $ext='jpg';
                    }

                    $abs_file = $file; 
                    list($width, $height) = getimagesize($abs_file);
                    //大于505的要处理一下
                    if( $width>960 ){
                        OssAttrInc(6, 43, 1);
                        $_width = 960;
                        $_height = floor( 960 * $height / $width );
                        $FileObject->setImage_width( $_width );
                        $FileObject->setImage_height( $_height );
                        $source = $ext=='jpg' ? imagecreatefromjpeg($abs_file) : imagecreatefrompng($abs_file);
                        $thumb = imagecreatetruecolor( $_width, $_height );
                        $abs_dest_file = str_replace(array('.png','.jpg'), array('_t2.png','_t2.jpg'), $abs_file);
                        if( imagecopyresampled($thumb, $source, 0, 0, 0, 0, $_width, $_height, $width, $height) ){
                            if( $ext=='png' && imagepng( $thumb, $abs_dest_file ) ){
                            }
                            elseif( $ext=='jpg' && imagejpeg( $thumb, $abs_dest_file ) ){
                            }
                            else{
                                copy($abs_file, $abs_dest_file);
                            }
                  
                        }
                        else{
                            copy($abs_file, $abs_dest_file);
                        }
                        $FileObject->setUrl( $obj->pic_dpre . str_replace(array('.png','.jpg'), array('_t2.png','_t2.jpg'), $url) );
                    }
                    //保存缩略图
                    if( $width>240 ){//大于240的处理缩略图
                        OssAttrInc(6, 44, 1);
                        $_width = 240;
                        $_height = floor( 240 * $height / $width );
                        $source = $ext=='jpg' ? imagecreatefromjpeg($abs_file) : imagecreatefrompng($abs_file);
                        $thumb = imagecreatetruecolor( $_width, $_height );
                        $abs_dest_file = str_replace(array('.png','.jpg'), array('_thumb.png','_thumb.jpg'), $abs_file);

                        /*
                        if( imagecopyresampled($thumb, $source, 0, 0, 0, 0, $_width, $_height, $width, $height) ){
                            if( $ext=='png' && imagepng( $thumb, $abs_dest_file ) ){
                            }
                            elseif( $ext=='jpg' && imagejpeg( $thumb, $abs_dest_file ) ){
                            }
                            else{
                                copy($abs_file, $abs_dest_file);
                            }
                  
                        }
                        else{
                            copy($abs_file, $abs_dest_file);
                        }
                        */
                        try{
                            $image2 = new Gmagick($abs_file);
                            $image2->cropthumbnailimage($_width,$_height)->setcompressionquality(100);
                            $image2->write($abs_dest_file);
                            $FileObject->setThumbnail_url( $obj->pic_dpre . str_replace(array('.png','.jpg'), array('_thumb.png','_thumb.jpg'), $url) );
                        }catch(Exception $e){
                            OssAttrInc(6, 45, 1);
							SeasLog::error('XXBBSPosts uin : {uin} Gmaick fail error = {err}', array('{uin}' => $userUin, '{err}' => var_export( $e, true )));
                            //@file_put_contents( '/tmp/eeror.log', var_export( $e, true ), FILE_APPEND );
                        }
                    }
                    else{
                        OssAttrInc(6, 46, 1);
                        $FileObject->setThumbnail_url( $obj->pic_dpre . $url );
                    }
                    $FileObjectArray->appendFileobject_list($FileObject);
                }
                else{
					SeasLog::error('XXBBSPosts uin : {uin} write img to file fail', array('{uin}' => $userUin));
                    OssAttrInc(6, 41, 1);
                    //$urls[] = "";
                }
                //为帖子内容里的替换准备
                //$fb_ids[] = "<img>{$FileObject_ID}</img>";
                $t_haved_pic = 1;
            }
            //$content = str_replace( $fb_ids, $urls, $content );
            $tinfo['t_fb'] = addslashes($FileObjectArray->serializeToString());
        }
        //b. 组合数据 
        $tinfo['fid'] = $fid;
        $tinfo['t_title'] = $title;//帖子标题
        $tinfo['t_content'] = $content;//内容
        $tinfo['t_haved_pic'] = $t_haved_pic;
        $tinfo['t_create_uin'] = $userUin;//改删 需要验证是否为创建者

        $video_flags = false; 
        if($VideoObject->getFileobject()->getUrl()){//url为空，表示没有视频,有视频则需要处理视频截图
            OssAttrInc(6, 47, 1);
            switch($VideoObject->getFileobject()->getFileType())
            {
                case XXProto_FileType::FT_PNG: $ext_v = "png";break;
                case XXProto_FileType::FT_JPG: $ext_v = "jpg";break;
            }
			SeasLog::debug('XXBBSPosts uin : {uin} has video, fileType = {type}', array('{uin}' => $userUin, '{type}' => $ext_v));
            $file_v = $obj->getVDir() . "{$fid}_1_{$time}_{$random}.{$ext_v}";
            $url_v = str_replace( SYSDIR_ROOT ."/bpic/", '', $file_v );
            $re_put = file_put_contents($file_v, $VideoObject->getFileobject()->getFile_bytes()); 
            if($re_put){
                OssAttrInc(6, 48, 1);
                $VideoObject->getFileobject()->setThumbnail_url( $obj->pic_dpre . $url_v ); 
            }else if($XxBBSEditType != XXProto_XXBBSEditType::XXBBSEditType_Modify){
                OssAttrInc(6, 49, 1);
				SeasLog::error('XXBBSPosts uin : {uin} enter EditType != XXBBSEditType_Modify', array('{uin}' => $userUin));
                $resXXBBSPostsProto->setResult(1999);
                $response->setBody( $resXXBBSPostsProto->serializeToString() );
                sendProtobufResponse($response);
                exit(); 
            }

            $VideoObject->getFileobject()->clearFile_bytes();
            $tinfo['video_fb'] = $VideoObject->serializeToString();
            $video_flags = true;
        }
        
        //无操作
        if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_None)
        {
            //do nothing
        }
        //发新帖
        else if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_New)
        {
            OssAttrInc(6, 50, 1);
            /*
             * c. 组织$tinfo数组，调用addTinfo方法存储到数据库。
			 * */
            if((!empty($content) || $video_flags) && !empty($title)){
				$tinfo['t_ex'] = $obj->default_t_ex;
				$tinfo['t_addtime'] = $time;
				$tinfo['productID'] = $head->getUser_info()->getProductID();
				//写入帖子
                $re = $obj->addTinfo($tinfo, $uinfo['uex']);
                if( $re !== true ){
                    OssAttrInc(6, 52, 1);
					$resXXBBSPostsProto->setResult( $re );
					SeasLog::error('XXBBSPosts uin : {uin} new bbs addTinfo fail', array('{uin}' => $userUin));
					//@file_put_contents( "/data/logs/gperror/t.log", json_encode($tinfo)."\t 1 \t{$obj->db->sql}\n", FILE_APPEND );//暂时如此
				}
            }else{
                OssAttrInc(6, 51, 1);
				SeasLog::error('XXBBSPosts uin : {uin} new bbs empty tile or content', array('{uin}' => $userUin));
				$resXXBBSPostsProto->setResult(1001);
			}
        }
        //修改帖
        else if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_Modify)
        {
            OssAttrInc(6, 53, 1);
			$tinfo['id'] = $XXBBSPostInfo->getTid();
			if( (!empty($content) || $video_flags) && !empty($title)){
                $re = $obj->updateTinfo($tinfo, $uinfo['uex'], $user_obj);
                if( $re !== true ){
                    OssAttrInc(6, 55, 1);
					$resXXBBSPostsProto->setResult($re);
					SeasLog::error('XXBBSPosts uin : {uin} edit bbs updateTinfo fail', array('{uin}' => $userUin));
					//@file_put_contents( "/data/logs/gperror/t.log", json_encode($tinfo)."\t 2 \t{$obj->db->sql}\n", FILE_APPEND );//暂时如此
				}
            }else{
                OssAttrInc(6, 54, 1);
				SeasLog::error('XXBBSPosts uin : {uin} Edit bbs empty tile or content', array('{uin}' => $userUin));
				$resXXBBSPostsProto->setResult(1001);
			}
        }
        //删除帖
        else if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_Remove)
        {
            OssAttrInc(6, 56, 1);
            $tinfo = array('t_status'=>0, 'fid'=>$fid);// 状态字段为0==删除
            $tinfo['id'] = $XXBBSPostInfo->getTid();
            $tinfo['t_create_uin'] = $userUin;
            $tinfo['reason'] = $XXBBSPostInfo->getReason();//删除帖子原因

            $re = $obj->updateTinfo($tinfo, $uinfo['uex'], $user_obj);
            if( $re !== true){
                OssAttrInc(6, 57, 1);
                $resXXBBSPostsProto->setResult($re);
				SeasLog::error('XXBBSPosts uin : {uin} updateTinfo remove bbs fail', array('{uin}' => $userUin));
                //@file_put_contents( "/data/logs/gperror/t.log", json_encode($tinfo)."\t 3 \t{$obj->db->sql}\n", FILE_APPEND );//暂时如此
            }
        }
        //恢复帖子
        else if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_Restore)
        {
            OssAttrInc(6, 58, 1);
            $tinfo['man_uin'] = $userUin;//管理员duin
            $tinfo['id'] = $XXBBSPostInfo->getTid();
            unset($tinfo['t_create_uin']);//此为管理员的uin，不需要
            $re = $obj->restoreTinfo($tinfo, $simu_user, $user_obj);
            if( $re !== true ){
                OssAttrInc(6, 59, 1);
                $resXXBBSPostsProto->setResult($re);
				SeasLog::error('XXBBSPosts uin : {uin} restoreTinfo fail', array('{uin}' => $userUin));
                //@file_put_contents( "/data/logs/gperror/t.log", json_encode($tinfo)."\t 3 \t{$obj->db->sql}\n", FILE_APPEND );//暂时如此
            }
        }
        //举报帖子，举报原因沿用删除原因
        else if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_BadReport)
        {
            OssAttrInc(6, 60, 1);
            $tinfo['id'] = $XXBBSPostInfo->getTid();//帖id
            $tinfo['uid'] = $userUin;//举报者uin
            $tinfo['reason'] = $XXBBSPostInfo->getReason();//删除帖子原因
            $re = $obj->addBadReportTinfo($tinfo);
            if( $re !== true){
                OssAttrInc(6, 61, 1);
                $resXXBBSPostsProto->setResult($re);
				SeasLog::error('XXBBSPosts uin : {uin} addBadReportTinfo fail', array('{uin}' => $userUin));
                //@file_put_contents( "/data/logs/gperror/t.log", json_encode($tinfo)."\t 4 \t{$obj->db->sql}\n", FILE_APPEND );//暂时如此
            }

        }
        else{
            OssAttrInc(6, 62, 1);
			SeasLog::error('XXBBSPosts uin : {uin} enter SUBCMD == POSTREQ type not found', array('{uin}' => $userUin));
            $resXXBBSPostsProto->setResult(1999);
        }
    }
    //评论请求
    else if($subcmd == XXProto_XXBBSPostsProto_SUBCMD::SUBCMD_XXBBSPostsProto_COMMENTREQ)
    {
        OssAttrInc(6, 17, 1);
        $resXXBBSPostsProto->setSubcmd( XXProto_XXBBSPostsProto_SUBCMD::SUBCMD_XXBBSPostsProto_COMMENTRES );
        $XxBBSPostsCommentReq = $XXBBSPostsProto->getComment_req();
        $XxBBSCommentInfo = $XxBBSPostsCommentReq->getComment_info();
        $content = $XxBBSCommentInfo->getContent();//内容
        $cid = $XxBBSCommentInfo->getCid();//评论id
        $XXBBSCommentTargetInfo = $XxBBSCommentInfo->getTarget_info();
        $target_cid = $XXBBSCommentTargetInfo->getTarget_cid();
        $tid = $XxBBSCommentInfo->getTid();
        $fid = $XxBBSCommentInfo->getFid();
        //处理屏蔽词
        if( $obj->checkHasBlockKw($content) ){
            OssAttrInc(6, 18, 1);
            $resXXBBSPostsProto->setResult(1002);//正常 默认
            $response->setBody( $resXXBBSPostsProto->serializeToString() );
            sendProtobufResponse($response);
            exit();
        }

        $XxBBSEditType = $XxBBSPostsCommentReq->getEdit_type();

        $cinfo = array(
            'tid'=>$tid,
            'fid'=>$fid,
            'c_content'=>$content,
            'c_target_cid'=>$target_cid,
            'c_create_uin'=>$userUin,//改删 此处作为验证是否为创建者之用
        );

        //无操作
        if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_None)
        {
            //do nothing
        }
        //发新评论
        else if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_New)
        {
            OssAttrInc(6, 19, 1);
			if(!empty($cinfo['c_content'])){
                $re = $obj->addComment($cinfo, $uinfo['uex']);
				if($re !== true)
                {
                    OssAttrInc(6, 21, 1);
					$resXXBBSPostsProto->setResult($re);
			    	@file_put_contents( "/data/logs/gperror/c.log", json_encode($cinfo)."\t 5 \t{$obj->db->sql} error:{$re}\n", FILE_APPEND );
				}
            }else{
                OssAttrInc(6, 20, 1);
				$resXXBBSPostsProto->setResult(1001);
			}
        }
        //修改评论
        else if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_Modify)
        {
            OssAttrInc(6, 22, 1);
            $cinfo['id'] = $cid;
			if(!empty($cinfo['c_content'])){
                $re = $obj->updateComment($cinfo, $user_obj);
				if( $re !== true )
                {
                    OssAttrInc(6, 24, 1);
					$resXXBBSPostsProto->setResult($re);
			    	@file_put_contents( "/data/logs/gperror/c.log", json_encode($cinfo)."\t 6 \t{$obj->db->sql} error:{$re}\n", FILE_APPEND );
				}
            }else{
                OssAttrInc(6, 23, 1);
				$resXXBBSPostsProto->setResult(1001);
			}
        }
        //删除
        else if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_Remove)
        {
            OssAttrInc(16, 0, 1);
            $cinfo = array('c_status'=>0, 'fid'=>$fid);// 状态字段为0==删除
            $cinfo['id'] = $cid;
            $cinfo['tid'] = $tid;
            $cinfo['c_create_uin'] = $userUin;//仅作验证是否为创建者或帖作者之用
            $re = $obj->updateComment($cinfo, $user_obj);
            if( $re !== true ){
                OssAttrInc(16, 1, 1);
                $resXXBBSPostsProto->setResult($re);
			    	@file_put_contents( "/data/logs/gperror/c.log", json_encode($cinfo)."\t 7 \t{$obj->db->sql} error:{$re}\n", FILE_APPEND );
            }
        }else{
            OssAttrInc(16, 2, 1);
			SeasLog::error('XXBBSPosts uin : {uin} enter SUBCMD == comment type not found', array('{uin}' => $userUin));
            $resXXBBSPostsProto->setResult(1999);
        }
    }
    //点赞请求(取消赞)
    else if($subcmd == XXProto_XXBBSPostsProto_SUBCMD::SUBCMD_XXBBSPostsProto_DIANZANREQ)
    {
        OssAttrInc(16, 3, 1);
        $resXXBBSPostsProto->setSubcmd( XXProto_XXBBSPostsProto_SUBCMD::SUBCMD_XXBBSPostsProto_DIANZANRES );

        $XxBBSPostsDianzanReq = $XXBBSPostsProto->getDianzan_req();
        $fid = $XxBBSPostsDianzanReq->getFid();
        $tid = $XxBBSPostsDianzanReq->getTid();
        $XxBBSEditType = $XxBBSPostsDianzanReq->getEdit_type();
        //点赞
        if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_New)
        {
            OssAttrInc(16, 4, 1);
            $re = $obj->addTDianzan( array( 'tid'=>$tid, 'fid'=>$fid, 'uin'=>$userUin ) );
            if( $re !== true ){
                OssAttrInc(16, 5, 1);
                $resXXBBSPostsProto->setResult($re);
                @file_put_contents( "/data/logs/gperror/z.log", json_encode($cinfo)."\t 8 \t{$obj->db->sql}\n", FILE_APPEND );//暂时如此
            }
        }
        //取消
        else if($XxBBSEditType == XXProto_XXBBSEditType::XXBBSEditType_Remove)
        {
            OssAttrInc(16, 6, 1);
            $re = $obj->delTDianzan( array( 'tid'=>$tid, 'fid'=>$fid, 'uin'=>$userUin ));
            if( $re !== true ){
                OssAttrInc(16, 7, 1);
                $resXXBBSPostsProto->setResult($re);
                @file_put_contents( "/data/logs/gperror/z.log", json_encode($cinfo)."\t 9 \t{$obj->db->sql}\n", FILE_APPEND );//暂时如此
            }
        }else{
            OssAttrInc(16, 8, 1);
			SeasLog::error('XXBBSPosts uin : {uin} enter SUBCMD == DIANZANREQ type not found', array('{uin}' => $userUin));
            $resXXBBSPostsProto->setResult(1999);
        }
    }
    elseif($subcmd == XXProto_XXBBSPostsProto_SUBCMD::SUBCMD_XXBBSPostsProto_MAKETOPREQ){//置顶操作
        OssAttrInc(16, 9, 1);
        $resXXBBSPostsProto->setSubcmd( XXProto_XXBBSPostsProto_SUBCMD::SUBCMD_XXBBSPostsProto_MAKETOPRES );
        $XXBBSPostsMakeTopReq = $XXBBSPostsProto->getMaketop_req();
        $top_arr = array();
        $top_arr['fid'] = $XXBBSPostsMakeTopReq->getFid();
        $top_arr['tid'] = $XXBBSPostsMakeTopReq->getTid();
        $top_edit_type = $XXBBSPostsMakeTopReq->getEdit_type();
        $top_arr['uin'] = $userUin;//判断是否为管理员用

        if($top_edit_type == XXProto_XXBBSEditType::XXBBSEditType_None){//无操作
            //do nothing
        }elseif($top_edit_type == XXProto_XXBBSEditType::XXBBSEditType_New){//新
            OssAttrInc(16, 10, 1);
            $re = $obj->addTTop( $top_arr, $user_obj); 
            if( $re !== true ){
                OssAttrInc(16, 11, 1);
                $resXXBBSPostsProto->setResult($re);
                @file_put_contents( "/data/logs/gperror/z.log", json_encode($top_arr)."\t 10 \t{$obj->db->sql}\n", FILE_APPEND );//暂时如此
            }
        }elseif($top_edit_type == XXProto_XXBBSEditType::XXBBSEditType_Remove){//删
            OssAttrInc(16, 12, 1);
            $re = $obj->delTTop( $top_arr );
            if( $re !== true ){
                OssAttrInc(16, 13, 1);
                $resXXBBSPostsProto->setResult($re);
                @file_put_contents( "/data/logs/gperror/z.log", json_encode($top_arr)."\t 11 \t{$obj->db->sql}\n", FILE_APPEND );//暂时如此
            }
        }else{
            OssAttrInc(16, 14, 1);
			SeasLog::error('XXBBSPosts uin : {uin} enter SUBCMD == MAKETOPREQ type not found', array('{uin}' => $userUin));
            $resXXBBSPostsProto->setResult(1999);
        }

    }
    elseif( $subcmd == XXProto_XXBBSPostsProto_SUBCMD::SUBCMD_XXBBSPostsProto_MAKEBESTREQ){//加精操作
        OssAttrInc(16, 15, 1);
        $resXXBBSPostsProto->setSubcmd( XXProto_XXBBSPostsProto_SUBCMD::SUBCMD_XXBBSPostsProto_MAKEBESTRES );
        $XXBBSPostsMakeBestReq = $XXBBSPostsProto->getMakebest_req();
        $best_arr['fid'] = $XXBBSPostsMakeBestReq->getFid();
        $best_arr['tid'] = $XXBBSPostsMakeBestReq->getTid();
        $best_edit_type = $XXBBSPostsMakeBestReq->getEdit_type();
        $best_arr['uin'] = $userUin;//判断是否为管理员用

        if($best_edit_type == XXProto_XXBBSEditType::XXBBSEditType_None){//无操作
            //do nothing
        }elseif($best_edit_type == XXProto_XXBBSEditType::XXBBSEditType_New){//新
            OssAttrInc(16, 16, 1);
            $re = $obj->addTBest( $best_arr, $user_obj); 
            if( $re !== true ){
                OssAttrInc(16, 17, 1);
                $resXXBBSPostsProto->setResult($re);
                @file_put_contents( "/data/logs/gperror/z.log", json_encode($best_arr)."\t 12 \t{$obj->db->sql}\n", FILE_APPEND );//暂时如此
            }
        }elseif($best_edit_type == XXProto_XXBBSEditType::XXBBSEditType_Remove){//删
            OssAttrInc(16, 18, 1);
            $re = $obj->delTBest( $best_arr); 
            if( $re !== true ){
                OssAttrInc(16, 19, 1);
                $resXXBBSPostsProto->setResult($re);
                @file_put_contents( "/data/logs/gperror/z.log", json_encode($best_arr)."\t 13 \t{$obj->db->sql}\n", FILE_APPEND );//暂时如此
            }
        }else{
            OssAttrInc(16, 20, 1);
			SeasLog::error('XXBBSPosts uin : {uin} enter SUBCMD == MAKEBESTREQ type not found', array('{uin}' => $userUin));
            $resXXBBSPostsProto->setResult(1999);
        }
    }
    else//未知协议命令字
    {
        OssAttrInc(16, 21, 1);
		SeasLog::error('XXBBSPosts uin : {uin} enter  SUMCMD not found', array('{uin}' => $userUin));
        $resXXBBSPostsProto->setResult(1999);//未知错误
        $resXXBBSPostsProto->setSubcmd( $subcmd );//返回请求的命令字
    }
    
    //回包
    $response->setBody( $resXXBBSPostsProto->serializeToString() );
    sendProtobufResponse($response);

    exit();

}
else
{
    OssAttrInc(16, 22, 1);
	SeasLog::error('XXBBSPosts uin : {uin} enter cmd not found', array('{uin}' => $userUin));
    $response->setResult(1004);//    XXUnityCS_Err_Unknown_CMD = 1004;//未知命令字
    sendProtobufResponse($response);
    exit();
}
//if($_SERVER['REMOTE_ADDR']=='14.23.164.59') @file_put_contents( "/tmp/error.log", date('Y-m-d H:i:s').var_export($resXXBBSPostsProto,true)."\t test \t{$obj->db->sql}\n", FILE_APPEND );
?>
