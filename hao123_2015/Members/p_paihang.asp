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
<title>����Ӯ�����а� - �û����� - <%=G_WEBNAME%></title>
</head>
<body>
<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">����Ӯ������</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 gray">
					<a href="./p_paihang.asp?v=310&amp;times=30">310����������</a>&nbsp;
					<a href="./p_paihang.asp?v=310&amp;times=7">310����������</a>&nbsp;
					<a href="./p_paihang.asp?v=310&amp;times=1">310����������</a>&nbsp;
					<a href="./p_paihang.asp?v=28&amp;times=30">����28������</a>&nbsp;
					<a href="./p_paihang.asp?v=28&amp;times=7">����28������</a>&nbsp;
					<a href="./p_paihang.asp?v=28&amp;times=1">����28������</a>&nbsp;	
					<a href="./p_paihang_all.asp"><%=G_jifen_jifen_name%>������</a>&nbsp;
				</div>			
				<%
				k_v=Request("v")
				
				IF k_v="310" Then 
					k_v_str="310����"
				ElseIF k_v="28" Then
					k_v_str="����28"
				Else
					k_v="310"
					k_v_str="310����"
				End IF
				
				k_times=Replace(Request("times"),"'","")
				k_times=Bint(k_times)
				IF k_times=1 Then
					k_times_str="����"&G_jifen_jifen_name&"����"
				ElseIF k_times=7 Then
					k_times_str="����"&G_jifen_jifen_name&"����"
				ElseIF k_times=30 Then
					k_times_str="����"&G_jifen_jifen_name&"����"
				Else
					k_times=1
					k_times_str="����"&G_jifen_jifen_name&"����"
				End IF
				
				
				tFlag=True
				IF tFlag Then
				%>
				<table class="sitetable select-all-none">
					<tr>
						<th width="20%">���</th>
						<th width="20%">�û���</th>
						<th width="30%"><%=k_v_str%> - <%=k_times_str%></th>
						<th width="30%">��<%=G_jifen_jifen_name%></th>
					</tr>
					<%
					a=Bint(Request("a"))
					sql="Select top 50 Sum(ujifen),Uid From qingtiandy_jifen_ip Where id>0"
					IF k_v="310" Then
						IF G_IS_SQL_User_DB="1" Then
							sql_1=sql_1&" And utype=9 and datediff(d,utime,getdate())<="&k_times
						Else
							sql_1=sql_1&" And utype=9 and datediff('d',utime,'"&now()&"')<="&k_times
						End IF	
						sql=sql&sql_1
						sql=sql&" Group By Uid having Sum(ujifen)>0  order by 1 desc"	
					Else
						IF G_IS_SQL_User_DB="1" Then
							sql_1=sql_1&" And utype=19 and datediff(d,utime,getdate())<="&k_times
						Else
							sql_1=sql_1&" And utype=19 and datediff('d',utime,'"&now()&"')<="&k_times
						End IF	
						sql=sql&sql_1
						sql=sql&" Group By Uid having Sum(ujifen)>0  order by 1 desc"						
					End IF				
					Set oRs2=conn.Execute(sql)
					si=1
					Do While Not oRs2.Eof
						oujifen_sum=oRs2(0)
						oUid=oRs2(1)
						Set oRs3=Conn.Execute("Select soojs_u_name,soojs_jifen From soojs_un Where id="&oUid)
						IF Not oRs3.Eof Then
							osoojs_u_name=Get_x_user_x(oRs3(0))
							osoojs_jifen=oRs3(1)
						Else
							osoojs_u_name=Get_x_user_x(oUid)
							osoojs_jifen="-"
						End IF
						oRs3.close
					%>
						<tr>
							<td><%=si%></td>
							<td><%=osoojs_u_name%></td>
							<td><%=oujifen_sum%></td>
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