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
<title>�ƹ�ϵͳ���� - �û����� - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">�ƹ�ϵͳ����</h3>
					<div class="hr"></div>
				</div>		
				<table class="sitetable select-all-none">
					<tr><th width="30%">�û���</th>
						<th width="36%">��������</th>
						<th width="34%">�ƹ���Ч��Ա��</th>
					</tr>
					<%
					a=Trim(Replace(request("a"),"'",""))
					
					Set Rs=Server.CreateObject("ADODb.Recordset")
					Sql="Select * From soojs_un where soojs_u_tuiguang_numb>0 "
					
					Sql=Sql&" Order By soojs_u_tuiguang_numb Desc,Id Desc"	
					
					
					Rs.Open Sql,Conn,1,1
					
					Rs.pagesize=20
					Pgsize = Rs.pagesize
					RecordNum=Rs.RecordCount
					Pagenum=Rs.PageCount
					
					CurrentPage=Clng(Bint(Request("page")))
					if CurrentPage="" or IsNull(CurrentPage) or CurrentPage=0 or  not(IsNumeric(CurrentPage)) then
						CurrentPage=1
					End if	
					if RecordNum=-1 then
					   RecordNum=0
					End if
					
					ss=CurrentPage mod (Pgsize\4)
					If ss = 0 then ss = Pgsize\4
					If CurrentPage <= Pgsize\4 then ss = CurrentPage - 1
					iStart = CurrentPage - ss
					iEnd = CurrentPage + Pgsize\4 - ss
					If iEnd >= Pagenum then iEnd = Pagenum
					
					If CurrentPage>1 then
						Pager = Pager &  "<a href='?page="&(CurrentPage-1)&"' class=""list"" >[��һҳ]</a> "
					Else
						Pager = Pager &  "[��һҳ] "
					End if
					For i = iStart To iEnd
						If i = clng(CurrentPage) then
							Pager = Pager &  "<font color=red >["&i&"]</font> "
						Else
							Pager = Pager &  "<a href='?page="&i&"' class=""list"" >["&i&"]</a> "
						End if
					Next
					If clng(Pagenum)>clng(CurrentPage) then
						Pager = Pager &  "<a href='?page="&(CurrentPage+1)&"' class=""list"" >[��һҳ]</a> "
					Else
						Pager = Pager &  "[��һҳ] "
					End if
					
					PageInfo="��ǰ�ڵ� <font color=red>"& CurrentPage &"</font> ҳ ���� <font color=red>"& Pagenum &"</font> ��ҳ�� ���� <font color=red>"& RecordNum &"</font> ����¼"
					NN=0		
					
					If Not Rs.Eof then
					
						Rs.AbsolutePage = CurrentPage
						Do While Not Rs.Eof and NN<Pgsize
							osoojs_u_name=Rs("soojs_u_name")
							osoojs_date=Rs("soojs_date")
							osoojs_u_tuiguang=GetRp(Rs("soojs_u_tuiguang"))
							osoojs_jifen=Rs("soojs_jifen")
							osoojs_lastdate=Rs("soojs_lastdate")
							IF osoojs_u_tuiguang="1" Then
								osoojs_u_tuiguang_txt="��Ч"
							Else
								osoojs_u_tuiguang_txt="<font color=red>��Ч</font>"
							End IF
							oId=Rs("Id")
							oAll_1=0
							Set oRs3=Conn.Execute("Select Count(*) From qingtiandy_renwu_jilu Where uid="&oId&" And l_status=1")
							IF Not oRs3.Eof Then
								oAll_1=Bint(oRs3(0))
							End IF
							osoojs_u_tuiguang_numb=Bint(Rs("soojs_u_tuiguang_numb"))
					%>
						<tr>
							<td><%=osoojs_u_name%></td>
							<td><%=osoojs_jifen%></td>
							<td><%=osoojs_u_tuiguang_numb%></td>
						</tr>								
					<%	
							NN=NN+1
							Rs.MoveNext
						Loop
					End IF
					%>	
					<tr><td colspan="3"><%=PageInfo%> <%=Pager%></td></tr>
				</table>
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>