<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>后台登录</title>
    <link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="static/admin/css/login.css"/>
    <script type="text/javascript" src="static/admin/js/jquery-1.11.0.min.js"></script>
</head>
<body>
<div class="m-login-bg">
    <div class="m-login">
        <h3>后台系统登录</h3>
        <div class="m-login-warp">
            <form class="layui-form" action="alogin.do" method="post">
                <div class="layui-form-item">
                    <input type="text" name="uname" required lay-verify="required" placeholder="用户名" autocomplete="off"
                           class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="password" name="pwd" required lay-verify="required" placeholder="密码" autocomplete="off"
                           class="layui-input">
                </div>

                <div class="layui-form-item">
                    <select name="utype" class="layui-input">
                        <option value="管理员">管理员</option>
                        <option value="设计师">设计师</option>
                    </select>
                </div>

                <!-- <div class="layui-form-item">
                    <div class="layui-inline">
                        <input type="text" name="verity" required lay-verify="required" placeholder="验证码" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-inline">
                        <img class="verifyImg" onclick="this.src=this.src+'?c='+Math.random();" src="static/admin/images/login/yzm.jpg" />
                    </div>
                </div> -->
                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="login">登录</button>
                    </div>
                    <div class="layui-inline">
                        <button type="reset" class="layui-btn layui-btn-primary">取消</button>
                    </div>
                </div>
            </form>
        </div>
        <p class="copyright">Copyright 2020 by 安居房屋设计平台</p>
    </div>
</div>
<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form(),
            layer = layui.layer;


        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            },
            password: [/(.+){6,12}$/, '密码必须6到12位'],
            verity: [/(.+){6}$/, '验证码必须是6位'],

        });

        //监听提交
        form.on('submit(login)', function (data) {
            /* 	alert(JSON.stringify(data.field.password));
                layer.alert(JSON.stringify(data.field), {
                    title: '最终的提交信息',
                }) */
            //return false;
            $.ajax({
                url: "alogin.do",
                type: "post",
                data: {"uname": data.field.uname, "pwd": data.field.pwd, "utype": data.field.utype},
                dataType: "json",
                success: function (result) {
                    if (result.info == "ng") {
                        alert("用户名或者密码错误！");
                        var currentPagepath = location.href;
                        var pathName = window.document.location.pathname;
                        var pos = currentPagepath.indexOf(pathName);
                        var localhostPath = currentPagepath.substring(0, pos);
                        var projectName = pathName.substring(0, pathName.substr(1).indexOf("/") + 1);
                        window.location.href = localhostPath + projectName + "/admin/";
                    } else {
                        alert("登录成功！");
                        var currentPagepath = location.href;
                        var pathName = window.document.location.pathname;
                        var pos = currentPagepath.indexOf(pathName);
                        var localhostPath = currentPagepath.substring(0, pos);
                        var projectName = pathName.substring(0, pathName.substr(1).indexOf("/") + 1);
                        window.location.href = localhostPath + projectName + "/admin/index2.jsp";
                        // window.location.href='http://localhost:8080/anjufangwu/admin/index2.jsp';
                    }
                },
                error: function () {
                    alert("请求处理中！");
                    return false;
                }

            });
        });

    });
</script>
</body>

</html>
