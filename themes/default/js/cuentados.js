function input_fake(e){$(".input-hide-"+e).hide(),$(".input-hidden-"+e).show().focus()}function isImageFile(e){var t=/[.]/.exec(e)?/[^.]+$/.exec(e.toLowerCase()):"";return t&&/^(jpg|png|jpeg|gif)$/.test(t)?!0:!1}$(document).ready(function(){$("textarea.imagen-desc").live("focus",function(){"Descripcion de la foto"==$(this).html()&&$(this).html("")}),"undefined"!=typeof $.browser.msie&&"6.0"==$.browser.version&&$("li.local-file > div.mini-modal").html('<div class="dialog-m"></div><span>Esta funciÃ³n no es compatible con su navegador</span>')});var cuenta={ciudad_id:"",ciudad_text:"",no_requerido:new Array,alert:function(e,t,a){$("div.alert-cuenta.cuenta-"+e).html("<h2>"+t+"</h2>"),$("div.alert-cuenta.cuenta-"+e).slideDown(100)},alert_close:function(e){$("div.alert-cuenta.cuenta-"+e).html(""),$("div.alert-cuenta.cuenta-"+e).slideUp(100)},chgtab:function(e){$("div.tabbed-d > div.floatL > ul.menu-tab > li.active").removeClass("active"),$(e).parent().addClass("active");var t=$(e).html().toLowerCase().replace(" ","-");$("div.content-tabs").hide(),$("div.content-tabs."+t).show()},chgsec:function(e){$("div.content-tabs.perfil > h3").removeClass("active"),$("div.content-tabs.perfil > fieldset").slideUp(100),"none"==$(e).next().css("display")&&($(e).addClass("active"),$(e).next().slideDown(100).addClass("active"))},chgpais:function(){var e=$("form[name=editarcuenta] select[name=pais]").val(),t=$("form[name=editarcuenta] select[name=estado]");empty(e)?$("form[name=editarcuenta] select[name=estado]").addClass("disabled").attr("disabled","disabled").val(""):($(t).html(""),$.ajax({type:"GET",url:global_data.url+"/registro-geo.php",data:"pais_code="+e,success:function(e){switch(e.charAt(0)){case"0":break;case"1":cuenta.no_requerido.estado=!1,$(t).append(e.substring(3)).removeAttr("disabled").val("").focus()}},error:function(){}}))},error:function(e,t){var a=$(e).next();$(a).hasClass("errorstr")&&($(a).show(),$(a).html(t))},next:function(e){if("undefined"==typeof e)var e=!1;e?$("div.content-tabs.perfil > h3.active").next().next().click():$("div.tabbed-d > div.floatL > ul.menu-tab > li.active").next().children().click()},save:function(e,t){if($(".ac_input, .cuenta-save-"+e).removeClass("input-incorrect"),"undefined"==typeof t)var t=!1;params=Array(),params.push("save="+e),$(".cuenta-save-"+e).each(function(){("checkbox"!=$(this).attr("type")&&"radio"!=$(this).attr("type")||$(this).attr("checked"))&&params.push($(this).attr("name")+"="+encodeURIComponent($(this).val()))});var a=global_data.url+"/cuenta.php?action=save&ajax=true";$.ajax({type:"post",url:a,data:params.join("&"),dataType:"json",success:function(a){a.error?(a.field&&$("input[name="+a.field+"]").focus().addClass("input-incorrect"),cuenta.alert(e,a.error)):(t&&cuenta.next(e>1&&5>e),cuenta.alert(e,"Los cambios fueron aceptados y ser&aacute;n aplicados."),null!=a.porc&&($("#porc-completado-label").html("Perfil completo al "+a.porc+"%"),$("#porc-completado-barra").css("width",a.porc+"%"))),window.location.hash="alert-cuenta"}})},imagen:{add:function(obj){var url=$(obj).prev().prev(),caption=$(obj).prev();$(url).removeClass("input-incorrect"),$(caption).removeClass("input-incorrect"),$.ajax({type:"post",url:global_data.url+"/cuenta.php?ajax=1&action=add",data:"url="+$(url).val()+"&caption="+$(caption).val(),dataType:"json",success:function(r){r.error?r.field?$(eval(r.field)).focus().addClass("input-incorrect"):(cuenta.alert(7,r.error),window.location.hash="alert-cuenta"):"undefined"!=typeof r.id&&($(obj).attr("onclick",""),$(obj).unbind("click").bind("click",function(){cuenta.imagen.del(this,r.id)}),$(obj).removeClass("misfotos-add").addClass("misfotos-del").html("Eliminar"),$(url).parent().prepend('<div class="floatL"><img src="'+$(url).val()+'" class="imagen-preview" /></div>'),$('<div class="field"><label>Imagen</label><div class="input-fake"><input value="http://" type="text" class="text" /><textarea style="margin-top:10px">Descripcion de la foto</textarea><a onclick="cuenta.imagen.add(this)" class="misfotos-add floatL">Agregar</a></div></div>').appendTo(".content-tabs.mis-fotos > fieldset"))}})},del:function(e,t){var a=$(e).parent().parent();$.ajax({type:"post",url:global_data.url+"/cuenta.php?ajax=1&action=del",data:"id="+t,dataType:"json",success:function(e){$(a).slideUp(100,function(){$(a).remove(),cuenta.alert_close(7)})}})}}},avatar={uid:!1,server:!1,crop_coord:!1,crc:!1,current:!1,success:!1,edit:function(e){"Editar"==$(e).html()?($(".change-avatar").slideDown(100),$(e).html("Cancelar")):($("div.sidebar-tabs > div.webcam-capture, div.mini-modal").hide(),$("div.sidebar-tabs > img:first, div.avatar-big-cont").show(),$("ul.change-avatar > li").removeClass("active"),$(".change-avatar").slideUp(100),$(e).html("Editar"))},chgtab:function(e){var t=$(e).parent().parent(),a=t.hasClass("active");$("ul.change-avatar > li").removeClass("active"),$("div.sidebar-tabs > div.webcam-capture, div.mini-modal").hide(),$("div.sidebar-tabs > div.avatar-big-cont").show(),a||(t.addClass("active"),t.hasClass("webcam-file")?($("div.sidebar-tabs > div.avatar-big-cont").hide(),$("div.sidebar-tabs > div.webcam-capture").show()):$(e).parent().next().show())},upload:function(e){return $(e).hasClass("local")&&($("input#file-avatar").val()?($("div.avatar-loading").show(),$.ajaxFileUpload({url:"http://hh.taringa.net/upload.php",fileElementId:"file-avatar",dataType:"json",success:this.uploadsuccess})):alert("No selecciono ningun archivo")),!1},uploadsuccess:function(e){$("div.avatar-loading").hide(),"success"==e.error?(avatar.success=!0,avatar.close()):e.msg?avatar.crop(e.msg):alert(e.error)},crop:function(e){mydialog.show(),$("#modalBody").css("padding",0),mydialog.title("Cortar avatar"),mydialog.body('<img class="avatar-crop" src="http://hh.taringa.net/avatares/'+e+"?"+Math.random()+'" onload="mydialog.center()">'),mydialog.buttons(!0,!0,"Guardar","avatar.save()",!0,!1,!0,"Cancelar","avatar.close()",!0,!0),$("img.avatar-big").attr("src","http://hh.taringa.net/avatares/"+e+"?"+Math.random()).bind("load",function(){$("img.avatar-crop").Jcrop({aspectRatio:1,sideHandles:!1,setSelect:[0,0,50,50],onChange:avatar.preview,onSelect:function(e){avatar.crop_coord=e}})})},reload:function(){$(".avatar-big").attr("src",this.current+"?"+Math.random()).css({margin:0,width:"120px",height:"120px"})},close:function(){mydialog.close(),$("a.edit").click(),avatar.success&&(avatar.success=!1,$.ajax({url:"/cuenta.php",data:"ajax=1&save=10&s="+avatar.server+gget("key"),type:"post",success:function(e){avatar.current=e,avatar.reload()}}))},preview:function(e){avatar.crop_coord=e;var t=120/e.w,a=120/e.h;$(".avatar-big").css({width:Math.round(t*$("img.avatar-crop").attr("width"))+"px",height:Math.round(a*$("img.avatar-crop").attr("height"))+"px",marginLeft:"-"+Math.round(t*e.x)+"px",marginTop:"-"+Math.round(a*e.y)+"px"})},save:function(){this.crop_coord?$.getJSON("http://hh.taringa.net/upload.php?save=true&id="+this.uid+"&s="+this.server+"&crc="+this.crc+"&coords="+this.crop_coord.x+","+this.crop_coord.y+","+this.crop_coord.x2+","+this.crop_coord.y2+"&callback=?"):alert("Debes seleccionar una parte de la foto")},jsoncallback:function(e){"success"==e.error?(avatar.success=!0,avatar.close()):alert(e.error)}};jQuery.extend({createUploadIframe:function(e,t){var a="jUploadFrame"+e;if(window.ActiveXObject){var n=document.createElement('<iframe id="'+a+'" name="'+a+'" />');"boolean"==typeof t?n.src="javascript:false":"string"==typeof t&&(n.src=t)}else{var n=document.createElement("iframe");$(n).attr({id:a,name:a})}return $(n).css({position:"absolute",top:"-1000px",left:"-1000px"}),document.body.appendChild(n),n},createUploadForm:function(e,t){var a="jUploadForm"+e,n="jUploadFile"+e,r=$('<form	action="" method="POST" name="'+a+'" id="'+a+'" enctype="multipart/form-data"><input type="hidden" name="id" value="'+avatar.uid+'" /><input type="hidden" name="s" value="'+avatar.server+'" /><input type="hidden" name="crc" value="'+avatar.crc+'" /></form>'),o=$("#"+t),i=$(o).clone();return $(o).attr("id",n),$(o).before(i),$(o).appendTo(r),$(r).css({position:"absolute",top:"-1200px",left:"-1200px"}),$(r).appendTo("body"),r},ajaxFileUpload:function(e){e=jQuery.extend({},jQuery.ajaxSettings,e);var t=(new Date).getTime(),a=jQuery.createUploadForm(t,e.fileElementId),n=(jQuery.createUploadIframe(t,e.secureuri),"jUploadFrame"+t),r="jUploadForm"+t;e.global&&!jQuery.active++&&jQuery.event.trigger("ajaxStart");var o=!1,i={};e.global&&jQuery.event.trigger("ajaxSend",[i,e]);var s=function(t){var r=document.getElementById(n);try{r.contentWindow?(i.responseText=r.contentWindow.document.body?r.contentWindow.document.body.innerHTML:null,i.responseXML=r.contentWindow.document.XMLDocument?r.contentWindow.document.XMLDocument:r.contentWindow.document):r.contentDocument&&(i.responseText=r.contentDocument.document.body?r.contentDocument.document.body.innerHTML:null,i.responseXML=r.contentDocument.document.XMLDocument?r.contentDocument.document.XMLDocument:r.contentDocument.document)}catch(s){jQuery.handleError(e,i,null,s)}if(i||"timeout"==t){o=!0;var c;try{if(c="timeout"!=t?"success":"error","error"!=c){var d=jQuery.uploadHttpData(i,e.dataType);e.success&&e.success(d,c),e.global&&jQuery.event.trigger("ajaxSuccess",[i,e])}else jQuery.handleError(e,i,c)}catch(s){c="error",jQuery.handleError(e,i,c,s)}e.global&&jQuery.event.trigger("ajaxComplete",[i,e]),e.global&&!--jQuery.active&&jQuery.event.trigger("ajaxStop"),e.complete&&e.complete(i,c),jQuery(r).unbind(),setTimeout(function(){try{$(r).remove(),$(a).remove()}catch(t){jQuery.handleError(e,i,null,t)}},100),i=null}};e.timeout>0&&setTimeout(function(){o||s("timeout")},e.timeout);try{var a=$("#"+r);$(a).attr({action:e.url,method:"post",target:n}),a.encoding?a.encoding="multipart/form-data":a.enctype="multipart/form-data",$(a).submit()}catch(c){jQuery.handleError(e,i,null,c)}return $.browser.opera?document.getElementById(n).onload=s:window.attachEvent?document.getElementById(n).attachEvent("onload",s):document.getElementById(n).addEventListener("load",s,!1),{abort:function(){}}},uploadHttpData:function(r,type){var data=!type;return data="xml"==type||data?r.responseXML:r.responseText,"script"==type&&jQuery.globalEval(data),"json"==type&&eval("data ="+data),data}}),function(e){e.Jcrop=function(t,a){function n(e){return""+parseInt(e)+"px"}function r(e){return""+parseInt(e)+"%"}function o(e){return _.baseClass+"-"+e}function s(t){var a=e(t).offset();return[a.left,a.top]}function c(e){return[e.pageX-re[0],e.pageY-re[1]]}function d(e){e!=G&&(se.setCursor(e),G=e)}function u(e,t){if(re=s(O),se.setCursor("move"==e?e:e+"-resize"),"move"==e)return se.activateHandlers(p(t),g);var a=oe.getFixed(),n=f(e),r=oe.getCorner(f(n));oe.setPressed(oe.getCorner(n)),oe.setCurrent(r),se.activateHandlers(l(e,a),g)}function l(e,t){return function(a){if(_.aspectRatio)switch(e){case"e":a[1]=t.y+1;break;case"w":a[1]=t.y+1;break;case"n":a[0]=t.x+1;break;case"s":a[0]=t.x+1}else switch(e){case"e":a[1]=t.y2;break;case"w":a[1]=t.y2;break;case"n":a[0]=t.x2;break;case"s":a[0]=t.x2}oe.setCurrent(a),ie.update()}}function p(e){var t=e;return ce.watchKeys(),function(e){oe.moveOffset([e[0]-t[0],e[1]-t[1]]),t=e,ie.update()}}function f(e){switch(e){case"n":return"sw";case"s":return"nw";case"e":return"nw";case"w":return"ne";case"ne":return"sw";case"nw":return"se";case"se":return"nw";case"sw":return"ne"}}function v(e){return function(t){return _.disabled?!1:"move"!=e||_.allowMove?(q=!0,u(e,c(t)),t.stopPropagation(),t.preventDefault(),!1):!1}}function m(e,t,a){var n=e.width(),r=e.height();n>t&&t>0&&(n=t,r=t/e.width()*e.height()),r>a&&a>0&&(r=a,n=a/e.height()*e.width()),A=e.width()/n,K=e.height()/r,e.width(n).height(r)}function b(e){return{x:parseInt(e.x*A),y:parseInt(e.y*K),x2:parseInt(e.x2*A),y2:parseInt(e.y2*K),w:parseInt(e.w*A),h:parseInt(e.h*K)}}function g(e){var t=oe.getFixed();t.w>_.minSelect[0]&&t.h>_.minSelect[1]?(ie.enableHandles(),ie.done()):ie.release(),se.setCursor(_.allowSelect?"crosshair":"default")}function y(e){if(_.disabled)return!1;if(!_.allowSelect)return!1;q=!0,re=s(O),ie.disableHandles(),d("crosshair");var t=c(e);return oe.setPressed(t),se.activateHandlers($,g),ce.watchKeys(),ie.update(),e.stopPropagation(),e.preventDefault(),!1}function $(e){oe.setCurrent(e),ie.update()}function x(){var t=e("<div></div>").addClass(o("tracker"));return e.browser.msie&&t.css({opacity:0,backgroundColor:"white"}),t}function C(e){function t(){window.setTimeout(g,d)}var a=e[0]/A,n=e[1]/K,r=e[2]/A,o=e[3]/K;if(!N){var i=oe.flipCoords(a,n,r,o),s=oe.getFixed(),c=initcr=[s.x,s.y,s.x2,s.y2],d=_.animationDelay,u=c[0],l=c[1],r=c[2],o=c[3],p=i[0]-initcr[0],f=i[1]-initcr[1],h=i[2]-initcr[2],v=i[3]-initcr[3],m=0,b=_.swingSpeed;ie.animMode(!0);var g=function(){return function(){m+=(100-m)/b,c[0]=u+m/100*p,c[1]=l+m/100*f,c[2]=r+m/100*h,c[3]=o+m/100*v,100>m?t():ie.done(),m>=99.8&&(m=100),S(c)}}();t()}}function j(e){S([e[0]/A,e[1]/K,e[2]/A,e[3]/K])}function S(e){oe.setPressed([e[0],e[1]]),oe.setCurrent([e[2],e[3]]),ie.update()}function k(t){"object"!=typeof t&&(t={}),_=e.extend(_,t),"function"!=typeof _.onChange&&(_.onChange=function(){}),"function"!=typeof _.onSelect&&(_.onSelect=function(){})}function M(){return b(oe.getFixed())}function I(){return oe.getFixed()}function D(e){k(e),Q()}function z(){_.disabled=!0,ie.disableHandles(),ie.setCursor("default"),se.setCursor("default")}function E(){_.disabled=!1,Q()}function H(){ie.done(),se.activateHandlers(null,null)}function F(){B.remove(),L.show()}function Q(e){_.allowResize?e?ie.enableOnly():ie.enableHandles():ie.disableHandles(),se.setCursor(_.allowSelect?"crosshair":"default"),ie.setCursor(_.allowMove?"move":"default"),B.css("backgroundColor",_.bgColor),"setSelect"in _&&(j(a.setSelect),ie.done(),delete _.setSelect),"trueSize"in _&&(A=_.trueSize[0]/U,K=_.trueSize[1]/P),J=_.maxSize[0]||0,R=_.maxSize[1]||0,W=_.minSize[0]||0,X=_.minSize[1]||0,"outerImage"in _&&(O.attr("src",_.outerImage),delete _.outerImage),ie.refresh()}var t=t,a=a;"object"!=typeof t&&(t=e(t)[0]),"object"!=typeof a&&(a={}),"trackDocument"in a||(a.trackDocument=e.browser.msie?!1:!0,e.browser.msie&&"8"==e.browser.version.split(".")[0]&&(a.trackDocument=!0)),"keySupport"in a||(a.keySupport=e.browser.msie?!1:!0);var T={trackDocument:!1,baseClass:"jcrop",addClass:null,bgColor:"black",bgOpacity:.6,borderOpacity:.4,handlePad:55,handleSize:9,handleOffset:7,edgeMargin:14,aspectRatio:0,keySupport:!0,cornerHandles:!0,sideHandles:!0,drawBorders:!0,dragEdges:!0,boxWidth:0,boxHeight:0,boundary:8,animationDelay:20,swingSpeed:3,allowSelect:!0,allowMove:!0,allowResize:!0,minSelect:[0,0],maxSize:[0,0],minSize:[0,0],onChange:function(){},onSelect:function(){}},_=T;k(a);var L=e(t),O=L.clone().removeAttr("id").css({position:"absolute"});O.width(L.width()),O.height(L.height()),L.after(O).hide(),m(O,_.boxWidth,_.boxHeight);var U=O.width(),P=O.height(),B=e("<div />").width(U).height(P).addClass(o("holder")).css({position:"relative",backgroundColor:_.bgColor}).insertAfter(L).append(O);_.addClass&&B.addClass(_.addClass);var J,R,W,X,A,K,q,G,N,V,Y=e("<img />").attr("src",O.attr("src")).css("position","absolute").width(U).height(P),Z=e("<div />").width(r(100)).height(r(100)).css({zIndex:310,position:"absolute",overflow:"hidden"}).append(Y),ee=e("<div />").width(r(100)).height(r(100)).css("zIndex",320),te=e("<div />").css({position:"absolute",zIndex:300}).insertBefore(O).append(Z,ee),ae=_.boundary,ne=x().width(U+2*ae).height(P+2*ae).css({position:"absolute",top:n(-ae),left:n(-ae),zIndex:290}).mousedown(y),re=s(O),oe=function(){function e(e){var e=i(e);v=p=e[0],m=f=e[1]}function t(e){var e=i(e);u=e[0]-v,l=e[1]-m,v=e[0],m=e[1]}function a(){return[u,l]}function n(e){var t=e[0],a=e[1];0>p+t&&(t-=t+p),0>f+a&&(a-=a+f),m+a>P&&(a+=P-(m+a)),v+t>U&&(t+=U-(v+t)),p+=t,v+=t,f+=a,m+=a}function r(e){var t=o();switch(e){case"ne":return[t.x2,t.y];case"nw":return[t.x,t.y];case"se":return[t.x2,t.y2];case"sw":return[t.x,t.y2]}}function o(){if(!_.aspectRatio)return c();var e,t,a=_.aspectRatio,n=_.minSize[0]/A,r=(_.minSize[1]/K,_.maxSize[0]/A),o=_.maxSize[1]/K,i=v-p,u=m-f,l=Math.abs(i),b=Math.abs(u),g=l/b;return 0==r&&(r=10*U),0==o&&(o=10*P),a>g?(t=m,w=b*a,e=0>i?p-w:w+p,0>e?(e=0,h=Math.abs((e-p)/a),t=0>u?f-h:h+f):e>U&&(e=U,h=Math.abs((e-p)/a),t=0>u?f-h:h+f)):(e=v,h=l/a,t=0>u?f-h:f+h,0>t?(t=0,w=Math.abs((t-f)*a),e=0>i?p-w:w+p):t>P&&(t=P,w=Math.abs(t-f)*a,e=0>i?p-w:w+p)),e>p?(n>e-p?e=p+n:e-p>r&&(e=p+r),t=t>f?f+(e-p)/a:f-(e-p)/a):p>e&&(n>p-e?e=p-n:p-e>r&&(e=p-r),t=t>f?f+(p-e)/a:f-(p-e)/a),0>e?(p-=e,e=0):e>U&&(p-=e-U,e=U),0>t?(f-=t,t=0):t>P&&(f-=t-P,t=P),last=d(s(p,f,e,t))}function i(e){return e[0]<0&&(e[0]=0),e[1]<0&&(e[1]=0),e[0]>U&&(e[0]=U),e[1]>P&&(e[1]=P),[e[0],e[1]]}function s(e,t,a,n){var r=e,o=a,i=t,s=n;return e>a&&(r=a,o=e),t>n&&(i=n,s=t),[Math.round(r),Math.round(i),Math.round(o),Math.round(s)]}function c(){var e=v-p,t=m-f;if(J&&Math.abs(e)>J&&(v=e>0?p+J:p-J),R&&Math.abs(t)>R&&(m=t>0?f+R:f-R),X&&Math.abs(t)<X&&(m=t>0?f+X:f-X),W&&Math.abs(e)<W&&(v=e>0?p+W:p-W),0>p&&(v-=p,p-=p),0>f&&(m-=f,f-=f),0>v&&(p-=v,v-=v),0>m&&(f-=m,m-=m),v>U){var a=v-U;p-=a,v-=a}if(m>P){var a=m-P;f-=a,m-=a}if(p>U){var a=p-P;m-=a,f-=a}if(f>P){var a=f-P;m-=a,f-=a}return d(s(p,f,v,m))}function d(e){return{x:e[0],y:e[1],x2:e[2],y2:e[3],w:e[2]-e[0],h:e[3]-e[1]}}var u,l,p=0,f=0,v=0,m=0;return{flipCoords:s,setPressed:e,setCurrent:t,getOffset:a,moveOffset:n,getCorner:r,getFixed:o}}(),ie=function(){function t(t){var a=e("<div />").css({position:"absolute",opacity:_.borderOpacity}).addClass(o(t));return Z.append(a),a}function a(t,a){var n=e("<div />").mousedown(v(t)).css({cursor:t+"-resize",position:"absolute",zIndex:a});return ee.append(n),n}function s(e){return a(e,M++).css({top:n(-E+1),left:n(-E+1),opacity:_.handleOpacity}).addClass(o("handle"))}function c(e){var t=_.handleSize,o=E,i=t,s=t,c=o,d=o;switch(e){case"n":case"s":s=r(100);break;case"e":case"w":i=r(100)}return a(e,M++).width(s).height(i).css({top:n(-c+1),left:n(-d+1)})}function d(e){for(i in e)D[e[i]]=s(e[i])}function u(e){var t=Math.round(e.h/2-E),a=Math.round(e.w/2-E),r=(west=-E+1,e.w-E),o=e.h-E;"e"in D&&D.e.css({top:n(t),left:n(r)})&&D.w.css({top:n(t)})&&D.s.css({top:n(o),left:n(a)})&&D.n.css({left:n(a)}),"ne"in D&&D.ne.css({left:n(r)})&&D.se.css({top:n(o),left:n(r)})&&D.sw.css({top:n(o)}),"b"in D&&D.b.css({top:n(o)})&&D.r.css({left:n(r)})}function l(e,t){Y.css({top:n(-t),left:n(-e)}),te.css({top:n(t),left:n(e)})}function p(e,t){te.width(e).height(t)}function f(){var e=oe.getFixed();oe.setPressed([e.x,e.y]),oe.setCurrent([e.x2,e.y2]),h()}function h(){return k?m():void 0}function m(){var e=oe.getFixed();p(e.w,e.h),l(e.x,e.y),_.drawBorders&&I.right.css({left:n(e.w-1)})&&I.bottom.css({top:n(e.h-1)}),z&&u(e),k||g(),_.onChange(b(e))}function g(){te.show(),O.css("opacity",_.bgOpacity),k=!0}function w(){C(),te.hide(),O.css("opacity",1),k=!1}function y(){z&&(u(oe.getFixed()),ee.show())}function $(){return z=!0,_.allowResize?(u(oe.getFixed()),ee.show(),!0):void 0}function C(){z=!1,ee.hide()}function j(e){(N=e)?C():$()}function S(){j(!1),f()}var k,M=370,I={},D={},z=!1,E=_.handleOffset;_.drawBorders&&(I={top:t("hline").css("top",n(e.browser.msie?-1:0)),bottom:t("hline"),left:t("vline"),right:t("vline")}),_.dragEdges&&(D.t=c("n"),D.b=c("s"),D.r=c("e"),D.l=c("w")),_.sideHandles&&d(["n","s","e","w"]),_.cornerHandles&&d(["sw","nw","ne","se"]);var H=x().mousedown(v("move")).css({cursor:"move",position:"absolute",zIndex:360});return Z.append(H),C(),{updateVisible:h,update:m,release:w,refresh:f,setCursor:function(e){H.css("cursor",e)},enableHandles:$,enableOnly:function(){z=!0},showHandles:y,disableHandles:C,animMode:j,done:S}}(),se=function(){function t(){ne.css({zIndex:450}),u&&e(document).mousemove(n).mouseup(r)}function a(){ne.css({zIndex:290}),u&&e(document).unbind("mousemove",n).unbind("mouseup",r)}function n(e){s(c(e))}function r(e){return e.preventDefault(),e.stopPropagation(),q&&(q=!1,d(c(e)),_.onSelect(b(oe.getFixed())),a(),s=function(){},d=function(){}),!1}function o(e,a){return q=!0,s=e,d=a,t(),!1}function i(e){ne.css("cursor",e)}var s=function(){},d=function(){},u=_.trackDocument;return u||ne.mousemove(n).mouseup(r).mouseout(r),O.before(ne),{activateHandlers:o,setCursor:i}}(),ce=function(){function t(){_.keySupport&&(o.show(),o.focus())}function a(e){o.hide()}function n(e,t,a){_.allowMove&&(oe.moveOffset([t,a]),ie.updateVisible()),e.preventDefault(),e.stopPropagation()}function r(e){if(e.ctrlKey)return!0;V=e.shiftKey?!0:!1;var t=V?10:1;switch(e.keyCode){case 37:n(e,-t,0);break;case 39:n(e,t,0);break;case 38:n(e,0,-t);break;case 40:n(e,0,t);break;case 27:ie.release();break;case 9:return!0}return nothing(e)}var o=e('<input type="radio" />').css({position:"absolute",left:"-30px"}).keypress(r).blur(a),i=e("<div />").css({position:"absolute",overflow:"hidden"}).append(o);return _.keySupport&&i.insertBefore(O),{watchKeys:t}}();ee.hide(),Q(!0);var de={animateTo:C,setSelect:j,setOptions:D,tellSelect:M,tellScaled:I,disable:z,enable:E,cancel:H,focus:ce.watchKeys,getBounds:function(){return[U*A,P*K]},getWidgetSize:function(){return[U,P]},release:ie.release,destroy:F};return L.data("Jcrop",de),de},e.fn.Jcrop=function(t){function a(a){var n=t.useImg||a.src,r=new Image;r.onload=function(){e.Jcrop(a,t)},r.src=n}return"object"!=typeof t&&(t={}),this.each(function(){if(e(this).data("Jcrop")){if("api"==t)return e(this).data("Jcrop");e(this).data("Jcrop").setOptions(t)}else a(this)}),this}}(jQuery);