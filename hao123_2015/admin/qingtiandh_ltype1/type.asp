<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<LINK href="../css/style.css" rel=stylesheet type=text/css>
<SCRIPT>
function st(value){var obj=eval(document.getElementById(value));obj.style.display=(obj.style.display=='none')?'':'none';}</SCRIPT>
<%
set rssort=server.createobject("adodb.recordset")
sql="select * from qingtiandh_ltype1 order by typehide desc,typeno asc"
rssort.open sql,conn,1,1
%>
<table width="95%" border="0" cellspacing="1" cellpadding="3"  align=center class="tableBorder">
	<tr> 
	<th width="14%" height="22">����������Ŀ¼</th>
	<th width="86%">��վ����б� <a href='class_ok.asp?action=add_class_1'><font color="#FFFFFF">[���]</font></a></th>
	</tr>
	<tr>
	  <td colspan="2" class="Forumrow"><TABLE border="0" width="100%" cellpadding="0">          
          <%
			if rssort.eof then
				response.Write"<br><br><div align='center'>���������<a href=class_ok.asp?action=add_class_1><font color=red>���</font></a></div><br><br>"
			else
				j=1
				do while not rssort.eof
					otypeid=rssort("typeid")
					oTypeUrl=rssort("typeurl")
					otypename=rssort("typename")
					otypeno=rssort("typeno")
					om_type2=rssort("m_type2")
					omobanurl="/template/"&G_moban&"/"&G_moban_html&"/"&oTypeUrl
					Response.Write "<TR>"
					Response.Write "<td width=""28%"" height=""25"">"
					Response.Write "<p style=""line-height: 150%"">"
					Response.Write "<IMG src=""../images/indexpoint.gif"" width=""9"" height=""9""> id: "&otypeid&"&nbsp;"
					Response.Write "<a href=""class_ok.asp?action=edit_class_1&id="&otypeid&""">"&otypename&"����ţ�"&otypeno&",״̬��"
					IF rssort("typehide")=1 Then response.Write "��ʾ" Else response.Write "<font color=red>����</font>"
					Response.Write "��</a>"
					Response.Write "��<a href=class_ok.asp?action=edit_class_1&id="&otypeid&"><font color=#ff0000>�޸�</font></a>��"
					Response.Write "<a href='class_ok.asp?action=del_class_1&id="&otypeid&"' onclick='{if (confirm(""��ȷ��Ҫɾ������Ϣ��\nɾ�������ٻָ���"")){return true;}return false;}'><font color=#ff0000>ɾ��</font></a>��"
					Response.Write "<font color=blue>����Ӧ�Ķ������ࣺ"&Get_qingtiandh_type_name_s(om_type2,"2")&"</font>"
					Response.Write "</td>"
					Response.Write "</tr>"
					rssort.movenext
					j=j+1
            	loop
             	rssort.close
            	set rssort=nothing
			end if
          %>
      </TABLE></td>
	</tr>
</table>
