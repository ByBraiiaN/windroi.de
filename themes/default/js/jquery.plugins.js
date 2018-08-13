function get_html_translation_table(t,e){var a={},n={},i=0,r="";r={};var o={},s={},u={};if(r[0]="HTML_SPECIALCHARS",r[1]="HTML_ENTITIES",o[0]="ENT_NOQUOTES",o[2]="ENT_COMPAT",o[3]="ENT_QUOTES",s=isNaN(t)?t?t.toUpperCase():"HTML_SPECIALCHARS":r[t],u=isNaN(e)?e?e.toUpperCase():"ENT_COMPAT":o[e],"HTML_SPECIALCHARS"!==s&&"HTML_ENTITIES"!==s)throw new Error("Table: "+s+" not supported");a[38]="&amp;","HTML_ENTITIES"===s&&(a[160]="&nbsp;",a[161]="&iexcl;",a[162]="&cent;",a[163]="&pound;",a[164]="&curren;",a[165]="&yen;",a[166]="&brvbar;",a[167]="&sect;",a[168]="&uml;",a[169]="&copy;",a[170]="&ordf;",a[171]="&laquo;",a[172]="&not;",a[173]="&shy;",a[174]="&reg;",a[175]="&macr;",a[176]="&deg;",a[177]="&plusmn;",a[178]="&sup2;",a[179]="&sup3;",a[180]="&acute;",a[181]="&micro;",a[182]="&para;",a[183]="&middot;",a[184]="&cedil;",a[185]="&sup1;",a[186]="&ordm;",a[187]="&raquo;",a[188]="&frac14;",a[189]="&frac12;",a[190]="&frac34;",a[191]="&iquest;",a[192]="&Agrave;",a[193]="&Aacute;",a[194]="&Acirc;",a[195]="&Atilde;",a[196]="&Auml;",a[197]="&Aring;",a[198]="&AElig;",a[199]="&Ccedil;",a[200]="&Egrave;",a[201]="&Eacute;",a[202]="&Ecirc;",a[203]="&Euml;",a[204]="&Igrave;",a[205]="&Iacute;",a[206]="&Icirc;",a[207]="&Iuml;",a[208]="&ETH;",a[209]="&Ntilde;",a[210]="&Ograve;",a[211]="&Oacute;",a[212]="&Ocirc;",a[213]="&Otilde;",a[214]="&Ouml;",a[215]="&times;",a[216]="&Oslash;",a[217]="&Ugrave;",a[218]="&Uacute;",a[219]="&Ucirc;",a[220]="&Uuml;",a[221]="&Yacute;",a[222]="&THORN;",a[223]="&szlig;",a[224]="&agrave;",a[225]="&aacute;",a[226]="&acirc;",a[227]="&atilde;",a[228]="&auml;",a[229]="&aring;",a[230]="&aelig;",a[231]="&ccedil;",a[232]="&egrave;",a[233]="&eacute;",a[234]="&ecirc;",a[235]="&euml;",a[236]="&igrave;",a[237]="&iacute;",a[238]="&icirc;",a[239]="&iuml;",a[240]="&eth;",a[241]="&ntilde;",a[242]="&ograve;",a[243]="&oacute;",a[244]="&ocirc;",a[245]="&otilde;",a[246]="&ouml;",a[247]="&divide;",a[248]="&oslash;",a[249]="&ugrave;",a[250]="&uacute;",a[251]="&ucirc;",a[252]="&uuml;",a[253]="&yacute;",a[254]="&thorn;",a[255]="&yuml;"),"ENT_NOQUOTES"!==u&&(a[34]="&quot;"),"ENT_QUOTES"===u&&(a[39]="&#39;"),a[60]="&lt;",a[62]="&gt;";for(i in a)r=String.fromCharCode(i),n[r]=a[i];return n}function htmlspecialchars_decode(t,e){var a={},n="",i="",r="";if(i=t.toString(),!1===(a=this.get_html_translation_table("HTML_SPECIALCHARS",e)))return!1;for(n in a)r=a[n],i=i.split(r).join(n);return i=i.split("&#039;").join("'")}function number_format(t,e,a,n){t=t,e=e;var i=function(t,e){return e=Math.pow(10,e),(Math.round(t*e)/e).toString()};t=isFinite(+t)?+t:0,e=isFinite(+e)?Math.abs(e):0,n="undefined"==typeof n?",":n,a="undefined"==typeof a?".":a;var r=e>0?i(t,e):i(Math.round(t),e);i=i(Math.abs(t),e);var o;return i>=1e3?(i=i.split(/\D/),o=i[0].length%3||3,i[0]=r.slice(0,o+(0>t))+i[0].slice(o).replace(/(\d{3})/g,n+"$1"),r=i.join(a)):r=r.replace(".",a),t=r.indexOf(a),e>=1&&-1!==t&&r.length-t-1<e?r+=new Array(e-(r.length-t-1)).join(0)+"0":e>=1&&-1===t&&(r+=a+new Array(e).join(0)+"0"),r}function empty(t,e){var a;if(""===t||!e&&(0===t||"0"===t)||null===t||t===!1||"undefined"==typeof t)return!0;if("object"==typeof t){for(a in t)return!1;return!0}return!1}function checkdate(t,e,a){return t>0&&13>t&&a>0&&32768>a&&e>0&&e<=new Date(a,t,0).getDate()}function strpos(t,e,a){return t=(t+"").indexOf(e,a?a:0),-1===t?!1:t}!function(t){function e(t){return"object"==typeof t?t:{top:t,left:t}}var a=t.scrollTo=function(e,a,n){t(window).scrollTo(e,a,n)};a.defaults={axis:"xy",duration:parseFloat(t.fn.jquery)>=1.3?0:1},a.window=function(e){return t(window)._scrollable()},t.fn._scrollable=function(){return this.map(function(){var e=this,a=!e.nodeName||-1!=t.inArray(e.nodeName.toLowerCase(),["iframe","#document","html","body"]);if(!a)return e;var n=(e.contentWindow||e).document||e.ownerDocument||e;return t.browser.safari||"BackCompat"==n.compatMode?n.body:n.documentElement})},t.fn.scrollTo=function(n,i,r){return"object"==typeof i&&(r=i,i=0),"function"==typeof r&&(r={onAfter:r}),"max"==n&&(n=9e9),r=t.extend({},a.defaults,r),i=i||r.speed||r.duration,r.queue=r.queue&&r.axis.length>1,r.queue&&(i/=2),r.offset=e(r.offset),r.over=e(r.over),this._scrollable().each(function(){function o(t){c.animate(h,i,r.easing,t&&function(){t.call(this,n,r)})}var s,u=this,c=t(u),l=n,h={},f=c.is("html,body");switch(typeof l){case"number":case"string":if(/^([+-]=)?\d+(\.\d+)?(px|%)?$/.test(l)){l=e(l);break}l=t(l,this);case"object":(l.is||l.style)&&(s=(l=t(l)).offset())}t.each(r.axis.split(""),function(t,e){var n="x"==e?"Left":"Top",i=n.toLowerCase(),d="scroll"+n,p=u[d],m=a.max(u,e);if(s)h[d]=s[i]+(f?0:p-c.offset()[i]),r.margin&&(h[d]-=parseInt(l.css("margin"+n))||0,h[d]-=parseInt(l.css("border"+n+"Width"))||0),h[d]+=r.offset[i]||0,r.over[i]&&(h[d]+=l["x"==e?"width":"height"]()*r.over[i]);else{var v=l[i];h[d]=v.slice&&"%"==v.slice(-1)?parseFloat(v)/100*m:v}/^\d+$/.test(h[d])&&(h[d]=h[d]<=0?0:Math.min(h[d],m)),!t&&r.queue&&(p!=h[d]&&o(r.onAfterFirst),delete h[d])}),o(r.onAfter)}).end()},a.max=function(e,a){var n="x"==a?"Width":"Height",i="scroll"+n;if(!t(e).is("html,body"))return e[i]-t(e)[n.toLowerCase()]();var r="client"+n,o=e.ownerDocument.documentElement,s=e.ownerDocument.body;return Math.max(o[i],s[i])-Math.min(o[r],s[r])}}(jQuery),jQuery.extend(jQuery.easing,{def:"easeOutQuad",swing:function(t,e,a,n,i){return jQuery.easing[jQuery.easing.def](t,e,a,n,i)},easeInQuad:function(t,e,a,n,i){return n*(e/=i)*e+a},easeOutQuad:function(t,e,a,n,i){return-n*(e/=i)*(e-2)+a},easeInOutQuad:function(t,e,a,n,i){return(e/=i/2)<1?n/2*e*e+a:-n/2*(--e*(e-2)-1)+a},easeInCubic:function(t,e,a,n,i){return n*(e/=i)*e*e+a},easeOutCubic:function(t,e,a,n,i){return n*((e=e/i-1)*e*e+1)+a},easeInOutCubic:function(t,e,a,n,i){return(e/=i/2)<1?n/2*e*e*e+a:n/2*((e-=2)*e*e+2)+a},easeInQuart:function(t,e,a,n,i){return n*(e/=i)*e*e*e+a},easeOutQuart:function(t,e,a,n,i){return-n*((e=e/i-1)*e*e*e-1)+a},easeInOutQuart:function(t,e,a,n,i){return(e/=i/2)<1?n/2*e*e*e*e+a:-n/2*((e-=2)*e*e*e-2)+a},easeInQuint:function(t,e,a,n,i){return n*(e/=i)*e*e*e*e+a},easeOutQuint:function(t,e,a,n,i){return n*((e=e/i-1)*e*e*e*e+1)+a},easeInOutQuint:function(t,e,a,n,i){return(e/=i/2)<1?n/2*e*e*e*e*e+a:n/2*((e-=2)*e*e*e*e+2)+a},easeInSine:function(t,e,a,n,i){return-n*Math.cos(e/i*(Math.PI/2))+n+a},easeOutSine:function(t,e,a,n,i){return n*Math.sin(e/i*(Math.PI/2))+a},easeInOutSine:function(t,e,a,n,i){return-n/2*(Math.cos(Math.PI*e/i)-1)+a},easeInExpo:function(t,e,a,n,i){return 0==e?a:n*Math.pow(2,10*(e/i-1))+a},easeOutExpo:function(t,e,a,n,i){return e==i?a+n:n*(-Math.pow(2,-10*e/i)+1)+a},easeInOutExpo:function(t,e,a,n,i){return 0==e?a:e==i?a+n:(e/=i/2)<1?n/2*Math.pow(2,10*(e-1))+a:n/2*(-Math.pow(2,-10*--e)+2)+a},easeInCirc:function(t,e,a,n,i){return-n*(Math.sqrt(1-(e/=i)*e)-1)+a},easeOutCirc:function(t,e,a,n,i){return n*Math.sqrt(1-(e=e/i-1)*e)+a},easeInOutCirc:function(t,e,a,n,i){return(e/=i/2)<1?-n/2*(Math.sqrt(1-e*e)-1)+a:n/2*(Math.sqrt(1-(e-=2)*e)+1)+a},easeInElastic:function(t,e,a,n,i){var r=1.70158,o=0,s=n;if(0==e)return a;if(1==(e/=i))return a+n;if(o||(o=.3*i),s<Math.abs(n)){s=n;var r=o/4}else var r=o/(2*Math.PI)*Math.asin(n/s);return-(s*Math.pow(2,10*(e-=1))*Math.sin((e*i-r)*(2*Math.PI)/o))+a},easeOutElastic:function(t,e,a,n,i){var r=1.70158,o=0,s=n;if(0==e)return a;if(1==(e/=i))return a+n;if(o||(o=.3*i),s<Math.abs(n)){s=n;var r=o/4}else var r=o/(2*Math.PI)*Math.asin(n/s);return s*Math.pow(2,-10*e)*Math.sin((e*i-r)*(2*Math.PI)/o)+n+a},easeInOutElastic:function(t,e,a,n,i){var r=1.70158,o=0,s=n;if(0==e)return a;if(2==(e/=i/2))return a+n;if(o||(o=i*(.3*1.5)),s<Math.abs(n)){s=n;var r=o/4}else var r=o/(2*Math.PI)*Math.asin(n/s);return 1>e?-.5*(s*Math.pow(2,10*(e-=1))*Math.sin((e*i-r)*(2*Math.PI)/o))+a:s*Math.pow(2,-10*(e-=1))*Math.sin((e*i-r)*(2*Math.PI)/o)*.5+n+a},easeInBack:function(t,e,a,n,i,r){return void 0==r&&(r=1.70158),n*(e/=i)*e*((r+1)*e-r)+a},easeOutBack:function(t,e,a,n,i,r){return void 0==r&&(r=1.70158),n*((e=e/i-1)*e*((r+1)*e+r)+1)+a},easeInOutBack:function(t,e,a,n,i,r){return void 0==r&&(r=1.70158),(e/=i/2)<1?n/2*(e*e*(((r*=1.525)+1)*e-r))+a:n/2*((e-=2)*e*(((r*=1.525)+1)*e+r)+2)+a},easeInBounce:function(t,e,a,n,i){return n-jQuery.easing.easeOutBounce(t,i-e,0,n,i)+a},easeOutBounce:function(t,e,a,n,i){return(e/=i)<1/2.75?n*(7.5625*e*e)+a:2/2.75>e?n*(7.5625*(e-=1.5/2.75)*e+.75)+a:2.5/2.75>e?n*(7.5625*(e-=2.25/2.75)*e+.9375)+a:n*(7.5625*(e-=2.625/2.75)*e+.984375)+a},easeInOutBounce:function(t,e,a,n,i){return i/2>e?.5*jQuery.easing.easeInBounce(t,2*e,0,n,i)+a:.5*jQuery.easing.easeOutBounce(t,2*e-i,0,n,i)+.5*n+a}}),eval(function(t,e,a,n,i,r){if(i=function(t){return(e>t?"":i(parseInt(t/e)))+((t%=e)>35?String.fromCharCode(t+29):t.toString(36))},!"".replace(/^/,String)){for(;a--;)r[i(a)]=n[a]||i(a);n=[function(t){return r[t]}],i=function(){return"\\w+"},a=1}for(;a--;)n[a]&&(t=t.replace(new RegExp("\\b"+i(a)+"\\b","g"),n[a]));return t}("(3($){$.24.T=3(f,g){E k,v,A,F;v=A=F=7;k={C:'',12:'',U:'',1j:'',1A:8,25:'26',1k:'~/2Q/1B.1C',1b:'',27:'28',1l:8,1D:'',1E:'',1F:{},1G:{},1H:{},1I:{},29:[{}]};$.V(k,f,g);2(!k.U){$('2R').1c(3(a,b){1J=$(b).14(0).2S.2T(/(.*)2U\\.2V(\\.2W)?\\.2X$/);2(1J!==2a){k.U=1J[1]}})}4 G.1c(3(){E d,u,15,16,p,H,L,P,17,1m,w,1n,M,18;d=$(G);u=G;15=[];18=7;16=p=0;H=-1;k.1b=1d(k.1b);k.1k=1d(k.1k);3 1d(a,b){2(b){4 a.W(/(\"|')~\\//g,\"$1\"+k.U)}4 a.W(/^~\\//,k.U)}3 2b(){C='';12='';2(k.C){C='C=\"'+k.C+'\"'}l 2(d.1K(\"C\")){C='C=\"T'+(d.1K(\"C\").2c(0,1).2Y())+(d.1K(\"C\").2c(1))+'\"'}2(k.12){12='N=\"'+k.12+'\"'}d.1L('<z '+12+'></z>');d.1L('<z '+C+' N=\"T\"></z>');d.1L('<z N=\"2Z\"></z>');d.2d(\"2e\");17=$('<z N=\"30\"></z>').2f(d);$(1M(k.29)).1N(17);1m=$('<z N=\"31\"></z>').1O(d);2(k.1l===8&&$.X.32!==8){1l=$('<z N=\"33\"></z>').1O(d).1e(\"34\",3(e){E h=d.2g(),y=e.2h,1o,1p;1o=3(e){d.2i(\"2g\",35.36(20,e.2h+h-y)+\"37\");4 7};1p=3(e){$(\"1C\").1P(\"2j\",1o).1P(\"1q\",1p);4 7};$(\"1C\").1e(\"2j\",1o).1e(\"1q\",1p)});1m.2k(1l)}d.2l(1Q).38(1Q);d.1e(\"1R\",3(e,a){2(a.1r!==7){14()}2(u===$.T.2m){Y(a)}});d.1f(3(){$.T.2m=G})}3 1M(b){E c=$('<Z></Z>'),i=0;$('B:2n > Z',c).2i('39','q');$.1c(b,3(){E a=G,t='',1s,B,j;1s=(a.19)?(a.1S||'')+' [3a+'+a.19+']':(a.1S||'');19=(a.19)?'2o=\"'+a.19+'\"':'';2(a.2p){B=$('<B N=\"3b\">'+(a.2p||'')+'</B>').1N(c)}l{i++;2q(j=15.6-1;j>=0;j--){t+=15[j]+\"-\"}B=$('<B N=\"2r 2r'+t+(i)+' '+(a.3c||'')+'\"><a 3d=\"\" '+19+' 1s=\"'+1s+'\">'+(a.1S||'')+'</a></B>').1e(\"3e\",3(){4 7}).2s(3(){4 7}).1q(3(){2(a.2t){3f(a.2t)()}Y(a);4 7}).2n(3(){$('> Z',G).3g();$(D).3h('2s',3(){$('Z Z',17).2u()})},3(){$('> Z',G).2u()}).1N(c);2(a.2v){15.3i(i);$(B).2d('3j').2k(1M(a.2v))}}});15.3k();4 c}3 2w(c){2(c){c=c.3l();c=c.W(/\\(\\!\\(([\\s\\S]*?)\\)\\!\\)/g,3(x,a){E b=a.1T('|!|');2(F===8){4(b[1]!==2x)?b[1]:b[0]}l{4(b[1]===2x)?\"\":b[0]}});c=c.W(/\\[\\!\\[([\\s\\S]*?)\\]\\!\\]/g,3(x,a){E b=a.1T(':!:');2(18===8){4 7}1U=3m(b[0],(b[1])?b[1]:'');2(1U===2a){18=8}4 1U});4 c}4\"\"}3 I(a){2($.3n(a)){a=a(P)}4 2w(a)}3 1g(a){J=I(L.J);1a=I(L.1a);Q=I(L.Q);O=I(L.O);2(Q!==\"\"){q=J+Q+O}l 2(m===''&&1a!==''){q=J+1a+O}l{q=J+(a||m)+O}4{q:q,J:J,Q:Q,1a:1a,O:O}}3 Y(a){E b,j,n,i;P=L=a;14();$.V(P,{1t:\"\",U:k.U,u:u,m:(m||''),p:p,v:v,A:A,F:F});I(k.1D);I(L.1D);2(v===8&&A===8){I(L.3o)}$.V(P,{1t:1});2(v===8&&A===8){R=m.1T(/\\r?\\n/);2q(j=0,n=R.6,i=0;i<n;i++){2($.3p(R[i])!==''){$.V(P,{1t:++j,m:R[i]});R[i]=1g(R[i]).q}l{R[i]=\"\"}}o={q:R.3q('\\n')};11=p;b=o.q.6+(($.X.1V)?n:0)}l 2(v===8){o=1g(m);11=p+o.J.6;b=o.q.6-o.J.6-o.O.6;b-=1u(o.q)}l 2(A===8){o=1g(m);11=p;b=o.q.6;b-=1u(o.q)}l{o=1g(m);11=p+o.q.6;b=0;11-=1u(o.q)}2((m===''&&o.Q==='')){H+=1W(o.q);11=p+o.J.6;b=o.q.6-o.J.6-o.O.6;H=d.K().1h(p,d.K().6).6;H-=1W(d.K().1h(0,p))}$.V(P,{p:p,16:16});2(o.q!==m&&18===7){2y(o.q);1X(11,b)}l{H=-1}14();$.V(P,{1t:'',m:m});2(v===8&&A===8){I(L.3r)}I(L.1E);I(k.1E);2(w&&k.1A){1Y()}A=F=v=18=7}3 1W(a){2($.X.1V){4 a.6-a.W(/\\n*/g,'').6}4 0}3 1u(a){2($.X.2z){4 a.6-a.W(/\\r*/g,'').6}4 0}3 2y(a){2(D.m){E b=D.m.1Z();b.2A=a}l{d.K(d.K().1h(0,p)+a+d.K().1h(p+m.6,d.K().6))}}3 1X(a,b){2(u.2B){2($.X.1V&&$.X.3s>=9.5&&b==0){4 7}1i=u.2B();1i.3t(8);1i.2C('21',a);1i.3u('21',b);1i.3v()}l 2(u.2D){u.2D(a,a+b)}u.1v=16;u.1f()}3 14(){u.1f();16=u.1v;2(D.m){m=D.m.1Z().2A;2($.X.2z){E a=D.m.1Z(),1w=a.3w();1w.3x(u);p=-1;3y(1w.3z(a)){1w.2C('21');p++}}l{p=u.2E}}l{p=u.2E;m=d.K().1h(p,u.3A)}4 m}3 1B(){2(!w||w.3B){2(k.1j){w=3C.2F('','1B',k.1j)}l{M=$('<2G N=\"3D\"></2G>');2(k.25=='26'){M.1O(1m)}l{M.2f(17)}w=M[M.6-1].3E||3F[M.6-1]}}l 2(F===8){2(M){M.3G()}w.2H();w=M=7}2(!k.1A){1Y()}}3 1Y(){2(w.D){3H{22=w.D.2I.1v}3I(e){22=0}w.D.2F();w.D.3J(2J());w.D.2H();w.D.2I.1v=22}2(k.1j){w.1f()}}3 2J(){2(k.1b!==''){$.2K({2L:'3K',2M:7,2N:k.1b,28:k.27+'='+3L(d.K()),2O:3(a){23=1d(a,1)}})}l{2(!1n){$.2K({2M:7,2N:k.1k,2O:3(a){1n=1d(a,1)}})}23=1n.W(/<!-- 3M -->/g,d.K())}4 23}3 1Q(e){A=e.A;F=e.F;v=(!(e.F&&e.v))?e.v:7;2(e.2L==='2l'){2(v===8){B=$(\"a[2o=\"+3N.3O(e.1x)+\"]\",17).1y('B');2(B.6!==0){v=7;B.3P('1q');4 7}}2(e.1x===13||e.1x===10){2(v===8){v=7;Y(k.1H);4 k.1H.1z}l 2(A===8){A=7;Y(k.1G);4 k.1G.1z}l{Y(k.1F);4 k.1F.1z}}2(e.1x===9){2(A==8||v==8||F==8){4 7}2(H!==-1){14();H=d.K().6-H;1X(H,0);H=-1;4 7}l{Y(k.1I);4 k.1I.1z}}}}2b()})};$.24.3Q=3(){4 G.1c(3(){$$=$(G).1P().3R('2e');$$.1y('z').1y('z.T').1y('z').Q($$)})};$.T=3(a){E b={1r:7};$.V(b,a);2(b.1r){4 $(b.1r).1c(3(){$(G).1f();$(G).2P('1R',[b])})}l{$('u').2P('1R',[b])}}})(3S);",62,241,"||if|function|return||length|false|true|||||||||||||else|selection||string|caretPosition|block||||textarea|ctrlKey|previewWindow|||div|shiftKey|li|id|document|var|altKey|this|caretOffset|prepare|openWith|val|clicked|iFrame|class|closeWith|hash|replaceWith|lines||markItUp|root|extend|replace|browser|markup|ul||start|nameSpace||get|levels|scrollPosition|header|abort|key|placeHolder|previewParserPath|each|localize|bind|focus|build|substring|range|previewInWindow|previewTemplatePath|resizeHandle|footer|template|mouseMove|mouseUp|mouseup|target|title|line|fixIeBug|scrollTop|rangeCopy|keyCode|parent|keepDefault|previewAutoRefresh|preview|html|beforeInsert|afterInsert|onEnter|onShiftEnter|onCtrlEnter|onTab|miuScript|attr|wrap|dropMenus|appendTo|insertAfter|unbind|keyPressed|insertion|name|split|value|opera|fixOperaBug|set|refreshPreview|createRange||character|sp|phtml|fn|previewPosition|after|previewParserVar|data|markupSet|null|init|substr|addClass|markItUpEditor|insertBefore|height|clientY|css|mousemove|append|keydown|focused|hover|accesskey|separator|for|markItUpButton|click|call|hide|dropMenu|magicMarkups|undefined|insert|msie|text|createTextRange|moveStart|setSelectionRange|selectionStart|open|iframe|close|documentElement|renderPreview|ajax|type|async|url|success|trigger|templates|script|src|match|jquery|markitup|pack|js|toUpperCase|markItUpContainer|markItUpHeader|markItUpFooter|safari|markItUpResizeHandle|mousedown|Math|max|px|keyup|display|Ctrl|markItUpSeparator|className|href|contextmenu|eval|show|one|push|markItUpDropMenu|pop|toString|prompt|isFunction|beforeMultiInsert|trim|join|afterMultiInsert|version|collapse|moveEnd|select|duplicate|moveToElementText|while|inRange|selectionEnd|closed|window|markItUpPreviewFrame|contentWindow|frame|remove|try|catch|write|POST|encodeURIComponent|content|String|fromCharCode|triggerHandler|markItUpRemove|removeClass|jQuery".split("|"),0,{})),function(t){t.fn.autogrow=function(e){return this.each(function(){new t.autogrow(this,e)})},t.autogrow=function(e,a){this.options=a||{},this.dummy=null,this.interval=null,this.line_height=this.options.lineHeight||parseInt(t(e).css("line-height")),this.min_height=this.options.minHeight||parseInt(t(e).css("min-height")),this.max_height=this.options.maxHeight||parseInt(t(e).css("max-height")),this.textarea=t(e),NaN==this.line_height&&(this.line_height=0),this.init()},t.autogrow.fn=t.autogrow.prototype={autogrow:"1.2.2"},t.autogrow.fn.extend=t.autogrow.extend=t.extend,t.autogrow.fn.extend({init:function(){var t=this;this.textarea.css({overflow:"hidden",display:"block"}),this.textarea.bind("focus",function(){t.startExpand()}).bind("blur",function(){t.stopExpand()}),this.checkExpand()},startExpand:function(){var t=this;this.interval=window.setInterval(function(){t.checkExpand()},400)},stopExpand:function(){clearInterval(this.interval)},checkExpand:function(){null==this.dummy&&(this.dummy=t("<div></div>"),this.dummy.css({"font-size":this.textarea.css("font-size"),"font-family":this.textarea.css("font-family"),width:this.textarea.css("width"),padding:this.textarea.css("padding"),"line-height":this.line_height+"px","overflow-x":"hidden",position:"absolute",top:0,left:-9999}).appendTo("body"));var e=this.textarea.val().replace(/(<|>)/g,"");e=$.browser.msie?e.replace(/\n/g,"<BR>new"):e.replace(/\n/g,"<br>new"),this.dummy.html()!=e&&(this.dummy.html(e),this.max_height>0&&this.dummy.height()+this.line_height>this.max_height?this.textarea.css("overflow-y","auto"):(this.textarea.css("overflow-y","hidden"),(this.textarea.height()<this.dummy.height()+this.line_height||this.dummy.height()<this.textarea.height())&&this.textarea.animate({height:this.dummy.height()+this.line_height+"px"},100)))}})}(jQuery);!function(t){function i(t){(t.attr("title")||"string"!=typeof t.attr("original-title"))&&t.attr("original-title",t.attr("title")||"").removeAttr("title")}function e(e,s){this.$element=t(e),this.options=s,this.enabled=!0,i(this.$element)}e.prototype={show:function(){var i=this.getTitle();if(i&&this.enabled){var e=this.tip();e.find(".tipsy-inner")[this.options.html?"html":"text"](i),e[0].className="tipsy",e.remove().css({top:0,left:0,visibility:"hidden",display:"block"}).appendTo(document.body);var s,n=t.extend({},this.$element.offset(),{width:this.$element[0].offsetWidth,height:this.$element[0].offsetHeight}),o=e[0].offsetWidth,l=e[0].offsetHeight,a="function"==typeof this.options.gravity?this.options.gravity.call(this.$element[0]):this.options.gravity;switch(a.charAt(0)){case"n":s={top:n.top+n.height+this.options.offset,left:n.left+n.width/2-o/2};break;case"s":s={top:n.top-l-this.options.offset,left:n.left+n.width/2-o/2};break;case"e":s={top:n.top+n.height/2-l/2,left:n.left-o-this.options.offset};break;case"w":s={top:n.top+n.height/2-l/2,left:n.left+n.width+this.options.offset}}2==a.length&&("w"==a.charAt(1)?s.left=n.left+n.width/2-15:s.left=n.left+n.width/2-o+15),e.css(s).addClass("tipsy-"+a),this.options.fade?e.stop().css({opacity:0,display:"block",visibility:"visible"}).animate({opacity:this.options.opacity}):e.css({visibility:"visible",opacity:this.options.opacity})}},hide:function(){this.options.fade?this.tip().stop().fadeOut(function(){t(this).remove()}):this.tip().remove()},getTitle:function(){var t,e=this.$element,s=this.options;i(e);var t,s=this.options;return"string"==typeof s.title?t=e.attr("title"==s.title?"original-title":s.title):"function"==typeof s.title&&(t=s.title.call(e[0])),t=(""+t).replace(/(^\s*|\s*$)/,""),t||s.fallback},tip:function(){return this.$tip||(this.$tip=t('<div class="tipsy"></div>').html('<div class="tipsy-arrow"></div><div class="tipsy-inner"/></div>')),this.$tip},validate:function(){this.$element[0].parentNode||(this.hide(),this.$element=null,this.options=null)},enable:function(){this.enabled=!0},disable:function(){this.enabled=!1},toggleEnabled:function(){this.enabled=!this.enabled}},t.fn.tipsy=function(i){function s(s){var n=t.data(s,"tipsy");return n||(n=new e(s,t.fn.tipsy.elementOptions(s,i)),t.data(s,"tipsy",n)),n}function n(){var t=s(this);t.hoverState="in",0==i.delayIn?t.show():setTimeout(function(){"in"==t.hoverState&&t.show()},i.delayIn)}function o(){var t=s(this);t.hoverState="out",0==i.delayOut?t.hide():setTimeout(function(){"out"==t.hoverState&&t.hide()},i.delayOut)}if(i===!0)return this.data("tipsy");if("string"==typeof i)return this.data("tipsy")[i]();if(i=t.extend({},t.fn.tipsy.defaults,i),i.live||this.each(function(){s(this)}),"manual"!=i.trigger){var l=i.live?"live":"bind",a="hover"==i.trigger?"mouseenter":"focus",h="hover"==i.trigger?"mouseleave":"blur";this[l](a,n)[l](h,o)}return this},t.fn.tipsy.defaults={delayIn:0,delayOut:0,fade:!1,fallback:"",gravity:"n",html:!1,live:!1,offset:0,opacity:.8,title:"title",trigger:"hover"},t.fn.tipsy.elementOptions=function(i,e){return t.metadata?t.extend({},e,t(i).metadata()):e},t.fn.tipsy.autoNS=function(){return t(this).offset().top>t(document).scrollTop()+t(window).height()/2?"s":"n"},t.fn.tipsy.autoWE=function(){return t(this).offset().left>t(document).scrollLeft()+t(window).width()/2?"e":"w"}}(jQuery);var vcard_cache=new Array;!function(t){t.fn.tooltip=function(e){e=t.extend({className:"tooltip",content:"title",offset:[0,0],align:"center",inDelay:100,outDelay:100},e||{});var a=function(e){var a=t.data(e,"tooltip");a&&!t.data(a[0],"hover")&&a.hide()},n=function(e,a){var n=t(a).find(".bubble-content").css("height"),i=n.replace("px","");i=parseInt(i)+25,t(a).css({top:e-i})};this.live("mouseenter",function(){var i=this;setTimeout(function(){var r=t.extend({},t(i).offset(),{width:i.offsetWidth,height:i.offsetHeight}),o=!0;if(t.data(i,"tooltip")){var s=t.data(i,"tooltip").show();n(r.top,s),o=!1}else{var u;"string"==typeof e.content&&"undefined"!=t(i).attr(e.content)&&""!=t(i).attr(e.content)?u=t(i).attr(e.content):"function"==typeof e.content&&(u=e.content(i));var c='<div class="bubble-wrapper">';if(c+='<div class="bubble-divot"></div>',c+='<div class="bubble-content">',c+='<div class="loading-msg">Cargando...</div>',c+="</div>",c+="</div>","undefined"==typeof vcard_cache["mf"+u]||""==vcard_cache["mf"+u]){var s=t('<div class="'+e.className+'">'+c+"</div>").appendTo(document.body);t.ajax({type:"POST",url:global_data.url+"/live-vcard.php",data:"uid="+u,success:function(t){s.find(".bubble-content").html(t),vcard_cache["mf"+u]=t},complete:function(){n(r.top,s),o=!1}})}else{var s=t('<div class="'+e.className+'">'+c+"</div>").appendTo(document.body);s.find(".bubble-content").html(vcard_cache["mf"+u]),n(r.top,s),o=!1}t.data(i,"tooltip",s),s.hover(function(){t.data(this,"hover",!0)},function(){t.removeData(this,"hover"),setTimeout(function(){a(i)},e.outDelay)})}s.css({display:"block",position:"absolute",zIndex:99,left:0});var l;"left"==e.align?l=r.left:"center"==e.align?l=r.left+r.width/2-s[0].offsetWidth/2:"right"==e.align&&(l=r.left+r.width-s[0].offsetWidth),l+=e.offset[1],s.css({left:l}),1==o&&s.css({top:r.top+e.offset[0]})},e.inDelay)}).live("mouseleave",function(){var t=this;setTimeout(function(){a(t)},e.outDelay)})}}(jQuery),function(t){t.fn.extend({autocomplete:function(e,a){var n="string"==typeof e;return a=t.extend({},t.Autocompleter.defaults,{url:n?e:null,data:n?null:e,delay:n?t.Autocompleter.defaults.delay:10,max:a&&!a.scroll?10:150},a),a.highlight=a.highlight||function(t){return t},a.formatMatch=a.formatMatch||a.formatItem,this.each(function(){new t.Autocompleter(this,a)})},result:function(t){return this.bind("result",t)},search:function(t){return this.trigger("search",[t])},flushCache:function(){return this.trigger("flushCache")},setOptions:function(t){return this.trigger("setOptions",[t])},unautocomplete:function(){return this.trigger("unautocomplete")}}),t.Autocompleter=function(e,a){function n(){var n=I.selected();if(!n)return!1;var i=n.result;if(w=i,a.multiple){var o=r(b.val());if(o.length>1){var s,u=a.multipleSeparator.length,l=t(e).selection().start,h=0;t.each(o,function(t,e){return h+=e.length,h>=l?(s=t,!1):void(h+=u)}),o[s]=i,i=o.join(a.multipleSeparator)}i+=a.multipleSeparator}return b.val(i),c(),b.trigger("result",[n.data,n.value]),!0}function i(t,e){if(m==g.DEL)return void I.hide();var n=b.val();(e||n!=w)&&(w=n,n=o(n),n.length>=a.minChars?(b.addClass(a.loadingClass),a.matchCase||(n=n.toLowerCase()),h(n,l,c)):(d(),I.hide()))}function r(e){return e?a.multiple?t.map(e.split(a.multipleSeparator),function(a){return t.trim(e).length?t.trim(a):null}):[t.trim(e)]:[""]}function o(n){if(!a.multiple)return n;var i=r(n);if(1==i.length)return i[0];var o=t(e).selection().start;return i=r(o==n.length?n:n.replace(n.substring(o),"")),i[i.length-1]}function s(n,i){a.autoFill&&o(b.val()).toLowerCase()==n.toLowerCase()&&m!=g.BACKSPACE&&(b.val(b.val()+i.substring(o(w).length)),t(e).selection(w.length,w.length+i.length))}function u(){clearTimeout(p),p=setTimeout(c,200)}function c(){I.visible();I.hide(),clearTimeout(p),d(),a.mustMatch&&b.search(function(t){if(!t)if(a.multiple){var e=r(b.val()).slice(0,-1);b.val(e.join(a.multipleSeparator)+(e.length?a.multipleSeparator:""))}else b.val(""),b.trigger("result",null)})}function l(t,e){e&&e.length&&C?(d(),I.display(e,t),s(t,e[0].value),I.show()):c()}function h(n,i,r){a.matchCase||(n=n.toLowerCase());var s=y.load(n);if(s&&s.length)i(n,s);else if("string"==typeof a.url&&a.url.length>0){var u={timestamp:+new Date};t.each(a.extraParams,function(t,e){u[t]="function"==typeof e?e():e}),t.ajax({mode:"abort",port:"autocomplete"+e.name,dataType:a.dataType,url:a.url,data:t.extend({q:o(n),limit:a.max},u),success:function(t){var e=a.parse&&a.parse(t)||f(t);y.add(n,e),i(n,e)}})}else I.emptyList(),r(n)}function f(e){for(var n=[],i=e.split("\n"),r=0;r<i.length;r++){var o=t.trim(i[r]);o&&(o=o.split("|"),n[n.length]={data:o,value:o[0],result:a.formatResult&&a.formatResult(o,o[0])||o[0]})}return n}function d(){b.removeClass(a.loadingClass)}var p,m,v,g={UP:38,DOWN:40,DEL:46,TAB:9,RETURN:13,ESC:27,COMMA:188,PAGEUP:33,PAGEDOWN:34,BACKSPACE:8},b=t(e).attr("autocomplete","off").addClass(a.inputClass),w="",y=t.Autocompleter.Cache(a),C=0,x={mouseDownOnSelect:!1},I=t.Autocompleter.Select(a,e,n,x);t.browser.opera&&t(e.form).bind("submit.autocomplete",function(){return v?(v=!1,!1):void 0}),b.bind((t.browser.opera?"keypress":"keydown")+".autocomplete",function(e){switch(C=1,m=e.keyCode,e.keyCode){case g.UP:e.preventDefault(),I.visible()?I.prev():i(0,!0);break;case g.DOWN:e.preventDefault(),I.visible()?I.next():i(0,!0);break;case g.PAGEUP:e.preventDefault(),I.visible()?I.pageUp():i(0,!0);break;case g.PAGEDOWN:e.preventDefault(),I.visible()?I.pageDown():i(0,!0);break;case a.multiple&&","==t.trim(a.multipleSeparator)&&g.COMMA:case g.TAB:case g.RETURN:if(n())return e.preventDefault(),v=!0,!1;break;case g.ESC:I.hide();break;default:clearTimeout(p),p=setTimeout(i,a.delay)}}).focus(function(){C++}).blur(function(){C=0,x.mouseDownOnSelect||u()}).click(function(){C++>1&&!I.visible()&&i(0,!0)}).bind("search",function(){function e(t,e){var n;if(e&&e.length)for(var i=0;i<e.length;i++)if(e[i].result.toLowerCase()==t.toLowerCase()){n=e[i];break}"function"==typeof a?a(n):b.trigger("result",n&&[n.data,n.value])}var a=arguments.length>1?arguments[1]:null;t.each(r(b.val()),function(t,a){h(a,e,e)})}).bind("flushCache",function(){y.flush()}).bind("setOptions",function(){t.extend(a,arguments[1]),"data"in arguments[1]&&y.populate()}).bind("unautocomplete",function(){I.unbind(),b.unbind(),t(e.form).unbind(".autocomplete")})},t.Autocompleter.defaults={inputClass:"ac_input",resultsClass:"ac_results",loadingClass:"ac_loading",minChars:1,delay:400,matchCase:!1,matchSubset:!0,matchContains:!1,cacheLength:10,max:100,mustMatch:!1,extraParams:{},selectFirst:!0,formatItem:function(t){return t[0]},formatMatch:null,autoFill:!1,width:0,multiple:!1,multipleSeparator:", ",highlight:function(t,e){return t.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)("+e.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi,"\\$1")+")(?![^<>]*>)(?![^&;]+;)","gi"),"<strong>$1</strong>")},scroll:!0,scrollHeight:180},t.Autocompleter.Cache=function(e){function a(t,a){e.matchCase||(t=t.toLowerCase());var n=t.indexOf(a);return"word"==e.matchContains&&(n=t.toLowerCase().search("\\b"+a.toLowerCase())),-1==n?!1:0==n||e.matchContains}function n(t,a){s>e.cacheLength&&r(),o[t]||s++,o[t]=a}function i(){if(!e.data)return!1;var a={},i=0;e.url||(e.cacheLength=1),a[""]=[];for(var r=0,o=e.data.length;o>r;r++){var s=e.data[r];s="string"==typeof s?[s]:s;var u=e.formatMatch(s,r+1,e.data.length);if(u!==!1){var c=u.charAt(0).toLowerCase();a[c]||(a[c]=[]);var l={value:u,data:s,result:e.formatResult&&e.formatResult(s)||u};a[c].push(l),i++<e.max&&a[""].push(l)}}t.each(a,function(t,a){e.cacheLength++,n(t,a)})}function r(){o={},s=0}var o={},s=0;return setTimeout(i,25),{flush:r,add:n,populate:i,load:function(n){if(!e.cacheLength||!s)return null;if(!e.url&&e.matchContains){var i=[];for(var r in o)if(r.length>0){var u=o[r];t.each(u,function(t,e){a(e.value,n)&&i.push(e)})}return i}if(o[n])return o[n];if(e.matchSubset)for(var c=n.length-1;c>=e.minChars;c--){var u=o[n.substr(0,c)];if(u){var i=[];return t.each(u,function(t,e){a(e.value,n)&&(i[i.length]=e)}),i}}return null}}},t.Autocompleter.Select=function(e,a,n,i){function r(){b&&(d=t("<div/>").hide().addClass(e.resultsClass).css("position","absolute").appendTo(document.body),p=t("<ul/>").appendTo(d).mouseover(function(e){o(e).nodeName&&"LI"==o(e).nodeName.toUpperCase()&&(v=t("li",p).removeClass(m.ACTIVE).index(o(e)),t(o(e)).addClass(m.ACTIVE))}).click(function(e){return t(o(e)).addClass(m.ACTIVE),n(),a.focus(),!1}).mousedown(function(){i.mouseDownOnSelect=!0}).mouseup(function(){i.mouseDownOnSelect=!1}),e.width>0&&d.css("width",e.width),b=!1)}function o(t){for(var e=t.target;e&&"LI"!=e.tagName;)e=e.parentNode;return e?e:[]}function s(t){h.slice(v,v+1).removeClass(m.ACTIVE),u(t);var a=h.slice(v,v+1).addClass(m.ACTIVE);if(e.scroll){var n=0;h.slice(0,v).each(function(){n+=this.offsetHeight}),n+a[0].offsetHeight-p.scrollTop()>p[0].clientHeight?p.scrollTop(n+a[0].offsetHeight-p.innerHeight()):n<p.scrollTop()&&p.scrollTop(n)}}function u(t){v+=t,0>v?v=h.size()-1:v>=h.size()&&(v=0)}function c(t){return e.max&&e.max<t?e.max:t}function l(){p.empty();for(var a=c(f.length),n=0;a>n;n++)if(f[n]){var i=e.formatItem(f[n].data,n+1,a,f[n].value,g);if(i!==!1){var r=t("<li/>").html(e.highlight(i,g)).addClass(n%2==0?"ac_even":"ac_odd").appendTo(p)[0];t.data(r,"ac_data",f[n])}}h=p.find("li"),e.selectFirst&&(h.slice(0,1).addClass(m.ACTIVE),v=0),t.fn.bgiframe&&p.bgiframe()}var h,f,d,p,m={ACTIVE:"ac_over"},v=-1,g="",b=!0;return{display:function(t,e){r(),f=t,g=e,l()},next:function(){s(1)},prev:function(){s(-1)},pageUp:function(){s(0!=v&&0>v-8?-v:-8)},pageDown:function(){s(v!=h.size()-1&&v+8>h.size()?h.size()-1-v:8)},hide:function(){d&&d.hide(),h&&h.removeClass(m.ACTIVE),v=-1},visible:function(){return d&&d.is(":visible")},current:function(){return this.visible()&&(h.filter("."+m.ACTIVE)[0]||e.selectFirst&&h[0])},show:function(){var n=t(a).offset();if(d.css({width:"string"==typeof e.width||e.width>0?e.width:t(a).width(),top:n.top+a.offsetHeight,left:n.left}).show(),e.scroll&&(p.scrollTop(0),p.css({maxHeight:e.scrollHeight,overflow:"auto"}),t.browser.msie&&"undefined"==typeof document.body.style.maxHeight)){var i=0;h.each(function(){i+=this.offsetHeight});var r=i>e.scrollHeight;p.css("height",r?e.scrollHeight:i),r||h.width(p.width()-parseInt(h.css("padding-left"))-parseInt(h.css("padding-right")))}},selected:function(){var e=h&&h.filter("."+m.ACTIVE).removeClass(m.ACTIVE);return e&&e.length&&t.data(e[0],"ac_data")},emptyList:function(){p&&p.empty()},unbind:function(){d&&d.remove()}}},t.fn.selection=function(t,e){if(void 0!==t)return this.each(function(){if(this.createTextRange){var a=this.createTextRange();void 0===e||t==e?(a.move("character",t),a.select()):(a.collapse(!0),a.moveStart("character",t),a.moveEnd("character",e),a.select())}else this.setSelectionRange?this.setSelectionRange(t,e):this.selectionStart&&(this.selectionStart=t,this.selectionEnd=e)});var a=this[0];if(a.createTextRange){var n=document.selection.createRange(),i=a.value,r="<->",o=n.text.length;n.text=r;var s=a.value.indexOf(r);return a.value=i,this.selection(s,s+o),{start:s,end:s+o}}return void 0!==a.selectionStart?{start:a.selectionStart,end:a.selectionEnd}:void 0}}(jQuery),function(t){t.fn.lazyload=function(e){var a={placeHolder:"blank.gif",effect:"show",effectSpeed:0,sensitivity:0};e&&t.extend(a,e),this.each(function(){t(this).attr("src")!=a.placeHolder&&t(this).attr("src",a.placeHolder),t(this).one("dl",function(){t(this).attr("orig")&&t(this).attr("orig")!=t(this).attr("src")&&t(this).hide().attr("src",t(this).attr("orig"))[a.effect](a.effectSpeed)})});var n=this;return t(window).bind("scroll",function(){t(n).filter("[src$="+a.placeHolder+"]").each(function(){t(window).height()+t(window).scrollTop()>t(this).offset().top-a.sensitivity&&t(window).width()+t(window).scrollLeft()>t(this).offset().left-a.sensitivity&&t(window).scrollTop()<t(this).offset().top+t(this).height()+a.sensitivity&&t(window).scrollLeft()<t(this).offset().left+t(this).width()+a.sensitivity&&t(this).trigger("dl")})}),t(window).trigger("scroll"),this}}(jQuery);