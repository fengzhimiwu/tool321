<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="function_u.asp"-->
<script>
function setCookie(name, value) {
    var expdate = new Date();
    var argv = setCookie.arguments;//�������
    var argc = setCookie.arguments.length;//�������ĳ���
    var expires = (argc > 2) ? argv[2] : 1;//���쳤����
    var path = (argc > 3) ? argv[3] : "/";
    var domain = (argc > 4) ? argv[4] : null;
    var secure = (argc > 5) ? argv[5] : false;
    if(expires!=null){
        expdate.setTime(expdate.getTime() + ( expires*24*60*60*1000 )); //�Ѵ������ñ����������
	}
    document.cookie = name + "=" + escape (value)
    +((expires == null) ? "" : ("; expires="+ expdate.toGMTString()))
    +((path == null) ? "" : ("; path=" + path))
    +((domain == null) ? "" : ("; domain=" + domain))
    +((secure == true) ? "; secure" : "");
}
</script>
<%
IF Not ChkPost() Then
	'response.Redirect "../"
	'response.End()
End IF
%>
<%
action=Request("action")

IF action="reg" Then
	Call Regf() '��ʼע��
ElseIF action="regf_a" Then
	Call Regf_a() '��ʼ��½	 'Ajaxע��		
ElseIF action="login" Then
	Call Loginf() '��ʼ��½
ElseIF action="login_a" Then
	Call Loginf_a() '��ʼ��½ 'Ajax��½	
ElseIF action="login_b" Then
	Call Loginf_b() '��ʼ��½ 'Ajax��½2		
ElseIF action="out" Then
	Call LoginOut() '�˳���½
ElseIF action="editf" Then
	Call EditF() '�༭����
ElseIF action="editpass" Then
	Call Editpass()	'�༭����
ElseIF action="editpass_a" Then
	Call Editpass_a()	'�༭����	'Ajax
ElseIF action="editemail" Then
	Call Editemail() '�༭E-mail	
ElseIF action="editemail_a" Then
	Call Editemail_a() '�༭E-mail	 'Ajax	
ElseIF action="WebAdd" Then
	Call WebAdd() '��ӿ�ͨ��վ���	
ElseIF action="w_a" Then
	Call w_a() '�����վ	
ElseIF action="delweb" Then
	Call delweb() 'ɾ����վ	
ElseIF action="w_add_yz" Then
	Call w_add_yz() '������֤�ļ�
ElseIF action="c_t_add" Then
	Call c_t_add() '����ղ����
ElseIF action="c_t_del" Then
	Call c_t_del() 'ɾ���ղ����	
ElseIF action="c_l_add" Then
	Call c_l_add() '������ղ���ַ
ElseIF action="c_l_add_ajax" Then
	Call c_l_add_ajax() '������ղ���ַ-ajax		
ElseIF action="c_l_del" Then
	Call c_l_del() 'ɾ���ղ���ַ	
ElseIF action="getpass1" Then
	Call getpass1() '�һ�����--������֤��һ��
ElseIF action="getpass2" Then
	Call getpass2() '�һ�����--���֤��֤�ڶ���	
ElseIF action="getpass11" Then
	Call getpass11() '�һ�����--������֤��һ��
ElseIF action="getpass22" Then
	Call getpass22() '�һ�����--���֤��֤�ڶ���			
ElseIF action="gdetail" Then
	Call gdetail() '��ȡ��Ʒʱ���û������֤
ElseIF action="ueditpic.asp" Then
	Call ueditpic() '�޸�ͷ��		
ElseIF action="editalipay" Then
	Call ueditalipay() '�޸�֧����	
ElseIF action="utikuan" Then
	Call utikuan() '����¼	
ElseIF action="ifipin" Then
	Response.Write "<a href='regok.asp?action=ifipin'>�������ת����������</a>"
	Call ifipin() '�󶨱������	
ElseIF action="cz_add" Then 
	Call cz_add() '��ֵ����		
ElseIF action="xx_add" Then
	Call xx_add() 'С��Ϣ
End IF

Sub xx_add()
	IF Request.Cookies(G_u_Cookies)("soojs_id")="" Then
		Response.Redirect "./xx_add.asp?p="&server.URLEncode("���ȵ�½")
		Response.End()		
	End IF	
	on_content=Trim(Request("n_content"))
	IF len(on_content)<5 then
		Response.Redirect "./xx_add.asp?p="&server.URLEncode("�ύ�����ݹ��̣�����������")
		Response.End()			
	End IF	
	IF len(on_content)>140 then
		Response.Redirect "./xx_add.asp?p="&server.URLEncode("�ύ�����ݲ��ܳ���140���ַ�")
		Response.End()			
	End IF
	uid=Request.Cookies(G_u_Cookies)("soojs_id")
	Set oRs2=Server.CreateObject(G_RS)
	oRs2.open "Select * From qingtiandy_xxiaoxi",conn,1,3
	oRs2.Addnew()
	oRs2("uid")=Request.Cookies(G_u_Cookies)("soojs_id")
	oRs2("n_date")=ForMatDate(now(),55)
	oRs2("n_look")=0
	oRs2("n_content")=LoseeeHtml(on_content)
	oRs2("n_read")=0
	oRs2.Update()	
	oRs2.close
	Response.Redirect "./xx_list.asp"
	Response.End()
End Sub



Sub cz_add()
	IF Request.Cookies(G_u_Cookies)("soojs_id")="" Then
		Response.Redirect "./cz_add.asp?p="&server.URLEncode("���ȵ�½")
		Response.End()		
	End IF	
	oDno=Trim(Replace(Request("Dno"),"'",""))
	IF len(oDno)<>40 then
		Response.Redirect "./cz_add.asp?p="&server.URLEncode("���Ŵ���")
		Response.End()			
	End IF
	uid=Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
	Set oRs2=Server.CreateObject(G_RS)
	oRs2.open "Select * From qingtiandy_dianka Where Dno='"&oDno&"' And flag=0",conn,1,3
	IF Not oRs2.Eof Then
		oRs2("uid")=Request.Cookies(G_u_Cookies)("soojs_id")
		oRs2("Dintime")=ForMatDate(now(),55)
		oRs2("flag")=1
		oRs2.Update()	
		ojifen=oRs2("numb")
		oRs2.close
		conn.Execute("Update soojs_un set soojs_jifen=soojs_jifen+"&ojifen&" Where id="&uid&"")
		Get_qingtiandy_jifen_ip uid,5,ojifen
		Get_cz ojifen,1
		Response.Redirect "./j_list.asp?a=5"
	Else
		Response.Redirect "./cz_add.asp?p="&server.URLEncode("���Ŵ���")
	End IF
	Response.End()
End Sub

Sub ifipin()
	IF Request.Cookies(G_u_Cookies)("soojs_id")="" Then
		Response.Redirect "Members/login.asp?reurl="&Add_Root_Dir("/")
		Response.End()		
	End IF	
	oip=getIP()
	Set oRs2=Server.CreateObject(G_RS)
	oRs2.open "Select * From qingtiandh_userip Where uip='"&oip&"'",conn,1,3
	IF Not oRs2.Eof Then
		'Conn.Execute("Delete From qingtiandh_userip Where uip='"&oip&"'")
	Else
		oRs2.AddNew()	
	End IF
	oRs2("uip")=oip
	oRs2("uid")=Request.Cookies(G_u_Cookies)("soojs_id")
	oRs2("utime")=ForMatDate(now(),55)
	oRs2("uedittime")=ForMatDate(now()-1,55)
	oRs2.Update()	
	oRs2.close
	Response.Write "<script>window.location='./default.asp'</script>"
End Sub

Sub utikuan()

	ssoojs_u_alipay_numb=ReplaceText(Request("soojs_u_alipay_numb"))
	ssoojs_u_alipay=ReplaceText(Request("soojs_u_alipay"))
	ssoojs_u_alipay_name=ReplaceText(Request("soojs_u_alipay_name"))
	ssoojs_u_alipay_numb=Bint(ssoojs_u_alipay_numb)
	
	Set oRsk=Server.CreateObject(G_RS)
	oRsk.open "Select * From soojs_un WHERE id=" & Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&" ",conn,1,1
	IF Not oRsk.EOf Then
		zsoojs_jifen=oRsk("soojs_jifen")
	Else
		Response.Redirect "./login.asp?p="&server.URLEncode("��������֤�������")
		Response.End()		
	End IF
	
	IF ssoojs_u_alipay<>"" Then
		Set oRsp=Server.CreateObject(G_RS)
		oRsp.open "Select * From qingtiandh_zhifubaopb Where soojs_u_alipay='"&ssoojs_u_alipay&"'",conn,1,1
		IF Not oRsp.Eof Then
			Response.Redirect "./j_tikuan.asp?p="&server.URLEncode("�Բ�������֧�����ʺ��ѱ��������޷����")
			Response.End()			
		End IF
		oRsp.close
	End IF	
	
	
	ssoojs_u_alipay_numb_max=zsoojs_jifen\G_jifen_jifen_zhifubao_bili
	ssoojs_u_alipay_numb_max2=ssoojs_u_alipay_numb_max*G_jifen_jifen_zhifubao_bili
	IF ssoojs_u_alipay_numb=0 Then
		Response.Redirect "./j_tikuan.asp?p="&server.URLEncode("�����Ҫ��������")
		Response.End()		
	End IF
	IF Clng(ssoojs_u_alipay_numb)>Clng(ssoojs_u_alipay_numb_max2) Then
		Response.Redirect "./j_tikuan.asp?p="&server.URLEncode("�����ֻ����"&ssoojs_u_alipay_numb_max2)
		Response.End()			
	End IF
	IF ssoojs_u_alipay_numb mod G_jifen_jifen_zhifubao_bili >0 Then
		Response.Redirect "./j_tikuan.asp?p="&server.URLEncode("�����һ��Ҫ�ǣ�"&G_jifen_jifen_zhifubao_bili&"�ı���")
		Response.End()		
	End IF
	IF ssoojs_u_alipay="" or ssoojs_u_alipay_name="" Then
		Response.Redirect "./j_tikuan.asp?p="&server.URLEncode("��ѡ������֧������Ϣ")
		Response.End()	
	End IF	
	'�ж������С���
	s_tik=ssoojs_u_alipay_numb\G_jifen_jifen_zhifubao_bili
	s_tik=Bint(s_tik)
	IF CLng(s_tik)<Clng(G_tikuan_smail) Then
		Response.Redirect "./j_tikuan.asp?p="&server.URLEncode("����վ�����С��"&G_tikuan_smail)
		Response.End()	
	End IF
	
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM qingtiandy_zhifubao Where 1<>1 "
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		.AddNew()
		.Fields.Item("uid").Value=Request.Cookies(G_u_Cookies)("soojs_id")
		.Fields.Item("uip").Value=GetIp()
		.Fields.Item("utime").Value=ForMatDate(now(),55)
		.Fields.Item("soojs_u_alipay_numb").Value=ssoojs_u_alipay_numb
		.Fields.Item("soojs_u_alipay_numb2").Value=ssoojs_u_alipay_numb\G_jifen_jifen_zhifubao_bili
		.Fields.Item("soojs_u_alipay").Value=ssoojs_u_alipay
		.Fields.Item("soojs_u_alipay_name").Value=ssoojs_u_alipay_name
		.Fields.Item("uflag").Value=0
		.Update()		
		Conn.Execute("Update soojs_un Set soojs_jifen=soojs_jifen-"&ssoojs_u_alipay_numb&" WHERE id=" & Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&" ")
		Conn.Execute("Update soojs_un Set soojs_u_alipay='"&ssoojs_u_alipay&"',soojs_u_alipay_name='"&ssoojs_u_alipay_name&"' Where (soojs_u_alipay is null or soojs_u_alipay_name is null) And id=" & Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&" ")
		Get_qingtiandy_jifen_ip Request.Cookies(G_u_Cookies)("soojs_id"),7,-ssoojs_u_alipay_numb
		Response.Redirect "./j_list_1.asp?p="&server.URLEncode("��ϲ����֧���ɹ������ǽ���һ����������Ϊ��֧����")
		Response.End()
	End With	
End Sub

Sub ueditalipay()
	'//---- �༭��¼ ----//'
	ssoojs_u_alipay=ReplaceText(Request("soojs_u_alipay"))
	ssoojs_u_alipay_name=ReplaceText(Request("soojs_u_alipay_name"))
	IF ssoojs_u_alipay="" or ssoojs_u_alipay_name="" Then
		Response.Redirect "./ueditalipay.asp?p="&server.URLEncode("��ѡ������֧������Ϣ")
		Response.End()	
	End IF
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM soojs_un WHERE id=" & Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&" "
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		If .Eof Then 
			Response.Redirect "./login.asp?p="&server.URLEncode("��������֤�������")
			Response.End()
		End If
		
		.Fields.Item("soojs_u_alipay").Value=ssoojs_u_alipay
		.Fields.Item("soojs_u_alipay_name").Value=ssoojs_u_alipay_name
		.Update()		
		Response.Redirect "./ueditalipay.asp?p="&server.URLEncode("֧�����޸ĳɹ�")
		Response.End()
	End With
