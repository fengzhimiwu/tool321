<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%

IF Request.Form("editInfo")="editInfo" Then
	str=""
	str=str&"<mailserver>"&Request.Form("mailserver")&"</mailserver>"
	str=str&"<mailserverloginname>"&Request.Form("mailserverloginname")&"</mailserverloginname>"
	str=str&"<mailserverloginpass>"&Request.Form("mailserverloginpass")&"</mailserverloginpass>"
	str=str&"<mailuserdomain>"&Request.Form("mailuserdomain")&"</mailuserdomain>"
	str=str&"<frommail>"&Request.Form("frommail")&"</frommail>"
	str=str&"<fromname>"&Request.Form("fromname")&"</fromname>"
	str=str&"<PSubject>"&Request.Form("PSubject")&"</PSubject>"
	str=str&"<PAddRecipient>"&Request.Form("PAddRecipient")&"</PAddRecipient>"
	str=str&"<PBody>"&Request.Form("PBody")&"</PBody>"
	str=str&"<PSubjectZc>"&Request.Form("PSubjectZc")&"</PSubjectZc>"
	str=str&"<PBodyZc>"&Request.Form("PBodyZc")&"</PBodyZc>"
	N_Fso.CreateFolderFile Add_Root_Dir("p_inc/tag/email.config"),str
	Response.Write "<script>alert('����ɹ�');window.location='index.asp'</script>"
Else
	str=N_Fso.ReadAllTextFile(Add_Root_Dir("p_inc/tag/email.config"))
	mailserver=GetContent(str,"<mailserver>","</mailserver>",0)
	mailserverloginname=GetContent(str,"<mailserverloginname>","</mailserverloginname>",0)
	mailserverloginpass=GetContent(str,"<mailserverloginpass>","</mailserverloginpass>",0)
	mailuserdomain=GetContent(str,"<mailuserdomain>","</mailuserdomain>",0)
	frommail=GetContent(str,"<frommail>","</frommail>",0)
	fromname=GetContent(str,"<fromname>","</fromname>",0)
	PSubject=GetContent(str,"<PSubject>","</PSubject>",0)
	PAddRecipient=GetContent(str,"<PAddRecipient>","</PAddRecipient>",0)
	PBody=GetContent(str,"<PBody>","</PBody>",0)
	PSubjectZc=GetContent(str,"<PSubjectZc>","</PSubjectZc>",0)
	PBodyZc=GetContent(str,"<PBodyZc>","</PBodyZc>",0)
End IF	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title>�ʼ�������������</title>
<script src="../js/mouse_on_title.js"></script>
<script language="JavaScript1.4" type="text/javascript">
//��ɫѡ��
function SelectColorcmdt(what,backit){
   var dEL = document.all(what);
   var sEL = document.all(backit);
   var url = "../js/color/selcolor.htm?color="+encodeURIComponent(dEL.value);
   var arr = showModalDialog(url,window,"dialogWidth:280px;dialogHeight:250px;help:no;scroll:no;status:no");
   if (arr) {
    dEL.value=arr;
    sEL.style.backgroundColor=arr;
    dEL.style.backgroundColor=arr;
   }
}
function checkadd(){
	if(document.myform.mailserver.value==""){
		alert("����д��������smtp")
		document.myform.mailserver.focus()
		return false
	}
	if(document.myform.mailserverloginname.value==""){
		alert("����д���������û���")
		document.myform.mailserverloginname.focus()
		return false
	}
	if(document.myform.mailserverloginpass.value==""){
		alert("����д������������")
		document.myform.mailserverloginpass.focus()
		return false
	}	
	if(document.myform.mailuserdomain.value==""){
		alert("����д�����������")
		document.myform.mailuserdomain.focus()
		return false
	}	
	if(document.myform.frommail.value==""){
		alert("����д��������")
		document.myform.frommail.focus()
		return false
	}	
	if(document.myform.fromname.value==""){
		alert("����д����������")
		document.myform.fromname.focus()
		return false
	}	
	if(document.myform.PAddRecipient.value==""){
		alert("����д�����ռ�����")
		document.myform.PAddRecipient.focus()
		return false
	}		
	if(document.myform.PSubject.value==""){
		alert("����д�����һر���")
		document.myform.PSubject.focus()
		return false
	}	
	if(document.myform.PBody.value==""){
		alert("����д�����һ�����")
		document.myform.PBody.focus()
		return false
	}	
	if(document.myform.PSubjectZc.value==""){
		alert("����дע���˺ű���")
		document.myform.PSubjectZc.focus()
		return false
	}	
	if(document.myform.PBodyZc.value==""){
		alert("����д�˺ż�������")
		document.myform.PBodyZc.focus()
		return false
	}			
	document.myform.submit();	
}

