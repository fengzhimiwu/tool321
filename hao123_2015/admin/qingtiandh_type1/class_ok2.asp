<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<LINK href="../css/style.css" rel=stylesheet type=text/css>
<script>
//��ɫѡ��
function SelectColorcmdt(what,backit){
   var dEL = document.all(what);
   var sEL = document.all(backit);
   var url = "../js/color/selcolor.htm?color="+encodeURIComponent(dEL.value);
   var arr = showModalDialog(url,window,"dialogWidth:280px;dialogHeight:250px;help:no;scroll:no;status:no");
   if (arr) {
    dEL.value=arr;
    sEL.style.backgroundColor=arr;
    dEL.style.backgroundColor=arr;
   }
}
</script>
<%
typeid=Bint(request("typeid"))
typeid1=Bint(Request("typeid1"))
call main()
'rs1.close
set rs1=nothing
set rs=nothing
conn.close
set conn=nothing
sub main()
%>
 <%
           if request("action") ="add_class_2" then 
              call add_class_2()
           elseif request("action")="add_class_2_ok" then
              call add_class_2_ok()
           elseif request("action")="edit_class_2" then
              call edit_class_2()
           elseif request("action")="savedit_2" then
              call savedit_2()
           elseif request("action")="del_class_2" then
              call del_class_2()
		  
           else
              call linkinfo()
           end if
           %> 


<%
end sub
sub add_class_2()
%> 
<SCRIPT language=javascript>
function FORM1_onsubmit()
{
 if(document.FORM1.class_name.value.length<1)
 {
   alert("�����������������!");
   document.FORM1.class_name.focus();
   return false;
 }
}
</SCRIPT> 
<FORM name=FORM1 onSubmit="return FORM1_onsubmit()" action=class_ok2.asp?action=add_class_2_ok&typeid=<%=typeid%> method=post> 
  <TABLE width=100% border="0" align="center" cellPadding=3 cellSpacing=1 class="tableBorder"> 
    <TR> 
      <Th colSpan=2 height="28" class="tableHeaderText">��Ӷ������</Th> 
    </TR> 
    <TR> 
      <TD width=28% height=25 class="forumRowHighlight" align=right><b>Ҫ��ӵĶ������</b><font color="#FF0000">*</font></TD> 
      <TD width=72% height=25 class="forumRowHighlight">
	  <INPUT maxLength=16 size=25 name=class_name>
	  <input name="typecolor" type=text id="A1"  size=8  >
	  <img border=0 src="../js/color/rect.gif" width=18 style="cursor:hand" id=As_1 onClick="SelectColorcmdt('A1','As_1')">		  
	  </TD> 
    </TR> 
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>Ҫ��ӵ���������</b></TD> 
      <TD height=25 class="forumRowHighlight"><INPUT maxLength=16 size=25 name=class_name2> 
      ǰ̨��ʾ�������� </TD> 
    </TR>
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>��������ڵ�ģ��·����</b></TD> 
      <TD  height=25 class="forumRowHighlight"><INPUT maxLength=200 size=25 name=class_url>  ���ģ����� /template/<%=G_moban%>/<%=G_moban_html%>/��
</TD> 
    </TR>	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>��𳬼����ӵ�ַ���֣�</b></TD> 
      <TD height=25 class="forumRowHighlight"><INPUT maxLength=200 size=25 name=typehttpurl>  ���磺game��movie�ȣ��������Զ�ƴ������
</TD> 
    </TR>
    <tr> 
      <td width="23%" class="forumRowHighlight" align=right><b>������ⲿhttp��ַ��</b></td> 
      <td width="77%" class="forumRowHighlight"> <input type="text" name="typehttpurl2" size='40' value=""> ���ȼ������ ���磺http://www.qingtiandy.cn</td> 
    </tr>	
	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>Ҫ��ӵ������⣺</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typeTitle" cols="35" rows="5"></textarea></TD> 
    </TR> 			
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>Ҫ��ӵ����ؼ��ʣ�</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent" cols="35" rows="5"></textarea></TD> 
    </TR> 	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>Ҫ��ӵ����������</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typedes" cols="35" rows="5"></textarea></TD> 
    </TR> 	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>19��ģ��ר�ô���(��)��</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent_19_top" cols="35" rows="5"></textarea></TD> 
    </TR>		
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>19��ģ��ר�ô���(��)��</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent_19" cols="35" rows="5"></textarea></TD> 
    </TR>	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>����ţ�</b></TD> 
      <TD height=25 class="forumRowHighlight"><input name="typeno" size="25" value="100"/>��ֻ�������֣�����ԽС����ʾԽǰ�棩</TD> 
    </TR> 	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>�Ƿ���ʾ��</b></TD> 
      <TD height=25 class="forumRowHighlight">
	  <select name="typehide">
	  <option value="0">����</option>
	  <option value="1" selected="selected">��ʾ</option>
	  </select>
	  </TD> 
    </TR> 	
    <TR> 
      <TD colSpan=2 height="27" align=center class="forumRowHighlight"> <INPUT type=submit value='ȷ �� �� ��' name=Submit2> </TD> 
    </TR> 
  </TABLE> 
