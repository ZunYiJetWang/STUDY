<?php
/**
 * Created by PhpStorm.
 * User: JetWang
 * Date: 2015/12/13
 * Time: 21:42
 */
header("Content-type: text/html; charset=utf-8");
$conn = @mysql_connect("localhost","wang","wang");
@mysql_select_db("study", $conn);
@mysql_query("set character set 'utf8'");
@mysql_query("set names 'utf8'");
if (!$conn){
    die("连接数据库失败：" . mysql_error());
}
$flag=$_GET['flag'];
$id=$_GET['id'];
if($_GET['type']==1){
    $sql="select * from comments where flags=$flag";
    $result=mysql_query($sql);
    while($row=@mysql_fetch_array($result)){

        $count=$row['support']+1;
    }

    $sqlNew="update comments set support =$count where flags=$flag";
    if(mysql_query($sqlNew)){
        header("location:item.php?id=".$id);

    }else{
        header("location:item.php?id=".$id);
    }
    mysql_close($conn);

}else{
    $sql1="select * from comments where flags=$flag";
    $result1=mysql_query($sql1);
    while($row1=@mysql_fetch_array($result1)){
       // echo $row['support'];
         $count1=$row1['opposition'];
         $count1=$count1+1;
    }

    $sqlNew1="update comments set opposition =$count1 where flags=$flag";
    if(mysql_query($sqlNew1)){
       header("location:item.php?id=".$id);

    }else{
        header("location:item.php?id=".$id);
    }
    mysql_close($conn);
}
?>