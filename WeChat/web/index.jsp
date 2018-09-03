<%--
  Created by IntelliJ IDEA.
  User: Liu
  Date: 2018/9/2
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    //getContextPath获得WeChat路径
//    String path = request.getContextPath();
    //getScheme获得http协议，getServerName获得本机IP，getServerPort获得端口8080
//    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="UTF-8">
    <title>ChatRoom</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit"><!-- Set render engine for 360 browser -->
    <meta name="mobile-web-app-capable" content="yes"><!-- Add to homescreen for Chrome on Android -->

    <%--jsp加载--%>
    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <%--妹子UI相关资源--%>
    <link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <script src="assets/js/amazeui.min.js"></script>
</head>
<body>
<header class="am-topbar am-topbar-fixed-top">
    <div class="am-container">
        <strong class="am-topbar-brand">
            <span class="am-icon-weixin"> Wechat</span>
        </strong>
        <div class="am-topbar-right" id="collapse-head">
            <ul class="am-nav am-nav-pills am-topbar-nav">
                <li class="am-dropdown" data-am-dropdown>
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle>
                        Liu<span class="am-icon-caret-down"></span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li class="am-dropdown-header">1</li>
                        <li class="am-divider"></li>
                        <li><a href="#">2</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</header>
<div class="am-container">
    <!-- 聊天区 -->
    <div class="am-panel am-panel-default">
        <div class="am-panel-bd">
            <div class="am-scrollable-vertical" id="chat-view" style="height: 510px;">
                <ul class="am-comments-list am-comments-list-flip" id="chatContent">
                    <%--hide--%>
                    <li id="msgtmp" class="am-comment am-comment-success am-hide" style="margin-right:20%">
                        <a href="">
                            <img id="pic" class="am-comment-avatar" src="assets/images/other.jpg" alt=""/>
                        </a>
                        <div class="am-comment-main" >
                            <header class="am-comment-hd">
                                <div class="am-comment-meta">
                                    <a id="nickname" href="#" class="am-comment-author">某人</a>
                                    <time id="date" datetime="" title="">2014-7-12 15:30</time>
                                </div>
                            </header>
                            <div id="content" class="am-comment-bd">此处是消息内容</div>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
    </div>

    <!-- 输入区 -->
    <div id="input" class="am-form-group am-form">
        <textarea id="message" rows="5"  placeholder="这里输入你想发送的信息..."></textarea>
    </div>
    <!-- 发送 -->
    <div class="am-fr">
        <p class="am-kai"><button id="send" class="am-btn am-btn-xs am-btn-primary">发送</button></p>
    </div>
</div>>
</body>

<%@ include file="interaction.jsp" %>

