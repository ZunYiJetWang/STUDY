<?php
/**
 * Created by PhpStorm.
 * User: JetWang
 * Date: 2015/12/7
 * Time: 13:54
 */
header("Content-type: text/html; charset=utf-8");
session_start();
$email=trim($_POST['email']);
$password=trim($_POST['password']);
#包含数据库连接的文件
$conn = @mysql_connect("localhost","wang","wang");
if (!$conn){
    die("连接数据库失败：" . mysql_error());
}
@mysql_select_db("study", $conn);
//字符转换，读库
@mysql_query("set character set 'gbk'");
//写库
@mysql_query("set names 'gbk'");

$sql="select username from user where email='$email' and  password='$password'";
$check=mysql_query($sql);
echo $check;
if($row=@mysql_fetch_array($check)){
    //登录成功
    $_SESSION['username']=$row['username'];
    header("location:../index.php");


}else{
    exit('登录失败！点击此处 <a href="javascript:history.back(-1);">返回</a> 重试');
}
session_encode();
?>



