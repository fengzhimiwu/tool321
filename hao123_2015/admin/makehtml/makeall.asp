<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%
Function FileInfo(filespec,InfoType)
	Dim fso, f, s
	Set fso = CreateObject(G_FSO)
	Set f = fso.GetFile(Server.MapPath(filespec))
	Select Case InfoType
	Case 0,"DateLastAccessed"	'�ϴη���ʱ��
	FileInfo = f.DateLastAccessed
	Case 1,"DateLastModified"	'�ϴ��޸�ʱ��
	FileInfo = f.DateLastModified
	Case 2,"DateCreated"
	FileInfo = f.DateCreated	'����ʱ��
	End select
	Set f = nothing
	Set fso = nothing
End Function

oskins=Request("skins")
oskinsa=Request("skinsa")
IF oskins<>"" And oskinsa<>"" then	
	u="skins="&server.URLEncode(oskins)&"&skinsa="&server.URLEncode(oskinsa)
	Session("Page_skins")=oskins
	Session("Page_skinsa")=oskinsa	
End IF
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>һ������</title>
<LINK href="../css/style.css" rel=stylesheet type=text/css>
</head>
<body>
  <table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
    <tr> 
      <th height=25 colspan="3" class="tableHeaderText">һ������-------�����������о�̬ҳ��</th> 
    </tr> 
   <tr> 
      <td width="15%" height=40 class="forumRowHighlight"><strong>������վ��ҳ:</strong></td> 
      <td width="80%" class="forumRowHighlight">&nbsp;<iframe src='make_index.asp?<%=u%>' width='300%' height='30' frameborder='0' scrolling='no'></iframe></td>
      <td width="5%" class="forumRowHighlight">&nbsp;</td>
    </tr>

    <tr> 
      <td width="15%" height=40 class="forumRowHighlight"><strong>������վһ������ҳ��:</strong></td> 
      <td width="80%" class="forumRowHighlight">&nbsp;<iframe src='makelist1.asp?all=all&<%=u%>' width='300%' height='30' frameborder='0' scrolling='no'></iframe></td>
      <td width="0%" class="forumRowHighlight">&nbsp;</td>
    </tr>
 
    <tr> 
      <td width="15%" height=40 class="forumRowHighlight"><strong>������վ��������ҳ��:</strong></td> 
      <td width="80%" class="forumRowHighlight">&nbsp;<iframe src='makelist.asp?all=all&<%=u%>' width='300%' height='30' frameborder='0' scrolling='no'></iframe></td>
      <td width="0%" class="forumRowHighlight">&nbsp;</td>
    </tr>


    <tr> 
      <td width="15%" height=40 class="forumRowHighlight"><strong>������վ���е�ҳ:</strong></td> 
      <td width="35%" class="forumRowHighlight">&nbsp;<iframe src='make_html.asp?all=all&tag=a&<%=u%>' width='300%' height='35' frameborder='0' scrolling='no'></iframe></td>
      <td width="50%" class="forumRowHighlight">&nbsp;</td>
    </tr>
		
    </table> 

</body>
</html>