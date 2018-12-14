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

<script type="text/javascript">
	
	var url;
	
	function openTab(text,url){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				closable:true,
				content:content
			});
		}
	}
	
	function openPasswordModifyDialog(){
		$("#dlg").dialog("open").dialog("setTitle","修改密码");
		url="${ctx}/system/doManagerPwdModify.do";
	}
	
	function modifyPassword(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				var newPassword1=$("#newPassword1").val();
				var newPassword2=$("#newPassword2").val();
				if(!$(this).form("validate")){
					return false;
				}
				if(newPassword1 != newPassword2){
					$.messager.alert("系统提示","确认密码输入错误！");
					return false;
				}
				return true;
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","密码修改成功,下一次登录失效！");
					resetValue();
					$("#dlg").dialog("close");
				}else{
					$.messager.alert("系统提示","密码修改失败！");
					return;
				}
			}
		});
	}
	
	function closePasswordModifyDialog(){
		resetValue();
		$("#dlg").dialog("close");
	}
	
	function resetValue(){
		$("#newPassword1").val("");
		$("#newPassword2").val("");
	}
	
	function refreshSystem(){
		$.post("${ctx}/system/doRefreshSystem.do",{},function(result){
			if(result.loginStatus == false){
				$.messager.alert('系统提示', '您已经超时，请登录后再来操作!', "info", function () {
                    window.location.href="login.jsp";
                });
			}else{
				if(result.success){
					$.messager.alert("系统提示","已成功刷新系统缓存！");
				}else{
					$.messager.alert("系统提示","刷新系统缓存失败！");
				}
			}
		},"json");
	}
	
	function logout(){
		$.messager.confirm("系统提示","您确定要退出系统吗?",function(r){
			if(r){
				$.post("${ctx}/system/doManagerExit.do",{},function(result){
					if(result.loginStatus == false){
						$.messager.alert('系统提示', '您已经超时，请登录后再来操作！', "info", function () {
		                    window.location.href="login.jsp";
		                });
					}else{
						if(result.success){
							$.messager.alert('系统提示', '您已经成功退出系统！', "info", function () {
			                    window.location.href="login.jsp";
			                });
						}
					}
				},"json");
			}
		});
	}

</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-home'">
				<div align="center" style="padding-top: 100px"><font color="red" size="10">欢迎使用</font></div>
			</div>
		</div>
	</div>
	<div data-options="region:'north'" style="height:50px; line-height: 50px;"><span style="font-weight: bold; font-size: 16px; margin-left: 3%;">网站后台管理</span><span style="float: right; margin-right: 1%;">登录账号：${MANAGER.loginNick }</span></div>
	<div data-options="region:'south',split:true" style="text-align: center; line-height: 40px;">
		Copyright © 2017-2020 沈阳一网科技 版权所有
	</div>
	<div data-options="region:'south',split:true" style="height:50px;"></div>
	<div data-options="region:'west',split:true" title="菜单" style="width:190px;">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="用户管理" data-options="selected:true" style="padding:10px;">
				<a href="javascript:openTab('用户列表','hospitalWeb/system/userList.jsp')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 140px">用户列表</a>
			</div>
			<div title="科室信息" style="padding:10px;">
				<a href="javascript:openTab('科室列表','hospitalWeb/system/departList.jsp')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 140px">科室列表</a>
			</div>
			<div title="医生信息" style="padding:10px;">
				<a href="javascript:openTab('医生列表','hospitalWeb/system/doctList.jsp')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 140px">医生列表</a>
			</div>
			<div title="订单信息" style="padding:10px;">
				<a href="javascript:openTab('订单列表','hospitalWeb/system/orderList.jsp')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 140px">订单列表</a>
			</div>
			<div title="系统管理" style="padding:10px">
				<a href="javascript:openPasswordModifyDialog()"  class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 140px">修改密码</a>
				<a href="javascript:refreshSystem()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'" style="width: 140px;">刷新系统缓存</a>
				<a href="javascript:logout()"  class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 140px">退出系统</a>
			</div>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px;height: 200px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>用户名：</td>
				<td>
					<input type="text" id="loginId" name="loginId" value="${MANAGER.loginId }" readonly="readonly" style="width: 200px"/>
				</td>
			</tr>
			<tr>
				<td>新密码：</td>
				<td>
					<input type="password" id="newPassword1" name="newPassword1" class="easyui-validatebox" required="true" style="width: 200px"/>
				</td>
			</tr>
			<tr>
				<td>确认新密码：</td>
				<td>
					<input type="password" id="newPassword2" name="newPassword2" class="easyui-validatebox" required="true" style="width: 200px"/>
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- 工具栏 -->
<div id="dlg-buttons">
	<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>