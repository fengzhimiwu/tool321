<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<%

If request.Cookies(Sky_Admin_Cookies_1)("admin_u")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_p")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_m")="" then

	response.Redirect(Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
	response.End()
End IF
%>
<%
Session("Page_skins")=""
Session("Page_skinsa")=""
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��վ��̬HTML���ɹ���</title>
<LINK href="../css/style.css" rel=stylesheet type=text/css>
</head>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>
<body>
<table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
  <tr> 
    <th width="88%" class="tableHeaderText" height=25>������վHTML˵��</th> 
    <th width="12%" class="tableHeaderText"><a href="../qingtiancms.com.ex.asp"><font color="#FFFFFF">�˳�����</font></a></th>
  </tr> 
  <tr> 
    <td colspan="2" class="forumRowHighlight"><p><B>����</B>��<BR> 
        ��:�����������ɣ��������� ����ҳ &gt;&gt;  ��ҳ�������ϵ��£�ÿ����һ��<br>
��:ÿ�βɼ���Ϣ��Ӧ���������ɡ�<br>
&nbsp;<br>
&nbsp;</td> 
  </tr> 
</table>
  <br>
  <table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
    <tr> 
      <th height=25 colspan="3" class="tableHeaderText">����HTMLҳ����ѡ��</th> 
    </tr> 	
	<tr> 
      <td width=20% height=40 class="forumRowHighlight"><strong>�������е�ҳ:</strong> </td> 
      <td class="forumRowHighlight" width=41%>˵���������ɵ�Ϊ���е�ҳ��</td>
      <td class="forumRowHighlight" width=39% align="center">
	  <img src="../images/indexpoint.gif" width="5" height="9" align="absmiddle"> <a href="make_html.asp?all=all&tag=a" target="_blank">��ʼ������վ��ҳ</a>	  </td>
    </tr>	
	<tr> 
      <td width=20% height=40 class="forumRowHighlight"><strong>���ɵ�����������ҳ:</strong></td> 
      <td class="forumRowHighlight" width=41%>
	  <%
	  Set oRs=conn.Execute("Select * From qingtiandh_type1 order by typeno asc")
	  Do While Not oRs.Eof
	  	oTypeName=oRs("typename")
		oTypeId=oRs("typeid")
		Response.Write "<a href='makelist.asp?ty1="&oTypeId&"' target=_blank>"&oTypeName&"</a> "
	  	oRs.MoveNext
	  Loop
	  %>
	  </td>
      <td class="forumRowHighlight" width=39% align="center"><img src="../images/indexpoint.gif" width="5" height="9" align="absmiddle"> <a href="makelist.asp?all=all" target="_blank">��ʼ������վ������������ҳ��</a></td>
    </tr> <tr> 
      <td width=20% height=40 class="forumRowHighlight">       </td> 
      <td class="forumRowHighlight" width=41%></td>
      <td class="forumRowHighlight" width=39% align="center"></td>
    </tr>	
	<tr> 
      <td width=20% height=40 class="forumRowHighlight"><strong>���ɵ���һ������ҳ:</strong></td> 
      <td class="forumRowHighlight" width=41%>
	  <%
	  Set oRs=conn.Execute("Select * From qingtiandh_type1 order by typeno asc")
	  Do While Not oRs.Eof
	  	oTypeName=oRs("typename")
		oTypeId=oRs("typeid")
		Response.Write "<a href='makelist1.asp?ty1="&oTypeId&"' target=_blank>"&oTypeName&"</a> "
	  	oRs.MoveNext
	  Loop
	  %>
	  </td>
      <td class="forumRowHighlight" width=39% align="center"><img src="../images/indexpoint.gif" width="5" height="9" align="absmiddle"> <a href="makelist1.asp?all=all" target="_blank">��ʼ������վ����һ������ҳ��</a></td>
    </tr> <tr> 
      <td width=20% height=40 class="forumRowHighlight">       </td> 
      <td class="forumRowHighlight" width=41%></td>
      <td class="forumRowHighlight" width=39% align="center"></td>
    </tr>
	<tr> 
      <td width=20% height=40 class="forumRowHighlight"><strong>������վ��ҳ:</strong> </td> 
      <td class="forumRowHighlight" width=41%>˵���������ɵ�Ϊ��վ��ҳ��</td>
      <td class="forumRowHighlight" width=39% align="center">
	  <img src="../images/indexpoint.gif" width="5" height="9" align="absmiddle"> <a href="make_index.asp" target="_blank">��ʼ������վ��ҳ</a>	  </td>
    </tr> 
	<tr> 
      <td width=20% height=40 class="forumRowHighlight">       </td> 
      <td class="forumRowHighlight" width=41%></td>
      <td class="forumRowHighlight" width=39% align="center"></td>
    </tr>
<tr> 
      <td width=20% height=40 class="forumRowHighlight"><strong>��������ҳ��:</strong> </td> 
      <td class="forumRowHighlight">
	 ˵����������Ϊ�������о�̬ҳ��	  </td>
      <td class="forumRowHighlight" align="center"><img src="../images/indexpoint.gif" width="5" height="9" align="absmiddle"> <a href='makeall.asp?TopNew=a' target="_blank"><b>һ���������о�̬ҳ��</b></a></td>
</tr>	
	</table> 
<br>
<%

IF N_Fso.IsFileExists(Add_Root_Dir("p_inc/Tag/muban.txt")) Then
%>
  <table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
    <tr> 
      <th height=25 colspan="3" class="tableHeaderText"><span style="cursor:pointer; color:#FF0000">����ģ�����ɾ�̬</span></th> 
    </tr> 
	<%
		set file1=server.CreateObject(G_FSO)
		set folder1=file1.GetFolder(""&server.mappath("../../template")&"")
		ki=0
		for each thing in folder1.SubFolders
		dbname_2=thing.name
		IF G_moban=dbname_2 Then
	%>						
	<%
		Else
			n=Get_pifu_q(dbname_2)
			
			IF n<>dbname_2 Then 
	%>
		<tr> 
		  <td width=18% height=40 class="forumRowHighlight"><strong>����ģ��ѡ��:</strong></td> 
		  <td class="forumRowHighlight" width=43%>˵����������ģ��<%=dbname_2%>���о�̬��</td>
		  <td class="forumRowHighlight" width=39% align="center"><img src="../images/indexpoint.gif" width="5" height="9" align="absmiddle"> <a href="f.asp?skins=<%=Server.URLEncode(dbname_2)%>">�������о�̬</a></td>
		</tr>		
	<%
			End IF
		ki=ki+1
		End IF	
					 
	%>


	<%next%>	

  </table>
<%End IF%>
</body>
</html>