<?php
/**
 * Created by PhpStorm.
 * User: JetWang
 * Date: 2015/12/7
 * Time: 14:55
 */
session_start();
if(isset($_SESSION[username])){
    unset($_SESSION[username]);
    header("location:../index.php");
    session_encode();
    exit;
}
?>