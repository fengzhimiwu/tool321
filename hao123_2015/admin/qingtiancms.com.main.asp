
<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="inc/public.asp"-->
<!--#include file="inc/openconn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="css/style.css" rel=stylesheet type=text/css>
<script>
var dragswitch=0
var nsx
var nsy
var nstemp

function drag_dropns(name){
temp=eval(name)
temp.captureEvents(Event.MOUSEDOWN | Event.MOUSEUP)
temp.onmousedown=gons
temp.onmousemove=dragns
temp.onmouseup=stopns
}

function gons(e){
temp.captureEvents(Event.MOUSEMOVE)
nsx=e.x
nsy=e.y
}
function dragns(e){
if (dragswitch==1){
temp.moveBy(e.x-nsx,e.y-nsy)
return false
}
}

function stopns(){
temp.releaseEvents(Event.MOUSEMOVE)
}

var dragapproved=false
function drag_dropie(){
if (dragapproved==true){
document.all.showimage.style.pixelLeft=tempx+event.clientX-iex
document.all.showimage.style.pixelTop=tempy+event.clientY-iey
return false
}
}
function initializedragie(){
iex=event.clientX
iey=event.clientY
tempx=showimage.style.pixelLeft
tempy=showimage.style.pixelTop
dragapproved=true
document.onmousemove=drag_dropie
}
if (document.all){
document.onmouseup=new Function("dragapproved=false")
}
function hidebox(){
if (document.all)
showimage.style.visibility="hidden"
else if (document.layers)
document.showimage.visibility="hide"
}
</script>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align=center class="tableBorder">
<tr> 
    <th height=25 class="tableHeaderText" colspan="2"><%=G_WEBNAME%>-��̨������ҳ--��������</th> 
  </tr>
<TR>
    <td width="50%"  height=23>&nbsp;&nbsp;���������ͣ�<%=Request.ServerVariables("OS")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>)</td>
	<td width="50%" >&nbsp;&nbsp;վ������·����<%=request.ServerVariables("APPL_PHYSICAL_PATH")%></td>
	</tr>
<TR>
<TR>
    <td width="50%"  height=23>&nbsp;&nbsp;���ط�������������Ķ˿ڣ�<%=Request.ServerVariables("SERVER_PORT")%></td>
	<td width="50%" >&nbsp;&nbsp;�ű��������棺<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
	</tr>
<TR>
<TR>
    <td width="50%"  height=23>&nbsp;&nbsp;WEB�����������ƺͰ汾��<%Response.Write Request.ServerVariables("SERVER_SOFTWARE"):Getokr%></td>
	<td width="50%" >&nbsp;&nbsp;�ű���ʱʱ�䣺<%=Server.ScriptTimeout%> ��</td>
	</tr>
<TR>


    <td width="50%"  height=23>&nbsp;&nbsp;����·����<%=Request.ServerVariables("SCRIPT_NAME")%></td>
		<td width="50%" >&nbsp;&nbsp;WebEasyMail���֧�֣�
      <%If Not IsObjInstalled("easymail.MailSend") Then%>
      <font color="red"><b>��</b></font>
      <%else%>
      <b>��</b>
      <%end if%></td>
	</tr>	
	<tr>
		<td width="50%"  height=23>&nbsp;&nbsp;Jmail���֧�֣�<%If Not IsObjInstalled("JMail.SMTPMail") Then%><font color="red"><b>��</b></font><%else%><b>��</b><%end if%></td>
		<td width="50%"  height=23>&nbsp;&nbsp;AspJpeg���֧�֣�
      <%If Not IsObjInstalled("Persits.Jpeg") Then%>
      <font color="red"><b>��</b></font>
      <%else%>
      <b>��</b>
      <%end if%></td>
	</tr>
  <TR>
    <th height=25 class="tableHeaderText" colspan="2">��վ���бر��������</Th>
</TR>

    <tr>
    <td width="1%" height=2  class="forumRow">��վ����URL��<%response.Write G_WEBURL%></td>
	 <td width="99%" class="forumRow">��վ��дURL��<%response.Write G_WEBURL_2%></td> 
  </tr>
    <tr>
    <td width="1%" height=2  class="forumRow">��վȫ����<%response.Write G_WEBNAME%></td>
	 <td width="99%" class="forumRow">��վ�Ŀͷ�QQ��<%response.Write G_QQ%></td> 
  </tr> 
    <tr>
    <td width="1%" height=2  class="forumRow">��վemail��<%response.Write G_EMAIL%></td>
	 <td width="99%" class="forumRow">admin�ļ��е�Ŀ¼��<%response.Write G_ADMIN%></td> 
  </tr> 


</table>



<script>
function loadJS(file){
	var html_doc = document.getElementsByTagName('head')[0]
	js = document.createElement('script')
	js.setAttribute('type', 'text/javascript')
	js.setAttribute('src', file)
	html_doc.appendChild(js)
	js.onreadystatechange = function () {if(js.readyState == 'complete' || js.readyState =="loaded"){goif()}}
	js.onload = function (){goif()}
	return false
}
function $(id){return document.getElementById(id)}
function a(purl){
	if (confirm("��ȷ��Ҫ������\n����ǰ�����鱸�����Լ���ģ���ļ��У�/template/")){
		window.location=purl;
		return true;
	}
}
function goif(){
	var ver,purl;
	var ver_o="<%=q1%>"
	if(qTcmsV){
		ver=qTcmsV.ver;
		purl=qTcmsV.purl;
		m="<%=q2%>"
		if(parseInt(ver_o)<999){
			if(parseInt(ver_o)=="0")
				$("kver").innerHTML=""
				$("kver0").innerHTML="�Զ���汾"
			//$("kver").innerHTML=" <a href='http://dh.qtcms.net' target=_blank><font color=red>�޷���������������������Ҫ"+m+"�����°汾</font></a>"
			
		}
		else{
			if(parseInt(ver)>parseInt(ver_o))
				$("kver").innerHTML="���°汾�ţ�<span style=\"color:#FF0000;\">"+ver+"</span> <span style=\"color:red;cursor:pointer\" onclick=\"a('"+purl+"')\">�������</span>"
			else
				$("kver").innerHTML=" <font color=blue>�Ѿ�������ģ��</font>"
		}
	}
	else wtsrc(13000)
}
<%IF q3<>"" Then%>
loadJS('<%=q_u1%>');
<%End IF%>

</script>
<%'=f1%>