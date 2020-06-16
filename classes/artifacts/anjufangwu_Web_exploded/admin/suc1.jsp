<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<div align="center">
    <h1>恭喜您操作成功！</h1>
    数据库路径为：${sessionScope.path }<br>
    数据库名为：${sessionScope.name }
    <%
        session.removeAttribute("path");
        session.removeAttribute("name");
    %>
    <!--  <div class="reindex"><a href="myLuQu.do" target="right">查看我申请的院校</a></div> -->
</div>

</body>
</html>
