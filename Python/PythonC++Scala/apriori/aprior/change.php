<html>
<head>
    <meta charset="utf-8">
    <style type="text/css">
    .right{
        position: absolute;
        border-spacing: 0;
        margin-left: 100;
        margin-top: 0;
    }
    .left{
        position: absolute;
        border-spacing: 0;
        margin-left: 500;
        margin-top: 0;
    }
    .table{
        border: 1px solid #ccc;
    }
    .table td{
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        padding: 8px;
    }
    </style>
</head>
<body bgcolor="">    
<?php
$result='';
$mid1=$_GET["user1"];
$mid2=$_GET["user2"];
$link=mysql_connect("localhost","root","")or die("不能连接！".mysql_error());
$db_selected=mysql_select_db("test",$link);
//$sql3=mysql_query("create temporary table if not exists testap (item1 char(255),item2 char(255),conf char(255))");
//$sql4=mysql_query("create temporary table if not exists testapp(item1 char(100),supportData char(100))");
exec("python apriori.py '$mid1' '$mid2' ",$result);
//echo json_encode($result);
// mysql_query("set names gb2312");
$sql1=mysql_query("select * from testapp",$link);
$sql2=mysql_query("select * from testap",$link);
$rows1=array();
$rows2=array();
while($row=mysql_fetch_object($sql1))
{
    $rows1[]=$row;
}
while($row=mysql_fetch_object($sql2))
{
    $rows2[]=$row;
}
?>
<div class="right">
    <caption>频繁项集支持度大于<?php echo $mid1 ?>的数据展示</caption>
    <table class="table" margin-left="150px" type="">
        <tbody>
            <tr>
                <th>频繁项集</th>
                <th>支持度</th>
            </tr>    
            <?php foreach ($rows1 as $row) { ?>
                <tr>
                    <td><?=$row->item1?></td>
                    <td><?=$row->supportData?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</div>
<div class="left">
    <caption>置信度大于<?php echo $mid2 ?>的数据集展示</caption>
    <table class="table" >
        <tbody>
            <tr>
                <th>前项</th>
                <th></th>
                <th>后项</th>
                <th>置信度</th>
            </tr>    
            <?php foreach ($rows2 as $row) { ?>
                <tr>
                    <td><?=$row->item1?></td>
                    <td>--></td>
                    <td><?=$row->item2?></td>
                    <td><?=$row->conf?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</div>
</body>
</html>
<?php
// mysql_query("delete from testapp",$link);
// mysql_query("delete from testap",$link);
?>