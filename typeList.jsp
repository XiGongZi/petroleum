<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ctx }/static/public/js/jquery-1.10.2.min.js"></script>
</head>
<body>
<a href="${ctx }/index.jsp">首页</a>
<hr>
<table id="dataTable" width="100%" border="1">
	<tr>
		<td>ID</td>
		<td>结垢名称</td>
		<td>操作</td>
	</tr>
</table>
</body>
<script type="text/javascript">
	$(function (){
		$.ajax({
			  type: 'POST',
			  url: '${ctx }/typeList.html',
			  data: {},
			  cache: false,
			  success: function(data){
				  // 遍历样品数据
				  $.each(data.typeList, function (key,type){
					  $("#dataTable").append(
							 "<tr>"+
							 "<td>"+type.typeId+"</td>"+
								"<td>"+type.typeName+"</td>"+
								"<td>"+
								"<a href=${ctx }/typeUpdate.jsp?typeId="+type.typeId+">修改</a>  "+
								"</td>"+
							"</tr>"
					  );
				  });
			  },
			  dataType: 'json'
			});
	});
</script>
</html>