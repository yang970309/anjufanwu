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
    <title>设计师信息_我的网站</title>
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
                <div class="col-md-3 col-sm-4 bcid-cat">设计师信息</div>
                <div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a
                        href='javascript:;'>主页</a> > <a href='javascript:;'>设计师信息</a> > </span></div>
            </div>
        </div>
    </div>


    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-9 inner-left" role="main">
                    <div class="prolist-wrap">
                        <div id="portfolio-container">
                            <div class="row portfolio-3-columns isotope-x clearfix">
                                <c:forEach items="${list }" var="u">
                                    <div class="portfolio-item isotope-item col-sm-4 col-xs-6">
                                        <article>
                                            <figure class="glass-animation">
                                                <a class="swipebox" href="showUserx_gz.do?id=${u.id }"> <span
                                                        class="background"></span> <span class="glass"><span
                                                        class="circle"><i class="handle"></i></span></span>
                                                    <img class="img-responsive" src="./upload/${u.img }"
                                                         alt="${u.tname }" style="width:262px;height:262px;"/> </a>
                                            </figure>
                                            <h5 class="item-title"><a href="showUserx_gz.do?id=${u.id }"
                                                                      title="${u.tname }">设计师名称：${u.tname }</a></h5>
                                            <h5 class="item-title"><a href="showUserx_gz.do?id=${u.id }"
                                                                      title="${u.tname }">性别：${u.sex }</a></h5>
                                            <h5 class="item-title"><a href="showUserx_gz.do?id=${u.id }"
                                                                      title="${u.tname }">设计师星级：${u.scope }</a></h5>
                                            <h5 class="item-title"><a href="selectGoodsList.do?uid=${u.id }"
                                                                      title="${u.tname }">查看设计案例</a></h5>
                                            <div class="flex separator"><span class="line"></span> <span
                                                    class="wrap"><span class="square"></span></span>
                                            </div>
                                        </article>
                                    </div>
                                </c:forEach>

                            </div>
                            <div id="pages" class="page">
                                <c:if test="${sessionScope.p==1 }">
                                    <c:if test="${page.page>1}">
                                        <a href="showUserList.do?page=1">首页</a>
                                        <a href="showUserList.do?page=${page.page-1 }"> 上一页</a>
                                    </c:if>
                                    <c:if test="${page.page<page.totalPage}">
                                        <a href="showUserList.do?page=${page.page+1 }">下一页</a>
                                        <a href="showUserList.do?page=${page.totalPage }">末页</a>
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope.p==2 }">
                                    <c:if test="${page.page>1}">
                                        <a href="selectUserList.do?page=1">首页</a>
                                        <a href="selectUserList.do?page=${page.page-1 }"> 上一页</a>
                                    </c:if>
                                    <c:if test="${page.page<page.totalPage}">
                                        <a href="selectUserList.do?page=${page.page+1 }">下一页</a>
                                        <a href="selectUserList.do?page=${page.totalPage }">末页</a>
                                    </c:if>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <aside class="sidebar col-md-3 inner-right" role="complementary">
                    <section class="widget side-search">
                        <h3 class="title">站内搜索</h3>
                        <form class="searchform" id="searchform" name="formsearch" method="post" action="selectUserList.do">
                            <input type="hidden" name="kwtype" value="0" />
                            <div class="sform-div">
                                <input type="text"  name="name" placeholder="输入设计师名称" id="s" />
                                <input type="submit" id="searchsubmit" value="" />
                            </div>
                        </form>
                    </section>
                </aside> -->
            </div>
        </div>
    </div>
    <div class="for-bottom-padding"></div>

    <jsp:include page="foot.jsp"></jsp:include>

</div>

