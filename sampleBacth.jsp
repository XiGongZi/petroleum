<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>超稠油污水结垢预测软件-批量导入</title>
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
.jsgrid-edit-button {
	margin-right: 0
}
	#QAQ_addData form{
		width:500px;
		height:300px;
		margin:0 auto;
        background:#F0F1F6;
        margin-top:80px;
		border-radius:16px;
		/*#A8DBEE*/
	}	
	#QAQ_addData .title{
		width:100%;
		height:60px;
		/*background:#E27542;*/
		border-bottom:1px solid #3F3F46;
		color:#fff;
		border-radius:16px 16px 0 0;
		text-align:center;
		color:#333;
		line-height:60px;
	}
	#QAQ_addData .body{
		width:100%;
		height:160px;
	}
	#QAQ_addData .body .list{
		width:90%;
		height:40px;
		margin:0 auto;
		border-bottom:1px solid rgba(39,40,34,0.1);
		/*background:rgba(255,255,255,0.5);*/
		line-height:40px;
		text-align:left;
		display:flex;
		color:#ccc;
	}
	#QAQ_addData #list{
		color:#333;
	}

	#QAQ_addData >div:last-child(){
		color:#333;
	}
	#QAQ_addData  .list .name{
		width:100%;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
/*	.body .list .progress{
		flex:3;
	}
	.body .list .upload{
		flex:1;
	}*/
	#QAQ_addData .button{
		width:100%;
		height:80px;
	}
	#QAQ_addData .button .box{
		width:63%;
		height:100%;
		float:right;
	}
	#QAQ_addData .file {
	    position: relative;
	    display: inline-block;
	    background: #D0EEFF;
	    border: 1px solid #99D3F5;
	    border-radius: 4px;
	    padding: 4px 12px;
	    overflow: hidden;
	    color: #1E88C7;
	    text-decoration: none;
	    text-indent: 0;
	    line-height: 20px;
	}
	#QAQ_addData .file input {
	    position: absolute;
	    font-size: 100px;
	    right: 0;
	    top: 0;
	    opacity: 0;
	}
	#QAQ_addData .file:hover {
	    background: #AADFFD;
	    border-color: #78C3F3;
	    color: #004974;
	    text-decoration: none;
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
			<div class="charts" id="QAQ_addData">
				<!-- 图表容器 -->
                        <form action="#" method="post" enctype="multipart/form-data">
                                <div class="title" style="color:#fff;background:#2562b0">批量导入</div>
                                <div class="body">
                                </div>
                                <div class="button">
                                    <div class="box">
											<a  href="${ctx }/dirtWeb/downFile/demo.xlsx" download="超稠油污水结垢预测软件批量导入模版.xlsx" class="file ">下载导入模版
                                                <input type="input">
                                            </a>
                                            <a id="input" href="javascript:;" class="file ">选择文件
                                                <input type="file"  id="uploadFile" name="uploadFile">
                                            </a>
                                            <div class="file">提交文件
                                                <input class="submit" id="submit" type="button" value="提交">
                                            </div>
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
<script src="${ctx }/static/js/AnPackage.js"></script>
<script src="${ctx }/static/js/leftBar.js"></script>
<script src="${ctx }/static/js/Chart.bundle.js"></script>
<script src="${ctx }/static/js/Chart.bundle.min.js"></script>
<script src="${ctx }/static/js/useCharts.js"></script>
<script src="${ctx }/static/js/jsgrid.js"></script>
<script src="${ctx }/static/js/zane-calendar.min.js"></script>
<%-- <script  src="${ctx }/static/js/table_managerList.js"></script> --%>
<script>
	$(function() {
		
		$("#submit").click(function (){
			
			if($(".body").html().length > 33){
				var confirmClick = confirm("请先确认已下载模版");
				if (confirmClick){
								// var formData = new FormData($("#submintForm"));
					// alert(formData);
					var file = $("#uploadFile")[0].files[0];
					var formData = new FormData();   //这个是关键
					formData.append("file", file);// 文件对象     
					$.ajax({
						type: 'POST',
						url: '${ctx }/doSampleBatchSave.do',
						data: formData,
						processData: false,
						contentType: false,
						success: function(data){
							if(data.success){
								alert("已成功导入数据");
								window.location.href="sampleList.jsp";
							}else{
								alert(data.errorMsg);
							}
						},
						dataType: 'json'
						});
				}
			}

		});
    });
function addInfor (name){
    $(".body").append('<div class="list"><div class="name" alt="'+name+'">'+name+'</div></div>')
}
$("input[type=file]").change(function(){
    var str=$(this).val();
    if(str!==""){
        var arr=str.split("\\");
        var file_name=arr[arr.length-1];
        // console.log(file_name) ;
        addInfor(file_name);  
    }

})
</script>
</html>