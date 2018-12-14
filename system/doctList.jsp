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
<!-- ueditor -->
<script type="text/javascript" src="${ctx }/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx }/static/ueditor/ueditor.all.js"> </script>
<script type="text/javascript" src="${ctx }/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- 文件上传 -->
<link rel="stylesheet" type="text/css" href="${ctx }/static/upfile/uploadify.css">
<script type="text/javascript" src="${ctx }/static/upfile/jquery.uploadify.min.js"></script>
<script type="text/javascript">
	var url;
	
	//实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
	
	/*打开添加*/
	function openDoctAddDialog() {
		// 清空窗体数据
		$('#fm').form('clear');
		// 清空编辑器
		ue.setContent("");
		$("#dlg").dialog("open").dialog("setTitle","添加医生信息");
		url = "${pageContext.request.contextPath}/system/doDoctSave.do";
	}
	
	/*打开修改*/
	function openDoctModifyDialog() {
		// 获取选中行
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length != 1){
			$.messager.alert("系统提示","请选择一条修改记录，进行修改！");
			return;
		}
		$("#dlg").dialog("open").dialog("setTitle","修改医生信息");
		var row= selectedRows[0];
		$("#fm").form("load",row);
		
		$.post("${pageContext.request.contextPath}/system/findDoctByDoctId.do",{doctId:row.doctId},function(result){
			
			result=eval("("+result+")");
			
			if(result.error){
				$.messager.alert("系统提示", result.error);
			}else{
				// 设置编辑内容
		    	UE.getEditor('editor').setContent(result.doctDesc);
			}
		});
		url = "${pageContext.request.contextPath}/system/doDoctSave.do?doctId="+row.doctId;
	}
	
	/*执行保存*/
	function saveDoct(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功！");
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
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
	function doctDelete() {
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length == 0){
			$.messager.alert("系统提示","请选择一条或多条记录，进行删除！");
			return;
		}
		var strIds=[];
		for(var i = 0; i< selectedRows.length; i++){
			strIds.push(selectedRows[i].doctId);
		}
		// 每个原素增加一个字符
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确定要删除这<font color=red>&nbsp;"+ selectedRows.length +"&nbsp;</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/system/doDoctDelete.do",{ids:ids},function(result){
					if(result.success){
						if(result.exist){
							$.messager.alert("系统提示",result.exist);
						}else{
							$.messager.alert("系统提示","数据已成功删除！");							
						}
						$("#dg").datagrid("reload");
					}else if(result.error){
						$.messager.alert("系统提示", result.error);
					}else{
						$.messager.alert("系统提示","数据删除失败！");
					}
				},"json");
			}
		});
	}
		
	/*关闭对话框*/
	function closeDoctDialog() {
		$('#dlg').dialog("close");
		// 重新加载数据
		$("#dg").datagrid("reload");
	}
	
	$(function() {
		// 图片上传
		$('#image1').uploadify({
			'swf' : '${ctx }/static/upfile/uploadify.swf',
			'uploader' : '${ctx }/system/doUploadImg.do',
			'buttonText' : '上传图标',
			'width' : 120,
			'height' : 30,
			'fileTypeDesc' : '允许上传类型',
			'fileTypeExts' : '*.bmp; *.jpg; *.png; *.jpeg',
			'onUploadSuccess' : function(file, data, response) {
				/*
				result=eval("("+data+")");
				if(result.error){
					$.messager.alert("系统提示", result.error);
				}else{*/
					$("#image_1").attr("src", "${ctx }/" + data);
					$("#doctImg").val(data);
				/*}*/
			}
		});
	});
	
	/*检索*/
	function searchTitle(){
		$("#dg").datagrid("load",{
			"doctTitle":$("#doctTitle").val()
		});
	}
</script>
</head>
<body>
	<!-- 数据显示 -->
	<table id="dg" title="医生管理" class="easyui-datagrid"  fitColumns="true" pagination="true" rownumbers="true" url="${ctx }/system/doctList.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="doctCode"  width="50" align="center">医生编码</th>
				<th field="doctName" width="50" align="center">医生姓名</th>
				<th field="doctImg" width="150" align="center">医生图片</th>
			</tr>
		</thead>
	</table>
	<!-- 工具栏 -->
	<div id="tb">
		<div>
			<a href="javascript:openDoctAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openDoctModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:doctDelete()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	<!-- 添加修改 -->
	<div id="dlg" class="easyui-dialog" style="width: 1000px; height: 620px; padding: 10px 10px;" closed="true" buttons="#dlg-buttons" data-options="maximizable:true">
		<form id="fm" method="post">
			<table cellspacing="8px" style="width: 100%;">
				<tr>
					<td style="width: 10%;">医生编码：</td>
					<td style="width: 90%;">
						<input type="text" id="doctCode" name="doctCode" class="easyui-validatebox" style="width: 200px"required="true"/>
					</td>
				</tr>
				<tr>
					<td style="width: 10%;">医生名称：</td>
					<td style="width: 90%;">
						<input type="text" id="doctTitle" name="doctName" class="easyui-validatebox" style="width: 200px"required="true"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px;">医生图片：</td>
					<td>
						<input type="file" id="image1" name="doctPic"/>
			       		<img id="image_1" style="margin-left: 50px; width: 100px;">
						<input type="hidden" id="doctImg" name="doctImg"/>
					</td>
				</tr>
				<tr>
					<td>医生描述：</td>
					<td>
						<script id="editor" name="doctDesc" type="text/plain" style="width:100%;height:500px;"></script>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 保存 -->
	<div id="dlg-buttons" style="text-align: center; margin-top: 5px;">
		<a href="javascript:saveDoct()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeDoctDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>