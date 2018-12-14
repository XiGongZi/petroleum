<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>超稠油污水结垢预测软件-预测结果</title>
<link rel="stylesheet" href="${ctx }/static/css/default.css">
<link rel="stylesheet" href="${ctx }/static/css/package.css">
<link rel="stylesheet" href="${ctx }/static/css/chart.css">
<%-- 引入leftBar，内含二级菜单数组、leftBar主函数 --%>
<link rel="stylesheet" href="${ctx }/static/css/leftBar.css">
<link rel="stylesheet" href="${ctx }/static/css/jsgrid.css" />
<link rel="stylesheet" href="${ctx }/static/css/jsgrid-theme.css" />
<link rel="stylesheet" href="${ctx }/static/css/zane-calendar.min.css" />
<link rel="stylesheet" href="${ctx }/static/css/main.css">
<style>
/* body *{box-sizing: border-box;border:1px solid blue} */
</style>
</head>
<body>
	<div class="displayFlex max">
		<!-- 最左边的logo和选项卡 开始 -->
		<div class="leftBar  box-shadow">
			<div class="logo">
				<img src="${ctx }/static/image/LOGO_2.png" alt="">
			</div>
			<div class="leftBB">
				<!-- 选项卡 -->
				<div class="leftBarMax">
					<!-- 一级菜单 -->
					<div class="firstBar">
						<a href="javaScript:void=0">
							<div class="leftBarMin">
								<svg class="icon mainIcon" aria-hidden="true"> <use
									xlink:href="#icon-shujuguanli"></use> </svg>
								<div>数据管理</div>
								<svg class="icon rightIcon" aria-hidden="true"> <use
									xlink:href="#icon-arrLeft-fill"></use> </svg>
							</div>
						</a> <a href="javaScript:void=0">
							<div class="leftBarMin">
								<svg class="icon mainIcon" aria-hidden="true"> <use
									xlink:href="#icon-xiaoshouqushi"></use> </svg>
								<div>趋势分析</div>
								<svg class="icon rightIcon" aria-hidden="true"> <use
									xlink:href="#icon-arrLeft-fill"></use> </svg>
							</div>
						</a> <a href="javaScript:void=0">
							<div class="leftBarMin">
								<svg class="icon mainIcon" aria-hidden="true"> <use
									xlink:href="#icon-yuce"></use> </svg>
								<div>结垢预测</div>
								<svg class="icon rightIcon" aria-hidden="true"> <use
									xlink:href="#icon-arrLeft-fill"></use> </svg>
							</div>
						</a> <a href="javaScript:void=0">
							<div class="leftBarMin">
								<svg class="icon mainIcon" aria-hidden="true"> <use
									xlink:href="#icon-baiban"></use> </svg>
								<div>结垢对策</div>
								<svg class="icon rightIcon" aria-hidden="true"> <use
									xlink:href="#icon-arrLeft-fill"></use> </svg>
							</div>
						</a> <a href="javaScript:void=0">
							<div class="leftBarMin">
								<svg class="icon mainIcon" aria-hidden="true"> <use
									xlink:href="#icon-baogao"></use> </svg>
								<div>分析报告</div>
								<svg class="icon rightIcon" aria-hidden="true"> <use
									xlink:href="#icon-arrLeft-fill"></use> </svg>
							</div>
						</a> <a href="javaScript:void=0">
							<div class="leftBarMin">
								<svg class="icon mainIcon" aria-hidden="true"> <use
									xlink:href="#icon-shezhi1"></use> </svg>
								<div>高级功能</div>
								<svg class="icon rightIcon" aria-hidden="true"> <use
									xlink:href="#icon-arrLeft-fill"></use> </svg>
							</div>
						</a> <a href="javaScript:void=0">
							<div class="leftBarMin">
								<svg class="icon mainIcon" aria-hidden="true"> <use
									xlink:href="#icon-shuoming"></use> </svg>
								<div>软件说明</div>
								<svg class="icon rightIcon" aria-hidden="true"> <use
									xlink:href="#icon-arrLeft-fill"></use> </svg>
							</div>
						</a>
					</div>
					<!-- 二级菜单 -->
					<div class="seconedBar box-shadow">
						<!-- 二级菜单选项 -->
					</div>
				</div>
			</div>
			<div class="foot ">研制单位：辽宁石油化工大学</div>
		</div>
		<!-- 最左边的logo和选项卡 结束 -->
		<!-- 最右边的主体，title和顶部导航栏和图表 开始 -->
		<div class="mainBody flex1">
			<!-- 顶部软件名和登陆信息等 开始-->
			<div class="title">
				<img class="flaotLeft companyName"
					src="${ctx }/static/image/title.png" alt="">
				<!-- 用户信息 开始 -->
				<div class="floatRight otherInfo userMan displayFlex">
					<c:if test="${empty MANAGER }">
						<div>
							<a href="login.jsp">用户登录</a>
						</div>
					</c:if>
					<c:if test="${!empty MANAGER }">
						<div class="flex1">
							<a class="" href="#">${MANAGER.loginNick } ( <c:if
									test="${MANAGER.roleId == 1 }">管理员</c:if> <c:if
									test="${MANAGER.roleId == 2 }">组员</c:if> )
							</a>
						</div>
						<div class="">
							<a class="" href="${ctx }/pwdUpdate.jsp">修改密码</a>
						</div>
						<div class="">
							<a class="" href="${ctx }/doManagerExit.html">退出登录</a>
						</div>
					</c:if>
				</div>
				<!-- 用户信息 结束 -->
				<div class="clearBoth"></div>
			</div>
			<!-- 顶部软件名和登陆信息等 结束 -->
			<!-- title选项卡 开始-->
			<form id="submitForm" action="#" method="post">
				<div class="titleBar">
					<div class="floatLeft">
						<%-- <span>样品类型/名称</span> --%>
						<span> <select style="padding: 0 2%;" id="sampleId"
							name="sampleId">
								<option value="0">选择预测数据</option>
						</select>
						</span>
					</div>
					<div class="floatLeft" style="display: none;">
						<%-- <span>样品类型/名称</span> --%>
						<span> <select style="padding: 0 2%;" id="typeId"
							name="typeId">
								<option value="0">选择取水类型</option>
						</select>
						</span>
					</div>
					<div class="floatLeft">
						<%-- <span>样品类型/名称</span> --%>
						<span> <select style="padding: 0 2%;" id="positionId"
							name="positionId">
								<option value="0">选择预测位置</option>
								<option value="1">注汽锅炉</option>
								<option value="2">注汽管线</option>
								<option value="3">井下</option>
						</select>
						</span>
					</div>
					<div class="floatLeft">
						<%-- <span>样品类型/名称</span> --%>
						<span> <select style="padding: 0 2%;" id="scaleId"
							name="scaleId">
								<option value="0">选择结垢预测模型</option>
								<option value="1">碳酸钙垢预测模型</option>
								<option value="2">硫酸钙垢预测模型</option>
								<option value="3">硅酸盐垢测模型</option>
								<option value="4">腐蚀垢预测模型</option>
						</select>
						</span>
					</div>
					<div class="submit floatLeft">
						<span>开始预测</span>
					</div>
					<span class="clearBoth"></span>
				</div>
			</form>
			<!-- title选项卡 结束 -->
			<!-- 图表集合 开始-->
			<div class="charts" id="QAQ_forecast">
				<!-- 图表容器 -->
				<!-- <div class="space40px"></div> -->
				<p class="tableTitle">预测结果信息</p>
				<div class="divCenter space40px" ></div>
				<div class="divCenter" id="scaleResult"></div>
				<div class="divCenter" id="countResult"></div>
				<div class="divCenter" id="criticalValue"></div>
				<div class="divCenter" id="scaleWay"></div>
			</div>
			<!-- 图表集合 结束 -->
		</div>
		<!-- 最右边的主体，title和顶部导航栏和图表 结束 -->
	</div>
	<%-- 弹出样式 --%>
	<%-- <div class="alert_searchItem">
        <div class=""></div>
    </div> --%>
