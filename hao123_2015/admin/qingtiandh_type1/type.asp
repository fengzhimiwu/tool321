<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<LINK href="../css/style.css" rel=stylesheet type=text/css>
<SCRIPT>
function st(value){var obj=eval(document.getElementById(value));obj.style.display=(obj.style.display=='none')?'':'none';}</SCRIPT>
<%
set rssort=server.createobject("adodb.recordset")
sql="select * from qingtiandh_type1 order by typehide desc,typeno asc"
rssort.open sql,conn,1,1
%>
<table width="95%" border="0" cellspacing="1" cellpadding="3"  align=center class="tableBorder">
	<tr> 
	<th width="14%" height="22">����������Ŀ¼</th>
	<th width="86%">��������б� <a href='class_ok.asp?action=add_class_1'><font color="#FFFFFF">[���]</font></a></th>
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
					otypecolor=GetRp(rssort("typecolor"))
					omobanurl="/template/"&G_moban&"/"&G_moban_html&"/"&oTypeUrl
					IF otypecolor<>"" then otypename="<font color='"&otypecolor&"'>"&otypename&"</font>"
					Response.Write "<TR>"
					Response.Write "<td width=""28%"" height=""25"">"
					Response.Write "<p style=""line-height: 150%"">"
					Response.Write "<IMG src=""../images/indexpoint.gif"" width=""9"" height=""9""> id: "&otypeid&"&nbsp;"
					Response.Write "<a href=""type_2.asp?typeid="&otypeid&""">"&otypename&"����ţ�"&otypeno&",״̬��"
					IF rssort("typehide")=1 Then response.Write "��ʾ" Else response.Write "<font color=red>����</font>"
					Response.Write "��</a>"
					Response.Write "��<a href=class_ok.asp?action=edit_class_1&id="&otypeid&"><font color=#ff0000>�޸�</font></a>��"
					Response.Write "<a href='class_ok.asp?action=del_class_1&id="&otypeid&"' onclick='{if (confirm(""��ȷ��Ҫɾ������Ϣ��\nɾ�������ٻָ���"")){return true;}return false;}'><font color=#ff0000>ɾ��</font></a>��"
					Response.Write "<a href='class_ok2.asp?action=add_class_2&typeid="&otypeid&"'><font color=#ff0000>��Ӷ��������</font></a>��"
					IF oTypeUrl<>"" And Not Isnull(oTypeUrl) Then
						Response.Write "ģ��·����<a href='../moban/index.asp?t1="&omobanurl&"&t3="&otypename&"' target=_blank>"&oTypeUrl&"</a>"					
					End IF
					Set rs2=conn.execute("Select * From qingtiandh_type2 Where typeid1="&otypeid&" order by typehide desc,typeno asc")
					IF Not rs2.Eof Then
						Response.Write "<span style=""color:#0000FF; cursor:pointer"" onclick=""st('a_"&otypeid&"')"">չ������Ŀ¼</span>"
						Response.Write "<TABLE width=""100%"" border=""0"" cellpadding=""2"" cellspacing=""2"" style=""display:none"" id=""a_"&otypeid&""">"
						Do While Not rs2.Eof
							otypeid2=rs2("typeid")
							otypename2=rs2("typename")
							otypehide2=rs2("typehide")
							pTypeNo2=rs2("typeno")
							otypecolor2=GetRp(rs2("typecolor"))
							IF otypecolor2<>"" then otypename2="<font color='"&otypecolor2&"'>"&otypename2&"</font>"
							Response.Write "<TR>"
							Response.Write "<td width=""28%"" height=""20"">"
							Response.Write "&nbsp;&nbsp;&nbsp;-"
							Response.Write "<IMG src=""../images/indexpoint.gif"" width=""9"" height=""9""> id:"&otypeid2&"&nbsp;"
							Response.Write "<a href=""type_3.asp?typeid1="&otypeid&"&typeid2="&otypeid2&""">"&otypename2&"����ţ�"&pTypeNo2&",״̬��"
							IF otypehide2=1 Then response.Write "��ʾ" Else response.Write "<font color=red>����</font>"
							Response.Write "��</a>"
							Response.Write "��<a href=class_ok2.asp?action=edit_class_2&id="&otypeid2&"><font color=#ff0000>�޸�</font></a>��"
							Response.Write "<a href='class_ok2.asp?action=del_class_2&id="&otypeid2&"' onclick='{if (confirm(""��ȷ��Ҫɾ������Ϣ��\nɾ�������ٻָ���"")){return true;}return false;}'><font color=#ff0000>ɾ��</font></a>��"
							Response.Write "<a href='class_ok3.asp?typeid1="&otypeid&"&typeid2="&otypeid2&"'><font color=#ff0000>������������</font></a>��"
							
							Set rs3=conn.execute("Select * From qingtiandh_type3 Where typeid2="&otypeid2&" order by typehide desc,typeno asc")
							IF Not rs3.Eof Then
								Response.Write "<span style=""color:#0000FF; cursor:pointer"" onclick=""st('a_"&otypeid&"_"&otypeid2&"')"">չ������Ŀ¼</span>"
								Response.Write "<TABLE width=""100%"" border=""0"" cellpadding=""2"" cellspacing=""2"" style=""display:none"" id=""a_"&otypeid&"_"&otypeid2&""">"
								Do While Not rs3.Eof
									otypeid3=rs3("typeid")
									otypename3=rs3("typename")
									otypehide3=rs3("typehide")
									pTypeNo3=rs3("typeno")
									otypecolor3=GetRp(rs3("typecolor"))
									IF otypecolor3<>"" then otypename3="<font color='"&otypecolor3&"'>"&otypename3&"</font>"									
									Response.Write "<TR>"
									Response.Write "<td width=""28%"" height=""20"">"
									Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-"
									Response.Write "<IMG src=""../images/indexpoint.gif"" width=""9"" height=""9""> id:"&otypeid3&"&nbsp;"&otypename3&"����ţ�"&pTypeNo3&",״̬����"
									IF otypehide3=1 Then response.Write "��ʾ" Else response.Write "<font color=red>����</font>"
									Response.Write "��<a href=class_ok3.asp?id="&otypeid3&"&typeid1="&otypeid&"&typeid2="&otypeid2&"><font color=#ff0000>�޸�</font></a>��"
									Response.Write "<a href='class_ok3.asp?action=Del&id="&otypeid3&"' onclick='{if (confirm(""��ȷ��Ҫɾ������Ϣ��\nɾ�������ٻָ���"")){return true;}return false;}'><font color=#ff0000>ɾ��</font></a>��"
									Response.Write "</td>"
									Response.Write "</tr>"
									rs3.MoveNext
								Loop
								Response.Write "</table>"
							End IF														
							Response.Write "</td>"
							Response.Write "</tr>"
							rs2.MoveNext
						Loop
						Response.Write "</table>"
					End IF
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
