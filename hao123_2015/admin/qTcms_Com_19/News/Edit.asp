<!--#include file="../../../p_inc/Include_func.asp"-->
<!--#include file="../../inc/public.asp"-->
<!--#include file="../../inc/openconn.asp"-->
<!--#include file="Config.asp"-->
<!--#include file="qingtiancms.com.config____.asp"-->
<%

	'=============================ͨ��ȫ�ֱ������ÿ�ʼ==============================
	GG_Power_Add			= "" '���Ȩ��
	GG_Power_Edit			= "" '�޸�Ȩ��
	GG_Power_Del			= "" 'ɾ��Ȩ��
	GG_Table				= ""&G_16_Table&"" '���� 
	GG_Title				= "��Ϣ����" '����
	
	'=============================ͨ��ȫ�ֱ������ý���==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	ref=Request.ServerVariables("HTTP_REFERER")	
	'//---- �༭��¼ ----//'
	If  Request.Form("editInfo")="editInfo" Then
		sID 			=	Bint(sID)
		sn_title		=	Replace_Text(Request.Form("n_title"))
		sn_title2		=	Replace_Text(Request.Form("n_title2"))
		sn_color		=	Replace_Text(Request.Form("n_color"))
		sn_type1 		=	Bint(Request.Form("n_type1"))
		sn_type2 		=	Bint(Request.Form("n_type2"))
		sn_look 		=	Bint(Request.Form("n_look"))		
		sn_hits 		=	Bint(Request.Form("n_hits"))
		sn_numb 		=	Bint(Request.Form("n_numb"))		
		sn_date			=	Replace_Text(Request.Form("n_date"))		
		sn_gotourl		=	Request.Form("n_gotourl")
		sn_gotourl2		=	Request.Form("n_gotourl2")
		sn_pic			=	Replace_Text(Request.Form("m_pic"))
		sn_content		=	Request.Form("n_content")	
		
		suid 			=	Bint(Request.Form("uid"))
		sn_jifen 		=	Bint(Request.Form("n_jifen"))	
		slianmengid 	=	Bint(Request.Form("lianmengid"))	
		
		
		
		Set rsObjs = Server.CreateObject("ADODB.Recordset")
		With rsObjs
			.Source = "SELECT * FROM "&GG_Table&" WHERE ID=" & sID
			.ActiveConnection = Conn
			.CursorType = 1
			.LockType = 3
			
			.Open()
			
			If .Eof Then 
				.AddNew()
				.Fields.Item("n_date").Value= FormatDate(sn_date,55)
			End If
			
			
			.Fields.Item("n_title").Value			= sn_title
			.Fields.Item("n_color").Value			= sn_color
			.Fields.Item("n_type1").Value			= sn_type1
			.Fields.Item("n_type2").Value			= sn_type2
			.Fields.Item("n_look").Value			= sn_look
			.Fields.Item("n_hits").Value			= sn_hits
			.Fields.Item("n_numb").Value			= sn_numb
			.Fields.Item("n_date").Value			= sn_date
			.Fields.Item("n_gotourl").Value			= sn_gotourl
			.Fields.Item("n_content").Value			= sn_content
			.Fields.Item("n_pic").Value				= sn_pic
			.Fields.Item("n_title2").Value			= sn_title2
			.Fields.Item("n_gotourl2").Value		= sn_gotourl2	
			.Fields.Item("lianmengid").Value		= slianmengid	
			
			
			IF suid<>0 And sn_jifen<>0 And Bint(.Fields.Item("n_jifen").Value)=0 Then
				.Fields.Item("n_jifen").Value		= sn_jifen
				.Update()
				Get_qingtiandy_jifen_ip suid,21,sn_jifen
			Else
				.Fields.Item("n_jifen").Value=0
				.Update()
				
			End IF
			InsertInd Cadmin,.Fields.Item("id").Value,GG_Table,"id"
			
			kku="index.asp?m_type1="&IIf(sn_type1=0,"",sn_type1)&"&m_type2="&IIf(sn_type2=0,"",sn_type2)
			
			Call G16_1("n_title="&sn_title&",n_gotourl="&sn_gotourl&",n_gotourl2="&n_gotourl2&",n_mid1="&.Fields.Item("id").Value&",v=1,n_look=1,",slianmengid)
				
			Response.Write "<script>window.location='"&kku&"'</scri"&"pt>"
			Response.End()
		End With
	End iF
	If CLng(sId)>0 Then
		Set rsObj2 = Conn.Execute( "SELECT * FROM "&GG_Table&" WHERE Id=" & sId )
		IF Not rsObj2.Eof Then
			oom_content=rsObj2("n_content")
			on_jifen=Bint(rsObj2("n_jifen"))
			ouid=rsObj2("uid")
		End IF
	End If	
	ssn_type1=Bint(Trim(request("n_type1")))
	ssn_type2=Bint(Trim(request("n_type2")))
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../../css/style.css" rel=stylesheet type=text/css>
<title>��Ϣ���/�޸�</title>
<script language="javascript" src="p_js.js"></script>
<script src="../../js/mouse_on_title.js"></script>
<script language="JavaScript1.4" type="text/javascript">
//��ɫѡ��
function SelectColorcmdt(what,backit){
   var dEL = document.all(what);
   var sEL = document.all(backit);
   var url = "../../js/color/selcolor.htm?color="+encodeURIComponent(dEL.value);
   var arr = showModalDialog(url,window,"dialogWidth:280px;dialogHeight:250px;help:no;scroll:no;status:no");
   if (arr) {
    dEL.value=arr;
    sEL.style.backgroundColor=arr;
    dEL.style.backgroundColor=arr;
   }
}
function checkadd(){
	if(document.myform.n_title.value==""){
		alert("����д����")
		document.myform.n_title.focus()
		return false
	}
	if(document.myform.n_gotourl.value==""){
		alert("����д��������")
		document.myform.n_gotourl.focus()
		return false
	}	
	if(document.myform.n_date.value==""){
		alert("����д��������")
		document.myform.n_date.focus()
		return false
	}
}
 function get_html_editer_value(content,editor){
     document.getElementById(content).value = window.frames[editor].HtmlEditor.document.getElementsByTagName('BODY')[0].innerHTML;//EditorΪ�����,p_noteΪ�ı���
}
</script>
</head>

