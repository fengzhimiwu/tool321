<LINK href="css/style.css" rel=stylesheet type=text/css>
<%
dim p_ErrorUrl,p_ErrCodes,p_c,p
p_ErrorUrl = Replace(Request.QueryString("ErrorUrl"),"''","")
p_ErrorUrl=replace(p_ErrorUrl,"***","&")
p_ErrCodes = Request.QueryString("ErrCodes")
p_c=request.QueryString("c")
p=request.QueryString("p")
rk=request.QueryString("rk")
if trim(p_ErrorUrl) = "" then
	p_ErrorUrl = "javascript:history.back();"
Else
	p_ErrorUrl = p_ErrorUrl
End if
if trim(p_c) = "" then
	p_c = "�����̨����"
Else
	p_c = "������һҳ"
End if
%>
<%IF p<>"js" Then%>
	<table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>
	<TR>
	<TH class=tableHeaderText colSpan=2 height=25>��Ϣ��ʾ</TH>
	<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br>
	      <%=p_ErrCodes%></div></td></tr>
	<tr align=center><td height=30 class=forumRowHighlight><a href='<%=p_ErrorUrl%>'><%=p_c%></a></td>
	</tr>
	</table>
<%Else%>
	<table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>
	<TR>
	<TH class=tableHeaderText colSpan=2 height=25>��Ϣ��ʾ</TH>
	<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br>
	      <%=p_ErrCodes%></div></td></tr>
	<tr align=center><td height=30 class=forumRowHighlight><a href='<%=p_ErrorUrl%>'>�������</a></td>
	</tr>
	<tr align=center><td height=30 class=forumRowHighlight><a href='js_index.asp'>������Ϣ�б�</a></td>
	</tr>
	</table>
<%End IF%>
<%
IF rk<>"" Then
	response.Write "<meta http-equiv=""Refresh"" content=""1;URL="&p_ErrorUrl&""">"

End IF
%>