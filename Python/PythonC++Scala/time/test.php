<?php
function connectSql($host,$userName,$paswd,$db){
$conn = mssql_connect('$host','$userName','$paswd','$db');
if ($conn == true){
        return true;
}
else{
return false;
}
}
function checkVip($name,$phone,$cardNumber){
connectSql('','','','');
$sql = "select * from tb_membernew where membername = $name and phone = $phone and cardNumber = $cardNumber";
    $query = mssql_query($sql);
    if (!empty($query)){
     return true;
    }
    else{
     return false;
    }
}
function houseInfo($name,$phone,$cardNumber){
connectSql('','','','');
$sql = "select * from tb_membernew,tb_csthouseinfo where tb_numbernew.id = tb_csthouseinfo.fk_member =$id";
if (checkVip($name,$phone,$cardNumber) == true){
    $query = mssql_query($sql);
    return $query;
} 
}
?>