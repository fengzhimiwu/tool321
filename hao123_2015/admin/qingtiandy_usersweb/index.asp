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
<title>ȫ����վ����</title>
<script src="../js/mouse_on_title.js"></script>
<script src="../js/p_js.js"></script>
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
function st(value){var obj=eval(document.getElementById(value));obj.style.display=(obj.style.display=='none')?'':'none';}
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
	kSql_order=""
	sob=Trim(Request("ob"))
	spl=Trim(Request("pl"))
	if spl="" then spl="dateandtime"
	if sob<>"asc" then sob="desc"
	kSql_order=kSql_order&spl&" "&sob
		
	zw_status=Request("w_status")
	zw_status=StayNub(zw_status)
	IF zw_status<>"" Then kSql_where=kSql_where&" And w_status="&zw_status
	
	zw_look=Request("w_look")
	zw_look=StayNub(zw_look)
	IF zw_look<>"" Then kSql_where=kSql_where&" And w_look="&zw_look	
	
	zm_name=Replace_Text_2008(Request("m_name"))
	IF zm_name<>"" Then kSql_where=kSql_where&" And (w_name like '%"&zm_name&"%' or w_url like '%"&zm_name&"%')"

	sql="Select * from qingtiandy_url Where "&kSql_where&" Order by "&kSql_order
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1 
	s_page="?ob="&sob&"&pl="&server.URLEncode(spl)&"&m_name="&server.URLEncode(zm_name)&"&w_status="&zw_status&"&w_look="&zw_look
%>
<!--#include file="../inc/headpage.asp"-->
<table width="98%" border="0" cellspacing="1" cellpadding="1"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>�û�ͳ�ƹ���</th>
	</tr>
	<FORM name=form action="index.asp" method=get>
	<tr>
		<td width="12%" height=25 class="forumRowHighlight">
		<B>�������ѡ��</B></td>
		<td width="88%" class=forumRowHighlight>
		<DIV id="showTemplet">
			<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="templet">
				<tr>
					<td>
						<Select name="w_status">
							<Option value="">վ����֤</Option>
							<Option value="1">����֤</Option>
							<Option value="0">δ��֤</Option>
						</Select>
						<Select name="w_look">
							<Option value="">��վ���</Option>
							<Option value="1">�����</Option>
							<Option value="0">δ���</Option>
						</Select>						
						<select name="pl" size="1">
						<option value="inc" <%if pl="inc" then%> selected<%end if%>>�ܼƵ���
						</option>
						<option value="inj-outj" <%if pl="inj-outj" then%> selected<%end if%>>����˳��
						</option>
						<option value="inc-outc" <%if pl="inc-outc" then%> selected<%end if%>>����˳��
						</option>
						<option value="inj" <%if pl="inj" then%> selected<%end if%>>�������
						</option>
						<option value="inp" <%if pl="inp" then%> selected<%end if%>>ƽ������
						</option>
						<option value="outc" <%if pl="outc" then%> selected<%end if%>>�ܼƵ��
						</option>
						<option value="outj" <%if pl="outj" then%> selected<%end if%>>������
						</option>
						<option value="outp" <%if pl="outp" then%> selected<%end if%>>ƽ�����
						</option>
						<option value="indate" <%if pl="indate" then%> selected<%end if%>>����ʱ��
						</option>
						<option value="outdate" <%if pl="outdate" then%> selected<%end if%>>
						���ʱ��</option>
						<option value="fromdate" <%if pl="fromdate" then%> selected<%end if%>>
						ͳ��ʱ��</option>
						<option value="dateandtime" <%if pl="dateandtime" then%> selected<%end if%>>
						����ʱ��</option>
						<option value="w_no" <%if pl="vipx" then%> selected<%end if%>>
						�Ƽ�����</option>			
						</select>						
						<select name="ob" size="1" class='inbox0'>
						<option value="asc" <%if ob="asc" then response.write " selected"%>>
						˳��</option>
						<option value="desc" <%if ob="desc" then response.write " selected"%>>
						����</option>
						</select> <select name="isverify" size="1" class='inbox0'>
						<option value="" <%if isverify="" then response.write " selected"%>>
						ȫ��</option>
						<option value="0" <%if isverify="0" then response.write " selected"%>>
						δ���</option>
						<option value="1" <%if isverify="1" then response.write " selected"%>>
						�����</option>
						</select>
						�ؼ��ʣ�
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
	  [<a href="javascript:location.reload()">ˢ��ҳ��</a>]</td>
	</tr>	
	</form>
</table>
<Form name="search" method="post" action="index.asp">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th width="88%" height=25 class="tableHeaderText"><a href='?'><font color="#FFFFFF">�û�ͳ�ƹ���</font></a></th>	
        <th width="12%" height=25 class="tableHeaderText" align="right">
	<select name="pp_page" onChange="setCookie('page_n',this.options[this.selectedIndex].value,30);location.href='index.asp'">
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
				<TD width="5%"   class=bodytitle><font color="#CC3300"><b>ID </b></font></TD>
				<TD width="24%"    class=bodytitle><font color="#CC3300"><b>��վ��</b></font></TD>
				<TD width="14%"   class=bodytitle><font color="#CC3300"><b>��վ�Ǽ�ʱ��</b></font></TD>
				<TD width="13%"   class=bodytitle><font color="#CC3300"><b>��ʼͳ��ʱ��</b></font></TD>
				<TD width="14%"   class=bodytitle><font color="#CC3300"><b>������ʱ��</b></font></TD>
				<TD width="15%"   class=bodytitle><font color="#CC3300"><b>�����ʱ��</b></font></TD>
				<TD width="8%"   class=bodytitle><font color="#CC3300"><b>����ѡ��</b></font></TD>
			  <TD width="7%"   align="center" class=bodytitle><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall><input type="button" name="btnSubmit" value="ɾ"  onClick="{if(confirm('��ȷ��Ҫɾ����\nɾ�������ٻָ���')){;this.form.Action.value='Del';this.form.action='edit.asp?Action=Del';this.form.submit();return true;}return false;}"></td>
			</TR>					
