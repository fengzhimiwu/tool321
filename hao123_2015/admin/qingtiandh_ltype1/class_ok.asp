<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<%

call main()
'rs1.close
set rs1=nothing
set rs=nothing
conn.close
set conn=nothing
sub main()
%>
 <%
           if request("action") ="add_class_1" then 
              call add_class_1()
           elseif request("action")="add_class_1_ok" then
              call add_class_1_ok()
           elseif request("action")="edit_class_1" then
              call edit_class_1()
           elseif request("action")="savedit_1" then
              call savedit_1()
           elseif request("action")="del_class_1" then
              call del_class_1()
		  
           else
              call linkinfo()
           end if
           %> 


<%
end sub
sub add_class_1()
Set oRs3=COnn.Execute("Select Max(typeno) From qingtiandh_ltype1")
IF Not oRs3.Eof Then
	ztypeno=Bint(oRs3(0))+1
Else
	ztypeno=1
End IF

%> 
<SCRIPT language=javascript>
function FORM1_onsubmit()
{
 if(document.myform.class_name.value.length<1)
 {
   alert("�����������������!");
   document.myform.class_name.focus();
   return false;
 }
// class_url=document.FORM1.class_url.value
// if(class_url!=""){
//	 if(class_url.indexOf("/template/")!=-1&&class_url.indexOf(".")!=-1&&class_url.indexOf("{$html}")!=-1){}
//	 else{
//	   alert("ģ��·����ʽ����ȷ!");
//	   document.FORM1.class_url.focus();
//	   return false; 
//	 }
// }
}
</SCRIPT> 
<FORM name=myform onSubmit="return FORM1_onsubmit()" action=class_ok.asp?action=add_class_1_ok method=post> 
  <TABLE width=100% border="0" align="center" cellPadding=3 cellSpacing=1 class="tableBorder"> 
    <TR> 
      <Th colSpan=2 height="28" class="tableHeaderText">������</Th> 
    </TR> 
    <TR> 
      <TD width=22% height=25 class="forumRowHighlight" align=right><b>Ҫ��ӵ����</b><font color="#FF0000">*</font></TD> 
      <TD width=78% height=25 class="forumRowHighlight"><INPUT maxLength=16 size=25 name=class_name></TD> 
    </TR> 
    <TR> 
      <TD width=22% height=25 class="forumRowHighlight" align=right><b>Ҫ��ӵ���������</b></TD> 
      <TD width=78% height=25 class="forumRowHighlight"><INPUT maxLength=16 size=25 name=class_name2> 
      ǰ̨��ʾ�������� </TD> 
    </TR>	
	<Tr>
      <TD width=22% height=25 class="forumRowHighlight" align=right><b>����Ӧ�ĵ����������</b><font color="#FF0000">*</font></TD> 
      <TD width=78% height=25 class="forumRowHighlight">
	  <select name="m_type2">
	  <%
	  	Set oRs1=Conn.Execute("select * from qingtiandh_type1 order by typehide desc,typeno asc")
		Do While Not oRs1.Eof
			oTypeid=oRs1("Typeid")
			oTypeName1=oRs1("TypeName")
			Response.Write "<optgroup label='"&oTypeName1&"'></optgroup>"&vbcrlf
			Set oRs2=Conn.Execute("Select * From qingtiandh_type2 Where Typeid1="&oTypeid&" order by typehide desc,typeno asc")
			Do While Not oRs2.Eof
				oTypeName2=oRs2("TypeName")
				oTypeid2=oRs2("TypeId")
				Response.Write "<option value='"&oTypeid2&"'>"&oTypeName2&"</option>"&vbcrlf
				oRs2.MoveNext
			Loop
			oRs1.MoveNext
		Loop
	  %>
	  </select>
	  </TD> 		
	</Tr>	
    <tr> 
      <td width="23%" class="forumRowHighlight" align=right><b>������ⲿhttp��ַ��</b></td> 
      <td width="77%" class="forumRowHighlight"> <input type="text" name="typehttpurl2" size='40' value=""> ���ȼ������ ���磺http://www.qingtiandy.cn</td> 
    </tr>	
	
    <TR> 
      <TD width=22% height=25 class="forumRowHighlight" align=right><b>Ҫ��ӵ�����飺</b></TD> 
      <TD width=78% height=25 class="forumRowHighlight"><textarea name="typecontent" cols="25" rows="5"></textarea></TD> 
    </TR> 	
    <TR> 
      <TD width=22% height=25 class="forumRowHighlight" align=right><b>����ţ�</b></TD> 
      <TD width=78% height=25 class="forumRowHighlight"><input name="typeno" size="25"  value="<%=ztypeno%>"/>��ֻ�������֣�����ԽС����ʾԽǰ�棩</TD> 
    </TR> 
    <TR> 
      <TD width=22% height=25 class="forumRowHighlight" align=right><b>�Ƿ���ʾ��</b></TD> 
      <TD width=78% height=25 class="forumRowHighlight">
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
sub edit_class_1()
    set rs=server.createobject("adodb.recordset")
    sqltext="select * from qingtiandh_ltype1 where typeid="+Cstr(request("id"))
    rs.open sqltext,conn,1,1
