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
    <title>网站后台管理</title>
    <link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="static/admin/css/admin.css"/>
    <script type="text/javascript" src="static/admin/js/login.js"></script>
    <script type="text/javascript" src="static/admin/js/jquery-1.11.0.min.js"></script>
</head>
<body>
<form class="layui-form column-content-detail" method="post" action="updatePersionUser.do">
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">修改个人信息</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${user.uname }" name="uname" readonly="readonly" required
                               lay-verify="required" autocomplete="off" class="layui-input">
                        <input type="hidden" value="${user.id }" name="id"/>
                        <div id='checku' class="tips"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="tname" required lay-verify="required" autocomplete="off"
                               class="layui-input" value="${user.tname }">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码：</label>
                    <div class="layui-input-block">
                        <input type="password" value="${user.pwd }" name="pwd" required lay-verify="required"
                               autocomplete="off" class="layui-input">
                        <div id='prompt_pwd' class="tips"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="tel" value="${user.tel}" required lay-verify="required"
                               autocomplete="off" class="layui-input">
                        <div id='prompt_phone' class="tips"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">地址：</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" value="${user.address }" required lay-verify="required"
                               autocomplete="off" class="layui-input">
                        <div class="tips"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="padding-left: 10px;">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">确认修改</button>
            </div>
        </div>
    </div>
</form>
<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
