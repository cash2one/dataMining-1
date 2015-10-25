<?php
$ereg = 'mr';
$str = 'hello,Mr,mr,MR';
$rep_str = eregi_replace($ereg,'MR',$str);
echo $rep_str;
$gap = ',';
$string = 'java,vb,vc,php';
$arr_str = spliti($gap,$string);
var_dump($arr_str);
print_r($arr_str);
?>
<?php
if (!isset($_COOKIE["visit_time"])){
	setcookie("visit_time",date("Y-m-d H:i:s"));
	echo "welcome to visit first time!";
}
else{
	setcookie("visit_time",date("Y-m-d H:i:s"),time()+180);
	echo "you before visit time is:".$_COOKIE["visit_time"]."<br />";
}
echo "you visit now the time is:".date("Y-m-d H:i:s")."<br />";
?>
<?php
session_start();
$arr = array(1,2,3,);
$string = "test";
if(empty($_SESSION[name])){
	$_SESSION[name] = $string;
	echo $_SESSION[name];
}
else{
	echo $_SESSION[name];
}
$_SESSION[arr] = $arr;
foreach ($_SESSION[arr] as $key => $value) {
	echo $value."<br />";
}
echo $_SESSION[arr];
?>