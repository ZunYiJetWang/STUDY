<?php
/**
 * Created by PhpStorm.
 * User: JetWang
 * Date: 2015/12/12
 * Time: 12:16
 */
header("Content-type: text/html; charset=utf-8");

//写库

$text= $_GET["text"];
$ninchen= trim($_GET['ninchen']);
$id=$_GET['idnumber'];
$conn = @mysql_connect("localhost","wang","wang");
@mysql_select_db("study", $conn);
@mysql_query("set character set 'utf8'");
@mysql_query("set names 'utf8'");
if (!$conn){
    die("连接数据库失败：" . mysql_error());
}

echo $text.$id.$ninchen;

$sql="INSERT INTO comments (idnumber,
support,
opposition,
commentname,
content
)
VALUES ('$id',0,0,'$ninchen','$text'
)";
if(!@mysql_query($sql))
{
    header("location:javascript:history.back(-1)");
}else{
    header("location:item.php?id=".$id);
}
mysql_close($conn);
?>