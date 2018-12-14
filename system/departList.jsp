<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站后台管理</title>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx }/static/backstage/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx }/static/backstage/jquery-easyui-1.3.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${ctx }/static/backstage/jquery-easyui-1.3.3/demo/demo.css">
<script type="text/javascript" src="${ctx }/static/backstage/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/static/backstage/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx }/static/backstage/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script depart="text/javascript">
	
	$(function (){
		$('#dg').datagrid({
	        url: "${ctx }/system/departList.do", //获取数据后台接口
	        method:"GET",
	        contentType: "application/json",
	        rownumbers: true, //行号
	        pagination: true, //分页控件
	        pageSize: 10,
	        pageList: [10, 20, 30, 50],
	        striped:true,
	        fitColumns:true,
	        fit:true,
	        loadMsg:"正在努力加载数据，表格渲染中...",
	        onLoadSuccess: function (data) {
	        	// 加载数据为0时
	            if (data.total == 0){
	            	// 合并最好
	            	$.messager.alert('系统提示', '当前暂无数据！', "info");
	            	//隐藏分页导航条
					$(this).closest('div.datagrid-wrap').find('div.datagrid-pager').hide();
	            }
	            if (data.total == -1){
	            	$.messager.alert('系统提示', '您已经超时，请登录后再来操作!', "info", function () {
	                    window.location.href="login.jsp";
	                });
	            }
	        },
	    }, "json");
	});

	var url;
	
	/*打开添加*/
	function openDepartAddDialog() {
		// 清空数据，以便下次使用
		resetValue();
		document.getElementsByName("isNext")[0].checked = true;
		$("#dlg").dialog("open").dialog("setTitle","添加科室");
		url = "${ctx }/system/doDepartSave.do";
		$('#departPid').combotree({
			url:"${ctx }/system/departList.do"
		});
	}
	
	/*打开修改*/
	function openDepartModifyDialog() {
		$('#departPid').combotree({
			url:"${ctx }/system/departList.do"
		});
		// 获取选中行
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length != 1){
			$.messager.alert("系统提示","请选择一条修改记录，进行修改！");
			return;
		}
		$("#dlg").dialog("open").dialog("setTitle","修改科室");
		var row= selectedRows[0];
		
		$("#departName").val(row.text);
		$('#departPid').combotree('setValue', row.pid);
		
		$("#fm").form("load",row);
		url = "${ctx }/system/doDepartSave.do?departId="+row.id;
	}
	
	/*执行保存*/
	function saveDepart(){
		
		var val = $('#departPid').combogrid('getValues');
		
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功！");
					// 清空数据，以便下次使用
					resetValue();
					$("#dlg").dialog("close");
					$('#dg').treegrid('reload');
				}else if(result.error){
					$.messager.alert("系统提示", result.error);
				}else{
					$.messager.alert("系统提示","保存失败！");
					return;
				}
			}
		});

	}
	
	/*执行删除*/
	function deleteDepart() {
		
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length == 0){
			$.messager.alert("系统提示","请选择一条或多条记录，进行删除！");
			return;
		}
		
		var row= selectedRows[0];
		
		$.messager.confirm("系统提示","您确定要删除科室名称为<font color=red>&nbsp;"+ row.text +"&nbsp;</font>的数据吗？",function(r){
			if(r){
				$.post("${ctx }/system/doDepartDelete.do",{departId:row.id},function(result){
					if(result.success){
						if(result.exist){
							$.messager.alert("系统提示",result.exist);
						}else{
							$.messager.alert("系统提示","数据已成功删除！");							
						}
						$("#dg").treegrid("reload");
					}else if(result.error){
						$.messager.alert("系统提示", result.error);
					}else{
						$.messager.alert("系统提示","数据删除失败！");
					}
				},"json");
			}
		});
	}
	
	/*格式化状态*/
	function formatStatus(val, row){
		if(val == 1){
			return "<span style=\"color:green;\">是</span>";
		}else {
			return "<span style=\"color:red;\">否</span>";	
		}
	}
	
	/*清空数据*/
	function resetValue() {
		$('#departName').val("");
		$('#departPid').combotree('setValue', "根分类");
	}
	
	/*关闭对话框*/
	function closeDepartDialog() {
		$('#dlg').dialog("close");
		// 重新加载数据
		$("#dg").treegrid("reload");
	}
</script>
</head>
<body>
	<!-- 数据显示 -->
	<table id="dg" title="类型列表" class="easyui-treegrid" data-options="url: '${ctx }/system/departList.do',
				rownumbers: true,
				fit: true,//自适应大小
				nowrap: true,//数据长度超出列宽时将会自动截取。
				rownumbers:true,//行号
				fitColumns:true,//自动使列适应表格宽度以防止出现水平滚动。
				idField: 'id',
				treeField: 'text'
			"  toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'id'" width="50">ID</th>
				<th data-options="field:'text'" width="100">名称</th>
				<th data-options="field:'pid'" width="20">父级ID</th>
				<th data-options="field:'isNext'" width="50" formatter="formatStatus">是否有子分类</th>
				<th data-options="field:'desc'" width="150">描述</th>
			</tr>
		</thead>
	</table>
	<!-- 工具栏 -->
	<div id="tb">
		<div>
			<a href="javascript:openDepartAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openDepartModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteDepart()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	<!-- 添加修改 -->
	<div id="dlg" class="easyui-dialog" style="width: 700px;height: 350px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>科室名称：</td>
					<td>
						<input type="text" id="departName" name="departName" class="easyui-validatebox" required="true" style="width: 250px"/>
					</td>
				</tr>
				<tr>
					<td>科室编号：</td>
					<td>
						<input type="text" id="departCode" name="departCode" class="easyui-validatebox" required="true" style="width: 250px"/>
					</td>
				</tr>
				<tr>
					<td>父级科室：</td>
					<td>
						<select class="easyui-combotree" id="departPid" name="departPid" style="width:256px;"/>
					</td>
				</tr>
				<tr>
					<td>是否有下级分类：</td>
					<td>
						<input type="radio" name="isNext" value="0" />否
		                <input type="radio" name="isNext" value="1" />是
					</td>
				</tr>
				<tr>
					<td>科室描述：</td>
					<td>
						<input type="text" id="departDesc" name="departDesc" class="easyui-validatebox" required="true" style="width: 250px"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 保存关闭 -->
	<div id="dlg-buttons">
		<a href="javascript:saveDepart()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeDepartDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>