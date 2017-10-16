<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <script type="text/javascript" src = "${pageContext.request.contextPath}/js/jquery.js"></script>
    <title>注册</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
<!-- 网站主体 -->
<div id="main">
    <!-- 上传表单-->
    <div class="upload">
        <p>用户注册</p>
        <font color="red">${msg}  ${param.msg}</font>
        <hr/>
        <form action="${pageContext.request.contextPath}/user/regist" name="myform" method="post" enctype="multipart/form-data">
           <%-- <s:token/>--%>
                <input type="hidden" name="registToken" value="${sessionScope.registToken}">
                <span>
                    <label>用户头像：</label>
                    <input class="upt" type="text" id = "fileName" readonly="readonly"/>
                     <input type="file" name="upload" onchange="showFileName(this)"/>
                    <b>文件格式可以是jpg,gif,png等图片格式</b>
                </span>
                 <span>
                    <label>用户头像：</label>
                    <input class="upt" type="text" id = "fileName1" readonly="readonly"/>
                     <input type="file" name="upload" onchange="showFileName1(this)"/>
                    <b>文件格式可以是jpg,gif,png等图片格式</b>
                </span>
                 <span>
                    <label>用户头像：</label>
                    <input class="upt" type="text" id = "fileName2" readonly="readonly"/>
                     <input type="file" name="upload" onchange="showFileName2(this)"/>
                    <b>文件格式可以是jpg,gif,png等图片格式</b>
                </span>
                <span>
                    <label>用户名：</label>
                    <input id="name" class="upt" type="text" name="userName">
					<b id="nameb"></b>
                    <%--<s:fielderror value="regist"/>--%>
                    <b>账号可以包含字母，数字，下划线，不允许出现其他符号</b>
                </span>
                <span>
                    <label>密码：</label>
                    <input id="password" class="upt" type="password" name="passWord">
                    <b id ="passwordb"></b>
                    <b>密码长度为6-20位</b>
                </span>
                <span>
                    <label>确认密码：</label>
                    <input id="confirmPass" class="upt" type="password" name="" value=""/>
                    <b id="repasswordb"></b>
                    <b>两次输入的密码必须保持一致</b>

                </span>
                <span>
                    <label>联系方式：</label>
                    <input id="tel" class="upt" type="text" name="tel" value=""/>
                    <b id="telb"></b>
                    <b >您丢失密码后找回密码的凭证</b>
                </span>
                <span>
                    <label>电子邮箱：</label>
                    <input id="email" class="upt" type="text" name="email" value=""/>
                    <b id="emailb"></b>
                    <%--<s:fielderror fieldName="user.passWord"/>--%>
                    <b>您丢失密码后找回密码的凭证</b>
                </span>
            <span><label class="btn"><input type="button" id = "btn" onclick="submitForm()" value="注册"/></label></span>
        </form>
    </div>
</div>

<script>

    function showWin(){
        //获取对应的DIV元素
        var div = document.getElementById("cvs2_logon");
        div.style = 'display:block' ;
    }

    function showFileName(tag) {
        var name = tag.files[0].name;
        //name.substring()
        var ext = name.substring(name.lastIndexOf("."));
        if (".jpg" == ext || ".gif" == ext || ".png" == ext) {
            document.getElementById("fileName").value = name;
        }else{
            alert("文件格式有误，请重新选择！");
        }
    }
    function showFileName1(tag) {
        var name = tag.files[0].name;
        //name.substring()
        var ext = name.substring(name.lastIndexOf("."));
        if (".jpg" == ext || ".gif" == ext || ".png" == ext) {
            document.getElementById("fileName1").value = name;
        }else{
            alert("文件格式有误，请重新选择！");
        }
    }
    function showFileName2(tag) {
        var name = tag.files[0].name;
        //name.substring()
        var ext = name.substring(name.lastIndexOf("."));
        if (".jpg" == ext || ".gif" == ext || ".png" == ext) {
            document.getElementById("fileName2").value = name;
        }else{
            alert("文件格式有误，请重新选择！");
        }
    }

    function submitForm(){
        myform.submit();
    }
    //jquery 表单验证
    $(function(){
        var nameflag = true;
        var passflag = true;
        var telflag = true;
        var emailflag = true;
        $("#name").blur(function(){
            var name = $(this).val();
            var regexName = /^\w{6,}$/;
            var flag = regexName.test(name);
            if (!flag){
                nameflag = false;
                var str = "用户名不合法";
                $("#nameb").html(str);
            }else{
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/user/checkname",
                    data:"userName="+name,
                    success:function(backdata,textStatus){
                        //alert(backdata)
                        if("success" == backdata.status){
                            $("#nameb").html("用户名可用");
                        }else
                        {
                            $("#nameb").html("用户名已占用");
                        }
                        console.log(backdata);
                    }

                });
            }

        });

        $("#name").focus(function(){
            nameflag = true;
            $("#nameb").empty();
        });

        $("#password").blur(function(){
            var password = $(this).val();
            var regexpassword = /^[a-z0-9_-]{6,18}$/;
            var flag = regexpassword.test(password);
            if (!flag){
                passflag = false;
                var str = "密码不合法";
                $("#passwordb").html(str);
                //$("#passwordb").append("<span clas = 'error'>"+str+"</span>");
            }
        });

        $("#password").focus(function(){
            //var str = "密码长度为6-20位";
            //$("#passwordb").html(str);
            passflag = true;
            $("#passwordb").empty();
        });

        $("#confirmPass").blur(function(){
            var confirmPass = $(this).val();
            var password = $("#password").val();
            if (!(confirmPass === password)){
                passflag = false;
                var str = "两次密码不一致";
                $("#repasswordb").html(str);
            }
        });

        $("#confirmPass").focus(function(){
            passflag = true;
            $("#repasswordb").empty();
        });

        $("#tel").blur(function(){
            var tel = $(this).val();
            var regtel = /^1[3578]\d{9}/;
            var flagtel = regtel.test(tel);
            if (!flagtel){
                telflag = false;
                var str = "电话号码不合法";
                $("#telb").html(str);

            }
        });

        $("#tel").focus(function(){
            telflag = true;
            $("#telb").empty();
        });

        $("#email").blur(function(){
            var email = $(this).val();
            var regxenail = /^\w{1,}@\w{1,}\.\w{1,}/;
            var flag = regxenail.test(email);
            if (!flag){
                var str = "邮箱不合法";
                $("#emailb").html(str);
            }
        });

        $("#email").focus(function(){
            $("#emailb").empty();
        });

        $("#btn").click(function(){
            if (nameflag && passflag && telflag && emailflag){
                //alert("tijao");
                myform.submit();
            }
        });
    });

</script>
</body>
</html>
