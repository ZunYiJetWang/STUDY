/**
 * Created by JetWang on 2015/12/12.
 */
$(document).ready(function(){

    $("#comment-textarea").focus(function(e) {
        if ($(this).val()=="请填写评论.....") {
            $("#comment-textarea").val(" ");
            return;
        }
    });
    $("#comment-textarea").change(function(){
        if($("#comment-textarea").val().trim()!=""&& $("#comment-textarea").val()!="请填写评论....."){
            var btn=document.getElementById("btn-comment-submit");
            btn.disabled="";
        }else{
            var btn=document.getElementById("btn-comment-submit");
            btn.disabled="true";
        }
    });
    $("#comment-textarea").focus(function(){

        if($("#comment-textarea").val().trim()==""|| $("#comment-textarea").val()!="请填写评论....."){
            var btn=document.getElementById("btn-comment-submit");
            btn.disabled="true";
        }else{
            var btn=document.getElementById("btn-comment-submit");
            btn.disabled="";
        }
    });
    $("#btn-comment-submit").bind("click",function(e){
        var data="text="+$("#comment-textarea").val()+"&"+"idnumber="+$("#btn-id").val()+"&"+"ninchen="+$("#comment-author")[0].firstChild.nodeValue;
        //alert(data);
        window.location.href="../php/comment.php?"+data;

       /* $.post("comment.php",data,function(e){
             alert("ok");
            window.location.href="../php/item.php?"+"id="+$("#btn-id").val();
        });*/


    });
    $("a[id^=\"support\"]").bind("click",function(e){
      //以前学习的时候还没有注意到这个问题，绑定多个事件的时候该怎么去处理这个问题？利用前缀非常的棒，不断的错误，收获get.......
       var data="id="+$("#btn-id").val()+"&type=1"+"&flag="+$(this).children("input:hidden").val();
       // alert(data);
        window.location.href="../php/dianzan.php?"+data;


    });
    $("a[id^=\"opposition\"]").bind("click",function(e){

        var data="id="+$("#btn-id").val()+"&type=2"+"&flag="+$(this).children("input:hidden").val();
       // alert(data);
        window.location.href="../php/dianzan.php?"+data;
    });



});





