<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="inc/public.asp"-->
<!--#include file="inc/openconn.asp"-->
<!--#include file="qTcms_Com_19/News/Config.asp"-->
<%
IF Not ChkPost() Then
	'response.Redirect "../"
	'response.End()
End IF
Response.Buffer=True
response.contenttype="text/html;charset=gb2312"
tag=request("tag")
str=""
Select Case tag
	Case "Get_type1" '���ݵ���ID����ȡ��������
		id1=StayNub(Request("id1"))
		id3=StayNub(request("id3")):IF id3="" Then id3=0
		str=str&"<Select name='m_type2' onChange=""Get_type2(this.value,'div_m_type3')"">"
		str=str&"<Option value='0' onClick=""f_mm_type2('mm_type2',this.value)"">�������</Option>"
		IF id1="" Then
			'str=""
		Else
			Set oRs=Server.CreateObject(G_RS)
			oRs.open "Select * from qingtiandh_type2 where typeid1="&id1&" order by typehide desc,typeno asc,typeid asc",conn,1,1
			Do While Not oRs.Eof 
				kId=oRs("typeid")
				kG_name=oRs("typename")
				IF Clng(id3)=Clng(kId) Then
					str=str&"<option value='"&kId&"' selected onClick=""f_mm_type2('mm_type2',this.value)"">"&kG_name&"</option>"
				Else
					str=str&"<option value='"&kId&"' onClick=""f_mm_type2('mm_type2',this.value)"">"&kG_name&"</option>"	
				End IF
				oRs.MoveNext
			Loop	
			oRs.close:set oRs=Nothing		
		End IF
		str=str&"</Select>"
	Case "Get_type2" '���ݵ�������ȡ����ר��	
		id1=StayNub(Request("id1"))
		id3=StayNub(request("id3")):IF id3="" Then id3=0
		str=str&"<Select name='m_type3' id='m_type3' onChange=""f_mm_type2('mm_type3',this.value)"">"
		str=str&"<Option value='0' onClick=""f_mm_type2('mm_type3',this.value)"">�������</Option>"
		IF id1="" Then
			'str=""
		Else
			Set oRs=Server.CreateObject(G_RS)
			oRs.open "Select * from qingtiandh_type3 where typeid2="&id1&" order by typehide desc,typeno asc,typeid asc",conn,1,1
			Do While Not oRs.Eof 
				kId=oRs("typeid")
				kG_name=oRs("typename")
				IF Clng(id3)=Clng(kId) Then
					str=str&"<option value='"&kId&"' selected onClick=""f_mm_type2('mm_type3',this.value)"">"&kG_name&"</option>"
				Else
					str=str&"<option value='"&kId&"' onClick=""f_mm_type2('mm_type3',this.value)"">"&kG_name&"</option>"	
				End IF
				oRs.MoveNext
			Loop	
			oRs.close:set oRs=Nothing		
		End IF
		str=str&"</Select>"		
	Case "Add_list" '����ר��
		tFlag=True
		list_text=replace(request("list_text"),"'","")
		l_group=StayNub(Request("l_group"))	
		l_type1=StayNub(Request("l_type1"))
		IF l_type1="0" And tFlag  Then
			str="{��������Ϊ��}"
			tFlag=False
		End IF
		IF l_group="0" And tFlag  Then
			str="{��������Ϊ��}"
			tFlag=False
		End IF		
		IF list_text="" And tFlag  Then
			str="{ר��������Ϊ��}"
			tFlag=False
		End IF		
		IF tFlag Then
			Set oRs=Server.CreateObject(G_RS)
			oRs.open "Select * from qingtiandh_list Where l_group="&l_group&" And l_name='"&list_text&"'",conn,1,3
			IF Not oRs.Eof Then
				str="{�Ѿ�����}"&oRs("id")
			Else
				oRs.AddNew
					oRs("l_look")=1
					oRs("l_type1")=l_type1
					oRs("l_group")=l_group
					oRs("l_name")=list_text
					oRs("l_addtime")=ForMatDate(now(),55)
				oRs.Update
				str="{ok}"&oRs("id")
			End IF
			oRs.close:set oRs=Nothing
		End IF
	Case "Add_group" '���뵼��
		tFlag=True
		group_text=replace(request("group_text"),"'","")
		l_type1=StayNub(Request("l_type1"))
		IF l_type1="0" And tFlag  Then
			str="{��������Ϊ��}"
			tFlag=False
		End IF			
		IF group_text="" And tFlag  Then
			str="{����������Ϊ��}"
			tFlag=False
		End IF	
		IF tFlag Then
			Set oRs=Server.CreateObject(G_RS)
			oRs.open "Select * from qingtian_group where g_type1="&	l_type1&" And g_name='"&group_text&"'"	,conn,1,3
			IF Not oRs.Eof Then
				str="{�Ѿ�����}"&oRs("id")
			Else
				oRs.AddNew
					oRs("g_look")=1
					oRs("g_type1")=l_type1
					oRs("g_name")=group_text				
				oRs.Update
				str="{ok}"&oRs("id")
			End IF	
			oRs.close:set oRs=Nothing	
		End IF
	Case "Get_typen1" '����ʡ��ID����ȡ���м���
		id1=StayNub(Request("id1"))
		id3=StayNub(request("id3")):IF id3="" Then id3=0
		str=str&"<Select name='m_city' id='m_city'>"
		str=str&"<Option value='0'>���г���</Option>"
		IF id1="" Then
			'str=""
		Else
			Set oRs=Server.CreateObject(G_RS)
			oRs.open "Select * from city_py where pid="&id1&" order by id asc",connip,1,1
			Do While Not oRs.Eof 
				kId=oRs("id")
				kG_name=oRs("city")
				IF Clng(id3)=Clng(kId) Then
					str=str&"<option value='"&kId&"' selected>"&kG_name&"</option>"
				Else
					str=str&"<option value='"&kId&"'>"&kG_name&"</option>"	
				End IF
				oRs.MoveNext
			Loop	
			oRs.close:set oRs=Nothing		
		End IF
		str=str&"</Select>"		
	Case "Get_typen2" '����һ����ַ����ȡ�������
		id1=StayNub(Request("id1"))
		id3=StayNub(request("id3")):IF id3="" Then id3=0
		str=str&"<Select name='m_type2' id='m_type2'>"
		str2=""
		IF id1="" Then
			'str=""
		Else
			IF id1="2" Then
				str2=str2&GetDhType1(a_arrmz_2,id3,1)
			ElseIF id1="3" Then
				str2=str2&GetDhType1(a_arrmz_1,id3,1)
			ElseIF id1="5" Then
				str2=str2&GetDhType1(a_arrmz_3,id3,1)	
			ElseIF id1="6" Then
				str2=str2&GetDhType1(a_arrmz_4,id3,1)
			ElseIF id1="9" Then
				str2=str2&GetDhType1(a_arrmz_5,id3,1)												
			End IF		
		End IF
		IF str2="" Then 
			str=""
		Else
			str=str&str2&"</Select>"	
		End IF	
	Case "Get_typeh2" '����һ����ַ����ȡ�������
		id1=StayNub(Request("id1"))
		id3=StayNub(request("id3")):IF id3="" Then id3=0
		str=str&"<Select name='n_type2' id='n_type2'>"
		str2=""
		IF id1="" Then
			'str=""
		Else
			IF id1="10" Then
				str2=str2&GetDhType1(a16_arrmz_10,id3,1)
			ElseIF id1="11" Then
				str2=str2&GetDhType1(a16_arrmz_11,id3,1)	
			ElseIF id1="1" Then
				str2=str2&GetDhType1(a16_arrmz_1,id3,1)															
			End IF		
		End IF
		IF str2="" Then 
			str=""
		Else
			str=str&str2&"</Select>"	
		End IF			
		
	Case "add_jifen_u" '�����û�ID�����û������ 
		id1=StayNub(Request("id1")) '�û�
		id2=Bint(Request("id2")) '����
		IF id2=0 Then
			str="error"
		Else
			Set oRs=Server.CreateObject(G_RS)
			oRs.open "Select soojs_jifen from soojs_un where id="&id1&" order by id asc",conn,1,3	
			IF Not oRs.Eof Then
				zsoojs_jifen=Bint(oRs("soojs_jifen"))
				zsoojs_jifen=zsoojs_jifen+id2
				oRs("soojs_jifen")=zsoojs_jifen
				oRs.Update()
				Get_qingtiandy_jifen_ip id1,5,id2
				str="�����Ѿ���ֵ�ɹ�����ǰ���֣�"&zsoojs_jifen			
			Else
				str="error"
			End IF			
		End IF
	Case Else
End Select
'rs.close
'Set rs=Nothing
response.Write str
CloseConn()

%>