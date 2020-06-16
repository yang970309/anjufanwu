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
    <title>购物车_我的网站</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="css/tk.css" media="screen"/>
</head>
<script type="text/javascript" src="js/shop.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script>
    $(function () {
        $(".add").click(function () {
            var t = $(this).parent().find('input[class*=text_box]');
            t.val(parseInt(t.val()) + 1)
            setTotal();
        })
        $(".min").click(function () {
            var t = $(this).parent().find('input[class*=text_box]');
            t.val(parseInt(t.val()) - 1)
            if (parseInt(t.val()) <= 0) {
                t.val(1);
            }
            setTotal();
        })

        function setTotal() {
            var s = 0;
            $("#shop-xx #num22").each(function () {
                s += parseInt($(this).find('input[class*=text_box]').val()) * parseFloat($(this).find('span[class*=price]').text());
            });
            document.getElementById("total").value = s.toFixed(2);
//("input[id=total]").html(s.toFixed(2)); 
        }

        setTotal();


    })

</script>
<body>
<div id="container">
    <jsp:include page="top.jsp"></jsp:include>

    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat">购物车</div>
                <div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a
                        href='javascript:;'>主页</a> > <a href='javascript:;'>购物车</a> > </span></div>
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

                                <table class="table table-hover text-center">
                                    <tr>

                                        <td>名称</td>
                                        <td>图片</td>
                                        <td>单价/数量</td>
                                        <td>修改</td>
                                        <td>操作</td>
                                    </tr>
                                    <c:forEach items="${list }" var="s">
                                        <form action="updateShopNum.do" method="post">
                                            <tr id="shop-xx">
                                                <td>
                                                    <c:if test="${s.btype=='1' }">
                                                        <c:forEach items="${glist }" var="g"><c:if
                                                                test="${g.id==s.fid }">${g.name }</c:if></c:forEach>
                                                    </c:if>
                                                    <c:if test="${s.btype=='2' }">
                                                        <c:forEach items="${plist }" var="g"><c:if
                                                                test="${g.id==s.fid }">${g.name }</c:if></c:forEach>
                                                    </c:if>
                                                    <c:if test="${s.btype=='3' }">
                                                        <c:forEach items="${clist }" var="g"><c:if
                                                                test="${g.id==s.fid }">${g.name }</c:if></c:forEach>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <c:if test="${s.btype=='1' }">
                                                        <c:forEach items="${glist }" var="g"><c:if
                                                                test="${g.id==s.fid }"><img src="./upload/${g.img }"
                                                                                            width="87"
                                                                                            height="58"/></c:if></c:forEach>
                                                    </c:if>
                                                    <c:if test="${s.btype=='2' }">
                                                        <c:forEach items="${plist }" var="g"><c:if
                                                                test="${g.id==s.fid }"><img src="./upload/${g.img }"
                                                                                            width="87"
                                                                                            height="58"/></c:if></c:forEach>
                                                    </c:if>
                                                    <c:if test="${s.btype=='3' }">
                                                        <c:forEach items="${clist }" var="g"><c:if
                                                                test="${g.id==s.fid }"><img src="./upload/${g.img }"
                                                                                            width="87"
                                                                                            height="58"/></c:if></c:forEach>
                                                    </c:if>
                                                </td>
                                                <td id="num22">总价:￥<span class="price">
					        <c:if test="${s.btype=='1' }">
                                <c:forEach items="${glist }" var="g"><c:if
                                        test="${g.id==s.fid }">${g.price }</c:if></c:forEach>
                            </c:if>
							<c:if test="${s.btype=='2' }">
                                <c:forEach items="${plist }" var="g"><c:if
                                        test="${g.id==s.fid }">${g.price }</c:if></c:forEach>
                            </c:if>
							<c:if test="${s.btype=='3' }">
                                <c:forEach items="${clist }" var="g"><c:if
                                        test="${g.id==s.fid }">${g.price }</c:if></c:forEach>
                            </c:if>
					        </span>元/
                                                    <input class="min btn  btn-info" type="button" value="-"
                                                           style="width:10px"/>
                                                    <input class="text_box" size="2" name="num" min="1" type="text"
                                                           value="${s.num }" style="width:50px"/> /
                                                    <c:if test="${s.btype=='1' }">
                                                        <c:forEach items="${glist }" var="g"><c:if
                                                                test="${g.id==s.fid }">${g.kcnum }</c:if></c:forEach>
                                                    </c:if>
                                                    <c:if test="${s.btype=='2' }">
                                                        <c:forEach items="${plist }" var="g"><c:if
                                                                test="${g.id==s.fid }">${g.amount }</c:if></c:forEach>
                                                    </c:if>
                                                    <c:if test="${s.btype=='3' }">
                                                        <c:forEach items="${clist }" var="g"><c:if
                                                                test="${g.id==s.fid }">${g.amount }</c:if></c:forEach>
                                                    </c:if>
                                                    <input class="add btn  btn-info" type="button" value="+"
                                                           style="width:10px"/>
                                                    <input type="hidden" name="id" value="${s.id }"/>
                                                </td>
                                                <td><input type="submit" class="btn btn-info" value="确认修改"/></td>
                                                <td><a href="deleteShop.do?id=${s.id }" class="btn btn-warning"><i
                                                        class="ti ti-close"></i>删除</a></td>
                                            </tr>
                                        </form>
                                    </c:forEach>

                                    <tr>
                                        <td colspan="3">
                                            <img alt="" src="images/zhifu.png" width="600px;" height="300px;">
                                        </td>
                                        <td colspan="2">
                                            <form action="addOrder.do" method="post">
                                                <div id="js">
                                                    <ul style="    list-style: none;">
                                                        <li>您的余额为：${user.money }</li>
                                                        <li style="    margin-top: 10px;">应付金额：<label><input type="text"
                                                                                                             name="zprice"
                                                                                                             id="total"
                                                                                                             readonly="readonly"
                                                                                                             style="width:100px"/>元
                                                        </label>
                                                        <li style="    margin-top: 10px;">
                                                            <input name="id" type="hidden"
                                                                   value="${sessionScope.user.id }"/>
                                                        </li>
                                                        <li style="margin-top: 10px;">
                                                            <input name="button" type="submit" id="button"
                                                                   class="btn btn-warning" value="确认支付"/></li>
                                                    </ul>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="for-bottom-padding"></div>

    <jsp:include page="foot.jsp"></jsp:include>

</div>