</script>
</head>

<body>
<TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
	<tr> 
	  	<th height=25  class="tableHeaderText">�ʼ�����������</th> 
		<th class="tableHeaderText"></th> 
	</tr> 
	<form method="POST" action="index.asp" name="myform">
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b><font color="#FF0000">������ʾ��</font></b></TD> 
		<TD class="Forumrow">
			<font color="#FF0000">�˹�����Ҫ�û�ǰ̨ע���û���������ͨ��Email�һ�����.</font>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b><font color="#FF0000"></font></b></TD> 
		<TD class="Forumrow">
			<font color="#FF0000">����Ҫ��д���Ѿ��е������û��������룬����ע��163�����䣬ȥ��ע��һ��.</font>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b><font color="#FF0000"></font></b></TD> 
		<TD class="Forumrow">
		<%IF IsObjInstalled("JMail.SMTPMail") Then%>
			<!--<font color="#0000FF">�Ѿ���д���ˣ����������.</font>-->
		<%Else%>
			<font color="#FF0000">��ķ�������֧��JMail������޷�ʹ�ô˹���.</font>
		<%End IF%>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>��������smtp�� <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="mailserver" class="smallInput" size="30"  id="mailserver" value="<%=mailserver%>">
			��������163���ʼ�������163������smtp��:<b>smtp.163.com</b>
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>���������û����� <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="mailserverloginname" class="smallInput" size="30"  id="mailserverloginname" value="<%=mailserverloginname%>">
			������ע��163�����ʱ���Ǹ��û���������<b>test001</b>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>�����������룺 <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="mailserverloginpass" class="smallInput" size="30"  id="mailserverloginpass" value="<%=mailserverloginpass%>">
			������ע��163�����ʱ���Ǹ��������룬����<b>mailserverloginpass</b>
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>����������� <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="mailuserdomain" class="smallInput" size="30"  id="mailuserdomain" value="<%=mailuserdomain%>">
			����������163.com��վ����ģ��Ǿ���д<b>163.com</b>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>�������䣺 <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="frommail" class="smallInput" size="30"  id="frommail" value="<%=frommail%>">
			������ע��163�����ʱ���Ǹ���@163.com���ʼ�,����<b>test001@163.com</b>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>������������ <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="fromname" class="smallInput" size="30"  id="fromname" value="<%=fromname%>">
			�˼��յ��ʼ�ʱ�򣬷���������������ʾ������<b>���쵼��</b>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>�����ռ����䣺 <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="PAddRecipient" class="smallInput" size="30"  id="PAddRecipient" value="<%=PAddRecipient%>">
			�����ԵĽ������䣬����<b>123456@qq.com</b>
		</TD> 
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>�����һر��⣺ <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="PSubject" class="smallInput" size="30"  id="PSubject" value="<%=PSubject%>">
			�����ı��⣬����<b>���쵼�������һ���ʾ</b>
		</TD> 
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow" ><b>�����һ����ݣ� <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
		<textarea cols="90" rows="14" name="PBody" id="PBody"><%=PBody%></textarea>
		<br />
		���磺<b>����qingtiandy.cn��ע����û����ǣ�{u}�������ǣ�{p}</b>
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" width="120"><b>ע���˺ű��⣺ <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="PSubjectZc" class="smallInput" size="30"  id="PSubjectZc" value="<%=PSubjectZc%>">
			�����ı��⣬����<b>���쵼���˺ż���</b>
		</TD> 
	</TR>		
	<TR> 
		<TD align="left" class="Forumrow" ><b>�˺ż������ݣ� <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
		<textarea cols="90" rows="14" name="PBodyZc" id="PBodyZc"><%=PBodyZc%></textarea>
		<br />
		���磺<b>�������쵼������ע����˺ż������ӣ�{href}����������޷��򿪣���ֱ�Ӱ����ӵ�ַ���Ƶ���ַ����</b>
		</TD> 
	</TR>		
	<TR> 
		<TD align="right" class="Forumrow" ></TD> 
		<TD class="Forumrow">
		<input type="hidden" value="editInfo" name="editInfo">
		<input type="button" value="�༭" name="addok" onClick="checkadd()">&nbsp;&nbsp;
		<input type="reset" value="���" name="addreset">&nbsp;&nbsp;
		</TD> 
	</TR>	
				
	</form>
</TABLE>	
</body>
</html>