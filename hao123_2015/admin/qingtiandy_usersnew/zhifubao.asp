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
<title>֧����������</title>
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
		msg_per_page=10
	else
		msg_per_page=Cint(request.Cookies("page_n"))
	end if
	kSql_where="id>0"
	kSql_order="soojs_time desc,id desc"
	sDesc=Trim(Request("desc"))
	IF sDesc<>"" Then  kSql_order=sDesc
	
	
	zm_name=Replace_Text_2008(Request("m_name"))
	IF zm_name<>"" Then kSql_where=kSql_where&" And (soojs_u_alipay like '%"&zm_name&"%')"

	sql="Select * from qingtiandh_zhifubaopb Where "&kSql_where&" Order by "&kSql_order
	
	Set rs=server.CreateObject(G_RS)
	rs.open sql,conn,1,1 
	s_page="?soojs_status="&zsoojs_status&"&desc="&server.URLEncode(desc)&"&m_name="&server.URLEncode(m_name)
%>
<!--#include file="../inc/headpage.asp"-->
<table width="98%" border="0" cellspacing="1" cellpadding="1"  align=center class="tableBorder">
	<tr> 
		<th class="tableHeaderText" colspan=2 height=25>�û�����ѡ��</th>
	</tr>
	<FORM name=form action="zhifubao.asp" method=get>
	<tr>
		<td width="12%" height=25 class="forumRowHighlight">
		<B>�������ѡ��</B></td>
		<td width="88%" class=forumRowHighlight>
		<DIV id="showTemplet">
			<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="templet">
				<tr>
					<td>				
						<select name="desc">
							<option value="" selected="selected">Ĭ������</option>
							<option value="soojs_time asc" selected="selected">���ʱ������</option>
							<option value="soojs_time desc" selected="selected">���ʱ�併��</option>
							<option value="id desc">ID����</option>
							<option value="id asc">ID����</option>
						</select>
						֧������
						<input type = "Text" name = "m_name" style="width:200px;"> </td>
				</tr>
			</table>
		</DIV>
	  </td>
	</tr>	
	<tr> 
		<td width="12%" height=25 class="forumRowHighlight"></td>
	  <td width="88%" height=25 class="forumRowHighlight">
	  <input type="submit" value="���̲���" id="submit" name="submit" style="cursor:hand;">����
	  [<a href="javascript:location.reload()">ˢ��ҳ��</a>]
	  [<a href="zhifubaoedit.asp">���</a>]
	  </td>
	</tr>		
	</form>
</table>
<Form name="search" method="post" action="index.asp">
<input type="hidden" name="Action" value="">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
	<tr>
		<th width="88%" height=25 class="tableHeaderText"><a href='?'><font color="#FFFFFF">ȫ��������</font></a></th>	
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
				<TD width="5%"   class=bodytitle><font color="#CC3300"><b>ID </b></font></TD>
				<TD    class=bodytitle><font color="#CC3300"><b>�������б�</b></font></TD>
				<TD width="13%"   class=bodytitle><font color="#CC3300"><b>���ʱ��</b></font></TD>
				<TD width="8%"   class=bodytitle><font color="#CC3300"><b>����ѡ��</b></font></TD>
			  <TD width="7%"   align="center" class=bodytitle><INPUT onclick=CheckAll(this.form) type=checkbox value=on name=chkall><input type="button" name="btnSubmit" value="ɾ"  onClick="{if(confirm('��ȷ��Ҫɾ����\nɾ�������ٻָ���')){;this.form.Action.value='Del';this.form.action='zhifubaoedit.asp?Action=Del';this.form.submit();return true;}return false;}"></td>
			</TR>					
<%
do while not rs.eof and rowcount > 0
	nId=rs("id")
	nsoojs_u_alipay=rs("soojs_u_alipay")
	nsoojs_time=rs("soojs_time")
%>	
			<tr height="20">
			<td nowrap="nowrap" class="forumRow"><a href="../qingtiandy_jifen_product/uindexzhifu_form.asp?id=<%=nId%>" target="_blank"><%=nId%></a></td>
			<td nowrap="nowrap" class="forumRow"><%=nsoojs_u_alipay%></td>
			<td nowrap="nowrap" class="forumRow">
			  <%IF ForMatDate(nsoojs_time,5)=ForMatDate(now(),5) Then response.Write "<font color=red>"&ForMatDate(nsoojs_time,55)&"</font>" Else response.Write ForMatDate(nsoojs_time,55) %></td>
			<td class="forumRow">
			<a href='zhifubaoedit.asp?id=<%=nId%>'><img src="../images/admin_top_icon_5.gif" border="0" title="�༭"></a>
			<a href='zhifubaoedit.asp?Id=<%=nId%>&Action=Del' onclick='{if (confirm("��ȷ��Ҫɾ����\nɾ�������ٻָ���")){return true;}return false;}'><img src="../images/cha.gif" border="0" title="ɾ�����û�"></a>			</td>
			<TD  align="center" class=forumRow><input type=checkbox name=id value="<%=nId%>"></td>
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


<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = form;")
		WriteLn("	with(oForm){")
		WriteLn("		m_name.value='" & Str4Js(zm_name) & "';")
		WriteLn("		desc.value='" & Str4Js(sDesc) & "';")
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
	End Function
</SCRIPT>	
<%
	ShowInfo sId

	rs.Close:Set rs = Nothing
	CloseConn()
%>
</body>
</html>