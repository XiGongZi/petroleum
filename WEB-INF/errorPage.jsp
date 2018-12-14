
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>医大四院网上挂号</title>
<link rel="stylesheet" href="${ctx }/static/css/default.css">
<link rel="stylesheet" href="${ctx }/static/css/login.css">
<link rel="stylesheet" href="${ctx }/static/css/yidasi.css">
<script type="text/javascript" src="${ctx }/static/js/jquery-1.11.0.min.js"></script>
</head>
<body>
	<div class="MaxAn" warn="topNav"></div>
	<div class="MaxAn" warn="patientIDCard">
		<div class="patientIDCardBG">
			<div class="patientIDCardIMG">
				<div><img src="${ctx }/static/image/cry.png" alt=""></div>
				<div class="title"> 访问出现异常了，请联系管理员！</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx }/static/js/default.js"></script>
<script type="text/javascript" src="${ctx }/static/js/package.js"></script>
<script type="text/javascript" src="${ctx }/static/js/yidasi.js"></script>
</html>