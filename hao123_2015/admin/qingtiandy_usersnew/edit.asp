<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
	'=============================ͨ��ȫ�ֱ������ÿ�ʼ==============================
	GG_Title				=	"�û�" '����
	GG_Table				=	"soojs_un"
	
	'=============================ͨ��ȫ�ֱ������ý���==============================
	
	sID = Trim(request("Id")):IF sID="" Then sID=0
	Action=Trim(request.QueryString("Action"))
	ref=Request.ServerVariables("HTTP_REFERER")
	ref=IIf(Instr(ref,"qingtiancms.com.l.asp")>0,"index.asp",ref)
	IF Action="Del" And sID<>"" Then
		fId=FormatNumSerial(sID)
		fId2=split(fId,",")
		For id0=Lbound(fId2) To Ubound(fId2)
			'ɾ�����
			IF G_waibudiaoong_p1="1" Then
				Set oRsn=Conn.Execute("Select * From soojs_un Where Id="&fId2(id0))
				IF Not oRsn.Eof Then
					wa=MD5("2055vip"&oRsn("soojs_u_name"),32)
					wuser=oRsn("soojs_u_name")
					wpass=oRsn("soojs_u_pass")
					on error resume next
					str=""&qtcmsdh.Qingtiandy_getHTTPPage("http://vip.2055.com/regzh.aspx?action=del&syskey="&wa&"&username="&wuser)
					'Response.Write "http://vip.2055.com/regzh.aspx?action=reg&syskey="&wa&"&username="&wuser&"&password="&wpass&"<br>"	
					'Response.Write str&"ok"
					'Response.End()	
				End IF		
			End IF				
			conn.Execute("Delete From qingtiandy_curl Where c_uid="&fId2(id0))
			conn.Execute("Delete From qingtiandy_listurl Where list_uid="&fId2(id0))
			conn.Execute("Delete From qingtiandy_url Where w_uid="&fId2(id0))
			conn.Execute("Delete From soojs_un Where ID="&fId2(id0))	
			conn.Execute("Delete From qingtiandy_jifen_ip Where uid="&fId2(id0))			
		Next
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	IF Action="soojs_status" And sID<>"" Then
		fId=FormatNumSerial(sID)
		l_look=StayNub(request("soojs_status"))
		IF l_look<>"" Then
			Conn.execute("update  "&GG_Table&" Set soojs_status="&l_look&" where id In("&fId&")")
		End IF
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	IF Action="soojs_u_f1" And sID<>"" Then
		fId=FormatNumSerial(sID)
		l_look=StayNub(request("soojs_u_f1"))
		IF l_look<>"" Then
			Conn.execute("update  "&GG_Table&" Set soojs_u_f1="&l_look&" where id In("&fId&")")
		End IF
		response.Redirect request.ServerVariables("HTTP_REFERER")
		response.End()
	End IF	
	If isPostBack And Request.Form("editInfo")="editInfo" Then
		sID = Bint(sID)
		ssoojs_status=Bint(Request.Form("soojs_status"))
		ssoojs_sex=Bint(Request.Form("soojs_sex"))
		ssoojs_u_birth=ReplaceText(Request("yyyy"))&"-"&ReplaceText(Request("mm"))&"-"&ReplaceText(Request("dd"))
		ssoojs_u_Province=ReplaceText(Request("Province"))
		ssoojs_u_City=ReplaceText(Request("City"))
		ssoojs_u_email=Replace_Text_2008(Request.Form("soojs_u_email"))
		ssoojs_u_name=Replace_Text_2008(Request.Form("soojs_u_name"))
		ssoojs_u_pass=Replace_Text_2008(Request.Form("soojs_u_pass"))
		ssoojs_u_card=Replace_Text_2008(Request.Form("soojs_u_card"))
		ssoojs_u_qq=Replace_Text_2008(Request.Form("soojs_u_qq"))
		ssoojs_u_msn=Replace_Text_2008(Request.Form("soojs_u_msn"))
		ssoojs_u_content=Replace_Text_Html(ReplaceTextArea(Request.Form("soojs_u_content")))
		ssoojs_u_alipay=Replace_Text_2008(Request.Form("soojs_u_alipay"))
		ssoojs_u_alipay_name=Replace_Text_2008(Request.Form("soojs_u_alipay_name"))
		ssoojs_u_f1=Bint(Request.Form("soojs_u_f1"))
		ssoojs_jifen_zhuye=Bint(Request.Form("soojs_jifen_zhuye"))
		ssoojs_jifen_G_jifen_home=Bint(Request.Form("soojs_jifen_G_jifen_home"))
		ssoojs_jifen_G_jifen_tuijian=Bint(Request.Form("soojs_jifen_G_jifen_tuijian"))
		ssoojs_jifen_G_jifen_tuiguang_s=Replace_Text_2008(Request.Form("soojs_jifen_G_jifen_tuiguang_s"))
		ssoojs_jifen_G_jifen_timer=Bint(Request.Form("soojs_jifen_G_jifen_timer"))
		ssoojs_jifen_G_jifen_jifen_bili=Bint(Request.Form("soojs_jifen_G_jifen_jifen_bili"))
		ssoojs_jifen_G_jifen_tuiguang_if=Bint(Request.Form("soojs_jifen_G_jifen_tuiguang_if"))
		ssoojs_jifen_G_jifen_s_f_1=Bint(Request.Form("soojs_jifen_G_jifen_s_f_1"))
		ssoojs_jifen_G_jifen_xiaxian_denglu=Bint(Request.Form("soojs_jifen_G_jifen_xiaxian_denglu"))
		ssoojs_jifen_G_jifen_xiaxian_zhuye=Bint(Request.Form("soojs_jifen_G_jifen_xiaxian_zhuye"))
		ssoojs_jifen_G_jifen_xiaxian_tikuan=Bint(Request.Form("soojs_jifen_G_jifen_xiaxian_tikuan"))
		ssoojs_jifen_G_jifen_denglu=Bint(Request.Form("soojs_jifen_G_jifen_denglu"))
		ssoojs_jifen_G_jifen_shouyejifen_bili=Bint(Request.Form("soojs_jifen_G_jifen_shouyejifen_bili"))
		
		Set rsObj = Server.CreateObject(G_RS)
		With rsObj
			.Source = "SELECT * FROM "&GG_Table&" WHERE id=" & sID
			.ActiveConnection = conn
			.CursorType = 1
			.LockType = 3
			.Open()
			If .Eof Then 
				.AddNew()
				Set Rs1 = Conn.Execute("Select id from "&GG_Table&" where soojs_u_email = '"& ssoojs_u_email &"' or soojs_u_name='"&ssoojs_u_name&"'")
				If Not Rs1.Eof Then
					doAlert "��E-mail���ǳ��Ѿ����ڣ�" , "javascript:history.back(-1);"
					Response.End()
				End If
				Rs1.Close : Set Rs1 = Nothing
				.Fields.Item("soojs_date").Value=FormatDate(now,55)'ע��ʱ��
				.Fields.Item("soojs_thisdate").Value=FormatDate(now,55)'ע��ʱ��	
				.Fields.Item("soojs_lastdate").Value=FormatDate(now,55)'ע��ʱ��					
				.Fields.Item("soojs_ip").Value=getIP()
				.Fields.Item("soojs_thisip").Value=getIP()	
				.Fields.Item("soojs_lastip").Value=getIP()	
				IF G_zhuce_j2="" Then
					.Fields.Item("soojs_jifen").Value=0	
				Else
					.Fields.Item("soojs_jifen").Value=G_zhuce_j2
				End IF								
			Else
			
				Set Rs1 = Conn.Execute("Select id from "&GG_Table&" where (soojs_u_email = '"& ssoojs_u_email &"' or soojs_u_name='"&ssoojs_u_name&"') And id<>"&sID)
				If Not Rs1.Eof Then
					doAlert "��E-mail���ǳ��Ѿ����ڣ�" , "javascript:history.back(-1);"
					Response.End()
				End If
				Rs1.Close : Set Rs1 = Nothing			
			End IF		
			.Fields.Item("soojs_u_name").Value=ssoojs_u_name
			.Fields.Item("soojs_u_pass").Value=ssoojs_u_pass
			.Fields.Item("soojs_uu_name").Value=zsoojs_u_name
			.Fields.Item("soojs_u_ask").Value=""
			.Fields.Item("soojs_u_ok").Value=""
			.Fields.Item("soojs_u_tel").Value=""
			.Fields.Item("soojs_u_qq").Value=ssoojs_u_qq
			.Fields.Item("soojs_u_email").Value=ssoojs_u_email
			.Fields.Item("soojs_u_addr").Value=""			
			.Fields.Item("soojs_u_content").Value=ssoojs_u_content										
			.Fields.Item("soojs_level").Value=0		
			.Fields.Item("soojs_sex").Value=ssoojs_sex
			.Fields.Item("soojs_u_card").Value=ssoojs_u_card
			.Fields.Item("soojs_u_msn").Value=ssoojs_u_msn
			.Fields.Item("soojs_u_birth").Value=ssoojs_u_birth
			.Fields.Item("soojs_u_Province").Value=ssoojs_u_Province
			.Fields.Item("soojs_u_City").Value=ssoojs_u_City
			.Fields.Item("soojs_status").Value=ssoojs_status
			.Fields.Item("soojs_u_alipay").Value=ssoojs_u_alipay
			.Fields.Item("soojs_u_alipay_name").Value=ssoojs_u_alipay_name
			.Fields.Item("soojs_u_f1").Value=ssoojs_u_f1
			.Fields.Item("soojs_jifen_zhuye").Value=ssoojs_jifen_zhuye
			.Fields.Item("soojs_jifen_G_jifen_home").Value=ssoojs_jifen_G_jifen_home
			.Fields.Item("soojs_jifen_G_jifen_tuijian").Value=ssoojs_jifen_G_jifen_tuijian
			.Fields.Item("soojs_jifen_G_jifen_tuiguang_s").Value=ssoojs_jifen_G_jifen_tuiguang_s
			.Fields.Item("soojs_jifen_G_jifen_timer").Value=ssoojs_jifen_G_jifen_timer
			.Fields.Item("soojs_jifen_G_jifen_jifen_bili").Value=ssoojs_jifen_G_jifen_jifen_bili
			.Fields.Item("soojs_jifen_G_jifen_tuiguang_if").Value=ssoojs_jifen_G_jifen_tuiguang_if
			.Fields.Item("soojs_jifen_G_jifen_s_f_1").Value=ssoojs_jifen_G_jifen_s_f_1
			.Fields.Item("soojs_jifen_G_jifen_xiaxian_denglu").Value=ssoojs_jifen_G_jifen_xiaxian_denglu
			.Fields.Item("soojs_jifen_G_jifen_xiaxian_zhuye").Value=ssoojs_jifen_G_jifen_xiaxian_zhuye
			.Fields.Item("soojs_jifen_G_jifen_xiaxian_tikuan").Value=ssoojs_jifen_G_jifen_xiaxian_tikuan
			.Fields.Item("soojs_jifen_G_jifen_denglu").Value=ssoojs_jifen_G_jifen_denglu
			.Fields.Item("soojs_jifen_G_jifen_shouyejifen_bili").Value=ssoojs_jifen_G_jifen_shouyejifen_bili
			.Update()
			'Response.Redirect st_str&server.URLEncode("?id="&.Fields.Item("id").Value&"&r_l_type1="&sl_type1&"&r_l_group="&sl_group&"&r_l_list="&sl_list)
			IF ref="" Then ref=	"index.asp"
			doAlert "" , TurnBackPage(Request.Form("Ref"),"index.asp")
			Response.End()				
		End With			
	End IF	
	
	am_type1=Bint(Request("m_type1"))
	am_type2=Bint(Request("m_type2"))
	am_type3=Bint(Request("m_type3"))
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title><%=G_WebName%> - <%=GG_Title%>���/�༭</title>
<script language="javascript" src="../js/p_js.js"></script>
<script type="text/javascript" src="FormCity.js"></script>
<script type="text/javascript" src="FormScript.js"></script>
<script>
function checkadd(){
	if($("soojs_u_email").value.Trim()==""){
		alert("����дE-mail��ַ��")
		$("soojs_u_email").focus()
		return false
	}
	if($("soojs_u_name").value.Trim()==""){
		alert("����д�ǳƣ�")
		$("soojs_u_name").focus()
		return false
	}
	if($("soojs_u_pass").value.Trim()==""){
		alert("����д��½���룡")
		$("soojs_u_pass").focus()
		return false
	}		
}

