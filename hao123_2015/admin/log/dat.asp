<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->


<html>
<head>
<title>��̨����-���ݿⱸ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/style.css">
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">

<%
Function Filehaveno(FileName)
set ffso=server.createobject("Scripting.FileSystemObject")
Filehaveno=ffso.FileExists(server.mappath(Filename))
set ffso=nothing
End Function
%>
<%
if request("action")="" then
call main()
elseif request("action")="restore" then
call restore()
else
call add()
end if
%>
<%
sub main()
%>
<script language="javascript" type="text/javascript">
function check()
{
if(document.form.dbname.value=="")
{
alert("���������ݿⱸ�ݵ�����")
document.form.dbname.focus()
document.form.dbname.select()
return
}
document.form.next1.value='���ڱ��ݣ����Ե�....'
document.form.submit()
}
</script>

<script language="javascript" type="text/javascript">
function check_n()
{
if(document.form_n.dbname_n.value=="")
{
alert("���������ݿⱸ�ݵ�����")
return
}
document.form_n.next_n.value='���ڻָ������Ե�....'
document.form_n.submit()
}
</script>
<!-- ��������ӳ��� -->
<form name="form" method="POST" action="?action=add"> 
  <TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
    <tr> 
      <th height=25 colspan="2" class="tableHeaderText">���ݿⱸ��</th> 
    </tr> 
    <TR ALIGN="center"> 
      <TD> <TABLE width="100%" border="0" cellpadding="5" cellspacing="2" bordercolorlight="#CEE7FF" bordercolordark="#CEE7FF" style="border-collapse: collapse"> 
          <TR> 
            <TD width="210" align="right" class="Forumrow"><b>���ݵ����֣�</b></TD> 
            <TD width="729" class="Forumrow"> 
			  <font color="#F4FAFF"> 
<%
set M_totle=conn.execute("select count(0) from qingtiandh_List")
M_totle=M_totle(0) 
%>
              <input name="dbname" type="text" class="smallInput" id="tk_title"  size="30" value="<%=year(now)&month(now)&day(now)&"_"&M_totle%>"><input type="button" name="next1" value="���̱���" class="smallInput"  onclick="check()">
			  <font color="#000000">��������� 20070603,��Ҫ���κη���</font></font></TD> 
          </TR>		


          
      </TABLE></TD> 
    </TR> 
  </TABLE> 
</FORM>
<form name="form_n" method="POST" action="?action=restore"> 
  <TABLE width="100%" border="0" align=center cellpadding="0" cellspacing="1" class="tableBorder"> 
    <tr> 
      <th height=25 colspan="2" class="tableHeaderText">���ݿ�ָ�</th> 
    </tr> 
    <TR ALIGN="center"> 
      <TD> <TABLE width="100%" border="0" cellpadding="5" cellspacing="2" bordercolorlight="#CEE7FF" bordercolordark="#CEE7FF" style="border-collapse: collapse"> 
          <TR> 
            <TD width="210" align="right" class="Forumrow"><b>�ָ������֣�</b></TD> 
            <TD width="729" class="Forumrow"> 
			  <font color="#F4FAFF"> 
			  <select name="dbname_n" size="1">
			  <%
			  N_Fso.C_N_CreateFolders Add_Root_Dir("backup/db")
			  set file1=server.CreateObject("scripting.FileSystemObject")
			  set folder1=file1.GetFolder(""&server.mappath("../../backup/db")&"")
			  
			  for each thing in folder1.Files
			  dbname_2=thing.name
			  %>
              
			  <option value="<%=dbname_2%>"><%=dbname_2%></option>
			  
			  <%next%>
			  </select>
<input type="button" name="next_n" value="����ѹ�����ָ�" class="smallInput"  onclick="check_n()">
			  </font></TD> 
          </TR>		


          
      </TABLE></TD> 
    </TR> 
  </TABLE> 
</FORM>

  <%
  end sub
  %>
<%

sub add()
	IF G_IS_SQL_User_DB=1 Then
		dbname=request("dbname")
		if Filehaveno("/backup/db/"&dbname&".dat") then
		response.Write "<script>alert('�����ݿ����Ѿ����ڣ�������ѡ��');history.back(-1)</script>"
		response.End()
		end if
		set rs=Server.createobject("adodb.connection")
		sql="backup database "&G_SQL_DATA&" to disk='"&Server.MapPath("\backup\db")&"\"&dbname&".dat"&"'"
		conn.execute sql

		response.Write "<script>alert('���ݿⱸ�ݳɹ�');history.back(-1)</script>"
		response.End()
	Else
	
		dbname=request("dbname")
		Pa="../../backup/db"
		Set d_file1=server.CreateObject(G_FSO)
		set d_folder1=d_file1.GetFolder(""&server.mappath(Pa)&"")
		d_file1.CopyFile server.MapPath("../../"&G_CONN_STR),server.MapPath(Pa&"/"&dbname)	
		response.Write "<script>alert('���ݿⱸ�ݳɹ�');history.back(-1)</script>"
		response.End()
	End IF
end sub
%>  
<%
sub restore()
	IF G_IS_SQL_User_DB=1 Then
		response.Write "<script>alert('MSSQL��ֻ���ֶ��ָ�');history.back(-1)</script>"
	Else	
		dbname=request("dbname_n")
		Pa="../../backup/db"
		Set d_file1=server.CreateObject(G_FSO)
		Set Engine = Server.CreateObject("JRO.JetEngine") 		
		prov = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="
		
		OldDB=Server.MapPath(Pa&"/"&dbname)
		newDB=Server.MapPath(Pa&"/db")
		
		Engine.CompactDatabase prov & OldDB, prov & newDB 
		set Engine = nothing 	
			
		'FSO.DeleteFile oldDB 'ɾ����ʱ�ļ�
		'FSO.MoveFile newDB, oldDB 
		'set FSO = Nothing

		
		set d_folder1=d_file1.GetFolder(""&server.mappath(Pa)&"")
		d_file1.CopyFile newDB,server.MapPath("../../"&G_CONN_STR)	
		d_file1.DeleteFile newDB
		IF err>0 Then 
			response.Write err.Description
		Else
			response.Write "<script>alert('���ݿ�ָ��ɹ�');history.back(-1)</script>"
		End IF
		response.End()
	End IF
end sub
%>
</body>
</html>

