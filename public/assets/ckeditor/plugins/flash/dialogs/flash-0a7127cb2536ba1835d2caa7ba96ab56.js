/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){function u(i,s,o){var u=this,a=r[u.id];if(!a)return;var f=u instanceof CKEDITOR.ui.dialog.checkbox;for(var l=0;l<a.length;l++){var h=a[l];switch(h.type){case e:if(!i)continue;if(i.getAttribute(h.name)!==null){var p=i.getAttribute(h.name);f?u.setValue(p.toLowerCase()=="true"):u.setValue(p);return}f&&u.setValue(!!h["default"]);break;case t:if(!i)continue;if(h.name in o){p=o[h.name],f?u.setValue(p.toLowerCase()=="true"):u.setValue(p);return}f&&u.setValue(!!h["default"]);break;case n:if(!s)continue;if(s.getAttribute(h.name)){p=s.getAttribute(h.name),f?u.setValue(p.toLowerCase()=="true"):u.setValue(p);return}f&&u.setValue(!!h["default"])}}}function a(i,s,o){var u=this,a=r[u.id];if(!a)return;var f=u.getValue()==="",l=u instanceof CKEDITOR.ui.dialog.checkbox;for(var h=0;h<a.length;h++){var p=a[h];switch(p.type){case e:if(!i||p.name=="data"&&s&&!i.hasAttribute("data"))continue;var v=u.getValue();f||l&&v===p["default"]?i.removeAttribute(p.name):i.setAttribute(p.name,v);break;case t:if(!i)continue;v=u.getValue();if(f||l&&v===p["default"])p.name in o&&o[p.name].remove();else if(p.name in o)o[p.name].setAttribute("value",v);else{var m=CKEDITOR.dom.element.createFromHtml("<cke:param></cke:param>",i.getDocument());m.setAttributes({name:p.name,value:v}),i.getChildCount()<1?m.appendTo(i):m.insertBefore(i.getFirst())}break;case n:if(!s)continue;v=u.getValue(),f||l&&v===p["default"]?s.removeAttribute(p.name):s.setAttribute(p.name,v)}}}var e=1,t=2,n=4,r={id:[{type:e,name:"id"}],classid:[{type:e,name:"classid"}],codebase:[{type:e,name:"codebase"}],pluginspage:[{type:n,name:"pluginspage"}],src:[{type:t,name:"movie"},{type:n,name:"src"},{type:e,name:"data"}],name:[{type:n,name:"name"}],align:[{type:e,name:"align"}],"class":[{type:e,name:"class"},{type:n,name:"class"}],width:[{type:e,name:"width"},{type:n,name:"width"}],height:[{type:e,name:"height"},{type:n,name:"height"}],hSpace:[{type:e,name:"hSpace"},{type:n,name:"hSpace"}],vSpace:[{type:e,name:"vSpace"},{type:n,name:"vSpace"}],style:[{type:e,name:"style"},{type:n,name:"style"}],type:[{type:n,name:"type"}]},i=["play","loop","menu","quality","scale","salign","wmode","bgcolor","base","flashvars","allowScriptAccess","allowFullScreen"];for(var s=0;s<i.length;s++)r[i[s]]=[{type:n,name:i[s]},{type:t,name:i[s]}];i=["allowFullScreen","play","loop","menu"];for(s=0;s<i.length;s++)r[i[s]][0]["default"]=r[i[s]][1]["default"]=!0;var o=CKEDITOR.tools.cssLength;CKEDITOR.dialog.add("flash",function(e){var t=!e.config.flashEmbedTagOnly,n=e.config.flashAddEmbedTag||e.config.flashEmbedTagOnly,r,i="<div>"+CKEDITOR.tools.htmlEncode(e.lang.common.preview)+"<br>"+'<div id="cke_FlashPreviewLoader'+CKEDITOR.tools.getNextNumber()+'" style="display:none"><div class="loading">&nbsp;</div></div>'+'<div id="cke_FlashPreviewBox'+CKEDITOR.tools.getNextNumber()+'" class="FlashPreviewBox"></div></div>';return{title:e.lang.flash.title,minWidth:420,minHeight:310,onShow:function(){var t=this;t.fakeImage=t.objectNode=t.embedNode=null,r=new CKEDITOR.dom.element("embed",e.document);var n=t.getSelectedElement();if(n&&n.data("cke-real-element-type")&&n.data("cke-real-element-type")=="flash"){t.fakeImage=n;var i=e.restoreRealElement(n),s=null,o=null,u={};if(i.getName()=="cke:object"){s=i;var a=s.getElementsByTag("embed","cke");a.count()>0&&(o=a.getItem(0));var f=s.getElementsByTag("param","cke");for(var l=0,c=f.count();l<c;l++){var h=f.getItem(l),p=h.getAttribute("name"),d=h.getAttribute("value");u[p]=d}}else i.getName()=="cke:embed"&&(o=i);t.objectNode=s,t.embedNode=o,t.setupContent(s,o,u,n)}},onOk:function(){var r=this,i=null,s=null,o=null;if(!r.fakeImage){if(t){i=CKEDITOR.dom.element.createFromHtml("<cke:object></cke:object>",e.document);var u={classid:"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000",codebase:"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"};i.setAttributes(u)}n&&(s=CKEDITOR.dom.element.createFromHtml("<cke:embed></cke:embed>",e.document),s.setAttributes({type:"application/x-shockwave-flash",pluginspage:"http://www.macromedia.com/go/getflashplayer"}),i&&s.appendTo(i))}else i=r.objectNode,s=r.embedNode;if(i){o={};var a=i.getElementsByTag("param","cke");for(var f=0,c=a.count();f<c;f++)o[a.getItem(f).getAttribute("name")]=a.getItem(f)}var h={},p={};r.commitContent(i,s,o,h,p);var d=e.createFakeElement(i||s,"cke_flash","flash",!0);d.setAttributes(p),d.setStyles(h),r.fakeImage?(d.replace(r.fakeImage),e.getSelection().selectElement(d)):e.insertElement(d)},onHide:function(){this.preview&&this.preview.setHtml("")},contents:[{id:"info",label:e.lang.common.generalTab,accessKey:"I",elements:[{type:"vbox",padding:0,children:[{type:"hbox",widths:["280px","110px"],align:"right",children:[{id:"src",type:"text",label:e.lang.common.url,required:!0,validate:CKEDITOR.dialog.validate.notEmpty(e.lang.flash.validateSrc),setup:u,commit:a,onLoad:function(){var e=this.getDialog(),t=function(t){r.setAttribute("src",t),e.preview.setHtml('<embed height="100%" width="100%" src="'+CKEDITOR.tools.htmlEncode(r.getAttribute("src"))+'" type="application/x-shockwave-flash"></embed>')};e.preview=e.getContentElement("info","preview").getElement().getChild(3),this.on("change",function(e){e.data&&e.data.value&&t(e.data.value)}),this.getInputElement().on("change",function(e){t(this.getValue())},this)}},{type:"button",id:"browse",filebrowser:"info:src",hidden:!0,style:"display:inline-block;margin-top:10px;",label:e.lang.common.browseServer}]}]},{type:"hbox",widths:["25%","25%","25%","25%","25%"],children:[{type:"text",id:"width",style:"width:95px",label:e.lang.common.width,validate:CKEDITOR.dialog.validate.htmlLength(e.lang.common.invalidHtmlLength.replace("%1",e.lang.common.width)),setup:u,commit:a},{type:"text",id:"height",style:"width:95px",label:e.lang.common.height,validate:CKEDITOR.dialog.validate.htmlLength(e.lang.common.invalidHtmlLength.replace("%1",e.lang.common.height)),setup:u,commit:a},{type:"text",id:"hSpace",style:"width:95px",label:e.lang.flash.hSpace,validate:CKEDITOR.dialog.validate.integer(e.lang.flash.validateHSpace),setup:u,commit:a},{type:"text",id:"vSpace",style:"width:95px",label:e.lang.flash.vSpace,validate:CKEDITOR.dialog.validate.integer(e.lang.flash.validateVSpace),setup:u,commit:a}]},{type:"vbox",children:[{type:"html",id:"preview",style:"width:95%;",html:i}]}]},{id:"Upload",hidden:!0,filebrowser:"uploadButton",label:e.lang.common.upload,elements:[{type:"file",id:"upload",label:e.lang.common.upload,size:38},{type:"fileButton",id:"uploadButton",label:e.lang.common.uploadSubmit,filebrowser:"info:src","for":["Upload","upload"]}]},{id:"properties",label:e.lang.flash.propertiesTab,elements:[{type:"hbox",widths:["50%","50%"],children:[{id:"scale",type:"select",label:e.lang.flash.scale,"default":"",style:"width : 100%;",items:[[e.lang.common.notSet,""],[e.lang.flash.scaleAll,"showall"],[e.lang.flash.scaleNoBorder,"noborder"],[e.lang.flash.scaleFit,"exactfit"]],setup:u,commit:a},{id:"allowScriptAccess",type:"select",label:e.lang.flash.access,"default":"",style:"width : 100%;",items:[[e.lang.common.notSet,""],[e.lang.flash.accessAlways,"always"],[e.lang.flash.accessSameDomain,"samedomain"],[e.lang.flash.accessNever,"never"]],setup:u,commit:a}]},{type:"hbox",widths:["50%","50%"],children:[{id:"wmode",type:"select",label:e.lang.flash.windowMode,"default":"",style:"width : 100%;",items:[[e.lang.common.notSet,""],[e.lang.flash.windowModeWindow,"window"],[e.lang.flash.windowModeOpaque,"opaque"],[e.lang.flash.windowModeTransparent,"transparent"]],setup:u,commit:a},{id:"quality",type:"select",label:e.lang.flash.quality,"default":"high",style:"width : 100%;",items:[[e.lang.common.notSet,""],[e.lang.flash.qualityBest,"best"],[e.lang.flash.qualityHigh,"high"],[e.lang.flash.qualityAutoHigh,"autohigh"],[e.lang.flash.qualityMedium,"medium"],[e.lang.flash.qualityAutoLow,"autolow"],[e.lang.flash.qualityLow,"low"]],setup:u,commit:a}]},{type:"hbox",widths:["50%","50%"],children:[{id:"align",type:"select",label:e.lang.common.align,"default":"",style:"width : 100%;",items:[[e.lang.common.notSet,""],[e.lang.common.alignLeft,"left"],[e.lang.flash.alignAbsBottom,"absBottom"],[e.lang.flash.alignAbsMiddle,"absMiddle"],[e.lang.flash.alignBaseline,"baseline"],[e.lang.common.alignBottom,"bottom"],[e.lang.common.alignMiddle,"middle"],[e.lang.common.alignRight,"right"],[e.lang.flash.alignTextTop,"textTop"],[e.lang.common.alignTop,"top"]],setup:u,commit:function(e,t,n,r,i){var s=this.getValue();a.apply(this,arguments),s&&(i.align=s)}},{type:"html",html:"<div></div>"}]},{type:"fieldset",label:CKEDITOR.tools.htmlEncode(e.lang.flash.flashvars),children:[{type:"vbox",padding:0,children:[{type:"checkbox",id:"menu",label:e.lang.flash.chkMenu,"default":!0,setup:u,commit:a},{type:"checkbox",id:"play",label:e.lang.flash.chkPlay,"default":!0,setup:u,commit:a},{type:"checkbox",id:"loop",label:e.lang.flash.chkLoop,"default":!0,setup:u,commit:a},{type:"checkbox",id:"allowFullScreen",label:e.lang.flash.chkFull,"default":!0,setup:u,commit:a}]}]}]},{id:"advanced",label:e.lang.common.advancedTab,elements:[{type:"hbox",children:[{type:"text",id:"id",label:e.lang.common.id,setup:u,commit:a}]},{type:"hbox",widths:["45%","55%"],children:[{type:"text",id:"bgcolor",label:e.lang.flash.bgcolor,setup:u,commit:a},{type:"text",id:"class",label:e.lang.common.cssClass,setup:u,commit:a}]},{type:"text",id:"style",validate:CKEDITOR.dialog.validate.inlineStyle(e.lang.common.invalidInlineStyle),label:e.lang.common.cssStyle,setup:u,commit:a}]}]}})})();