</script>
</head>
<body>
<iframe name="check_id_1" id="check_id_1" width="0" height="0" src="_blank" style="display:none"></iframe>
<TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
	<form method="POST" action="" name="myform" onSubmit="return checkadd()">
	<input type="hidden" name="ref" value="<%=ref%>">
	<tr> 
	  	<th height=25 class="tableHeaderText">������</th> 
		<td class="Forumrow"></td>
	</tr> 	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>�Ƿ�������½�� </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="soojs_u_f1" value="1"/>��
		<input type="radio" name="soojs_u_f1" value="0" checked="checked"/>��
		</TD> 
	</TR>	
	<tr> 
	  	<th height=25 class="tableHeaderText">�û�������Ϣ</th> 
		<td class="Forumrow"></td>
	</tr> 	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>�Ƿ�ͨ�������֤�� </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="soojs_status" value="1"/>��
		<input type="radio" name="soojs_status" value="0" checked="checked"/>��
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>�Ա� </b></TD> 
		<TD class="Forumrow">
		<input type="radio" name="soojs_sex" value="0" checked="checked"/>����
		<input type="radio" name="soojs_sex" value="1"/>��
		<input type="radio" name="soojs_sex" value="2"/>Ů
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow" ><b>�������ڣ�</b></TD> 
		<TD class="Forumrow">			 
		<select name="yyyy" id="yyyy">
		<%
		For ii=Clng(year(now))-70 to Clng(year(now))-10
			IF ii=Clng(year(now))-29 Then
				Response.Write "<option value='"&ii&"' Selected>"&ii&"</option>"
			Else
				Response.Write "<option value='"&ii&"'>"&ii&"</option>"		
			End IF				
		Next
		%>
		</select> ��<select name="mm" id="mm">
		<%
		For ii=1 to 12
			pi=right("0"&ii,2)
			IF pi="01" Then
				Response.Write "<option value='"&pi&"' Selected>"&pi&"</option>"
			Else
				Response.Write "<option value='"&pi&"'>"&pi&"</option>"		
			End IF				
		Next
		%>						
		</select> ��<select name="dd" id="dd">
		<%
		For ii=1 to 31
			pi=right("0"&ii,2)
			IF pi="01" Then
				Response.Write "<option value='"&pi&"' Selected>"&pi&"</option>"
			Else
				Response.Write "<option value='"&pi&"'>"&pi&"</option>"		
			End IF				
		Next
		%>							
		</select> ��
		</TD> 
	</TR>	
		<TD align="left" class="Forumrow" ><b>���ڵأ� </b></TD> 
		<TD class="Forumrow">			 
		<select name="Province" id="Province" onChange="Get_Company_where_2(this.value,'','Province','City')">
			<script>Get_Company_where()</script>
		</select>
		<select name="City" id="City" >
		  <option value="">ѡ����</option>
		</select>
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>E-mail��ַ�� <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="soojs_u_email" class="smallInput" size="50" id="soojs_u_email" onChange="check_email()">
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow"><b>�ǳƣ� <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="soojs_u_name" class="smallInput" size="50" id="soojs_u_name" onChange="check_soojs_u_name()">
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>��½���룺 <font color="#FF0000">*</font></b></TD> 
		<TD class="Forumrow">
			<input type="text" name="soojs_u_pass" class="smallInput" size="50" id="soojs_u_pass">
		</TD> 
	</TR>			
	<TR> 
		<TD align="left" class="Forumrow"><b>���֤���룺 </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="soojs_u_card" class="smallInput" size="50" id="soojs_u_card">
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>��ϵQQ�� </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="soojs_u_qq" class="smallInput" size="50"  id="soojs_u_qq">
		</TD> 
	</TR>
	<TR> 
		<TD align="left" class="Forumrow"><b>��ϵMSN�� </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="soojs_u_msn" class="smallInput" size="50"  id="soojs_u_msn">
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow" width="200"><b>������ </b></TD> 
		<TD class="Forumrow">
			<textarea cols="70" rows="8" name="soojs_u_content" id="soojs_u_content"></textarea>
		</TD> 
	</TR>	
	<tr> 
	  	<th height=25 class="tableHeaderText">֧������Ϣ</th> 
		<td class="Forumrow"></td>
	</tr> 	
	<TR> 
		<TD align="left" class="Forumrow"><b>֧�����ʺţ� </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="soojs_u_alipay" class="smallInput" size="50"  id="soojs_u_alipay">
		</TD> 
	</TR>	
	<TR> 
		<TD align="left" class="Forumrow"><b>֧�������֣� </b></TD> 
		<TD class="Forumrow">
			<input type="text" name="soojs_u_alipay_name" class="smallInput" size="50"  id="soojs_u_alipay_name">
		</TD> 
	</TR>	
	<tr> 
	  	<th height=25 class="tableHeaderText">�������⹦��--��Ϊ��ҳ��</th> 
		<td class="Forumrow"></td>
	</tr> 			
	<TR>
	<td height=25 class="Forumrow"><strong>����--�û��Զ�������ҳ�Ͷ��ٻ���</strong><br>
	  24Сʱ֮�ڷ���ֻ��һ��</td>
		<td class="Forumrow">
		<input name="soojs_jifen_G_jifen_home" value="" size="10" >  
		���������������������ã�����Ϊ0��ͻ�������һ��</td>
	</tr>
	<TR> 
		<TD align="left" class="Forumrow"><b>����--�û��Զ�������ҳ�Ƿ��Զ���ip�� </b></TD> 
		<TD class="Forumrow">
			<select name="soojs_jifen_zhuye" id="soojs_jifen_zhuye">
				<option value="0">��</option>
				<option value="1">����</option>
			</select>
			����Ҫ�󶨣��������ʺ���װ����Ա���õģ�Ϊ���ṩ�������룬���Բ���
		</TD> 
	</TR>
	<TR>
	<td height=23 class="Forumrow"><strong><U>�۵��ٷֵı���</u></strong><br>
	  д���֣�Ĭ����0�����ǲ�����</td>
		<td class="Forumrow">
			<input name="soojs_jifen_G_jifen_shouyejifen_bili" value="" size="10"> ֵ����0-100֮��
		</td>
	</tr>	
	<tr> 
	  	<th height=25 class="tableHeaderText">�������⹦��--�ƹ����ã�</th> 
		<td class="Forumrow"></td>
	</tr> 	
	<TR>
	<td  height=25 class="Forumrow"></td>
	  <td class="Forumrow">
		<select name="soojs_jifen_G_jifen_tuiguang_if">
			<option value="1">��������--����Ĳ���Ч</option>
			<option value="0" selected="selected">��������������</option>
		</select> 	  
	  </td>
	</tr>		
	<TR>
	<td  height=25 class="Forumrow"><strong>����--�û��ƹ�һ�������Ͷ��ٻ���</strong><br>
	  �ƹ���һ��ֻ���ƹ�һ���ʺ�</td>
	  <td class="Forumrow">
		<input name="soojs_jifen_G_jifen_tuijian" value="" size="10" >	  
		  ���������������������ã�����Ϊ0��ͻ�������һ��</td>
	</tr>	
	<TR>
	<td  height=23 class="Forumrow"><strong><U>�ƹ����ģʽ</u></strong><br>
	  ��ʱ�䡢��IP</td>
		<td  class="Forumrow">
		<select name="soojs_jifen_G_jifen_tuiguang_s">
			<option value="">��IP�ǻ���</option>
			<option value="1">��ʱ��ǻ���</option>
			<option value="2">��PV�ǻ���</option>
			<option value="3">��IP�ǻ���--�������׹���</option>
		</select>
		<span id="G_jifen_tuiguang_s_span"></span>	
		</td>
	</tr>	
	<TR>
	<td  height=25 class="Forumrow"><strong><u>�ƹ����-�û�ÿ�ջ�����������</u></strong><br>
	��������ã���ô���ֿ�����������
	</td>
	  <td class="Forumrow">
		<input type="text" name="soojs_jifen_G_jifen_s_f_1" value="" size="45">  ���磺500
	  </td>
	</tr>		
	<TR id="G_jifen_timer_tr">
	<td height=23 class="Forumrow"><strong><U>���ֲ���--����ʱ����ֻ��һ�λ���</u></strong><br>
	  �������Կ�����Ĭ����0�����ǲ�����</td>
		<td class="Forumrow">
			<input name="soojs_jifen_G_jifen_timer" value="" size="45"> ��λ�� ����(1��=1000����)
		</td>
	</tr>
	<TR>
	<td height=23 class="Forumrow"><strong><U>�۵��ٷֵı���</u></strong><br>
	  д���֣�Ĭ����0�����ǲ�����</td>
		<td class="Forumrow">
			<input name="soojs_jifen_G_jifen_jifen_bili" value="" size="45"> ֵ����0-100֮��
		</td>
	</tr>	
	<tr> 
	  	<th height=25 class="tableHeaderText">�������⹦��--�������ã�</th> 
		<td class="Forumrow"></td>
	</tr> 	
	<TR>
	<td  height=25 class="Forumrow"><strong>���ߵ�½��ɱ���</strong><br>
	  50�ı���,��ȡ��������Ϊ0</td>
	  <td class="Forumrow">
		<input name="soojs_jifen_G_jifen_xiaxian_denglu" value="" size="10" >	  
		  �����ñ���������50��0.5��Ĭ����100��1,����100%���</td>
	</tr>
	<TR>
	<td  height=25 class="Forumrow"><strong>������Ϊ��ҳ��ɱ���</strong><br>
	  50�ı���,��ȡ��������Ϊ0</td>
	  <td class="Forumrow">
		<input name="soojs_jifen_G_jifen_xiaxian_zhuye" value="" size="10" >	  
		  �����ñ���������50��0.5��Ĭ����100��1,����100%���</td>
	</tr>	
	<TR>
	<td  height=25 class="Forumrow"><strong>���������ɱ���</strong><br>
	  50�ı���,��ȡ��������Ϊ0</td>
	  <td class="Forumrow">
		<input name="soojs_jifen_G_jifen_xiaxian_tikuan" value="" size="10" >	  
		  �����ñ���������50��0.5��Ĭ����100��1,����100%���</td>
	</tr>	
	<tr> 
	  	<th height=25 class="tableHeaderText">�������⹦��--��½���֣�</th> 
		<td class="Forumrow"></td>
	</tr> 	
	<TR>
	<td width="38%" height=23 class="forumRowHighlight"><strong><U>����--�û���½һ���Ͷ��ٻ���</u></strong><br>
	  һ�����ֻ��һ��</td>
		<td width="62%" class="forumRowHighlight">
		<input name="soojs_jifen_G_jifen_denglu" value="" size="45" > 
		</td>
	</tr>																	
	<TR> 
		<TD align="left" class="Forumrow" width="200"></TD> 
		<TD class="Forumrow">
		  <input type="hidden" name="editInfo" value="editInfo">
		  <input type="submit" value="�ύ" name="submit_b" id="submit_b">
		  <input type="button" value="�����б�ҳ" name="submit_c" id="submit_c" onClick="window.location='./index.asp'">		</TD> 
	</TR>		
	</form>