</body>
<!-- <script src="${ctx }/static/scripts/lib/jquery/jquery-1.8.3.min.js"></script> -->
<script src="${ctx }/static/js/jquery-1.8.3.min.js"></script>
<script>
	var ctx = "${ctx}";
</script>
<script src="${ctx }/static/js/iconfont.js"></script>
<script src="${ctx }/static/js/AnPackage.js"></script>
<script src="${ctx }/static/js/leftBar.js"></script>
<script src="${ctx }/static/js/Chart.bundle.js"></script>
<script src="${ctx }/static/js/Chart.bundle.min.js"></script>
<script src="${ctx }/static/js/useCharts.js"></script>
<script>
	//获取 样品类型
	var waterItems = [];
	$.ajax({
		type : 'POST',
		url : ctx + '/typeList.html',
		data : {},
		async : false,
		success : function(data) {
			var str01 = ' <option value="0">样品类型/名称</option> ';
			// 遍历样品类型
			$.each(data.typeList, function(i, n) {
				var a = n.typeName;
				waterItems.push(a);
				str01 += '<option value=' + (n.typeId) + '>' + n.typeName
						+ '</option> '
			});
			$("#typeId").html(str01);
			// console.log(waterItems)
		},
		dataType : 'json'
	});
	$.ajax({
		type : 'POST',
		url : ctx + '/sampleList.do',
		data : {},
		async : false,
		success : function(data) {
			var str01 = ' <option value="0">选择预测记录</option> ';
			// 遍历样品类型
			$.each(data.sampleList, function(i, n) {
				var a = n.sampleName;
				waterItems.push(a);
				str01 += '<option value=' + (n.sampleId) + '>' + "ID:"+n.sampleId+"-->" +n.sampleName
						+ '</option> '
			});
			$("#sampleId").html(str01);
			// console.log(waterItems)
		},
		dataType : 'json'
	});
