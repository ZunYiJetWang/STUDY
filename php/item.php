
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="../css/useMyCss.css" rel="stylesheet" type="text/css">
    <link href="../css/pinglun.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../jqury/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="../js/pinglun.js"></script>

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
        <div class="video-page clearFix">
            <div class="video-page-left left">
                <?php
                $conn = @mysql_connect("localhost","wang","wang");
                if (!$conn){
                    die("连接数据库失败：" . mysql_error());
                }
                @mysql_select_db("study", $conn);
                //字符转换，读库
               /* $program_char = " utf8 ";
                mysql_set_charset( $program_char , $conn );*/
                //字符转换，读库
                @mysql_query("set character set 'utf8'");
                //写库
                @mysql_query("set names 'utf8'");
                if(isset($_GET['id'])){
                    $id=$_GET['id'];
                }else{
                    $id=1;
                }
                #echo $id;
                $sql=" select * from videoitem  where id=$id";
                $result=mysql_query($sql);
                $row=@mysql_fetch_array($result);
                ?>
                <div class="clearFix">
                    <h4 class="left"><?php echo $row['videoname']; ?></h4>
                </div><!--简介-->
                <div class="detail-img">
                    <img width="600" alt="" src="<?php echo $row['imgpath'];?>">
                </div><!--img -->
                <div class="detail-desc">
                    <div class="detail-desc-top">
                    </div>
                    <div class="detail-desc-content">
                        <div class="voide-intro">
                            <span id="jianjie">视频简介：</span>
                            <div class="desc-content">
                               <?php echo $row['briefintroduction'];?>
                            </div>
                        </div>
                        <div style="margin-top: 10px"><span>视频观看地址:</span><a href="<?php echo $row['videourl'];?>" target="_blank" style="text-decoration: none;margin-left: 10px;color: cornflowerblue;">请点击</a> </div>
                        <hr style="border:1px dashed #cccccc; margin-bottom: 40px;margin-top:10px" width="100%" size="1" />


                        <?php
                        $sqlComment="select count(*) from comments where idnumber=$id ";
                        @mysql_query("set character set 'utf8'");
                        //写库
                        @mysql_query("set names 'utf8'");
                        $resultComment=mysql_query($sqlComment);
                        $rowComment=mysql_fetch_array($resultComment);
                        ?>
                        <div class="'morecomment">
                            <?php if($rowComment[0]>0){?>
                            <div class="morecomment-tittle">
                                <span>评论</span>
                            </div>
                            <?php
                                $sqlCommentAll="select * from comments where idnumber=$id order by datatime asc";
                                $resultRowCommentAll=mysql_query($sqlCommentAll);
                                $count=0;
                                while($rowCommentAll=mysql_fetch_array($resultRowCommentAll)){
                                    $count++;
                                ?>
                            <div class="comments">
                                <div class="comment">
                                    <div class="comment-tittle">
                                        <span>#<?php echo $count;?>楼</span>
                                    </div>
                                    <div class="comment-content">
                                        <div class="comment-body" style="word-wrap: break-word;"><?php echo $rowCommentAll['content']?></div>
                                        <div class="comment-vote">
                                            <span><a id="support".<?php echo $count;?> href="javascript:void(0)" onclick="return false;">支持<input id="alterNumber" type="hidden" value="<?php echo $rowCommentAll['flags'];?>"></a>(<?php echo $rowCommentAll['support'];?>）</span>

                                            <span><a id="opposition".<?php echo $count;?> href="javascript:void(0)" onclick="return false;">反对<input id="alterNumber1" type="hidden" value="<?php echo $rowCommentAll['flags'];?>"></a>(<?php echo $rowCommentAll['opposition'];?>)</span>
                                        </div>
                                    </div>
                                    <div class="comment-footer">
                                        <span class="vote-name"><?php echo $rowCommentAll['commentname'];?></span>
                                        <span>评论于</span>
                                        <span class="comment-date"><?php echo $rowCommentAll['datatime'];?></span>
                                    </div>
                                </div>
                            </div><!--comment-->
                                <?php }?>
                            <hr style="border:1px dashed #cccccc; margin-bottom: 40px;margin-top:10px" width="100%" size="1" />
                            <?php }?>

                            <div id="comment-form-container">
                                <div id="comment-from-tittle">
                                    <img src="../image/pinglun.gif" style="padding-right: 5px">发表评论
                                </div>
                                <p id="nichen">昵称：<span class="comment-author" id="comment-author">
                                        <?php if(isset($_SESSION['username'])){
                                            echo $_SESSION['username'];
                                        }else{
                                            echo "游客";
                                        }?>
                                    </span></p>
                                <div class="comment-form-container">
                                    <textarea id="comment-textarea">请填写评论.....</textarea>
                                </div>
                                <div class="btn-comment-submit">
                                      <input id="btn-comment-submit" type="button" disabled="true" value="提交评论">
                                      <input id="btn-id" type="hidden" value="<?php echo $id;?>" >

                                </div>
                            </div>
                        </div><!--all-->


                        <!--start of baidu share-->

                        <div class="bdsharebuttonbox right">
                            <a href="#" class="bds_more" data-cmd="more"></a>
                            <a href="#" class="bds_qzone" data-cmd="qzone"></a>
                            <a href="#" class="bds_tsina" data-cmd="tsina"></a>
                            <a href="#" class="bds_tqq" data-cmd="tqq"></a>
                            <a href="#" class="bds_renren" data-cmd="renren"></a>
                            <a href="#" class="bds_weixin" data-cmd="weixin"></a>
                        </div>
                        <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
                        <!--end of baidu share-->

                    </div>
                </div>
            </div><!--left of page-->
            <div class="video-page-right left">
                <div class="about-cat-title">
                    <h6>相关的推荐学习</h6>
                </div>
                <div class="about-cat clearFix">
                    <?php
                    $sqlCat=" select * from videoitem  where id !=$id   ORDER BY rand() LIMIT 6";
                    #随机的选取五条记录进行查询
                    $resultCat=mysql_query($sqlCat);
                    while($rowCat=@mysql_fetch_array($resultCat)){
                        ?>
                    <div class="about-cat-item left">
                        <a href="<?php echo $rowCat['url']?>" target="_blank">
                            <img width="140px" src="<?php echo $rowCat['imgpath'];?>">
                            <p><?php echo $rowCat['videoname']?></p>
                        </a>
                    </div><!--一个推荐而已-->
                    <?php }?>
                </div>

            </div><!--ri=ght of  page-->
        </div><!--void-page-->

    </div><!--container-->
</div><!--wrap  -->

<footer id="footer">
    <p class="copyRight">Copyright 2015 HDU　Multimedia Technology Design</p>
    <p class="author">违法信息举报、侵权投诉、使用问题，意见建议.请联系QQ:983433479</p>
    <p class="intro">本站所有内容均来自互联网,不可用于商业传播</p>

</footer>

</body>
</html>

