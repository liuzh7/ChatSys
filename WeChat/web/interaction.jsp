<%--
  Created by IntelliJ IDEA.
  User: Liu
  Date: 2018/9/3
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script>
    $(document).ready(function () {
        //自己的昵称
        var nickname = "风清扬"+Math.random();
        // alert(nickname);

        //建立一条与服务器之间的连接 ws://localhost:8080/app/websocket
        var socket = new WebSocket("ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/websocket");

        //接收服务器的消息
        socket.onmessage=function(ev){
            //String转JSON
            var obj = JSON.parse(ev.data);
            addMessage(obj);
        };

        //发送按钮被点击时
        $("#send").click(function(){
            if ($("#message").val()=='') {  // 判断消息输入框是否为空
                // 消息输入框获取焦点
                $("#message").focus();
                // 添加抖动效果
                $("#input").addClass('am-animation-shake');
                setTimeout("$('#input').removeClass('am-animation-shake')", 1000);
            } else {
                //获取输入框的内容
                var txt = $("#message").val();
                //构建一个标准格式的JSON对象
                var obj = JSON.stringify({
                    nickname:nickname,
                    content:txt
                });
                // 发送消息
                socket.send(obj);
                // 清空消息输入框
                $("#message").val('');
                // 消息输入框获取焦点
                $("#message").focus();
            }
        });
    });

    function addMessage(msg){
        var box = $("#msgtmp").clone(); 	//复制一份模板，取名为box
        box.removeClass("am-hide");        //设置box状态为显示
        // box.find("#pic").removeAttr("src");               	//删除原来的margin
        box.find("#pic").attr("src",(msg.isSelf? "assets/images/self.jpg":"assets/images/other.jpg"));  //换头像
        box.find("#nickname").html(msg.nickname); //在box中设置昵称
        box.find("#date").html(msg.date); 		//在box中设置时间
        box.find("#content").html(msg.content); 	//在box中设置内容
        box.addClass(msg.isSelf? 'am-comment-flip':'');	//右侧显示
        box.addClass(msg.isSelf? 'am-comment-warning':'am-comment-success');//颜色
        box.removeAttr("style");               	//删除原来的margin
        box.css((msg.isSelf? 'margin-left':'margin-right'),"20%");//外边距

        box.appendTo("#chatContent");		//把box追加到聊天面板中
        $("#chat-view").scrollTop(999999); 	//滚动条移动至最底部
    }

</script>
