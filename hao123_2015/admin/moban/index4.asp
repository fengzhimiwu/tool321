<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->

<%

Dim Path,FileName,EditFile,FileContent,Result,strShowErr
Result = Request.Form("Action")
t1=request("t1")
t3=request("t3")
IF t3="" Then
	t3=t3&"�ļ�"
ELse
	t3=t3&"ģ��"
End IF
Path = t1
FileName = t2
EditFile = Server.MapPath(Add_Root_Dir(Path))
Dim FsoObj,FileObj,FileStreamObj
Set FsoObj = Server.CreateObject(G_FSO)
Set FileObj = FsoObj.GetFile(EditFile)
if Result = "" then
	Set FileStreamObj = FileObj.OpenAsTextStream(1)
	if Not FileStreamObj.AtEndOfStream then
		FileContent = server.HTMLEncode(FileStreamObj.ReadAll)
	else
		FileContent = ""
	end if
else
	Set FileStreamObj = FileObj.OpenAsTextStream(2)
	FileContent = Request.Form("ConstContent")
	FileStreamObj.Write FileContent
	if Err.Number <> 0 then
		strShowErr = "<li>����ʧ��</li><li>"& Err.Description &"</li><li>�����Ǵ��ļ�û��д��Ȩ�ޣ��뿪��</li>"
		Response.Redirect("../qingtiancms.com.er.asp?ErrCodes="&Server.URLEncode(strShowErr)&"&ErrorUrl=")
		Response.end
	else
		strShowErr = "<li>"&t3&"����ɹ�</li>"
		Response.Redirect("../qingtianc"&"m"&"s.co"&"m.succ"&"e"&"ss.asp?ErrCodes="&Server.URLEncode(strShowErr)&"&ErrorUrl=&c=back")
		Response.end
	end if
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title><%=t3%>�༭</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table border="0" width="100%" cellpadding="2" cellspacing="1" height="130" class="border">
  <tr bgcolor="#39867B"> 
    <th height="25" colspan="2" nowrap> <%=t3%>�༭</td>
  </th>

  <form method="POST" action="" name="basic">
    <tr>
      <td  height=23 class="forumRow" colspan="2">
	  <textarea name="ConstContent" rows="30" style="width:99%;WORD-BREAK: break-all;WORD-WRAP: break-word"><% = FileContent %></textarea>
	  </td>
    </tr>


    <tr > 
      <td  height=23 class="forumRow">��</td>
      <td  height=23 class="forumRow"><font size="2"> 
          <input type="Button" name="Submit" value=" ���� " onClick="{if(confirm('ȷ�ϱ�����\n��ȷ�����޸ĵ�ȷ������!!!\n��������վ�㽫�޷���������!!!')){this.document.basic.submit();return true;}return false;}"/>
          <input type="reset" name="Submit2" value=" ���� " />
          <input name="Action" type="hidden" id="Action" value="Save">
        </font></td>
    </tr>
  </form>
</table>
</body>

</html>