
<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->

<SCRIPT language=JavaScript>
function test()
{
	
		if(form1.str_username.value.length == 0)
	{
		alert("�û���½�ʺŲ���Ϊ��!") ;
		form1.str_username.focus() ;
		return false;
	}
	
	if(form1.str_pass.value.length == 0)
	{
		alert("�û����벻��Ϊ��!") ;
		form1.str_pass.focus() ;
		return false;
	}
	
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

<html>
<head>
<title>��̨������ӹ���Ա</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/style.css">
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="24%"><img src="../images/admin.gif" width="200" height="66"></td>
    <td width="76%" valign="bottom"><div align="right"><%=Copyright%></div></td>
  </tr>
  <tr> 
    <th height="22" colspan="2" class="tableHeaderText">&nbsp;&nbsp;::: ����Ա������� 
      --&gt; ����û�</th>
  </tr>
  <tr> 
    <td height="1" colspan="2"></td>
  </tr>
</table>
<br>
<table width="98%" border="1"  align=center cellpadding="0" cellspacing="1" class="tableBorder">
  <form action="add_save.asp" method="POST" name="form1" id="form1"  onSubmit="return test();">
    <tr> 
      <td height=25 class=forumRow><div align="right">�û���½�ʺţ�</div></td>
      <td class=forumRow >&nbsp; <input name="str_username" type="text" id="zt2" size="20"> 
        <font color="#FF6600">*���������ģ�Ӣ�ģ����ֽ���ע��[3-12λ������2-6��]��</font></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">�û���½���룺</div></td>
      <td bgcolor="#F6F6F6" class=forumRow >&nbsp; <input name="str_pass" type="password" id="zt" value="888888" size="20"> 
        <font color="#FF6600">*������6-20λӢ�Ļ����֣���ʼ��Ϊ888888��</font></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow ><div align="right">�ظ����룺</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_pass2" type="password" id="str_pass2" value="888888" size="20"> 
        <font color="#FF6600">*����ʼ��Ϊ888888��</font></td>
    </tr>
    <tr> 
      <th height=25 colspan="2" class="tableHeaderText"><div align="center">- �û�������Ϣ -</div></th>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">�û�������</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_name" type="text" id="str_name" size="20"></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">�� ��</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_sex" type="radio" value="��" checked>
        ��<strong> </strong> &nbsp;&nbsp;&nbsp; <input type="radio" name="str_sex" value="Ů">
        Ů</td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">ְ ��</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_job" type="text" id="str_job" size="20"></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">�� ����</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_tel" type="text" id="str_tel" size="20"></td>
    </tr>
    <tr> 
      <td height=25 class=forumRow><div align="right">Email��</div></td>
      <td bgcolor="#F6F6F6" class=forumRow>&nbsp; <input name="str_mail" type="text" id="str_mail" size="20"></td>
    </tr>
    <tr> 
      <td height=90 class=forumRow><div align="right">�û���ע��</div></td>
      <td  class=forumRow>&nbsp; <textarea name="remark" cols="50" rows="5" id="remark"></textarea></td>
    </tr><!--
    <tr> 
      <th height=25 class="tableHeaderText"><div align="right">����Ա����</div></th>
      <td height="25" class=forumRow>&nbsp;
	   <input name="str_level" type="radio" value="1" checked>
      �ͼ�����Ա 
          <input name="str_level" type="radio" value="2" checked="checked">����Ա
		  <input name="str_level" type="radio" value="3">
        <font color="#FF0000">��������Ա</font>��ֻ�г�������Ա�������/�޸�/ɾ��Ȩ�ޣ�</td>
    </tr>-->

    <tr> 
      <td width="16%" height=39 class=forumRow><div align="center">&nbsp; </div></td>
      <td width="84%"class=forumRow> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input name="Submit" type="submit" value=" ��� "> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input name="Submit2" type="reset" value=" ��� "></td>
    </tr>
  </form>
</table>
<br>
<div align="center"><br>
</div>
</body>
</html>
