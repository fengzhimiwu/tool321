<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="function_u.asp"-->
<!--#include file="upublic.asp"-->
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

<title>�޸�ͷ�� - �û����� - <%=G_WEBNAME%></title>
</head>
<body>
<%
p=Request("p")
%>
<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">�޸�ͷ��</h3>
					<div class="hr"></div>
				</div>
				<style type="text/css">
				<!--
					.SystemHead UL LI {
						FLOAT: left; MARGIN: 8px; OVERFLOW: hidden; WIDTH: 100px; HEIGHT: 120px; TEXT-ALIGN: center
					}
					.SystemHead UL LI IMG {
						BORDER-RIGHT: #ccc 1px solid; PADDING-RIGHT: 4px; BORDER-TOP: #ccc 1px solid; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; BORDER-LEFT: #ccc 1px solid; WIDTH: 90px; PADDING-TOP: 4px; BORDER-BOTTOM: #ccc 1px solid; HEIGHT: 90px
					}
					.SystemHead UL LI A:hover IMG {
						BORDER-RIGHT: #339900 1px solid; BORDER-TOP: #339900 1px solid; BORDER-LEFT: #339900 1px solid; BORDER-BOTTOM: #339900 1px solid
					}
					.SystemHead UL LI A.current IMG {
						BORDER-RIGHT: #339900 1px solid; BORDER-TOP: #339900 1px solid; BORDER-LEFT: #339900 1px solid; BORDER-BOTTOM: #339900 1px solid
					}
				-->
				</style>
				<form method="post" action="./regok.asp" id="info" name="info">
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">	
					<tr>
						<%IF p<>"" Then%>
						<tr>
							<th width="110"></th>
							<td width="247"><font color="#FF0000"><%=p%></font></td>
							<td width="243"></td>
						</tr>		
						<%End IF%>					
						<td colspan="3" class="SystemHead">
							  <ul>
							  <li onclick="(this.childNodes[1].checked=true)"><a href='javascript:void(0)'><img src="<%=Add_Root_Dir("/p_inc/img/nouserpic.gif")%>"/></a><input type="radio" name="sysFace" value="/p_inc/img/nouserpic.gif" <%IF zsoojs_u_pic=Add_Root_Dir("/p_inc/img/nouserpic.gif") Then Response.Write "checked=checked"%> /></li>
							  <%
							  	pStr=""
								pi=1
							  	set file1=server.CreateObject(G_FSO)
								set folder1=file1.GetFolder(server.mappath(Add_Root_Dir("/Members/Uface/")))
								for each thing in folder1.Files
									d2=thing.name
									d2s="/Members/Uface/"&d2
									IF zsoojs_u_pic=Add_Root_Dir(d2s) Then
										pc=" checked=""checked"""
										pd="��ѡͷ��"
									Else
										pc=""
										pd=""
									End IF
									IF Instr(d2,"Thumbs.db")=0 Then
										pStr=pStr&"<li onclick=""(this.childNodes[1].checked=true)""><a href='javascript:void(0)'><img src="""&Add_Root_Dir(d2s)&"""/></a><input type=""radio"" name=""sysFace"" value="""&d2s&""" "&pc&" />"&pd&"</li>"&vbcrlf
										pi=pi+1
									End IF
								Next
								Response.Write pStr
							  %>
							  
							  </ul>						
						</td>
					</tr>									
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="ueditpic.asp"><input type="submit" class="button btn-blue" value="ȷ��" /> <input type="button" class="button btn-gray" value="����" onclick="window.location='./'"  /></td>
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