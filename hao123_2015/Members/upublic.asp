<%
IF G_pifu_yonghu="1" Then
	Response.Redirect "../members2/"
	Response.End()
ElseIF G_pifu_yonghu="2" Then
	Response.Redirect "../members3/"
	Response.End()	
End IF
IF G_user_mem<>"" Then
	Response.Write "�û�������ʱ�ر�.<a href='../'>������ҳ</a>"
	Response.End()
End IF




psoojs_u=Request.Cookies(G_u_Cookies)("soojs_u")
pBack_url=Request.QueryString("Back_url")
pBack_url=server.HTMLEncode(LoseeeHtml(pBack_url))
IF psoojs_u="" Then
	IF pBack_url<>"" Then
		Response.Redirect pBack_url
	Else
		IF Request.ServerVariables("URL")<>"" Then
			pBack_url=Request.ServerVariables("URL")
			pBack_url=server.HTMLEncode(LoseeeHtml(pBack_url))
		Else
			pBack_url="default.asp"
		End IF
		Response.Redirect "../members/Reg.asp?r="&GetRamNumb(8)&"&Back_url="&pBack_url
	End IF
	Response.End()
End IF


Set oRs=server.CreateObject(G_Rs)
oRs.open "Select * From soojs_un Where Id="&Request.Cookies(G_u_Cookies)("soojs_id"),Conn,1,1
IF Not oRs.Eof Then
	zsoojs_u_email=oRs("soojs_u_email")
	zsoojs_id=oRs("id")
	zsoojs_u=oRs("soojs_u_name")
	zsoojs_sex=oRs("soojs_sex")
	zsoojs_u_birth=oRs("soojs_u_birth")
	zsoojs_u_Province=oRs("soojs_u_Province")
	zsoojs_u_City=oRs("soojs_u_City")
	IF zsoojs_u_Province="" Then zsoojs_u_Province="2386"
	zsoojs_u_card=oRs("soojs_u_card")
	zsoojs_u_qq=oRs("soojs_u_qq")
	zsoojs_u_msn=oRs("soojs_u_msn")
	zsoojs_status=oRs("soojs_status") '�Ƿ�����޸����֤
	zsoojs_u_Webf=oRs("soojs_u_Webf") '�Ƿ�վ��
	zsoojs_uu_name=oRs("soojs_uu_name") '��ʵ����
	
	zsoojs_u_tel=oRs("soojs_u_tel") '�绰
	zsoojs_u_addr=oRs("soojs_u_addr") '��ϸ��ַ
	zsoojs_jifen=oRs("soojs_jifen") 'G_jifen_jifen_name
	zsoojs_u_code=oRs("soojs_u_code") '��������
	zsoojs_u_pic=GetRp(oRs("soojs_u_pic"))'�û�ͷ��
	zsoojs_u_alipay=GetRp(oRs("soojs_u_alipay"))'֧�����˺�
	zsoojs_u_alipay_name=GetRp(oRs("soojs_u_alipay_name"))'֧��������
	zsoojs_u_f1=Bint(oRs("soojs_u_f1"))'�Ƿ�����
	zsoojs_u_xiaoxi_y=GetRp(oRs("soojs_u_xiaoxi_y"))'��Ϣ�ַ���
	IF zsoojs_u_f1="1" Then
		response.Redirect "../members/login.asp?p="&server.URLEncode("�Բ��������ʺ��Ѿ���������")
		Response.End()		
	End IF
	IF zsoojs_u_pic="" Then 
		zsoojs_u_pic=Add_Root_Dir("/p_inc/img/nouserpic.gif")
	Else
		zsoojs_u_pic=Add_Root_Dir(zsoojs_u_pic)
	End IF	
	IF G_xiaxian_1="1" Then
		zsoojs_u_tuiguang_numb=GetRp(oRs("soojs_u_tuiguang_numb"))'�Ѿ��ƹ��û���
	End IF
Else
	Response.Redirect "../members/login.asp"
	Response.End()
End IF
oRs.close

IF G_xxiaoxi_1="1" Then
	zCount_xxiao_numb=Get_xx_xiaoxi_u()
End IF

'�Ƿ�����鿴��ϸ
G_mingxi_look_Flag=false
IF G_mingxi_look="1" or Request.Cookies(Sky_Admin_Cookies_1)("admin_u")<>"" Then
	G_mingxi_look_Flag=True
End IF


oip=getIP()

Set oRs=Conn.Execute("Select * From qingtiandh_userip Where uid="&Request.Cookies(G_u_Cookies)("soojs_id")&" And uip='"&oip&"'")
IF Not oRs.Eof Then
	Response.Cookies("soojsjj")="1"
Else
	Response.Cookies("soojsjj")="0"		
End IF
oRs.close

%>