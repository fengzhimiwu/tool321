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
<title>�ҵ����� - �û����� - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">�ҵ������û�</h3>
					<div class="hr"></div>
				</div>			
				<%
				tFlag=False
				IF G_mingxi_look_Flag Then
					tFlag=True
				Else
					IF Bint(Request("a"))=5 Then
						tFlag=True
					End IF
				End IF
				IF tFlag Then
				
				%>
				<table class="sitetable select-all-none">
					<tr><th>����ID</th>
						<th>ע��ʱ��</th>
						<th>����¼ʱ��</th>
					</tr>
					<%
					sql="Select Top 100 * From soojs_un Where  soojs_u_xiaxian='"&Request.Cookies(G_u_Cookies)("soojs_id")&"'  Order By Id Desc"
					
					Set oRs2=conn.Execute(sql)
					su=0
					Do While Not oRs2.Eof
						oid=oRs2("id")
						osoojs_date=ForMatDate(oRs2("soojs_date"),66)
						osoojs_lastdate=ForMatDate(oRs2("soojs_lastdate"),66)
					%>
						<tr>
							<td width="22%"><%=oid%></td>
							<td width="21%"><%=osoojs_date%></td>
							<td width="21%"><%=osoojs_lastdate%></td>

						</tr>								
					<%	
						oRs2.MoveNext
					Loop
					%>	
				</table>
				<%Else%>
				<table class="sitetable select-all-none">
					<tr><td colspan="3"><font color="#FF0000">��������,����<a href="./"><font color="#0000FF">������ҳ</font></a></font></td></tr>
				</table>
				<%End IF%>
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>