<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title>������ϸ</title>
<script src="../js/mouse_on_title.js"></script>
<script src="../js/p_js.js"></script>
<link id="css" href="../inc/moni/dv_wnd.css" type="text/css" rel="stylesheet">
<script language="javascript" src="../inc/moni/dv_wnd.js" type="text/javascript"></script>
<script>
function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall' )
       e.checked = form.chkall.checked;
    }
  }
function setCookie(name, value) {
    var expdate = new Date();
    var argv = setCookie.arguments;//�������
    var argc = setCookie.arguments.length;//�������ĳ���
    var expires = (argc > 2) ? argv[2] : 1;//���쳤����
    var path = (argc > 3) ? argv[3] : "/";
    var domain = (argc > 4) ? argv[4] : null;
    var secure = (argc > 5) ? argv[5] : false;
    if(expires!=null){
        expdate.setTime(expdate.getTime() + ( expires*24*60*60*1000 )); //�Ѵ������ñ����������
	}
    document.cookie = name + "=" + escape (value)
    +((expires == null) ? "" : ("; expires="+ expdate.toGMTString()))
    +((path == null) ? "" : ("; path=" + path))
    +((domain == null) ? "" : ("; domain=" + domain))
    +((secure == true) ? "; secure" : "");
}

</script>
</head>
<body>
<%
	
	s_page=""
	IF request.Cookies("page_n")="" then
		msg_per_page=20
	else
		msg_per_page=Cint(request.Cookies("page_n"))
	end if
	kSql_where="id>0"
	kSql_order="id desc"
	sDesc=Trim(Request("desc"))
	IF sDesc<>"" Then  kSql_order=sDesc
	sId=Bint(Request("id"))
	sa=Bint(Request("a"))
	
	IF sa<>0 Then
		kSql_where=kSql_where&" And Utype="&sa
	End IF
	IF sId<>0 Then
		kSql_where=kSql_where&" And Uid="&sId
	End IF
	
	IF G_IS_SQL_User_DB="1" Then
		kSql_where=kSql_where&" and datediff(day,Utime,getdate())<=30 "
	Else
		kSql_where=kSql_where&" and datediff('d',Utime,'"&now()&"')<=30 "
	End IF	
	
	sql="Select 1000 * from qingtiandy_jifen_ip Where "&kSql_where&" order by id desc"
	
	'Response.Write sql
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1 
	s_page="?id="&sId
%>

<!--#include file="../inc/headpage.asp"-->
<table width="98%" border="0" cellspacing="1" cellpadding="1"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>�û�����ѡ��</th>
	</tr>
	
	<tr> 
		<td width="12%" height=25 class="forumRowHighlight">
		�û�ID:<%=sId%>
		</td>
	  <td width="88%" height=25 class="forumRowHighlight">
	  [<a href="editindex.asp?a=0&id=<%=sId%>">�ܻ���</a>]
	  [<a href="editindex.asp?a=1&id=<%=sId%>">ע��</a>]
	  [<a href="editindex.asp?a=3&id=<%=sId%>">��½</a>]
	  [<a href="editindex.asp?a=2&id=<%=sId%>">�ƹ�</a>]
	  [<a href="editindex.asp?a=4&id=<%=sId%>">�ҽ�</a>]
	  [<a href="editindex.asp?a=7&id=<%=sId%>">���</a>]
	  [<a href="editindex.asp?a=5&id=<%=sId%>">��ֵ</a>]
	  <%IF Bint(G_jifen_lailu)<>0 Then%>
	  [<a href="editindex.asp?a=6&id=<%=sId%>">����</a>]
	  <%End IF%>
	  <%IF Bint(G_jifen_lailu_out)<>0 Then%>
	  [<a href="editindex.asp?a=61&id=<%=sId%>">���</a>]
	  <%End IF%>	  
	

	
	  <%IF G_xiaxian_1="1" And G_xiaxian_1_zhuye="1" And G_xiaxian_zhuye_1a="1" Then%>
	  [<a href="editindex.asp?a=13&id=<%=sId%>">������Ϊ��ҳ����</a>]
	  <%End IF%>	
	  <%IF G_xiaxian_1="1" And G_xiaxian_1_zhuye="1" And G_xiaxian_zhuye_2a="1" Then%>
	  [<a href="editindex.asp?a=14&id=<%=sId%>">���ߵ�½��ҳ����</a>]
	  <%End IF%>
	  <%IF G_xiaxian_2="1"  Then%>
	  [<a href="editindex.asp?a=15&id=<%=sId%>">��������ȡ����</a>]
	  <%End IF%>	  	      	    
	  </td>
	</tr>		
	</form>
</table>
<Form name="search" method="post" action="index.asp">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th width="88%" height=25 class="tableHeaderText"><a href='?'><font color="#FFFFFF"><%=Get_qingtiandy_jifen_ip_Name(sId,sa)%>��ϸ</font></a></th>	
        <th width="12%" height=25 class="tableHeaderText" align="right">
	<select name="pp_page" onChange="setCookie('page_n',this.options[this.selectedIndex].value,30);location.href='index.asp'">
	<option value="">��ѡ��ҳ��</option>
	<option value="10">10</option>
	<option value="15">15</option>
	<option value="20">20</option>
	<option value="30">30</option>
	<option value="50">50</option>
	<option value="100">100</option>
	<option value="200">200</option>
	<option value="300">300</option>
	<option value="500">500</option>
	</select>		
	  </th>
	<tr> 
	<tr>
		<td colspan="2"> 
  			<TABLE width="100%" border="0" cellpadding="0" cellspacing="1">
			<TR height=25>			
				<TD width="29%"   class=bodytitle><font color="#CC3300"><b><%=G_jifen_jifen_name%>����� </b></font></TD>
				<TD width="28%"    class=bodytitle><font color="#CC3300"><b>ip</b></font></TD>
			    <TD width="22%"    class=bodytitle><font color="#CC3300"><b>ʱ��</b></font></TD>
			    <TD width="13%"    class=bodytitle><font color="#CC3300"><b><%=G_jifen_jifen_name%></b></font></TD>
		      <TD width="8%"   align="center" class=bodytitle><font color="#CC3300"><b>�û�ID</b></font></td>
			</TR>					
			<%
			do while not rs.eof and rowcount > 0
				ouip=rs("uip")
				outime=ForMatDate(rs("utime"),66)
				outype=rs("utype")
				oujifen=rs("ujifen")
				oujifen_name=Get_qingtiandy_jifen_ip_Name(zsoojs_id,outype)
				su=su+oujifen
				'oipCounty=Disp_IPAddressData(ouip,2)	
				ouid=rs("uid")		
			%>	
			<tr height="20">
			<td nowrap="nowrap" class="forumRow"><%=oujifen_name%></td>
			<td nowrap="nowrap" class="forumRow"><%=ouip%></td>
			<td nowrap="nowrap" class="forumRow"><%=outime%></td>
			<td nowrap="nowrap" class="forumRow"><%=oujifen%></td>
			<TD  align="center" class=forumRow><a href="../qingtiandy_jifen_product/uindexzhifu_form.asp?id=" target="_blank"><%=ouid%></a></td>
			</tr>		
<%
	icolor=icolor+1
	if icolor>1 then icolor=0
	rowcount=rowcount-1
	rs.moveNext()
	Loop
	
%>						
			</TABLE>	
		</td>
	</tr>
	<tr align="center">
		<td class="forumrowHighLight" colspan="2"><%=listPages(s_page)%></td>
	</tr>	
</table>
</Form>


</body>
</html>