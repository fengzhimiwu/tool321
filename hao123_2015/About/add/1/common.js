
/*
by ���ϵ���,QQ:260075702
�ٷ�վ�㣺www.panxinyou.com
*/

String.prototype.Trim = function() { return this.replace(/(^\s*)|(\s*$)/g, "")}
function $(id){
	return document.getElementById(id)	
}

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

function Get_type1(){
	var argv = Get_type1.arguments;
	var argc = Get_type1.arguments.length;
	var id1=(argc >0) ? argv[0] : ""
	var id2=(argc >1) ? argv[1] : ""
	var id3=(argc >2) ? argv[2] : ""  // Ĭ��ר������	
	var dir=(argc >3) ? argv[3] : ""  //���·��
	soojs_xml();
	$(id2).innerHTML="�����л�...."+"�������ʱ��δ��Ӧ����<span onclick=Get_type1('"+id1+"','"+id2+"')  style='cursor:pointer'><u>����</u></span>ˢ��"
	var url=dir+"1/qingtiancms.com..asp";
	var t_post="tag=Get_type1&id1="+id1+"&id2="+id2+"&id3="+id3
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=function (){Get_type1_ok(id1,id2)};
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);		

}
function Get_type1_ok(id1,id2){

	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
			var temp_x=xmlHttp.responseText;
			$(id2).innerHTML=temp_x;
			document.getElementById("div_m_type3").innerHTML="<Select name=\"m_type3\" id=\"m_type3\"><Option value=\"0\">�������</Option></Select>"
		}
	}

}

function Get_type2(){
	var argv = Get_type2.arguments;
	var argc = Get_type2.arguments.length;
	var id1=(argc >0) ? argv[0] : ""
	var id2=(argc >1) ? argv[1] : ""
	var id3=(argc >2) ? argv[2] : ""  // Ĭ��ר������
	var dir=(argc >3) ? argv[3] : ""  //���·��
	soojs_xml();
	$(id2).innerHTML="�����л�...."+"�������ʱ��δ��Ӧ����<span onclick=Get_type2('"+id1+"','"+id2+"')  style='cursor:pointer'><u>����</u></span>ˢ��"
	var url=dir+"1/qingtiancms.com..asp";
	var t_post="tag=Get_type2&id1="+id1+"&id2="+id2+"&id3="+id3
	xmlHttp.open("post",url,true);
	xmlHttp.onreadystatechange=function (){Get_type2_ok(id1,id2)};
	xmlHttp.setRequestHeader("Content-Length",t_post.length);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(t_post);		

}
function Get_type2_ok(id1,id2){

	if(xmlHttp.readyState==4)
	{	
		if (xmlHttp.status==200)
		{
			var temp_x=xmlHttp.responseText;
			$(id2).innerHTML=temp_x;
		}
	}

}

function newverifypic()
{
	var argv = newverifypic.arguments;
	var argc = newverifypic.arguments.length;
	var dir=(argc >0) ? argv[0] : ""
	
	var timenow = new Date().getTime();
	url=dir+"1/code.asp";
	url=url+"?"+timenow;
	document.getElementById("verifypic").src=url;
}

function checkFormaddurl(o){
	if($("m_name").value.Trim()==""){
		alert("��վ����Ϊ������Ŀ")
		$("m_name").focus()
		return false
	}
	if($("m_url").value.Trim()==""){
		alert("��վ��ַΪ������Ŀ")
		$("m_url").focus()
		return false
	}	
	if((!$("m_url").value.Trim().match(/^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/gi))){
		alert("��վ��ַ��ʽ����ȷ")
		$("m_url").focus()
		return false	
	}
	if($("m_content").value.Trim()!=""){
		if($("m_content").value.length>200){
			alert("�뽫��������������200������")
			$("m_content").focus()
			return false
		}
	}
	if($("m_type1").value=="0"){
		alert("��վ�����ѡ��Ŀ")
		$("m_type1").focus()
		return false
	}	
	if($("m_type2").value=="0"||$("m_type3").value=="0"){
		alert("��վ�����ѡ��Ŀ")
		$("m_type2").focus()
		return false
	}	
	if($("m_type3").value=="0"){
		alert("��վ�����ѡ��Ŀ")
		$("m_type3").focus()
		return false
	}	
	if($("authCode").value.Trim()==""){
		alert("��֤��Ϊ������Ŀ")
		$("authCode").focus()
		return false
	}		
}