<?php
/**
 * Created by PhpStorm.
 * User: h4x
 * Date: 13-11-12
 * Time: 下午4:49
 */

include_once "protocols/XXGameAssistant.proto.php";
include_once "protocols/XXPBBase.proto.php";


function getProtoImage($imgInfo)
{
    $img = new XXProto_FileObject();
    if( $imgInfo['ID']=='' ) return false;
    $img->setID($imgInfo["ID"]);
    $img->setUrl($imgInfo["url"]);
    $img->setFileType($imgInfo["fileType"]);
    $img->setSize(0);
    $img->setChecksum("");
    return $img;
}

function dbPrefixByUserInfo($userInfo)
{
    $platform = $userInfo->getPlatformType();

    if($platform == XXProto_PlatformType::PT_iOS)
        return "ios";
    else if($platform == XXProto_PlatformType::PT_Android)
        return "android";
    else
        return "";
}

function getFileObject($file)
{
    $fileObj = new XXProto_FileObject();
    if( $file['ID']=='' ) return false;
    $fileObj->setID($file["ID"]);
    $fileObj->setUrl($file["url"]);
    $fileObj->setFileType($file["fileType"]);
    $fileObj->setSize($file["size"]);
    $fileObj->setChecksum($file["checksum"]);
    return $fileObj;
}

function fillSoftwareObject($list, $softwareType, $appendFunc)
{
    foreach($list as $obj)
    {
        $soft = new XXProto_SoftwareObject();
        $soft->clearPictures();
        //$soft->clearPackageFile();
        {
            $soft->setUID($obj["UID"]);

            $base = new XXProto_SoftwareBaseInfo();
            {
                $baseObj = $obj["sbInfo"];
                $base->setName($baseObj["name"]);
                $base->setVersion($baseObj["version"]);
                $base->setPackageName($baseObj["packageName"]);

                $file = getFileObject($baseObj["packageFile"]);
                if( $file ){
                    $base->setPackageFile($file);
                }

                $base->setUpdateTime($baseObj["updateTime"]);
                $base->setSupportMin($baseObj["supportMin"]);
                $base->setSupportSys($baseObj["supportSys"]);
                $base->setLanguage($baseObj["language"]);
            }
            $soft->setSbInfo($base);

            $soft->setSoftwareType($softwareType);
            $soft->setDescription($obj["description"]);
            $soft->setUpdateDetails($obj["updateDetails"]);
            if( getProtoImage($obj["thumbnail"]) ){
                $soft->setThumbnail(getProtoImage($obj["thumbnail"]));
            }

            if(is_array($obj["pictures"]))
            {
                foreach($obj["pictures"] as $imgInfo){
                    if( getProtoImage($imgInfo) ){
                        $soft->appendPictures(getProtoImage($imgInfo));
                    }
                }
            }

            $soft->setDownloadCount($obj["downloadCount"]);
            if( $softwareType==101 ){ // game 评分字段
                $soft->setSuggestScore($obj["suggestScore"]);
            }
            if( $obj['type']!='' ){ // game 分类
                $soft->setGame_category($obj["type"]);
            }
        }
//
//        var_dump($soft);
//        print("----------<br />");
        //$response->appendSoftwareObjects($soft);
        $appendFunc($soft);
    }
}

function fillXxDataObject($list, $appendFunc)
{
    foreach($list as $obj)
    {
        $xxSoftdata = new XXProto_XXSoftDataV2();
        {
            $xxSoftdata->setUIDPackageName($obj['UIDPackageName']);
            if( $obj['commentsUrl'] ){
                $xxSoftdata->setCommentsUrl($obj['commentsUrl']);
            }
            if( $obj['xxCircleUrl'] ){
                $xxSoftdata->setxxCircleUrl($obj['xxCircleUrl']);
            }
            if( $obj['instructionUrl'] ){
                $xxSoftdata->setInstructionUrl($obj['instructionUrl']);
            }
            $xxSoftdata->clearGameObject();
            $xxSoftdata->clearAssistObject();

            // game object
            if( $obj['game'] ){
                $appendFuncGame = function($obj) use(&$xxSoftdata) { $xxSoftdata->setGameObject($obj); };
                fillSoftwareObject( array($obj['game']), 101, $appendFuncGame );
            }
            // assist object
            if( $obj['assist'] ){
                $appendFuncAssist = function($obj) use(&$xxSoftdata) { $xxSoftdata->setAssistObject($obj); };
                fillSoftwareObject( array($obj['assist']), 102, $appendFuncAssist );
            }
        }
        //
        $appendFunc($xxSoftdata);
    }
}

function fillXxSimpleMessageObject($list, $appendFunc)
{
    foreach($list as $obj)
    {
        $xxMsg = new XXProto_XXSimpleMessageObject();
        {
            $xxMsg->setMessage($obj['message']);
            $xxMsg->setUsername($obj['username']);
        }
        //
        $appendFunc($xxMsg);
    }
}

function fillAssistMap($list, $appendFunc)
{
    foreach($list as $obj)
    {
        $map = new XXProto_GameAssistMap();
        $map->setPackageName($obj["packageName"]);
        $map->setAssistType($obj["assistType"]);
        //print("type: " . $map->getAssistType() . "; \n");
        $map->setAssistUID($obj["assistUID"]);

        $appendFunc($map);
    }
}

function foreachSoftwareObjectPackage($array, $func)
{
    foreach($array as $obj)
    {
        $sb = $obj->getSbInfo();
        $uid = $obj->getUID();
        $pkg = $sb->getPackageName();
        $ver = $sb->getVersion();
        $name = $sb->getName();
        $func($pkg, $ver, $uid, $name);
    }
}


function foreachSoftwareObjectID($array, $func)
{
    foreach($array as $obj)
    {
        $id = $obj->getUID();
        $sb = $obj->getSbInfo();
        $ver = $sb->getVersion();
        $func($id, $ver);
    }
}

function hasNewVersion($clientVersion, $serverVersion)
{
    return (version_compare($clientVersion, $serverVersion) < 0);
}