End Sub

Sub ueditpic()
	'//---- �༭��¼ ----//'
	ssoojs_u_pic=ReplaceText(Request("sysFace"))
	IF ssoojs_u_pic="" Then
		Response.Redirect "./ueditpic.asp?p="&server.URLEncode("��ѡ��ͷ��")
		Response.End()	
	End IF
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM soojs_un WHERE id=" & Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&" "
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		If .Eof Then 
			Response.Redirect "./login.asp?p="&server.URLEncode("��������֤�������")
			Response.End()
		End If
		
		.Fields.Item("soojs_u_pic").Value=ssoojs_u_pic
		.Update()		
		Response.Redirect "./ueditpic.asp?p="&server.URLEncode("ͷ���޸ĳɹ�")
		Response.End()
	End With
End Sub

Sub gdetail()
	Dim tp_u,flag,flag2
	tp_u=""
	flag=true
	flag2=true
	zm_name=ReplaceText(request.Form("m_name"))
	zm_tel=ReplaceText(request.Form("m_tel"))
	zm_addr=ReplaceText(request.Form("m_addr"))
	zm_code=StayNub(Request.Form("m_code"))
	zm_content=ReplaceText(request.Form("m_content"))
	zsoojs_code=ReplaceText(request.Form("soojs_code"))
	zjid=Bint(Request.Form("jid"))
	zm_qq=Bint(Request.Form("m_qq"))
	zm_shouji=ReplaceText(request.Form("m_shouji"))
	IF  L_length(zm_name)>8 or L_length(zm_name)<4Then
		tp_u=tp_u&"�û������ó���8���ֽڻ򲻵õ���4���ֽ�"&"\n"
		flag=false
	End IF
	IF zm_tel="" Then
		tp_u=tp_u&"�̶��绰(����-����)���ֻ�����Ϊ��"&"\n"
		flag=false		
	End IF
	IF zm_addr="" Then
		tp_u=tp_u&"��ϸ��ַ����Ϊ��"&"\n"
		flag=false		
	End IF	
	IF  L_length(zm_addr)>400Then
		tp_u=tp_u&"��ϸ��ַ400���ַ����ڵ�����"&"\n"
		flag=false
	End IF	
	IF  Clng(L_length(zm_code))<>6 Then
		tp_u=tp_u&"�ʱ�����"&"\n"
		flag=false
	End IF	
	IF zm_content<>"" Then
		IF L_length(zm_content)>1000Then
			tp_u=tp_u&"��ע������1000���ַ�����"&"\n"
			flag=false
		End IF
	End IF	
	IF Lcase(Session("SooJs_Un"))<>Lcase(zsoojs_code) Then
		tp_u=tp_u&"��֤�����"&"\n"
		flag=false
	End IF		
	IF flag=false Then
		response.Write "<script>"
		response.Write "alert('"&tp_u&"');"
		response.Write "history.back(-1);"
		response.Write "</script>"
		Response.End()
	End IF	
	Set oRs_jf=Server.CreateObject(G_RS)
	oRs_jf.open "Select * From qingtiandy_jifen_goods Where id="&zjid,conn,1,1
	IF oRs_jf.Eof Then
		Response.Redirect "./j_glist.asp"
		Response.End()
	Else
		og_jifen=oRs_jf("g_jifen")
	End IF
	Set oRs_jf2=Server.CreateObject(G_RS)
	oRs_jf2.open "Select soojs_u_email,soojs_jifen From soojs_un Where id="&Request.Cookies(G_u_Cookies)("soojs_id"),conn,1,1
	IF oRs_jf2.Eof Then
		Response.Redirect "Reg.asp?r="&GetRamNumb(8)
		Response.End()
	Else
		osoojs_jifen=oRs_jf2("soojs_jifen")
		osoojs_u_email=oRs_jf2("soojs_u_email")
		
	End IF
	IF Clng(og_jifen)>Clng(osoojs_jifen) Then
		Response.Write "<script>alert('�Բ���"&G_jifen_jifen_name&"����');window.location='./j_getcode.asp'</script>"
		Response.End()
	End IF
	
	Set oRs_jf3=Server.CreateObject(G_RS)
	oRs_jf3.open "Select * From qingtiandy_jifen_goodsman Where 1<>1",conn,1,3
	IF oRs_jf3.Eof Then
		oRs_jf3.Addnew()
		oRs_jf3("uid")=Request.Cookies(G_u_Cookies)("soojs_id")
		oRs_jf3("m_name")=zm_name
		oRs_jf3("m_tel")=zm_tel
		oRs_jf3("m_email")=osoojs_u_email
		oRs_jf3("m_addr")=zm_addr
		oRs_jf3("m_code")=zm_code
		oRs_jf3("m_content")=zm_content
		oRs_jf3("jid")=zjid
		oRs_jf3("m_time")=ForMatDate(now(),55)
		oRs_jf3("m_look")=0
		oRs_jf3("m_qq")=zm_qq
		oRs_jf3("m_shouji")=zm_shouji
		oRs_jf3.Update
		flag2=False
	End IF
	conn.Execute("Update qingtiandy_jifen_goods Set g_numb=g_numb+1 Where id="&zjid)
	IF Not flag2 Then
		Set oRs_jf4=Server.CreateObject(G_RS)
		oRs_jf4.open "Select * From soojs_un Where id="&Request.Cookies(G_u_Cookies)("soojs_id"),conn,1,3
		IF Not oRs_jf4.Eof Then
			oRs_jf4("soojs_jifen")=oRs_jf4("soojs_jifen")-og_jifen
			IF GetRp(oRs_jf4("soojs_u_code"))="" Then oRs_jf4("soojs_u_code")=zm_code
			IF oRs_jf4("soojs_u_tel")="" Then oRs_jf4("soojs_u_tel")=zm_tel
			IF oRs_jf4("soojs_u_addr")="" Then oRs_jf4("soojs_u_addr")=zm_addr
			oRs_jf4.update()
		End IF
		Get_qingtiandy_jifen_ip Request.Cookies(G_u_Cookies)("soojs_id"),4,-og_jifen
		Response.Write "<script>alert('�Ѿ��ɹ��ύ�ҽ������ǻ���2������������ϵ����лл֧��.');window.location='./j_glist.asp'</script>"
	Else
		Response.Write "<script>window.location='./j_gdetail.asp?id="&zjid&"'</script>"
	End IF
End Sub

Sub getpass2()
	zsoojs_u_email=ReplaceText(Request("soojs_u_email"))
	zsoojs_u_card=ReplaceText(Request("soojs_u_card"))
	Dim oRs
	Set oRs=conn.Execute("Select * From soojs_un Where soojs_u_email='"&zsoojs_u_email&"' And soojs_u_card='"&zsoojs_u_card&"' And soojs_u_card<>''")
	IF Not  oRs.Eof Then
		Session("u_email")="2"
		Session("u_email_str")=""
		Response.Redirect "./ugetpass.asp?p="&server.URLEncode(oRs("soojs_u_pass"))
	Else
		Session("u_email")="1"
		Response.Redirect "./ugetpass.asp"
	End IF		
End Sub

Sub getpass22()
	zsoojs_u_email=ReplaceText(Request("soojs_u_email"))
	zsoojs_u_name=ReplaceText(Request("soojs_u_name"))
	Dim oRs
	Set oRs=conn.Execute("Select * From soojs_un Where soojs_u_email='"&zsoojs_u_email&"' And soojs_u_name='"&zsoojs_u_name&"' And soojs_u_name<>''")
	IF Not  oRs.Eof Then
		Session("u_email")="2"
		Session("u_email_str")=""
		kstr=qTcms_SendEmail(oRs("soojs_u_name"),oRs("soojs_u_pass"),oRs("soojs_u_email"))
		Response.Redirect "./ugetpass2.asp?p="&kstr&"&e="&server.HTMLEncode(zsoojs_u_email)
	Else
		Session("u_email")="1"
		Response.Redirect "./ugetpass2.asp"
	End IF		
End Sub

Sub getpass1()
	zemail=ReplaceText(Request("email"))
	Dim oRs
	Set oRs=conn.Execute("Select * From soojs_un Where soojs_u_email='"&zemail&"'")
	IF oRs.Eof Then
		Session("u_email")=""
		Session("u_email_str")=""
	Else
		Session("u_email")="1"
		Session("u_email_str")=zemail
	End IF
	Response.Redirect "./ugetpass.asp"
	Response.End()
End Sub

Sub getpass11()
	zemail=ReplaceText(Request("email"))
	Dim oRs
	Set oRs=conn.Execute("Select * From soojs_un Where soojs_u_email='"&zemail&"'")
	IF oRs.Eof Then
		Session("u_email")=""
		Session("u_email_str")=""
	Else
		Session("u_email")="1"
		Session("u_email_str")=zemail
	End IF
	Response.Redirect "./ugetpass2.asp"
	Response.End()
End Sub


Sub c_l_add()
	zlist_url=ReplaceText(Request("list_url"))
	zlist_name=ReplaceText(Request("list_name"))
	zlist_biaoqian=ReplaceText(Request("list_biaoqian"))
	zlist_type1=Bint(Request("list_type1"))
	zlist_content=ReplaceText(ReplaceTextArea(Request.Form("list_content")))
	zlist_gx=Bint(Request("list_gx"))
	zlist_no=Bint(Request("list_no"))
	zid=Bint(Request("id"))
	IF zlist_url="" Then
		Response.Redirect "./c_l_add.asp?p="&server.URLEncode("��ҳ��ַ����Ϊ��")
		Response.End()
	End IF
	IF zlist_name="" Then
		Response.Redirect "./c_l_add.asp?p="&server.URLEncode("���ⲻ��Ϊ��")
		Response.End()
	End IF
	IF Request.Cookies(G_u_Cookies)("soojs_id")="" Then
		Response.Redirect "./c_l_add.asp?p="&server.URLEncode("���ȵ�½")
		Response.End()		
	End IF	
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM qingtiandy_listurl WHERE id=" & zid&" And list_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		If .Eof Then 
			.AddNew()
			Set Rs1 = Conn.Execute("Select * from qingtiandy_listurl where list_url = '"& zlist_url &"' And list_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id")))
			If Not Rs1.Eof Then
				Response.Redirect "./c_l_add.asp?p="&server.URLEncode("��ҳ��ַ�Ѿ�����")
				Response.End()
			End If
			Rs1.Close : Set Rs1 = Nothing	
			.Fields.Item("list_date").Value		= ForMatDate(now(),55)			
		Else
			Set Rs1 = Conn.Execute("Select * from qingtiandy_listurl where list_url = '"& zlist_url &"' And id<>"&zid&" And list_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id")))
			If Not Rs1.Eof Then
				Response.Redirect "./c_l_add.asp?p="&server.URLEncode("��ҳ��ַ�Ѿ�����")&"&id="&zid
				Response.End()
			End If
			Rs1.Close : Set Rs1 = Nothing			
		End If
		.Fields.Item("list_url").Value		= zlist_url
		.Fields.Item("list_name").Value		= zlist_name
		.Fields.Item("list_biaoqian").Value	= zlist_biaoqian
		.Fields.Item("list_type1").Value	= zlist_type1
		.Fields.Item("list_content").Value	= zlist_content
		.Fields.Item("list_gx").Value		= zlist_gx
		.Fields.Item("list_uid").Value		= Request.Cookies(G_u_Cookies)("soojs_id")
		.Fields.Item("list_no").Value		= zlist_no
		.Update()
		Response.Redirect "./c_l_list.asp"
		Response.End()
	End With
End Sub

