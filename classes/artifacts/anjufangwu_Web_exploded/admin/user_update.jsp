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
    <script charset="utf-8" src="/anjufangwu/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="/anjufangwu/kindeditor/lang/zh-CN.js"></script>
    <script>
        KindEditor.ready(function (K) {
            window.editor = K.create('#editor_id');
        });
    </script>
    <script>

        KindEditor.ready(function (K) {

            K.create('textarea[name="note"]', {

                uploadJson: '/anjufangwu/kindeditor/jsp/upload_json.jsp',

                fileManagerJson: '/anjufangwu/kindeditor/jsp/file_manager_json.jsp',

                allowFileManager: true,

                allowImageUpload: true,

                autoHeightMode: true,

                afterCreate: function () {
                    this.loadPlugin('autoheight');
                },

                afterBlur: function () {
                    this.sync();
                }  //Kindeditor下获取文本框信息

            });

        });

    </script>
</head>
<body>
<form class="layui-form column-content-detail" method="post" action="updateUser.do" enctype="multipart/form-data">
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">修改用户</li>
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
                    <label class="layui-form-label">角色：</label>
                    <div class="layui-input-block">
                        <select name="utype">
                            <option value="${user.utype }">${user.utype }</option>
                            <option value="会员">会员</option>
                            <option value="设计师">设计师</option>
                        </select>
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
                    <label class="layui-form-label">图片上传：</label>
                    <div class="layui-input-block">
                        <img alt="" src="../upload/${user.img }" width="50px;" height="50px;">
                        <input type="file" name="file" class="layui-input">
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
                        <div id='prompt_phone' class="tips"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">年龄：</label>
                    <div class="layui-input-block">
                        <input type="text" name="age" value="${user.age }" autocomplete="off" class="layui-input">
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性 别：</label>
                    <div class="layui-input-block">
                        <c:if test="${user.sex=='男' }">
                            <input type="radio" name="sex" value="男" title="男" checked="checked">
                            <input type="radio" name="sex" value="女" title="女">
                        </c:if>
                        <c:if test="${user.sex!='男' }">
                            <input type="radio" name="sex" value="男" title="男">
                            <input type="radio" name="sex" value="女" title="女" checked="checked">
                        </c:if>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">介绍：</label>
                    <div class="layui-input-block">
                        <textarea id="editor_id" id="note" name="note" style="width:100%;height:400px;"
                                  class="layui-input">${user.note }</textarea>
                        <div id='prompt_phone' class="tips"></div>
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
