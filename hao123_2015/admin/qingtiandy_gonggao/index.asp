<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title>ȫ���������</title>
<script src="../js/mouse_on_title.js"></script>
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
m_name=Replace_Text(Trim(request("m_name")))
m_type1=Replace_Text(Trim(request("m_type1")))
desc1=Replace_Text(Trim(request("desc1")))
m_look=Replace_Text(Trim(request("m_look")))

sql="select * from qingtiandy_gonggao where id>0"
IF m_name<>"" Then sql=sql&" and n_title like '%"&m_name&"%'"
IF m_type1<>"" Then sql=sql&" and n_type1 ="&m_type1&""
IF m_look<>"" Then sql=sql&" and n_look="&m_look

IF desc1<>"" Then
	sql=sql&" order by "&desc1
Else
	sql=sql&" order by  n_date desc,id desc"
End IF
IF other="" Then
	sql=sql
Else

End IF
Set rs=server.CreateObject(G_RS)
rs.open sql,conn,1,1 
IF request.Cookies("page_n")="" then
	msg_per_page=15
else
	msg_per_page=Cint(request.Cookies("page_n"))
end if
'msg_per_page=20 '����ÿҳ��ʾ��¼����
%>
<!--#include file="../inc/headpage.asp"-->
<table width="98%" border="0" cellspacing="0" cellpadding="0"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>ȫ���������</th>
	</tr>

	<FORM name=form action="?" method=post>
	<tr>
		<td width="19%" height=25 class="forumRowHighlight">
		<B>�������ѡ��</B></td>
		<td width="81%" class=forumRowHighlight>�ؼ��֣�<input name="m_name" type="text" value="<%=m_name%>">
		<select name="desc1">
			<option value="">ѡ������ʽ</option>
			<option value="id asc">ID����</option>
			<option value="id desc">ID�ݼ�</option>
			<option value="n_hits asc">�������</option>
			<option value="n_hits desc">����ݼ�</option>
			<option value="n_numb asc">Ȩ�ص���</option>
			<option value="n_numb desc">Ȩ�صݼ�</option>			
		</select>
		<input type="submit" value="���̲���" id=submit name=submit>&nbsp;&nbsp;&nbsp;&nbsp;[<a href="javascript:location.reload()">ˢ��ҳ��</a>]		</td>
	</tr>		
	</form>