Sub c_l_add_ajax()
	Response.Buffer=True
	response.contenttype="text/html;charset=gb2312"
	zlist_url=ReplaceText(Request("list_url"))
	zlist_name=ReplaceText(Request("list_name"))
	zlist_biaoqian=ReplaceText(Request("list_biaoqian"))
	zlist_type1=Bint(Request("list_type1"))
	zlist_content=ReplaceText(ReplaceTextArea(Request.Form("list_content")))
	zlist_gx=Bint(Request("list_gx"))
	zlist_no=Bint(Request("list_no"))
	zid=Bint(Request("id"))
	IF zlist_url="" Then
		Response.Write "{error}��ҳ��ַ����Ϊ�գ�"
		Response.End()
	End IF
	IF zlist_name="" Then
		Response.Write "{error}���ⲻ��Ϊ�գ�"
		Response.End()
	End IF
	IF Request.Cookies(G_u_Cookies)("soojs_id")="" Then
		Response.Write "{error}���ȵ�½��"
		Response.End()		
	End IF
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM qingtiandy_listurl WHERE id=" & zid&" And list_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		If .Eof Then 
			.AddNew()
			Set Rs1 = Conn.Execute("Select * from qingtiandy_listurl where list_url = '"& zlist_url &"' And list_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id")))
			If Not Rs1.Eof Then
				Response.Write "{error}��ҳ��ַ�Ѿ����ڣ�"
				Response.End()
			End If
			Rs1.Close : Set Rs1 = Nothing	
			.Fields.Item("list_date").Value		= ForMatDate(now(),55)			
		Else
			Set Rs1 = Conn.Execute("Select * from qingtiandy_listurl where list_url = '"& zlist_url &"' And id<>"&zid&" And list_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id")))
			If Not Rs1.Eof Then
				Response.Write "{error}��ҳ��ַ�Ѿ����ڣ�"
				Response.End()
			End If
			Rs1.Close : Set Rs1 = Nothing			
		End If
		.Fields.Item("list_url").Value		= zlist_url
		.Fields.Item("list_name").Value		= zlist_name
		.Fields.Item("list_biaoqian").Value	= ""
		.Fields.Item("list_type1").Value	= 0
		.Fields.Item("list_content").Value	= ""
		.Fields.Item("list_gx").Value		= 0
		.Fields.Item("list_uid").Value		= Request.Cookies(G_u_Cookies)("soojs_id")
		.Fields.Item("list_no").Value		= 0
		.Update()
		Response.End()
	End With
End Sub

Sub c_l_del()
	sid=Bint(Request("id"))
	conn.Execute("Delete From qingtiandy_listurl Where id="&sid&" And list_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id")))
	Response.Redirect "c_l_list.asp"
	Response.End()
End Sub


Sub c_t_del()
	sid=Bint(Request("id"))
	conn.Execute("Delete From qingtiandy_curl Where id="&sid&" And c_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id")))
	Response.Redirect "c_t_list.asp"
	Response.End()
End Sub


Sub c_t_add()
	zc_typename=ReplaceText(Request("c_typename"))
	zid=Bint(Request("id"))
	IF zc_typename="" Then
		Response.Redirect "./c_t_add.asp?p="&server.URLEncode("�������Ʋ���Ϊ��")
		Response.End()
	End IF
	
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM qingtiandy_curl WHERE id=" & zid&" And c_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		If .Eof Then 
			.AddNew()
			Set Rs1 = Conn.Execute("Select * from qingtiandy_curl where c_typename = '"& zc_typename &"' And c_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id")))
			If Not Rs1.Eof Then
				Response.Redirect "./c_t_add.asp?p="&server.URLEncode("�˷������Ѿ�����")
				Response.End()
			End If
			Rs1.Close : Set Rs1 = Nothing				
		Else
			Set Rs1 = Conn.Execute("Select * from qingtiandy_curl where c_typename = '"& zc_typename &"' And id<>"&zid&" And c_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id")))
			If Not Rs1.Eof Then
				Response.Redirect "./c_t_add.asp?p="&server.URLEncode("�˷�����("&zc_typename&")�Ѿ�����")&"&id="&zid
				Response.End()
			End If
			Rs1.Close : Set Rs1 = Nothing			
		End If
		.Fields.Item("c_typename").Value	= zc_typename
		.Fields.Item("c_no").Value			= 1
		.Fields.Item("c_uid").Value			= Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
		.Update()
		Response.Redirect "./c_t_list.asp"
		Response.End()
	End With
End Sub


Sub w_add_yz()
	Response.Redirect "./w_add_yz_ok.asp?id="&Bint(Request("id"))
	Response.End()
	Dim str,path
	str=""
	sid=Bint(Request("id"))
	Set oRs=conn.Execute("Select * From qingtiandy_url Where id="&sid&" And w_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id")))
	IF Not oRs.Eof Then
		str=oRs("w_ser")
		path=Add_Root_Dir(G_BIG_T&"/users/0/"&oRs("id")&".txt")
		N_Fso.CreateFolderFile path,str
		TransferFile path, "text/plain",""&G_union_my&".txt"		
		Response.End()
	End IF
End Sub




Sub delweb()
	sid=Bint(Request("id"))
	conn.Execute("Delete From qingtiandy_url Where id="&sid&" And w_uid="&Bint(Request.Cookies(G_u_Cookies)("soojs_id")))
	Response.Redirect "w_list.asp"
	Response.End()
End Sub

Sub w_a()
	sw_url=ReplaceText(Request("w_url"))
	sw_name=ReplaceText(Request("w_name"))
	sw_type1=Bint(Request("w_type1"))
	sw_number=Bint(Request("w_number"))
	sw_content=Request.Form("w_content")
	sw_content=ReplaceText(ReplaceTextArea(sw_content))
	sw_beian=ReplaceText(Request("w_beian"))
	sid=Bint(Request("id"))
	sUid=Bint(Request("uid"))
	suuu=ReplaceText(Request("uuu"))
	sw_ser=GetRamCode(40)
	tp_u=""
	flag=true	
	IF  Instr(sw_url,".")="" Then
		tp_u=tp_u&"��վ������ʽ����"&"\n"
		flag=false
	End IF	
	IF  L_length(sw_name)>40 or L_length(sw_name)<2 Then
		tp_u=tp_u&"2-40���ַ����ڵ�����"&"\n"
		flag=false
	End IF	
	IF sw_type1=0 Then
		'tp_u=tp_u&"��ѡ����վ���"&"\n"
		'flag=false	
	End IF
	IF sw_number=0 Then
		'tp_u=tp_u&"��ѡ����վ������"&"\n"
		'flag=false	
	End IF	
	IF  L_length(sw_content)>110 Then
		tp_u=tp_u&"��վ����ֻ����110���ַ�"&"\n"
		flag=false
	End IF	
	IF flag=false Then
		response.Write "<script>"
		response.Write "alert('"&tp_u&"');"
		response.Write "history.back(-1);"
		response.Write "</script>"
	End IF	
	
	IF flag Then
		Set rsObj = Server.CreateObject("ADODB.Recordset")
		With rsObj
			.Source = "SELECT * FROM qingtiandy_url WHERE id=" & sid&""
			.ActiveConnection = Conn
			.CursorType = 1
			.LockType = 3
			.Open()
			If .Eof Then 
				.AddNew()
				Set Rs1 = Conn.Execute("Select * from qingtiandy_url where w_url = '"& sw_url &"'")
				If Not Rs1.Eof Then
					Response.Redirect "./w_add.asp?p="&server.URLEncode("�������Ѵ��ڣ�����һ��")
					Response.End()
				End If
				Rs1.Close : Set Rs1 = Nothing				
				.Fields.Item("w_date").Value=ForMatDate(now(),55)
				.Fields.Item("dateandtime").Value=ForMatDate(now(),55)
			Else
				Set Rs1 = Conn.Execute("Select * from qingtiandy_url where w_url = '"& sw_url &"' And id<>"&sid)
				If Not Rs1.Eof Then
					Response.Redirect "./w_add.asp?id="&sid&"&p="&server.URLEncode("�������Ѵ��ڣ�����һ��")
					Response.End()
				End If
				Rs1.Close : Set Rs1 = Nothing			
			End If
			IF suuu="0" Then
			.Fields.Item("w_url").Value			= sw_url
			.Fields.Item("w_domain").Value		= Replace(split(sw_url,"/")(0),"www.","")
			End IF
			.Fields.Item("w_name").Value		= sw_name
			.Fields.Item("w_type1").Value		= sw_type1
			.Fields.Item("w_number").Value		= sw_number
			.Fields.Item("w_content").Value		= sw_content
			.Fields.Item("w_beian").Value		= sw_beian
			.Fields.Item("w_uid").Value			= sUid
			.Fields.Item("w_editdate").Value	= ForMatDate(now(),55)
			.Fields.Item("w_status").Value		= 0
			.Fields.Item("w_ser").Value			= sw_ser
			IF hxLook=1 Then
			.Fields.Item("w_look").Value			= 1
			Else
			.Fields.Item("w_look").Value			= 0
			End IF
			.Update()
			path=Add_Root_Dir(G_BIG_T&"/users/0/"&.Fields.Item("id").Value&".txt")
			N_Fso.CreateFolderFile path,sw_ser			
			Response.Redirect "w_add_yz.asp?u1="&.Fields.Item("w_url").Value&"&id="&.Fields.Item("id").Value
		End With
	End IF	
	
End Sub



Sub WebAdd()
	ssoojs_uu_name=ReplaceText(Request("soojs_uu_name"))
	ssoojs_u_tel=ReplaceText(Request("soojs_u_tel"))
	ssoojs_u_addr=ReplaceText(Request("soojs_u_addr"))
	ssoojs_u_qq=ReplaceText(Request("soojs_u_qq"))
	tp_u=""
	flag=true	
	IF  L_length(ssoojs_uu_name)>8 or L_length(ssoojs_uu_name)<4Then
		tp_u=tp_u&"2-4���ֵ�������"&"\n"
		flag=false
	End IF	
	IF ssoojs_u_tel="" Then
		tp_u=tp_u&"�̶��绰(����-����)���ֻ�����Ϊ��"&"\n"
		flag=false		
	End IF
	IF ssoojs_u_addr="" Then
		tp_u=tp_u&"��ϸ��ַ����Ϊ��"&"\n"
		flag=false		
	End IF	
	IF  L_length(ssoojs_u_addr)>100Then
		tp_u=tp_u&"��ϸ��ַ100���ַ����ڵ�����"&"\n"
		flag=false
	End IF	
	IF flag=false Then
		response.Write "<script>"
		response.Write "alert('"&tp_u&"');"
		response.Write "history.back(-1);"
		response.Write "</script>"
	End IF	
	
	IF flag Then
		Set rsObj = Server.CreateObject("ADODB.Recordset")
		With rsObj
			.Source = "SELECT * FROM soojs_un WHERE id=" & Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&""
			.ActiveConnection = Conn
			.CursorType = 1
			.LockType = 3
			.Open()
			If .Eof Then 
				Response.Redirect "./login.asp?p="&server.URLEncode("��������֤�������")
				Response.End()
			End If
			IF .Fields.Item("soojs_u_Webf").Value="0" Then
				.Fields.Item("soojs_uu_name").Value=ssoojs_uu_name
				.Fields.Item("soojs_u_tel").Value=ssoojs_u_tel
				.Fields.Item("soojs_u_qq").Value=ssoojs_u_qq
				.Fields.Item("soojs_u_addr").Value=ssoojs_u_addr
				.Fields.Item("soojs_u_Webf").Value="1"
				.Update()		
				Response.Redirect "./w_add.asp?p="&server.URLEncode("վ�������Ѿ��ɹ����������ڽ�����һ��")
				Response.End()
			Else
				Response.Redirect "./webadd.asp?p="&server.URLEncode("���Ѿ���ͨ����")
				Response.End()				
			End IF
		End With
	End IF	
	
End Sub

Sub Editemail()
	'//---- �༭��¼ ----//'
	ssoojs_u_p=ReplaceText(Request("soojs_u_p"))
	ssoojs_u_email=ReplaceText(Request("soojs_u_email"))
	IF ssoojs_u_p="" Then
		Response.Redirect "./ueditemail.asp?p="&server.URLEncode("���벻��Ϊ��")
		Response.End()	
	End IF
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM soojs_un WHERE id=" & Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&" "
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		If .Eof Then 
			Response.Redirect "./login.asp?p="&server.URLEncode("��������֤�������")
			Response.End()
		End If
		
		IF .Fields.Item("soojs_u_pass").Value=ssoojs_u_p Then
			Set oRs2=Server.CreateObject(G_RS)
			oRs2.open "Select * From soojs_un Where soojs_u_email='"&ssoojs_u_email&"'",conn,1,3
			IF oRs2.Eof Then
				.Fields.Item("soojs_u_email").Value=ssoojs_u_email
			Else
				Response.Redirect "./ueditemail.asp?p="&server.URLEncode("�������Ѿ�����")
				Response.End()				
			End IF
		Else
			Response.Redirect "./ueditemail.asp?p="&server.URLEncode("���벻��ȷ")
			Response.End()			
		End IF
		.Update()		
		Response.Redirect "./ueditemail.asp?p="&server.URLEncode("�������޸ĳɹ�")
		Response.End()
	End With
End Sub

