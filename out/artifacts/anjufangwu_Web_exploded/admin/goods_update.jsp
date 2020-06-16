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
    <script charset="utf-8" src="/anjufangwu/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="/anjufangwu/kindeditor/lang/zh-CN.js"></script>
</head>
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
<body>

<form class="layui-form column-content-detail" method="post" action="updateGoods.do" enctype="multipart/form-data">
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">修改设计师作品</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="layui-form-item">
                    <label class="layui-form-label">设计师作品名称：</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" value="${goods.name }" required="required" placeholder="请输入名称"
                               autocomplete="off" class="layui-input">
                        <input type="hidden" name="id" value="${goods.id}"/>
                        <div id='checku' class="tips"></div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">所属分类：</label>
                    <div class="layui-input-block">
                        <select name="fid" class="input w50">
                            <c:forEach items="${tlist }" var="ad">
                                <c:if test="${goods.fid==ad.id }">
                                    <option value="${ad.id}">${ad.name }</option>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${tlist }" var="ad">
                                <c:if test="${goods.fid!=ad.id }">
                                    <option value="${ad.id}">${ad.name }</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <%--<div class="layui-form-item">
                    <label class="layui-form-label">设计师：</label>
                    <div class="layui-input-block">
                         <select name="uid" class="input w50" >
                        <c:forEach items="${ulist }" var="ad">
                        <c:if test="${goods.uid==ad.id }">
                        <option value="${ad.id}">${ad.tname }</option>
                        </c:if>
                          </c:forEach>
                          <c:forEach items="${ulist }" var="ad">
                        <c:if test="${goods.uid!=ad.id }">
                        <option value="${ad.id}">${ad.tname }</option>
                        </c:if>
                          </c:forEach>
                        </select>
                    </div>
                </div>--%>

                <div class="layui-form-item">
                    <label class="layui-form-label">价格：</label>
                    <div class="layui-input-block">
                        <input type="number" name="price" min="1" value="${goods.price }" required lay-verify="required"
                               placeholder="请输入价格" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">图片上传：</label>
                    <div class="layui-input-block">
                        <img alt="" src="../upload/${goods.img }" width="50px;" height="50px;">
                        <input type="file" name="file" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">内容：</label>
                    <div class="layui-input-block" style="width: 85%;">
                        <textarea id="editor_id" id="note" name="note" style="width:100%;height:400px;"
                                  class="layui-input">${goods.note }</textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="padding-left: 10px;">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