</FORM> 
<%
end sub
sub edit_class_2()
    set rs=server.createobject("adodb.recordset")
    sqltext="select * from qingtiandh_type2 where typeid="+Cstr(request("id"))
    rs.open sqltext,conn,1,1
%> 
<form name=form1 action="class_ok2.asp?action=savedit_2" method=post> 
  <input type=hidden name=id value="<%=Cstr(request("id"))%>"> 
  <input type="hidden" name="ref" value="<%=Request.ServerVariables("HTTP_REFERER")%>" />
  <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableBorder"> 
    <TR> 
      <Th colSpan=2 height="28" class="tableHeaderText">�޸�ӰƬ������Ϣ���</Th> 
    </TR> 
    <tr> 
      <td width="29%" class="forumRowHighlight" align=right><b>Ҫ�޸ĵĶ���������</b><font color="#FF0000">*</font></td> 
      <td width="71%" class="forumRowHighlight"> 
	  <input type="text" name="class_2_name" size='40' value="<%=server.HTMLEncode(rs("typename"))%>"> 
	  <input name="typecolor" type=text id="A1"  size=8  value="<%=rs("typecolor")%>">
	  <img border=0 src="../js/color/rect.gif" width=18 style="cursor:hand; background-color:<%=rs("typecolor")%>" id=As_1 onClick="SelectColorcmdt('A1','As_1')">	  
	  </td> 
    </tr> 
    <tr> 
      <td class="forumRowHighlight" align=right><b>Ҫ�޸ĵ���������</b></td> 
      <td class="forumRowHighlight"> <input type="text" name="class_1_name2" size='40' value="<%=server.HTMLEncode(rs("typename2"))%>"> </td> 
    </tr> 
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>��������ڵ�ģ��·����</b></TD> 
      <TD height=25 class="forumRowHighlight"><INPUT maxLength=200 size=40 name=class_url value="<%=rs("typeurl")%>">  ���ģ����� /template/<%=G_moban%>/<%=G_moban_html%>/��
</TD> 
    </TR>	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>��𳬼����ӵ�ַ���֣�</b></TD> 
      <TD height=25 class="forumRowHighlight"><INPUT maxLength=200 size=25 name=typehttpurl value="<%=rs("typehttpurl")%>">  ���磺game��movie�ȣ��������Զ�ƴ������
</TD> 
    </TR>	
    <tr> 
      <td class="forumRowHighlight" align=right><b>������ⲿhttp��ַ��</b></td> 
      <td class="forumRowHighlight"> <input type="text" name="typehttpurl2" size='40' value="<%=rs("typehttpurl2")%>"> ���ȼ������ ���磺http://www.qingtiandy.cn</td> 
    </tr>		
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>Ҫ��ӵ������⣺</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typeTitle" cols="35" rows="5"><%=rs("typeTitle")%></textarea></TD> 
    </TR> 			
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>Ҫ��ӵ����ؼ��ʣ�</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent" cols="35" rows="5"><%=rs("typecontent")%></textarea></TD> 
    </TR> 	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>Ҫ��ӵ����������</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typedes" cols="35" rows="5"><%=rs("typedes")%></textarea></TD> 
    </TR>	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>19��ģ��ר�ô���(��)��</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent_19_top" cols="35" rows="5"><%=rs("typecontent_19_top")%></textarea></TD> 
    </TR>		
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>19��ģ��ר�ô���(��)��</b></TD> 
      <TD height=25 class="forumRowHighlight"><textarea name="typecontent_19" cols="35" rows="5"><%=rs("typecontent_19")%></textarea></TD> 
    </TR>		
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>����ţ�</b></TD> 
      <TD height=25 class="forumRowHighlight"><input name="typeno" size="25" value="<%=rs("typeno")%>"/>��ֻ�������֣�����ԽС����ʾԽǰ�棩</TD> 
    </TR> 
    <TR> 	
    <TR> 
      <TD height=25 class="forumRowHighlight" align=right><b>�Ƿ���ʾ��</b></TD> 
      <TD height=25 class="forumRowHighlight">
	  <select name="typehide">
	  <option value="0" <%IF rs("typehide")=0 Then response.Write "selected" %>>����</option>
	  <option value="1" <%IF rs("typehide")=1 Then response.Write "selected" %> >��ʾ</option>
	  </select>
	  </TD> 
    </TR>	
    <tr> 
      <td height="30" colspan="2" class="forumRowHighlight" align="center"> <input type="submit" name="Submit" value="ȷ �� �� ��"> </td> 
    </tr> 
  </table> 
