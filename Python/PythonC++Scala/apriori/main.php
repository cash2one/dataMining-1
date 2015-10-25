<html>
<head>
    <center>
    <h1><B>华南理工大学大数据中心</B></h1>
    <hr></hr>
    <h3>关联规则算法演示案例</h3>
    </center>
	<meta charset='utf-8'>
    <style type="text/css">
    .table{
        border: 1px solid #ccc;
        border-spacing: 0;
    }
    .table td{
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        padding: 8px;
    }
    </style>
</head>
<body bgcolor="">
<center>	
<?php
$link=mysql_connect("localhost","root","")or die("不能连接！".mysql_error());
$db_selected=mysql_select_db("test",$link);
mysql_query("set names gb2312");
$sql=mysql_query("select * from ap",$link);
$rows=array();
while($row=mysql_fetch_object($sql))
{
$rows[] = $row;
}
?>
<form name="from1" method="get" action="change.php">
输入支持度:<input name="user1" type="text" >输入置信度:<input name="user2" type="text">
<button name="submit" >确认</button>
<br>
<caption>原始数据集展示</caption>
<div>该数据集有8124条记录,没一条记录都是一次购物事件,每一条购物事件都由<br>
    若干个商品编号组成,该案例是通过实现apriori算法，挖掘频繁项集，以及强规则的一个过程</div>

<table class="table">
    <tr>
        <th>购物序号</th>
        <th>购物项集</th>
    </tr>    
    <tbody>
        <?php foreach ($rows as $row) { ?>
            <tr>
                <td><?=$row->id?></td>
                <td><?=$row->buy?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>
</form>
</center> 
</body>
</html>
