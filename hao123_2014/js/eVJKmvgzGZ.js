PDC&&PDC.mark("c_jl");
(function(l,j,h,g){function f(a){var q,D,b,c,d,e;q=x[a];if(!q)throw Error('Requiring unknown module "'+a+'"');if(q.hasOwnProperty("exports"))return q.exports;q.exports=a={};D=q.deps;e=D.length;d=-1;for(c=[];++d<e;)b=D[d],c.push("module"===b?q:"exports"===b?a:f(b));if((D=q.factory.apply(null,c))!==g)q.exports=a=D;return a}function b(a,q,b){q=["global","require","module","exports"].concat(q);x[a]={factory:b,deps:q}}function e(a,q,b){var c=Array.prototype.slice;e=function(a,q,b){var D=c.call(arguments,
1);return c.apply(a,D)};return e.apply(this,e(arguments,0))}function c(a,q){q=q||h;return q.getElementById(a)}function d(a){for(var a=a||{},q=arguments,b=q.length,c=0,d,e;++c<b;)for(e in d=q[c],d)d.hasOwnProperty(e)&&(a[e]=d[e]);return a}function a(b,q,c){var e;this instanceof a?(this.constructor=b,d(this,c)):(e=a.prototype,a.prototype=q.prototype,b.prototype=new a(b,q,c),a.prototype=e)}function i(){function a(){for(var e=-1,F;++e<d;)F=b[e],F[0].apply(F[1],F[2]),delete b[e];b=[];d=0;c=null}var b=
[],c=null,d=0;i=function(G,H,f){if(!G)return i;b.push([G,H||this,e(arguments,2)]);d++;null===c&&(c=setTimeout(a,0));return c};return i.apply(this,e(arguments,0))}function k(a){var b,c=h.getElementsByTagName("head");b=c.length&&c[0]||h.body;k=function(a){b.appendChild(a)};return k(a)}function r(a,b){var c=n(a)?[]:{};"function"!=typeof b&&(b=b===g?function(a,b){return!!b}:function(a,c){return c==b});o(a,function(a,d){b(a,d)&&(c[a]=d)});return c}function z(a,b,c){var d,e;d=h.createElement(a);e=d.style;
b&&o(b,function(a,b){d[a]=b});e&&c&&o(c,function(a,b){e[a]=b});return d}function o(a,b){y(a,function(a,c){b(a,c);return!1})}function y(a,b){var c;c=a.length;return(c===g||u(a)?function(a,b){for(var c in a)if(a.hasOwnProperty(c)&&b(c,a[c]))return!0;return!1}:function(a,b){var d;for(d=0;d<c;d++)if(b(d,a[d]))return!0;return!1})(a,b)}function s(a){for(var b="Boolean,Number,String,Function,Array,Date,RegExp,Object".split(","),c=b.length,d=Object.prototype.toString,e={},i;c--;)i=b[c],e["[object "+i+"]"]=
i.toLowerCase();s=function(a){return null==a?""+a:e[d.call(a)]||"object"};return s(a)}function u(a){return"function"===s(a)}function n(a){function b(a){return"array"===s(a)}n=Array.isArray||b;return n(a)}function u(a){return"[object Function]"==Object.prototype.toString.call(a)}function C(a,b){return m(a,b,e(arguments,2))}function m(a,b,c){A.push([a,b,c]);if(!v){for(v=!0;a=A.length;){for(b=0;b<a;b++)c=A[b],c[0].apply(c[1],c[2]);A.splice(0,a)}v=!1}}var x={};x.global={exports:l};x.require={exports:f};
var E={addHandler:function(a,b,c){a.addEventListener?a.addEventListener(b,c,!1):a.attachEvent?a.attachEvent("on"+b,c):a["on"+b]=c},getEvent:function(a){return a?a:j.event},getTarget:function(a){return a.target||a.srcElement},preventDefault:function(a){a.preventDefault?a.preventDefault():a.returnValue=!1},stopPropagation:function(a){a.stopPropagation?a.stopPropagation():a.cancelBubble=!0},removeHandler:function(a,b,c){a.removeEventListener?a.removeEventListener(b,c,!1):a.detachEvent?a.detachEvent("on"+
b,c):a["on"+b]=null}},A=[],v=!1;b("Arbiter",["global"],function(a,b){function c(a){this._listenerMap={};this._setup(a||[])}function i(a,b){var c=a[0],d=a[1],b=a[2].concat(b);try{return c.apply(d,b)}catch(e){setTimeout(function(){throw e;},0)}}a=b("global");d(c.prototype,{_setup:function(a){for(var b=a.length,c=this._listenerMap;b--;)c[a[b]]={args:null,cbs:[]}},on:function(b,c,d){var i=this._listenerMap[b],B,p;if(!i)return!1;d=d||a;B=e(arguments,3);(p=i.args)?m(c,d,B.concat(p)):i.cbs.push([c,d,B]);
return!0},done:function(a,b){var c=this._listenerMap[a],d,i,p;if(!c)return!0;i=c.cbs;p=i.length;b=e(arguments,1);c.args=b;d=this.emit.apply(this,arguments);c.cbs=i.slice(p);return d},emit:function(a,b){var c=this._listenerMap[a],d,f,p;if(!c)throw Error(a+" has not listened");b=e(arguments,1);c=c.cbs;d=c.length;f=-1;for(p=!0;++f<d;)p=!1!==i(c[f],b)&&p;return!!p},undo:function(a){a=this._listenerMap[a];if(!a)return!1;a.args=null}});return c});b("Resource",["Arbiter","CSSLoader","JSLoader"],function(b,
c){function e(a,b){if(this instanceof e)k.call(this,t),this.id=a,this.deps=b,this.loaded=!1,this.state=w;else return i(a)}function i(a){var b,c;if(!(b=h[a]))throw Error('resource "'+a+'" unknow.');if(!(c=b._handler))c=b._handler=new e(a,b.deps||[]),b._loaded&&(c.loaded=!0);return c}function f(a,b){B[a]=b}function m(a,b){var c;if(b!==g)c=h[a]||{},d(c,b),h[a]=c;else for(a in b=a,b)m(a,b[a])}var k=c("Arbiter"),h={},B={},p={},t=["load","resolve"],w=1;a(e,k,{load:function(){function a(){--d||(f=!0,w&&
this.done("resolve"))}function b(){w=!0;this.done("load");f&&this.done("resolve")}var c,d,t,p,i,w,f;if(2<=this.state)return!1;this.state=2;w=this.loaded;f=!0;c=this.deps;t=d=c.length;if(0<t){f=!1;for(p=-1;++p<t;)i=e(c[p]),i.on("resolve",a,this),i.load()}C(function(){var a;if(w)C(b,this);else{a=this.id;var c,d,e;c=h[a];d=c.type;if(!(e=B[d]))throw Error('unknow type "'+d+'"');a=new e(a,c);a.on("load",b,this);a.load()}},this)}});d(e,{setResourceMap:m,setModuleMap:function(a){d(p,a)},setResourceLoaded:function(a){var b;
for(b=a.length;b--;)m(a[b],{_loaded:!0})},moudelToResource:function(a){var b=p[a];if(!b)throw Error('module "'+a+'" unknow.');return i(b)}});f("css",c("CSSLoader"));f("js",c("JSLoader"));return e});b("Pagelet",["Arbiter","Resource"],function(b,e){function f(a){if(this instanceof f)m.call(this,h),this.id=a,this.root=null===a,this.state=g;else{var b;if(null===a)return new f(a);b=n[a];b||(b=new f(a),n[a]=b);return b}}var m=e("Arbiter"),k=e("Resource"),h="arrive,beforeload,cssresolved,jsresolved,beforedisplay,display,load,afterload,resolved,beforeunload,unload,afterunload".split(","),
g=0,n={},B={};a(f,m,{arrive:function(a){d(this,{html:a.html||"",css:a.css||[],js:a.js||[],parent:a.parent?f(a.parent):null,children:a.children||[],state:1});this.afterload=!1;this.done("arrive");this.emit("beforeload")?this.load():(this.afterload=!0,this.done("afterload"))},load:function(){function a(){this.parent.on("display",b,this)}function b(){this.emit("beforedisplay")&&this.display()}if(2<=this.state)return!1;this.state=2;this.on("cssresolved",this.parent?a:b,this);this._resolve(this.css,"cssresolved");
this._resolve(this.js,"jsresolved")},setState:function(){if(3>this.state)return!1;this.state=4;var a,b,c,d;a=this.children;b=a.length;c=-1;if(b)for(;++c<b;)d=a[c],d=f(d),d.setState()},doUnload:function(){function a(){--b||this.emit("beforeunload")&&this.unload()}var b,c,d,e,i;c=this.children;d=b=c.length;e=-1;if(d)for(;++e<d;)i=c[e],i=f(i),i.on("unload",a,this),i.doUnload();else this.emit("beforeunload")&&this.unload()},remove:function(){if(4==this.state)return!1;this.setState();this.on("unload",
this.destroy,this);this.doUnload()},unload:function(){this.done("unload")},destroy:function(){var a,b,c,d;a=this.children;b=a.length;c=-1;if(b)for(;++c<b;)d=a[c],d=f(d),d.destroy();delete n[this.id];this.state=g;i(this.done,this,"afterunload")},isUnloading:function(){return 4==this.state},_resolve:function(a,b){function c(){--d||this.done(b)}var d,e,i,f;e=d=a.length;i=-1;if(e)for(;++i<e;)f=k(a[i]),f.on("resolve",c,this),f.load();else this.done(b)},display:function(){if(3<=this.state)return!1;this.state=
3;this.root||(c(this.id).innerHTML=this.html);this.done("display");this.on("jsresolved",function(){this.done("load");this.afterload||this.done("afterload")},this)},get:function(a,b){return B[a]||b},set:function(a,b){B[a]=b}});d(f,{hasPagelet:function(a){return!!n[a]}});return f});b("BigPipe",["Resource","Emulator","Arbiter","Requestor"],function(b,c){function d(){f.call(this);this.hooks={}}var e=c("Resource"),i=c("Emulator"),f=c("Arbiter"),m=c("Requestor"),g=!1;a(d,f,{init:function(a){if(g)throw Error("BigPipe has been initialized.");
g=!0;this.emulator=i();this.emulator.listen();this.emulator.on("request",this.request,this);this.requestor=new m(a)},onPageletArrive:function(a){var b=a.callback,c,d,i,f,m,g,k=this.hooks;if(b){c=a.hook||{};for(var h in b){d=b[h];i=-1;f=d.length;for(m=c[h]||[];++i<f;)g=d[i],m.push(k[g]),delete k[g];c[h]=m}a.hook=c}e.setResourceMap(a.map||{});e.setModuleMap(a.mods||{});this.requestor.arrive(a)},request:function(a,b){this.requestor.request(a,b)},sessionStart:function(a){this.requestor.start(a)},sessionEnd:function(a){this.requestor.end(a)},
loadModule:function(a,b){var c=e.moudelToResource(a);c.on("resolve",b);c.load()},loadedResource:function(a){e.setResourceLoaded(a)},log:function(){}});return d});b("CSSLoader",["Arbiter"],function(b,c){function d(a,b){t.call(this,w);this.id=a;this.url=b.src;this.state=E}function e(a){v||(v=h.createElement("meta"),k(v));o=a||o;v.className=o.join(" ")}function f(a){return!a?!1:(a=j.getComputedStyle?getComputedStyle(a,null):a.currentStyle)&&1<parseInt(a.height,10)}function m(){var a,b,c,d,i,g,t,h,k,
w,n,p;b=2<o.length?f(v):!0;c=0;d=[];i=!1;g=+new Date;for(a in A){t=A[a];h=t[0];k=!1;b&&f(h)&&(k=!0);for(n=1,w=t.length;n<w;n++)p=t[n],k?p[1].call(p[2],!0):p[0]<g&&(p[1].call(p[2],!1),t.splice(n,1),n--,w--);k||1==w?(h.parentNode.removeChild(h),delete A[a],i=!0):(d.push("css_"+a),c++)}c?(i&&e(d),setTimeout(m,20)):(o=[],v&&(v.parentNode.removeChild(v),v=null),s=!1)}function g(a,b,c,d){var f,t;if(!(f=A[a]))t="css_"+a,f=h.createElement("meta"),f.className=t,k(f),f=[f],A[a]=f,o.push(t),e();b=+new Date+
b;f.push([b,c,d]);s||(s=!0,i(m))}function n(a){this.state=a?l:C;this.done("load",a)}function x(){var a=this.id,b=this.url,c=h.createElement("link");c.rel="stylesheet";c.type="text/css";c.href=b;k(c);g(a,y,n,this)}function p(){for(var a=this.id,b=this.url,c=u.length,d=c,e;d--;)if(31>u[d].length){e=r[d];break}0>d&&(e=h.createStyleSheet(),r.push(e),u.push([]),d=c);e.addImport(b);u[d].push(b);g(a,y,n,this)}var t=c("Arbiter"),w=["load"],E=1,l=3,C=4,y=5E3,s=!1,u=[],r=[],A={},o=[],v=null;a(d,t,{load:function(){2>
this.state&&(this.state=2,this._load())},_load:h.createStyleSheet?p:x});return d});b("JSLoader",["Arbiter"],function(b,c){function d(a,b){e.call(this,f);this.id=a;this.url=b.src;this.state=m}var e=c("Arbiter"),f=["load"],m=1,n=3,x=4;a(d,e,{load:function(){function a(f){if(!(b.state>=n)){b.state=f?n:x;b.done("load");j[c]=d;if(d===g)try{delete j[c]}catch(m){}i(function(){e.onerror=null;e.parentNode&&e.parentNode.removeChild(e);e=null})}}var b=this,c,d;if(!(2<=this.state)){this.state=2;var e=h.createElement("script");
e.src=this.url;e.async=!0;e.onerror=function(){a(!1)};c="js_"+this.id;d=j[c];j[c]=a;k(e)}}});return d});b("Emulator",["Arbiter"],function(b,c){function d(a){var b=!1;if(a&&(a=(""+a).replace(/(^\s*)|(\s*$)/g,"")))b=r(a.split(" "),function(a,b){return!!(""+b).replace(/(^\s*)|(\s*$)/g,"")});return b}function e(a){var b,c;for(b="A";a&&a.nodeName!=b;)a=a.parentNode;if(!a)return!1;if(!this.emit("beforetrigger",a))return!0;b=a.href;if(!b)return!1;var f=!1,i=/^\s*(https?|ftp):\/\//i;b==g||0==b.indexOf(g+
"/")?f=b.substring(k)||"/":i.test(b)||(f=b);b=f;if(!b)return!1;(a=a.rel)&&(c=d(a));if(!c)return!1;this.emit("request",b,c);return!0}function f(){if(this instanceof f)i.call(this,n);else return m||(m=new f),m}var i=c("Arbiter"),m,g,k,n=["beforetrigger","request"];g=[location.protocol,"//",location.host].join("");k=g.length;a(f,i,{listen:function(){var a=this;E.addHandler(h.documentElement,"click",function(b){var c,b=E.getEvent(b);c=E.getTarget(b);e.call(a,c)&&E.preventDefault(b)})}});return f});b("Requestor",
["Arbiter","Controller"],function(b,c){function e(a){f.call(this,m);d(this,{ajaxKey:a.ajaxKey,separator:a.separator,sessionKey:a.sessionKey});k||this.init()}var f=c("Arbiter"),i=c("Controller"),m=["arrive","allarrived"],g={},k=!1,n=!1,x=0;a(e,f,{init:function(){k=!0;this.sessionState=this.state=0;this.controller=new i;this.controller.on("arrived",this._onItemArrived,this);this.on("allarrived",this._onSessionEnd,this);this.refCount=0},start:function(a){this.sessionID=a;switch(this.sessionState){case 1:case 2:case 3:this.sessionState=
2;break;case 0:this.sessionState=1}},end:function(){this.sessionState=3;0==this.refCount&&this._onSessionEnd()},arrive:function(a){var b=this.sessionID,c=this.sessionState;g[b-1]&&(g[b-1]=null);2==c||3==c?(g[b]=g[b]||[],g[b].push(a)):(++this.refCount,this.controller.handdleArrive(a))},request:function(a,b){x++;this._ajaxRequest([a,/.*\?.*/.test(a)?"&":"?",this.ajaxKey,b?"="+b.join(this.separator):"","&",this.sessionKey,"=",x].join(""))},_onSessionEnd:function(){this.sessionState=0;var a=g[this.sessionID],
b=this;a&&o(a,function(a,c){b.refCount++;b.controller.handdleArrive(c)})},_onItemArrived:function(){!--this.refCount&&3==this.sessionState&&this.emit("allarrived")},_ajaxRequest:function(a){switch(this.state){case 1:var b=this._ajaxIframe;b&&b.parentNode&&b.parentNode.removeChild(b);this._initAjaxIframe(a);break;case 0:this._initAjaxIframe(a),this.state=1}},_initAjaxIframe:function(a){var b=this;this._ajaxIframe=z("iframe",{src:a},{display:"none"});h.body.appendChild(this._ajaxIframe);clearTimeout(n);
E.addHandler(this._ajaxIframe,"load",function(){1==b.state&&(n=setTimeout(function(){var a=b._ajaxIframe;a&&a.parentNode&&a.parentNode.removeChild(a);b.state=0},100))})}});return e});b("Controller",["Arbiter","Pagelet","Resource"],function(b,d){function e(){i.call(this,m)}function f(a,b){var d=c(a,b),e;if(!(e=d.firstChild)||8!==e.nodeType)return null;e=e.nodeValue;d.parentNode.removeChild(d);e=e.slice(1,-1);return e.replace(/--\\>/g,"--\>").replace(/\\\\/g,"\\")}var i=d("Arbiter"),g=d("Pagelet");
d("Resource");var m=["arrived"];a(e,i,{handdleArrive:function(a){var b,c;c=a.id;g.hasPagelet(c)&&(b=g(c),b.remove());if(g.hasPagelet(c))if(b=g(c),b.isUnloading())b.on("afterunload",this._doArrive,this,a);else throw Error("unbeliveble");else this._doArrive(a)},_doArrive:function(a){var c,d,e,i,m,k,n,h;c=a.id||null;d=a.content?a.content:a.container_id?f(a.container_id,a.doc):null;a.html=d;d=g(c);if(e=a.hook)for(i in e){m=e[i];n=m.length;for(k=-1;++k<n;){h=m[k];try{d.on(i,u(h)?h:new Function("pagelet",
h),b,d)}catch(x){throw Error("Error on add script:"+m[k]);}}}d.arrive(a);d.on("afterload",function(a){this.emit("arrived",a)},this,c)}});return e});var I=f("BigPipe");l.BigPipe=new I})(this,window,document);
(function(l,j){function h(a,b,c,d){var e,f,h;f=b.length;e=k[a]||{};e.name=a;e.factory=c;e.deps=b;e.flag=d||z;e.waiting=f;i[a]=e;delete k[a];for(c=0;c<f;c++)h=b[c],(d=i[h])?h=d.waiting:(d=k[h]=k[h]||{},h=!0),h?(d=d.refs=d.refs||[],d.push(a)):e.waiting--;e.waiting||g(e)}function g(a){var b=a.refs,c=a.name,d;a.flag&o&&(f(c),delete i[c]);if(b)for(c=0,d=b.length;c<d;c++)(a=i[b[c]])&&a.waiting&&(--a.waiting||g(a))}function f(a){var b,c,d,e,g,h;b=i[a];if(!b)throw Error('Requiring unknown module "'+a+'"');
if(b.error)throw Error('Requiring module "'+a+'" which threw an exception');if(b.waiting)throw Error('Requiring module "'+a+'" with unresolved dependencies');if(b.hasOwnProperty("exports"))return b.exports;b.exports=a={};c=b.deps;h=c.length;g=-1;for(e=[];++g<h;)d=c[g],e.push("module"===d?b:"exports"===d?a:f(d));if(void 0!==(c=b.factory.apply(this,e)))b.exports=a=c;return a}function b(a,b){function c(){--i||d()}function d(){var c=[],i;for(i=0;i<e;i++)c.push(f(a[i]));b&&b.apply(this,c)}var e,i,g,h;
if(i=e=a.length)for(g=0;g<e;g++)h=a[g],j.loadModule(h,c);else d()}function e(a,c){u?(h("__mod_"+y++,a,c,o),b(a)):r.push([a,c])}function c(){if(!u){u=!0;e.onready&&e.onready();var a,c,d,f;for(a=0,c=r.length;a<c;a++)d=r[a],f=d[0],d=d[1],h("__mod_"+y++,f,d,o),b(f);r=null}}function d(a,b){i[a]={exports:b,waiting:0}}function a(){j.log.apply(j,arguments)}var i={},k={},r=[],z=0,o=1,y=0,s,u=!1;document.addEventListener?s=function(){document.removeEventListener("DOMContentLoaded",s,!1);c()}:document.attachEvent&&
(s=function(){"complete"===document.readyState&&(document.detachEvent("onreadystatechange",s),c())});f.__debug__=i;f.__waiting__=k;document.addEventListener?(document.addEventListener("DOMContentLoaded",s,!1),window.addEventListener("load",c,!1)):document.attachEvent&&(document.attachEvent("onreadystatechange",s),window.attachEvent("onload",c));d("global",l);d("module",1);d("exports",1);d("require",f);d("requireAsync",b);d("requireLazy",e);l.define=h;l.require=f;l.requireAsync=b;l.requireLazy=e;l.__d=
function(a,b,c){return h(a,"global,module,exports,require,requireAsync,requireLazy".split(",").concat(b),c)};l.console||(l.console={log:a,error:a,dir:a})})(window,BigPipe);__d("common.js.config",[],function(l,j,h){function g(b){var b=b||{},e;for(e in b)b.hasOwnProperty(e)&&(f[e]=b[e]);g=function(){}}var f={};return h={__config__:f,init:g,get:function(b,e){return f.hasOwnProperty(b)?f[b]:e}}});
__d("common.js.events",[],function(l,j,h){function g(b,d){var a=b[0],e=b[1],d=b[2].concat(d);try{return a.apply(e,d)}catch(f){setTimeout(function(){throw f;},0)}}function f(c,d){var a=b[c],f,h;if(!a)return!0;d=e.call(arguments,1);a=a.cbs;f=a.length;for(h=!0;f--;)a[f]&&(h=!1!==g(a[f],d)&&h);return!!h}var b={},e=[].slice;return h={on:function(c,d,a){var f,h,j;if(!(f=b[c]))b[c]=f={args:null,cbs:[]};a=a||l;h=[d,a,e.call(arguments,3)];(j=f.args)?g(h,j):f.cbs.push(h)},un:function(c,d){var a=b[c],e;if(!a)return!0;
if(1==arguments.length)a.cbs=[];else{a=a.cbs;for(e=a.length;e--;)a[e]&&a[e][0]===d&&a.splice(e,1)}},emit:function(b,d){return f.apply(this,arguments)},done:function(c,d){var a,i,g;if(!(a=b[c]))b[c]=a={args:d,cbs:[]};i=a.cbs;g=i.length;d=e.call(arguments,1);a.args=d;f.apply(this,arguments);a.cbs=i.slice(g)},undo:function(c){c=b[c];if(!c)return!1;c.args=null}}});
__d("common.js.pageEvents",["common.js.events"],function(l,j,h,g){function f(a,b,c){a.addEventListener?a.addEventListener(b,c,!1):a.attachEvent?a.attachEvent("on"+b,c):a["on"+b]=c}function b(){var a={},b;b=null!=window.innerHeight?{width:window.innerWidth,height:window.innerHeight}:"CSS1Compat"==document.compatMode?{width:document.documentElement.clientWidth,height:document.documentElement.clientHeight}:{width:document.body.clientWidth,height:document.body.clientHeight};var c;c=null!=window.pageXOffset?
{scrollLeft:window.pageXOffset,scrollTop:window.pageYOffset}:"CSS1Compat"==document.compatMode?{scrollLeft:document.documentElement.scrollLeft,scrollTop:document.documentElement.scrollTop}:{scrollLeft:document.body.scrollLeft,scrollTop:document.body.scrollTop};a.height=b.height;a.width=b.width;a.scrollLeft=c.scrollLeft;a.scrollTop=c.scrollTop;return a}function e(c,d){var e;e=b();e.originalEvent=c&&c.originalEvent;k?clearTimeout(k):a.emit("viewport.startchange",e);a.emit("viewport.change",e);k=setTimeout(function(){k=
0;e=b();e.originalEvent=c&&c.originalEvent;a.emit("viewport.deferchange",e)},d||20)}function c(b,c){function d(){z=0;a.emit("page.endchange",b)}var c=c||0,e=+new Date+c;z||a.emit("page.startchange",b);a.emit("page.change",b);o<e&&(o=e,c?(clearTimeout(z),z=setTimeout(d,c)):d())}function d(){this.emitViewportChange=e;this.emitPageChange=c;this.getViewport=b}for(var a=g("common.js.events"),l=[[window,"scroll","window.scroll"],[window,"resize","window.resize"]],i,k,j=l.length;j--;){var r,h=l[j],g=h[0];
i=h[1];r=h[2];f(g,i,function(b){a.emit(r,{originalEvent:b})})}var z=0,o=0;a.on("window.scroll",e);a.on("window.resize",e);a.done("window.init",b());d.prototype=a;return h=new d});
__d("common.js.queue",[],function(l,j,h){function g(c,d,a){b.push([c,d,a]);if(!e){for(e=!0;c=b.length;){for(d=0;d<c;d++)a=b[d],a[0].apply(a[1],a[2]);b.splice(0,c)}e=!1}}function f(b,d,a){var e=Array.prototype.slice;f=function(a,b,c){var d=e.call(arguments,1);return e.apply(a,d)};return f.apply(this,f(arguments,0))}var b=[],e=!1;return h={call:function(b,d){return g(b,d,f(arguments,2))},apply:g}});
__d("common.js.lazy",["common.js.pageEvents","common.js.queue"],function(l,j,h,g,f,b){function e(){C==s&&(C=u,b(["common.js.jquery"],function(){C=n;e=c;k.call(e)}))}function c(){var b,c,d;for(b=0,c=r.length;b<c;b++){d=r[b];void 0===d.offsetTop&&d.valid&&(d.offsetTop=a(d.elem));var e;if(e=void 0!==d.offsetTop)d.valid?o.scrollTop+o.height+50>d.offsetTop?(k.call(d.callback,l,d.elem),e=!0):e=!1:e=!0;e&&(r.splice(b,1),b--,c--)}}function d(a){a.setAttribute("src",a.getAttribute("data-src"))}function a(a){var b=
0,c;try{for(;0>=b;){if(!a||!(c=$(a).offset()))return;b=c.top;a=a.parentNode}}catch(d){return}return b}var i=g("common.js.pageEvents"),k=g("common.js.queue"),r=[],z=0,o,y=!1,s=1,u=2,n=3,C=s;i.on("viewport.change",function(){y||(o=i.getViewport(),k.call(e))});i.on("page.endchange",function(){if(!y){for(var a=0,b=r.length;a<b;a++)r[a].offsetTop=void 0;k.call(e)}});return h={add:function(a,b){"length"in a||(a=[a]);for(var c=0,f,g=a.length;c<g;c++)f={elem:a[c],callback:b||d,key:z,valid:!0},r.push(f);o||
(o=i.getViewport());k.call(e);return z++},remove:function(a){for(var b=r.length;b--;)r[b].key===a&&(r[b].valid=!1)},disable:function(){y=!0},enable:function(){y=!1}}});
__d("common.js.bigRender",["common.js.lazy"],function(l,j,h,g){function f(c){var d=document.getElementById(c.id);b(d,"g-bigrender");var a=e.add(d,function(){c.load();c.on("display",function(){if(d){var a=d.className;0!=a.length&&("g-bigrender"==a?d.className="":a.match(/(^|\s)g-bigrender(\s|$)/)&&(d.className=a.replace(/(^|\s)g-bigrender(\s|$)/," ")))}})});c.on("unload",function(){e.remove(a)})}function b(b,d){if(b){var a=b.className;0==a.length?b.className=d:a==d||a.match(RegExp("(^|\\s)"+d+"(\\s|$)"))||
(b.className=a+" "+d)}}var e=g("common.js.lazy");return h={add:function(b){try{if(b.parent)b.parent.on("display",function(){f(b)});else f(b);return!0}catch(d){return setTimeout(function(){throw d;},0),!1}}}});
__d("common.js.load",[],function(l,j,h){var g=document;return h={loadScript:function(f,b,e){b=g.createElement("script");g.getElementsByTagName("head");e=e||{};b.type="text/javascript";b.src=f;var f=b,b=null,c;for(c in e)b=g.createAttribute(c),b.value=e[c],f.setAttributeNode(b);g.body.appendChild(f)},loadScriptString:function(f){var b=g.createElement("script");b.type="text/javascript";try{b.appendChild(g.createTextNode(f))}catch(e){b.text=f}g.body.appendChild(b)},loadStyle:function(){},loadStyleString:function(f){var b=
g.createElement("style"),e=g.getElementsByTagName("head")[0];b.type="text/css";try{b.appendChild(g.createTextNode(f))}catch(c){b.styleSheet.cssText=f}e.appendChild(b)}}});
__d("common.js.format",[],function(){function l(j,h){var g=Array.prototype.slice.call(arguments,1),f=Object.prototype.toString;return g.length?(g=1==g.length?null!==h&&/\[object Array\]|\[object Object\]/.test(f.call(h))?h:g:g,j.replace(/#\{(.+?)\}/g,function(b,e){var c,d,a,i,h;if(!g)return"";c=e.split("|");d=g[c[0]];"[object Function]"==f.call(d)&&(d=d(c[0]));for(a=1,i=c.length;a<i;++a)h=l.filters[c[a]],"[object Function]"==f.call(h)&&(d=h(d));return"undefined"==typeof d||null===d?"":d})):j}l.filters=
{escapeJs:function(j){if(!j||"string"!=typeof j)return j;var h,g,f,b=[];for(h=0,g=j.length;h<g;++h)f=j.charCodeAt(h),255<f?b.push(j.charAt(h)):b.push("\\x"+f.toString(16));return b.join("")},escapeString:function(j){return!j||"string"!=typeof j?j:j.replace(/["'<>\\\/`]/g,function(h){return"&#"+h.charCodeAt(0)+";"})},escapeUrl:function(j){return!j||"string"!=typeof j?j:encodeURIComponent(j)},toInt:function(j){return parseInt(j,10)||0}};l.filters.js=l.filters.escapeJs;l.filters.e=l.filters.escapeString;
l.filters.u=l.filters.escapeUrl;l.filters.i=l.filters.toInt;return l});
__d("common.js.log",["common.js.config"],function(l,j,h,g){function f(b,d){for(var a in d)b[a]=d[a];return b}var b=window,e=g("common.js.config").get("logConf",{level:1,page:"index"});return function(c,d){var a={},g=c.r=+new Date,h=b["__logImg_"+g]=new Image,j=[],l=d&&d.url||"/images/track.gif",a=f(a,e),a=f(a,c),o;for(o in a)"thisUrl"!=o&&j.push(encodeURIComponent(o)+"="+encodeURIComponent(a[o]));h.onload=h.onerror=function(){b["__logImg_"+g]=null;b["__logImg_"+g]=void 0};h.src=l+"?"+j.join("&");
h=j=null}});__d("common.js.hearbeat",["common.js.log"],function(l,j,h,g){var f=g("common.js.log");return function(b,e){function c(){var a={},c;for(c in b)a[c]="[object Function]"==Object.prototype.toString.call(b[c])?b[c]():b[c];f(a);d()}function d(){a++;setTimeout(c,"[object Function]"==Object.prototype.toString.call(e)?e(a):e)}var a=0;d()}});
__d("site.hearbeat",["common.js.hearbeat"],function(l,j,h,g){var f=g("common.js.hearbeat");return function(){var b;0.01>Math.random()&&(b=+new Date,f({type:"heartbeat",sessionid:b,staytime:function(){return+new Date-b}},function(b){var c;c=Math.pow(b-1,2);b=Math.pow(b,2);return 1E3*(c+(b-c)*Math.random())}))}});
__d("common.js.detect",["common.js.log"],function(l,j,h,g){function f(){-1<document.getElementById("_amd").style.display.indexOf("none")&&(b=!0);e.parentNode.removeChild(e);b&&c({type:"detect"},{url:"http://www.hao123.com/images/b.gif"})}var b=!1,e=void 0,c=g("common.js.log");return function(){e=document.createElement("IMG");e.id="_amd";e.src="";e.style.width="1px";e.style.height="1px";e.style.top="-1000px";e.style.left="-1000px";document.body.appendChild(e);
setTimeout(f,100)}});window.js_eVJKmvgzGZ&&window.js_eVJKmvgzGZ(!0);