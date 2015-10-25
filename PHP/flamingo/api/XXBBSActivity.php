<?php
/*
        协议:XXBBSPostsProto
        功能:
        TODO: 用户鉴权
        //
 */
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXPBBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSBase.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiprotocols/XXBBSActivity.proto.php";
include_once dirname(dirname(__FILE__)) . "/gpapiutils/XXServerBase.php";
include_once dirname(dirname(__FILE__)) . "/utils/ActivityBbsList.php";
include_once dirname(dirname(__FILE__)) . "/utils/UserBbs.php";
include_once dirname(dirname(__FILE__)) . "/utils/User.php";

$postData = getRequest();

// 数据打包返回
$response = new XXProto_XXUnityCSPkg();
$head = new XXProto_XXUnityCSPkgHead();
$head->setCmd(1053);
$response->setResult(0);//正常 默认
$response->setHead($head);

if($postData == "")
{
    $response->setResult(1005);//    XXUnityCS_Err_Unknown_Req = 1005;//未知请求(无法解包)
    sendProtobufResponse($response);
    exit();
}

//解包数据
$XxUnityCSPkg = XXProto_XXUnityCSPkg::parseFromString($postData);
if(! is_object($XxUnityCSPkg)){
    $response->setResult(1005);//    XXUnityCS_Err_Unknown_Req = 1005;//未知请求(无法解包)
    sendProtobufResponse($response);
    exit();
}
$head = $XxUnityCSPkg->getHead();//同样变量名 复写
$body = $XxUnityCSPkg->getBody();

//验证登录态
$loginKey = $head->getLogin_key();
$userUin = $head->getUin();//作者UIN
$obj = new UserBbs();
$obj->redis->use_redis('login_key');
$login_str = $obj->redis->redis->get( $loginKey );
$is_login = true;
if( ! $login_str ){//登录态已失效
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
    if( ! in_array( $userUin, $simu_user ) ){
        $is_login = false;
        // $response->setResult(1002);//登录态验证失败（需要登陆或者重新登陆）
        // sendProtobufResponse($response);
        // exit();
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
        $is_login= false;
    }
    else{
        $obj->redis->redis->setTimeout( $loginKey, 86400*30 );
    }
}


//处理禁言逻辑
$obj->redis->use_redis('dm_level');
$block_time = $obj->redis->redis->hGet('GUOPAN_BLOCK',$userUin);
if($block_time&&($block_time-time()>=0)){
    $response->setResult(1001);
    sendProtobufResponse($response);
    exit();
}


$response->setHead($head);//用或不用



