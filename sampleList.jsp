<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>超稠油污水结垢预测软件-数据管理</title>
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
                                <svg class="icon mainIcon" aria-hidden="true">
                                    <use xlink:href="#icon-shujuguanli"></use>
                                </svg>
                                <div>数据管理</div>
                                <svg class="icon rightIcon" aria-hidden="true">
                                    <use xlink:href="#icon-arrLeft-fill"></use>
                                </svg>
                            </div>
                        </a>
                        <a href="javaScript:void=0">
                            <div class="leftBarMin">
                                <svg class="icon mainIcon" aria-hidden="true">
                                    <use xlink:href="#icon-xiaoshouqushi"></use>
                                </svg>
                                <div>趋势分析</div>
                                <svg class="icon rightIcon" aria-hidden="true">
                                    <use xlink:href="#icon-arrLeft-fill"></use>
                                </svg>
                            </div>
                        </a>
                        <a href="javaScript:void=0">
                            <div class="leftBarMin">
                                <svg class="icon mainIcon" aria-hidden="true">
                                    <use xlink:href="#icon-yuce"></use>
                                </svg>
                                <div>结垢预测</div>
                                <svg class="icon rightIcon" aria-hidden="true">
                                    <use xlink:href="#icon-arrLeft-fill"></use>
                                </svg>
                            </div>
                        </a>
                        <a href="javaScript:void=0">
                            <div class="leftBarMin">
                                <svg class="icon mainIcon" aria-hidden="true">
                                    <use xlink:href="#icon-baiban"></use>
                                </svg>
                                <div>结垢对策</div>
                                <svg class="icon rightIcon" aria-hidden="true">
                                    <use xlink:href="#icon-arrLeft-fill"></use>
                                </svg>
                            </div>
                        </a>
                        <a href="javaScript:void=0">
                            <div class="leftBarMin">
                                <svg class="icon mainIcon" aria-hidden="true">
                                    <use xlink:href="#icon-baogao"></use>
                                </svg>
                                <div>分析报告</div>
                                <svg class="icon rightIcon" aria-hidden="true">
                                    <use xlink:href="#icon-arrLeft-fill"></use>
                                </svg>
                            </div>
                        </a>
                        <a href="javaScript:void=0">
                            <div class="leftBarMin">
                                <svg class="icon mainIcon" aria-hidden="true">
                                    <use xlink:href="#icon-shezhi1"></use>
                                </svg>
                                <div>高级功能</div>
                                <svg class="icon rightIcon" aria-hidden="true">
                                    <use xlink:href="#icon-arrLeft-fill"></use>
                                </svg>
                            </div>
                        </a>
                        <a href="javaScript:void=0">
                            <div class="leftBarMin">
                                <svg class="icon mainIcon" aria-hidden="true">
                                    <use xlink:href="#icon-shuoming"></use>
                                </svg>
                                <div>软件说明</div>
                                <svg class="icon rightIcon" aria-hidden="true">
                                    <use xlink:href="#icon-arrLeft-fill"></use>
                                </svg>
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
            <div class="titleBar">
            	<div class="floatLeft">
                    <%-- <span>选择取样时间</span> --%>
                    <span>
                        <input id="sampleName"  type="text" onfocus="this.placeholder=''" onblur="this.placeholder='请输入样品别名'"  placeholder="请输入样品别名"/>
                    </span>
                </div>
                <div class="floatLeft">
                    <%-- <span>样品类型/名称</span> --%>
                    <span>
                        <select style="padding: 0 2%;" id="typeId" name="typeId">
                            <option value="0">选择取水样品</option>  
                        </select>
                    </span>
                </div>
                <div class="floatLeft">
                    <%-- <span>选择取样时间</span> --%>
                    <span>
                        <input  id="beginDate"  type="text"  placeholder="点击选择开始取样时间"/>
                    </span>
                </div>
                <div class="floatLeft">
                    <%-- <span>选择取样时间</span> --%>
                    <span>
                        <input id="endDate"  type="text"  placeholder="点击选择结束取样时间"/>
                    </span>
                </div>
                <div class="submit floatLeft">
                    <span>提交</span>
                </div>
                <%-- <div class="clear floatLeft">
                    <span>清空</span>
                </div> --%>
                <div class="clear floatRight moveToAddData">
                    <span >批量导入</span>
                </div>
                <span class="clearBoth"></span>
            </div>
            <!-- title选项卡 结束 -->
            <!-- 图表集合 开始-->
            <div class="charts">
                <!-- 图表容器 -->
                <!-- <div class="space40px"></div> -->
                <p class="tableTitle">各种离子浓度表</p>
                <div id="jsGrid" class="pcCenter"></div>
						<!-- 分页开始 注：分页内容，要和此div，main.css中相关样式，main.js相关js配合使用 20181029-->
						<div id="changePage" class="displayFlex">
							<div class="flex1"></div>
							<div class="title1" pages="1" allPage="1">共有 <b style="color:#A60427">0</b> 个记录  每页显示10条，本页0条 0/0页 </div>
							<div class="turn Left cursoPoin thisMainBG thisMainBGColor">
								上一页
							</div>
							<div class="pages">
                                <!-- checkedStau 为选中样式，点击时先取消所有此css，再给所点击的li加上此样式 -->
								<!-- <li pages="1" class="floatLeft checkedStau">1</li> -->
							</div>
							<div class="turn Right clearBoth cursoPoin thisMainBG thisMainBGColor">
								下一页
							</div>
							<div class="space10px"></div>
							<div class="input cursoPoin">
								<input type="text">
							</div>
                            <div class="space10px"></div>
                            <!-- 跳转按钮 -->
							<div class="jumpToPage button cursoPoin thisMainBG thisMainBGColor">跳转</div>
							<div class="space40px"></div>
                        </div>
                    <!-- 分页结束 -->
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
<script  src="${ctx }/static/js/jquery-1.8.3.min.js"></script>
<script>var ctx ="${ctx}";</script>
<script  src="${ctx }/static/js/iconfont.js"></script>
<script  src="${ctx }/static/js/AnPackage.js"></script> 
<script  src="${ctx }/static/js/leftBar.js"></script>
<script  src="${ctx }/static/js/Chart.bundle.js"></script>
<script  src="${ctx }/static/js/Chart.bundle.min.js"></script>
<script  src="${ctx }/static/js/useCharts.js"></script>
<script>
    //获取 样品类型
    var waterItems = ["选择取水样品"];
    $.ajax({
        type: 'POST',
        url: ctx +'/typeList.html',
        data: {},
        async:false, 
        success: function(data){
            var str01 = ' <option value="0">选择取水样品</option> ';
            // 遍历样品类型
            $.each(data.typeList,function(i,n){
                var a = n.typeName;
                waterItems.push(a);
                str01 += '<option value='+(n.typeId)+'>'+n.typeName+'</option> '
            });
            $("#typeId").html(str01);
            // console.log(waterItems)
        },
        dataType: 'json'
    });
</script>
<script  src="${ctx }/static/js/jsgrid.js"></script>
<script  src="${ctx }/static/js/zane-calendar.min.js"></script>
<script  src="${ctx }/static/js/main.js"></script>
<script>

    $(".submit").click(function(){
        //获取 参数
        var obj = changePageCondition ();
        var str = "?typeId="+obj.typeId+"&beginDate="+obj.beginDate+"&endDate="+obj.endDate;
        // 请求
        $.ajax({
            type: 'POST',
            url: '${ctx }/sampleList.html'+str,
            processData: false,
            success: function(data){
                useTable_addInfo(JSON.parse(data));
            }
        });
    });
    // 时间插件初始化
    zaneDate({
        elem:'#beginDate',
        format:'yyyy-MM-dd',
        zindex:100,
    });
    zaneDate({
        elem:'#endDate',
        format:'yyyy-MM-dd',
        zindex:100,
    });
    $(".moveToAddData").click(function(){
        window.location.href=ctx + "/sampleBacth.jsp"
    });
    
</script>
</html>