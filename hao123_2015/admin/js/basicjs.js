var xmlHttp;

function soojs_xml()
{
	try{
		xmlHttp=new XMLHttpRequest();
		}
	catch(e){
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}	
}
String.prototype.Trim = function() { return this.replace(/(^\s*)|(\s*$)/g, "")}
function $(value){return document.getElementById(value)}
function Changer_folder(){
	if($("G_moban_html").value.Trim()==""){
		alert("������·��")
		$("G_moban_html").focus()
		return false
	}
	soojs_xml();
	var url="../inc/changefolder.asp";
	var t_post="v1="+$("G_moban_html_hide").value+"&v2="+$("G_moban_html").value
	$("G_moban_html_now").value="���ڸ���"
	$("Submit_ok").disabled=true
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=Changer_folder_ok;
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);
}
function Changer_folder_ok(){
	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
			var temp_x=xmlHttp.responseText;
			if(temp_x=="ok"){
				$("G_moban_html_now").value="�Ѿ����ģ��������˱���Ŷ"
				$("Submit_ok").disabled=false
				$("G_moban_html_hide").value=$("G_moban_html").value
			}else{
				$("G_moban_html").value=$("G_moban_html_hide").value
				$("G_moban_html_now").value="����ʧ��"
			}
		}
	}	
}
function st(value){
	var obj=eval(document.getElementById(value));
	var obj2=eval(document.getElementById(value+"_c"));
	obj.style.display=(obj.style.display=='none')?'':'none';
	obj2.innerHTML=(obj2.innerHTML=="[չ��]")?'[����]':'[չ��]'
	
}

function f_G_JING_TAI_Wei(){
	if(document.form.G_JING_TAI_Wei.checked){
		document.form.G_JING_TAI_list.value="��"
		document.form.G_JING_TAI_Detail.value="��"
	}
}
function f_G_2009_Play_moshi(){
	if(document.form.G_2009_Play_moshi.value=="1"){
		document.form.G_JING_TAI_PLAY.value="true"
	}
}
function f_G_Play_qvod_pifu(){
	if(document.form.G_Play_qvod_pifu.value=="3"){
		document.form.G_Play_Skin.value="play_self5_New.htm"	
	}
}
function f_G_Play_Skin(){
	var s1=document.form.G_Play_Skin.value.toLowerCase() 
	if(document.form.G_JING_TAI_PLAY.value.toLowerCase()=="true"){
		if(s1.indexOf("_new")==-1){
			alert("��Ŀǰ�Ĳ���ҳģʽ����̬��������ҳģ��һ��Ҫѡ�񡾴�_New��������ģ��")
			document.form.G_Play_Skin.focus()
		}
	}else{
		if(s1.indexOf("_new")!=-1)
			alert("��Ŀǰ�Ĳ���ҳģʽ����̬��������ҳģ�潨��ѡ�񡾲���_New��������ģ�棬��������ҳ���ٶ�")			
	}
}
function f_G_jifen_tuiguang_s(){
	if(document.form.G_jifen_tuiguang_s.value==""){	
		document.getElementById("G_jifen_timer_tr").style.display="none"
		document.getElementById("G_jifen_tuiguang_s_span").innerHTML="1IPֻ��һ���ƹ����"
	}else if(document.form.G_jifen_tuiguang_s.value=="1"){
		document.getElementById("G_jifen_timer_tr").style.display=""	
		document.getElementById("G_jifen_tuiguang_s_span").innerHTML="һ��ʱ����ֻ��һ���ƹ����"
	}else if(document.form.G_jifen_tuiguang_s.value=="2"){
		document.getElementById("G_jifen_timer_tr").style.display="none"	
		document.getElementById("G_jifen_tuiguang_s_span").innerHTML="ˢ��һ�ξ���һ���ƹ����,��ý�Ͽ�������"
	}
}