if($head->getCmd() == XXProto_XXBBSActivityProto_CMD::CMD_XXBBSActivityProto)
{
    //解包XXBBSActivityProto
    $XxBBSActivityProto = XXProto_XXBBSActivityProto::parseFromString($body);
    $subcmd = $XxBBSActivityProto->getSubcmd();//协议命令字 
    $res_XXBBSActivityProto = new XXProto_XXBBSActivityProto();
    $res_XXBBSActivityProto->setResult(0);//正常 默认

    $obj = new ActivityBbsList();
    $user_obj = new User();

    //关注活动
    if($subcmd == XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_JOINREQ)
    {

        if(!$is_login){
            $response->setResult(1002);//登录态验证失败（需要登陆或者重新登陆）
            sendProtobufResponse($response);
            exit();
        }

        $res_XXBBSActivityProto->setSubcmd(XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_JOINRES);

        //关注操作请求
        $XxBBSActivityJoinReq = $XxBBSActivityProto->getJoin_req();

        //活动id
        $auinfo['afid'] = $XxBBSActivityJoinReq->getAfid();
        $action = $XxBBSActivityJoinReq->getAction();
        $auinfo['status'] = $action ? 0 : 1;

        $auinfo['uin'] = $head->getUin();


        if(!$obj->updateAUininfo($auinfo))
        {
            $res_XXBBSActivityProto->setResult(1001);// DB_Error
            @file_put_contents("/data/logs/gperror/a.log", json_encode($atinfo)."\t 1 \t{$obj->db->sql}\n", FILE_APPEND);
        }else{
            //更新用户关注活动数量
            $uinfo = $user_obj->getUser('', $auinfo['uin']);
            if($uinfo){
                $obj->updateUserATcount($auinfo['uin'], $uinfo['uex'], $auinfo['afid'],$action);
            }
        }
    }
    //发表内容
    elseif($subcmd == XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_POSTREQ)
    {
        if(!$is_login){
            $response->setResult(1002);//登录态验证失败（需要登陆或者重新登陆）
            sendProtobufResponse($response);
            exit();
        }

        $res_XXBBSActivityProto->setSubcmd(XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_POSTRES);

        $XxBBSActivityPostReq = $XxBBSActivityProto->getPost_req();

        $XxBBSActivityPostInfo = $XxBBSActivityPostReq->getPost_info();
        $postEdit_type = $XxBBSActivityPostReq->getEdit_type();//操作类型


        $XXBBSActivityPostInfo = $XxBBSActivityPostInfo->getActivity_info();
        $afid = $XXBBSActivityPostInfo->getAfid();

        //$content = $XxBBSPostInfo->getContent();//内容

        $title = $XxBBSActivityPostInfo->getTitle();//标题

        $userUin = $head->getUin();//作者信息

        //a. 处理图片
        $time = time();
        $FileObjects = $XxBBSActivityPostInfo->getPhoto();//图片
        //读取图片的内容
        if(is_array($FileObjects)){
            $adir = $obj->getADir();
            $fbs = array(); //图片所有属性存入数据库
            foreach($FileObjects as $k_fbs=>$FileObject){
                $FileObject_ID = $FileObject->getID();
                //$FileObject_url = $FileObject->getUrl();
                $FileObject_fileType = $FileObject->getFileType();//图片类型
                $FileObject_size = $FileObject->getSize();
                $FileObject_checksum = $FileObject->getChecksum();
                $FileObject_file_bytes = $FileObject->getFile_bytes();//文件内容

                //存图片
                $random = rand(1000,10000);
                $ext = "";
                @file_put_contents("/data/logs/gperror/a.log", "\t 5 \t{$FileObject_fileType}\n", FILE_APPEND);
                switch($FileObject_fileType)
                {
                case XXProto_FileType::FT_PNG: $ext = "png";break;
                case XXProto_FileType::FT_JPG: $ext = "jpg";break;
                }

                $file = $adir . "{$afid}_0_{$time}_{$random}.{$ext}";
                $url = str_replace(SYSDIR_ROOT ."/bpic/", '', $file);
                //将图片写入文件
                if(file_put_contents($file, $FileObject_file_bytes)){
                    $fbs[$k_fbs] = $fbinfo = array(
                        'url' => $url,
                        'fileType' => $FileObject_fileType,
                        'size' => $FileObject_size,
                        'checksum' => $FileObject_checksum,
                        'addtime' => $time,
                    );
                    $obj->addFb($fbinfo);
                    //PNG要转JPG
                    if( $ext=='png' ){
                        @imagejpeg( imagecreatefrompng( $file ), str_replace('.png', '.jpg', $file), 80 );
                        $file = str_replace('.png', '.jpg', $file);
                        $url = str_replace('.png', '.jpg', $url);
                        $ext='jpg';
                        $fbs[$k_fbs]['fileType'] = 106;
                    }
                    //优化原图
                    $abs_file = $file; 
                    list($width, $height) = getimagesize($abs_file);
                    if( $width>960 ){
                        $_width = $fbs[$k_fbs]['width'] = 960;
                        $_height = $fbs[$k_fbs]['height'] = floor( 960 * $height / $width );
                        $source = $ext=='jpg' ? imagecreatefromjpeg($abs_file) : imagecreatefrompng($abs_file);
                        $thumb = imagecreatetruecolor( $_width, $_height );
                        $abs_dest_file = str_replace(array('.png','.jpg'), array('_t2.png','_t2.jpg'), $abs_file);
                        $fbs[$k_fbs]['url'] = str_replace(array('.png','.jpg'), array('_t2.png','_t2.jpg'), $url);
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
                            $c = copy($abs_file, $abs_dest_file);
                        }
                    }else{
                        $fbs[$k_fbs]['width'] = $width;
                        $fbs[$k_fbs]['height'] = $height;
                    }
                    //保存缩略图
                    if( $width>240 ){
                        $_width = 240;
                        $_height = floor( 240 * $height / $width );
                        $source = $ext=='jpg' ? imagecreatefromjpeg($abs_file) : imagecreatefrompng($abs_file);
                        $thumb = imagecreatetruecolor( $_width, $_height );
                        $abs_dest_file = str_replace(array('.png','.jpg'), array('_thumb.png','_thumb.jpg'), $abs_file);
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
                            $c = copy($abs_file, $abs_dest_file);
                        }
                    }
                }
                else{
                    $fbs[$k_fbs] = array();
                }
            }
        }
        //b. 组合数据
        $atinfo['afid'] = $afid;
        $atinfo['at_title'] = $title;
        $atinfo['at_photo'] = json_encode($fbs);
        $atinfo['at_create_uin'] = $userUin;

        if( $postEdit_type == XXProto_XXBBSEditType::XXBBSEditType_BadReport){
            $atinfo['uid'] = $userUin;
            $atinfo['atid'] = $XxBBSActivityPostInfo->getAtid();
            $atinfo['reason'] = $XxBBSActivityPostInfo->getReason();

            if( !$obj->addBadReportATinfo($atinfo)){
                @file_put_contents("/data/logs/gperror/a.log", json_encode($atinfo)."\t 1 \t{$obj->db->sql}\n", FILE_APPEND);
            } 

        }else{
            //活动时间过期，不让发帖
            $ainfo = $obj->getAinfo($atinfo['afid'], '');
            if( $ainfo && $ainfo[0]['a_starttime'] < time() && $ainfo[0]['a_endtime'] > time() ){
                if(!$obj->addATinfo($atinfo))
                {
                    $res_XXBBSActivityProto->setResult(1001);// DB_Error
                    @file_put_contents("/data/logs/gperror/a.log", json_encode($atinfo)."\t 1 \t{$obj->db->sql}\n", FILE_APPEND);
                }else{
                    $uinfo = $user_obj->getUser('',$userUin);//获取作者信息
                    //更新用户参与活动图片数量
                    $PicCount = count($FileObjects);
                    if($uinfo){
                        $obj->updateUserATPicCount($userUin, $uinfo['uex'], $PicCount);
                    }
                    //更新用户关注活动数量
                    $uinfo = $user_obj->getUser('', $userUin);
                    if($uinfo){
                        $obj->updateUserATcount($userUin, $uinfo['uex'], $afid);
                    }
                }
            }else{
                $res_XXBBSActivityProto->setResult(1001);// DB_Error
            }
        }
    }
    //发表评论
    elseif($subcmd == XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_COMMENTREQ)
    {
        if(!$is_login){
            $response->setResult(1002);//登录态验证失败（需要登陆或者重新登陆）
            sendProtobufResponse($response);
            exit();
        }

        $res_XXBBSActivityProto->setSubcmd(XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_COMMENTRES);

        $XxBBSActivityCommentReq = $XxBBSActivityProto->getComment_req();

        $XXBBSCommentInfo = $XxBBSActivityCommentReq->getComment_info();

        $XXBBSCommentTargetInfo = $XXBBSCommentInfo->getTarget_info();

        //组合数据
        $atcinfo['afid'] = $XXBBSCommentInfo->getFid();
        $atcinfo['atid'] = $XXBBSCommentInfo->getTid();
        $atcinfo['atc_content'] = $XXBBSCommentInfo->getContent();
        $atcinfo['atc_target_cid'] = $XXBBSCommentTargetInfo->getTarget_cid();
        $atcinfo['atc_create_uin'] = $head->getUin();

        //活动时间过期，不让评论
        $atinfo = $obj->getATinfo($atcinfo['atid']);
        $ainfo = $obj->getAinfo($atinfo[0]['afid'], '');
        if( $ainfo && $ainfo[0]['a_starttime'] < time() && $ainfo[0]['a_endtime'] > time() ){
            if(!$obj->addATComment($atcinfo))
            {
                $res_XXBBSActivityProto->setResult(1001);// DB_Error
                @file_put_contents("/data/logs/gperror/a.log", json_encode($atcinfo)."\t 1 \t{$obj->db->sql}\n", FILE_APPEND);
            }

        }else{
            $res_XXBBSActivityProto->setResult(1001);// DB_Error
        }

    }
    //创建活动
    elseif($subcmd == XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_CREATEREQ)
    {
        if(!$is_login){
            $response->setResult(1002);//登录态验证失败（需要登陆或者重新登陆）
            sendProtobufResponse($response);
            exit();
        }

        $res_XXBBSActivityProto->setSubcmd(XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_CREATERES);


        $XxBBSActivityCreateReq = $XxBBSActivityProto->getCreate_req();

        $XXBBSActivityInfo = $XxBBSActivityCreateReq->getActivity_info();
        $content = $XXBBSActivityInfo->getContent();

        $XXBBSGroupInfo = $XXBBSActivityInfo->getGroup_info();
        $fid = $XXBBSGroupInfo->getFid();

        $TimeControl = $XXBBSActivityInfo->getTime_control();

        //a. 处理图片
        $time = time();
        $FileObject = $XXBBSActivityInfo->getPhoto();//图片
        //读取图片的内容
        if($FileObject){
            $adir = $obj->getADir();
            $urls = $fbs = array();
            $FileObject_ID = $FileObject->getID();
            //$FileObject_url = $FileObject->getUrl();
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

            $file = $adir . "{$fid}_0_{$time}_{$random}.{$ext}";
            $url = str_replace(SYSDIR_ROOT ."/bpic/", '', $file);
            //将图片写入文件
            if(file_put_contents($file, $FileObject_file_bytes)){
                $fbs = $fbinfo = array(
                    'url' => $url,
                    'fileType' => $FileObject_fileType,
                    'size' => $FileObject_size,
                    'checksum' => $FileObject_checksum,
                    'addtime' => $time,
                );
                $obj->addFb($fbinfo);
                $urls[] = "<img>". $obj->pic_dpre . $url . "</img>";
                //PNG要转JPG
                if( $ext=='png' ){
                    @imagejpeg( imagecreatefrompng( $file ), str_replace('.png', '.jpg', $file), 80 );
                    $file = str_replace('.png', '.jpg', $file);
                    $url = str_replace('.png', '.jpg', $url);
                    $ext='jpg';
                    $fbs['fileType'] = 106;
                }
                //优化原图
                $abs_file = $file; 
                list($width, $height) = getimagesize($abs_file);
                if( $width>960 ){
                    $_width = $fbs['width'] = 960;
                    $_height = $fbs['height'] = floor( 960 * $height / $width );
                    $source = $ext=='jpg' ? imagecreatefromjpeg($abs_file) : imagecreatefrompng($abs_file);
                    $thumb = imagecreatetruecolor($_width, $_height);
                    $abs_dest_file = str_replace(array('.png','.jpg'), array('_t2.png','_t2.jpg'), $abs_file);
                    $fbs['url'] = str_replace(array('.png','.jpg'), array('_t2.png','_t2.jpg'), $url);
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
                        $c = copy($abs_file, $abs_dest_file);
                    }
                }else{
                    $fbs['width'] = $width;
                    $fbs['height'] = $height;
                }
                //保存缩略图
                if( $width>240 ){
                    $_width = 240;
                    $_height = floor( 240 * $height / $width );
                    $source = $ext=='jpg' ? imagecreatefromjpeg($abs_file) : imagecreatefrompng($abs_file);
                    $thumb = imagecreatetruecolor( $_width, $_width );
                    $abs_dest_file = str_replace(array('.png','.jpg'), array('_thumb.png','_thumb.jpg'), $abs_file);
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
                        $c = copy($abs_file, $abs_dest_file);
                    }
                }
            }
            else{
                $urls[] = $fbs[] = "";
            }
        }

        //b.组合数据
        $ainfo['fid'] = $fid;
        $ainfo['a_title'] = $XXBBSActivityInfo->getTitle();
        $ainfo['a_pics'] = json_encode(array($fbs));
        $ainfo['a_content'] = $content;
        $ainfo['a_create_uin'] = $head->getUin();
        $ainfo['a_starttime'] = $TimeControl->getStartTime();
        $ainfo['a_endtime'] = $TimeControl->getEndTime();
        if(!$obj->addAinfo($ainfo))
        {
            $res_XXBBSActivityProto->setResult(1001);// DB_Error
            @file_put_contents("/data/logs/gperror/a.log", json_encode($ainfo)."\t 1 \t{$obj->db->sql}\n", FILE_APPEND);
        }
    }
    //获取活动列表
    elseif($subcmd == XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_ACTIVITYLISTREQ)
    {
        $res_XXBBSActivityProto->setSubcmd(XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_ACTIVITYLISTRES);

        $XxBBSActivityListReq = $XxBBSActivityProto->getActivity_list_req();

        $ActivityListType = $XxBBSActivityListReq->getActivity_list_type();

        $fid = $XxBBSActivityListReq->getFid();
        $uin = $head->getUin();
        $begin_timestamp = $XxBBSActivityListReq->getBegin_timestamp();
        $count = $XxBBSActivityListReq->getCount();
        $direction = $XxBBSActivityListReq->getDirection();
        $sb_uin = $XxBBSActivityListReq->getSb_uin();

        if($ActivityListType == XXProto_XXBBSActivityListType::XXBBSActivityListType_None){
            //do nothing
        }	
        //最新
        else if($ActivityListType == XXProto_XXBBSActivityListType::XXBBSActivityListType_Newest){
            $a_list = $obj->getNewActivityList($fid, $count, $begin_timestamp, $direction);
        }
        //最热
        else if($ActivityListType == XXProto_XXBBSActivityListType::XXBBSActivityListType_Hotest){
            $a_list = $obj->getHotestActivityList($fid, $count, $begin_timestamp, $direction);
        }
        //推荐
        else if($ActivityListType == XXProto_XXBBSActivityListType::XXBBSActivityListType_Recommend){
            $a_list = $obj->getRecommendActivityList($fid, $count, $begin_timestamp, $direction);
        }
        //小组正在进行的活动
        else if($ActivityListType == XXProto_XXBBSActivityListType::XXBBSActivityListType_FromGroup_ing){
            $a_list = $obj->getGroupIngActivityList($fid, $count, $begin_timestamp, $direction);
        }
        //小组历史活动
        else if($ActivityListType == XXProto_XXBBSActivityListType::XXBBSActivityListType_FromGroup_history){
            $a_list = $obj->getGroupHistoryActivityList($fid, $count, $begin_timestamp, $direction);
        }
        //某个人的活动列表
        else if($ActivityListType == XXProto_XXBBSActivityListType::XXBBSActivityListType_SB){
            $a_list = $obj->getMyActivityList($fid, $sb_uin, $count, $begin_timestamp, $direction); 
        }
        else{
            $res_XXBBSActivityProto->setResult(1999);//未知错误
        }

        if($a_list){
            $XXBBSActivityListRes = new XXProto_XXBBSActivityListRes();
            $XXBBSActivityListRes->setActivity_list_type($ActivityListType);

            foreach($a_list as $k => $v){
                if( $v['a_endtime'] < time() ){
                    unset( $a_list[$k] );
                    $a_list[] = $v;
                }
            }
            foreach($a_list as $k => $v){

                $activity_info_res = new XXProto_XXBBSActivityInfo();
                $activity_info_res->setTitle($v['a_title']);
                $activity_info_res->setContent($v['a_content']);
                $activity_info_res->setAfid($v['id']);
                $activity_info_res->setCreate_time($v['a_addtime']);
                $activity_info_res->setModyfied_time(strtotime($v['a_updatetime']));
                $activity_info_res->setMember_count($v['a_uin_count']);

                if( $v['a_endtime'] < time() ) $activity_info_res->setIs_out_date(1);//是否结束

                $activity_info_res->setPost_count($v['a_t_count']); //内容数量

                $group_info = new XXProto_XXBBSGroupInfo();
                $group_info->setFid($v['fid']);
                $activity_info_res->setGroup_info($group_info); //活动所属小组

                $role_info = new XXProto_UserRoleInfo();
                $role_info->setUin($v['a_create_uin']);
                $uinfo = $user_obj->getUser('',$v['a_create_uin']);//获取作者信息
                if($uinfo){
                    if( $uinfo['unickname']){
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
                $a_pic = $a_pic[0];
                $Photo = new XXProto_FileObject();	
                $Photo->setID(1);
                $Photo->setUrl($obj->pic_dpre . $a_pic['url']);
                $thumb = $obj->pic_dpre . $a_pic['url'];
                if( $a_pic['width'] > 240 ) $thumb = $obj->pic_dpre . str_replace(array('.png','.jpg','_t2'), array('_thumb.png','_thumb.jpg',''), $a_pic['url']);
                $Photo->setThumbnail_url( $thumb );
                if($a_pic['width']) $Photo->setImage_width($a_pic['width']);
                if($a_pic['height']) $Photo->setImage_height($a_pic['height']);
                $activity_info_res->setPhoto($Photo);

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

                $XXBBSActivityListRes->appendActivity_info_list($activity_info_res);
            }
            $res_XXBBSActivityProto->setActivity_list_res($XXBBSActivityListRes);
        }

    }
    //获取某个的活动内容列表或者某个人发过的活动内容
    elseif($subcmd == XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_POSTLISTREQ)
    {
        $res_XXBBSActivityProto->setSubcmd(XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_POSTLISTRES);

        $XxBBSActivityPostListReq = $XxBBSActivityProto->getPost_list_req();

        $afid = $XxBBSActivityPostListReq->getAfid();
        $begin_timestamp = $XxBBSActivityPostListReq->getBegin_timestamp();
        $count = $XxBBSActivityPostListReq->getCount();
        $uin = $head->getUin();

        $sb_uin = $XxBBSActivityPostListReq->getSb_uin();
        $activity_post_list_type = $XxBBSActivityPostListReq->getActivity_post_list_type();

        if($activity_post_list_type == XXProto_XXBBSActivityPostListType::XXBBSActivityPostListType_SB && $sb_uin){
            $t_list = $obj->getATinfoListByDianzan($afid, "AND at_create_uin={$sb_uin}", '', $count, $begin_timestamp);
            //$t_list = $obj->getATinfoList($afid, "AND at_create_uin={$sb_uin}", '', $count, $begin_timestamp);
        }else{
            $t_list = $obj->getATinfoList($afid, '', '', $count, $begin_timestamp);
        }

        if($t_list){
            $post_list_res = new XXProto_XXBBSActivityPostListRes();
            include_once dirname(__FILE__) . "/SetPBFunctions.php";
            foreach($t_list as $k => $v){
                $activity_post_info_res = new XXProto_XXBBSActivityPostInfo();
                $activity_post_info_res->setTitle($v['at_title']);

                $activity_post_info_res->setAtid($v['id']);

                //活动创建者
                $role_info = new XXProto_UserRoleInfo();
                $role_info->setUin($v['at_create_uin']);
                $uinfo = $user_obj->getUser('',$v['at_create_uin']);//获取创建者信息
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
                $activity_post_info_res->setRole_info($role_info); //活动创建者
                //所属活动
                $ainfo = $obj->getAinfo($v['afid'], 'AND a_status=1');
                $XXBBSGroupInfo_res = setPBActivityInfo($uin, $ainfo[0], $user_obj, $obj);
                if($XXBBSGroupInfo_res){
                    $activity_post_info_res->setActivity_info($XXBBSGroupInfo_res);
                }
                $activity_post_info_res->setCreate_time($v['at_addtime']);
                $activity_post_info_res->setModyfied_time(strtotime($v['at_updatetime']));
                $activity_post_info_res->setDianzan_count($v['at_dianzan_count']);
                $activity_post_info_res->setComment_count($v['at_comment_count']);

                //照片
                $at_photo = json_decode($v['at_photo'], true);
                foreach($at_photo as $key=>$val){
                    $fileobj = new XXProto_FileObject();
                    $fileobj->setID(1);
                    $fileobj->setUrl($obj->pic_dpre . $val['url']);
                    $thumb = $obj->pic_dpre . $val['url'];
                    if( $val['width'] > 240 ) $thumb = $obj->pic_dpre . str_replace(array('.png','.jpg','_t2'), array('_thumb.png','_thumb.jpg',''), $val['url']);
                    $fileobj->setThumbnail_url( $thumb );
                    if($val['width']) $fileobj->setImage_width($val['width']);
                    if($val['height']) $fileobj->setImage_height($val['height']);
                    $activity_post_info_res->appendPhoto($fileobj);
                }
                //是否点赞
                $u_dinfo = $obj->checkUserATDianzan($uin, $v['id'], $v['at_ex']);
                if($u_dinfo){
                    $activity_post_info_res->setHas_zan(1);
                }else{
                    $activity_post_info_res->setHas_zan(0);
                }

                $post_list_res->appendActivity_post_info_list($activity_post_info_res);
            }
            $res_XXBBSActivityProto->setPost_list_res($post_list_res);
        }
    }
    //获取评论列表
    elseif($subcmd == XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_COMMENTLISTREQ)
    {
        $res_XXBBSActivityProto->setSubcmd(XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_COMMENTLISTRES);

        $XxBBSActivityCommentListReq = $XxBBSActivityProto->getComment_list_req();

        $comment_list_res = new XXProto_XXBBSActivityCommentListRes();

        $afid = $XxBBSActivityCommentListReq->getAfid();
        $atid = $XxBBSActivityCommentListReq->getAtid();
        $begin_timestamp = $XxBBSActivityCommentListReq->getBegin_timestamp();
        $count = $XxBBSActivityCommentListReq->getCount();

        $c_list = $obj->getATCommentList($atid, '', '', $count, $begin_timestamp);

        if($c_list){
            foreach($c_list as $k => $v){
                $comment_info_res = new XXProto_XXBBSCommentInfo();

                $comment_info_res->setContent($v['atc_content']);
                $comment_info_res->setCreate_time($v['atc_addtime']);
                $comment_info_res->setCid($v['id']);
                $comment_info_res->setTid($v['atid']);
                $comment_info_res->setFid($v['afid']);

                //作者
                $userinfo_res = new XXProto_UserRoleInfo();
                $userinfo_res->setUin($v['atc_create_uin']);
                $uinfo = $user_obj->getUser('',$v['atc_create_uin']);//获取作者信息
                if($uinfo){
                    if($uinfo['unickname']){
                        $userinfo_res->setNick_name( $uinfo['unickname'] );	
                    }
                    if($uinfo['uico']){
                        $small_head_url = $user_obj->uico_dpre . str_replace( '/u', '/small_u', $uinfo['uico'] );
                        $userinfo_res->setHead_url( $small_head_url );					
                        $userinfo_res->setBig_head_url( $user_obj->uico_dpre . $uinfo['uico'] );
                    }
                }
                $comment_info_res->setRole_info($userinfo_res); //活动创建者

                if( $v['atc_target_cid'] ){
                    //这是一个被评论的评论
                    $XXBBSCommentTargetInfo = new XXProto_XXBBSCommentTargetInfo();
                    $XXBBSCommentTargetInfo->setTarget_cid($v['atc_target_cid']);
                    $target_cinfo = $obj->getATCommentList( $v['atid'], "AND id='{$v['atc_target_cid']}'", '', 1 );
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
                                $userinfo_res->setBig_head_url( $user_obj->uico_dpre . $target_uinfo['uico'] );
                            }
                            $XXBBSCommentTargetInfo->setRole_info($userinfo_res);
                        }
                    }
                    $comment_info_res->setTarget_info($XXBBSCommentTargetInfo);
                }

                $comment_list_res->appendComment_info_list($comment_info_res);
            }

        }

        $res_XXBBSActivityProto->setComment_list_res($comment_list_res);

    }
    //获取我的活动照片列表(协议已删除)
