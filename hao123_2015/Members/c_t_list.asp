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
<title>�ҵķ����б� - �û����� - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">�ҵķ����б�</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 gray">
					<a href="./c_t_add.asp">����·���</a>
				</div>
				<table class="sitetable select-all-none">
					<tr>
					  	<th>������</th>
						<th>����</th>
					</tr>
					<%
					Set oRs2=conn.Execute("Select * From qingtiandy_curl Where c_uid="&Request.Cookies(G_u_Cookies)("soojs_id")&" Order by id Desc")
					Do While Not oRs2.Eof
						oid=oRs2("id")
						oc_typename=oRs2("c_typename")
						oc_no=oRs2("c_no")
					%>
						<tr>
							<td width="70%"><a href="c_l_list.asp?t=<%=oid%>"><%=oc_typename%></a></td>
							<td>
								<a href="./c_t_add.asp?id=<%=oid%>">�޸�</a> - 
								<a href="./regok.asp?id=<%=oid%>&action=c_t_del" onclick="return confirm('ȷ��ɾ����');">ɾ��</a>
							</td>
						</tr>								
					<%	
						oRs2.MoveNext
					Loop
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