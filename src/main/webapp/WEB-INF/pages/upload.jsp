<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css"/>
    <title>资源上传</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
<!-- 网站头信息-->
<!-- 网站主体 -->
<div id="main">
    <!-- 上传表单-->
    <div class="upload">
        <p>上传资源</p>
        <hr/>
        <form action="${pageContext.request.contextPath}/resource/upload" name="myform" method="post" enctype="multipart/form-data">
                <span>
                    <label>选择文件：</label>
                    <input class="upt" type="text" readonly="readonly" id="fileName"/>
                    <input type="file" name="upload" onchange="showFileName(this)"/>
                   <%-- <input class="upt" type="file" name="upload" onchange="showFileName(this)" value=""/>--%>
                    <b>文件格式可以是txt、pdf、zip、rar等后缀</b>
                </span>
                <span>
                    <label>资源名称：</label>
                    <input class="upt" type="text" name="resource.name" value=""/>
                </span>
                <span>
                    <label>资源类型：</label>
                    <select class="upt" id = "type" name = "resource.type">
                        <option value=文本文件>文本文件</option>
                        <option value="电子文件">电子文件</option>
                        <option value="压缩文件">压缩文件</option>
                    </select>
                </span>
                <span>
                    <label>关键词：</label>
                    <input class="upt" type="text" name="resource.keyWords" value="" onchange="check(this)"/>
                    <b>多个关键词用空格分割,关键词不能超过5个</b>
                </span>
                <span>
                    <label>资源分：</label>
                    <select class="upt" name = "resource.score">
                        <option value="0">0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </span>
                <span class="d_span">
                    <label>资源描述：</label>
                    <textarea name="resource.descp" class="area"
                              placeholder="描述不支持HTML标签；详细的资源描述有机会获得我们的推荐，更有利于他人下载，赚取更多积分。如资源描述不清，有可能审核不通过。"></textarea>
                </span>
                <span>
                    <label class="agree">
                        <input type="checkbox" id="checkbox" />
                        同意爱下下资源上传协议
                    </label>

                </span>

            <span><label class="btn"><input type="button" id = "btn" onclick="uploadsubmit()" value="提交"/></label></span>
            <b id="info"></b>
        </form>
    </div>
    <!-- 公告 -->
    <div class="advice">
        <p class="title">上传须知</p>
        <hr/>
        <p><span>*</span>如涉及侵权内容,您的资源将被移除</p>

        <p><span>*</span>请勿上传小说、mp3、图片等与技术无关的内容.一旦发现将被删除</p>

        <p><span>*</span>请勿在未经授权的情况下上传任何涉及著作权侵权的资源，除非该资源完全由您个人创作</p>

        <p><span>*</span>点击上传资源即表示您确认该资源不违反资源分享的使用条款，并且您拥有该资源的所有版权或者上传资源的授权</p>
    </div>
</div>

<script>
    function check(tag) {
        //获取对应input表单的值
        var val = tag.value;
        var array = val.split(" ");
        //alert(array.length);
    }

    function showFileName(tag) {
        var name = tag.files[0].name;
        //alert(name);
        document.getElementById("fileName").value = name;
    }
    function uploadsubmit(){
        var flag = document.getElementById("checkbox").checked;

        if (flag) {
            myform.submit();
        }
        else
        {
            alert("请勾选上传协议");
            //document.getElementById("info").innerHTML = '请同意协议';
            return false;
        }
    }
</script>
</body>
</html>
