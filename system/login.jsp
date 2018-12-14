<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站后台管理系统</title>
<link rel="stylesheet" type="text/css" href="${ctx }/static/backstage/css/style.css" />
<script src="${ctx }/static/public/js/jquery-1.10.2.min.js"></script>
<script src="${ctx }/static/backstage/js/Particleground.js"></script>
<style>
body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script>
	$(document).ready(function() {
		//粒子背景特效
		$('body').particleground({
			dotColor : '#5cbdaa',
			lineColor : '#5cbdaa'
		});
		// 获取验证码
		$("#imgCode").click(function() {
			$("#imgCode").attr('src', $("#imgCode")[0].src + '?');
		});
	});
	if(top != window){
		top.location.href = window.location.href;
	}
</script>
</head>
<body>
	<form action="${ctx }/system/login.do" method="post">
	<dl class="admin_login">
		<dt>
			<strong>站点后台管理系统</strong> <em>Management System</em>
		</dt>
		<c:if test="${!empty errorMsg }">
		<dd style="text-align: center; color: red;" >
			${errorMsg }
		</dd>
		</c:if>
		<dd class="user_icon">
			<input type="text" placeholder="账号" class="login_txtbx" name="loginId" value="${manager.loginId }"/>
		</dd>
		<dd class="pwd_icon">
			<input type="password" placeholder="密码" class="login_txtbx" name="loginPwd" value="${manager.loginPwd }"/>
		</dd>
		<dd class="val_icon">
			<div class="checkcode">
				<input type="text" id="imgCode" name="loginCode" placeholder="验证码" class="login_txtbx"> 
			</div>
			<img id="imgCode" title="点击图片刷新" src="${ctx }/system/code.do" style="cursor: pointer; margin-left: 10px;"/>
		</dd>
		<dd>
			<input type="submit" value="立即登陆" class="submit_btn" />
		</dd>
		<dd>
			<p>© 2017-2020 沈阳一网科技 版权所有</p>
		</dd>
	</dl>
	</form>
</body>
</html>