<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
Dim Path,FileName,EditFile,FileContent,Result,strShowErr
Result = Request.Form("Action")
t1=request("t1")
t3=request("t3")
t2=request("auto")
IF t3="" Then
	t3=t3&"�ļ�"
ELse
	t3=t3&"ģ��"
End IF
Path = t1
FileName = t2
EditFile = Server.MapPath(Add_Root_Dir(Path))
IF LostNoSaveFile(EditFile) Then
Else
	response.Write "<script>alert('�ú�׺�ļ���Ϊ����ȫ�ļ�');history.back(-1)</script>"
	response.End()
End IF
		
Dim FsoObj,FileObj,FileStreamObj
Set FsoObj = Server.CreateObject(G_FSO)
Set FileObj = FsoObj.GetFile(EditFile)
if Err.Number <> 0 then
	IF t2=1 Then
		IF LostNoSaveFile(EditFile) Then
			Set fso=Server.CreateObject(G_FSO)
			Set f=fso.CreateTextFile(EditFile,true)	
		Else
			response.Write "<script>alert('�ú�׺�ļ���Ϊ����ȫ�ļ�');history.back(-1)</script>"
			response.End()
		End IF	
	Else
		response.Write "<script>alert('���ļ�������');history.back(-1)</script>"
		response.End()
	End IF
End IF
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
		Response.Redirect("../qingtiancms"&".co"&"m.su"&"ccess.asp?ErrCodes="&Server.URLEncode(strShowErr)&"&ErrorUrl=&c=back")
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
  <script>
 function rechange(){
 $("re").value=$("oresult").value.replace(/document.writeln\("/g,"").replace(/"\);/g,"").replace(/\\\"/g,"\"").replace(/\\\'/g,"\'").replace(/\\\//g,"\/").replace(/\\\\/g,"\\")
 }
 function change(){
 $("oresult2").value="document.writeln(\""+$("osource").value.replace(/\\/g,"\\\\").replace(/\//g,"\\/").replace(/\'/g,"\\\'").replace(/\"/g,"\\\"").split('\r\n').join("\");\ndocument.writeln(\"")+"\");"
 function $(id){return document.getElementById(id)}
 }
</script>

<table border="0" width="100%" cellpadding="2" cellspacing="1" height="130" class="border">
  <tr bgcolor="#39867B"> 
    <th height="25" colspan="2" nowrap> <%=t3%>�༭��<font color="#FFff00">·����<%=t1%></font>��</td>
  </th>

  <form method="POST" action="" name="basic">
  <input type="hidden" name="t1" value="<%=t1%>">
    <tr>
      <td  height=23 class="forumRow" colspan="2">
	  <textarea name="ConstContent" rows="10" style="width:99%;" id="ConstContent"><% = FileContent %></textarea>
	  </td>
    </tr>
	<%IF right(t1,3)=".js" Then%>
    <tr>
      <td  height=23 class="forumRow" colspan="2">
�뽫htmlԴ��������ӵĹ����뿽�����������: <br>
  <textarea style="width:100%;" cols="100" rows=8 id="osource" onpropertychange="change()" ></textarea>
	  </td>
    </tr>
    <tr>
      <td  height=23 class="forumRow" colspan="2">
  <br>
  <font color="#FF0000">�����������Ӧת���õ�JS���룬˫�����ɲ��� </font><br />
  <textarea style="width:100%;" cols="100" rows=8 id="oresult2" onDblClick="this.select();window.clipboardData.setData('text',this.value); document.getElementById('ConstContent').value=this.value" ></textarea>
	  </td>
    </tr>
	<%End iF%>
    <tr > 
      <td  height=23 class="forumRow">��</td>
      <td  height=23 class="forumRow"><font size="2"> 
          <input type="submit" name="Submit" value=" ���� "/>
          <input type="reset" name="Submit2" value=" ���� " />
          <input name="Action" type="hidden" id="Action" value="Save">
        </font></td>
    </tr>
  </form>
</table>
</body>

</html>