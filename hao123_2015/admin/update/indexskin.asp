<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<style type="text/css">
<!--
.dates{margin:10px 0 0 0px;border:1px solid #1a1aa3;height:27px;width:700px;padding:1px;}
.dates .cos{float:left;background:#1a1aa3;height:25px;color:red;}
-->
</style>

<%

G_mb=Tip_skin()(0)
qingtian_date_v=request("ver")
IF qingtian_date_v="" Then qingtian_date_v=Tip_skin()(2)

tag=Request("tag")
IF tag<>"" Then 
	Response.Write "<script src='"&G_G_H&"qtuser/2013_vipdaohangSkinupdate_19/vipupdate.asp?ver="&qingtian_date_v&"&sk="&G_mb&"' language='JavaScript' charset='gb2312'></script>"
	Response.End()
End IF
s1=Request("s1") '���µ��ڼ����ļ�
p1=Request("p1") '״̬
's2="1,2,3,4,5,6,,7,8,9,9,0,1,2,3,4,5,6,,7,8,9,9,0,1,2,3,4,5,6,,7,8,9,9,0,1,2,3,4,5,6,,7,8,9,9,0"
s2=Request("s2") '�ܵ��ļ�·��


IF s1<>"" Then	

	
	IF s2<>"" Then
		local_fold="/backup/���������ļ�/"&G_mb&"/"&qingtian_date_v+1
		N_Fso.C_N_CreateFolders Add_Root_Dir(local_fold)
		
		allUpFIle=qtcmsdh.Qingtiandy_getHTTPPage(G_G_H&s2)
		allUpFIle_1=GetContent(allUpFIle,"<�����ṩ����֧��:�����ļ�>","</�����ṩ����֧��:�����ļ�>",0)
		allUpFIle_2=GetContent(allUpFIle,"<����˵��>","</����˵��>",0)
		session("gongnengdes")=allUpFIle_2
		N_Fso.CreateFolderFile Add_Root_Dir(local_fold&"/"&qingtian_date_v+1&".txt"),allUpFIle
		p_a=split(allUpFIle_1,chr(13))	
		k_s2=""	
		For i=0 To Ubound(p_a)
			p_1=p_a(i)
			p_1=replace(p_1,CHR(10),"")
			IF p_1<>"" And Not isnull(p_1) And Instr(p_1,"/")>0 Then
				k_s2=k_s2&p_1&","
			End IF	
		Next		
		k_s2=PrintArray(k_s2,",")&"{next}"&qingtian_date_v+1
		session("gengxin_qt") = k_s2
	End IF
	
	v1=split(session("gengxin_qt"),"{next}")
	
	sv1=v1(0)'
	sv2=v1(1)'next�汾
	
	
	s2_arr=split(sv1,",")
	s2_length=Ubound(s2_arr)+1
	IF s2_length<1 Then
		Call f1()
		Response.End()
	ElseIF Clng(s2_length)<=Clng(s1) Then
		Response.Write "<meta http-equiv=""Refresh"" content=""1;URL=copyskin.asp?tag=true&s1=0&ver="&sv2&"&sk="&G_mb&"&G_moban="&G_moban&"&G_moban_html="&G_moban_html&""">"
		Response.End()
		p_str="+++++++++++++++++["&G_mb&"]�������汾�ţ�"&qingtian_date_v+1&"--"&ForMatDate(now(),55)&"===================="&vbcrlf
		N_Fso.WriteToFileToEnd Add_Root_Dir("/"&G_ADMIN&"/update/log.txt"),p_str
		IF sv2<>"0" Then
			Response.Write "<meta http-equiv=""Refresh"" content=""1;URL=indexskin?tag=true&s1=0&ver="&sv2&""">"
			Response.End()
		End IF
		Call f2()
		Response.End()		
	Else
		IF Clng(s1)=0 Then
			p_str="====================�������汾�ţ�"&qingtian_date_v+1&"--"&ForMatDate(now(),55)&"===================="&vbcrlf
			'N_Fso.WriteToFileToEnd Add_Root_Dir("/"&G_ADMIN&"/update/log.txt"),p_str
		End IF
	End IF
	numb=s2_length
	s3=100/numb
	oldurl = Replace(s2_arr(s1), ".rar", "") '���ڸ����ļ�
	IF oldurl<>"" Then
		file_s1=s2_arr(s1) '---Զ���ļ�
		file_s2=replace(oldurl,"admin",G_ADMIN)'----�����ļ�		
		'��ȡ��Զ���ı�
		ustr=qtcmsdh.Qingtiandy_getHTTPPage(G_G_H&"qtuser/2013_vipdaohangSkinupdate_19/soft/"&G_mb&"/"&(qingtian_date_v+1)&s2_arr(s1)) 
		
		'����ԭ���ļ�	
		N_Fso.C_N_CreateFolders Add_Root_Dir(replace("/backup/���챸���ļ�/"&G_mb&"/"&qingtian_date_v&"/"&left(oldurl,Instrrev(oldurl,"/")-1),"//","/"))
		N_Fso.CopyFiles Add_Root_Dir(file_s2),Add_Root_Dir("/backup/���챸���ļ�/"&G_mb&"/"&qingtian_date_v&oldurl)
		'�����ļ�
		N_Fso.CreateFolderFile Add_Root_Dir("/backup/���������ļ�/"&G_mb&"/"&qingtian_date_v+1&""&oldurl),""
		SaveFile_2 Add_Root_Dir("/backup/���������ļ�/"&G_mb&"/"&qingtian_date_v+1&""&oldurl),G_G_H&"qtuser/2013_vipdaohangSkinupdate_19/soft/"&G_mb&"/"&(qingtian_date_v+1)&s2_arr(s1)
		p_str="-----"&ForMatDate(now(),55)&"��"&oldurl&vbcrlf
	End IF
%>
<table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
  <tr> 
    <th height=25 class="tableHeaderText">����ģ��������������</th> 
  </tr> 
  <tr> 
    <td class="forumRow">
	<b>���ڴ�����������������ļ�...��<%=qingtian_date_v%>��<%=qingtian_date_v+1%></b>	
	</td> 
  </tr>   
  <tr> 
    <td class="forumRow">
	<div class="dates"><div class ="cos" style="width: <%=Int(s3*s1)%>%;"></div></div>	
	</td> 
  </tr> 
   <tr> 
    <td class="forumRow">
	����ʣ��ʱ�䣺<font color="#FF0000"><%=Int(numb-s1)%></font> ��  &nbsp;&nbsp;���ؽ��ȣ�<%=Int(s3*s1)%> % &nbsp;&nbsp;�����ļ���<%=file_s2%>
	</td> 
  </tr> 
  <%IF session("gongnengdes")<>"" Then%>
   <tr> 
    <td class="forumRow" style="line-height:25px; color:#0000FF">
	<span style="color:#FF0000">������<%=qingtian_date_v+1%>����������</span><br />
	<%=HTMLEncode6(session("gongnengdes"))%>
	</td> 
  </tr>   
  <%End IF%>  
</table>
<%
	IF clng(numb) > clng(s1) Then
		Response.Write "<meta http-equiv=""Refresh"" content=""1;URL=indexskin.asp?s1="&s1+1&"&ver="&qingtian_date_v&""">"
	Else
		Response.Write "<meta http-equiv=""Refresh"" content=""1;URL=indexskin.asp?p1=a"">"
	End IF
Else
	IF p1="a" Then
		Call f2()
		Response.End()
	Else
	
	End IF
End IF
%>

<%Sub f1()%>
<table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
  <tr> 
    <th height=25 class="tableHeaderText">����ģ��������������</th> 
  </tr> 
   <tr> 
    <td class="forumRow">
		<font color="#FF0000">����ǰ�����°汾������û��Ȩ������</font>	
	</td> 
  </tr> 
</table>
<%End Sub%>

<%Sub f2()%>
<table border="0" cellspacing="1" cellpadding="3" align=center class="tableBorder"> 
  <tr> 
    <th height=25 class="tableHeaderText">����ģ��������������</th> 
  </tr> 
   <tr> 
    <td class="forumRow">
		<font color="#FF0000">��ϲ�㣬����ϵͳ�Ѿ����µ����°汾</font>	
	</td> 
  </tr> 
</table>
<%End Sub%>


<%

	function SaveFile_2(LocalFileName,RemoteFileUrl) 
		Dim Ads, Retrieval, GetRemoteData 
		On Error Resume Next 
		Set Retrieval = Server.CreateObject("Microso" & "ft.XM" & "LHTTP") 
		With Retrieval 
			.Open "Get", RemoteFileUrl, False, "", "" 
			.Send 
			GetRemoteData = .ResponseBody 
		End With 
		Set Retrieval = Nothing 
		Set Ads = Server.CreateObject("Ado" & "db.Str" & "eam") 
		With Ads 
			.Type = 1 
			.Open 
			.Write GetRemoteData 
			.SaveToFile Server.MapPath(LocalFileName), 2 
			.Cancel() 
			.Close() 
		End With 
		Set Ads=nothing 
		if err <> 0 then 
			SaveFile_2 = false 
			err.clear 
			else 
			SaveFile_2 = true 
		end if 
	End function
	
	function HTMLEncode6(fString)
		if not isnull(fString) then
			fString = Replace(fString, CHR(32), "&nbsp;")
			fString = Replace(fString, CHR(9), "&nbsp;")
			fString = Replace(fString, CHR(34), "&quot;")
			fString = Replace(fString, CHR(39), "&#39;")
			fString = Replace(fString, CHR(13), "")
			fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
			fString = Replace(fString, CHR(10), "<BR> ")
			HTMLEncode6 = fString
		end if
	end function	
%>