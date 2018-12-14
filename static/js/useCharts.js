  /*
        传入数据：
                1.图表名称
                2.图表类型
                3.x坐标
                4.单组数据信息
                        1.数据名称
                        2.数据值
                        (3.边框色)
                        (4.背景色)
                5.

  */

// 函数：接收后台传递来的数据并加工传递给chartJs
function setChartsValue (json){
    // 图表默认配置
    var chartConfig = { // 创建一个实例
        options: { // 图表配置项
            scales: { // 刻度
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
            legend: {
                display: true,
                labels: {
                    fontColor: '#fff',//图例字体颜色
                },
            },
        },
    }
    var BGArr = ["#98C7F4","#FBA3B8","#FEE09D","#A3D9D8","#98C7F4","#C0A5FF","#DEDFE2"];
    var BCArr = ["#3291E9","#F7577D","#FCC23D","#47B3B2","#3291E9","#824CFF","#BDBFC4"];
    //设置图标类型，默认线形图
    json.type == undefined ? chartConfig.type = "line" : chartConfig.type = json.type;
    // 设置图标dom节点，默认第一个
    // json.domAdd == undefined ? chartConfig.domAdd = ".myChart:eq(0)":chartConfig.domAdd = json.domAdd;
    // 设置data数据 
    chartConfig.data  =  json.data ;
    // 设置data内多条数据的样式
    $.each(json.data.datasets,function(i,n){//进行数据配置
        // 安全判定，循环使用数组内颜色
        var zhi = BGArr.length - 1;
        zhi <= i? zhi = i%zhi : zhi = i;
        // 单条数据的样式
        // 背景色
            if(json.type == "line"){//如果是线形图则不加背景色
                n.backgroundColor = "rgba(0,0,0,0)";
            }else{
                 n.backgroundColor = BGArr[zhi] ;
            }
            // 边框色
            n.borderColor = BCArr[zhi] ;
    });
    // 设置图表选项
    chartConfig.options.title  =  json.options.title ;
    chartConfig.options.title.fontColor = '#aaa',//标题字体颜色
    setCharts(chartConfig);
}
// 函数：将处理完的数据导入到chartJs中
function setCharts(json){
    var zhi = $(".charts>.canvasMax").length;
    $(".charts").append(`
        <div class="canvasMax left1 first box-shadow floatLeft cursoPoin" hideNum="${zhi}">
            <div style="height:20px;width:2px;opacity: 0;"></div>
            <div class="" style="width:600px;">
                <canvas class="myChart${zhi}"></canvas>
            </div>
            <div style="height:20px;width:2px;opacity: 0;"></div>
            <div class="closeThis closeThis${zhi}" sortNum="${zhi} alt="删除"><svg class="icon rightIcon" aria-hidden="true"> <use
            xlink:href="#icon-guanbi1"></use> </svg></div>
            
        </div>
    `);
    var ctx = $(".myChart"+zhi);
    new Chart(ctx,{ // 创建一个实例
        type: json.type, // 图表类型
        data:json.data,
        options: json.options,
    });
    //添加小红叉事件绑定
    $(".closeThis"+zhi).click(function(){
        // var zhi = confirm("是否删除？");
        // if(zhi){
            // var zhi1 = $(this).attr("sortNum");
            $(".canvasMax:eq("+zhi+")").hide(200);
        // }
    });
}

function deleteRed(){
    $(".closeThis").click(function(){
        // var zhi = confirm("是否删除？");
        // if(zhi){
            var zhi1 = $(this).attr("sortNum");
            $(".canvasMax:eq("+zhi+")").hide(200);
        // }
    });
}