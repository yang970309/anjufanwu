<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>安居房屋设计平台后台管理</title>
    <link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="static/admin/css/admin.css"/>
</head>
<body>
<div class="main-layout" id='main-layout'>
    <!--侧边栏-->
    <div class="main-layout-side">
        <div class="m-logo">
        </div>
        <ul class="layui-nav layui-nav-tree" lay-filter="leftNav">
            <!-- <li class="layui-nav-item layui-nav-itemed">
              <a href="javascript:;"><i class="iconfont">&#xe607;</i>菜单管理</a>
              <dl class="layui-nav-child">
                <dd><a href="javascript:;" data-url="menu1.html" data-id='1' data-text="后台菜单"><span class="l-line"></span>后台菜单</a></dd>
                <dd><a href="javascript:;" data-url="menu2.html" data-id='2' data-text="前台菜单"><span class="l-line"></span>前台菜单</a></dd>
              </dl>
            </li> -->
            <c:if test="${sessionScope.auser.utype=='管理员' }">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="iconfont">&#xe606;</i>用户管理</a>
                    <dl class="layui-nav-child">
                        <c:if test="${sessionScope.auser.utype=='管理员' }">
                            <dd><a href="javascript:;" data-url="userList.do" data-id='3' data-text="用户列表"><span
                                    class="l-line"></span>用户列表</a></dd>
                        </c:if>
                        <dd><a href="javascript:;" data-url="showUserInfo.do" data-id='4' data-text="个人信息管理"><span
                                class="l-line"></span>个人信息管理</a></dd>
                    </dl>
                </li>
            </c:if>
            <c:if test="${sessionScope.auser.utype=='设计师' }">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="iconfont">&#xe606;</i>用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="doUpdateUser.do?id=${sessionScope.auser.id}" data-id='4'
                               data-text="个人信息管理"><span class="l-line"></span>个人信息管理</a></dd>
                    </dl>
                </li>
            </c:if>
            <li class="layui-nav-item">
                <a href="javascript:;"><i class="iconfont">&#xe608;</i>设计案例管理</a>
                <dl class="layui-nav-child">
                    <c:if test="${sessionScope.auser.utype=='管理员' }">
                        <dd><a href="javascript:;" data-url="ftypeList.do" data-id='5' data-text="设计案例类别管理"><span
                                class="l-line"></span>设计案例类别管理</a></dd>
                    </c:if>
                    <dd><a href="javascript:;" data-url="goodsList.do" data-id='6' data-text="设计案例管理"><span
                            class="l-line"></span>设计案例管理</a></dd>
                </dl>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;"><i class="iconfont">&#xe608;</i> 设计师预约管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" data-url="forderList.do" data-id='9' data-text="预约管理"><span
                            class="l-line"></span>预约管理</a></dd>
                </dl>
            </li>
            <c:if test="${sessionScope.auser.utype=='管理员' }">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="iconfont">&#xe60c;</i>新闻动态管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="newsList.do" data-id='7' data-text="新闻动态管理"><span
                                class="l-line"></span>新闻动态管理</a></dd>
                    </dl>
                </li>
            </c:if>
        </ul>
    </div>
    <!--右侧内容-->
    <div class="main-layout-container">
        <!--头部-->
        <div class="main-layout-header">
            <div class="menu-btn" id="hideBtn">
                <a href="javascript:;">
                    <span class="iconfont">&#xe60e;</span>
                </a>
            </div>
            <ul class="layui-nav" lay-filter="rightNav">
                <li class="layui-nav-item"><a href="http://localhost:8080/anjufangwu/"
                                              data-url="http://localhost:8080/anjufangwu/" data-id='4' data-text="前台首页"
                                              target="_blank"><i class="iconfont">前台首页</i></a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-url="#" data-id='5'
                       data-text="个人信息">${sessionScope.auser.uname }（${sessionScope.auser.utype }） </a>
                </li><!-- admin-info.html -->
                <li class="layui-nav-item"><a href="loginout.do">退出</a></li>
            </ul>
        </div>
        <!--主体内容-->
        <div class="main-layout-body">
            <!--tab 切换-->
            <div class="layui-tab layui-tab-brief main-layout-tab" lay-filter="tab" lay-allowClose="true">
                <ul class="layui-tab-title">
                    <li class="layui-this welcome">后台主页</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show" style="background: #f5f5f5;">
                        <!--1-->
                        <iframe src="welcome.html" width="100%" height="100%" name="iframe" scrolling="auto"
                                class="iframe" framborder="0"></iframe>
                        <!--1end-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--遮罩-->
    <div class="main-mask">

    </div>
</div>
<script type="text/javascript">
    var scope = {
        link: './welcome.html'
    }
</script>
<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
<script src="static/admin/js/main.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>

