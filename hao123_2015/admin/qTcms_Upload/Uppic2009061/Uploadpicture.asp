<!--#include file="Config.asp"-->
<%
If request.Cookies("qt1")("admin_u")="" or request.Cookies("qt1")("admin_p")="" or request.Cookies("qt1")("admin_m")="" Then 

Response.End()

End IF
'f1:�Զ��������ļ���·��
'f2:�ı����ID
'w:�Զ���������ͼ�Ŀ� //��ʡ��
'h:�Զ���������ͼ�ĸ� //��ʡ��
'c:�Ƿ��Զ����ߴ������ű�����Ĭ�ϲ�
url=request("acd")
f1=request("f1")
f2=request("f2")
w=request("w")
h=request("h")
bg=Request("bg")
txt=Request("txt")
oldurl=Request("oldurl")
c=Request("c")
IF bg="" Then 
	sBg="#fff"
Else
	sBg="#"&bg
End IF
IF txt="" Then
	txt_="�Զ����ߴ���������ͼ"
Else
	txt_=txt
End IF
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
BODY,form{
font-size:12pt; background-color:<%=sBg%>; margin:0px; padding:0px
}
.tx1 { height: 20px;font-size: 9pt; border:#ccc solid 1px; color: #0000FF; width:140px}
.tx2 {border:#ccc solid 1px;font:9pt}
.tx3 { border:#ccc solid 0px; color:#FF0000; font-size:12px}

a:link       {font-size:9pt; color: #0033CC; text-decoration: none }
a:visited    {font-size:9pt; color: #0033CC; text-decoration: none }
a:active     {font-size:9pt; color: #FF0000; text-decoration: none }
a:hover      {font-size:9pt; color: #000000; text-decoration: underline}
-->
</style>
<SCRIPT>
var s_type="<%=Replace(UpFileType,"|",",")%>";
var MaxFileSize=<%=MaxFileSize%>;
function ch(o){
	var path=o.value;
	var ext = path.lastIndexOf('.') == -1 ? '' : path.substr(path.lastIndexOf('.') + 1, path.length).toLowerCase();
	var re = new RegExp("(^|\\s|,)" + ext + "($|\\s|,)", "ig");
	var localfile = path.substr(path.replace(/\\/g, '/').lastIndexOf('/') + 1);
	if(s_type != '' && (re.exec(s_type) == null || ext == '')) {
		alert('�Բ��𣬲�֧���ϴ�������չ���ĸ�����');
		 oo=eval("document.form."+o.name);
		//oo.outerHTML=oo.outerHTML
	}	
	else{
		
		if(document.getElementById&&document.all)
			s_big(o,o)
	}
}
var img=null; 
function s_big(o,oo) 
{ 
if(img)img.removeNode(true); 
img=document.createElement("img"); 
img.style.position="absolute"; 
img.style.visibility="hidden"; 
img.width = 0; 
img.height = 0; 
img.attachEvent("onreadystatechange",orsc_big); 
img.attachEvent("onerror",oe_big); 
document.body.insertAdjacentElement("beforeend",img); 
img.src=o.value; 
//img.oo=oo;
} 
function oe_big() 
{ 
//alert("cant load img"); 
} 
function orsc_big() 
{ 
	if(img.readyState!="complete")return false; 
	//alert("ͼƬ��С��"+img.offsetWidth+"X"+img.offsetHeight); 
	if(parseInt(img.fileSize)>parseInt(MaxFileSize*1024)){
		alert("�Բ���ͼƬ("+Math.round(img.fileSize/1024)+"KB)"+"�������("+MaxFileSize+")KB�ߴ�") ;	
		//img.oo.outerHTML=img.oo.outerHTML;
		//$_("bt").disabled=true;
	}
	else{
		//$_("bt").disabled=false
		
	}
} 
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0">
<% 
on error resume next

if url<>"" And Instr(url,"/upload")>0 then
	Set fso = CreateObject("Scripting.FileSystemObject") 
	IF fso.FileExists(server.MapPath(url)) Then
		fso.DeleteFile(server.MapPath(url))
		response.Write"<script>parent.document.getElementById('"&f2&"').value='';</script>"
	End IF
end if

tFlag=True
IF oldurl<>"" And Instr(oldurl,"/upload")>0 then
	Set fso = CreateObject("Scripting.FileSystemObject") 
	IF fso.FileExists(server.MapPath(oldurl)) Then
		response.Write"<a href=Uploadpicture.asp?acd="&oldurl&"&f2="&f2&"&f1="&f1&"&w="&w&"&h="&h&"&bg="&Bg&">[�����ϴ�]</a> <a href='"&oldurl&"' target=_blank>[Ԥ��]</a>"
		tFlag=False
	End IF
End IF
IF tFlag Then
%>
<form action="upfilepicture.asp?f2=<%=f2%>&f1=<%=f1%>&w=<%=w%>&h=<%=h%>&bg=<%=bg%>&c=<%=c%>&acd=<%=url%>" method="post" name="form"  enctype="multipart/form-data">
  <input name="FileName" type="FILE" class="tx1" size="25" onChange="ch(this)">
  <input type="submit" name="Submit" value="�ϴ�" class="tx2">
  <span class="tx3"><%=txt_%></span>
</form>
<%
End IF
%>


</body>
</html>