</form> 
<%
rs.close
set rs=nothing
end sub
sub savedit_2()
    set rs= server.createobject ("adodb.recordset")
    sql = "select * from qingtiandh_type2 where typeid="+Cstr(request("id"))
    rs.Open sql,conn,1,3
    if rs.eof and rs.bof then
       body=body+"<br>"+"�������ݿ��������û���ҵ�������Ϣ��"
    else
       rs("typename")=Trim(Request.Form ("class_2_name"))
	   rs("typecontent")=request.Form("typecontent")
	   rs("typeno")=request.Form("typeno")
	   rs("typehide")=request.Form("typehide")
	   rs("typename2")=Trim(Request.Form ("class_1_name2"))
	   rs("typeurl")=Trim(Request.Form ("class_url"))
	   rs("typehttpurl")=Trim(Request.Form ("typehttpurl"))
	   rs("typehttpurl2")=Trim(Request.Form ("typehttpurl2"))
	   rs("typecolor")=Trim(Request.Form ("typecolor"))
	   rs("typeTitle")=Trim(Request.Form ("typeTitle"))
	   rs("typedes")=Trim(Request.Form ("typedes"))
	   rs("typecontent_19")=Trim(Request.Form ("typecontent_19"))
	   rs("typecontent_19_top")=Trim(Request.Form ("typecontent_19_top"))
       rs.Update
	   InsertInd Cadmin,rs("typeid"),"qingtiandh_type2","typeid"
	   'conn.execute("update qingtiandh_List set m_look="&cint(request.Form("typehide"))&" where m_type2="&Cint(request("id"))&"")
    end if 
	InsertInd Cadmin,rs("typeid"),"qingtiandh_type2","typeid"
response.write"<br><table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>"
response.write"<TR>"
response.write"<TH class=tableHeaderText colSpan=2 height=25>ӰƬ��Ϣ������</TH>"
response.write"<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br>����޸ĳɹ���</div></td></tr>"
response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='type.asp?typeid='>&lt;&lt; ��������б�</a></td>"
response.write"</tr>"
response.write"</table>"
Response.Write "<script language=javascript>location.href='"&Request("ref")&"';</script>"
end sub

sub del_class_2()
	Dim del_typeid:del_typeid=Replace(request("id"), "'", "''")
	'ɾ������
	Del_Mlist2 del_typeid
	response.write"<br><table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>"
	response.write"<TR>"
	response.write"<TH class=tableHeaderText colSpan=2 height=25>ӰƬ������</TH>"
	response.write"<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br>���ɾ���ɹ���</div></td></tr>"
	response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='type.asp'>&lt;&lt; ��������б�</a></td>"
	response.write"</tr>"
	response.write"</table><br>" 
	Response.Write "<script language=javascript>location.href='type.asp';</script>"
	IF err<>0 Then
		Response.Redirect("../qingtiancms.com.er.asp?ErrCodes="&Server.URLEncode("ɾ����Ӱʧ��")&"&ErrorUrl=")
		response.End()
	End IF
end sub

sub add_class_2_ok()
    set rs=server.createobject("adodb.recordset")
    sqltext="select * from qingtiandh_type2 where typename='"&request.form("class_name")&"' and typeid1="&typeid
    rs.open sqltext,conn,1,1
    '�������ݿ⣬�������Ƿ��Ѿ�����
    if rs.recordcount >= 1 then 
       if rs("typename")=Replace_Text(request.form("class_name")) then
          response.write"<SCRIPT language=JavaScript>alert('������Ѿ����ڣ���ѡ���������ƣ�');"
          response.write"this.location.href='class_ok2.asp?action=add_class_2&typeid="&typeid&"';</SCRIPT>"
       end if
    else
       set rs=server.createobject("adodb.recordset")
       sqltext="select * from qingtiandh_type2"
       rs.open sqltext,conn,1,3
       rs.addnew
       rs("typename")=Trim(request.form("class_name"))
	   rs("typecontent")=request.Form("typecontent")
	   rs("typeno")=request.Form("typeno")
	   rs("typehide")=request.Form("typehide")
	   rs("typename2")=Trim(request.form("class_name2"))
	   rs("typeurl")=Trim(Request.Form ("class_url"))
	   rs("typehttpurl")=Trim(Request.Form ("typehttpurl"))
	   rs("typehttpurl2")=Trim(Request.Form ("typehttpurl2"))
	   rs("typecolor")=Trim(Request.Form ("typecolor"))
	   rs("typeid1")=typeid
	   rs("typeTitle")=Trim(Request.Form ("typeTitle"))
	   rs("typedes")=Trim(Request.Form ("typedes"))	  
	   rs("typecontent_19")=Trim(Request.Form ("typecontent_19"))	 
	   rs("typecontent_19_top")=Trim(Request.Form ("typecontent_19_top"))
       rs.update
	   InsertInd Cadmin,rs("typeid"),"qingtiandh_type2","typeid"
		response.write"<br><table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>"
		response.write"<TR>"
		response.write"<TH class=tableHeaderText colSpan=2 height=25>ӰƬ����������</TH>"
		response.write"<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br>ӰƬ������Ϣ���ɹ���</div></td></tr>"
		response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='type.asp'>&lt;&lt; ��������б�</a></td>"
		response.write"</tr>"
		response.write"</table>"
		Response.Write "<script language=javascript>location.href='type.asp';</script>"
		end if
		
end sub
%> 