Sub Editemail_a()
	Response.Buffer=True
	response.contenttype="text/html;charset=gb2312"
	'//---- �༭��¼ ----//'
	ssoojs_u_p=ReplaceText(Request("soojs_u_p"))
	ssoojs_u_email=ReplaceText(Request("soojs_u_email"))
	IF ssoojs_u_p="" Then
		Response.Write "{error}���벻��Ϊ��"
		Response.End()
	End IF
	IF ssoojs_u_email="" Then
		Response.Write "{error}���䲻��Ϊ��"
		Response.End()
	End IF	
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM soojs_un WHERE id=" & Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&" "
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		If .Eof Then 
			Response.Write "{error}��������֤�������"
			Response.End()			
		End If
		
		IF .Fields.Item("soojs_u_pass").Value=ssoojs_u_p Then
			Set oRs2=Server.CreateObject(G_RS)
			oRs2.open "Select * From soojs_un Where soojs_u_email='"&ssoojs_u_email&"'",conn,1,3
			IF oRs2.Eof Then
				.Fields.Item("soojs_u_email").Value=ssoojs_u_email
			Else
				Response.Write "{error}�������Ѿ�����"
				Response.End()								
			End IF
		Else
			Response.Write "{error}���벻��ȷ"
			Response.End()						
		End IF
		.Update()		
		Response.Write "ok"
		Response.End()			
	End With
End Sub

Sub Editpass()
	'//---- �༭��¼ ----//'
	ssoojs_u_p=ReplaceText(Request("soojs_u_p"))
	ssoojs_u_p1=ReplaceText(Request("soojs_u_p1"))
	ssoojs_u_p2=ReplaceText(Request("soojs_u_p2"))
	IF ssoojs_u_p="" Then
		Response.Redirect "./ueditpass.asp?p="&server.URLEncode("�����벻��Ϊ��")
		Response.End()	
	End IF
	IF ssoojs_u_p1<>ssoojs_u_p2 Then
		Response.Redirect "./ueditpass.asp?p="&server.URLEncode("��������ȷ�����벻һ��")
		Response.End()
	End IF
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM soojs_un WHERE id=" & Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&""
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		If .Eof Then 
			Response.Redirect "./login.asp?p="&server.URLEncode("��������֤�������")
			Response.End()
		End If
		
		IF .Fields.Item("soojs_u_pass").Value=ssoojs_u_p Then
			.Fields.Item("soojs_u_pass").Value=ssoojs_u_p1
			on error resume next
			IF G_waibudiaoong_p1="1" Then
				wa=MD5("2055vip"&.Fields.Item("soojs_u_name").Value,32)
				wuser=.Fields.Item("soojs_u_name").Value
				wpass=ssoojs_u_p
				wpass2=ssoojs_u_p1
				on error resume next
				str=""&qtcmsdh.Qingtiandy_getHTTPPage("http://vip.2055.com/regzh.aspx?action=password&syskey="&wa&"&username="&wuser&"&password="&wpass&"&password2="&wpass2)
			End IF				
		Else
			Response.Redirect "./ueditpass.asp?p="&server.URLEncode("�����벻��ȷ")
			Response.End()			
		End IF
		.Update()		
		Response.Redirect "./ueditpass.asp?p="&server.URLEncode("�������޸ĳɹ�")
		Response.End()
	End With
End Sub

Sub Editpass_a()
	Response.Buffer=True
	response.contenttype="text/html;charset=gb2312"
	'//---- �༭��¼ ----//'
	ssoojs_u_p=ReplaceText(Request("soojs_u_p"))
	ssoojs_u_p1=ReplaceText(Request("soojs_u_p1"))
	ssoojs_u_p2=ReplaceText(Request("soojs_u_p2"))
	IF ssoojs_u_p="" Then
		Response.Write "{error}�����벻��Ϊ��"
		Response.End()		
	End IF
	IF ssoojs_u_p1<>ssoojs_u_p2 Then
		Response.Write "{error}��������ȷ�����벻һ��"
		Response.End()		
	End IF
	
	IF not L_checkpassword(ssoojs_u_p1) or trim(ssoojs_u_p1)="" or isnull(ssoojs_u_p1) Then
		Response.Write "{error}������������֣���ĸ���»������"
		Response.End()		
	End IF
	IF  L_length(ssoojs_u_p1)>14 or L_length(ssoojs_u_p1)<4Then
		Response.Write "{error}��������4���ַ�������ó���14���ַ�"
		Response.End()		
	End IF
	IF not L_checkpassword(ssoojs_u_p2) or trim(ssoojs_u_p2)="" or isnull(ssoojs_u_p2) Then
		Response.Write "{error}ȷ��������������֣���ĸ���»������"
		Response.End()		
	End IF
	IF  L_length(ssoojs_u_p2)>14 or L_length(ssoojs_u_p2)<4Then
		Response.Write "{error}ȷ����������4���ַ�������ó���14���ַ�"
		Response.End()			
	End IF	
		
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM soojs_un WHERE id=" & Bint(Request.Cookies(G_u_Cookies)("soojs_id"))&""
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		If .Eof Then 
			Response.Write "{error}��������֤�������"
			Response.End()			
		End If
		
		IF .Fields.Item("soojs_u_pass").Value=ssoojs_u_p Then
			.Fields.Item("soojs_u_pass").Value=ssoojs_u_p1			
			on error resume next
			IF G_waibudiaoong_p1="1" Then
				wa=MD5("2055vip"&.Fields.Item("soojs_u_name").Value,32)
				wuser=.Fields.Item("soojs_u_name").Value
				wpass=ssoojs_u_p
				wpass2=ssoojs_u_p1
				on error resume next
				str=""&qtcmsdh.Qingtiandy_getHTTPPage("http://vip.2055.com/regzh.aspx?action=password&syskey="&wa&"&username="&wuser&"&password="&wpass&"&password2="&wpass2)
			End IF			
			
		Else
			Response.Write "{error}�����벻��ȷ"
			Response.End()					
		End IF
		.Update()		
		Response.Write "ok"
		Response.End()
	End With
End Sub

Sub EditF()
	'//---- �༭��¼ ----//'
	ssoojs_sex=Bint(Request.Form("soojs_sex"))
	ssoojs_u_birth=ReplaceText(Request("yyyy"))&"-"&ReplaceText(Request("mm"))&"-"&ReplaceText(Request("dd"))
	ssoojs_u_Province=ReplaceText(Request("Province"))
	ssoojs_u_City=ReplaceText(Request("City"))
	ssoojs_u_card=ReplaceText(Request("soojs_u_card"))
	ssoojs_u_qq=ReplaceText(Request("soojs_u_qq"))
	ssoojs_u_msn=ReplaceText(Request("soojs_u_msn"))
	ssoojs_u_alipay=ReplaceText(Request("soojs_u_alipay"))
	ssoojs_u_alipay_name=ReplaceText(Request("soojs_u_alipay_name"))
	sIntroduction=ReplaceText(ReplaceTextArea(Request.Form("Introduction")))
	suuu=Bint(Request.Form("uuu"))
	Set rsObj = Server.CreateObject("ADODB.Recordset")
	With rsObj
		.Source = "SELECT * FROM soojs_un WHERE ID=" & Bint(Request.Cookies(G_u_Cookies)("soojs_id"))
		.ActiveConnection = Conn
		.CursorType = 1
		.LockType = 3
		.Open()
		If .Eof Then 
			Response.Redirect "./uedit.asp"
			Response.End()
		End If
		IF suuu="0" Then
		.Fields.Item("soojs_sex").Value	   			= ssoojs_sex
		.Fields.Item("soojs_u_birth").Value	    	= ssoojs_u_birth
		.Fields.Item("soojs_u_card").Value	    	= ssoojs_u_card
		End IF
		.Fields.Item("soojs_u_Province").Value	    = ssoojs_u_Province
		.Fields.Item("soojs_u_City").Value	    	= ssoojs_u_City		
		.Fields.Item("soojs_u_qq").Value	    	= ssoojs_u_qq
		.Fields.Item("soojs_u_msn").Value	    	= ssoojs_u_msn
		.Fields.Item("soojs_u_alipay").Value	    = ssoojs_u_alipay
		.Fields.Item("soojs_u_alipay_name").Value	= ssoojs_u_alipay_name
		.Update()		
		Response.Redirect "./uedit.asp?p=�޸ĳɹ�"
		Response.End()
	End With
End Sub

Sub LoginOut()
	Back_url=Request.QueryString("Back_url")
	Response.Cookies(G_u_Cookies)("soojs_u")=""
	Response.Cookies(G_u_Cookies)("soojs_jifen")=""
	Response.Cookies(G_u_Cookies)("soojs_id")=""
	Response.Cookies(G_u_Cookies)("soojs_lastdate")=""
	Response.Cookies(G_u_Cookies)("soojs_lastip")=""
	Response.Cookies(G_u_Cookies)("soojs_u_email")=""
	Response.Cookies(G_u_Cookies)("soojs_level")=""
	Response.Cookies(G_u_Cookies+"_a")=""
	Response.Cookies("qtcmsuser")=""
	'Ajax
	IF Back_url="noback" Then
		Response.Write "ok"
		Response.End()
	End IF
	IF Back_url<>"" Then
		Response.Redirect Back_url
	Else
		Response.Redirect "./login.asp"
	End IF
	Response.End()
End Sub

