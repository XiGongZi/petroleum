  var Public=function(){
    var inputA,inputB,inputs,regulars,input,element,a,b;
      return {
        setLineHeight:function(a){//使文字高与父级等高（居中）
          $(a).css("line-height",$(a).parent().height()+"px");
        },
        setLineHeightSelf:function(a){//使文字高与父父级等高（居中）
          $(a).css("line-height",$(a).height()+"px");
        },
        setDivHeight:function(a){//使div垂直居中
          var zhi1=$(a).parent().height();
          var zhi2=$(a).height();
          var zhi=(zhi1-zhi2)/2;
          // console.log(a+"---"+zhi);
          $(a).css("margin-top",zhi+"px");
        },
        setDivWidth:function (a){//使div横向居中
          var zhi1=$(a).parent().width();
          var zhi2=$(a).width();
          var zhi=(zhi1-zhi2)/2;
          $(a).css("margin-left",zhi+"px");
        },
        setDivMarginLeft:function(a){//使用aginleft居中
          var zhi1=$(window).width();
          var zhi2=$(a).width();
          $(a).css("margin-left",(zhi1-zhi2)/2 + "px");
        },
        checkSameInput:function (inputA,inputB){//检查两个input是否重复（非空），重复则返回true，否则返回false
          if(
            $(inputA).val()==$(inputB).val()&&
            An.Public.checkInputText2(inputA,inputB)
          ){
            return(true);
          }else{
            return(false);
          }
        },
        checkInputText2 :function (inputA,inputB){//检查两个input是否同时不为空，是则返回true，否则返回false。
          if(
            $(inputA).val()!="" &&
            $(inputB).val()!=""
            ){
            return(true);
          }else{
            return(false);
          }
        },
        checkInputText1:function (input){//检查input是否不为空，不为空则返回true，否则返回false
          if(
              $(input).val()!=""
              ){
              return(true);
            }else{
              return(false);
            }
        },
        addSubmit :function  (inputs,regulars,element){//检查inputs和regulars匹配，并在指定位置上决定是否添加submit类。
          if(An.Public.checkInputsRegular (inputs,regulars)){
            $(element).attr("class","Submit");
          }else{
            $(element).removeAttr("class","Submit");
          }
        },
        checkInputsRegular :function (inputs,regulars){//检测inputs数组与对应的正则数组，都对应则返回true，否则返回false
          var CIR=new Array();
          $(inputs).each(function(i){
            if(
                $(inputs[i]).val() == ""
              ){
              CIR.push(false);
            }else{
              if(
                  regulars[i].test($(inputs[i]).val())
                ){
              CIR.push(true);
              }else{
              CIR.push(false);
              }
            }
          });
          return An.Public.CCC(CIR);
          /*
              20180818：GongZiXi
                此处可用 解构 ，直接返回一个数组
          */
        },
        CCC:function(a){//全部为真时返回真，否则返回假    every函数,给定条件去筛选
          var isAllTrue = a.every(function(cur){return cur});
          return isAllTrue;
        },
        resetLeftPlace:function (a,b){//获取a的左边距，并赋给b
          $(b).css("margin-left",parseInt($(a).position().left)+"px");
        },
        logRegTipsCheck2 :function (inputs,regulars){//回调一个数组，按序为各个inputs与正则的匹配结果
          var TipsCheck=new Array();
          $(inputs).each(function(i){
            if(
                $(inputs[i]).val() == ""
              ){
            }else{
              if(
                  regulars[i].test($(inputs[i]).val())
                ){
              TipsCheck.push(i+"isTrue");
              }else{
              TipsCheck.push(i+"isFalse");
              }
            }
          });
          return TipsCheck;
        },
        numToCZH:function (a){// 星期几数字转汉字
          switch(a){
            case 1:
              return "一";
              break;
            case 2:
              return "二";
              break;
            case 3:
              return "三";
              break;
            case 4:
              return "四";
              break;
            case 5:
              return "五";
              break;
            case 6:
              return "六";
              break;
            case 0:
              return "日";
              break;
            default:
            break;
          }
        },
        callBackDate:function (a) {
          a = a+1;
          var mydate = new Date();
          var oneday = 1000 * 60 * 60 * 24;
          var newDate = new Date(mydate - (-(a - 1) * oneday));
          var thisYear = newDate.getFullYear(); // 获取当前年份(2位)
          var thisMonth = newDate.getMonth() + 1; // 获取当前月份(0-11,0代表1月)
          var today = newDate.getDate(); // 获取当前日(1-31)
          var thisWeek = newDate.getDay() ; // 获取当前星期X(0-6,0代表星期天)
          var thisMonth = thisMonth < 10 ? "0" + thisMonth : thisMonth;
          var thisDay = today < 10 ? "0" + today : today;
          var dateArray = new Array(thisYear, thisMonth, thisDay, thisWeek);
          return (dateArray);
        },
        getBrowserInfo:function (){//查询浏览器类型
          var ua = navigator.userAgent.toLocaleLowerCase();
          var browserType=null;
          if (ua.match(/msie/) != null || ua.match(/trident/) != null) {
              browserType = "IE";
              browserVersion = ua.match(/msie ([\d.]+)/) != null ? ua.match(/msie ([\d.]+)/)[1] : ua.match(/rv:([\d.]+)/)[1];
          } else if (ua.match(/firefox/) != null) {
              browserType = "火狐";
          }else if (ua.match(/ubrowser/) != null) {
              browserType = "UC";
          }else if (ua.match(/opera/) != null) {
              browserType = "欧朋";
          } else if (ua.match(/bidubrowser/) != null) {
              browserType = "百度";
          }else if (ua.match(/metasr/) != null) {
              browserType = "搜狗";
          }else if (ua.match(/tencenttraveler/) != null || ua.match(/qqbrowse/) != null) {
              browserType = "QQ";
          }else if (ua.match(/maxthon/) != null) {
              browserType = "遨游";
          }else if (ua.match(/chrome/) != null) {
                  browserType = 'chrome';
          }else if (ua.match(/safari/) != null) {
              browserType = "Safari";
          }
          return browserType;
        },
        setBCenterOfA:function (a,b){//设置b高度居中a
          var zhi1=$(a).offset().top;
          var zhi2=$(a).height();
          var zhi3=$(b).offset().top;
          var zhi4=$(b).height();
          $(b).css("top",(zhi1+zhi2/2)-(zhi4/2)+"px");
        },
        ForInSetCenter:function(a){
          //0:setDivHeight
          //1:setDivWidth
          //2:setDivWidthParent
          //3:setLineHeight
          //4:setLineHeightSelf
          //5:setMarginLeft
          $.each(a[0],function(i,n){
            An.Public.setDivHeight(n);
          });
          $.each(a[1],function(i,n){
            An.Public.setDivWidth(n);
          });
          $.each(a[2],function(i,n){
            An.Public.setDivWidthParent(n);
          });
          $.each(a[3],function(i,n){
            An.Public.setLineHeight(n);
          });
          $.each(a[4],function(i,n){
            An.Public.setLineHeightSelf(n);
          });
          $.each(a[5],function(i,n){
            An.Public.setDivMarginLeft(n);
          });
        },
        getUrlParam:function (a){//获取地址栏
          var reg = new RegExp("(^|&)"+ a +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
          var r = window.location.search.substr(1).match(reg);  //匹配目标参数
          if (r!=null) return unescape(r[2]); return null; //返回参数值
        },
        PayPic_Second:function (){//三秒倒计时等待
          var kk=3;
          var t1=setInterval(function(){
            kk=kk-1;
            kk<10?kk="0"+kk:kk=kk;
            console.log(kk);
            if(kk<=0){
              PayPic_Function();//结束后所执行的函数
              clearInterval(t1);
            }
          },1000);
        },
        saveAsFileFun:function(){// 存文件函数的核心程序,在使用调用时必须先使用此函数以调用核心
          var saveAs = saveAs || (function(view) {  
              "use strict";  
              // IE <10 is explicitly unsupported  
              if (typeof view === "undefined" || typeof navigator !== "undefined" && /MSIE [1-9]\./.test(navigator.userAgent)) {  
                  return;  
              }  
              var  
                    doc = view.document  
                    // only get URL when necessary in case Blob.js hasn't overridden it yet  
                  , get_URL = function() {  
                      return view.URL || view.webkitURL || view;  
                  }  
                  , save_link = doc.createElementNS("http://www.w3.org/1999/xhtml", "a")  
                  , can_use_save_link = "download" in save_link  
                  , click = function(node) {  
                      var event = new MouseEvent("click");  
                      node.dispatchEvent(event);  
                  }  
                  , is_safari = /constructor/i.test(view.HTMLElement) || view.safari  
                  , is_chrome_ios =/CriOS\/[\d]+/.test(navigator.userAgent)  
                  , throw_outside = function(ex) {  
                      (view.setImmediate || view.setTimeout)(function() {  
                          throw ex;  
                      }, 0);  
                  }  
                  , force_saveable_type = "application/octet-stream"  
                  // the Blob API is fundamentally broken as there is no "downloadfinished" event to subscribe to  
                  , arbitrary_revoke_timeout = 1000 * 40 // in ms  
                  , revoke = function(file) {  
                      var revoker = function() {  
                          if (typeof file === "string") { // file is an object URL  
                              get_URL().revokeObjectURL(file);  
                          } else { // file is a File  
                              file.remove();  
                          }  
                      };  
                      setTimeout(revoker, arbitrary_revoke_timeout);  
                  }  
                  , dispatch = function(filesaver, event_types, event) {  
                      event_types = [].concat(event_types);  
                      var i = event_types.length;  
                      while (i--) {  
                          var listener = filesaver["on" + event_types[i]];  
                          if (typeof listener === "function") {  
                              try {  
                                  listener.call(filesaver, event || filesaver);  
                              } catch (ex) {  
                                  throw_outside(ex);  
                              }  
                          }  
                      }  
                  }  
                  , auto_bom = function(blob) {  
                      // prepend BOM for UTF-8 XML and text/* types (including HTML)  
                      // note: your browser will automatically convert UTF-16 U+FEFF to EF BB BF  
                      if (/^\s*(?:text\/\S*|application\/xml|\S*\/\S*\+xml)\s*;.*charset\s*=\s*utf-8/i.test(blob.type)) {  
                          return new Blob([String.fromCharCode(0xFEFF), blob], {type: blob.type});  
                      }  
                      return blob;  
                  }  
                  , FileSaver = function(blob, name, no_auto_bom) {  
                      if (!no_auto_bom) {  
                          blob = auto_bom(blob);  
                      }  
                      // First try a.download, then web filesystem, then object URLs  
                      var  
                            filesaver = this  
                          , type = blob.type  
                          , force = type === force_saveable_type  
                          , object_url  
                          , dispatch_all = function() {  
                              dispatch(filesaver, "writestart progress write writeend".split(" "));  
                          }  
                          // on any filesys errors revert to saving with object URLs  
                          , fs_error = function() {  
                              if ((is_chrome_ios || (force && is_safari)) && view.FileReader) {  
                                  // Safari doesn't allow downloading of blob urls  
                                  var reader = new FileReader();  
                                  reader.onloadend = function() {  
                                      var url = is_chrome_ios ? reader.result : reader.result.replace(/^data:[^;]*;/, 'data:attachment/file;');  
                                      var popup = view.open(url, '_blank');  
                                      if(!popup) view.location.href = url;  
                                      url=undefined; // release reference before dispatching  
                                      filesaver.readyState = filesaver.DONE;  
                                      dispatch_all();  
                                  };  
                                  reader.readAsDataURL(blob);  
                                  filesaver.readyState = filesaver.INIT;  
                                  return;  
                              }  
                              // don't create more object URLs than needed  
                              if (!object_url) {  
                                  object_url = get_URL().createObjectURL(blob);  
                              }  
                              if (force) {  
                                  view.location.href = object_url;  
                              } else {  
                                  var opened = view.open(object_url, "_blank");  
                                  if (!opened) {  
                                      // Apple does not allow window.open, see https://developer.apple.com/library/safari/documentation/Tools/Conceptual/SafariExtensionGuide/WorkingwithWindowsandTabs/WorkingwithWindowsandTabs.html  
                                      view.location.href = object_url;  
                                  }  
                              }  
                              filesaver.readyState = filesaver.DONE;  
                              dispatch_all();  
                              revoke(object_url);  
                          }  
                      ;  
                      filesaver.readyState = filesaver.INIT;  
            
                      if (can_use_save_link) {  
                          object_url = get_URL().createObjectURL(blob);  
                          setTimeout(function() {  
                              save_link.href = object_url;  
                              save_link.download = name;  
                              click(save_link);  
                              dispatch_all();  
                              revoke(object_url);  
                              filesaver.readyState = filesaver.DONE;  
                          });  
                          return;  
                      }  
            
                      fs_error();  
                  }  
                  , FS_proto = FileSaver.prototype  
                  , saveAs = function(blob, name, no_auto_bom) {  
                      return new FileSaver(blob, name || blob.name || "download", no_auto_bom);  
                  }  
              ;  
              // IE 10+ (native saveAs)  
              if (typeof navigator !== "undefined" && navigator.msSaveOrOpenBlob) {  
                  return function(blob, name, no_auto_bom) {  
                      name = name || blob.name || "download";  
            
                      if (!no_auto_bom) {  
                          blob = auto_bom(blob);  
                      }  
                      return navigator.msSaveOrOpenBlob(blob, name);  
                  };  
              }  
            
              FS_proto.abort = function(){};  
              FS_proto.readyState = FS_proto.INIT = 0;  
              FS_proto.WRITING = 1;  
              FS_proto.DONE = 2;  
            
              FS_proto.error =  
              FS_proto.onwritestart =  
              FS_proto.onprogress =  
              FS_proto.onwrite =  
              FS_proto.onabort =  
              FS_proto.onerror =  
              FS_proto.onwriteend =  
                  null;  
            
              return saveAs;  
          }(  
                typeof self !== "undefined" && self  
              || typeof window !== "undefined" && window  
              || this.content  
          ));  
          // `self` is undefined in Firefox for Android content script context  
          // while `this` is nsIContentFrameMessageManager  
          // with an attribute `content` that corresponds to the window  
            
          if (typeof module !== "undefined" && module.exports) {  
            module.exports.saveAs = saveAs;  
          } else if ((typeof define !== "undefined" && define !== null) && (define.amd !== null)) {  
            define("FileSaver.js", function() {  
              return saveAs;  
            });  
          }  
        },
        saveAsFile:function(a,b){//调用 存文件的函数，传入数据。a为所存数据，b为文件名，
          var cas =JSON.stringify(a);
          var blob = new Blob([cas], {type: "text/plain;charset=utf-8"});  
          if(b == "" && b == null){
            b="json";
          }else{
            b=b;
          }
          saveAs(blob, b+".txt");  
        }



      };
  }();


  // //自适应代码区开始
  // var setDivCenterArray=[
  // [//0:setDivHeight
  //   '.MaxAn[AnType="titleBar"] .pcCenter svg',
  //   '.MaxAn[AnType="titleBar"] .pcCenter .otherInfo>div',
  //   '.goodsShowBoxMax .projectList .projectBox .imgBox>div',
  //   '#drawBooks .pic .turn svg',
  //   '#drawBooks .pic .img img',
  //   '.goodsShowBoxMax .projectList .projectBox .mainBodyBoxMax .mainBodyBox'
  // ],[//1:setDivWidth
  //   '.goodsShowBoxMax .projectList .projectBox .imgBox>div',
  //   '#drawBooks .pic .img img',
  //   '.goodsShowBoxMax .projectList .projectBox .mainBodyBoxMax .mainBodyBox'
  // ],[//2:setDivWidthParent
  // ],[//3:setLineHeight
  // ],[//4:setLineHeightSelf
  // ],[//5:setDivMarginLeft
  // ]
  // ];

  // //自适应代码区结束


