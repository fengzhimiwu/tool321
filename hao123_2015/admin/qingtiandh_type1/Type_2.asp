<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<%
if not isEmpty(request("typeid")) then
typeid=request("typeid")
else
Response.Redirect "type.asp"
Response.End
end if
%>
<script language="javascript">
function confirmdel(id,typeid){
if (confirm("��ȷ��Ҫɾ���ζ���������?")) 
window.location.href="class_ok2.asp?action=del_class_2&id="+id+"&typeid="+typeid+""
} 
</script>


<%
Set rstype= Server.CreateObject("ADODB.Recordset") 
typesql="select * from qingtiandh_type1 where typeid="&typeid&"" 
rstype.open typesql,conn,1,1
typename1=rstype("typename")
If rstype.eof and rstype.bof then 
response.write"<SCRIPT language=JavaScript>alert('�Բ��𣬲�������!');"
response.write"this.location.href='javascript:history.back();'</SCRIPT>"
End if
rstype.close
set rstype=nothing
set rstype=server.createobject("adodb.recordset") 
typesql="select * from qingtiandh_type2 where typeid1="&typeid&" order by typeno asc,typeid asc" 
rstype.open typesql,conn,1,1 
%>
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width=98% class="tableBorder">
	<tr> 
	<th height="22" colspan="2">��������б���������б�</th>
	</tr>
<TR> 
<TD width="86%" height=25 class=bodytitle>&nbsp;�������<a href=type.asp>��������</a> > <a href=type_2.asp?typeid=<%=typeid%>><%=typename1%></a></td>
<TD width="14%" class=bodytitle><IMG src="../images_new/plus.gif" width="9" height="9">&nbsp;&nbsp;<a href="class_ok2.asp?action=add_class_2&typeid=<%=typeid%>"><font color=red><b>��Ӷ�������</b></font></a></td>
</tr>
<TR>
  <TD colspan="2" align=middle vAlign=top><TABLE width="100%" height="30" border="0" cellpadding="5" cellspacing="5"> 
<TR height=22>
<%
if rstype.eof then
response.Write"<br><br><div align='center'>���������<a href=class_ok2.asp?action=add_class_2&typeid="&typeid&">���</a></div><br><br>"
else
j=1
do while not rstype.eof
ztypename=GetRp(rstype("typename"))
ztypename2=GetRp(rstype("typename2"))
otypecolor2=GetRp(rstype("typecolor"))
ztypecontent_19=GetRp(rstype("typecontent_19"))
ztypecontent_19_top=GetRp(rstype("typecontent_19_top"))
otypeno=GetRp(rstype("typeno"))
IF otypecolor2<>"" then ztypename="<font color='"&otypecolor2&"'>"&ztypename&"</font>"
%> 
<td width="33%" align="left" height=24 class="Forumrow">
����ţ�<%=otypeno%>��
<%=rstype("typeid")%>
<IMG src="../images/indexpoint.gif" width="9" height="9"> 
 <a href="type_3.asp?typeid1=<%=typeid%>&typeid2=<%=rstype("typeid")%>"><%=ztypename%></a>��״̬��<%IF rstype("typehide")=1 Then response.Write "��ʾ" Else response.Write "<font color=red>����</font>"%>�� ��<a href=class_ok2.asp?action=edit_class_2&id=<%=rstype("typeid")%>><font color=#ff0000>�޸�</font></a>��<a href='class_ok2.asp?action=del_class_2&id=<%=rstype("typeid")%>&typeid1=<%=rstype("typeid1")%>' onclick='{if (confirm("��ȷ��Ҫɾ������Ϣ��\nɾ�������ٻָ���")){return true;}return false;}'><font color=#ff0000>ɾ��</font></a>��<%IF ztypename2<>"" Then Response.Write "������"&ztypename2%>
<%
IF ztypecontent_19_top<>"" Then
	Response.Write " ����(��)"
End IF
IF ztypecontent_19<>"" Then
	Response.Write " ����(��)"
End IF

%>
</td>
<%if j mod 1 = 0 then %></tr><tr ><%end if%>
<% rstype.movenext 
j=j+1 
loop 
rstype.close
set rstype=nothing 
end if
%> 
</tr>
</TABLE></TD>
</TR>
</TABLE>
