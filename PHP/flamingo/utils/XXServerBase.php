<?php

include_once dirname(dirname(__FILE__)) ."/apiutils/XXTEA.php";

if( isset($APPID) ){
    include_once dirname(dirname(__FILE__)) ."/include/gamesdk/{$APPID}.php";
}
else{
    $KEY = "#%$*)&*M<><vance";
}

function getRequest()
{
    global $KEY;
    $postData=file_get_contents("php://input");
    $postData = base64_decode($postData);
    $postData = xxtea_decrypt($postData, $KEY);
    
    return $postData;
}

function sendProtobufResponse($respose)
{
    global $KEY;
    $retValue = $respose->serializeToString();
    $retValue = xxtea_encrypt($retValue, $KEY);
    echo base64_encode($retValue);
}

