<!--#include file="Include_func.asp"-->
<!--#include file="openconn.asp"-->
<%
v=Bint(Request("v"))
pv=3
IF v="1" Then
	'order by inj desc,outj desc,id asc
	RefreshIndexPage="1.js"
	pv=3
ElseIF v="2" Then
	RefreshIndexPage="2.js"
	pv=2	
Else
	Response.End()
End IF
RefreshIndexPage_str=url_(Array("one",RefreshIndexPage))
Response.Write RefreshIndexPage_str&"<br>"
RefreshTime=Bint(hxtime) '�Զ�ˢ��ʱ�䣬��λ����
tFlag=False
tPstr=""
IF N_Fso.IsFileExists(Add_Root_Dir(RefreshIndexPage_str)) Then
	tFlag=IsExistIndexPage(RefreshTime,Add_Root_Dir(RefreshIndexPage_str)) 'true������Ҫ���¶����ݿ�	
End IF
IF Not  tFlag Then '���¶�ȡ���ݿ����д���ļ�
	ttPstr="{qt_Loop:WebList "&pv&",0,0,0,100}"
	ttPstr=ttPstr&"{""w_id"":""{qt:w_id}"",""w_name"":""{qt:w_name}"", ""w_url"":""{qt:w_url}"", ""w_inj"":""{qt:w_inj}"", ""w_outj"":""{qt:w_outj}"", ""w_inc"":""{qt:w_inc}"",""w_outc"":""{qt:w_outc}""},"
	ttPstr=ttPstr&"{/qt_Loop}"
	ttPstr=MakeHTML_CMS(ttPstr)
	IF Right(ttPstr,1)="," Then ttPstr=Left(ttPstr,len(ttPstr)-1)
	tPstr=tPstr&"//�ó����������ṩ����֧��"&vbcrlf
	tPstr=tPstr&"//QQ��314048526 "&vbcrlf
	tPstr=tPstr&"//����:http://hao123.qingtiandy.cn/"&vbcrlf&vbcrlf
	tPstr=tPstr&"window.qT"&"cms"&"s.data({"
	tPstr=tPstr&"	""d"": ["
	tPstr=tPstr&ttPstr
	tPstr=tPstr&"	],"
	tPstr=tPstr&"	""c"":["
	tPstr=tPstr&""""&FormatDate(now(),5)&""","&vbcrlf '��ǰ����ʱ�䣺��
	tPstr=tPstr&""""&FormatDate(now(),88)&""","&vbcrlf '�Զ�ˢ��ʱ��
	tPstr=tPstr&""""&RefreshTime&""""&vbcrlf '�Զ�ˢ��ʱ��
	tPstr=tPstr&"	]"
	tPstr=tPstr&"	});"
	IF Instr(tPstr,"qt_Loop")=0 Then
		N_Fso.CreateFolderFile RefreshIndexPage_str,tPstr
	End IF
Else
	tPstr=N_Fso.ReadAllTextFile(RefreshIndexPage_str)
End IF
Response.Write tPstr
%>