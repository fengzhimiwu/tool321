<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title>�ҽ��û�����</title>
<script src="../js/mouse_on_title.js"></script>
<script src="../js/p_js.js"></script>
<link id="css" href="../inc/moni/dv_wnd.css" type="text/css" rel="stylesheet">
<script language="javascript" src="../inc/moni/dv_wnd.js" type="text/javascript"></script>
<script>
function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall' )
       e.checked = form.chkall.checked;
    }
  }
function setCookie(name, value) {
    var expdate = new Date();
    var argv = setCookie.arguments;//�������
    var argc = setCookie.arguments.length;//�������ĳ���
    var expires = (argc > 2) ? argv[2] : 1;//���쳤����
    var path = (argc > 3) ? argv[3] : "/";
    var domain = (argc > 4) ? argv[4] : null;
    var secure = (argc > 5) ? argv[5] : false;
    if(expires!=null){
        expdate.setTime(expdate.getTime() + ( expires*24*60*60*1000 )); //�Ѵ������ñ����������
	}
    document.cookie = name + "=" + escape (value)
    +((expires == null) ? "" : ("; expires="+ expdate.toGMTString()))
    +((path == null) ? "" : ("; path=" + path))
    +((domain == null) ? "" : ("; domain=" + domain))
    +((secure == true) ? "; secure" : "");
}

</script>
</head>
<body>
<%
	s_page=""
	IF request.Cookies("page_n")="" then
		msg_per_page=10
	else
		msg_per_page=Cint(request.Cookies("page_n"))
	end if
	kSql_where="id>0"
	kSql_order="m_time desc,id desc"
	sDesc=Trim(Request("desc"))
	IF sDesc<>"" Then  kSql_order=sDesc
	
	zjid=StayNub(Request("jid"))
	IF zjid<>"" Then 
		kSql_where=kSql_where& " And jid="&zjid
	End IF

	zuid=StayNub(Request("uid"))
	IF zuid<>"" Then 
		kSql_where=kSql_where& " And uid="&zuid
	End IF

	zm_look=StayNub(Request("m_look"))
	IF zm_look<>"" Then 
		kSql_where=kSql_where& " And m_look="&zm_look
	End IF
		
	
	zm_name=Replace_Text_2008(Request("m_name"))
	IF zm_name<>"" Then kSql_where=kSql_where&" And (m_name like '%"&zm_name&"%')"

	sql="Select * from qingtiandy_jifen_goodsman Where "&kSql_where&" Order by "&kSql_order
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1 
	s_page="?desc="&server.URLEncode(sDesc)&"&m_name="&server.URLEncode(zm_name)&"&m_look="&zm_look&"&uid="&zuid
%>
<!--#include file="../inc/headpage.asp"-->
<table width="98%" border="0" cellspacing="1" cellpadding="1"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>�ҽ��û�����</th>
	</tr>
	<FORM name=form action="?" method=get>
	<tr>
		<td width="12%" height=25 class="forumRowHighlight">
		<B>�������ѡ��</B></td>
		<td width="88%" class=forumRowHighlight>
		<DIV id="showTemplet">
			<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="templet">
				<tr>
					<td>
						<Select name="m_look">
							<Option value="">״̬</Option>
							<Option value="1">��ʾ</Option>
							<Option value="0">����</Option>
						</Select>				
						<select name="desc">
							<option value="" selected="selected">Ĭ������</option>
							<option value="g_time asc" selected="selected">���ʱ������</option>
							<option value="g_time desc">���ʱ�併��</option>
							<option value="m_name">�����a~z����</option>
							<option value="m_name desc">�����z~a����</option>
							<option value="id desc">ID����</option>
							<option value="id asc">ID����</option>
						</select>
						��վ����
						<input type = "Text" name = "m_name" style="width:200px;"> </td>
				</tr>
			</table>
		</DIV>
	  </td>
	</tr>	
	
	<tr> 
		<td width="12%" height=25 class="forumRowHighlight"></td>
	  <td width="88%" height=25 class="forumRowHighlight">
	  <input type="submit" value="���̲���" id="submit" name="submit" style="cursor:hand;">����
	  [<a href="javascript:location.reload()">ˢ��ҳ��</a>]
	  </td>
	</tr>	
	</form>
