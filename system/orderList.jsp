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
	function formatNoon(val, row){
		if(val == 1){
			return "<span style=\"color:black;\">上午</span>";
		}else if(val == 2){
			return "<span style=\"color:black;\">下午</span>";	
		}else if(val == 3){
			return "<span style=\"color:black;\">上半夜</span>";	
		}else if(val == 4){
			return "<span style=\"color:black;\">下半夜</span>";	
		}else{
			return "<span style=\"color:red;\">出现错误</span>";
		}
	}

	/*格式化状态*/
	function formatStatus(val, row){
		if(val == 1){
			return "<span style=\"color:green;\">已支付</span>";
		}else if(val == 0){
			return "<span style=\"color:red;\">未支付</span>";	
		}else{
			return "<span style=\"color:black;\">已关闭</span>"
		}
	}
</script>
</head>
<body>
	<!-- 数据显示 -->
	<table id="dg" title="订单管理" class="easyui-datagrid"  fitColumns="true" pagination="true" rownumbers="true" url="${ctx }/system/orderList.do" fit="true">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="orderNumber"  width="80" align="center">订单号</th>
				<th field="seeDate"  width="30" align="center">看诊时间</th>
				<th field="deptName" width="80" align="center">科室</th>
				<th field="doctName" width="50" align="center">医生</th>
				<th field="totalMoney" width="20" align="center">费用</th>
				<th field="userName" width="50" align="center">挂号人</th>
				<th field="statusId" width="50" align="center" formatter="formatStatus">当前状态</th>
			</tr>
		</thead>
	</table>
</body>
</html>