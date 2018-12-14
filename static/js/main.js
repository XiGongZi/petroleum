
// 关于顶部选项卡
// table
function setTableEvents(){
    $(".trTitleButton").click(function(){
        var zhi = $(this).attr("zhi");
        if(zhi == 0){
            $(this).attr("zhi","1");
            $("#jsGrid").jsGrid({
                eidting:true,
            });
        }else{
            $(this).attr("zhi","0");
            $("#jsGrid").jsGrid({
                eidting:true
            });
        }
    });
}
//changePages   分页JS
//处理 请求
// 分页
changePageJSPost(1,changePageCondition ());
function changePageCondition (){
    var obj = {};
    obj.typeId = $("#typeId option:selected").val();
    obj.beginDate = $("#beginDate").val();
    obj.endDate = $("#endDate").val();
    obj.sampleName = $("#sampleName").val();
    return obj;
}
function changePageJSPost(page,condi){
    // 如何处理请求？  参数：1、页数，2、数据类型
        // 1.处理默认数据
        // 2.根据参数请求特定数据
        $.ajax({
            type: 'POST',
            url: ctx + '/sampleList.html',
            data: {'page':page,"typeId":condi.typeId,"beginDate":condi.beginDate,"endDate":condi.endDate,"sampleName":condi.sampleName},
            cache: false,
            success: function(data){
                // 获取最大页
                maxPage = data.maxPage;
                // alert(maxPage);
                // 遍历样品数据
                useTable_addInfo(JSON.parse(data));
            }
        });
}
// 增加单条数据
// addInfoJSPost()


