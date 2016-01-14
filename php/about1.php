<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="../css/about.css" rel="stylesheet" type="text/css" />
    <link href="../css/useMyCss.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../jqury/jquery-1.9.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        #allmap{width:100%;height:500px;width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        p{margin-left:5px; font-size:14px;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=7LECEHZXvYoGQhSGGNgUL19G"></script>

</head>
<body>
<div class="header">
    <div class="header-top">
        <div class="container clearFix">
            <div class="topBarLeft left">
                <span class="welcome left">欢迎访问本网站</span>
            </div><!--topbar-left-->
            <div class="topBarRight right">
                <ul class="right">
                    <?php
                    session_start();
                    if(isset($_SESSION['username'])){
                        echo " <li id=\"login-link\">";
                    echo  "<p>用户:$_SESSION[username]在线</p>";
                    echo "</li>";
                    echo "<li>";
                    echo " <a href=\"../php/mysqluse/logoff.php\">注销</a>";
                    echo "</li>";
                    }
                    else{
                    echo " <li id=\"login-link\">";
                    echo  " <a href=\"../html/signin.html\">登录</a>";
                    echo "</li>";
                    echo "<li>";
                    echo " <a href=\"../html/sigup.html\">注册</a>";
                    echo "</li>";
                    }
                    ?>
                </ul>
            </div><!--div topbarright-->
        </div><!--div container-->
    </div><!-- head-top-->

</div><!--头部节点的使用-->
<nav class="top-nav clearFix" style="padding-bottom: 10px">
    <div class="container nav clearFix"><!--container--width 980-->
        <ul>
            <li><a href="index.php">首页</a></li>
            <li><a href="index.php?type=android">Android</a></li>
            <li><a href="index.php?type=java">Java</a></li>
            <li><a href="index.php?type=php">PHP</a></li>
            <li><a href="index.php?type=jsp">JSP</a></li>
            <li><a href="index.php?type=python">Python</a></li>
            <li><a href="index.php?type=c">C</a></li>
            <li><a href="index.php?type=c++">C++</a></li>
            <li><a href="index.php?type=ios">IOS</a></li>
            <li><a href="index.php?type=mysql">MySql</a></li>
            <li><a href="index.php?type=ps">Ps</a></li>
            <li><a href="index.php?type=linux">Linux</a></li>
            <li><a href="about.php">联系我们</a></li>
        </ul>
    </div>
</nav><!--顶部的导航才当-->

<div id="allmap" style="width: 970px;height: 500px; margin:0 auto;border: dashed 1px #aaaaaa "></div>

<footer id="footer">
    <p class="copyRight">Copyright 2015 HDU　Multimedia Technology Design</p>
    <p class="author">违法信息举报、侵权投诉、使用问题，意见建议.请联系QQ:983433479</p>
    <p class="intro">本站所有内容均来自互联网,不可用于商业传播</p>
</footer>
</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    var sContent =
        "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>地址:浙江省杭州市江干区杭州电子科技大学</h4>" +
        "计算机学院（2013级计算机科学与技术1班）<br/>"+
        "电话：18969050047<br/>"+
        " 电子邮箱：18969050047@163.com<br/>"+
        " 如果您觉得可以：<br/>"+
        "您可以选择赞助我们，帮助我们更好发展！<br/>"+
        "<a href=\'https://custweb.alipay.com\' title=\'点此赞助我们\' target=\'_blank\'> " +
        "<img src=\'https://img.alipay.com/sys/personalprod/style/mc/btn-index.png\' width='158px' height='34px' padding='10px'></a>";


    var map = new BMap.Map("allmap");

    var point = new BMap.Point(120.34917,30.320139);
    var marker = new BMap.Marker(point);
    var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
    map.centerAndZoom(point, 18);

    map.addOverlay(marker);

    marker.addEventListener("click", function(){
        this.openInfoWindow(infoWindow);
        //图片加载完毕重绘infowindow
        document.getElementById('imgDemo').onload = function (){
            infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
        }
    });
</script>
