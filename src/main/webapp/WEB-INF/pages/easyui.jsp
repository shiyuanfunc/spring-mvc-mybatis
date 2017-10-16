<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限管理系统</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/cs/icon.css/themes/icon.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div id="cc" class="easyui-layout" style="width:100%;height:100%;">
  <div data-options="region:'north',title:'北Title',split:true,collapsible:true,minimizable:true" style="height:150px; color: red"></div>
  <div data-options="region:'west',title:'导航菜单',split:true, collapsible:true" style="width:150px;">

    <div id="aa" class="easyui-accordion" style="width:100%;height:90%;">
      <div id="aaa" title="系统管理" data-options="iconCls:'icon-save',selected:true" style="overflow:auto;padding:0px;">
          <a id="aaa_btn"  class="easyui-linkbutton" _href="" data-options="iconCls:'icon-search'" style="width: 100%">用户管理</a>
          <a id="aaa_btn1" class="easyui-linkbutton" _href="" data-options="iconCls:'icon-search'" style="width: 100%">菜单管理</a>
          <a class="easyui-linkbutton" _href="" data-options="iconCls:'icon-search'" style="width: 100%">机构管理</a>
          <div class="easyui-linkbutton" _href="" data-options="iconCls:'icon-search'" style="width: 100%">日志管理1</div>
      </div>
      <div title="个人中心" data-options="iconCls:'icon-reload'" style="padding:0px;">
          <a class="easyui-linkbutton" _href="" data-options="iconCls:'icon-search'" style="width: 100%">修改密码</a>
          <a class="easyui-linkbutton" _href="" data-options="iconCls:'icon-search'" style="width: 100%">安全退出</a>
          <a class="easyui-linkbutton" _href="" data-options="iconCls:'icon-search'" style="width: 100%">百度</a>
      </div>
      <div title="投标管理" data-options="iconCls:'icon-reload'" style="padding:0px;">暂时不做</div>
    </div>
  </div>
  <div data-options="region:'center',title:'中心面板'" style="padding:0px;background:#eee;">
      <div id="tt" data-options="fit:true" class="easyui-tabs" style="width:500px;height:250px;">
          <div title="首页" >
              tab1
          </div>
      </div>
  </div>

    <div data-options="region:'south',split:true" style="height:50px;width: auto" align="center">
        技术支持：J0508第五组
    </div>

</div>
</body>
<script>
    $(function(){

        /*$("#aa").accordion({
            onSelect: function (title, index) {
                //获取选中的面板
                var p =  $("#aa").accordion("getSelected");
                if ($("#tt").tabs("getTab",title) == null) {
                    $('#tt').tabs('add', {
                        title: title,
                        content: '新内容',
                        selected: true,
                        closable: true
                    });
                }else{
                    $("#tt").tabs("select",title);
                }
            }
        });
*/
        $(".easyui-linkbutton").linkbutton({
            //获取所有class等于 上面的对象  $(this)
            onClick:function(){
                //$('#btn').linkbutton('disable');
                var p  = $(this).linkbutton('options');
                var title = p.text;
                if ($("#tt").tabs("getTab",title) == null) {
                    $('#tt').tabs('add', {
                        title: title,
                        content: '<iframe src="${pageContext.request.contextPath}/view/success" style="width:100%;height:100%"></iframe>',
                        selected: true,
                        closable: true
                    });
                }else{
                    $("#tt").tabs("select",title);
                }
            }
        });
    });

</script>
</html>
