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
<title><%=G_jifen_jifen_name%>������ - �û����� - <%=G_WEBNAME%></title>
</head>
<body>
<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl"><%=G_jifen_jifen_name%>������</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 gray">

					<a href="./p_paihang_all.asp"><%=G_jifen_jifen_name%>������</a>&nbsp;
				</div>			
				<%
				
				tFlag=True
				IF tFlag Then
				%>
				<table class="sitetable select-all-none">
					<tr>
						<th width="20%">���</th>
						<th width="20%">�û���</th>
						<th width="30%">��<%=G_jifen_jifen_name%></th>
					</tr>
					<%
					sql="Select top 50 soojs_u_name,soojs_jifen From soojs_un Where soojs_jifen>0 order by soojs_jifen Desc,Id Desc"				
					Set oRs2=conn.Execute(sql)
					si=1
					Do While Not oRs2.Eof
						osoojs_u_name=Get_x_user_x(oRs2(0))
						osoojs_jifen=oRs2(1)
					%>
						<tr>
							<td><%=si%></td>
							<td><%=osoojs_u_name%></td>
							<td><%=osoojs_jifen%></td>
						</tr>								
					<%	
						si=si+1
						oRs2.MoveNext
					Loop
					oRs2.close()
					%>	
				</table>
				<%Else%>
				<table class="sitetable select-all-none">
					<tr><td colspan="3"><font color="#FF0000">��ʱ��������ϸ�鿴,����<a href="./"><font color="#0000FF">������ҳ</font></a></font></td></tr>
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