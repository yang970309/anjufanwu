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
    <title>充值_我的网站</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen"/>
    <script type="text/javascript" src="js/login.js"></script>
</head>
<body>
<div id="container">

    <jsp:include page="top.jsp"></jsp:include>

    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat">充值</div>
                <div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a
                        href='javascript:;'>主页</a> > <a href='javascript:;'>充值</a></span></div>
            </div>
        </div>
    </div>
    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-9 inner-left" role="main">
                    <div class="about-page-wrap">
                        <div id="contact-wrap">
                            <h3 class="msg-title">会员充值</h3>
                            <form class="add-msg-form" action="chongZhi.do" method="post">
                                <!-- enctype="multipart/form-data" -->
                                <div class="row">
                                    <div class="cf-column col-md-12">
                                        <label>账号*</label>
                                        <input type="hidden" name="id" value="${user.id }">
                                        <input id="" type="text" value="${user.uname }" readonly="readonly"/>
                                    </div>
                                    <div class="cf-column col-md-12">
                                        <label>用户姓名</label>
                                        <input id="" type="text" value="${user.tname }" readonly="readonly"/>
                                    </div>
                                    <div class="cf-column col-md-12">
                                        <label>用户余额：</label>
                                        <input type="text" value="${user.money }" readonly="readonly"/>
                                    </div>
                                    <div class="cf-column col-md-12"><label>充值金额：</label>
                                        <input type="number" name="money" min="1" value="1" required="required"/>
                                        <span id='' class="spanInit"></span>
                                    </div>

                                    <div class="cf-column col-md-12 submit-column">
                                        <button type="submit" id="submit-btn" class="submit-button"
                                                onclick="return checkAll()">充值
                                        </button>
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
		
	