Sub Loginf()

	zsoojs_u_email=request.Form("soojs_u_email")
	zsoojs_u_pass=request.Form("soojs_u_pass")	
	zalt=request.Form("alt")
	
	Flag=true		
	IF zsoojs_u_email="" Then
		tp_u=tp_u&"��������ȷ���ǳƻ�EMAIL!\n"
		Flag=False
	End IF	
	IF zsoojs_u_pass="" Then
		tp_u=tp_u&"��������ȷ������!"
		Flag=False
	End IF		
	IF flag=false Then
		IF zalt="" Then
			response.Write "<script>"
			'response.Write "alert('"&tp_u&"');"
			response.Write "window.location='./login.asp?p="&server.URLEncode(tp_u)&"';"
			response.Write "</script>"	
		Else
			Response.Redirect "./login.asp?p="&server.URLEncode(tp_u)
		End IF
		response.End()
	End IF
	IF flag Then
		uu=replace(zsoojs_u_email,"'","")
		pp=replace(zsoojs_u_pass,"'","")	
		Set rs_u=conn.execute("select soojs_u_name,soojs_uu_name,soojs_lastip,soojs_lastdate,soojs_jifen,soojs_thisdate,soojs_level,id,soojs_u_email,soojs_u_f1 from soojs_un where (soojs_u_name='"&uu&"' or soojs_u_email='"&uu&"') and soojs_u_pass='"&pp&"'")
	
		IF Not rs_u.Eof Then			
			IF Bint(rs_u("soojs_u_f1"))="1" Then
				response.Redirect "./login.asp?p="&server.URLEncode("�Բ��������ʺ��Ѿ���������")
				Response.End()
			End IF
			conn.execute("update soojs_un set soojs_lastdate='"&FormatDate(now(),55)&"', soojs_lastip='"&getIP()&"' where soojs_u_name='"&uu&"' and soojs_u_pass='"&pp&"'")
			Get_qingtiandy_jifen_ip rs_u("id"),3,0
			response.Cookies(G_u_Cookies)("soojs_u")=rs_u("soojs_u_name")
			response.Cookies(G_u_Cookies)("soojs_jifen")=rs_u("soojs_jifen")
			response.Cookies(G_u_Cookies)("soojs_id")=rs_u("id")
			response.Cookies(G_u_Cookies)("soojs_lastdate")=rs_u("soojs_lastdate")
			response.Cookies(G_u_Cookies)("soojs_lastip")=rs_u("soojs_lastip")
			response.Cookies(G_u_Cookies)("soojs_u_email")=rs_u("soojs_u_email")	
			response.Cookies("qtcmsuser")=vbsE(rs_u("soojs_u_name"))	
			Back_url=request("Back_url")
			'response.Cookies(G_u_Cookies+"_a")=rs_u("id")
			'Response.Cookies(G_u_Cookies+"_a").expires=now()+100
			Response.Cookies(G_u_Cookies).expires=now()+100
			response.Cookies("soojsjj")="0"
			
			IF Back_url="" Then
				Back_url="./default.asp"
			Else
				Back_url=request("Back_url")
			End IF				
			'response.Cookies("soojsu2")=rs_u("soojs_u_name")
			Response.Write "<script>setCookie('soojsu2','"&rs_u("soojs_u_name")&"')</sc"&"ript>"
			

			IF G_Uc_tongbu="1" Then
				str3=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_get_user&u="&uu&"&p="&pp&"&t="&GetRamCode(50)))
				
				
				str3_txt=N_Fso.ReadAllTextFile(Add_Root_Dir("/uc/tip/1.html"))
				str3_txt=Replace(str3_txt,"{msg1}","��ϲ������½�ɹ�!")
				str3_txt=Replace(str3_txt,"{msg2}",Back_url)					
				str3_txt=Replace(str3_txt,"{msg3}",str3)		
				Response.Write 	str3_txt	
				Response.End()				
				
			End IF
			
			'Response.End()
			
					
			response.Redirect Back_url
		Else
			IF G_Uc_tongbu="1" Then
				str=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_user_login&u="&uu&"&p="&zsoojs_u_pass&"&t="&GetRamCode(50)))
				
				IF Instr(str,"{ok}")>0 Then '˵�������û�
					str_aa=split(str,"||")
					uid_1=str_aa(1) '�û�ID
					uu_1=str_aa(2) '�û���
					pp_1=str_aa(3) '����
					ee_1=str_aa(4) 'Email

					Set oRsbb=server.CreateObject(G_RS)
					Sql="select * from soojs_un where soojs_u_name='"&uu_1&"'"
					oRsbb.open Sql,Conn,1,3	
					IF Not oRsbb.Eof Then
						oRsbb("soojs_u_pass")=pp_1
						oRsbb.Update()
					Else
						zsoojs_u_name=uu_1
						zsoojs_u_pass=pp_1
						zsoojs_u_email=ee_1
						oRsbb.addnew
						oRsbb("soojs_u_name")=zsoojs_u_name
						oRsbb("soojs_u_pass")=zsoojs_u_pass
						oRsbb("soojs_uu_name")=zsoojs_u_name
						oRsbb("soojs_u_ask")=""
						oRsbb("soojs_u_ok")=""
						oRsbb("soojs_u_tel")=""
						oRsbb("soojs_u_qq")=""
						oRsbb("soojs_u_email")=zsoojs_u_email
						oRsbb("soojs_u_addr")=""			
						oRsbb("soojs_u_content")=""									
						oRsbb("soojs_date")=FormatDate(now,55)'ע��ʱ��
						oRsbb("soojs_thisdate")=FormatDate(now,55)'ע��ʱ��	
						oRsbb("soojs_lastdate")=FormatDate(now,55)'ע��ʱ��					
						oRsbb("soojs_ip")=getIP()
						oRsbb("soojs_thisip")=getIP()	
						oRsbb("soojs_lastip")=getIP()	
						oRsbb("soojs_level")=0	
						IF G_zhuce_j2="" Then
							oRsbb("soojs_jifen")=0	
						Else
							oRsbb("soojs_jifen")=G_zhuce_j2
						End IF		
						oRsbb("soojs_sex")=0
						oRsbb("soojs_u_card")=""
						oRsbb("soojs_u_msn")=""
						oRsbb("soojs_u_birth")="1980-01-01"
						oRsbb("soojs_u_Province")=""
						oRsbb("soojs_u_City")=""
						oRsbb("soojs_status")=0
						oRsbb("soojs_u_code")=""
						oRsbb("soojs_u_tuiguang")=""
						oRsbb("soojs_1616_manager")="3,8,9,10,11,12,13,14,16,18"
						oRsbb("soojs_1616_manager")=""
						oRsbb("soojs_jifen_G_jifen_s_f_1")=""
						oRsbb("soojs_jifen_G_jifen_s_f_today")=0
						oRsbb("soojs_u_f1")=0	
						oRsbb("soojs_yz_str")=""	
						IF G_xiaxian_1="1" or G_xiaxian_2="1" Then
							oRsbb("soojs_u_xiaxian")=Bint(Request.Cookies(G_u_Cookies+"xiaxian"))
							AddTG Bint(Request.Cookies(G_u_Cookies+"xiaxian")),1
						End IF
						oRsbb.update						
					End IF
					
					conn.execute("update soojs_un set soojs_lastdate='"&FormatDate(now(),55)&"', soojs_lastip='"&getIP()&"' where soojs_u_name='"&zsoojs_u_name&"' and soojs_u_pass='"&zsoojs_u_pass&"'")
					Get_qingtiandy_jifen_ip oRsbb("id"),3,0
					response.Cookies(G_u_Cookies)("soojs_u")=zsoojs_u_name
					response.Cookies(G_u_Cookies)("soojs_jifen")=oRsbb("soojs_jifen")
					response.Cookies(G_u_Cookies)("soojs_id")=oRsbb("id")
					response.Cookies(G_u_Cookies)("soojs_lastdate")=oRsbb("soojs_lastdate")
					response.Cookies(G_u_Cookies)("soojs_lastip")=oRsbb("soojs_lastip")
					response.Cookies(G_u_Cookies)("soojs_u_email")=oRsbb("soojs_u_email")	
					response.Cookies("qtcmsuser")=vbsE(oRsbb("soojs_u_name"))	
					Back_url=request("Back_url")
					'response.Cookies(G_u_Cookies+"_a")=rs_u("id")
					'Response.Cookies(G_u_Cookies+"_a").expires=now()+100
					Response.Cookies(G_u_Cookies).expires=now()+100
					response.Cookies("soojsjj")="0"					
					oRsbb.close

					str3=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_user_synlogin&uid="&uid_1&"&p="&zsoojs_u_pass&"&t="&GetRamCode(50)))
					
					IF Back_url="" Then
						Back_url="./default.asp"
					Else
						Back_url=request("Back_url")
					End IF	
					
					str3_txt=N_Fso.ReadAllTextFile(Add_Root_Dir("/uc/tip/1.html"))
					str3_txt=Replace(str3_txt,"{msg1}","��ϲ������½�ɹ�!")
					str3_txt=Replace(str3_txt,"{msg2}",Back_url)					
					str3_txt=Replace(str3_txt,"{msg3}",str3)		
					Response.Write 	str3_txt	
					Response.End()
					'response.Redirect Back_url			
				End IF
			Else
				Set oRsbb=server.CreateObject(G_RS)
				Sql="select * from soojs_un where soojs_u_name='"&uu&"'"
				oRsbb.open Sql,Conn,1,3	
				IF Not oRsbb.Eof Then
					pp_1=Md5(Md5(pp,32)&oRsbb("soojs_u_uc"),32)
					
					IF oRsbb("soojs_u_pass")=pp_1 Then
						'��½�ɹ�
						oRsbb("soojs_u_pass")=pp
						oRsbb.Update()
						
						conn.execute("update soojs_un set soojs_lastdate='"&FormatDate(now(),55)&"', soojs_lastip='"&getIP()&"' where soojs_u_name='"&uu&"' and soojs_u_pass='"&pp&"'")
						Get_qingtiandy_jifen_ip oRsbb("id"),3,0
						response.Cookies(G_u_Cookies)("soojs_u")=oRsbb("soojs_u_name")
						response.Cookies(G_u_Cookies)("soojs_jifen")=oRsbb("soojs_jifen")
						response.Cookies(G_u_Cookies)("soojs_id")=oRsbb("id")
						response.Cookies(G_u_Cookies)("soojs_lastdate")=oRsbb("soojs_lastdate")
						response.Cookies(G_u_Cookies)("soojs_lastip")=oRsbb("soojs_lastip")
						response.Cookies(G_u_Cookies)("soojs_u_email")=oRsbb("soojs_u_email")	
						response.Cookies("qtcmsuser")=vbsE(oRsbb("soojs_u_name"))	
						Back_url=request("Back_url")
						'response.Cookies(G_u_Cookies+"_a")=rs_u("id")
						'Response.Cookies(G_u_Cookies+"_a").expires=now()+100
						Response.Cookies(G_u_Cookies).expires=now()+100
						response.Cookies("soojsjj")="0"
						
						IF Back_url="" Then
							Back_url="./default.asp"
						Else
							Back_url=request("Back_url")
						End IF				
						'response.Cookies("soojsu2")=rs_u("soojs_u_name")
						Response.Write "<script>setCookie('soojsu2','"&oRsbb("soojs_u_name")&"')</sc"&"ript>"	
						response.Redirect Back_url					
					Else
						response.Redirect "./login.asp?p="&server.URLEncode("��������ȷ�����룡")	
						
					End IF
					
				Else
					response.Redirect "./login.asp?p="&server.URLEncode("��������ȷ�����룡")
				End IF			
			End IF			
			response.Redirect "./login.asp?p="&server.URLEncode("��������ȷ�����룡")
		End IF	
	End IF
	
End Sub