</TABLE>

<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = myform;")
		WriteLn("	with(oForm){")
		
		Set rsObj = Server.CreateObject(G_Rs)
		rsObj.open "SELECT * FROM "&GG_Table&" WHERE id=" & sId,conn,1,1
		If not rsObj.Eof Then 
			soojs_status = Str4Js(rsObj.Fields.Item("soojs_status").Value)
			soojs_sex = Str4Js(rsObj.Fields.Item("soojs_sex").Value)
			zsoojs_u_birth = Str4Js(rsObj.Fields.Item("soojs_u_birth").Value)
			zsoojs_u_Province = Str4Js(rsObj.Fields.Item("soojs_u_Province").Value)
			zsoojs_u_City = Str4Js(rsObj.Fields.Item("soojs_u_City").Value)
			zsoojs_u_f1 = Str4Js(rsObj.Fields.Item("soojs_u_f1").Value)
			ozsoojs_u_birth=Str4Js(zsoojs_u_birth)
			ozsoojs_u_birth_a=Split(ozsoojs_u_birth,"-")
			oyyyy=ozsoojs_u_birth_a(0)
			omm=ozsoojs_u_birth_a(1)
			odd=ozsoojs_u_birth_a(2)
			WriteLn("		soojs_u_email.value='" & Str4Js(rsObj.Fields.Item("soojs_u_email").Value) & "';")	
			WriteLn("		soojs_u_name.value='" & Str4Js(rsObj.Fields.Item("soojs_u_name").Value) & "';")
			WriteLn("		soojs_u_pass.value='" & Str4Js(rsObj.Fields.Item("soojs_u_pass").Value) & "';")
			WriteLn("		yyyy.value='" & Str4Js(oyyyy) & "';")
			WriteLn("		mm.value='" & Str4Js(omm) & "';")
			WriteLn("		dd.value='" & Str4Js(odd) & "';")	
			WriteLn("		Province.value='" & Str4Js(zsoojs_u_Province) & "';")	
			WriteLn("		Get_Company_where_2('"&Str4Js(zsoojs_u_Province)&"','"&Str4Js(zsoojs_u_City)&"','Province','City');")
			WriteLn("		soojs_u_card.value='" & Str4Js(rsObj.Fields.Item("soojs_u_card").Value) & "';")	
			WriteLn("		soojs_u_qq.value='" & Str4Js(rsObj.Fields.Item("soojs_u_qq").Value) & "';")	
			WriteLn("		soojs_u_msn.value='" & Str4Js(rsObj.Fields.Item("soojs_u_msn").Value) & "';")	
			WriteLn("		soojs_u_content.value='" & Str4Js(HTMLDecodeTextArea(HTMLDecode(rsObj.Fields.Item("soojs_u_content").Value))) & "';")
			WriteLn("		soojs_u_alipay.value='" & Str4Js(rsObj.Fields.Item("soojs_u_alipay").Value) & "';")
			WriteLn("		soojs_u_alipay_name.value='" & Str4Js(rsObj.Fields.Item("soojs_u_alipay_name").Value) & "';")
			WriteLn("		soojs_jifen_zhuye.value='" & Bint(Str4Js(rsObj.Fields.Item("soojs_jifen_zhuye").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_home.value='" & Str4Js(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_home").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_tuijian.value='" & Str4Js(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_tuijian").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_tuiguang_s.value='" & Str4Js(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_tuiguang_s").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_timer.value='" & Str4Js(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_timer").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_jifen_bili.value='" & Str4Js(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_jifen_bili").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_tuiguang_if.value='" & Bint(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_tuiguang_if").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_s_f_1.value='" & Bint(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_s_f_1").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_xiaxian_denglu.value='" & Bint(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_xiaxian_denglu").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_xiaxian_zhuye.value='" & Bint(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_xiaxian_zhuye").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_xiaxian_tikuan.value='" & Bint(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_xiaxian_tikuan").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_denglu.value='" & Bint(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_denglu").Value)) & "';")
			WriteLn("		soojs_jifen_G_jifen_shouyejifen_bili.value='" & Bint(Str4Js(rsObj.Fields.Item("soojs_jifen_G_jifen_shouyejifen_bili").Value)) & "';")
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
		
		WriteLn(CheckBoxScript("oForm.soojs_status",soojs_status))
		WriteLn(CheckBoxScript("oForm.soojs_sex",soojs_sex))
		WriteLn(CheckBoxScript("oForm.soojs_u_f1",zsoojs_u_f1))
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