<?php
/**
 * Created by PhpStorm.
 * User: JetWang
 * Date: 2015/12/6
 * Time: 22:26
 */
header("Content-type: text/html; charset=utf-8");
$username=trim($_POST['username']);
$email=trim($_POST['email']);
$password=trim($_POST['password']);
#包含数据库连接的文件
$conn = @mysql_connect("localhost","wang","wang");
if (!$conn){
    die("连接数据库失败：" . mysql_error());
}
@mysql_select_db("study", $conn);
//字符转换，读库
@mysql_query("set character set 'utf8'");
//写库
@mysql_query("set names 'utf8'");
$lookup="SELECT `email`, `username`, `password` FROM `user`
WHERE username ='$username' or email='$email'";
$result=mysql_query($lookup);
$row=@mysql_fetch_array($result);
if(!empty($row)){
    echo '错误：用户名 ',$username,' 已存在。<a href="javascript:history.back(-1);">返回</a>';
    exit;
}
else {
    $sql = "INSERT INTO  user (email,username,password) VALUES ('$email','$username','$password')";
    if (@mysql_query($sql, $conn)) {
        header("location:../../html/signin.html");

    } else {
        echo "抱歉！添加数据失败" . mysql_error(), '<br />';
        echo '点击此处 <a href="javascript:history.back(-1);">返回</a> 重试';
    }
}
mysql_close($conn);
?>