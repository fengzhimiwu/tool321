<%
'��תҳ�棬�����������û�еĻ�����Ҫ�Լ��ֿ���������|||��ʶ
Dim t,str1,str2,str3,i,r,n,rr,tt
t=Trim(request("t")) '�����ַ���
r=Trim(request("r")) '��ת��URL��ַ
n=Trim(request("n")) '��ת�����֣�Ĭ���� ��һҳ
tt=StayNub(Trim(request("tt"))) '�Զ���ת����һҳ��ʱ�䣬Ĭ��Ϊ2��
Select Case t
	Case "1"
		str1="<font color=red>�Բ�������ʺ��Ѿ�������</font>"
	Case "2"
		str1="<font color=red>�Բ�������Ȩ�鿴�������ģ��</font>"
	Case "3"
		str1="<font color=red>�Բ�����û��ѡ��Ҫ���������⣬�����޸ġ�</font>"	
	Case "4"
		str1="����ɹ�����ת�� <a href='qingtiandh_type1/index.asp'><font color=blue>��������б�</font></a> ||| <a href='qingtiandh_type1/edit.asp'>��������</a>"
	Case "4_error"
		str1="<font color=red>������Ѿ�����!</font>����ת�� <a href='qingtiandh_type1/index.asp'><font color=blue>��������б�</font></a>"	
	Case "5"
		str1="����ɹ�����ת�� <a href='qingtiandh_type2/index.asp'><font color=blue>������������б�</font></a> ||| <a href='qingtiandh_type2/edit.asp'>��������</a>"
	Case "5_error"
		str1="<font color=red>������Ѿ�����!</font>����ת�� <a href='qingtiandh_type2/index.asp'><font color=blue>������������б�</font></a>"
	Case "7"
		str1="����ɹ�����ת�� <a href='qingtiandh_List/index.asp'><font color=blue>��վ�б�</font></a> ||| <a href='qingtiandh_List/edit.asp'>�������վ</a>"
	Case "7_error"
		str1="<font color=red>����վ�Ѿ�����!</font>����ת�� <a href='qingtiandh_List/index.asp'><font color=blue>��վ�б�</font></a>"		
	Case Else
		str1="δ֪����"
End Select
str2=split(str1,"|||")
For i=0 To Ubound(str2)
	IF Trim(str2(i))<>"" Then
		str3=str3&"<tr class='forumRow' height='25'><td>�� "&str2(i)&"</td></tr>"&vbcrlf
	End IF	
Next
IF r<>"" Then
	rr=r
Else
	rr=request.ServerVariables("HTTP_REFERER")
End IF

IF rr<>"" Then
	IF n="" Then
		str3=str3&"<tr class='forumRow' height='25'><td>�� <a href='"&rr&"'><font color=blue>��һҳ</font></td></tr></a>"
	Else
		str3=str3&"<tr class='forumRow' height='25'><td>�� <a href='"&rr&"'><font color=blue>"&n&"</font></td></tr></a>"
	End IF
	IF tt<>"" Then
		str3=str3&"<meta http-equiv=""Refresh"" content="""&tt&";URL="&rr&""">"
	End IF
End IF
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=G_WebName%> - ����Ա����</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="98%"  class="tableBorder"cellpadding="2" cellspacing="1" border="0">
	<tr>
	<th align="center" class="tableHeaderText" height=25>������ʾ </th>
	</tr>
	
	<%=str3%>
	<!--<tr class="forumRow"  height="25"><td nowrap>�� <a href='javascript:window.opener=null;window.close()'>�رմ���</a></td></tr>-->
</table>
<%
	Function StayNub(ContentStr)
	 IF ContentStr="" or isNUll(ContentStr) Then
		StayNub=""
		Exit Function
	 End IF
	 Dim ClsTempLoseStr,regEx
	 ClsTempLoseStr = Cstr(ContentStr)
	 Set regEx = New RegExp
	 regEx.Pattern = "[^\d]*"
	 regEx.IgnoreCase = True
	 regEx.Global = True
	 ClsTempLoseStr = regEx.Replace(ClsTempLoseStr,"")
	 StayNub = ClsTempLoseStr
	End Function
%>
</body>
</html>