/*	elseif($subcmd == XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_MYPOSTLISTREQ)
    {
        $res_XXBBSActivityProto->setSubcmd(XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_MYPOSTLISTRES);

        $uin = $head->getUin(); 
        $XxBBSActivityPostListReq = $XxBBSActivityProto->getMy_post_list_req();
        $begin_timestamp = $XxBBSActivityPostListReq->getBegin_timestamp();
        $count = $XxBBSActivityPostListReq->getCount();
        $direction = $XxBBSActivityPostListReq->getDirection();

        $MyATPostList_res = new XXProto_XXBBSActivityMyPostListRes();
        //获取我的活动照片
        $atinfos = $obj->getMyATPhoto($uin, $begin_timestamp, $direction, $count);
        if($atinfos){
            $purl_dir = $obj->pic_dpre;	 
            foreach($atinfos as $atinfo){
                $photo_id = 1;
                $XXBBSActivityPostInfo_res = new XXProto_XXBBSActivityPostInfo();
                $XXBBSActivityPostInfo_res->setAtid($atinfo['id']);
                $XXBBSActivityPostInfo_res->setAfid($atinfo['afid']);
                $XXBBSActivityPostInfo_res->setCreate_time($atinfo['at_addtime']);
                $photos = json_decode($atinfo['at_photo'], true);
                foreach($photos as $pics){
                    $FileObject_res = new XXProto_FileObject();
                    $FileObject_res->setID($photo_id);
                    $FileObject_res->setUrl($purl_dir.$pics);
                    $XXBBSActivityPostInfo_res->appendPhoto($FileObject_res);
                    $photo_id += 1;
                }
                $MyATPostList_res->appendActivity_post_info_list($XXBBSActivityPostInfo_res);
            }
        }
        $res_XXBBSActivityProto->setMy_post_list_res($MyATPostList_res);
    }
 */    
    elseif($subcmd == XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_DIANZANREQ){
        $res_XXBBSActivityProto->setSubcmd(XXProto_XXBBSActivityProto_SUBCMD::SUBCMD_XXBBSActivityProto_DIANZANRES);

        $aDianZan = array();
        $aDianZan['uin'] = $head->getUin();
        $XxBBSActivityPostDianzanReq = $XxBBSActivityProto->getDianzan_req();
        $aDianZan['afid'] = $XxBBSActivityPostDianzanReq->getAfid();
        $aDianZan['atid'] = $XxBBSActivityPostDianzanReq->getAtid();
        $edit_type = $XxBBSActivityPostDianzanReq->getEdit_type();

        //活动时间过期，不让点赞
        $ainfo = $obj->getAinfo($aDianZan['afid'], '');
        if( $ainfo && $ainfo[0]['a_starttime'] < time() && $ainfo[0]['a_endtime'] > time() ){
            if($edit_type == XXProto_XXBBSEditType::XXBBSEditType_None){
                //do nothing
            }
            elseif($edit_type == XXProto_XXBBSEditType::XXBBSEditType_New){//新
                if( !$obj->addATDianzan($aDianZan)){
                    $res_XXBBSActivityProto->setResult(1999);
                }
            }
            elseif($edit_type == XXProto_XXBBSEditType::XXBBSEditType_Remove){//删
                $aDianZan['status'] = 0;
                if(!$obj->updateATDianzan($aDianZan)){
                    $res_XXBBSActivityProto->setResult(1999);
                }
            }else{//出错
                $res_XXBBSActivityProto->setResult(1999);
            }
        }else{
            $res_XXBBSActivityProto->setResult(1999);// DB_Error
        }

    }
    else
    {
        $response->setResult(1004);//    XXUnityCS_Err_Unknown_CMD = 1004;//未知命令字
        sendProtobufResponse($response);
        exit();
    }

    //回包
    $response->setBody($res_XXBBSActivityProto->serializeToString());
    sendProtobufResponse($response);
    exit();

}
else
{
    $response->setResult(1004);//    XXUnityCS_Err_Unknown_CMD = 1004;//未知命令字
    sendProtobufResponse($response);
    exit();
}
//if($_SERVER['REMOTE_ADDR']=='14.23.164.59') @file_put_contents( "/tmp/error.log", date('Y-m-d H:i:s').json_encode($atcinfo)."\t test \t{$obj->db->sql}\n", FILE_APPEND );
?>