%> 
<SCRIPT language=javascript>
function FORM1_onsubmit()
{
 if(document.myform.class_1_name.value.length<1)
 {
   alert("�����������������!");
   document.myform.class_1_name.focus();
   return false;
 }
// class_url=document.FORM1.class_url.value
// if(class_url!=""){
//	 if(class_url.indexOf("/template/")!=-1&&class_url.indexOf(".")!=-1&&class_url.indexOf("{$html}")!=-1){}
//	 else{
//	   alert("ģ��·����ʽ����ȷ!");
//	   document.FORM1.class_url.focus();
//	   return false; 
//	 }
// }
}
</SCRIPT>
<form name=myform action="class_ok.asp?action=savedit_1" method=post onSubmit="return FORM1_onsubmit()"> 
  <input type=hidden name=id value="<%=Cstr(request("id"))%>"> 
  <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableBorder"> 
    <TR> 
      <Th colSpan=2 height="28" class="tableHeaderText">�޸ĵ�����Ϣ���</Th> 
    </TR> 
    <tr> 
      <td width="23%" class="forumRowHighlight" align=right><b>Ҫ�޸ĵ����</b><font color="#FF0000">*</font></td> 
      <td width="77%" class="forumRowHighlight"> <input type="text" name="class_1_name" size='40' value="<%=rs("typename")%>"> </td> 
    </tr> 
    <tr> 
      <td width="23%" class="forumRowHighlight" align=right><b>Ҫ�޸ĵ���������</b></td> 
      <td width="77%" class="forumRowHighlight"> <input type="text" name="class_2_name2" size='40' value="<%=rs("typename2")%>"> </td> 
    </tr>	
	<Tr>
      <TD width=22% height=25 class="forumRowHighlight" align=right><b>����Ӧ�ĵ����������</b><font color="#FF0000">*</font></TD> 
      <TD width=78% height=25 class="forumRowHighlight">
	  <select name="m_type2">
	  <%
	  	Set oRs1=Conn.Execute("select * from qingtiandh_type1 order by typehide desc,typeno asc")
		Do While Not oRs1.Eof
			oTypeid=oRs1("Typeid")
			oTypeName1=oRs1("TypeName")
			Response.Write "<optgroup label='"&oTypeName1&"'></optgroup>"&vbcrlf
			Set oRs2=Conn.Execute("Select * From qingtiandh_type2 Where Typeid1="&oTypeid&" order by typehide desc,typeno asc")
			Do While Not oRs2.Eof
				oTypeName2=oRs2("TypeName")
				oTypeid2=oRs2("TypeId")
				IF Cstr(rs("m_type2"))=Cstr(oTypeid2) Then
					Response.Write "<option value='"&oTypeid2&"' selected>"&oTypeName2&"</option>"&vbcrlf
				Else
					Response.Write "<option value='"&oTypeid2&"'>"&oTypeName2&"</option>"&vbcrlf
				End IF
				oRs2.MoveNext
			Loop
			oRs1.MoveNext
		Loop
	  %>
	  </select>
	  </TD> 		
	</Tr>
    <tr> 
      <td width="23%" class="forumRowHighlight" align=right><b>������ⲿhttp��ַ��</b></td> 
      <td width="77%" class="forumRowHighlight"> <input type="text" name="typehttpurl2" size='40' value="<%=rs("typehttpurl2")%>"> ���ȼ������ ���磺http://www.qingtiandy.cn</td> 
    </tr>	
	
    <TR> 
      <TD width=23% height=25 class="forumRowHighlight" align=right><b>Ҫ�޸ĵ�����飺</b></TD> 
      <TD width=77% height=25 class="forumRowHighlight"><textarea name="typecontent" cols="25" rows="5"><%=rs("typecontent")%></textarea></TD> 
    </TR> 	
    <TR> 
      <TD width=23% height=25 class="forumRowHighlight" align=right><b>����ţ�</b></TD> 
      <TD width=77% height=25 class="forumRowHighlight"><input name="typeno" size="25" value="<%=rs("typeno")%>"/>��ֻ�������֣�����ԽС����ʾԽǰ�棩</TD> 
    </TR> 
    <TR> 
      <TD width=23% height=25 class="forumRowHighlight" align=right><b>�Ƿ���ʾ��</b></TD> 
      <TD width=77% height=25 class="forumRowHighlight">
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
sub savedit_1()
    set rs= server.createobject ("adodb.recordset")
    sql = "select * from qingtiandh_ltype1 where typeid="+Cstr(request("id"))
    rs.Open sql,conn,1,3
    if rs.eof and rs.bof then
       body=body+"<br>"+"�������ݿ��������û���ҵ�������Ϣ��"
    else
       rs("typename")=Trim(Request.Form ("class_1_name"))
	   rs("typecontent")=request.Form("typecontent")
	   rs("typeno")=request.Form("typeno")
	   rs("typehide")=request.Form("typehide")
	   rs("typename2")=Trim(Request.Form ("class_2_name2"))
	   rs("typeurl")=Replace_Text(Request.Form ("class_url"))
	   rs("typehttpurl2")=Replace_Text(Request.Form ("typehttpurl2"))
	   rs("m_type2")=Replace_Text(Request.Form ("m_type2"))
	   rs("type_pic")=Replace_Text(Request.Form ("m_pic"))
       rs.Update
	   InsertInd Cadmin,rs("typeid"),"qingtiandh_ltype1","typeid"
	   conn.execute("update qingtiandh_List2 set m_look="&cint(request.Form("typehide"))&" where m_type1="&Cint(request("id")))
    end if 
	InsertInd Cadmin,rs("typeid"),"qingtiandh_ltype1","typeid"
