<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<body>
<form action="" method="post" enctype="multipart/form-data"> 
    <input type="hidden" name="leadExcel" value="true"> 
    <table align="center" width="90%" border="0">
      <tr>
         <td><input type="file" name="inputExcel" id="inputExcel" ><input type="submit" value="导入数据"></td>
      </tr>
    </table>
</form>
<?php
//include "PHPExcel/Classes/phpExcel/Writer/IWriter.php";
//include "PHPExcel/Classes/phpExcel/Writer/Excel5.php";
//require_once 'PHPExcel/Classes/phpExcel/Writer/Excel2007.php';
require_once 'PHPExcel/Classes/PHPExcel.php';
//include 'PHPExcel/Classes/phpExcel/IOFactory.php';
 
//设定缓存模式为经gzip压缩后存入cache（PHPExcel导入导出及大量数据导入缓存方式的修改 ） 
$cacheMethod = PHPExcel_CachedObjectStorageFactory::cache_in_memory_gzip; 
$cacheSettings = array(); 
PHPExcel_Settings::setCacheStorageMethod($cacheMethod,$cacheSettings); 
 
 $objPHPExcel = new PHPExcel();
 $con = mysql_connect("localhost","root","ruige");
 mysql_select_db('bms');
//读入上传文件
if($_POST){
    $objPHPExcel = PHPExcel_IOFactory::load($_FILES["inputExcel"]["tmp_name"]);
    //内容转换为数组 
    $indata = $objPHPExcel->getSheet(0)->toArray();
    print_r($indata );
    //excel  sheet个数
    //echo $objPHPExcel->getSheetCount();
   
    //把数据新增到mysql数据库中
    foreach($indata as $item){
        $sql = "insert into field(value,parent_id) values('$item[1]','$item[2]')";
        mysql_query($sql);
    }
}  
//查看是否导入成功
 $sql1="select * from field";
 $query = mysql_query($sql1);
 while($data = mysql_fetch_array($query)){
     echo $data['value'];
     }
?>
</body>
</html>
导出代码如下：
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<body>
<?php
include "PHPExcel/Classes/phpExcel/Writer/IWriter.php";
//include "PHPExcel/Classes/phpExcel/Writer/Excel5.php";//用于低版本excel
require_once 'PHPExcel/Classes/phpExcel/Writer/Excel2007.php';//用于2007excel
require_once 'PHPExcel/Classes/PHPExcel.php';
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


对phpexcel类的介绍：
创建一个excel

　　$objPHPExcel = new PHPExcel();

　　保存excel—2007格式

　　$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);

　　//或者$objWriter = new PHPExcel_Writer_Excel5($objPHPExcel); 非2007格式

　　$objWriter->save(”xxx.xlsx”);

　　直接输出到浏览器

　　$objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);

　　header(”Pragma: public”);

　　header(”Expires: 0″);

　　header(”Cache-Control:must-revalidate, post-check=0, pre-check=0″);

　　header(”Content-Type:application/force-download”);

　　header(”Content-Type:application/vnd.ms-execl”);

　　header(”Content-Type:application/octet-stream”);

　　header(”Content-Type:application/download”);;

　　header(’Content-Disposition:attachment;filename=”resume.xls”‘);

　　header(”Content-Transfer-Encoding:binary”);

　　$objWriter->save(’php://output’);

　　——————————————————————————————————————–

　　设置excel的属性：

　　创建人

　　$objPHPExcel->getProperties()->setCreator(”Maarten Balliauw”);

　　最后修改人

　　$objPHPExcel->getProperties()->setLastModifiedBy(”Maarten Balliauw”);

　　标题

　　$objPHPExcel->getProperties()->setTitle(”Office 2007 XLSX Test Document”);

　　题目

　　$objPHPExcel->getProperties()->setSubject(”Office 2007 XLSX Test Document”);

　　描述

　　$objPHPExcel->getProperties()->setDescription(”Test document for Office 2007 XLSX, generated using PHP classes.”);

　　关键字

　　$objPHPExcel->getProperties()->setKeywords(”office 2007 openxml php”);

　　种类

　　$objPHPExcel->getProperties()->setCategory(”Test result file”);

　　——————————————————————————————————————–

　　设置当前的sheet

　　$objPHPExcel->setActiveSheetIndex(0);

　　设置sheet的name

　　$objPHPExcel->getActiveSheet()->setTitle(’Simple’);

　　设置单元格的值

　　$objPHPExcel->getActiveSheet()->setCellValue(’A1′, ‘String’);

　　$objPHPExcel->getActiveSheet()->setCellValue(’A2′, 12);

　　$objPHPExcel->getActiveSheet()->setCellValue(’A3′, true);

　　$objPHPExcel->getActiveSheet()->setCellValue(’C5′, ‘=SUM(C2:C4)’);

　　$objPHPExcel->getActiveSheet()->setCellValue(’B8′, ‘=MIN(B2:C5)’);

　　合并单元格

　　$objPHPExcel->getActiveSheet()->mergeCells(’A18:E22′);

　　分离单元格

　　$objPHPExcel->getActiveSheet()->unmergeCells(’A28:B28′);

保护cell

　 　$objPHPExcel->getActiveSheet()->getProtection()->setSheet(true); // Needs to be set to true in order to enable any worksheet protection!

　　$objPHPExcel->getActiveSheet()->protectCells(’A3:E13′, ‘PHPExcel’);

　　设置格式

　　// Set cell number formats

　　echo date(’H:i:s’) . ” Set cell number formatsn”;

　　$objPHPExcel->getActiveSheet()->getStyle(’E4′ )->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_CURRENCY_EUR_SIMPLE);

