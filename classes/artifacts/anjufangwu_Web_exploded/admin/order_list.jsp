<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html>
<html class="iframe-h">

<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>网站后台管理</title>
    <!-- <link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css" /> -->
    <link rel="stylesheet" type="text/css" href="static/admin/css/admin.css"/>
    <link rel="stylesheet" type="text/css" href="static/admin/css/admin.css"/>
    <script src="static/admin/layui/layui.js"></script>
    <script type="text/javascript" src="static/admin/js/jquery-1.11.0.min.js"></script>
    <script src="static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>

    <!-- layui css -->
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <!-- layui js -->
    <script src="layui/layui.js"></script>
</head>

<body>
<div class="wrap-container clearfix">
    <div class="column-content-detail">
        <form class="layui-form" method="post" action="searchForderList.do">
            <div class="layui-form-item">
                <div class="layui-inline tool-btn">
                </div>
                <div class="layui-inline">
                    <input type="text" placeholder="请输入搜索订单名称" name="ono" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-inline">
                    <select name="fid" lay-filter="status">
                        <option value="">请选择作品...</option>
                        <c:forEach items="${glist }" var="ad">
                            <option value="${ad.id }">${ad.name }</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="layui-inline">
                    <select name="status" lay-filter="status">
                        <option value="">请选择状态...</option>
                        <option value="已支付">已支付</option>
                        <option value="已评价">已评价</option>
                    </select>
                </div>
                <button class="layui-btn layui-btn-normal" lay-submit="search">搜索</button>
            </div>
        </form>
        <div class="layui-form" id="table-list">
            <!-- 下面写内容 -->
            <table class="layui-table" lay-filter="mylist" lay-size="lg">
                <thead>
                <tr>
                    <th lay-data="{field:'xh', align:'center',width:160}">序号</th>
                    <th lay-data="{field:'yx', align:'center',width:160}">订单号</th>
                    <th lay-data="{field:'mc', align:'center',width:160}">作品名称</th>
                    <th lay-data="{field:'www',align:'center',minWidth:60}">价格（元）</th>
                    <th lay-data="{field:'img',align:'center',minWidth:70}">图片</th>
                    <th lay-data="{field:'sj',align:'center', minWidth:100}">数量</th>
                    <th lay-data="{field:'zt',align:'center', minWidth:100}">目前状态</th>
                    <th lay-data="{field:'zy',align:'center', minWidth:100}">下单时间</th>
                    <th lay-data="{field:'sc',align:'center', minWidth:100}">评分</th>
                    <th lay-data="{field:'nr',align:'center', minWidth:100}">内容</th>
                    <th lay-data="{field:'addr2',align:'center',minWidth:100}">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="u" varStatus="num">
                    <tr>
                        <!-- <td></td> -->
                        <td>${num.count }</td>
                        <td>${u.ono }</td>
                        <td><c:forEach items="${glist }" var="t">
                            <c:if test="${t.id==u.fid }">${t.name }</c:if>
                        </c:forEach></td>
                        <td><c:forEach items="${glist }" var="t">
                            <c:if test="${t.id==u.fid }">${t.price }</c:if>
                        </c:forEach></td>
                        <td><c:forEach items="${glist }" var="t">
                            <c:if test="${t.id==u.fid }">
                                <img src="../upload/${t.img }" width="50px" height="50ppx;">
                            </c:if>
                        </c:forEach></td>
                            <%-- <td>${u.price }</td> --%>
                            <%-- <td><img src="../upload/${u.img }" width="50px" height="50ppx;"></td>  --%>
                        <td> ${u.amount}</td>
                        <td> ${u.status}</td>
                        <td> ${u.stime}</td>
                        <td> ${u.scope}</td>
                        <td> ${u.pj}</td>
                        <td>
                                <%--  <c:if test="${u.status=='已支付' }">
                                 <a class="layui-btn layui-btn-xs"   href="guiHuan.do?id=${u.id }" >通过</a>
                                 </c:if> --%>
                            <a class="layui-btn layui-btn-danger layui-btn-xs color2" onclick="return del(1,1,1)"
                               href="deleteForder.do?id=${u.id }">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
        <!--  <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" onclick="add()" >添加</button>
        </div>
        </script>-->
    </div>
</div>
<script type="text/javascript">
    //单个删除
    function del(id, mid, iscid) {
        if (confirm("您确定要删除吗?")) {
            return true;
        } else {
            return false;
        }
    }

</script>
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
        //监听行工具事件
        table.on('tool(mylist)', function (obj) { //注：tool 是工具条事件名，mylist 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if (layEvent === 'edit') {
                alert(layEvent);
                layer.msg('修改操作');
            }
        });
        //监听头工具栏事件
        table.on('toolbar(mylist)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据
            /* switch(obj.event){
            case 'getCheckLength':
                if(data.length === 0){
                layer.msg('请选择一行');
                } else {
                layer.msg('删除');
                }
            break;
            }; */
        });
    });

    //  iframe层  详情信息
    function add() {
        //iframe层
        layer.open({
            type: 2,//层类型
            title: "添加",//标题
            closeBtn: 1, //不显示关闭按钮
            shade: [0.3],//遮罩
            skin: 'demo_class_color',//iframe皮肤
            shadeClose: Boolean,//点击遮罩关闭
            area: ['1000px', '900px'],
            // offset: 'rb', //右下角弹出
            // time: 2000, //2秒后自动关闭
            anim: 5,//动画
            content: ['doAddForder.do', 'no'], //iframe的url，no代表不显示滚动条
        });

    }
</script>
</body>

</html>