</script>
<script src="${ctx }/static/js/jsgrid.js"></script>
<script src="${ctx }/static/js/zane-calendar.min.js"></script>
<script src="${ctx }/static/js/table_dataSelect.js"></script>
<script>
	$(".submit").click(function() {
		// 请求
		$.ajax({
			type : 'POST',
			url : '${ctx }/forecastResult.html',
			data : $("#submitForm").serialize(),
			processData : false,
			success : function(data) {
				console.log(data);
				//alert(data.scaleModelList[0].isScale);
				 

				if(data.scaleModelList[0].isScale == 0){
					$("#scaleResult").text("无结垢趋势");
				}else{
					$("#scaleResult").text("有结垢趋势");
					if($("#scaleId").val() == 1){
						$("#scaleWay").html('<a href="${ctx}/scale.jsp?scaleId=1" target="_blank">碳酸钙垢结垢对策</a>');
					}else if($("#scaleId").val() == 2){
						$("#scaleWay").html('<a href="${ctx}/scale.jsp?scaleId=2" target="_blank">硫酸钙垢结垢对策</a>');
					}else if($("#scaleId").val() == 3){
						$("#scaleWay").html('<a href="${ctx}/scale.jsp?scaleId=3" target="_blank">硅酸盐垢结垢对策</a>');
					}else if($("#scaleId").val() == 4){
						$("#scaleWay").html('<a href="${ctx}/scale.jsp?scaleId=4" target="_blank">腐蚀垢结垢对策</a>');
					}else {
						$("#scaleWay").text("暂无结垢对策");
					}
				}
				$("#countResult").text("结算结果为："+ data.scaleModelList[0].countResult);
				$("#criticalValue").text("临界值为："+ data.scaleModelList[0].criticalValue);
			},
        dataType: 'json'
		});
	});
</script>
</html>