　　$objPHPExcel->getActiveSheet()->duplicateStyle( $objPHPExcel->getActiveSheet()->getStyle(’E4′), ‘E5:E13′ );

　　设置宽width

　　// Set column widths

　　$objPHPExcel->getActiveSheet()->getColumnDimension(’B’)->setAutoSize(true);

　　$objPHPExcel->getActiveSheet()->getColumnDimension(’D’)->setWidth(12);

　　设置font

　　$objPHPExcel->getActiveSheet()->getStyle(’B1′)->getFont()->setName(’Candara’);

　　$objPHPExcel->getActiveSheet()->getStyle(’B1′)->getFont()->setSize(20);

　　$objPHPExcel->getActiveSheet()->getStyle(’B1′)->getFont()->setBold(true);

　　$objPHPExcel->getActiveSheet()->getStyle(’B1′)->getFont()->setUnderline(PHPExcel_Style_Font::UNDERLINE_SINGLE);

　　$objPHPExcel->getActiveSheet()->getStyle(’B1′ )->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_WHITE);

　　$objPHPExcel->getActiveSheet()->getStyle(’E1′ )->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_WHITE);

　　$objPHPExcel->getActiveSheet()->getStyle(’D13′)->getFont()->setBold(true);

　　$objPHPExcel->getActiveSheet()->getStyle(’E13′)->getFont()->setBold(true);

　　设置align

　　$objPHPExcel->getActiveSheet()->getStyle(’D11′ )->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);

　　$objPHPExcel->getActiveSheet()->getStyle(’D12′ )->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);

　　$objPHPExcel->getActiveSheet()->getStyle(’D13′ )->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);

　　$objPHPExcel->getActiveSheet()->getStyle(’A18′ )->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_JUSTIFY);

　　//垂直居中

　　$objPHPExcel->getActiveSheet()->getStyle(’A18′ )->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);

　　设置column的border

　　$objPHPExcel->getActiveSheet()->getStyle(’A4′ )->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

　　$objPHPExcel->getActiveSheet()->getStyle(’B4′ )->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

　　$objPHPExcel->getActiveSheet()->getStyle(’C4′ )->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

　　$objPHPExcel->getActiveSheet()->getStyle(’D4′ )->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

　　$objPHPExcel->getActiveSheet()->getStyle(’E4′ )->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

　　设置border的color

　　$objPHPExcel->getActiveSheet()->getStyle(’D13′)->getBorders()->getLeft()->getColor()->setARGB(’FF993300′);

　　$objPHPExcel->getActiveSheet()->getStyle(’D13′)->getBorders()->getTop()->getColor()->setARGB(’FF993300′);

　　$objPHPExcel->getActiveSheet()->getStyle(’D13′)->getBorders()->getBottom()->getColor()->setARGB(’FF993300′);

　　$objPHPExcel->getActiveSheet()->getStyle(’E13′)->getBorders()->getTop()->getColor()->setARGB(’FF993300′);

　　$objPHPExcel->getActiveSheet()->getStyle(’E13′)->getBorders()->getBottom()->getColor()->setARGB(’FF993300′);

　　$objPHPExcel->getActiveSheet()->getStyle(’E13′)->getBorders()->getRight()->getColor()->setARGB(’FF993300′);

　　设置填充颜色

　　$objPHPExcel->getActiveSheet()->getStyle(’A1′)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);

　　$objPHPExcel->getActiveSheet()->getStyle(’A1′)->getFill()->getStartColor()->setARGB(’FF808080′);

　　$objPHPExcel->getActiveSheet()->getStyle(’B1′)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);

　　$objPHPExcel->getActiveSheet()->getStyle(’B1′)->getFill()->getStartColor()->setARGB(’FF808080′);

　　加图片

　　$objDrawing = new PHPExcel_Worksheet_Drawing();

　　$objDrawing->setName(’Logo’);

　　$objDrawing->setDescription(’Logo’);

　　$objDrawing->setPath(’./images/officelogo.jpg’);

　　$objDrawing->setHeight(36);

　　$objDrawing->setWorksheet($objPHPExcel->getActiveSheet());

　　$objDrawing = new PHPExcel_Worksheet_Drawing();

　　$objDrawing->setName(’Paid’);

　　$objDrawing->setDescription(’Paid’);

　　$objDrawing->setPath(’./images/paid.png’);

　　$objDrawing->setCoordinates(’B15′);

　　$objDrawing->setOffsetX(110);

　　$objDrawing->setRotation(25);

　　$objDrawing->getShadow()->setVisible(true);

　　$objDrawing->getShadow()->setDirection(45);

　　$objDrawing->setWorksheet($objPHPExcel->getActiveSheet());

　　在默认sheet后，创建一个worksheet

　　echo date(’H:i:s’) . ” Create new Worksheet objectn”;

　　$objPHPExcel->createSheet();

　　$objWriter = PHPExcel_IOFactory::createWriter($objExcel, 'Excel5');

　　$objWriter-save('php://output');
