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
<title>�����ϸ - �û����� - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">�����ϸ</h3>
					<div class="hr"></div>
				</div>			
				<table class="sitetable select-all-none">
					<tr><th width="38%"><%=G_jifen_jifen_name%></th>
						<th width="26%">���</th>
						<th>ʱ��</th>
						<th width="12%">֧��״̬</th>
					</tr>
					<%
					a=Bint(Request("a"))
					sql="Select Top 100 * From qingtiandy_zhifubao Where  uid="&zsoojs_id&" Order By Id Desc"
					Set oRs2=conn.Execute(sql)
					su=0
					IF Not oRs2.EOf Then
						Do While Not oRs2.Eof
							ouip=oRs2("uip")
							outime=oRs2("utime")
							osoojs_u_alipay_numb=oRs2("soojs_u_alipay_numb")
							osoojs_u_alipay_numb2=oRs2("soojs_u_alipay_numb2")
							su=su+oujifen
							ouflag=oRs2("uflag")
							IF ouflag="0" Then
								pouflag="<font color=red>δ����</font>"
							Else
								pouflag="<font color=blue>�Ѹ���</font>"
							End IF
						%>
							<tr>
								<td><%=osoojs_u_alipay_numb%></td>
								<td>��<%=osoojs_u_alipay_numb2%></td>
								<td width="24%"><%=outime%></td>
								<td><%=pouflag%></td>
							</tr>								
						<%	
							oRs2.MoveNext
						Loop
					Else
						Response.Write "<tr><td colspan=""3""><font color=""#FF0000"">����û�й��κ�����¼��<a href=""./j_tikuan.asp""><font color=""#0000FF"">����ȥ���>></font></a></font></td></tr>"
					End IF
					%>	
				</table>
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>