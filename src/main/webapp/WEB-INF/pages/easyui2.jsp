<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>easyui2测试</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/cs/easyui.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/cs/icon.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/cs/color.css"/>
  <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
<form id="ff" method="post">
  <leabl >用户名:</leabl><input class="easyui-textbox" data-options="required:true,validType:['textbox','length[5,20]'],iconCls:'icon-man'" style="width:300px" placeholder="请输入账号" />
    <br/>
    <br/>
    <leabl >密码:</leabl><input class="easyui-passwordbox" data-options="required:true, validType:['textbox','length[5,20]']" prompt="Password" iconWidth="28" style="width:300px"/>
    <br/>
    <br/>
    <leabl >邮箱:</leabl><input id="vv" class="easyui-textbox" data-options="required:true,validType:['email','length[10,20]'] " style="width:300px"/>
    <br/>
    <br/>
    <a class="easyui-linkbutton" style="width: 120px;" onclick="sub()">提交</a>
    <a class="easyui-linkbutton" style="width: 120px;" onclick="reset()">重置</a>
</form>

<div>
    <input id="ccc" class="easyui-combobox" value="bb" name="dept"
           data-options="valueField:'id',textField:'text',url:'${pageContext.request.contextPath}/resource/getcombobox'" />
    <br/><br/>

    <input id="ccx" name="dept" value="aa">
    <br/><br/>
<input id="cc1" class="easyui-combobox" data-options="
        valueField: 'id',
        textField: 'text',
        url: '${pageContext.request.contextPath}/resource/getcombobox',
        onSelect: function(rec){
            var url = 'get_data2.php?id='+rec.id;
            $('#cc2').combobox('reload', url);
        }" />
    <input id="cc2" class="easyui-combobox" data-options="valueField:'id',textField:'text'" />


</div>
<br/>
<br/>
<div id="toolbar">
    <a id="batchremove" class="easyui-linkbutton" data-options="iconCls:'icon-remove' ">批量删除</a>
</div>
<table id="tg" class="easyui-datagrid" data-options="pagination:true,pageList:[1,2,3,4,5],pageSize:1,toolbar:'#toolbar',url:'${pageContext.request.contextPath}/resource/getjson',
       fitColumns:true" title="用户管理">
    <thead>
    <tr >
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'code',width:100">编码</th>
        <th data-options="field:'name',width:30, sortable:true">名称</th>
        <th data-options="field:'oper',width:50, formatter:oper">操作</th>
    </tr>
    </thead>
</table><br/><br/>
<input class="easyui-slider" value="12"  style="width:300px"
       data-options="showTip:true,rule:[0,'|',25,'|',50,'|',75,'|',100]" />
<br/><br/>
<input id="upfile"  type="file" />
<input id="upfile" class="easyui-filebox" style="width:300px" data-options="buttonText:'选择文件',accept:'.jpg',multiple:true">
<div ><img id="showImg" src=""></div>
<br/><br/>
<input id="fb" type="text" style="width:300px">
<br/><br/>
<input id="ss" class="easyui-timespinner"  style="width:280px;"
       required="required" data-options="min:'08:30',showSeconds:true" />
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<input  id="dd"  type= "text" class= "easyui-datebox" required ="required"> </input>

<%--<div class="easyui-dialog" style="width:600px;height:300px"
     data-options="title:'My Dialog',modal:true,
			toolbar:[{
				text:'编辑',
				iconCls:'icon-edit',
				handler:function(){alert('edit')}
			},{
				text:'帮助',
				iconCls:'icon-help',
				handler:function(){alert('help')}
			}]">
    对话框窗口内容。</div>--%>


<script>
   /* $('#tg').pagination({
        layout:['first','links','last']
    });*/

    $('#dd').datebox({
        onSelect: function(date){
            alert(date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate());
        }
    });

    $('#fb').filebox({
        buttonText: '选择文件',
        buttonAlign: 'right'
    });
    function oper(value,row,index){
        //console.log(value.toString()+row.toString+index);
        var a = "<a href='#' onclick='update(\""+row.name+"\")'>修改</a>";
        var b = "<a href='#' onclick='del(\""+row.name+"\")'>删除</a>";
        return a+" | "+b;
    }
    function update(tsg,th){
        console.log(th)
        alert(tsg)
    }

    function del(tsg){
        //$.messager.alert('警告','警告消息');
        $.messager.confirm('确认','您确认想要删除'+tsg+'记录吗？',function(r){
            if (r){
                alert('确认删除');
            }
        });
        //alert(tsg)
    }

    function sub(){
        alert(1)
    $.messager.progress(); //进度条
    $("#ff").form('submit',{
       url:'${pageContext.request.contextPath}/resource/form',
        onSubmit:function(){
            var idvalidate = $(this).form("validate");
            if (!(idvalidate)){
                    $(this).messager.progress('close');
            }
            return idvalidate;
        },
        success:function(r){
            $.messager.progress('close');
        }
    });
    }
    //下拉框
    $('#ccx').combo({
        url:'${pageContext.request.contextPath}/resource/getcombobox',
        required:true,
        multiple:true
    });

    function reset(){
        $("#ff").form('reset');
    }

        $(function(){
           $("#batchremove").linkbutton({
               onClick:function(){
                   //获取datagrild中被选中的元素
                   var cks = $("#tg").datagrid('getChecked');
                   console.log(cks)
                   var ids = [];
                   //获取对应的id
                   $.each(cks, function (index,row) {
                       ids.push(row.name);
                      alert(row.code);
                   });
                   alert(ids.length);

                    //向后台传参数
                   $.post('${pageContext.request.contextPath}/resource/abc',{ids:ids},function(r){
                   },'json');
               }
           });
          $("#upfile").change(function(){
              alert(1);
              //<div id="imgshow"></div>
              var fileReader = new FileReader();
              fileReader.readAsDataURL(this.files[0]);
              fileReader.onload = function () {
                  var result = this.result;
                  alert(result)
                  $("#showImg").attr("src", result);
              }
          });
        });
</script>
</body>
</html>
