
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <%--<script src="${pageContext.request.contextPath}/resources/js/jquery.qrcode.min.js"></script>--%>
    <title></title>
</head>
<body>
<script>
    function mylikes() {
        alert("您还没登陆，请先登陆");
    }
</script>
<div class="header">
    <div class="lf">
        <a href="${pageContext.request.contextPath}/refresh">首页</a>
        <a href="${pageContext.request.contextPath}/bbs/loadBbs">论坛</a>
        <a href="${pageContext.request.contextPath}/upload.jsp">上传资料</a>
    </div>

    <div class="rf">
        <a href="${pageContext.request.contextPath}/personal.jsp">个人信息</a>
        <c:if test="${empty sessionScope.loginuser}">
            <a href="javascript:void(0)" onclick="mylikes()">我的收藏</a>
        </c:if>
        <c:if test="${not empty sessionScope.loginuser}">
            <a href="${pageContext.request.contextPath}/likes/myLikes?userId=${loginuser.id}">我的收藏</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/point.jsp">积分</a>
        <a href="${pageContext.request.contextPath}/admin/index.jsp">后台</a>
        <a href="${pageContext.request.contextPath}/user/exit">退出登录</a>
    </div>
</div>
<%--<div class="cvs" style="display:block" id="cvs2_logon">--%>
        <div class="cvs" <c:if test = "${falg == true}" >
                               style="display:none"
                               </c:if>
                <c:if test="${flag == false}">
                    style="display:block"
                </c:if>
             id="cvs2_logon">
    <div class="newModWin">
        <div class="title">登录爱下下账号<b id="msgb" style="color:red">
            <c:if test="${falg == false}">
            ${message}
        </c:if></b></div>
        <div class="close" id="cvs2_close" onclick="close_win()">X</div>
        <div class="logWin">
            <form action="${pageContext.request.contextPath}/user/login" method="post">
                <input type="text" class="inp user" name="userName" placeholder="请输入用户名"/>
                <input type="password" class="inp pass" name="passWord" placeholder="请输入密码"/>
                <a href="${pageContext.request.contextPath}/findpass.jsp" class="find_pass">忘记密码，立即找回</a>
                <input type="submit" class="su_btn" value=" <fmt:message key='M1000'/>"/>
                <a href="${pageContext.request.contextPath}/view/register" class="reg">注册</a>
            </form>
        </div>
    </div>
</div>
<div id="nav">

    <div id="search">
        <input type="text" name="name"/>
        <input type="button" value="搜索"/>
    </div>

    <div id="logon">
        <div class="cons">
            欢迎 ${user.userName}光临爱下下！
        </div>
        <div class="opers">
            <input type="button" value="上传资料" onclick="open_page()"/>
        </div>
    </div>
    <c:if test="${empty user}">
        <div id="login">
            <a onclick="showWin()">点击登录</a>
        </div>
    </c:if>
    <c:if test="${not empty user}">
        <img id="login" src="${pageContext.request.contextPath}/${user.imgPath}">
    </c:if>
</div>
<script>
/*    $(function () {
        var u = "<%= session.getAttribute("loginuser")%>";
        if (u != "null") {
            $('<div></div>').qrcode({
                width: 200,
                height: 200,
                correctLevel: 0,
                text: '哈哈'
            }).appendTo("div#header");
        }
    });*/
</script>
<script>

   /* $(function(){
       var s = ${falg};
        if (!s) {
            var div = $("#cvs2_logon");
            div.attr("style","display:block");
        }
    });*/
    function showWin() {
        //获取对应的DIV元素
        var div = document.getElementById("cvs2_logon");
        div.style = 'display:block';
    }

    function close_win() {
        var div = document.getElementById("cvs2_logon");
        div.style = 'display:none';
    }

    function open_page() {
        //打开一个页面
        window.location.href = 'upload.jsp';
    }


</script>

</body>
</html>