function judgeDataWhetherLegal(obj){//提交数据验证
    let num = 0;
    let sampleName2 = obj.sampleName;
    $.each(obj,function(i,n){//判断空字符串个数
        if(n == ""){
            num ++;
        }
    });
    if(num >1){
        alert("所有数据都不能为空！");
        return false;
    }else if(sampleName2.substring(0,2) != "样品" || sampleName2.substring(2,sampleName2.length) != parseInt(sampleName2.substring(2,sampleName2.length))){
        //判断样品名格式是否正确
        alert("样品名称格式必须为 “样品” + 数字编号 ！");
        return false;
    }else if(obj.typeName == 0){
        //取水类型是否选中
        alert("必须选择一个取水类型！");
        return false;
    }else{
       
        return true;
    }

}
function addInfoJSPost(json){
    // 如何处理请求？  参数：1、页数，2、数据类型
        // 1.处理默认数据
        // 2.根据参数请求特定数据
        if ( judgeDataWhetherLegal(json)){
            var str = "sampleName=" + json.sampleName 
            + "&typeId=" + json.typeName 
            // + "$sampleId=" + json.sampleId
            + "&sampleDate=" + json.sampleDate
            + "&sampleV1=" + json.sampleV1
            + "&sampleV2=" + json.sampleV2
            + "&sampleV3=" + json.sampleV3
            + "&sampleV4=" + json.sampleV4
            + "&sampleV5=" + json.sampleV5
            + "&sampleV6=" + json.sampleV6
            + "&sampleV7=" + json.sampleV7
            + "&sampleV8=" + json.sampleV8
            + "&sampleV9=" + json.sampleV9
            + "&sampleV10=" + json.sampleV10
            + "&sampleV12=" + json.sampleV12
            + "&sampleV18=" + json.sampleV18;
            $.ajax({
                type: 'POST',
                url: ctx + '/doSampleSave.do',
                data:str,
                processData: false,
                success: function(data){
                    if(data.success){
                        alert("已成功保存数据");
                        changePageJSPost(1,changePageCondition ());
                        //  window.location.href="sampleList.jsp";
                        // window.location.reload();
                    }else{
                    }
                },
                dataType:"json"
            });
        }

}
// 修改单条数据
function changeInfoJSPost(json){
    // 如何处理请求？  参数：1、页数，2、数据类型
        // 1.处理默认数据
        // 2.根据参数请求特定数据
        if(judgeDataWhetherLegal(json) == true){
            var str = "sampleName=" + json.sampleName 
            + "&typeId=" + json.typeName 
            + "&sampleId=" + json.sampleId
            + "&sampleDate=" + json.sampleDate
            + "&sampleV1=" + json.sampleV1
            + "&sampleV2=" + json.sampleV2
            + "&sampleV3=" + json.sampleV3
            + "&sampleV4=" + json.sampleV4
            + "&sampleV5=" + json.sampleV5
            + "&sampleV6=" + json.sampleV6
            + "&sampleV7=" + json.sampleV7
            + "&sampleV8=" + json.sampleV8
            + "&sampleV9=" + json.sampleV9
            + "&sampleV10=" + json.sampleV10
            + "&sampleV12=" + json.sampleV12
            + "&sampleV18=" + json.sampleV18;
            console.log(str)
            $.ajax({
                type: 'POST',
                url: ctx + '/doSampleSave.do',
                data:str,
                processData: false,
                success: function(data){
                    if(data.success){
                    alert("已成功修改数据");
                    changePageJSPost(1,changePageCondition ());
                    //    window.location.href="sampleList.jsp";
                    // window.location.reload();
                    }else{
                        alert(data.errorMsg);
                    }
                },
                dataType: 'json'
            });
        }

}
// 删除单条数据
function deleteInfoJSPost(json){
    // 如何处理请求？  参数：1、页数，2、数据类型
        // 1.处理默认数据
        // 2.根据参数请求特定数据
        $.ajax({
            type: 'POST',
            url: ctx + '/sampleDelete.html',
            data:{'sampleId':json},
            success: function(data){
                console.log(data)
                if(data.success){
                    alert("已删除ID号为:"+json+"的数据");
                }else{
                	 alert(data.errorMsg);
                }
                window.location.reload();
            },
            dataType: 'json'
          });
}
function changePageJS(){
    // (先解绑,因为此函数会被多次调用)
    // 直接点击 页面数字的 事件
    $("#changePage .pages li").off("click");
    $("#changePage .pages li").click(function(e){

        // var a = $(this).text();
        //所点击的li pages属性（所点击的是第几页）
        var b = $(this).attr("pages");
        changePageJSPost(b,changePageCondition ());
        //测试结束  点击页数按钮时改变
    });
    // 点击 跳转到第几页 事件
    $("#changePage .jumpToPage").off("click");  
    $("#changePage .jumpToPage").click(function(){
        //   分页JS  跳转按钮点击事件
        // 1.检测input内容是否合法
            //1.检测是否为数字
        var zhi = parseInt($("#changePage .input input").val());
                        //2.检测是否有这页    (先从有多少条记录中取余出来，后可直接传值)
                    var zhi1 = parseInt($("#changePage .title1").attr("pages")) ;
                    // 总共多少条记录
                    var all = parseInt($("#changePage .title1").attr("allPage"));
                    // console.log(zhi1);
                    // console.log("/////////");
                    if (zhi != NaN && zhi <= zhi1 && zhi > 0){
        }else if(zhi == 0){
            //如果为0
        }
    });
    //点击 上一页下一页 事件
    $("#changePage .turn").off("click");
    $("#changePage .turn").click(function(){
        // 判断点击的是上一页还是下一页
        var zhi = $(this).hasClass("Left");
        // 总共多少条记录
        var all = parseInt($("#changePage .title1").attr("allPage"));
        // 获取当前总页数
        var pages = parseInt($("#changePage .title1").attr("pages"));
        // 获取当前选中页数
        var thisPage = parseInt($("#changePage .pages .checkedStau").attr("pages"));
        // console.log(thisPage);
        if(zhi){
            // console.log("pageUp");
            let b = 1;
            thisPage > 1 ? b = thisPage -1:b = pages;
            changePageJSPost(b,changePageCondition ());
        }else{
            // console.log("pageDown");
            let b = 1;
            thisPage < pages ? b = thisPage +1:b = 1;
            changePageJSPost(b,changePageCondition ());
        }
    });
}
function addChangePageMoreClickTest(a){//  addChangePageMore(a) 函数测试开始 
    var example = {
        "pagesInfo":{//页数信息
            "count":"77",//总共多少条记录
            "page":a,//当前第几页
        }
    }
    addChangePageMore(example.pagesInfo);
    //  addChangePageMore(a) 函数测试结束}
}
// addChangePageMoreClickTest(1);
//处理翻页显示(默认第一页)
function addChangePageMore_001(thisPage){
    $("#changePage .pages").html(`
        <li pages="1" class="floatLeft elipsis">...</li>
        <li pages="${thisPage - 1}" class="floatLeft">${thisPage - 1}</li>
        <li pages="${thisPage}" class="floatLeft">${thisPage}</li>
        <li pages="${thisPage+1}" class="floatLeft">${thisPage+1}</li>
        <li pages="0" class="floatLeft elipsis">...</li>
    `);
}
function addChangePageMore_002(pgs){
    $("#changePage .pages").html(`
        <li pages="1" class="floatLeft ">1</li>
        <li pages="2" class="floatLeft ">2</li>
        <li pages="3" class="floatLeft">3</li>
        <li pages="0" class="floatLeft  elipsis">...</li>
        <li pages="${pgs}" class="floatLeft ">${pgs}</li>
    `);
}
function addChangePageMore_003(pgs){
    $("#changePage .pages").html(`
        <li pages="1" class="floatLeft ">1</li>
        <li pages="0" class="floatLeft elipsis">...</li>
        <li pages="${pgs-2}" class="floatLeft ">${pgs-2}</li>
        <li pages="${pgs-1}" class="floatLeft ">${pgs-1}</li>
        <li pages="${pgs}" class="floatLeft ">${pgs}</li>
    `);
}
function addChangePageMore(a){
    //共多少记录
    var allPages = a.count;
    allPages == undefined ? allPages = 1: allPages = allPages;
    //十位向上取整计算需要显示多少页
    var pgs = Math.ceil(allPages/10);
    //当前是第几页
    var thisPage = parseInt(a.page);
    //本页应为多少条
        //1.检测当前是第几页。2.最后一页则取个位，否则取整
    var b = "";
    thisPage < pgs ? b = "1-10": b = "1-"+ (allPages - (thisPage -1)*10 );
    $("#changePage .title1").attr("pages",pgs).attr("allPage",allPages);
    $("#changePage .title1").html(`
    共有 <b style="color:#A60427">${allPages}</b> 个记录  每页显示10条，本页${b}条 ${thisPage}/${pgs}页
    `);
    //填充页数小方块
        //1.判断总页数是否大于5
        if(pgs > 5){
            //是  中间用省略号
                //根据当前第几页，用算法算排布
                // 必要信息： 1.总页数 （6） 2.当前页数（3）
            // 思路：
                //
                /*
                    1.判断省略号是否小于2，
                        是则 三种情况
                            1.空
                                置 1 2 3 ... n
                            2.显示  1 2 3 ... n
                                通过 当前页判断，2或3则进入状态2，n则 置 1 ... n-2 n-1 n
                            3.显示  1 ... n-2 n-1 n
                                通过 当前页判断，n-2 或 n-1则进入状态2，1则 置 1 2 3 ... n
                        否则 判断 当前页(所点击的页面)情况
                            判断 当前页
                                当前页 小于等于3，置  1 2 3 ... n
                                当前页 大于n-2置  1 ... n-2 n-1 n
                                都不满足  当前页取中间，置  ... n-1 n n+1 ...
                    2.省略号大于1 ，说明 是  … 3 4 5 … 这种形式，则判断
                */
                // console.log(pgs);
            if($("#changePage .pages .elipsis").length > 1){
                    if(thisPage < 4){
                        //形式  1 2 3 ... n
                        addChangePageMore_002(pgs);
                    }else if(thisPage >= (pgs-2)){
                       //形式  1 ... n-2 n-1 n
                       addChangePageMore_003(pgs);
                    }else{
                        //形式  ... n-1 n n+1 ...
                        addChangePageMore_001(thisPage);
                    }
            }else{
                //省略号小于2
                // zhi1 为index值位置，值为 1 3 -1
                var zhi1 =  $("#changePage .pages .elipsis").index();
                // console.log(zhi1);
                
                 if (zhi1 == 3){
                     if(thisPage == 3 || (thisPage > 3 && thisPage < pgs -1)){
                        //形式  ... n-1 n n+1 ...
                        addChangePageMore_001(thisPage);
                     }else if(thisPage == pgs || thisPage == pgs -1){
                        //形式  1 ... n-2 n-1 n
                        addChangePageMore_003(pgs);
                     }else {
                         //形式  1 2 3 ... n
                        addChangePageMore_002(pgs);
                     }
                 }else if( zhi1 == 1){
                    if(thisPage == pgs-2 || (thisPage > 3 && thisPage < pgs -1)){
                        //形式  ... n-1 n n+1 ...
                        addChangePageMore_001(thisPage);
                     }else if(thisPage == 1 || thisPage == 2){
                        //形式  1 2 3 ... n
                        addChangePageMore_002(pgs);
                     }else{
                         //形式  1 ... n-2 n-1 n
                        addChangePageMore_003(pgs);
                     }
                 }else{
                    //形式  1 2 3 ... n
                    addChangePageMore_002(pgs);
                 }
            }
        }else{
            // console.log(pgs);
            //否  罗列
            var str = "";
            //li 里的 pages ：为当前页。最高值为 pgs 。
            for(var i = 0;i <= pgs-1;i++){
                str += `<li pages="${i+1}" class="floatLeft">${i+1}</li>`;
            }
            // 填充进入dom
            $("#changePage .pages").html(str);
        }
        //2.大于5，绑定点击事件
    //给所点击的填充颜色
    $("#changePage .pages li").removeClass("checkedStau");
    $("#changePage .pages li[pages='"+thisPage+"']").addClass("checkedStau");
    //changePagesJS 绑定事件(先解绑,因为此函数会被多次调用)
    changePageJS();
}
function useTable_addInfo(json){
    // console.log(typeof(json));
    //表内容
    var dataInfo = useTable_addInfo_changeForm(json.sampleList);
    // 填入页数信息   json.pagesInfo 为页数信息
    var pagesInfo = {
        "count":json.count,
        "page":json.page,
    }
    // console.log(pagesInfo);
    addChangePageMore(pagesInfo);
    // console.log(pgs);
    //填入表内容、表相关配置、相关元素事件
    var jsGridInfo = {
        heading:true,
        // dataName:"各种离子浓度表",
        width: "100%",
        height: "600px",
        align:"center",
        autoload: false,
        inserting: true,
        sorting: true,
        paging: true,
        visible:true,
        data: dataInfo,//表内容
        editing:true,//是否可编辑
        pgbuttons:true,
        search:true,
        deleteConfirm: "确定删除吗？",
        required:true,
        fields: [
            { name: "ID", type: "number", readOnly: true, width:50,  },
            { name: "样品别名", type: "text", width:60,  },
            { name: "取水类型", type: "select",items: waterItems, width:60,  },
            { name: "取样时间", type: "text",readOnly: true, width:70,  },
            { name: "钠（Na++K+）", type: "number", width:50,  },
            { name: "镁（Mg2+）", type: "number", width:50,  },
            { name: "钙（Ca2+）", type: "number", width:50,  },
            { name: "氯化物（Cl-）", type: "number", width:50 },
            { name: "硫酸盐（SO42-）", type: "number", width:50 },
            { name: "重碳酸盐（HCO3-）", type: "number", width:50 },
            { name: "碳酸盐（HCO32-）", type: "number", width:50 },
            { name: "氢氧化物（OH-）", type: "number", width:50,  },
            { name: "碱度（以CaCO3计）", type: "number", width:50 },
            { name: "总硬度（以CaCO3计）", type: "number", width:50 },
            { name: "PH", type: "number", width:50 },
            { name: "偏硅酸", type: "number", width:50 },
            // { type: "control" },
            {
                    type: "control",width:70
                    //此为 只修改 的备用 样式 ，备份用 不可删除。
                    // modeSwitchButton: false,
                    // editButton: false,

                    // headerTemplate: function() {
                    //     return $("<button>").attr("type", "button").addClass("trTitleButton").attr("zhi",1).html("修改").on("click", function () {
                    //                 //点击事件：获取当前元素的zhi值，并以此来决定一些功能的转换
                    //                 var zhi = $(".trTitleButton").attr("zhi");
                    //                 if(zhi != 0){
                    //                     $("#jsGrid").jsGrid({
                    //                         //列表可编辑状态：可
                    //                         editing:true,
                    //                     });
                    //                     //其余功能必须在此代码块后面写，否则不生效！！！
                    //                     // ----分割线----
                    //                     //改文字（状态）
                    //                     $(".trTitleButton").html("保存");
                    //                     // 改样式
                    //                     $(".trTitleButton").addClass("trTitleButtonCheck");
                    //                     $(".trTitleButton").attr("zhi",0);
                    //                     $(".jsgrid-selected-row > .jsgrid-cell").css({"background":"#000","border-color":"#2562b0"});
                    //                 }else{
                    //                     $("#jsGrid").jsGrid({
                    //                         //列表可编辑状态：非
                    //                         editing:false,
                    //                     });
                    //                     //其余功能必须在此代码块后面写，否则不生效！！！
                    //                     // ----分割线----
                    //                     //改文字（状态）
                    //                     $(".trTitleButton").html("修改");
                    //                     // 改样式
                    //                     $(".trTitleButton").removeClass("trTitleButtonCheck");
                    //                     $(".trTitleButton").attr("zhi",1);
                    //                     $(".jsgrid-selected-row > .jsgrid-cell").css({"background":"#2562b0","border-color":"#2562b0","color":"#000"});
                    //                 }
                    //         });
                    // },
                }
        ]
    }
    $("#jsGrid").jsGrid(jsGridInfo);
    //自定义 绑定事件(非原生)
    // 增
    $(".jsgrid-insert-mode-button").on("click",function(){
        // 确认添加 按钮(换class)
            //点击tr后才出现.jsgrid-edit-row类名
            $(".jsgrid-insert-row input:eq(2)").attr("id","bindTableList-insert");
            zaneDate({
                elem:'#bindTableList-insert',
                format:'yyyy-MM-dd',
                zindex:100,
            });
            $(".zane-calendar").blur(function(){
                $(this).remove(); 
             });
            $(".jsgrid-insert-button").off("click");//取消插件原生的绑定事件（插入当前页面等）
            $(".jsgrid-insert-button").click(function(){
                //捕获当前信息
                var obj = returnObj(this);
                // console.log(JSON.stringify(obj));
                // 绑定  增加数据 事件
                addInfoJSPost(obj);
                // alert(1);
            });
        });
    // 删
    $(".jsgrid-delete-button").off("click")
    $(".jsgrid-delete-button").click(function(){
        let confirmE = confirm("确定删除此记录？");
        if(confirmE){
            var sampleId = $(this).parents("tr").find("td").eq(0).text();
            deleteInfoJSPost(sampleId);
        }
    });
    //改
    $(".jsgrid-edit-button").click(function(){
        // //点击编辑按钮后
        // $(".jsgrid-edit-row input:eq(2)").attr("id","bindTableList3");
        // zaneDate({
        //     elem:'#bindTableList3',
        //     format:'yyyy-MM-dd',
        //     zindex:100,
        // });
        $(".jsgrid-update-button").off("click");
        $(".jsgrid-update-button").click(function(){
            var obj = returnObj(this);
            changeInfoJSPost(obj);
        });
    });
    //改   选择日期 绑定 日历插件
    $(".jsgrid-table tbody tr").click(function(){
        // //点击tr后才出现.jsgrid-edit-row类名
        // $(".jsgrid-edit-row input:eq(2)").attr("id","bindTableList");
        // zaneDate({
        //     elem:'#bindTableList',
        //     format:'yyyy-MM-dd',
        //     zindex:100,
        // });
        //点击开始编辑按钮后
        $(".jsgrid-update-button").off("click");
        $(".jsgrid-update-button").click(function(){
            var obj = returnObj(this);
            // console.log(obj)
            changeInfoJSPost(obj);
        });
    });
    if ( $("#jsGrid").html() != null ){
        //调分页的高度
         $("#jsGrid").offset().top = "800px";
        // var zhi2 = $("#jsGrid").height();
        // var zhi3 = zhi1 + zhi2 - 60;
        // console.log(zhi3);
        // $("#changePage").css("top",zhi3);
    }
}
//返回点击的当前按钮同行数据（发给后台） 使用此函数时务必保证是td下有input的状态
function returnObj(elem){
    var obj = {};
    obj.sampleId = $(elem).parents("tr").find("input").eq(0).val();
    obj.sampleName = $(elem).parents("tr").find("input").eq(1).val();
    obj.typeName = $(elem).parents("tr").find("select").find("option:selected").val();
    obj.sampleDate = $(elem).parents("tr").find("input").eq(2).val();
    obj.sampleV1 = $(elem).parents("tr").find("input").eq(3).val();
    obj.sampleV2 = $(elem).parents("tr").find("input").eq(4).val();
    obj.sampleV3 = $(elem).parents("tr").find("input").eq(5).val();
    obj.sampleV4 = $(elem).parents("tr").find("input").eq(6).val();
    obj.sampleV5 = $(elem).parents("tr").find("input").eq(7).val();
    obj.sampleV6 = $(elem).parents("tr").find("input").eq(8).val();
    obj.sampleV7 = $(elem).parents("tr").find("input").eq(9).val();
    obj.sampleV8 = $(elem).parents("tr").find("input").eq(10).val();
    obj.sampleV9 = $(elem).parents("tr").find("input").eq(11).val();
    obj.sampleV10 = $(elem).parents("tr").find("input").eq(12).val();
    obj.sampleV12 = $(elem).parents("tr").find("input").eq(13).val();
    obj.sampleV18 = $(elem).parents("tr").find("input").eq(14).val();
    // console.log(obj)
    return obj;
}