Sub Loginf_a()
	Response.Buffer=True
	response.contenttype="text/html;charset=gb2312"
	zsoojs_u_email=request("soojs_u_email")
	zsoojs_u_pass=request("soojs_u_pass")	
	
	Flag=true		
	IF zsoojs_u_email="" Then
		tp_u=tp_u&"��������ȷ���ǳƻ�EMAIL!"
		Flag=False
	End IF	
	IF flag=false Then
		Response.Write "{error}"&tp_u
		Response.End()
	End IF	
	IF zsoojs_u_pass="" Then
		tp_u=tp_u&"��������ȷ������!"
		Flag=False
	End IF		
	IF flag=false Then
		Response.Write "{error}"&tp_u
		Response.End()
	End IF
	IF flag Then
		uu=replace(zsoojs_u_email,"'","")
		pp=replace(zsoojs_u_pass,"'","")	
		Set rs_u=conn.execute("select soojs_u_name,soojs_lastip,soojs_lastdate,soojs_jifen,soojs_thisdate,soojs_level,id,soojs_u_email,soojs_u_f1 from soojs_un where (soojs_u_name='"&uu&"' or soojs_u_email='"&uu&"') and soojs_u_pass='"&pp&"'")
		IF Not rs_u.Eof Then
			IF Bint(rs_u("soojs_u_f1"))="1" Then
				Response.Write "{error}�Բ��������ʺ��Ѿ���������"
				Response.End()
			End IF
			conn.execute("update soojs_un set soojs_lastdate='"&FormatDate(now(),55)&"', soojs_lastip='"&getIP()&"' where soojs_u_name='"&uu&"' and soojs_u_pass='"&pp&"'")
			Get_qingtiandy_jifen_ip rs_u("id"),3,0
			response.Cookies(G_u_Cookies)("soojs_u")=uu
			response.Cookies(G_u_Cookies)("soojs_jifen")=rs_u("soojs_jifen")
			response.Cookies(G_u_Cookies)("soojs_id")=rs_u("id")
			response.Cookies(G_u_Cookies)("soojs_lastdate")=rs_u("soojs_lastdate")
			response.Cookies(G_u_Cookies)("soojs_lastip")=rs_u("soojs_lastip")
			response.Cookies(G_u_Cookies)("soojs_u_email")=rs_u("soojs_u_email")	
			response.Cookies("qtcmsuser")=vbsE(rs_u("soojs_u_name"))		
			Back_url=request("Back_url")
			'response.Cookies(G_u_Cookies+"_a")=rs_u("id")
			'Response.Cookies(G_u_Cookies+"_a").expires=now()+100
			Response.Cookies(G_u_Cookies).expires=now()+100
			response.Cookies("soojsjj")="0"
			
			Response.Write "<script>setCookie('soojsu2','"&rs_u("soojs_u_name")&"')</script>"
			
			IF G_Uc_tongbu="1" Then
				str3=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_get_user&u="&uu&"&p="&pp&"&t="&GetRamCode(50)))
				
				
				str3_txt=N_Fso.ReadAllTextFile(Add_Root_Dir("/uc/tip/1.html"))
				str3_txt=Replace(str3_txt,"{msg1}","��ϲ������½�ɹ�!")
				str3_txt=Replace(str3_txt,"{msg2}",Back_url)					
				str3_txt=Replace(str3_txt,"{msg3}",str3)		
				Response.Write 	str3	
				Response.End()				
				
			End IF		
			
			Response.Write "ok"
		Else
		
			IF G_Uc_tongbu="1" Then
				str=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_user_login&u="&uu&"&p="&pp&"&t="&GetRamCode(50)))
				
				IF Instr(str,"{ok}")>0 Then '˵�������û�
					str_aa=split(str,"||")
					uid_1=str_aa(1) '�û�ID
					uu_1=str_aa(2) '�û���
					pp_1=str_aa(3) '����
					ee_1=str_aa(4) 'Email
					zsoojs_u_name=uu_1
					zsoojs_u_pass=pp_1
					zsoojs_u_email=ee_1
					Set oRsbb=server.CreateObject(G_RS)
					Sql="select * from soojs_un where soojs_u_name='"&uu_1&"'"
					oRsbb.open Sql,Conn,1,3	
					IF Not oRsbb.Eof Then
						oRsbb("soojs_u_pass")=pp_1
						oRsbb.Update()
					Else
						oRsbb.addnew
						oRsbb("soojs_u_name")=zsoojs_u_name
						oRsbb("soojs_u_pass")=zsoojs_u_pass
						oRsbb("soojs_uu_name")=zsoojs_u_name
						oRsbb("soojs_u_ask")=""
						oRsbb("soojs_u_ok")=""
						oRsbb("soojs_u_tel")=""
						oRsbb("soojs_u_qq")=""
						oRsbb("soojs_u_email")=zsoojs_u_email
						oRsbb("soojs_u_addr")=""			
						oRsbb("soojs_u_content")=""									
						oRsbb("soojs_date")=FormatDate(now,55)'ע��ʱ��
						oRsbb("soojs_thisdate")=FormatDate(now,55)'ע��ʱ��	
						oRsbb("soojs_lastdate")=FormatDate(now,55)'ע��ʱ��					
						oRsbb("soojs_ip")=getIP()
						oRsbb("soojs_thisip")=getIP()	
						oRsbb("soojs_lastip")=getIP()	
						oRsbb("soojs_level")=0	
						IF G_zhuce_j2="" Then
							oRsbb("soojs_jifen")=0	
						Else
							oRsbb("soojs_jifen")=G_zhuce_j2
						End IF		
						oRsbb("soojs_sex")=0
						oRsbb("soojs_u_card")=""
						oRsbb("soojs_u_msn")=""
						oRsbb("soojs_u_birth")="1980-01-01"
						oRsbb("soojs_u_Province")=""
						oRsbb("soojs_u_City")=""
						oRsbb("soojs_status")=0
						oRsbb("soojs_u_code")=""
						oRsbb("soojs_u_tuiguang")=""
						oRsbb("soojs_1616_manager")="3,8,9,10,11,12,13,14,16,18"
						oRsbb("soojs_1616_manager")=""
						oRsbb("soojs_jifen_G_jifen_s_f_1")=""
						oRsbb("soojs_jifen_G_jifen_s_f_today")=0
						oRsbb("soojs_u_f1")=0	
						oRsbb("soojs_yz_str")=""	
						IF G_xiaxian_1="1" or G_xiaxian_2="1" Then
							oRsbb("soojs_u_xiaxian")=Bint(Request.Cookies(G_u_Cookies+"xiaxian"))
							AddTG Bint(Request.Cookies(G_u_Cookies+"xiaxian")),1
						End IF
						oRsbb.update						
					End IF
					
					conn.execute("update soojs_un set soojs_lastdate='"&FormatDate(now(),55)&"', soojs_lastip='"&getIP()&"' where soojs_u_name='"&zsoojs_u_name&"' and soojs_u_pass='"&zsoojs_u_pass&"'")
					Get_qingtiandy_jifen_ip oRsbb("id"),3,0
					response.Cookies(G_u_Cookies)("soojs_u")=zsoojs_u_name
					response.Cookies(G_u_Cookies)("soojs_jifen")=oRsbb("soojs_jifen")
					response.Cookies(G_u_Cookies)("soojs_id")=oRsbb("id")
					response.Cookies(G_u_Cookies)("soojs_lastdate")=oRsbb("soojs_lastdate")
					response.Cookies(G_u_Cookies)("soojs_lastip")=oRsbb("soojs_lastip")
					response.Cookies(G_u_Cookies)("soojs_u_email")=oRsbb("soojs_u_email")	
					response.Cookies("qtcmsuser")=vbsE(zsoojs_u_name)	
					Back_url=request("Back_url")
					'response.Cookies(G_u_Cookies+"_a")=rs_u("id")
					'Response.Cookies(G_u_Cookies+"_a").expires=now()+100
					Response.Cookies(G_u_Cookies).expires=now()+100
					response.Cookies("soojsjj")="0"					
					oRsbb.close

					str3=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_user_synlogin&uid="&uid_1&"&p="&zsoojs_u_pass&"&t="&GetRamCode(50)))
					
					IF Back_url="" Then
						Back_url="./default.asp"
					Else
						Back_url=request("Back_url")
					End IF	
					
					str3_txt=N_Fso.ReadAllTextFile(Add_Root_Dir("/uc/tip/1.html"))
					str3_txt=Replace(str3_txt,"{msg1}","��ϲ������½�ɹ�!")
					str3_txt=Replace(str3_txt,"{msg2}",Back_url)					
					str3_txt=Replace(str3_txt,"{msg3}",str3)		
					Response.Write 	str3	
					'Response.Write "ok"
					Response.End()
					'response.Redirect Back_url			
				End IF		
			Else
				Set oRsbb=server.CreateObject(G_RS)
				Sql="select * from soojs_un where soojs_u_name='"&uu&"'"
				oRsbb.open Sql,Conn,1,3	
				IF Not oRsbb.Eof Then
					pp_1=Md5(Md5(pp,32)&oRsbb("soojs_u_uc"),32)
					
					IF oRsbb("soojs_u_pass")=pp_1 Then
						'��½�ɹ�
						oRsbb("soojs_u_pass")=pp
						oRsbb.Update()
						
						conn.execute("update soojs_un set soojs_lastdate='"&FormatDate(now(),55)&"', soojs_lastip='"&getIP()&"' where soojs_u_name='"&uu&"' and soojs_u_pass='"&pp&"'")
						Get_qingtiandy_jifen_ip oRsbb("id"),3,0
						response.Cookies(G_u_Cookies)("soojs_u")=oRsbb("soojs_u_name")
						response.Cookies(G_u_Cookies)("soojs_jifen")=oRsbb("soojs_jifen")
						response.Cookies(G_u_Cookies)("soojs_id")=oRsbb("id")
						response.Cookies(G_u_Cookies)("soojs_lastdate")=oRsbb("soojs_lastdate")
						response.Cookies(G_u_Cookies)("soojs_lastip")=oRsbb("soojs_lastip")
						response.Cookies(G_u_Cookies)("soojs_u_email")=oRsbb("soojs_u_email")	
						response.Cookies("qtcmsuser")=vbsE(oRsbb("soojs_u_name"))		
						Back_url=request("Back_url")
						'response.Cookies(G_u_Cookies+"_a")=rs_u("id")
						'Response.Cookies(G_u_Cookies+"_a").expires=now()+100
						Response.Cookies(G_u_Cookies).expires=now()+100
						response.Cookies("soojsjj")="0"
						
						IF Back_url="" Then
							Back_url="./default.asp"
						Else
							Back_url=request("Back_url")
						End IF				
						'response.Cookies("soojsu2")=rs_u("soojs_u_name")
						Response.Write "<script>setCookie('soojsu2','"&oRsbb("soojs_u_name")&"')</sc"&"ript>"	
						Response.Write "ok"					
					Else
						Response.Write "{error}��������ȷ�����룡"
						Response.End()
					End IF
					
				Else
					Response.Write "{error}��������ȷ�����룡"
					Response.End()
				End IF				
			End IF
			Response.Write "{error}��������ȷ�����룡"
			Response.End()
		End IF	
	End IF
	
End Sub


Sub Loginf_b()
	Response.Buffer=True
	response.contenttype="text/html;charset=gb2312"
	zsoojs_u_email=request("soojs_u_email")
	zsoojs_u_pass=request("soojs_u_pass")	
	
	Flag=true		
	IF zsoojs_u_email="" Then
		tp_u=tp_u&"��������ȷ���ǳƻ�EMAIL!"
		Flag=False
	End IF	
	IF flag=false Then
		Response.Write "{error}"&tp_u
		Response.End()
	End IF	
	IF zsoojs_u_pass="" Then
		tp_u=tp_u&"��������ȷ������!"
		Flag=False
	End IF		
	IF flag=false Then
		Response.Write "{error}"&tp_u
		Response.End()
	End IF
	IF flag Then
		uu=replace(zsoojs_u_email,"'","")
		pp=replace(zsoojs_u_pass,"'","")	
		Set rs_u=conn.execute("select soojs_u_name,soojs_lastip,soojs_lastdate,soojs_jifen,soojs_thisdate,soojs_level,id,soojs_u_email,soojs_u_f1,soojs_u_mytxt from soojs_un where (soojs_u_name='"&uu&"' or soojs_u_email='"&uu&"') and soojs_u_pass='"&pp&"'")
		IF Not rs_u.Eof Then
			IF Bint(rs_u("soojs_u_f1"))="1" Then
				Response.Write "{error}�Բ��������ʺ��Ѿ���������"
				Response.End()
			End IF
			conn.execute("update soojs_un set soojs_lastdate='"&FormatDate(now(),55)&"', soojs_lastip='"&getIP()&"' where soojs_u_name='"&uu&"' and soojs_u_pass='"&pp&"'")
			Get_qingtiandy_jifen_ip rs_u("id"),3,0
			response.Cookies(G_u_Cookies)("soojs_u")=uu
			response.Cookies(G_u_Cookies)("soojs_jifen")=rs_u("soojs_jifen")
			response.Cookies(G_u_Cookies)("soojs_id")=rs_u("id")
			response.Cookies(G_u_Cookies)("soojs_lastdate")=rs_u("soojs_lastdate")
			response.Cookies(G_u_Cookies)("soojs_lastip")=rs_u("soojs_lastip")
			response.Cookies(G_u_Cookies)("soojs_u_email")=rs_u("soojs_u_email")		
			Back_url=request("Back_url")
			'response.Cookies(G_u_Cookies+"_a")=rs_u("id")
			'Response.Cookies(G_u_Cookies+"_a").expires=now()+100
			Response.Cookies(G_u_Cookies).expires=now()+100
			response.Cookies("soojsjj")="0"
			Response.Write "<script>setCookie('soojsu2','"&rs_u("soojs_u_name")&"')</script>"
			Response.Write rs_u("id")&"{=====}"&uu&"{=====}"&GeTRp(rs_u("soojs_u_mytxt"))
			IF G_Uc_tongbu="1" Then
				'str=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_get_user&u="&uu&"&p="&zsoojs_u_pass))
			End IF
		Else
		
			IF G_Uc_tongbu="1" Then
				str=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_user_login&u="&uu&"&p="&pp&"&t="&GetRamCode(50)))
				
				IF Instr(str,"{ok}")>0 Then '˵�������û�
					str_aa=split(str,"||")
					uid_1=str_aa(1) '�û�ID
					uu_1=str_aa(2) '�û���
					pp_1=str_aa(3) '����
					ee_1=str_aa(4) 'Email
					zsoojs_u_name=uu_1
					zsoojs_u_pass=pp_1
					zsoojs_u_email=ee_1
					Set oRsbb=server.CreateObject(G_RS)
					Sql="select * from soojs_un where soojs_u_name='"&uu_1&"'"
					oRsbb.open Sql,Conn,1,3	
					IF Not oRsbb.Eof Then
						oRsbb("soojs_u_pass")=pp_1
						oRsbb.Update()
					Else
						oRsbb.addnew
						oRsbb("soojs_u_name")=zsoojs_u_name
						oRsbb("soojs_u_pass")=zsoojs_u_pass
						oRsbb("soojs_uu_name")=zsoojs_u_name
						oRsbb("soojs_u_ask")=""
						oRsbb("soojs_u_ok")=""
						oRsbb("soojs_u_tel")=""
						oRsbb("soojs_u_qq")=""
						oRsbb("soojs_u_email")=zsoojs_u_email
						oRsbb("soojs_u_addr")=""			
						oRsbb("soojs_u_content")=""									
						oRsbb("soojs_date")=FormatDate(now,55)'ע��ʱ��
						oRsbb("soojs_thisdate")=FormatDate(now,55)'ע��ʱ��	
						oRsbb("soojs_lastdate")=FormatDate(now,55)'ע��ʱ��					
						oRsbb("soojs_ip")=getIP()
						oRsbb("soojs_thisip")=getIP()	
						oRsbb("soojs_lastip")=getIP()	
						oRsbb("soojs_level")=0	
						IF G_zhuce_j2="" Then
							oRsbb("soojs_jifen")=0	
						Else
							oRsbb("soojs_jifen")=G_zhuce_j2
						End IF		
						oRsbb("soojs_sex")=0
						oRsbb("soojs_u_card")=""
						oRsbb("soojs_u_msn")=""
						oRsbb("soojs_u_birth")="1980-01-01"
						oRsbb("soojs_u_Province")=""
						oRsbb("soojs_u_City")=""
						oRsbb("soojs_status")=0
						oRsbb("soojs_u_code")=""
						oRsbb("soojs_u_tuiguang")=""
						oRsbb("soojs_1616_manager")="3,8,9,10,11,12,13,14,16,18"
						oRsbb("soojs_1616_manager")=""
						oRsbb("soojs_jifen_G_jifen_s_f_1")=""
						oRsbb("soojs_jifen_G_jifen_s_f_today")=0
						oRsbb("soojs_u_f1")=0	
						oRsbb("soojs_yz_str")=""	
						IF G_xiaxian_1="1" or G_xiaxian_2="1" Then
							oRsbb("soojs_u_xiaxian")=Bint(Request.Cookies(G_u_Cookies+"xiaxian"))
							AddTG Bint(Request.Cookies(G_u_Cookies+"xiaxian")),1
						End IF
						oRsbb.update						
					End IF
					
					conn.execute("update soojs_un set soojs_lastdate='"&FormatDate(now(),55)&"', soojs_lastip='"&getIP()&"' where soojs_u_name='"&zsoojs_u_name&"' and soojs_u_pass='"&zsoojs_u_pass&"'")
					Get_qingtiandy_jifen_ip oRsbb("id"),3,0
					response.Cookies(G_u_Cookies)("soojs_u")=zsoojs_u_name
					response.Cookies(G_u_Cookies)("soojs_jifen")=oRsbb("soojs_jifen")
					response.Cookies(G_u_Cookies)("soojs_id")=oRsbb("id")
					response.Cookies(G_u_Cookies)("soojs_lastdate")=oRsbb("soojs_lastdate")
					response.Cookies(G_u_Cookies)("soojs_lastip")=oRsbb("soojs_lastip")
					response.Cookies(G_u_Cookies)("soojs_u_email")=oRsbb("soojs_u_email")	
					response.Cookies("qtcmsuser")=vbsE(zsoojs_u_name)	
					Back_url=request("Back_url")
					'response.Cookies(G_u_Cookies+"_a")=rs_u("id")
					'Response.Cookies(G_u_Cookies+"_a").expires=now()+100
					Response.Cookies(G_u_Cookies).expires=now()+100
					response.Cookies("soojsjj")="0"					
					Response.Write "<script>setCookie('soojsu2','"&zsoojs_u_name&"')</script>"

					str3=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_user_synlogin&uid="&uid_1&"&p="&zsoojs_u_pass&"&t="&GetRamCode(50)))
					
					IF Back_url="" Then
						Back_url="./default.asp"
					Else
						Back_url=request("Back_url")
					End IF	
					
					str3_txt=N_Fso.ReadAllTextFile(Add_Root_Dir("/uc/tip/1.html"))
					str3_txt=Replace(str3_txt,"{msg1}","��ϲ������½�ɹ�!")
					str3_txt=Replace(str3_txt,"{msg2}",Back_url)					
					str3_txt=Replace(str3_txt,"{msg3}",str3)		
					'Response.Write 	str3_txt	
					Response.Write oRsbb("id")&"{=====}"&uu&"{=====}"&GeTRp(oRsbb("soojs_u_mytxt"))
					oRsbb.close
					Response.End()
					'response.Redirect Back_url			
				End IF	
			Else
				Set oRsbb=server.CreateObject(G_RS)
				Sql="select * from soojs_un where soojs_u_name='"&uu&"'"
				oRsbb.open Sql,Conn,1,3	
				IF Not oRsbb.Eof Then
					pp_1=Md5(Md5(pp,32)&oRsbb("soojs_u_uc"),32)
					
					IF oRsbb("soojs_u_pass")=pp_1 Then
						'��½�ɹ�
						oRsbb("soojs_u_pass")=pp
						oRsbb.Update()
						
						conn.execute("update soojs_un set soojs_lastdate='"&FormatDate(now(),55)&"', soojs_lastip='"&getIP()&"' where soojs_u_name='"&uu&"' and soojs_u_pass='"&pp&"'")
						Get_qingtiandy_jifen_ip oRsbb("id"),3,0
						response.Cookies(G_u_Cookies)("soojs_u")=oRsbb("soojs_u_name")
						response.Cookies(G_u_Cookies)("soojs_jifen")=oRsbb("soojs_jifen")
						response.Cookies(G_u_Cookies)("soojs_id")=oRsbb("id")
						response.Cookies(G_u_Cookies)("soojs_lastdate")=oRsbb("soojs_lastdate")
						response.Cookies(G_u_Cookies)("soojs_lastip")=oRsbb("soojs_lastip")
						response.Cookies(G_u_Cookies)("soojs_u_email")=oRsbb("soojs_u_email")	
						response.Cookies("qtcmsuser")=vbsE(oRsbb("soojs_u_name"))	
						Back_url=request("Back_url")
						'response.Cookies(G_u_Cookies+"_a")=rs_u("id")
						'Response.Cookies(G_u_Cookies+"_a").expires=now()+100
						Response.Cookies(G_u_Cookies).expires=now()+100
						response.Cookies("soojsjj")="0"
						
						IF Back_url="" Then
							Back_url="./default.asp"
						Else
							Back_url=request("Back_url")
						End IF				
						'response.Cookies("soojsu2")=rs_u("soojs_u_name")
						Response.Write "<script>setCookie('soojsu2','"&oRsbb("soojs_u_name")&"')</sc"&"ript>"	
						Response.Write oRsbb("id")&"{=====}"&uu&"{=====}"&GeTRp(oRsbb("soojs_u_mytxt"))				
					Else
						Response.Write "{error}��������ȷ�����룡"
						Response.End()
					End IF
					
				Else
					Response.Write "{error}��������ȷ�����룡"
					Response.End()
				End IF	
				
			End IF
					
			Response.Write "{error}��������ȷ�����룡"
			Response.End()
		End IF	
	End IF
	
