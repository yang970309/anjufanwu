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
    <title>新闻信息信息_我的网站</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen"/>
</head>
<jsp:include page="top.jsp"></jsp:include>
<div class="headerTOPH2" style="    margin-top: 60px;"></div>
<div class="callbacks_container">
    <ul class="rslides" id="slider">
        <li><a href=""><img src="images/banner-1.jpg" alt=""></a></li>
    </ul>
</div>


<div class="mian-cur-position">
    <div class="mcp-frim maxw">
        <div class="title">
            <h3> 新闻资讯</h3><!-- <i>/</i><em>News</em> -->
        </div>
        <div class="curpor">
            <a href="index.do">首页</a>
            <i class="icon-eec7"></i>
            <a href=""> 新闻资讯</a>
        </div>
    </div>
</div>


<div class="page-container" id="innerpage-wrap">
    <div class="container">
        <div class="row">
            <div class="main col-md-12 inner-left" role="main">
                <aside class="sidebar col-md-12" role="complementary">
                    <section class="widget side-search">
                        <h3 class="title">站内搜索</h3>
                        <form class="searchform" id="searchform" name="formsearch" method="post"
                              action="searchNewsFore.do">
                            <input type="hidden" name="kwtype" value="0"/>
                            <div class="sform-div">
                                <input type="text" name="name" placeholder="输入新闻动态名称" id="s"/>
                                <input type="submit" id="searchsubmit" value=""/>
                            </div>
                        </form>
                    </section>
                </aside>
            </div>
        </div>
    </div>
</div>


<div class="news-main">
    <!-- start-->
    <c:forEach items="${list }" var="n">
        <div class="news-item">
            <a href="showNews.do?id=${n.id }" class="pic"><img src="./upload/${n.img }" alt="${n.name }"></a>
            <div class="info">
                <a href="showNews.do?id=${n.id }" class="title">${n.name }</a>
                <p></p>
                <a href="showNews.do?id=${n.id }" class="see">查看详情</a>
                <h3><span>发布时间：${n.pubtime }</span></h3>
            </div>
        </div>
    </c:forEach>
    <!-- end-->


    <div class="pagination-wrap">
        <div id="pages">
            <div class="page">
                <c:if test="${sessionScope.p==1 }">
                    <span>当前第${page.page }页，共${page.totalPage }页;总共${page.total }条记录</span>
                    <c:if test="${page.page>1}">
                        <a href="newsListFore.do?page=1" class="thisclass"><span>首页</span></a>
                        <a href="newsListFore.do?page=${page.page-1 }" class="thisclass"><span>上一页</span></a>
                        <a>下一页</a>
                        <a>末页</a>
                    </c:if>
                    <c:if test="${page.page<page.totalPage}">
                        <a>首页</a>
                        <a> 上一页</a>
                        <a href="newsListFore.do?page=${page.page+1 }" class="thisclass"><span>下一页</span></a>
                        <a href="newsListFore.do?page=${page.totalPage }" class="thisclass"><span>末页</span></a>
                    </c:if>
                </c:if>
                <c:if test="${sessionScope.p==2 }">
                    <c:if test="${page.page>1}">
                        <a href="searchNewsFore.do?page=1">首页</a>
                        <a href="searchNewsFore.do?page=${page.page-1 }"> 上一页</a>
                    </c:if>
                    <c:if test="${page.page<page.totalPage}">
                        <a href="searchNewsFore.do?page=${page.page+1 }">下一页</a>
                        <a href="searchNewsFore.do?page=${page.totalPage }">末页</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>


<jsp:include page="foot.jsp"></jsp:include>
