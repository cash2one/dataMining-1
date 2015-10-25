<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<body>
<?php

error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
date_default_timezone_set('Asia/Shanghai');
define('EOL',(PHP_SAPI == 'cli') ? PHP_EOL : '<br />');

include "Classes/PHPExcel/Writer/IWriter.php";
require_once 'Classes/PHPExcel/Writer/Abstract.php';
//include "PHPExcel/Classes/phpExcel/Writer/Excel5.php";//用于低版本excel
require_once 'Classes/PHPExcel/Writer/Excel2007.php';//用于2007excel
require_once 'Classes/PHPExcel.php';
//include 'PHPExcel/Classes/phpExcel/IOFactory.php';
 
// Create new PHPExcel object 
echo date('H:i:s') . " Create new PHPExcel object\n"; 
$objPHPExcel = new PHPExcel(); 
 
// Set properties 
echo date('H:i:s') . " Set properties\n"; 
$objPHPExcel->getProperties()->setCreator("Maarten Balliauw"); 
$objPHPExcel->getProperties()->setLastModifiedBy("Maarten Balliauw"); 
$objPHPExcel->getProperties()->setTitle("Office 2007 XLSX Test Document"); 
$objPHPExcel->getProperties()->setSubject("Office 2007 XLSX Test Document"); 
//$objPHPExcel->getProperties()->setDescrīption("Test document for Office 2007 XLSX, generated using PHP classes."); 
$objPHPExcel->getProperties()->setKeywords("office 2007 openxml php"); 
$objPHPExcel->getProperties()->setCategory("Test result file"); 
 
// Add some data 
echo date('H:i:s') . " Add some data\n"; 
$con = mysql_connect("localhost","root","ruige");
mysql_select_db("PHPExcel");
$sql = "select * from field ";
$query = mysql_query($sql);
//$dataShow = mysql_fetch_array($query);
//print_r($dataShow);

$objPHPExcel->setActiveSheetIndex(0); 
$objPHPExcel->getActiveSheet()->setCellValue('A1', 'ID'); 
$objPHPExcel->getActiveSheet()->setCellValue('B1', '目录'); 
$objPHPExcel->getActiveSheet()->setCellValue('C1', '父目录'); 
$i = 2; 
while($data =mysql_fetch_array($query)){ 
    $objPHPExcel->getActiveSheet()->setCellValue('A' . $i, $data['id']); 
    $objPHPExcel->getActiveSheet()->setCellValue('B' . $i, $data['value']); 
    $objPHPExcel->getActiveSheet()->setCellValue('C' . $i, $data['parent_id']); 
    $i ++; 
}

// Rename sheet 
echo date('H:i:s') . " Rename sheet\n"; 
$objPHPExcel->getActiveSheet()->setTitle('Simple'); 
 
// Set active sheet index to the first sheet, so Excel opens this as the first sheet 
$objPHPExcel->setActiveSheetIndex(0); 
 
// Save Excel 2007 file 
echo date('H:i:s') ."Write to Excel2007 format\n"; 
$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel); 
$objWriter->save(str_replace('.php', '.xlsx', __FILE__)); 

// Echo done 
echo date('H:i:s') . " Done writing file.\r\n";  
?>
</body>
</html>
