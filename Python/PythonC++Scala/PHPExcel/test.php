<?php
echo "hello world";
echo "<br>";
$conn = mysql_connect('localhost','root','ruige');
if ($conn){
echo "mysql connect success";
}
else{
echo "fail";
}
phpinfo();
?>
