<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="upublic.asp"-->
<!--#include file="function_u.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta content="<%=G_WEBNAME%>�û����ģ�ֻҪ��ע����<%=G_WEBNAME%>�˺ţ��Ϳ�������<%=G_WEBNAME%>Ϊ���ṩ�����и��Ի�����ֻҪ����һ�����֣��Ϳ�һվͨ�С�" name="description">
<meta content="<%=G_WEBNAME%>�û�����,<%=G_WEBURL_2%>,�û�����,һվͨ" name="keywords">
<link rel="stylesheet" type="text/css" href="Ucss/reset.css" />
<link rel="stylesheet" type="text/css" href="Ucss/common.css" />
<link rel="stylesheet" type="text/css" href="Ucss/layout.css" />
<script type="text/javascript" src="Ujs/checkUser.js"></script>
<script type="text/javascript" src="Ujs/FormCity.js"></script>
<script type="text/javascript" src="Ujs/FormScript.js"></script>

<title>�޸����� - �û����� - <%=G_WEBNAME%></title>
</head>
<body>
<%
p=Request("p")
%>
<script language="javascript">
<!--
function checkadd(){
	var soojs_u_p,soojs_u_email
	soojs_u_p=$_soojs("soojs_u_p").value.Trim()
	soojs_u_email=$_soojs("soojs_u_email").value.Trim()
	if(soojs_u_p==""){
		alert("���벻��Ϊ��")
		$_soojs("soojs_u_p").focus()
		return false
	}	
	if(soojs_u_email==""){
		alert("�����䲻��Ϊ��")
		$_soojs("soojs_u_email").focus()
		return false
	}	
	if(!soojs_u_email.match(/^[\w\.\-]+@([\w\-]+\.)+[a-z]{2,4}$/ig)){
		alert("�������ʽ����")
		$_soojs("soojs_u_email").focus()
		return false
	}
}
-->
</script>
<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">�޸�����</h3>
					<div class="hr"></div>
				</div>
				<form method="post" action="./regok.asp" id="info" name="info" onsubmit="return checkadd()">
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<%IF p<>"" Then%>
                    <tr>
						<th></th>
						<td><font color="#FF0000"><%=p%></font></td>
						<td></td>
					</tr>			
					<%End IF%>	
					<tr>
                      <th width="110">���䣺</th>
                      <td width="267"><%=zsoojs_u_email%></td>
                      <td width="223"><em class="form-info" id="email-msg"></em></td>
					</tr>
					<tr>
						<th>���룺</th>
						<td><input type="password" class="input-text" name="soojs_u_p" id="soojs_u_p" value="" /></td>
						<td><em class="form-info" id="passwd-msg"></em></td>
					</tr>
					<tr>
                      <th></th>
                      <td><span>�������¼���룡</span></td>
                      <td></td>
					</tr>	
					<tr>
						<th>�����䣺</th>
						<td><input type="text" class="input-text" name="soojs_u_email" id="soojs_u_email" value="" onchange="checkemail_f()" /></td>
						<td><em class="form-info" id="new_email-msg"></em></td>
					</tr>
					<tr>
                      <th></th>
                      <td></td>
					</tr>									
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="editemail"><input type="submit" class="button btn-blue" value="ȷ��" /> <input type="button" class="button btn-gray" value="����" onclick="window.location='./'"  /></td>
						<td>&nbsp;</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>
	<!--#include file="ubottom.asp"-->
</div>
<DIV id=check_username_script style="DISPLAY: none"></DIV>
</body>
</html>