</table>
<Form name="search" method="post" action="?">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th width="88%" height=25 class="tableHeaderText"><a href='?'><font color="#FFFFFF">�ҽ��û��б�</font></a></th>	
        <th width="12%" height=25 class="tableHeaderText" align="right">
	<select name="pp_page" onChange="setCookie('page_n',this.options[this.selectedIndex].value,30);location.href='?'">
	<option value="">��ѡ��ҳ��</option>
	<option value="10">10</option>
	<option value="15">15</option>
	<option value="20">20</option>
	<option value="30">30</option>
	<option value="50">50</option>
	<option value="100">100</option>
	<option value="200">200</option>
	<option value="300">300</option>
	<option value="500">500</option>
	</select>		
	  </th>
	<tr> 
	<tr>
		<td colspan="2"> 
  			<TABLE width="100%" border="0" cellpadding="0" cellspacing="1">
			<TR height=25>			
				<TD width="7%"   class=bodytitle><font color="#CC3300"><b>ID </b></font></TD>
				<TD width="7%"    class=bodytitle><font color="#CC3300"><b>��ϵ��</b></font></TD>
				<TD width="5%"    class=bodytitle><font color="#CC3300"><b>�û�ID</b></font></TD>
				<TD width="10%"    class=bodytitle><font color="#CC3300"><b>��ϵ�绰</b></font></TD>
				<TD width="20%"    class=bodytitle><font color="#CC3300"><b>��ϵE-mail</b></font></TD>
				<TD width="26%"    class=bodytitle><font color="#CC3300"><b>��ϵ��ַ</b></font></TD>
				<TD width="10%"   class=bodytitle><font color="#CC3300"><b>�ҽ�ʱ��</b></font></TD>
				<TD width="10%"   class=bodytitle><font color="#CC3300"><b>����ѡ��</b></font></TD>
			  <TD width="5%"   align="center" class=bodytitle><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall><input type="button" name="btnSubmit" value="ɾ"  onClick="{if(confirm('��ȷ��Ҫɾ����\nɾ�������ٻָ���')){;this.form.Action.value='Del';this.form.action='uedit.asp?Action=Del';this.form.submit();return true;}return false;}"></td>
			</TR>					
<%
IF rs.Eof Then
	Response.Write "<TR height=25><td colspan='8' align='center'><br><br><div align='center'>����������Ϣ</div><br><br></td></tr>"
End IF
do while not rs.eof and rowcount > 0
	nId=rs("id")
	nuid=rs("uid")
	nm_name=rs("m_name")	
	nm_tel=rs("m_tel")
	nm_email=rs("m_email")
	nm_addr=rs("m_addr")
	nm_code=rs("m_code")
	nm_content=rs("m_content")
	nm_time=rs("m_time")
	nm_look=rs("m_look")
%>	
			<tr height="20">
			<td nowrap="nowrap" class="forumRow"><%=nId%> <%=IIf(nm_look="1"," <font color=blue>�Ѷҽ�</font>","")%></td>
			<td nowrap="nowrap" class="forumRow"><%=nm_name%></td>
			<td nowrap="nowrap" class="forumRow"><a href="?uid=<%=nuid%>"><%=nuid%></a></td>
			<td nowrap="nowrap" class="forumRow"><%=nm_tel%></td>
			<td nowrap="nowrap" class="forumRow"><%=nm_email%></td>
			<td nowrap="nowrap" class="forumRow"><%=nm_addr%></td>
			<td nowrap="nowrap" class="forumRow"><%=ForMatDate(nm_time,5)%></td>
			<td class="forumRow">
			<%IF nm_look="1" Then%>
			<a href='uedit.asp?id=<%=nId%>&Action=l_look&m_look=0'><img src="../images/down_0.gif" border="0" title="����Ϊδ�ҽ�"></a>
			<%Else%>
			<a href='uedit.asp?id=<%=nId%>&Action=l_look&m_look=1'><img src="../images/down_1.gif" border="0" title="����Ϊ�Ѷҽ�"></a>
			<%End IF%>
			<a href='uedit.asp?Id=<%=nId%>&Action=Del' onclick='{if (confirm("��ȷ��Ҫɾ����\nɾ�������ٻָ���")){return true;}return false;}'><img src="../images/cha.gif" border="0" title="ɾ�����û�"></a>			
			<span style="color:#0000FF; cursor:pointer" onClick='DvWnd.open("<%=nm_name%> ����ϸ����","ulook.asp?id=<%=nId%>",500,400)'>��ϸ</span>			</td>
			<TD  align="center" class=forumRow><input type=checkbox name=id value="<%=nId%>"></td>
			</tr>		
<%
	icolor=icolor+1
	if icolor>1 then icolor=0
	rowcount=rowcount-1
	rs.moveNext()
	Loop
	
%>						
			</TABLE>	
		</td>
	</tr>
	<tr align="center">
		<td class="forumrowHighLight" colspan="2"><%=listPages(s_page)%></td>
	</tr>	
</table>
</Form>


<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = form;")
		WriteLn("	with(oForm){")
		WriteLn("		m_look.value='" & Str4Js(zm_look) & "';")
		WriteLn("		m_name.value='" & Str4Js(zm_name) & "';")
		WriteLn("		desc.value='" & Str4Js(sDesc) & "';")
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
	End Function
</SCRIPT>	
<%
	ShowInfo sId

	rs.Close:Set rs = Nothing
	CloseConn()
%>
</body>
</html>