<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>安居房屋设计平台</title>
    <link href="css/common.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
    <!-- <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen" /> -->
    <link href="css/iconfont/Rjdaoico.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <!--下拉动画-->
    <link rel="stylesheet" href="css/wow/animate.min.css"/>
    <script type="text/javascript" src="css/wow/wow.min.js"></script>
    <script>
        if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
            new WOW().init();
        }
        ;
        $(function () {

        });
    </script>
    <!--下拉动画-->
    <link rel="stylesheet" href="css/responsiveslides.css">
    <script type="text/javascript" src="js/responsiveslides.min.js"></script>
    <script type="text/javascript">
        $(function () {
            // Slideshow
            $("#slider").responsiveSlides({
                auto: true,
                pager: false,
                nav: true,
                speed: 500,
                timeout: 4000,
                pager: true,
                pauseControls: true,
                namespace: "callbacks"
            });
        });
    </script>
</head>
<body>

<div class="CommonMask" id="CommonMask"></div>
<div class="CommonMaskTop" id="CommonMaskTop"></div>

<header>
    <section class="main">
        <a href="" class="logo" style="    width: 200px;"><img src="images/logo.png"></a>
        <section>
            <div class="language">
                <c:if test="${sessionScope.user==null }">
                    <a href="login.do">登录</a><i></i><a href="regist.jsp">注册</a>
                </c:if>
                <!-- <a class="cur">中文</a><i></i><a>English</a> -->
            </div>
        </section>
        <nav>
            <!--PCNenuMain start-->
            <ul class="PCNenuMain">
                <li class="mn cur"><a href="index.do">首页</a></li>
                <li class="mn"><a href="newsListFore.do">新闻动态</a></li>
                <li class="mn"><a href="showGoodsList.do">设计案例</a></li>
                <li class="mn"><a href="#">分类</a><i class="icon-eed7"></i>
                    <ul class="sonClass">
                        <c:forEach items="${tlist }" var="t">
                            <li><a href="showGoodsType.do?fid=${t.id }" class="serv"><span>${t.name }</span></a></li>
                        </c:forEach>
                    </ul>
                </li>
                <li class="mn"><a href="showShop.do">预约车</a></li>
                <li class="mn"><a href="genZhuangList.do">设计师</a></li>
                <li class="mn"><a href="doAddMoney.do">充值</a></li>
                <li class="mn"><a href="admin/" class="menu1 " target="_blank;">后台</a></li>
                <c:if test="${sessionScope.user!=null }">
                    <li class="mn"><a href="#">${sessionScope.user.uname }</a><i class="icon-eed7"></i>
                        <ul class="sonClass">
                            <li><a href="shopList.do?bid=1" class="serv"><span>我预约的设计案例</span></a></li>
                            <li><a href="showInfo.do" class="serv"><span>我的信息</span></a></li>
                            <li><a href="loginout.do" class="serv"><span>注销</span></a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>

            <!--PCNenuMain end-->
            <!--menuIco start-->
            <div class="menu" id="menuOpen"><i class="icon-eee7"></i></div>
            <!--menuIco end-->
            <!--Mobile menu start-->
            <div class="MNenuMain" id="MNenuMain">
                <div class="mnName">
                    <h1>快速导航</h1>
                    <div class="menuClose" id="menuClose"><i class="icon-ee86"></i></div>
                </div>
                <ul class="navmain">
                    <div class="login">
                        <a class="waplogo"><img src="images/wap-logo.png"></a>
                    </div>
                    <li class="mn"><a href="newsListFore.do">新闻动态</a></li>
                    <li class="mn"><a href="showGoodsList.do">设计案例</a></li>
                    <li class="mn"><a href="#">分类</a><i class="icon-eed7"></i>
                        <ul class="sonClass">
                            <c:forEach items="${tlist }" var="t">
                                <li><a href="showGoodsType.do?fid=${t.id }" class="serv"><span>${t.name }</span></a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="mn"><a href="admin/" class="menu1 " target="_blank;">后台</a></li>
                    <c:if test="${sessionScope.user!=null }">
                        <li class="mn"><a href="#">${sessionScope.user.uname }</a><i class="icon-eed7"></i>
                            <ul class="sonClass">
                                <li><a href="myGoodsList.do" class="serv"><span>我预约的设计案例</span></a></li>
                                <li><a href="showInfo.do" class="serv"><span>我的信息</span></a></li>
                                <li><a href="loginout.do" class="serv"><span>注销</span></a></li>
                            </ul>
                        </li>
                    </c:if>
                    <li class="son"><a href="newsListFore.do" class="mbut"><span>新闻动态</span><em></em></a></li>
                    <li class="son"><a href="showGoodsList.do" class="mbut"><span>设计案例</span><em></em></a></li>
                    <li class="son"><a class="mbut"><span>分类</span><em></em></a>
                        <ul class="SonContent">
                            <c:forEach items="${tlist }" var="t">
                                <li><a href="showGoodsType.do?fid=${t.id}">${t.name }</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--Mobile menu end-->

        </nav>


    </section>
</header>

