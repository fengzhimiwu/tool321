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
<title>�ҵ��ղ��б� - �û����� - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">�ҵ��ղ��б�</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 gray">
					<a href="./c_l_add.asp">������ղ�</a> | 
					<a href="./c_l_list.asp">ȫ���ղ��б�</a> |
					<%
					Set oRs2=conn.Execute("Select * From qingtiandy_curl Where c_uid="&Request.Cookies(G_u_Cookies)("soojs_id")&" Order by id Desc")
					Do While Not oRs2.Eof
						oid=oRs2("id")
						oc_typename=oRs2("c_typename")
						oc_no=oRs2("c_no")
						Response.Write "<a href='?t="&oid&"'>"&oc_typename&"</a> | "
						oRs2.MoveNext	
					Loop
					%>					
				</div>
				<table class="sitetable select-all-none">
					<tr>
					  	<th>��վ</th>
						<th>����</th>
						<th>�Ƿ���</th>
						<th>Ȩ��</th>
						<th>����</th>
					</tr>
					<%
					t=Replace(Request("t"),"'","")
					t=Bint(t)
					IF t<>0 Then
						Sql="Select * From qingtiandy_listurl Where list_uid="&Request.Cookies(G_u_Cookies)("soojs_id")&" And list_type1="&t&" Order by list_no Desc, id Desc"
					Else
						Sql="Select * From qingtiandy_listurl Where list_uid="&Request.Cookies(G_u_Cookies)("soojs_id")&" Order by list_no Desc, id Desc"
					End IF
					Set oRs2=conn.Execute(Sql)
					Do While Not oRs2.Eof
						oid=oRs2("id")
						olist_url=oRs2("list_url")
						olist_name=oRs2("list_name")
						olist_gx=oRs2("list_gx")
						IF olist_gx="1" Then
							zolist_gx="<font color=blue>����</font>"
						Else
							zolist_gx="������"
						End IF
						olist_type1=oRs2("list_type1")
						oplist_url=IIf(Instr(olist_url,"http://")>0,olist_url,"http://"&olist_url)
						olist_no=oRs2("list_no")
					%>
						<tr>
							<td width="48%"><a href="../p_inc/Turnto.asp?u=<%=oplist_url%>" target="_blank"><%=olist_name%></a></td>
							<td width="18%"><%=Get_curl_type1(olist_type1)%></td>
							<td width="10%"><%=zolist_gx%></td>
							<td width="8%"><%=olist_no%></td>
							<td>
								<a href="./c_l_add.asp?id=<%=oid%>">�޸�</a> - 
								<a href="./regok.asp?id=<%=oid%>&action=c_l_del" onclick="return confirm('ȷ��ɾ����');">ɾ��</a>							</td>
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