End Sub

Sub Regf()

tp_u=""
flag=true
zsoojs_u_name=request.Form("soojs_u_name")
zsoojs_u_pass=request.Form("soojs_u_pass")
zsoojs_u_pass2=request.Form("soojs_u_pass2")
zsoojs_u_email=request.Form("soojs_u_email")
zsoojs_code=request("soojs_code")

'�ʼ��ж�
IF not qtcmsdh.Emailis(zsoojs_u_email) Then
	tp_u=tp_u&"�ʼ���ʽ����ȷ"&"\n"
	flag=false
End IF

'�ǳ��ж�
IF not L_checkusername(zsoojs_u_name) or trim(zsoojs_u_name)="" or isnull(zsoojs_u_name) Then
	tp_u=tp_u&"�û�������ʹ�����֡���ĸ���»���"&"\n"
	flag=false
End IF
IF  L_length(zsoojs_u_name)>16 or L_length(zsoojs_u_name)<4Then
	tp_u=tp_u&"�û�������ó���14���ֽ�(���֣���ĸ���»���)"&"\n"
	flag=false
End IF
'�����ж�
IF not L_checkpassword(zsoojs_u_pass) or trim(zsoojs_u_pass)="" or isnull(zsoojs_u_pass) Then
	tp_u=tp_u&"������������֣���ĸ���»������"&"\n"
	flag=false
End IF
IF  L_length(zsoojs_u_pass)>14 or L_length(zsoojs_u_pass)<4Then
	tp_u=tp_u&"��������4���ַ�������ó���14���ַ�"&"\n"
	flag=false
End IF
IF not L_checkpassword(zsoojs_u_pass2) or trim(zsoojs_u_pass2)="" or isnull(zsoojs_u_pass2) Then
	tp_u=tp_u&"ȷ��������������֣���ĸ���»������"&"\n"
	flag=false
End IF
IF  L_length(zsoojs_u_pass2)>14 or L_length(zsoojs_u_pass2)<4Then
	tp_u=tp_u&"ȷ����������4���ַ�������ó���14���ַ�"&"\n"
	flag=false
End IF

IF zsoojs_u_pass<>zsoojs_u_pass2 Then
	tp_u=tp_u&"ȷ�����������벻һ��"&"\n"
	flag=false
End IF

IF Lcase(Session("SooJs_Un"))<>Lcase(zsoojs_code) Then
	tp_u=tp_u&"��֤�����"&"\n"
	flag=false
End IF
IF flag=false Then
	response.Write "<script>"
	response.Write "alert('"&tp_u&"');"
	response.Write "history.back(-1);"
	response.Write "</script>"
End IF

IF flag Then
	zsoojs_u_name=replace(zsoojs_u_name,"'","")
	zsoojs_u_pass=replace(zsoojs_u_pass,"'","")
	zsoojs_u_email=replace(zsoojs_u_email,"'","")
	Set s_u_n_a_m_e=server.CreateObject(G_RS)
	Sql="select * from soojs_un where soojs_u_name='"&zsoojs_u_name&"' or soojs_u_email='"&zsoojs_u_email&"'"
	s_u_n_a_m_e.open Sql,Conn,1,3
	IF not (s_u_n_a_m_e.Bof and s_u_n_a_m_e.eof)Then
		response.Write "<script>"
		response.Write "alert('���ǳƻ�E-mail�ѱ�ע�ᣬ����һ��');"
		response.Write "history.back(-1);"
		response.Write "</script>"
		response.End()
	Else
		s_u_n_a_m_e.addnew
		s_u_n_a_m_e("soojs_u_name")=zsoojs_u_name
		s_u_n_a_m_e("soojs_u_pass")=zsoojs_u_pass
		s_u_n_a_m_e("soojs_uu_name")=zsoojs_u_name
		s_u_n_a_m_e("soojs_u_ask")=""
		s_u_n_a_m_e("soojs_u_ok")=""
		s_u_n_a_m_e("soojs_u_tel")=""
		s_u_n_a_m_e("soojs_u_qq")=""
		s_u_n_a_m_e("soojs_u_email")=zsoojs_u_email
		s_u_n_a_m_e("soojs_u_addr")=""			
		s_u_n_a_m_e("soojs_u_content")=""									
		s_u_n_a_m_e("soojs_date")=FormatDate(now,55)'ע��ʱ��
		s_u_n_a_m_e("soojs_thisdate")=FormatDate(now,55)'ע��ʱ��	
		s_u_n_a_m_e("soojs_lastdate")=FormatDate(now,55)'ע��ʱ��					
		s_u_n_a_m_e("soojs_ip")=getIP()
		s_u_n_a_m_e("soojs_thisip")=getIP()	
		s_u_n_a_m_e("soojs_lastip")=getIP()	
		s_u_n_a_m_e("soojs_level")=0	
		IF G_zhuce_j2="" Then
			s_u_n_a_m_e("soojs_jifen")=0	
		Else
			s_u_n_a_m_e("soojs_jifen")=0
		End IF		
		s_u_n_a_m_e("soojs_sex")=0
		s_u_n_a_m_e("soojs_u_card")=""
		s_u_n_a_m_e("soojs_u_msn")=""
		s_u_n_a_m_e("soojs_u_birth")="1980-01-01"
		s_u_n_a_m_e("soojs_u_Province")=""
		s_u_n_a_m_e("soojs_u_City")=""
		s_u_n_a_m_e("soojs_status")=0
		s_u_n_a_m_e("soojs_u_code")=""
		s_u_n_a_m_e("soojs_u_tuiguang")=""
		s_u_n_a_m_e("soojs_1616_manager")="3,8,9,10,11,12,13,14,16,18"
		s_u_n_a_m_e("soojs_1616_manager")=""
		s_u_n_a_m_e("soojs_jifen_G_jifen_s_f_1")=""
		s_u_n_a_m_e("soojs_jifen_G_jifen_s_f_today")=0
		IF G_soojs_yz_str="1" Then
			osoojs_yz_str=GetRamCode(20)
			s_u_n_a_m_e("soojs_u_f1")=1
			s_u_n_a_m_e("soojs_yz_str")=osoojs_yz_str
		Else
			s_u_n_a_m_e("soojs_u_f1")=0	
			s_u_n_a_m_e("soojs_yz_str")=""
		End IF		
		IF G_xiaxian_1="1" or G_xiaxian_2="1" Then
			s_u_n_a_m_e("soojs_u_xiaxian")=Bint(Request.Cookies(G_u_Cookies+"xiaxian"))
			AddTG Bint(Request.Cookies(G_u_Cookies+"xiaxian")),1
		End IF
		s_u_n_a_m_e.update
	End IF	
	'response.Cookies(G_u_Cookies+"_a")=s_u_n_a_m_e("id")
	'Response.Cookies(G_u_Cookies+"_a").expires=now()+100	
	Get_qingtiandy_jifen_ip s_u_n_a_m_e("id"),1,0
	If Err Then
		Err.Clear
		Set Conn = Nothing
		Response.Write "ע��ʧ��!"
		response.Redirect "./reg.asp"
		response.End()
	Else
		IF G_waibudiaoong_p1="1" Then
			wa=MD5("2055vip"&zsoojs_u_name,32)
			wuser=zsoojs_u_name
			wpass=zsoojs_u_pass
			on error resume next
			str=""&qtcmsdh.Qingtiandy_getHTTPPage("http://vip.2055.com/regzh.aspx?action=reg&syskey="&wa&"&username="&wuser&"&password="&wpass)
			'Response.Write "http://vip.2055.com/regzh.aspx?action=reg&syskey="&wa&"&username="&wuser&"&password="&wpass&"<br>"	
			'Response.Write str&"ok"
			'Response.End()			
		End IF	
		IF G_Uc_tongbu="1" Then
			wuser=zsoojs_u_name
			wpass=zsoojs_u_pass
			'on error resume next
			str=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=reg&u="&wuser&"&p="&wpass&"&m="&zsoojs_u_email))
