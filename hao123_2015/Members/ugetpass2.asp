<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<%
p=Request("p")
IF p="1" Then
	Session("u_email")=""
	Session("u_email_str")=""
End IF
%>
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
<script type="text/javascript" src="Ujs/getpass.js"></script>
<title>�һ����� - <%=G_WEBNAME%></title>
</head>
<body>
<div class="wrap">
	<div class="head">
		<h1 class="logo fl"><a href="./"><%=G_WEBNAME%> �û�����</a></h1>
		<p class="gray text-right pv10">
			<a href="../">������ҳ</a> |  
			<a href="./">�����ҵ��ʻ�</a>
		</p>
		<div class="guide">				
			<h2 class="font-14">&nbsp;</h2>
		</div>
	</div>
	<div class="main-content">
		<div class="leftbar">
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">�һ�����</h3>
					<div class="hr"></div>
				</div>
				<%IF Session("u_email")="" Then%>
				<div class="step-bar">
						<span class="step current">1����дE-mail</span>
						<span class="font-12">��</span>
						<span class="step">2����д�ǳ�</span>
						<span class="font-12">��</span>
						<span class="step">3����ȡ����</span>
				</div>
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
				    <form method="post" action="./regok.asp" id="form" onsubmit="return check_getpass()">
                    <tr>
						<th width="110"><label for="email">�����ַ��</label></th>
						<td width="267"><input type="text" class="input-text" name="email" id="email" value="" /></td>
						<td width="223">
						   <em class="form-info" id="email_1"></em>
						</td>
					</tr>
					<tr>
						<th><input type="hidden" name="action" value="getpass11" /></th>
						<td>
						<input type="submit" class="button btn-blue" value="��һ��" /> 
						<input type="button" class="button btn-gray" value="���ص�½" onclick="window.location='./login.asp'"  />
						</td>
						<td>&nbsp;</td>
					</tr>
					<script>$_soojs("email").focus()</script>
					</form>
				</table>
				<%ElseIF Session("u_email")="1" Then%>
				<div class="step-bar">
						<span class="step">1����дE-mail</span>
						<span class="font-12">��</span>
						<span class="step current">2����д�ǳ�</span>
						<span class="font-12">��</span>
						<span class="step">3����ȡ����</span>
				</div>
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
				    <form method="post" action="./regok.asp" id="form" onsubmit="return check_getusername()">
					<input type="hidden" name="soojs_u_email" value="<%=Session("u_email_str")%>" />
                    <tr>
						<th width="110"><label for="email">�ǳƣ�</label></th>
						<td width="267"><input type="text" class="input-text" name="soojs_u_name" id="soojs_u_name" value="" /></td>
						<td width="223">
						   <em class="form-info" id="soojs_u_name_1"></em>
						</td>
					</tr>
					<tr>
						<th><input type="hidden" name="action" value="getpass22" /></th>
						<td><input type="button" class="button btn-blue" value="��һ��" onclick="window.location='ugetpass2.asp?p=1'" /> <input type="submit" class="button btn-blue" value="��һ��" /></td>
						<td>&nbsp;</td>
					</tr>
					</form>
					<script>$_soojs("soojs_u_name").focus()</script>
				</table>	
				<%ElseIF Session("u_email")="2" Then%>	
				<div class="step-bar">
						<span class="step">1�������ʼ�</span>
						<span class="font-12">��</span>
						<span class="step">2����������</span>
						<span class="font-12">��</span>
						<span class="step current">3���ɹ�</span>
				</div>
				<%IF Request("p")="ok" Then%>
               	<div class="pl-110">
					<div class="box-yellow p10 mv10">
						<h4 class="ico-success font-14 ">
                            ��ϲ����<br />
							���ĵ�½�����Ѿ�������������ˣ�<font color="#FF0000"><%=Request("e")%></font><br />
							���μ����ĵ�½���룬��<a href="./login.asp">����</a>���е�½
						</h4>
						<div class="p5 mt5" style="border-top:1px #ccc solid">
							<strong>����������</strong>
							<p class=" gray9">
								<a href="../">1��������վ��ҳ</a><br />
							    <a href="./login.asp">2�����ص�½���棬�����û���½</a></p>
								<a href="./ugetpass.asp?n=1&p=1">3���ʼ�û�յ����������������֤��ȡ������</a></p>
						</div>
					</div>
               </div>
			   <%ElseIF Request("p")="error" Then%>
               	<div class="pl-110">
					<div class="box-yellow p10 mv10">
						<h4 class="font-14 ">
                            <font color="#FF0000">�ʼ�ϵͳ����ά����</font><br />
							��������������֤�һ�����,<a href="ugetpass.asp?n=1&p=1">��������һ�����.</a>
						</h4>
						<div class="p5 mt5" style="border-top:1px #ccc solid">
							<strong>����������</strong>
							<p class=" gray9">
								<a href="../">1��������վ��ҳ</a><br />
							    <a href="./login.asp">2�����ص�½���棬�����û���½</a></p>
						</div>
					</div>
               </div>
			   <%End IF%>			   
			   <%End IF%>
			</div>			
		</div>
	</div>
	<!--#include file="ubottom.asp"-->
</div>
</body>
</html>