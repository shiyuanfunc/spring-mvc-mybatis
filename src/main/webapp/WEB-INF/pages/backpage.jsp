<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>返回页面</title>
    <%--<meta http-equiv="Refresh" content="0;url=${pageContext.request.contextPath}/view/register" />--%>

</head>
<body>
    <script>
      alert("刷新")
      window.history.go(-1);
    </script>
</body>
</html>
