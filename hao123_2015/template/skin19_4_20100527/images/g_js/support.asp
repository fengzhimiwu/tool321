<!--#include file="../../../../p_inc/Include_func.asp"-->
<!--#include file="../../../../p_inc/openconn.asp"-->
<%
IF Not ChkPost() Then
	response.Redirect "http://www.qingti"&"anc"&"ms.com"
	response.End()
End IF
'1:��ַ�쳣�ٱ� 2:��
m_type=Bint(Request.Form("m_type")) '
m_turnurl=Replace_Text(Request.Form("m_turnurl")):IF Instr(m_turnurl,"http://")>0 Then Response.End()
sitename=Replace_Text(Request.Form("sitename")) '��վ����
siteurl=Replace_Text(Request.Form("siteurl")) '��վ��ַ
email=Replace_Text(Request.Form("email")) '��ϵ����
reason=Replace_Text(Request.Form("reason"))
intro=Replace_Text(Request.Form("intro"))
mmore=Replace_Text(Request.Form("mmore"))

IF m_type=1 Then
	Info=""
	IF sitename<>"" Then Info=Info&"��վ����:"&sitename&"<br>"
	IF siteurl<>"" Then Info=Info&"��վ��ַ:"&siteurl&"<br>"
	IF reason<>"" Then Info=Info&"����ԭ��:"&reason&"<br>"
	IF email<>"" Then Info=Info&"��ϵ����:"&email&"<br>"
	Info=Info&"����˵��:"&intro&"<br>"
ElseIF m_type=3 Then
	Info="����˵��:"&intro&"<br>"
End IF

datee=FormatDate(now,55)
ip=getIP()
gb_jiange=request.cookies("gbook")("add")
Dim temp_jg
temp_jg=DateDiff("s",gb_jiange,now())

IF trim(Info)<>"" Then
	IF temp_jg<30 Then
		response.Write "�����ύ��̫Ƶ��������"&Cint(30-temp_jg)&"�����ſ��Է�����һ��лл��"
	Else
		Dim ss_sql
		ss_sql="select * from qingtiandy_gbook"
		Set ss_rs=server.CreateObject(G_RS)
		ss_rs.open ss_sql,conn,1,3
		ss_rs.addnew
		ss_rs("g_m_name")="����"
		ss_rs("g_m_content")=Info
		ss_rs("g_ip")=ip
		ss_rs("g_m_date")=datee
		ss_rs("g_type")=m_type
		ss_rs.update
		Response.cookies("gbook")("add")=now()'���Լ��
	End IF
	IF mmore<>"" Then
		Response.Redirect "../../../../p_inc/turnto.asp?u="&m_turnurl
	Else
		Response.Redirect "../../../../p_inc/turnto.asp?u="&url_(Array("one",m_turnurl))
	End IF
End IF
%>