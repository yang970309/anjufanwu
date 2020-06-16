<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>订单_我的网站</title>
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
                <div class="col-md-3 col-sm-4 bcid-cat">订单详情</div>
                <div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a
                        href='javascript:;'>主页</a> > <a href='javascript:;'>订单详情</a></span></div>
            </div>
        </div>
    </div>
    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-9 inner-left" role="main">
                    <div class="about-page-wrap">
                        <div id="contact-wrap">
                            <h3 class="msg-title">订单详情</h3>
                            <form class="add-msg-form" action="addShowInfo.do" onsubmit="return check();" method="post"
                                  enctype="multipart/form-data"><!-- enctype="multipart/form-data" -->
                                <div class="row">
                                    <div class="cf-column col-md-12"><label>订单编号：</label>
                                        <input type="text" value="${order.ono }" readonly="readonly"/>
                                    </div>
                                    <div class="cf-column col-md-12"><label>订单时间：</label>
                                        <input name="money" value="${order.stime }" readonly="readonly"/>
                                    </div>
                                    <div class="cf-column col-md-12"><label>订单总价：</label>
                                        <input name="tname" value="${order.zprice }" type="text" readonly="readonly"/>
                                    </div>
                                    <div class="cf-column col-md-12"><label>订单状态：</label>
                                        <input type="text" value="${order.status }" readonly="readonly">
                                    </div>
                                    <div class="cf-column col-md-12"><label>名称：</label>
                                        <input type="text" value="${goods.name }" readonly="readonly">
                                    </div>
                                    <div class="cf-column col-md-12 ">
                                        <label>图片：</label>
                                        <img alt="" src="./upload/${goods.img }" width="50" height="50">
                                    </div>
                                    <div class="cf-column col-md-12 ">
                                        <label>数量：</label>
                                        <input type="text" value="${order.amount }" readonly="readonly">
                                    </div>
                                    <div class="cf-column col-md-12">
                                        <label>用户姓名：</label>
                                        <input type="text" value="${user.tname }" readonly="readonly">
                                    </div>
                                    <div class="cf-column col-md-12">
                                        <label>用户账号：</label>
                                        <input type="text" value="${user.uname }" readonly="readonly">
                                    </div>
                                    <div class="cf-column col-md-12">
                                        <label>用户电话：</label>
                                        <input type="text" value="${user.tel }" readonly="readonly">
                                    </div>
                                    <div class="cf-column col-md-12">
                                        <label>用户地址：</label>
                                        <input type="text" value="${user.address }" readonly="readonly">
                                    </div>


                                    <!-- <div class="cf-column col-md-12 submit-column">
                                        <button type="submit" id="submit-btn" class="submit-button" onclick="return checkAll()">修改</button>
                                    </div> -->
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

