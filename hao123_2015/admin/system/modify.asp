
<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<SCRIPT language=JavaScript>
function test()
{
	
	if(form1.str_pass.value.length != 0)
	{
			if(form1.str_pass2.value.length == 0)
	{
		alert("�����ظ�����Ϊ��!") ;
		form1.str_pass2.focus() ;
		return false;
	}
		if(form1.str_pass.value!=form1.str_pass2.value)
	{
		alert("����������ظ���ͬ!") ;
		form1.str_pass2.focus() ;
		return false;
	}
	}
	

	return true;
};
function check()
{if (document.form1.all_check.checked)
for(i=0;i<document.form1.str_manage.length;i++)
  document.form1.str_manage[i].checked=true;
else
for(i=0;i<document.form1.str_manage.length;i++)
  document.form1.str_manage[i].checked=false;

}

</SCRIPT>
<%
id=clng(request.QueryString("id"))
set rs=server.CreateObject("adodb.recordset")
sql="select * from tbl_admin where id="&id&""
rs.open sql,conn,1,1,&H0001
if rs.eof then
	rs.close:set rs=nothing
	response.write("û����ؼ�¼")
	response.end
end if

%>

<html>
<head>
<title>��̨����-�༭�û�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/style.css">
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="24%"><a href="../"><img src="../images/admin.gif" width="200" height="66" border="0"></a></td>
    <td width="76%" valign="bottom"><div align="right"><%=Copyright%></div></td>
  </tr>
  <tr bgcolor="#F6F6F6"> 
    <th height="22" colspan="2" class="tableHeaderText">&nbsp;&nbsp;::: ����Ա������� 
      --&gt; �༭�û�</th>
  </tr>
  <tr bgcolor="#FF9900"> 
    <td height="1" colspan="2"></td>
  </tr>
</table>
<br>
<table width="98%" border="1"  align=center cellpadding="0" cellspacing="1" class="tableBorder">
  <form action="modify_save.asp" method="POST" name="form1" id="form1"  onSubmit="return test();">
    <tr> 
      <td height=25 class=forumRow><div align="right">�û���½�ʺţ�</div></td>
      <td class=forumRow >&nbsp; <%=rs("str_username")%>
        <input name="id" type="hidden" id="id" value="<%=id%>"></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">�û���½���룺</div></td>
      <td class=forumRow >&nbsp; <input name="str_pass" type="password" id="zt" size="20">
        <font color="#FF6600">*( �粻�޸����룬�벻Ҫ��д���� )</font></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow ><div align="right">�ظ����룺</div></td>
      <td class=forumRow>&nbsp; <input name="str_pass2" type="password" id="str_pass2" size="20">
        <font color="#FF6600">*( �粻�޸����룬�벻Ҫ��д���� )</font></td>
    </tr>
    <tr> 
      <th height=25 colspan="2" class="tableHeaderText"><div align="center">- �û�������Ϣ -</div></th>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">�û�������</div></td>
      <td class=forumRow>&nbsp; <input name="str_name" type="text" id="str_name" size="20" value="<%=rs("str_name")%>"></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">�� ��</div></td>
      <td class=forumRow>&nbsp; <input name="str_sex" type="radio" value="��" <%if rs("str_sex")="��" then response.write("checked")%>>
        ��<strong> </strong> &nbsp;&nbsp;&nbsp; <input type="radio" name="str_sex" value="Ů" <%if rs("str_sex")="Ů" then response.write("checked")%>>
        Ů</td>
    </tr>

    
    <tr> 
      <td height=25 class=forumRow><div align="right">ְ ��</div></td>
      <td class=forumRow>&nbsp; <input name="str_job" type="text" id="str_job" size="20" value="<%=rs("str_job")%>"></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">�� ����</div></td>
      <td class=forumRow>&nbsp; <input name="str_tel" type="text" id="str_tel" size="20" value="<%=rs("str_tel")%>"></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">Email��</div></td>
      <td class=forumRow>&nbsp; <input name="str_mail" type="text" id="str_mail" size="20" value="<%=rs("str_mail")%>"></td>
    </tr>
    <tr> 
      <td height=90 class=forumRow><div align="right">�û���ע��</div></td>
      <td class=forumRow>&nbsp; <textarea name="remark" cols="50" rows="5" id="remark"><%=rs("remark")%></textarea></td>
    </tr>
	<tr> 
      <th height=25 class="tableHeaderText"><div align="right">�ʺ�״̬��</div></th>
      <td height="25" =forumRow>&nbsp; 
        <%
	  select case rs("flag")
	  case 0
	  	response.write("����״̬")
	  case 1
	  	response.write("<font color='#ff0000'>���״̬</font>")
	  end select
	  %>
        &nbsp;<select name="str_lock" id="str_lock">
          <option value="1" <%if rs("flag")=1 then response.write("selected")%>>����ʺ�</option>
          <option value="0" <%if rs("flag")=0 then response.write("selected")%>>����ʺ�</option>
        </select></td>
    </tr><!--
    <tr> 
      <th height=25 class="tableHeaderText"><div align="right">����Ա����</div></th>
      <td height="25" =forumRow>&nbsp; 
	  <input name="str_level" type="radio" value="1" <%'if rs("str_level")="1" then response.write("checked")%>>
        ��ͨ�û�
        <input name="str_level" type="radio" value="2" <%if rs("str_level")="2" then response.write("checked")%>>����Ա
		<input name="str_level" type="radio" value="3" <%if rs("str_level")="3" then response.write("checked")%>>
        <font color="#FF0000">��������Ա</font>��ֻ�г�������Ա�������/�޸�/ɾ�����Ȩ�ޣ�</td>
    </tr>-->
    <tr> 
      <td width="16%" height=39 bgcolor="#F6F6F6"><div align="center">&nbsp; </div></td>
      <td width="84%" bgcolor="#F6F6F6"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input name="Submit" type="submit" value=" �޸� "> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input name="Submit2" type="reset" value=" ��ԭ "></td>
    </tr>
  </form>
</table>
<br>
<div align="center"><br>
</div>
</body>
</html>