'			str=Bint(str)	
'			IF str>0 Then
'				str2=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_user_synlogin&uid="&str&"&p="&wpass))
'			End IF			
		End IF	
		IF G_soojs_yz_str="1" Then
			kstr=qTcms_SendEmailZc(zsoojs_u_name,zsoojs_u_pass,zsoojs_u_email,osoojs_yz_str)
			IF kstr="ok" Then
				Response.Write "<script>alert('�뵽��ע����ʼ���"&zsoojs_u_email&"�������˺ţ�'); window.location='login.asp'</script>"
				Response.End()
			Else
				Response.Write "<script>alert('�ʼ�ϵͳ�����У�����ϵ����Ա��QQ("&G_QQ&")');window.location='login.asp'</script>"
			End IF
			Response.End()
		End IF			
		response.Cookies(G_u_Cookies)("soojs_u")=zsoojs_u_name
		response.Cookies(G_u_Cookies)("soojs_jifen")=s_u_n_a_m_e("soojs_jifen")
		response.Cookies(G_u_Cookies)("soojs_id")=s_u_n_a_m_e("id")
		response.Cookies(G_u_Cookies)("soojs_lastdate")=s_u_n_a_m_e("soojs_lastdate")
		response.Cookies(G_u_Cookies)("soojs_lastip")=s_u_n_a_m_e("soojs_lastip")
		response.Cookies(G_u_Cookies)("soojs_level")=G_jifen_jifen_name&"�û�"
		response.Cookies("qtcmsuser")=vbsE(zsoojs_u_name)
		Response.Cookies(G_u_Cookies).expires=now()+100
		Response.Write "<script>setCookie('soojsu2','"&zsoojs_u_name&"')</script>"
		response.Cookies("soojsjj")="0"
		response.Redirect "./Default.asp"
		s_u_n_a_m_e.close
		Set s_u_n_a_m_e=nothing
		Conn.close
		Set Conn=nothing
		Back_url=request("Back_url")
		IF Back_url="" Then
			Back_url="./Default.asp"
		Else
			Back_url=request("Back_url")
		End IF		
		response.Redirect Back_url
	End IF
End IF

End Sub

Sub Regf_a()
	Response.Buffer=True
	response.contenttype="text/html;charset=gb2312"
tp_u=""
flag=true
zsoojs_u_name=request("soojs_u_name")
zsoojs_u_pass=request("soojs_u_pass")
zsoojs_u_pass2=request("soojs_u_pass2")
zsoojs_u_email=request("soojs_u_email")
zsoojs_code=request("soojs_code")

'�ʼ��ж�
IF not IsValidEmail(zsoojs_u_email) Then
	tp_u=tp_u&"�ʼ���ʽ����ȷ"&"\n"
	flag=false
End IF
IF flag=false Then
	Response.Write "{error}"&tp_u
	Response.End()
End IF	
'�ǳ��ж�
IF not L_checkusername(zsoojs_u_name) or trim(zsoojs_u_name)="" or isnull(zsoojs_u_name) Then
	tp_u=tp_u&"�û�������ʹ�����֡���ĸ���»���"&"\n"
	flag=false
End IF
IF flag=false Then
	Response.Write "{error}"&tp_u
	Response.End()
End IF	
IF  L_length(zsoojs_u_name)>16 or L_length(zsoojs_u_name)<4Then
	tp_u=tp_u&"�û�������ó���14���ֽ�(���֣���ĸ���»���)"&"\n"
	flag=false
End IF
IF flag=false Then
	Response.Write "{error}"&tp_u
	Response.End()
End IF	
'�����ж�
IF not L_checkpassword(zsoojs_u_pass) or trim(zsoojs_u_pass)="" or isnull(zsoojs_u_pass) Then
	tp_u=tp_u&"������������֣���ĸ���»������"&"\n"
	flag=false
End IF
IF flag=false Then
	Response.Write "{error}"&tp_u
	Response.End()
End IF	
IF  L_length(zsoojs_u_pass)>14 or L_length(zsoojs_u_pass)<4Then
	tp_u=tp_u&"��������4���ַ�������ó���14���ַ�"&"\n"
	flag=false
End IF
IF flag=false Then
	Response.Write "{error}"&tp_u
	Response.End()
End IF	
IF not L_checkpassword(zsoojs_u_pass2) or trim(zsoojs_u_pass2)="" or isnull(zsoojs_u_pass2) Then
	tp_u=tp_u&"ȷ��������������֣���ĸ���»������"&"\n"
	flag=false
End IF
IF flag=false Then
	Response.Write "{error}"&tp_u
	Response.End()
End IF	
IF  L_length(zsoojs_u_pass2)>14 or L_length(zsoojs_u_pass2)<4Then
	tp_u=tp_u&"ȷ����������4���ַ�������ó���14���ַ�"&"\n"
	flag=false
End IF
IF flag=false Then
	Response.Write "{error}"&tp_u
	Response.End()
End IF	
IF zsoojs_u_pass<>zsoojs_u_pass2 Then
	tp_u=tp_u&"ȷ�����������벻һ��"&"\n"
	flag=false
End IF
IF flag=false Then
	Response.Write "{error}"&tp_u
	Response.End()
End IF	
IF Lcase(Session("SooJs_Un"))<>Lcase(zsoojs_code) Then
	tp_u=tp_u&"��֤�����"&"\n"
	flag=false
End IF
IF flag=false Then
	Response.Write "{error}"&tp_u
	Response.End()
End IF	

IF flag Then
	zsoojs_u_name=replace(zsoojs_u_name,"'","")
	zsoojs_u_pass=replace(zsoojs_u_pass,"'","")
	zsoojs_u_email=replace(zsoojs_u_email,"'","")
	Set s_u_n_a_m_e=server.CreateObject(G_RS)
	Sql="select * from soojs_un where soojs_u_name='"&zsoojs_u_name&"' or soojs_u_email='"&zsoojs_u_email&"'"
	s_u_n_a_m_e.open Sql,Conn,1,3
	IF not (s_u_n_a_m_e.Bof and s_u_n_a_m_e.eof)Then
		Response.Write "{error}���ǳƻ�E-mail�ѱ�ע�ᣬ����һ��"
		Response.End()		
	Else
		s_u_n_a_m_e.addnew
		s_u_n_a_m_e("soojs_u_name")=zsoojs_u_name
		s_u_n_a_m_e("soojs_u_pass")=zsoojs_u_pass
		s_u_n_a_m_e("soojs_uu_name")=zsoojs_u_name
		s_u_n_a_m_e("soojs_u_ask")=""
		s_u_n_a_m_e("soojs_u_ok")=""
		s_u_n_a_m_e("soojs_u_tel")=""
		s_u_n_a_m_e("soojs_u_qq")=""
		s_u_n_a_m_e("soojs_u_email")=zsoojs_u_email
		s_u_n_a_m_e("soojs_u_addr")=""			
		s_u_n_a_m_e("soojs_u_content")=""									
		s_u_n_a_m_e("soojs_date")=FormatDate(now,55)'ע��ʱ��
		s_u_n_a_m_e("soojs_thisdate")=FormatDate(now,55)'ע��ʱ��	
		s_u_n_a_m_e("soojs_lastdate")=FormatDate(now,55)'ע��ʱ��					
		s_u_n_a_m_e("soojs_ip")=getIP()
		s_u_n_a_m_e("soojs_thisip")=getIP()	
		s_u_n_a_m_e("soojs_lastip")=getIP()	
		s_u_n_a_m_e("soojs_level")=0	
		IF G_zhuce_j2="" Then
			s_u_n_a_m_e("soojs_jifen")=0	
		Else
			s_u_n_a_m_e("soojs_jifen")=0
		End IF		
		s_u_n_a_m_e("soojs_sex")=0
		s_u_n_a_m_e("soojs_u_card")=""
		s_u_n_a_m_e("soojs_u_msn")=""
		s_u_n_a_m_e("soojs_u_birth")="1980-01-01"
		s_u_n_a_m_e("soojs_u_Province")=""
		s_u_n_a_m_e("soojs_u_City")=""
		s_u_n_a_m_e("soojs_status")=0
		s_u_n_a_m_e("soojs_u_code")=""
		s_u_n_a_m_e("soojs_u_tuiguang")=""
		s_u_n_a_m_e("soojs_1616_manager")="3,8,9,10,11,12,13,14,16,18"
		s_u_n_a_m_e("soojs_1616_manager")=""
		s_u_n_a_m_e("soojs_jifen_G_jifen_s_f_1")=""
		s_u_n_a_m_e("soojs_jifen_G_jifen_s_f_today")=0	
		IF G_soojs_yz_str="1" Then
			s_u_n_a_m_e("soojs_u_f1")=1
			s_u_n_a_m_e("soojs_yz_str")=GetRamCode(20)
		Else
			s_u_n_a_m_e("soojs_u_f1")=0	
			s_u_n_a_m_e("soojs_yz_str")=GetRamCode(20)	
		End IF
		IF G_xiaxian_1="1" Then
			s_u_n_a_m_e("soojs_u_xiaxian")=Bint(Request.Cookies(G_u_Cookies+"xiaxian"))
			AddTG Bint(Request.Cookies(G_u_Cookies+"xiaxian")),1
		End IF
		s_u_n_a_m_e.update
	End IF	
	'response.Cookies(G_u_Cookies+"_a")=s_u_n_a_m_e("id")
	'Response.Cookies(G_u_Cookies+"_a").expires=now()+100	
	pppuids=s_u_n_a_m_e("id")
	
	If Err Then
		Err.Clear
		Set Conn = Nothing
		Response.Write "{error}ע��ʧ��"
		Response.End()
	Else
		response.Cookies(G_u_Cookies)("soojs_u")=zsoojs_u_name
		response.Cookies(G_u_Cookies)("soojs_jifen")=s_u_n_a_m_e("soojs_jifen")
		response.Cookies(G_u_Cookies)("soojs_id")=s_u_n_a_m_e("id")
		response.Cookies(G_u_Cookies)("soojs_lastdate")=s_u_n_a_m_e("soojs_lastdate")
		response.Cookies(G_u_Cookies)("soojs_lastip")=s_u_n_a_m_e("soojs_lastip")
		response.Cookies(G_u_Cookies)("soojs_level")=G_jifen_jifen_name&"�û�"
		response.Cookies("qtcmsuser")=vbsE(zsoojs_u_name)
		Response.Cookies(G_u_Cookies).expires=now()+100
		Response.Write "<script>setCookie('soojsu2','"&zsoojs_u_name&"')</script>"
		response.Cookies("soojsjj")="0"
		s_u_n_a_m_e.close
		Set s_u_n_a_m_e=nothing
		Conn.close
		Set Conn=nothing
		on error resume next
		IF G_waibudiaoong_p1="1" Then
			wa=MD5("2055vip"&zsoojs_u_name,32)
			wuser=zsoojs_u_name
			wpass=zsoojs_u_pass
			on error resume next
			str=""&qtcmsdh.Qingtiandy_getHTTPPage("http://vip.2055.com/regzh.aspx?action=reg&syskey="&wa&"&username="&wuser&"&password="&wpass)
			'Response.Write "http://vip.2055.com/regzh.aspx?action=reg&syskey="&wa&"&username="&wuser&"&password="&wpass&"<br>"	
			'Response.Write str&"ok"
			'Response.End()			
		End IF	
		IF G_Uc_tongbu="1" Then
			wuser=zsoojs_u_name
			wpass=zsoojs_u_pass
			on error resume next
			str=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=reg&u="&wuser&"&p="&wpass&"&m="&zsoojs_u_email))
'			str=Bint(str)	
'			IF str>0 Then
'				str2=qtcmsdh.Qingtiandy_getHTTPPage("http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("uc/api.asp?action=uc_user_synlogin&uid="&str&"&p="&wpass))
'			End IF		
		End IF			
		Response.Write "ok"
	End IF
	Get_qingtiandy_jifen_ip pppuids,1,0
End IF

End Sub
%>