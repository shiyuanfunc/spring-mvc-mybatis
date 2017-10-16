<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css"/>
    <script type="text/javascript" src = "${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <%--<script src="${pageContext.request.contextPath}/jquery/jquery.qrcode.min.js"></script>--%>
    <title>首页</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
<!-- 网站主体 -->
<div id="main">
    <c:if test="${empty list}">
        <div>
            暂无数据
        </div>
    </c:if>
    <c:forEach items="${list}" var="res">
        <div class="pro">
            <div class="img">
                <img src="./images/${res.EXT}.svg"/>
            </div>
            <div class="cs">
                <div class="up">
                    <a href="${pageContext.request.contextPath}/resource/resdetail?resId=${res.ID}"
                       title="${res.NAME}">${res.NAME}</a>
                        <%--<a>${res.NAME}</a>--%>
                </div>
                <div class="down">
                    上传者：${res.USERNAME} 上传时间：${res.UPLOADTIME}
                </div>
            </div>
            <div class="arr">
                积分：<span>${res.SCORE}</span>
            </div>
        </div>

    </c:forEach>
    <!-- 定义一个条目-->
</div>
<%--<jsp:include page="/end.jsp">
    <jsp:param name="formParam" value="${pageContext.request.contextPath}/refresh"/>
</jsp:include>--%>
</body>
</html>
