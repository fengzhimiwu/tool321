<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<%
ztypeid1=Bint(Request("typeid1"))
ztypeid2=Bint(Request("typeid2"))
IF ztypeid1=0 or ztypeid2=0 Then Response.Redirect  "type.asp":Response.End()
%>
<script language="javascript">
function confirmdel(id,typeid){
if (confirm("��ȷ��Ҫɾ���ζ���������?")) 
window.location.href="class_ok2.asp?action=del_class_2&id="+id+"&typeid="+typeid+""
} 
</script>


<%
set rstype=server.createobject("adodb.recordset") 
typesql="select * from qingtiandh_type3 where typeid1="&ztypeid1&" And typeid2="&ztypeid2&" order by typehide desc,typeno asc "
rstype.open typesql,conn,1,1 
%>
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width=98% class="tableBorder">
	<tr> 
	<th height="22" colspan="2">��������б����������б�</th>
	</tr>
<TR> 
<TD width="86%" height=25 class=bodytitle>&nbsp;�������<a href=type.asp>��������</a> > <a href=type_2.asp?typeid=<%=ztypeid1%>><%=Get_type1_name(ztypeid1)%></a> > <a href=type_3.asp?typeid1=<%=ztypeid1%>&typeid2=<%=ztypeid2%>><%=Get_type2_name(ztypeid2)%></a></td>
<TD width="14%" class=bodytitle><IMG src="../images_new/plus.gif" width="9" height="9">&nbsp;&nbsp;<a href="class_ok3.asp?typeid1=<%=ztypeid1%>&typeid2=<%=ztypeid2%>"><font color=red><b>�����������</b></font></a></td>
</tr>
<TR>
  <TD colspan="2" align=middle vAlign=top><TABLE width="100%" height="30" border="0" cellpadding="5" cellspacing="5"> 
<TR height=22>
<%
if rstype.eof then
response.Write"<br><br><div align='center'>���������<a href=class_ok3.asp?typeid1="&ztypeid1&"&typeid2="&ztypeid2&">���</a></div><br><br>"
else
j=1
do while not rstype.eof
ztypename=GetRp(rstype("typename"))
otypecolor3=GetRp(rstype("typecolor"))
IF otypecolor3<>"" then ztypename="<font color='"&otypecolor3&"'>"&ztypename&"</font>"
%> 
<td width="33%" align="left" height=24 class="Forumrow">
<%=rstype("typeid")%>
<IMG src="../images/indexpoint.gif" width="9" height="9"> 
 <%=ztypename%>��״̬��<%IF rstype("typehide")=1 Then response.Write "��ʾ" Else response.Write "<font color=red>����</font>"%>,��ţ�<%=rstype("typeno")%>�� ��<a href=class_ok3.asp?typeid1=<%=ztypeid1%>&typeid2=<%=ztypeid2%>&id=<%=rstype("typeid")%>><font color=#ff0000>�޸�</font></a>��<a href='class_ok3.asp?action=Del&id=<%=rstype("typeid")%>' onclick='{if (confirm("��ȷ��Ҫɾ������Ϣ��\nɾ�������ٻָ���")){return true;}return false;}'><font color=#ff0000>ɾ��</font></a>��
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