<body>
<table width="98%" border="0" cellspacing="0" cellpadding="0"  align=center>
	<tr>
		<td  class=forumRowHighlight align="center"><a href="../ad.asp"><b>������ҳģ��ͼ</b></a></td>
	</tr>	
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>
<TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
	<tr> 
	  	<th height=25 colspan="2" class="tableHeaderText">�����Ϣ</th> 
	</tr> 
	<form method="POST" action="edit.asp" name="myform" onSubmit="return checkadd()">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="id" value="<%=sId%>">
	<input type="hidden" name="uid" value="<%=ouid%>">
	<TR> 
		<TD align="left" class="Forumrow" ><b>�Ƿ���Ч�� </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="n_look" value="1"  checked="checked"/>��
		<input type="radio" name="n_look" value="0"/>��
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" ><b>��� </b></TD> 
		<TD class="Forumrow">
		<select name="n_type1">
			<%
				k1_str=""
				For i=0 To Ubound(G_16_n_type1_a)
					k1_1=G_16_n_type1_a(i)
					k1=k1_1
					
					IF Instr(k1_1,"||")>0 Then
						k1_1_a=SPlit(k1_1,"||")
						k1=k1_1_a(0)
					End IF					
					k2=""
					
					IF Cstr(ssn_type1)=Cstr(i) Then
						k2=" selected=""selected"""
						IF Instr(k1_1,"||")>0 Then
							k1_str=k1_str&"<Select name=""n_type2"" id=""n_type2"">"
							k1_1_a=SPlit(k1_1,"||")
							For pi=1 To UBound(k1_1_a)						
								k3=""
								IF Cstr(ssn_type2)=Cstr(pi) Then
									k3=" selected=""selected"""
								End IF
								k1_str=k1_str&"<option value="""&pi&""""&k3&">"&k1_1_a(pi)&"</option>"
							Next
							k1_str=k1_str&"</Select>"
						End IF	
					Else
						k2=""
					End IF
					
					
					Response.Write "<option value="""&i&""" "&k2&">"&k1&"</option>"
				Next
			%>
		</select>
		<span id="tr_m_r">
		<%
			Response.Write k1_str
		%>
		</span>		
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" ><b>�Ƿ������ӣ� </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="lianmengid" value="1"/>��
		<input type="radio" name="lianmengid" value="0" checked="checked"/>��
		������һЩ���˵��Ƽ����ӣ���ô��ѡ��"��"
		</TD> 
	</TR>	
	<td align="left" class="Forumrow" width="120"><b>���⣺ <font color="#FF0000">*</font></b></td> <td class="Forumrow"><input type="text" name="n_title" class="smallInput" size="50" id="n_title">��ɫ��<select name="n_color" id="n_color"><option value="">����ɫ</option><option value="#000000" style="background-color:#000000">��ɫ</option><option value="#FF0000" style="background-color:#FF0000">��ɫ</option><option value="#009900" style="background-color:#009900">��ɫ</option><option value="#0000FF" style="background-color:#0000FF">��ɫ</option><option value="#ff6000" style="background-color:#ff6000">�ٻ�</option></select></td> 
	</tr>
	<tr> <td align="left" class="Forumrow"><b>����������ַ�� <font color="#FF0000">*</font></b><iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td> <td colspan="3" class="Forumrow"><input type="text" name="n_gotourl" class="smallInput" size="40" id="n_gotourl" value="">	��ʽ�磺/qingtiandy.cn/	�Ҳ�ΪĿǰ֧�ֵ�Ƶ����<select name="ss_n_gotourl" onChange="if(this.value!=&quot;&quot;)$(&quot;n_gotourl&quot;).value=this.value"><option value="">����ѡ��Ƶ������</option><option value="#����">����</option><option value="#��Ӱ">��Ӱ</option><option value="#����">���Ӿ�</option><option value="#����">����</option><option value="#�Ź�">�Ź�</option><option value="#Ц��">Ц��</option><option value="#��Ϸ">��Ϸ</option><option value="#С��Ϸ">С��Ϸ</option><option value="#����">����</option><option value="#����">����</option><option value="#С˵">С˵</option><option value="#��Ʊ">��Ʊ</option><option value="#����">����</option><option value="#��Ʊ">��Ʊ</option><option value="#����">����</option><option value="#����">����</option><option value="#Υ��">Υ��</option><option value="#���">���</option><option value="#�ֻ�">�ֻ�</option><option value="#ͼƬ">ͼƬ</option><option value="#Ů��">Ů��</option></select></td> </tr>
	
	
	<tr> <td align="left" class="Forumrow" width="120"><b>����2�� </b></td> <td class="Forumrow"><input type="text" name="n_title2" class="smallInput" size="50" id="n_title2"> �Ҳ�ΪĿǰ֧�ֵı�ǩ��<select name="ss_n_title2" onChange="if(this.value!=&quot;&quot;)$(&quot;n_title2&quot;).value=this.value"><option value="">����ѡ��Ƶ������</option><option value="dongman">����</option><option value="zongyi">����</option><option value="dianying">��Ӱ</option><option value="tv">���Ӿ�</option><option value="shipin">��Ƶ</option><option value="yule">����</option><option value="guoji">����</option><option value="guonei">����</option><option value="bagua">����</option><option value="tiyu">����</option><option value="junshi">����</option><option value="xinwen">����</option><option value="hulianwang">������</option><option value="keji">�Ƽ�</option><option value="caijing">�ƾ�</option><option value="fangchan">����</option><option value="jiaoyu">����</option><option value="youxi">��Ϸ</option><option value="nvxing">Ů��</option><option value="jiankang">����</option><option value="shehui">���</option><option value="mingxing">����</option><option value="meinv">��Ů</option><option value="bgyl">��������</option><option value="mnyy">Ů��</option><option value="mnyy">������Ů</option><option value="mryx">ÿ��һЦ</option><option value="difangzhan">�ط���վ</option><option value="code">������</option></select></td> <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></tr>
	
	<tr> <td align="left" class="Forumrow"><b>����������ַ2�� </b><iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td> <td colspan="3" class="Forumrow"><input type="text" name="n_gotourl2" class="smallInput" size="40" id="n_gotourl2" value="">	��ʽ�磺/qingtiandy.cn/	</td> </tr>
	
	<tr><td align="left" class="Forumrow"><b> ͼƬ��ַ��</b> <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td><td class="Forumrow"><input type="text" name="m_pic" id="m_pic" size="60" value=""> <iframe src="../../qTcms_Upload/Uppic2009061/Uploadpicture.asp?f1=/upload/pic/&amp;f2=m_pic&amp;w=&amp;h=&amp;bg=f7f3f7&amp;txt=�ߴ磺16*16" scrolling="no" topmargin="0" width="200" height="20" marginwidth="0" marginheight="0" frameborder="0" id="frame_m_pic"></iframe></td></tr>
	
	<tr> <td align="left" class="Forumrow"><b>������� </b><iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td> <td class="Forumrow"><input name="n_hits" id="n_hits" value="0"></td> </tr>
	
	<tr> <td align="left" class="Forumrow"><b>Ȩ�أ� </b><iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td> <td class="Forumrow"><input name="n_numb" id="n_numb" value="0">	����Խ����ʾԽǰ��</td> </tr>
	
	<tr> <td align="left" class="Forumrow"><b>�������ڣ� </b><iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></td><td class="Forumrow"><input name="n_date" id="n_date" value="<%=ForMatDate(now(),55)%>"></td>
	<%IF Cadmin="1" Then%>
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>Զ��ID�� </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="qingtiancmsid" class="smallInput" size="30"  id="qingtiancmsid" value="0"> 
		</TD> 
	</TR>	
	<%End IF%>		
	<TR> 
		<TD align="left" class="Forumrow" ><b>��ע���룺 </b></TD> 
		<TD class="Forumrow">
		<textarea cols="70" rows="10" name="n_content" id="n_content"><%=oom_content%></textarea>	
		</TD> 
	</TR>	
	<TR> 
		<TD align="right" class="Forumrow" ></TD> 
		<TD class="Forumrow">
		<input type="hidden" value="editInfo" name="editInfo">
		<input type="submit" value="���" name="addok">&nbsp;&nbsp;
		<input type="reset" value="����" name="addreset" onClick="window.location='<%="index.asp?m_type1="&IIf(ssn_type1=0,"",ssn_type1)&"&m_type2="&IIf(ssn_type2=0,"",ssn_type2)%>'">&nbsp;&nbsp;
		</TD> 
	</TR>	
				
	</form>
</TABLE>	
<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = myform;")
		WriteLn("	with(oForm){")
		Set rsObj = Server.CreateObject("ADODB.Recordset")
		rsObj.open  "SELECT * FROM "&GG_Table&" WHERE Id=" & sId ,Conn,1,1
		If not rsObj.Eof Then 
			WriteLn("		m_pic.value='" & Str4Js(rsObj.Fields.Item("n_pic").Value) & "';")
			WriteLn("		n_gotourl.value='" & Str4Js(rsObj.Fields.Item("n_gotourl").Value) & "';")
			WriteLn("		n_numb.value='" & Str4Js(rsObj.Fields.Item("n_numb").Value) & "';")
			
			WriteLn("		n_title.value='" & Str4Js(rsObj.Fields.Item("n_title").Value) & "';")
			WriteLn("		n_title2.value='" & Str4Js(rsObj.Fields.Item("n_title2").Value) & "';")
			WriteLn("		n_color.value='" & Str4Js(rsObj.Fields.Item("n_color").Value) & "';")
			WriteLn("		n_type1.value='" & Str4Js(rsObj.Fields.Item("n_type1").Value) & "';")
			WriteLn("		n_hits.value='" & Str4Js(rsObj.Fields.Item("n_hits").Value) & "';")
			
			'WriteLn("		n_date.value='" & Str4Js(rsObj.Fields.Item("n_date").Value) & "';")
			
			WriteLn("		n_gotourl2.value='" & Str4Js(rsObj.Fields.Item("n_gotourl2").Value) & "';")
			
			IF Cadmin="1" Then
			WriteLn("		qingtiancmsid.value='" & Str4Js(rsObj.Fields.Item("qingtiancmsid").Value) & "';")
			End IF			
			n_look=Str4Js(rsObj.Fields.Item("n_look").Value)
			lianmengid=Str4Js(rsObj.Fields.Item("lianmengid").Value)
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
		WriteLn(CheckBoxScript("oForm.n_look",n_look))
		WriteLn(CheckBoxScript("oForm.lianmengid",lianmengid))
	End Function
</SCRIPT>

<%
	If CLng(sId)>0 Then
		ShowInfo sId
	End If
	


	
	
	
	
	
	CloseConn()
%>
</body>
</html>