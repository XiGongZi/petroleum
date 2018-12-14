// 

var dataLeftBarJson = [
    [
        {
            "name":"数据查询",
            "href":ctx+"/sampleList.jsp"
        }
    ]
    ,[
        {
            "name":"时间序列",
            "href":ctx+"/dateSort.jsp"
        }
        ,{
            "name":"单元序列",
            "href":ctx+"/unitSort.jsp"
        }
        ,{
            "name":"结垢趋向",
            "href":ctx+"/sacleTrend.jsp"
        }
    ]
    ,[
        {
            "name":"数据选取",
            "href":ctx+"/dataSelect.jsp"
        }
        ,{
            "name":"位置选择",
            "href":ctx+"/positionSelect.jsp"
        }
        ,{
            "name":"预测结果",
            "href":ctx+"/forecastResult.jsp"
         }
    ]
    ,[
        {
            "name":"结构对策",
            "href":ctx+"/scaleList.jsp"
        }
    ]
    ,[
        {
            "name":"打印当前页面",
            "href":"#",
            "onClickE":"0"


        }
    ]
    ,[
		{
		    "name":"用户管理",
		    "href":ctx+"/managerList.jsp"
		 }
		,
        {
            "name":"模型参数",
            "href":ctx+"/modelList.jsp"
         }
        ,{
            "name":"临界数值",
            "href":ctx+"/criticalList.jsp"
        }
    ]
    ,[
		{
		    "name":"软件介绍",
		    "href":ctx+"/software.jsp"
		 }
    ]
];
// 左边两级选项卡滑入滑出设置
$(".leftBarMax .firstBar a").mouseover(function(e){
    var zhi = $(this).index();
    var zhi1 = (zhi*61 + 122)+"px";
    var str = "";
    $(this).find(".leftBarMin").addClass("leftBarMin_hover");
    if(dataLeftBarJson[zhi].length > 0 ) {//鼠标滑过时，若有二级菜单则
        $(this).find(".leftBarMin").addClass("hoverRightIcon");
        $(".leftBarMax .seconedBar").addClass("box-shadow");
        $.each(dataLeftBarJson[zhi],function(i,n){
            str += `<a href="${n.href}" s="sa"  status="${n.onClickE}" ><div   zhi="${zhi}" >${n.name}</div></a>`;
        });
        $(".leftBarMax .seconedBar").html(str);
//        $(".leftBarMax .seconedBar>a[status='0']").jqprint()
        $(".leftBarMax .seconedBar").css("top",zhi1);    
        $(".leftBarMax .seconedBar").show();  
    }else{
        $(".leftBarMax .seconedBar").removeClass("box-shadow");
        $(".leftBarMax .seconedBar").hide();
    };
});
$(".leftBarMax .firstBar a").mouseout(function(e){
    $(".leftBarMax .seconedBar").hide();
    $(this).find(".leftBarMin").removeClass("leftBarMin_hover");
    $(this).find(".leftBarMin").removeClass("hoverRightIcon");
});
$(".charts").attr("id","charts");
function hu() {
    // var confirmPrint = confirm("请点击需要打印的图表！");
    // if(confirmPrint){
    //     print();
    // }
    // alert(1);
    var judgeJsgrid = $(".charts").find("#jsGrid").length;
    var canvasMax = $(".charts").find(".canvasMax").length;
    if(judgeJsgrid == 1){//判断是否是表格
        //表格暂时不可以用捕获数据再填充的方法（要每个表单独配置）
        $(".mainBody>*").hide();
        $(".mainBody .charts").show();
        $(".leftBar").hide();
        $("#changePage").hide();
        $(".jsgrid-cell").css({"font-size":"11px"});
        $(".jsgrid-header-cell").css({"font-size":"12px"});
        window.print();
        $(".jsgrid-cell").css({"font-size":"16px"});
        $(".jsgrid-header-cell").css({"font-size":"16px"});
        $("#printFin").remove();
        $("#changePage").show();
        $(".mainBody>*").show();
        $(".leftBar").show();
    }else if(canvasMax > 0){//判断是否是图例
        $(".mainBody>*").hide();
        $(".mainBody .charts").show();
        $(".leftBar").hide();
        $("#changePage").hide();
        html2canvas(document.getElementById("charts")).then(function(canvas) {
            canvas.id="printFin";
            document.body.appendChild(canvas);
            $(".mainBody .charts").hide();
            window.print();
            $("#printFin").remove();
            $("#changePage").show();
            $(".mainBody>*").show();
            $(".leftBar").show();
        });
    }
    function hideTabelFinal(){
        $(".jsgrid-table>tbody").each(function(i,n){
            let zhi = n.length
            $(this).find("td").eq(zhi).hide();
        });
    }
    hideTabelFinal()
}
$(".leftBarMax .seconedBar").mouseover(function (e) {
    var zhi = $(e.target).attr("zhi");
    $(".leftBarMax .seconedBar").show();
    $(".leftBarMax .firstBar a").eq(zhi).find(".leftBarMin").addClass("leftBarMin_hover");
    $(".leftBarMax .firstBar a").eq(zhi).find(".leftBarMin").removeClass("hoverRightIcon");
    if ($(e.target).parent("a").attr("status") === "0") {//检测到此处status为undefined
        //动态绑定
        $(e.target).parent("a").attr("onclick", "hu()");
    }
    $(e.target).addClass("barDiv_hover");
});
$(".leftBarMax .seconedBar").mouseout(function(e){
    var zhi = $(e.target).attr("zhi");
    $(".leftBarMax .seconedBar").hide();
    $(".leftBarMax .firstBar a").eq(zhi).find(".leftBarMin").removeClass("leftBarMin_hover");
    $(".leftBarMax .firstBar a").eq(zhi).find(".leftBarMin").removeClass("hoverRightIcon");
    $(e.target).removeClass("barDiv_hover");
});
$(".logo").click(function(){
    window.location.href= ctx + "/index.jsp";
});
$("#titleBar2").click(function(e){
    var zhi = $(e.target).find("label").click();
});
$("#titleBar3").click(function(e){
    var zhi = $(e.target).find("label").click();
});
$("head").append(`<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon">`);
// $("head").append(`<script type="text/javascript" src="${ctx }/static/js/jqprint.js"></script>`);
loadScript(`${ctx }/static/js/html2canvas.js`);
function loadScript(url) { //动态加载js
    var script;
    script = document.createElement("script");
    script.src = url;
    document.body.appendChild(script);
}
