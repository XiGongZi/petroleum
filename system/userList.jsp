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
	/*格式化状态*/
	function formatSex(val, row){
		if(val == 1){
			return "<span style=\"color:green;\">男</span>";
		}else {
			return "<span style=\"color:red;\">女</span>";	
		}
	}

	$(function (){
		$('#dg').datagrid({
	        url: "${ctx }/system/userList.do", //获取数据后台接口
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
</script>
</head>
<body>
	<!-- 数据显示 -->
	<table id="dg" title="用户管理">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="patientId"  width="80" align="center">门诊号</th>
				<th field="thirdWeChat" width="80" align="center">微信号</th>
				<th field="phoneNumber" width="50" align="center">手机号</th>
				<th field="userName" width="30" align="center">姓名</th>
				<th field="userGender" width="20" align="center" formatter="formatSex">性别</th>
				<th field="papersNumber" width="80" align="center">身份证号</th>
				<th field="birthDay" width="80" align="center">出生日期</th>
				<th field="addDate" width="80" align="center">注册时间</th>
			</tr>
		</thead>
	</table>
</body>
</html>