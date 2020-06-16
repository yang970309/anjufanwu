<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit"/>
    <meta name="robots" content="index, follow"/>
    <title>登录_我的网站</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen"/>
</head>
<body>
<div id="container">

    <jsp:include page="top.jsp"></jsp:include>

    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat">登录</div>
                <div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a
                        href='javascript:;'>主页</a> > <a href='javascript:;'>登录</a></span></div>
            </div>
        </div>
    </div>
    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-9 inner-left" role="main">
                    <div class="about-page-wrap">

                        <div id="contact-wrap">
                            <h3 class="msg-title">登录</h3>
                            <form class="add-msg-form" action="login.do" method="post">
                                <!-- enctype="multipart/form-data" -->

                                <div class="row">

                                    <div class="cf-column col-md-12">
                                        <input name="uname" id="name" type="text" placeholder="登录名"
                                               required="required"/>
                                    </div>
                                    <div class="cf-column col-md-12">
                                        <input name="pwd" id="pwd" type="password" placeholder="密码"
                                               required="required"/>
                                    </div>

                                    <div class="cf-column col-md-12 submit-column">
                                        <div class="cf-column col-md-6 submit-column">
                                            <button type="submit" id="submit-btn" class="submit-button">登录</button>
                                        </div>
                                        <div class="cf-column col-md-6 submit-column"><a href="doLossPwd.jsp"
                                                                                         class="submit-button">忘记密码？</a>
                                        </div>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <aside class="sidebar col-md-3 inner-right" role="complementary">
                </aside>
            </div>
        </div>
    </div>
    <div class="for-bottom-padding"></div>
    <jsp:include page="foot.jsp"></jsp:include>
</div>
