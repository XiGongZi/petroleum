<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>超稠油污水结垢预测软件-结垢对策修改</title>
<link rel="stylesheet" href="${ctx }/static/css/default.css">
<link rel="stylesheet" href="${ctx }/static/css/package.css">
<link rel="stylesheet" href="${ctx }/static/css/chart.css">
<%-- 引入leftBar，内含二级菜单数组、leftBar主函数 --%>
<link rel="stylesheet" href="${ctx }/static/css/leftBar.css">
<link rel="stylesheet" href="${ctx }/static/css/jsgrid.css" />
<link rel="stylesheet" href="${ctx }/static/css/jsgrid-theme.css" />
<link rel="stylesheet" href="${ctx }/static/css/zane-calendar.min.css" />
<link rel="stylesheet" href="${ctx }/static/css/main.css">
<!-- ueditor -->
<script type="text/javascript" src="${ctx}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/static/ueditor/ueditor.all.js"> </script>
<script type="text/javascript" src="${ctx}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<style>
/* body *{box-sizing: border-box;border:1px solid blue} */
.jsgrid-edit-button {
	margin-right: 0
}
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
							<a class="" href="#">${MANAGER.loginNick } (
							<c:if test="${MANAGER.roleId == 1 }">管理员</c:if>
							<c:if test="${MANAGER.roleId == 2 }">组员</c:if>
							) </a>
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
			<!-- title选项卡 结束 -->
			<!-- 图表集合 开始-->
			<div class="charts" id="QAQ_scaleUpdate">
				<!-- 图表容器 -->
				<form id="submitForm"  action="#" method="post">
				<div class="QAQ_new">
					<div class="user" style="display: none;">
						<div class="title">结垢ID</div>
						<div class="input">
							<input class="userName" type="text" id="scaleId" name="scaleId">
						</div>
					</div>
					<div class="user" style="display: none;">
						<div class="title">结垢名称</div>
						<div class="input">
							<input class="userName" type="text" id="scaleName" name="scaleName">
						</div>
					</div>
					<div style="border:2px solid #232533">
						<div class="title" style="line-height:40px;">结垢内容</div>
						<div style="width: 80%; " class="divCenter">
							<script id="editor" name="scaleContent" type="text/plain" style="width:100%;height:500px;"></script>
						</div>
					</div>
					<br>
					<div class="password saveButton ">
						<input id="saveButton" class="cursoPoin" type="button" value="保存">
					</div>
				</div>
				</form>
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
<%-- <script  src="${ctx }/static/js/AnPackage.js"></script>  --%>
<script src="${ctx }/static/js/leftBar.js"></script>
<%-- <script  src="${ctx }/static/js/Chart.bundle.js"></script> --%>
<%-- <script  src="${ctx }/static/js/Chart.bundle.min.js"></script> --%>
<%-- <script  src="${ctx }/static/js/useCharts.js"></script> --%>
<%-- <script  src="${ctx }/static/js/jsgrid.js"></script> --%>
<%-- <script  src="${ctx }/static/js/zane-calendar.min.js"></script> --%>
<%-- <script  src="${ctx }/static/js/table_managerList.js"></script> --%>
<script>
	$(function() {
		//实例化编辑器
	    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	    var ue = UE.getEditor('editor');
		
		$.ajax({
			type : 'POST',
			url : '${ctx }/scale.html',
			data : {
				'scaleId' : '${param.scaleId}'
			},
			cache : false,
			success : function(data) {
				$("#scaleId").val(data.scale.scaleId);
				$("#scaleName").val(data.scale.scaleName);
				// 设置编辑内容
				ue.ready(function() {
					ue.setContent(data.scale.scaleContent);
				});
			},
			dataType : 'json'
		});

		$("#saveButton").click(function() {
			$.ajax({
				type : 'POST',
				url : '${ctx }/scaleSave.html',
				data : $("#submitForm").serialize(),
				processData : false,
				success : function(data) {
					if (data.success) {
						alert("已成功保存数据");
						window.location.href = "scaleList.jsp";
					} else {
						alert(data.errorMsg);
					}
				},
				dataType : 'json'
			});
		});
	});
</script>
</html>