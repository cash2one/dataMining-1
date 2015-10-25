<?php
/*
会员验证函数需要和数据库对接，包括3个字段MemberName,CardNumber,电话号码有四个字段，
PhoneNumber1,PhoneNumber2,OfficeTel,FalmilyTel有一个电话匹配即可，
此三条信息匹配就判定为会员;
*/
$serverName = 'egServer70';
$conn = mssql_connect($serverName,'weixin','weixin,0');
mssql_select_db("arvato_Member_Stage2");
/*if ($conn){
	echo "ok";
}
else{
	echo "fail";
}*/
/*$sql1 = "select top 5 MemberName,CardNumber,PhoneNumber1,PhoneNumber2,officeTel,FamilyTel from tb_membernew";
$memberInfo = mssql_query($sql1);
$memberArray = array();
while ($results = mssql_fetch_array($memberInfo)){
    echo $results['MemberName'];
    echo '<br />';
    echo $results['CardNumber'];
    $memberArray[] = $results;
}
var_dump ($memberArray);*/
$sql2 = "create table if not exits memberInfo('MemberName' char(20),'CardNumber' char(20),'PhoneNumber' char(20))";
function checkVip($MemberName,$CardNumber,$PhoneNumber){
	$sql = "select $MemberName,$CardNumber,$PhoneNumber from tb_membernew";
	$sql = "insert values($memberName,$CardNumber,$PhoneNumber)into memberInfo ";
    $count = $mssql_query($sql);
    if (!empty($count)){
    	return True;
    }
    else{
    	return False;
    }
}
?>
