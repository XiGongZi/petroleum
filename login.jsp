<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx }/static/css/default.css">
<link rel="stylesheet" href="${ctx }/static/css/package.css">
<link rel="stylesheet" href="${ctx }/static/css/main.css">
<title>超稠油污水结垢预测软件-登录页</title>
<script type="text/javascript" src="${ctx }/static/public/js/jquery-1.10.2.min.js"></script>
</head>
<style>
.imgmax {
	width: 100%;
	height: 100vh;
	/*background:url('./static/image/BG.jpg') 0 0 no-repeat;*/
	/*margin:0px auto;*/
}

.img {
	position: relative;
	/*width:100%;*/
	width: 638px;
	height: 386px;
	margin: 0 auto;
}

.floatImg img {
	width: 638px;
	height: 386px;
	vertical-align: bottom;
	/*取消图片之间间距 */
}

.floatImg {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	z-index: 0;
}

.floatImg img {
	width: 100%;
	height: 100%;
}
/* body *{box-sizing: border-box;border:1px solid blue} */
</style>
<body>
	<div class="floatImg">
		<img src="${ctx }/static/image/BG.jpg" alt="">
	</div>
	<div class="imgmax">
		<div class="img" id="imgmax">
			<img class="" src="${ctx }/static/image/login.png" alt=""
				id="imgmax2">
		</div>
	</div>
	<form id="submitForm_1" action="#" method="post">
		<table>
			<tr>
				<td>
					<input type="text" id="loginId" name="loginId" placeholder="请输入登录账号...">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="loginPwd" name="loginPwd" placeholder="请输入登录密码...">
				</td>
			</tr>
			<tr>
				<td class="displayFlex">
					<input class="" style="width: 160px;" type="text" id="loginCode" name="loginCode" placeholder="验证码">
					<img id="imgCode" style="margin-left: 20px; border-radius: 8px;" title="点击图片刷新" src="${ctx }/code.html" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="cursoPoin" type="button" id="loginButton" value="登录">
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	$(function() {
		// 获取验证码
		$("#imgCode").click(function() {
			$("#imgCode").attr('src', $("#imgCode")[0].src + '?');
		});
		$("#loginButton").click(function() {
			$.ajax({
				type : 'POST',
				url : '${ctx }/login.html',
				data : $("#submitForm_1").serialize(),
				processData : false,
				success : function(data) {
					if (data.success) {
						alert("您已成功登录！");
						window.location.href = "index.jsp";
					} else {
						alert(data.errorMsg);
					}
				},
				dataType : 'json'
			});
		});
	});
	function cen() {
		var zhi1 = $(".imgmax").height();
		var zhi2 = $(".img").height();
		var zhi3 = (zhi1 - zhi2) / 2;
		if (zhi3 > 0) {
			$(".img").css("top", zhi3);
		}
	}
	cen();
	$(window).resize(function() {
		cen();
		calcSubForm();
	});
	calcSubForm()
	function calcSubForm() {
		var zhi1 = $(".imgmax").height();
		var zhi2 = $(".img").height();
		var zhi3 = (zhi1 - zhi2) / 2 + 145;//顶部
		var zhi4 = $(".imgmax").width();
		var zhi5 = $(".img").width();
		var zhi6 = (zhi4 - zhi5) / 2 + 452;
		$("#submitForm_1").css({
			"top" : zhi3,
			"left" : zhi6
		});
	}
</script>
</html>