</table>
<Form name="search" method="POST" action="admin_check.asp">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th height=25 class="tableHeaderText"><a href=?><font color="#FFFFFF">ȫ�������б�</font></a></th>	
        <th height=25 class="tableHeaderText">
	<select name="pp_page" onChange="setCookie('page_n',this.options[this.selectedIndex].value,30);location.href='index.asp'">
	<option value="">ÿҳ��ʾ����</option>
	<option value="10">10</option>
	<option value="15">15</option>
	<option value="20">20</option>
	<option value="30">30</option>
	<option value="50">50</option>
	<option value="100">100</option>
	<option value="200">200</option>
	<option value="300">300</option>
	<option value="500">500</option>
	</select>		</th>
	</tr> 
				
	<tr>
		<td colspan="2"> 
  			<TABLE width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#111111" bordercolorlight="#D7EBFF" bordercolordark="#D7EBFF" style="border-collapse: collapse">
    			<TBODY>
				<%
				if rs.eof then
					response.Write"<br><br><div align='center'>����������Ϣ</div><br><br>"
				else
				%>
					<TR height=25> 
					  <TD width="46" height="20" class=bodytitle><font color="#CC3300"><b>ID </b></font></TD>
						<TD class=bodytitle><font color="#CC3300"><b>�������</b></font></TD>
					  <TD width="137" class=bodytitle><font color="#CC3300"><b>����ʱ��</b></font></TD>
						<TD width="154" align=center class=bodytitle><font color="#CC3300"><b>����ѡ��</b></font></TD>
					    <TD width="55" align=center class=bodytitle><font color="#CC3300"><b>���</b></font></TD>
				      <TD width="64" align="center" class=bodytitle><input type='submit' value='ɾ��' onClick="{if(confirm('��ȷ��ִ�еĲ�����?')){;this.form.action='func.asp?tag=News_del';this.form.submit();return true;}return false;}"></TD>
					</TR>
					<%do while not rs.eof and rowcount > 0%>
					<TR height="20"> 
					  <TD  class=forumRow nowrap="nowrap">
					  <%=rs("id")%>					   </td>
						<TD  class=forumRow><a href=<%="../../members/gg_detail.asp?id="&rs("id")%> target="_blank"><%="<font color='"&rs("n_color")&"'>"&rs("n_title")&"</font>"%></a></td>
					  <TD  class=forumRow><%IF ForMatDate(rs("n_date"),5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(rs("n_date"),55)&"</font>" Else response.Write ForMatDate(rs("n_date"),55) %></td>
						<TD align=center class=forumRow>
						<a href=edit.asp?id=<%=rs("id")%>><img src="../images/admin_top_icon_5.gif" border="0" title="�޸Ĵ˹���"></a>
						<%
						IF rs("n_look")=0 Then
							response.Write "<a href='func.asp?tag=News_show&selAnnounce="&rs("id")&"'><img src='../images/down_1.gif' border='0' title='��ʾ����Ϣ'></a>"
						Else
							response.Write "<a href='func.asp?tag=New_hide&selAnnounce="&rs("id")&"'><img src='../images/down_0.gif' border='0' title='���ش���Ϣ'></a>"
						End IF
						
						%>
						<a href='func.asp?tag=News_del&selAnnounce=<%=rs("id")%>'><img src="../images/cha.gif" border="0" title="ɾ���˹���"></a>
						<a href='func.asp?tag=News_datet&selAnnounce=<%=rs("id")%>'><img src="../images/down_2.gif" border="0" title="���·���ʱ��"></a>	
						</td>
						<TD align=center class=forumRow><%=rs("n_hits")%></td>
					  <TD  align="center" class=forumRow><input type=checkbox name=selAnnounce value="<%=cstr(rs("ID"))%>" id='c_<%=rs("id")%>'></td>
					</TR>
					<%
					icolor=icolor+1
					if icolor>1 then icolor=0
					rowcount=rowcount-1
					rs.movenext
					loop
					end if
					%>
			</TABLE>		</td>
	</tr>
	<tr>
	<td width="91%" class=forumRow >
	<input type='submit' value='ɾ��' onClick="{if(confirm('��ȷ��ִ�еĲ�����?')){;this.form.action='func.asp?tag=News_del';this.form.submit();return true;}return false;}">&nbsp;
	<input type='submit' value='��ʾ' onClick="{if(confirm('��ȷ��ִ�еĲ�����?')){;this.form.action='func.asp?tag=News_show';this.form.submit();return true;}return false;}">&nbsp;
	<input type='submit' value='����' onClick="{if(confirm('��ȷ��ִ�еĲ�����?')){;this.form.action='func.asp?tag=New_hide';this.form.submit();return true;}return false;}">&nbsp;
	<input type='submit' value='���·���ʱ��' onClick="{if(confirm('��ȷ��ִ�еĲ�����?')){;this.form.action='func.asp?tag=News_datet';this.form.submit();return true;}return false;}">&nbsp;
	</td>
	<td width="9%" class=forumRow align="center" ><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall>ȫѡ</td>
	</tr>
	<tr>
	<td class=forumRow colspan="2">&nbsp;</td>
	</tr>
	<tr>
	<td colspan="2" align="center" class=forumrowHighLight><b><%=listPages("?m_name="&m_name&"&m_type1="&m_type1&"&desc1="&server.URLEncode(desc1)&"&m_look="&m_look)%></b></td></tr>
</table>
</form>
</body>
</html>