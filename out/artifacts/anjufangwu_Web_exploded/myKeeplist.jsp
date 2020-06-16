<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <title>收藏设计师信息_我的网站</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen"/>
</head>
<!-- layui css -->
<link rel="stylesheet" href="admin/layui/css/layui.css" media="all">
<script type="text/javascript" src="admin/js/jquery-1.11.0.min.js"></script>
<!-- layui js -->
<script src="admin/layui/layui.js"></script>
<script type="text/javascript">
    //静态表格
    layui.use('table', function () {
        var table = layui.table;
        //转换静态表格
        table.init('mylist', {
            height: 'full-130' //高度最大化减去差值,也可以自己设置高度值：如 height:300
            , count: 50 //数据总数 服务端获得
            , limit: 5 //每页显示条数 注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
            , page: true //开启分页
            , toolbar: '#toolbarDemo'//工具栏
            , defaultToolbar: ['filter', 'exports']
            , limits: [5, 10, 15, 20, 30, 50]//分页显示每页条目下拉选择
            , cellMinWidth: 60//定义全局最小单元格宽度，其余自动分配宽度
        });
    });

</script>
<body>
<div id="container">
    <jsp:include page="top.jsp"></jsp:include>

    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat">收藏设计师信息</div>
                <div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a
                        href='javascript:;'>主页</a> > <a href='javascript:;'>收藏设计师信息</a> > </span></div>
            </div>
        </div>
    </div>


    <div class="page-container" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-12 inner-left" role="main">
                    <div class="prolist-wrap">
                        <div id="portfolio-container">
                            <div class="row portfolio-3-columns isotope-x clearfix">


                                <!-- 下面写内容 -->
                                <table class="layui-table table table-bordered table-hover" lay-filter="mylist"
                                       lay-size="lg">
                                    <thead>
                                    <tr>
                                        <th lay-data="{field:'xh', align:'center',minWidth:160}">序号</th>
                                        <th lay-data="{field:'yx', align:'center',width:160}">用户</th>
                                        <th lay-data="{field:'sj',align:'center', minWidth:100}">设计师</th>
                                        <th lay-data="{field:'hn',align:'center', minWidth:100}">收藏时间</th>
                                        <th lay-data="{field:'addr2',align:'center',minWidth:100}">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list }" var="o" varStatus="num">

                                        <tr>
                                            <td>${num.count }</td>
                                            <td>
                                                <c:forEach items="${ ulist}" var="u">
                                                    <c:if test="${u.id==o.uid }">
                                                        ${u.tname }
                                                    </c:if>
                                                </c:forEach></td>
                                            <td>
                                                <c:forEach items="${ ulist}" var="u">
                                                    <c:if test="${u.id==o.fid }">
                                                        <a href="showUserx_gz.do?id=${u.id }">${u.tname }</a>
                                                    </c:if>
                                                </c:forEach></td>
                                            <td>${o.pubtime }</td>
                                            <td>
                                                <a href="deleteKeep.do?id=${o.id }" class="btn btn-info">删除</a>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>


                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="for-bottom-padding"></div>

        <jsp:include page="foot.jsp"></jsp:include>

    </div>