<%
do while not rs.eof and rowcount > 0
	oId=rs("id")
	ow_url=rs("w_url")
	ow_domain=rs("w_domain")
	ow_name=rs("w_name")
	odateandtime=rs("dateandtime")
	oindate=rs("indate")
	ooutdate=rs("outdate")
	ofromdate=rs("fromdate")
	ow_look=rs("w_look")
	ow_status=rs("w_status")
	oinc=rs("inc")
	oinj=rs("inj")
	ooutj=rs("outj")
	ooutc=rs("outc")
	ow_uid=rs("w_uid")
%>	
			<tr height="20">
			<td nowrap="nowrap" class="forumRow"><%=oId%></td>
			<td nowrap="nowrap" class="forumRow">
			<%
			Response.Write "<a href='../../p_inc/turnto.asp?u="&GetUrl_httpAll(ow_url)&"' target='_blank'>"
			Response.Write Replace(left(ow_url,20),zm_name,"<font color=red>"&zm_name&"</font>")
			Response.Write "</a>"
			Response.Write "(�룺"&oinj&" ����"&ooutj&")"
			%>
			<span onClick="st('t_<%=oId%>')" style="color:#0000FF; cursor:pointer">��ϸ</span>
			</td>
			<td nowrap="nowrap" class="forumRow"><%IF ForMatDate(odateandtime,5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(odateandtime,77)&"</font>" Else response.Write ForMatDate(odateandtime,77) %></td>
			<td nowrap="nowrap" class="forumRow"><%IF ForMatDate(ofromdate,5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(ofromdate,77)&"</font>" Else response.Write ForMatDate(ofromdate,77) %></td>
			<td nowrap="nowrap" class="forumRow"><%IF ForMatDate(oindate,5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(oindate,77)&"</font>" Else response.Write ForMatDate(oindate,77) %></td>
			<td nowrap="nowrap" class="forumRow"><%IF ForMatDate(ooutdate,5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(ooutdate,77)&"</font>" Else response.Write ForMatDate(ooutdate,77) %></td>
			<td class="forumRow">
			<%IF ow_status="1" Then%>
			<a href='edit.asp?id=<%=oId%>&Action=w_status&w_status=0'><img src="../images/down_0.gif" border="0" title="ȡ��վ����֤"></a>
			<%Else%>
			<a href='edit.asp?id=<%=oId%>&Action=w_status&w_status=1'><img src="../images/down_1.gif" border="0" title="ͨ��վ����֤"></a>
			<%End IF%>
			<%IF ow_look="1" Then%>
			<a href='edit.asp?id=<%=oId%>&Action=w_look&w_look=0'><img src="../images/down_0.gif" border="0" title="ȡ�����"></a>
			<%Else%>
			<a href='edit.asp?id=<%=oId%>&Action=w_look&w_look=1'><img src="../images/down_1.gif" border="0" title="ͨ�����"></a>
			<%End IF%>			
			<a href='edit.asp?id=<%=oId%>'><img src="../images/admin_top_icon_5.gif" border="0" title="�༭"></a>
			<a href='edit.asp?Id=<%=oId%>&Action=Del' onclick='{if (confirm("��ȷ��Ҫɾ����\nɾ�������ٻָ���")){return true;}return false;}'><img src="../images/cha.gif" border="0" title="ɾ������վ"></a>			</td>
			<TD  align="center" class=forumRow><input type=checkbox name=id value="<%=oId%>"></td>
			</tr>	
			<tr height="20" id="t_<%=oId%>" style="display:none">
				<td colspan="8" nowrap="nowrap" class="forumRow">
						  ����/���µ��룺<font color="#FF0000"><%=oinj%>/<%=oinc%></font> 
						  ����/���µ����<font color="#FF0000"><%=ooutj%>/<%=ooutc%></font> 
							<a href="edit.asp?id=<%=oId%>">�޸�����</a>
							<a href="edit.asp?Id=<%=oId%>&Action=Del" onClick="return confirm('ȷ��Ҫɾ����')">
							ɾ������</a>
							<a href="edit.asp?Id=<%=oId%>&Action=init" onClick="return confirm('��ʼ���󣬴���վ���ݽ����㣬��ȷ��Ҫ��ʼ����')">
							��ʼ����</a>
							<a href="../qingtiandy_usersjilu/index.asp?domain=<%=ow_domain%>&inout=0">
							�����¼</a>
							<a href="../qingtiandy_usersjilu/index.asp?domain=<%=ow_domain%>&inout=1">
							�����¼</a>				
				</td>
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
		WriteLn("		ob.value='" & Str4Js(sob) & "';")
		WriteLn("		pl.value='" & Str4Js(spl) & "';")
		WriteLn("		w_status.value='" & Str4Js(zw_status) & "';")
		WriteLn("		w_look.value='" & Str4Js(zw_look) & "';")
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