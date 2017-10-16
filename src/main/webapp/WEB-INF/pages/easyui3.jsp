<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ztree</title>
  <link href="${pageContext.request.contextPath }/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ztree.all.js"></script>
</head>
<body>
<div id="tree" class="ztree" style="width:200px;"></div>
<script type="text/javascript">

  $(function(){

    setting = {
      view: {
        selectedMulti: false
      },
      async:{
        enable: true,
        url: "${pageContext.request.contextPath}/resource/ztree",
        type:'post',
        dataType:'json'
      },
      data:{
        key:{
          name:'USERNAME',
        },
        simpleData:{
          enable: true,
          idKey: "ID",
          pIdKey: "PID",
          rootPId: null
        }
      },
      check: {
        enable: true,
        chkboxType:{"Y":"s" , "N":"ps"}
      },
      callback:{
        onCheck:function(event, treeId, treeNode){
          alert(treeNode.USERNAME);
        }
      }
    };

    $.fn.zTree.init($("#tree"), setting);

  });




  function selectNode(){
    //获取树对象
    var treeObj = $.fn.zTree.getZTreeObj("tree");
    //调方法获取被选中的树节点
    var nodes = treeObj.getCheckedNodes(true);

    $.each(nodes, function(i , node){
      alert(node.ID);
    })
  }
</script>
</body>
</html>
