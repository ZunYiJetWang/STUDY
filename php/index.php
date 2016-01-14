
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线学习网站</title>
    <link href="../css/useMyCss.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../jqury/jquery-1.9.0.min.js"></script>
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
    <nav class="top-nav clearFix">
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
     <div class="wrap">
         <div class="container">
             <div class="listVideo">
                 <div class="listVideo-top">
                     <h5>最近更新</h5>
                 </div><!--topVideo-->
                 <div class="listVideo-wrap clearFix">
                     <?php
                     $conn = @mysql_connect("localhost","wang","wang");
                     if (!$conn){
                         die("连接数据库失败：" . mysql_error());
                     }
                     @mysql_select_db("study", $conn);
                     @mysql_query("set character set 'utf8'");
                     //写库
                     @mysql_query("set names 'utf8'");
                     if(isset($_GET['type'])){#设置了type属性的东西
                         $type=$_GET['type'];
                         $perNum=12;//每页的数量
                         $sqlGetCount="select count(*) from videoitem where type='$type'";
                         $getCount=mysql_query($sqlGetCount);
                         $rs=@mysql_fetch_array($getCount);
                         $totalNum=$rs[0];
                         $totalPage=ceil($totalNum/$perNum);#总的页数
                         if(isset($_GET['page'])){#是否设置我们的页数
                             $page=$_GET['page'];
                         }else{
                             $page=1;
                         }

                         $startCount=($page-1)*$perNum;#分页开始的计数；
                         #下面的是加载我们的视频的item的选项
                         $sql=" select * from videoitem  where type='$type'LIMIT $startCount,$perNum";
                         $result=mysql_query($sql);
                         while($row=@mysql_fetch_array($result)){
                             echo "<div class=\"videoItem left\">";
                             echo "   <div class=\"thumbNail\">";
                             echo " <a href=\"$row[url]\">";
                             echo " <img width=\"200px\"  alt=\"\" src=\"$row[imgpath]\">";
                             echo " </a>";
                             echo "</div>";
                             echo " <h5 class=\"video-tittle\">";
                             echo " <a href=\"$row[url]\" tittle=\"\">";
                             echo "$row[videoname]";
                             echo "</a>";
                             echo "</h5>";
                             echo "   <div class=\"info clearFix\">";
                             @$date=$row[date];
                             @$date=substr($date,0,10);
                             echo "$date";
                             #echo " <span class=\"addtime left\">$row[date]</span>";
                             echo "</div>";
                             echo "  </div><!--每一个基本的项目-->";
                         }
                         if($totalNum!=0) {
                             echo "<div class=\"page-center-top\">";
                             echo " <div class=\"center\">";
                             echo "<ul >";
                             echo "<li ><apan>共</apan><span>$totalNum</span><span>条</span></li>";
                             echo "<li ><apan>$page</apan><span>/</span><span>$totalPage</span></li>";
                             echo "<li><a href=\"index.php?type=$type\"><span>首页</span></a></li>";
                             if ($page > 1) {
                                 $beforePage = $page - 1;
                                 echo "<li><a href=\"index.php?page=$beforePage&type=$type\"><span>上一页</span></a></li>";
                             }
                             if ($page < $totalPage) {
                                 $nextPage = $page + 1;
                                 echo "<li ><a href=\"index.php?page=$nextPage&type=$type\"><span>下一页</span></a></li>";
                             }
                             if ($page != $totalPage) {
                                 echo "<li><a href=\"index.php?page=$totalPage&type=$type\"><span>尾页</span></a></li>";
                             }
                             echo " </ul>";
                             echo " </div>";
                             echo "</div><!--page-center-top-->";
                         }

                     }else{#这个是我们的首页
                         $perNum=12;//每页的数量
                         $sqlGetCount="select count(*) from videoitem";
                         $getCount=mysql_query($sqlGetCount);
                         $rs=@mysql_fetch_array($getCount);
                         $totalNum=$rs[0];
                         $totalPage=ceil($totalNum/$perNum);#总的页数、
                         if(!isset($_GET['page'])){#是否设置我们的页数
                             $page=1;
                         }else{
                             $page=$_GET['page'];
                         }
                         $startCount=($page-1)*$perNum;#分页开始的计数；
                         #下面的是加载我们的视频的item的选项
                         $sql=" select * from videoitem order by date LIMIT $startCount,$perNum ";
                         $result=mysql_query($sql);
                         while($row=@mysql_fetch_array($result)){
                             echo "<div class=\"videoItem left\">";
                             echo "   <div class=\"thumbNail\">";
                             echo " <a href=\"$row[url]\">";
                             echo " <img width=\"200px\" alt=\"\" src=\"$row[imgpath]\">";
                             echo " </a>";
                             echo "</div>";
                             echo " <h5 class=\"video-tittle\">";
                             echo " <a href=\"$row[url]\" tittle=\"\">";
                             echo "$row[videoname]";
                             echo "</a>";
                             echo "</h5>";
                             echo "   <div class=\"info clearFix\">";
                             @$date=$row[date];
                             @$date=substr($date,0,10);
                             echo " <span class=\"addtime left\">";
                             echo "$date";
                             echo " </span>";
                             echo "</div>";
                             echo "  </div><!--每一个基本的项目-->";
                         }
                         if($totalNum!=0){
                             echo "<div class=\"page-center-top\">";
                             echo " <div class=\"center\">";
                             echo "<ul >";
                             echo "<li ><apan>共</apan><span>$totalNum</span><span>条</span></li>";
                             echo "<li ><apan>$page</apan><span>/</span><span>$totalPage</span></li>";
                             echo "<li><a href=\"index.php\"><span>首页</span></a></li>";
                             if($page>1){
                                 $beforePage=$page-1;
                                 echo "<li><a href=\"index.php?page=$beforePage \"><span>上一页</span></a></li>";
                             }
                             if($page<$totalPage){
                                 $nextPage=$page+1;
                                 echo "<li ><a href=\"index.php?page=$nextPage \"><span>下一页</span></a></li>";
                             }
                             if($page!=$totalPage){
                                 echo "<li><a href=\"index.php?page=$totalPage \"><span>尾页</span></a></li>";
                             }
                             echo " </ul>";
                             echo " </div>";
                             echo "</div><!--page-center-top-->";
                         }

                     }
                     mysql_close($conn);
                     ?>

                 </div><!--listvideo-->
             </div><!--我们的list-->
         </div><!--我们的一般的宽度的设置-->
     </div><!--wrap 我们的整个图片-->

     <footer id="footer">
         <p class="copyRight">Copyright 2015 HDU　Multimedia Technology Design</p>
         <p class="author">违法信息举报、侵权投诉、使用问题，意见建议.请联系QQ:983433479</p>
         <p class="intro">本站所有内容均来自互联网,不可用于商业传播</p>
     </footer>
  .

</body>
</html>
