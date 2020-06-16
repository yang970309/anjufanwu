<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<jsp:include page="top.jsp"></jsp:include>
<div class="headerTOPH2"></div>
<div class="callbacks_container">
    <ul class="rslides" id="slider">
        <c:forEach items="${list }" var="n">
            <li><a href="showNews.do?id=${n.id }"><img src="./upload/${n.img }" alt="${n.name }" style="height:590px;"></a>
            </li>
        </c:forEach>
    </ul>
</div>


<!--3 start-->
<div class="index-title maxw"><h2>设计案例信息</h2><i>/</i><em>Goods</em></div>
<section class="index-application-case maxw">
    <c:forEach items="${glist }" var="sb">
        <a href="showGoodsx.do?id=${sb.id }" class="appcase-item">
            <div class="info">
                <h2>${sb.name }</h2>
                <p><c:forEach items="${tlist }" var="t">
                    <c:if test="${t.id==sb.fid }">
                        作品类别：${t.name }
                    </c:if>
                </c:forEach></p>
            </div>
            <img src="./upload/${sb.img }" style="width:384px;height:414px;">
        </a>
    </c:forEach>
</section>
<a href="showGoodsList.do" class="commonMoreBut">查看更多</a>
<!--3 end-->

<!--4 start-->
<div class="index-title maxw"><h2>新闻动态</h2><i>/</i><em>News</em></div>
<section class="index-news">
    <c:forEach items="${list2 }" var="n2">
        <div class="news-item">
            <div class="time"><span><em>${n2.pubtime.substring(8,10) }</em><dl>日</dl></span>
                <h2>${n2.pubtime.substring(0,7) }</h2></div>
            <a href="showNews.do?id=${n2.id }" class="info">
                <h2>${n2.name }</h2>
                <p></p>
            </a>
        </div>
    </c:forEach>
</section>
<a href="newsListFore.do" class="commonMoreBut">查看更多</a>
<!--4 end-->

<jsp:include page="foot.jsp"></jsp:include>

</div>
</body>
</html>