//对后台传过来的数据进行转码（给jsgrid使用）
function useTable_addInfo_changeForm(json){
    var arr = [];
    var a = "钠（Na++K+）",
        b = "镁（Mg2+）",
        c = "钙（Ca2+）",
        d = "氯化物（Cl-）",
        e = "硫酸盐（SO42-）",
        f = "重碳酸盐（HCO3-）",
        g = "碳酸盐（HCO32-）",
        h = "氢氧化物（OH-）",
        p = "碱度（以CaCO3计）",
        j = "总硬度（以CaCO3计）",
        k = "PH",
        l = "ID",
        m = "取水类型",
        o = "取样时间",
        a1 = "偏硅酸",
        q = "样品别名";
    $.each(json,function(i,n){
        var obj ={};
        obj[a] = n.sampleV1;
        obj[b] = n.sampleV2;
        obj[c] = n.sampleV3;
        obj[d] = n.sampleV4;
        obj[e] = n.sampleV5;
        obj[f] = n.sampleV6;
        obj[g] = n.sampleV7;
        obj[h] = n.sampleV8;
        obj[p] = n.sampleV9;
        obj[j] = n.sampleV10;
        obj[k] = n.sampleV12;
        obj[a1] = n.sampleV18;
        obj[l] = n.sampleId;
        obj[m] = n.typeId;
        obj[o] = n.sampleDate,
        obj[q] = n.sampleName;
        arr.push(obj);
    });
    return arr;
}
function dateChangeForm(date1,fen){
    //函数分两个参数，第一个为日期，可以是 20151205 纯数字，也可以 2015:12:05 带分隔符。无分隔符时则默认"-"或用第二个参数作分隔符输出，有分隔符则去掉分隔符输出
    if(date1.length ==12 ){//判断字符串长度是否为8，是则添加分隔符，否则去除分隔符
      let kan = "-";
      if(fen != undefined){
        kan=fen;
      }
      let zhi = date1.substring(0,4)+kan+date1.substring(4,6)+kan+date1.substring(6,8)+" "+date1.substring(8,10)+" : "+date1.substring(10,12);
      return (zhi);
    }else if(date1.length == 8 ){
      let kan = "-";
        if(fen != undefined){
          kan=fen;
        }
        let zhi = date1.substring(0,4)+kan+date1.substring(4,6)+kan+date1.substring(6,8);
        return (zhi);
    }else if(date1.length ==10 ){
        let kan = "-";
        if(fen != undefined){
          kan=fen;
        } 
        let zhi = date1.substring(0,4)+kan+date1.substring(5,7)+kan+date1.substring(8,10);
      return (zhi);
    }else{
      let k2=date1.replace(/[^0-9]/ig,"");
      if(k2!=8 || k2!= 12){
        return("格式错误！请重新输入！");
      }
        return k2;
    }
  }

//其他条件
// $(".otherCondi").click(function(){
//     var zhi = $("#titleBar2").css("display");
//     if(zhi == "none"){
//         $("#titleBar2").show(200);
//     }else{
//         $("#titleBar2").hide(200);
//     }
// });
