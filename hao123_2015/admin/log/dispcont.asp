<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<title>��̨����LOG��־</title> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head> 

<LINK href="../css/style.css" rel=stylesheet type=text/css>
<SCRIPT language=javascript>
function unselectall(){
    if(document.myform.chkAll.checked){
 document.myform.chkAll.checked = document.myform.chkAll.checked&0;
    }
}
function CheckAll(form){
  for (var i=0;i<form.elements.length;i++){
    var e = form.elements[i];
    if (e.Name != 'chkAll'&&e.disabled==false)
       e.checked = form.chkAll.checked;
    }
  }

</SCRIPT>
<% 
'on error resume next
if not isempty(request("selAnnounce")) then
	idlist=request("selAnnounce")
	if instr(idlist,",")>0 then
		dim idarr
		idArr=split(idlist)
		dim log_id
		for i = 0 to ubound(idarr)
			log_id=clng(idarr(i))
			call deleteannounce(log_id)
		next
	else
		call deleteannounce(clng(idlist))
	end if
end if 

page3=request("pag") 
if page3="" then page3=session("contpag") '��ҳ������ǰ��ҳ 
if page3="" then page3="1" 

pa=request("pa") 
if pa="" then pa=request("contpa") 'ÿҳ��ʾ�� 
if pa="" then pa=50 'Ĭ��ÿҳ��ʾ15����������� 
session("contpag")=page3 
session("contpa")=pa 
pages=pa 'ÿҳ��ʾ����***************����һ�γ�������ʵ�ַ�ҳ���� 

SQL="SELECT * FROM errlog order by -id" 
dim rs 
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.Open sql,conn,1,1 
if rs.eof then
	response.Write "û��¼"
	response.End()
end if
csi=0 
cs1=0 
cs100=0 
csdat1=0 

ZS=RS.RECORDCOUNT 
'*****************************************************����һ�γ������ڷ�ҳ��ʾ 
%>
<body style="font-size: 9pt">
<table cellpadding=2 cellspacing=1 border=0 width=98% class=tableBorder align=center>
<TR>
<TH class=tableHeaderText colSpan=2 height=25>��վ��ȫ��־����</TH>
<TR><tr><td valign=top class=bodytitle><table width="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>���� 
  <%Response.Write zs%>
  ����¼�������ǵ� 
  <%Response.Write page3%>
  ҳ [<a href="dispcont_web.asp">ˢ��] </a></td>
    <td><table border="0" cellpadding="0" style="font-size: 9pt"> 
<tr><td>ҳ��</td><%page2=1 
for i=1 to zs step pages 
if page3=cstr(page2) then 
%><td >[<%Response.Write page2%>]</td> 
<% else %> 
<td ><a href="?pag=<%Response.Write page2%>">[<%Response.Write page2%>]</a></td> 
<% end if 
page2=page2+1 
next 
sn=pages*(page3-1) '��ǰ��¼��=ÿҳ��ʾ��*ҳ��-ÿҳ��ʾ�� 
if sn>zs then sn=0 
rs.move sn,1 
'**********************************����һ�����ڷ�ҳ 
%> </tr></table></td>
  </tr>
</table></td>
</tr>
<tr align=center><td height=30>

<table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
 <Form name="form" method="POST" action=""> 
 <tr>
    <td width="5%" class="forumRowHighlight">ѡ��</td>
    <td width="8%" class="forumRowHighlight">���</td>
    <td width="12%" class="forumRowHighlight">�����ɣ�</td>
    <td width="15%" class="forumRowHighlight">����ʱ��</td>
    <td width="25%" class="forumRowHighlight">����ҳ��</td>
    <td width="10%" class="forumRowHighlight">�ύ��ʽ</td>
    <td width="15%" class="forumRowHighlight">�ύ����</td>
    <td width="15%" class="forumRowHighlight">�ύ����</td>
 </tr><% 
for i=1 to pages 
Response.Write "</tr>"
Response.Write "<td class=forumRow><input name='selAnnounce' type='checkbox' value='"&cstr(rs("id"))&"'></td>" 
Response.Write "<td class=forumRow>"&rs("id")&"</td>" 
Response.Write "<td class=forumRow>"&rs("Sqlin_IP")&"</td>" 
Response.Write "<td class=forumRow>"&rs("Sqlin_TIME")&"</td>" 
Response.Write "<td class=forumRow>"&rs("SqlIn_Web")&"</td>" 
Response.Write "<td class=forumRow>"&rs("SqlIn_FS")&" </td>"
Response.Write "<td class=forumRow>"&rs("SqlIn_CS")&" </td>"
Response.Write "<td class=forumRow>"&rs("SqlIn_SJ")&" </td>"
Response.Write "</tr>" 
rs.movenext 
if rs.eof then exit for 
next 
rs.close 
%>
	<tr><td class=forumrowHighLight colspan=10>��ѡ��Ҫɾ�����¼���<input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form)' value='checkbox'>ȫѡ <input type=submit name=act value=ɾ����־  onclick="{if(confirm('��ȷ��ִ�еĲ�����?')){this.form.submit();return true;}return false;}">
	</td>
	</tr>
	</form> 
</table>
</td>
</tr>
</table>
<% 
sub deleteannounce(log_id)
dim rs,sql
set rs=server.createobject("adodb.recordset")
sql="delete from [errlog] where id="&cstr(log_id)
conn.execute sql
End sub
%>
<br>
