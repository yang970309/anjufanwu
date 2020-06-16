<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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
    <title>设计师作品信息详情_我的网站</title>
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
                <div class="col-md-3 col-sm-4 bcid-cat">${goods.name }</div>
                <div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a
                        href='javascript:;'>主页</a> > <a href='javascript:;'>设计师作品信息</a></span></div>
            </div>
        </div>
    </div>
    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-9 inner-left" role="main">
                    <div class="about-page-wrap">
                        <div class="com-cnt page-content about-title"><br/>
                            <span style="font-size: 25px;font-weight: bold;">&nbsp;${goods.name }</span><br/>
                            <!-- <i></i> -->
                            <hr>

                            <p><b>分类：</b><c:forEach items="${tlist }" var="t">
                                <c:if test="${t.id==goods.fid }">
                                    ${t.name }</c:if></c:forEach></p><br/>
                            <hr>
                            <p>价格：${goods.price }元</p><br/>
                            <hr>
                            <p>设计师作品累计预订数量：${goods.xnum }</p><br/>
                            <hr>


                            <c:if test="${sessionScope.user!=null }">
                                <c:if test="${goods.kcnum!=0 }">
                                    <p>
                                    <h3><a href="addshop.do?fid=${goods.id }&&bid=1" class="submit-button"
                                           style="color: #fff;background-color: #000;padding: 8px;font-size: 20px;">预约/加入购物车</a>
                                    </h3></p><br /><hr>
                                </c:if>
                            </c:if>
                            <c:if test="${sessionScope.user==null }">
                                <p>
                                <h3>请登录后操作！！<a href="login.jsp" class="submit-button"
                                               style="color: #fff;background-color: #000;padding: 8px;font-size: 20px;">登录</a>
                                </h3></p><br /><hr>
                            </c:if>
                            ${goods.note }
                            <hr>
                            <div id="pages" class="page"></div>
                            <p>设计师介绍：
                                ${user.note }
                            </p>
                        </div>
                        <div id="contact-wrap"></div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="for-bottom-padding"></div>
    <jsp:include page="foot.jsp"></jsp:include>
</div>