response.write"<br><table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>"
response.write"<TR>"
response.write"<TH class=tableHeaderText colSpan=2 height=25>��վ������</TH>"
response.write"<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br>����޸ĳɹ���</div></td></tr>"
response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='type.asp'>&lt;&lt; ��������б�</a></td>"
response.write"</tr>"
response.write"</table>"
Response.Write "<script language=javascript>location.href='type.asp';</script>"
end sub

sub del_class_1()
	Dim del_typeid:del_typeid=Replace(request("id"), "'", "''")
	'ɾ������
	conn.Execute("Delete From qingtiandh_ltype1 Where typeid="&del_typeid)
	conn.Execute("Delete From qingtiandh_List2 Where m_type1="&del_typeid)
	response.write"<br><table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>"
	response.write"<TR>"
	response.write"<TH class=tableHeaderText colSpan=2 height=25>��վ������</TH>"
	response.write"<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br>���ɾ���ɹ���</div></td></tr>"
	response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='type.asp'>&lt;&lt; ��������б�</a></td>"
	response.write"</tr>"
	response.write"</table><br>" 
	Response.Write "<script language=javascript>location.href='type.asp';</script>"
	IF err<>0 Then
		Response.Redirect("../qingtiancms.com.er.asp?ErrCodes="&Server.URLEncode("ɾ������ʧ��")&"&ErrorUrl=")		
		response.End()
	End IF
	
end sub

sub add_class_1_ok()
    set rs=server.createobject("adodb.recordset")
    sqltext="select * from qingtiandh_ltype1 where typename='"&request.form("class_name")&"'"
    rs.open sqltext,conn,1,1
    '�������ݿ⣬�������Ƿ��Ѿ�����
    if rs.recordcount >= 1 then 
       if rs("typename")=Replace_Text(request.form("class_name")) then
          response.write"<SCRIPT language=JavaScript>alert('������Ѿ����ڣ���ѡ���������ƣ�');"
          response.write"this.location.href='class_ok.asp?action=add_class_1';</SCRIPT>"
       end if
    else
       set rs=server.createobject("adodb.recordset")
       sqltext="select * from qingtiandh_ltype1"
       rs.open sqltext,conn,1,3
       rs.addnew
       rs("typename")=Trim(request.form("class_name"))
	   rs("typecontent")=request.Form("typecontent")
	   rs("typeno")=request.Form("typeno")
	   rs("typehide")=request.Form("typehide")
	   rs("typename2")=Trim(request.form("class_name2"))
	   rs("typeurl")=Replace_Text(Request.Form ("class_url"))
	   rs("typehttpurl2")=Replace_Text(Request.Form ("typehttpurl2"))
	   rs("m_type2")=Replace_Text(Request.Form ("m_type2"))
	   rs("type_pic")=Replace_Text(Request.Form ("m_pic")) 
       rs.update
		InsertInd Cadmin,rs("typeid"),"qingtiandh_ltype1","typeid"
	response.write"<br><table cellpadding=2 cellspacing=1 border=0 width=100% class=tableBorder align=center>"
	response.write"<TR>"
	response.write"<TH class=tableHeaderText colSpan=2 height=25>��վ������</TH>"
	response.write"<TR><tr><td height=85 valign=top class=forumRow><div align=center><br><br>�������ɹ���</div></td></tr>"
	response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='type.asp'>&lt;&lt; ���ص�������б�</a></td>"
	response.write"</tr>"
	response.write"</table>"
	end if
	Response.Write "<script language=javascript>location.href='type.asp';</script>"
end sub
%> 