<?php

include_once dirname(__FILE__) ."/XXTEA.php";

function getRequest()
{
    $key = "#%$*)&*M<><vance";
    $postData=file_get_contents("php://input");
    $postData = base64_decode($postData);
    $postData = xxtea_decrypt($postData, $key);
    
    return $postData;
}

function sendProtobufResponse($respose)
{
    $key = "#%$*)&*M<><vance";
    $retValue = $respose->serializeToString();
    $retValue = xxtea_encrypt($retValue, $key);
    echo base64_encode($retValue);
}

