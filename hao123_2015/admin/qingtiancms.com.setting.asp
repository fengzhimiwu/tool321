<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="inc/classDbPager.asp"-->
<!--#include file="inc/public.asp"-->
<!--#include file="inc/openconn.asp"-->
<html>
<head>
<meta http-euiv="Content-Type" content="text/html; charset=gb2312">
<title>��վ��Ϣ����</title>
<LINK href="css/style.css" rel=stylesheet type=text/css>
<style type="text/css">
<!--
.bg66{ color:#666666}

-->
</style>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body>
<%

If request.Cookies(Sky_Admin_Cookies_1)("admin_u")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_p")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_m")="" then

	response.Redirect(Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
	response.End()
End IF



response.Cookies("ingtiandy.cn")=""
If request("action")="" Then
	Function Basic_1()
		IF G_IS_SL_User_DB="1" Then
			Basic_1="(<font color=""#FF0000"">�ظ�</font>)"
		Else
			Basic_1=""
		End IF
	End Function
	
	Function Basic_2()
		IF G_IS_SL_User_DB="1" Then
			Basic_2="style=""color:#FF0000"""
		Else
			Basic_2=""
		End IF
	End Function
	
	Function ReadAllTextFile(filespec)
		Dim fso, f
		Set fso = CreateObject(G_FSO)
		Set f = fso.OpenTextFile(server.MapPath(filespec), 1)	
		if Not f.AtEndOfStream then
			ReadAllTextFile = f.ReadAll
		else
			ReadAllTextFile = ""
		end if
		Set f=nothing
		Set fso=nothing
	End Function
	
	Function Ghelp(v)
		Ghelp="<a href='"&v&"' target=_blank><img src='images/help.gif' border=0 alt='�鿴����'></a>"
	End Function
	Function re(v)
		re=""""&request.Form(v)&""""
	End Function
%>
<script src="js/basicjs.js"></script>
<script language="javascript" runat="server">
function unescapeGet(str)
{
 return decodeURI(str);
}
//����
function decodeURIs(strs)
{
 return String.fromCharCode(strs);
}


</script>
<%

function ssu(v)
   'ssu=v
   '����޸� ȡ����ԭ�ȵı���
	ssu=server.URLEncode(v)
End FUnction

set file1=server.CreateObject(G_FSO)
set folder1=file1.GetFolder(""&server.mappath("../template")&"")
c15=""
for each thing in folder1.SubFolders
	dbname_2=thing.name
	IF G_moban=dbname_2 Then
		dbname_2_1=" selected"
	Else
		dbname_2_1=""
	End IF
	c15=c15&"<option value="""&dbname_2&""" "&dbname_2_1&">"&dbname_2&"</option>"
next




ingtiancms="aa1="&G_All_moshi&"&aa2="&ssu(hxCacheName)&"&aa3="&ssu(maxReBack)&"&aa4="&ssu(hxtime)&_
"&aa5="&ssu(hxLook)&_
"&aa6="&ssu(G_All_InAuto)&_
"&aa7="&ssu(G_all_InNumb)&_
"&aa8="&ssu(G_All_dhList_f)&_
"&aa9="&ssu(G_jifen_lailu)&_
"&aa10="&ssu(G_jifen_dianchu_a)&_
"&aa11="&ssu(G_jifen_lailu_out)&_
"&aa12="&ssu(G_jifen_timer_lailu)&_
"&aa13="&ssu(G_jifen_jifen_bili_lailu)&_
"&aa14="&ssu(G_jifen_jifen_numbs_lailu)&_
"&b1="&ssu(G_WEBTITLE)&_
"&b2="&ssu(G_WEBNAME)&_
"&b3="&ssu(G_WEBURL)&_
"&b4="&ssu(G_WEBURL_2)&_
"&b5="&ssu(G_QQ)&_
"&b6="&ssu(G_TEL)&_
"&b7="&ssu(G_EMAIL)&_
"&b8="&ssu(G_BEIAN)&_
"&b11="&ssu(G_union_my)&_
"&c1="&ssu(G_lm_baidu)&_
"&c2="&ssu(G_lm_baidu_ch)&_
"&c3="&ssu(G_lm_taobao)&_
"&c4="&ssu(G_lm_xunlei)&_
"&c5="&ssu(G_lm_google_s)&_
"&c6="&ssu(G_lm_sogou_s)&_
"&c7="&ssu(G_lm_dangdang_s)&_
"&c8="&ssu(G_lm_amazon_s)&_
"&c9="&ssu(G_lm_360buy)&_
"&c10="&ssu(G_lm_youdao)&_
"&c11="&ssu(G_lm_soso)&_
"&c12="&ssu(G_lm_500wan_s)&_
"&c13="&ssu(G_lm_gouwuke_s)&_
"&c14="&ssu(G_lm_sina_weibo)&_
"&c15="&ssu(c15)&_
"&c16="&ssu(G_JIN_TAI_IndexPage)&_
"&c17="&ssu(G_moban_html)&_
"&c18="&ssu(G_jingtai_wenjian_mulu)&_	
"&c19="&ssu(G_List_yemian)&_	
"&c20="&ssu(G_JIN_TAI_PageOne)&_	
"&c21="&ssu(G_HTML)&_	
"&c22="&ssu(G_FLAG)&_	
"&c23="&ssu(G_yzm)&_
"&c24="&ssu(G_ADMIN)&_
"&d1="&ssu(G_user_mem)&_
"&d2="&ssu(G_zhuce_j2)&_
"&d3="&ssu(G_jifen_denglu)&_
"&d4="&ssu(G_jifen_tuijian)&_
"&d5="&ssu(G_jifen_home)&_
"&d6="&ssu(G_jifen_home_time)&_
"&d7="&ssu(G_jifen_tuiguang_s)&_
"&d8="&ssu(G_jifen_s_f_1)&_
"&d9="&ssu(G_jifen_tuiguang_time)&_
"&d10="&ssu(G_jifen_timer)&_
"&d11="&ssu(G_jifen_jifen_bili)&_
"&d12="&ssu(G_jifen_jifen_name)&_
"&d13="&ssu(G_jifen_jifen_zhifubao_bili)&_
"&d14="&ssu(G_tikuan_smail)&_
"&d15="&ssu(G_xiaxian_zhuye_1a)&_
"&d16="&ssu(G_xiaxian_zhuye_2a)&_
"&d17="&ssu(G_xiaxian_zhuye_1_bili)&_
"&d18="&ssu(G_xiaxian_2_jiangli)&_
"&d19="&ssu(G_mingxi_look)&_
"&d20="&ssu(G_jinbi_kaifang)&_
"&e1="&ssu(G_u_Cookies)&_
"&e2="&ssu(G_email_f_1)&_
"&e3="&ssu(G_soojs_yz_str)&_
"&f1="&ssu(G_VIRTUAL_ROOT_DIR)&_
"&f2="&ssu(G_CONN_STR)&_
"&f3="&ssu(G_IS_SL_User_DB)&_
"&f4="&ssu(G_SL_IP)&_
"&f5="&ssu(G_SL_DATA)&_
"&f6="&ssu(G_SL_USER)&_
"&f7="&ssu(G_SL_PASS)&_
"&f8="&ssu(G_moshi)

ingtiandy=G_G_H&"tuser/2012yz_daohang_19.asp?tag=ingtiancms.com.setting.asp"&request.Cookies("t_url")&"&"&ingtiancms
'response.write ingtiandy
%>
<!-- ����form ���-->
<form action="?action=save" method="post" name="form">

<input name="G_u_Cookies" value="ingtiancmscom" size="45" type="hidden">
<input name="G_VIRTUAL_ROOT_DIR" value="" size="45" type="hidden">
<input name="G_CONN_STR" value="p_Data/##28887CHC7GH1FDB3H88C5A0JCBII86BA.mdb" size="45" type="hidden">
<input name="G_IS_SL_User_DB" value="0" size="45" type="hidden">
<input name="G_SL_IP" value="(local)" size="45" type="hidden">
<input name="G_SL_DATA" value="TcmsDaohang201413" size="45" type="hidden">
<input name="G_SL_USER" value="sa" size="45" type="hidden">
<input name="G_SL_PASS" value="" size="45" type="hidden">
<input name="G_moshi" value="1" size="45" type="hidden">	
<table class="tableBorder" cellpadding="3" cellspacing="1" align="center" border="0" width="98%">		<tbody>			<tr>				<th class="tableHeaderText" height="25" width="38%">��վ���嶨λģʽ</th>				<th class="tableHeaderText" height="25" width="62%"></th>			</tr>			<tr>				<td colspan="2" id="b_id_0">					<table cellpadding="0" cellspacing="0" border="0" width="100%">						<tbody><tr>							<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ���嶨λ</u></strong><br>								ϵͳ�Դ�˫�ù��ܣ�������ģʽ�͵���+��������ģʽ</td>							<td class="forumRowHighlight" width="62%">								<input <%If (CStr(G_All_moshi) = CStr("")) Then Response.Write("checked=""checked""") : Response.Write("")%> name="G_All_moshi" value="" onClick="$('G_All_moshi_table').style.display='none'" type="radio">
������ģʽ								<input <%If (CStr(G_All_moshi) = CStr("1")) Then Response.Write("checked=""checked""") : Response.Write("")%> name="G_All_moshi" value="1"  onclick="$('G_All_moshi_table').style.display=''" type="radio">
��������+����ģʽ							</td>						</tr>					</tbody></table>					<table id="G_All_moshi_table" cellpadding="0" cellspacing="0" border="0" width="100%">					<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�û�Cookies��</u></strong><br>							ֻ����Ӣ�����֣�����Ϊ�գ����磺tCacheName</td>						<td class="forumRowHighlight" width="62%">							<input name="hxCacheName" value="<%=hxCacheName%>" size="45">						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>������������</u></strong><br>����1.1��</td>
<td class="forumRowHighlight" width="62%"><input name="maxReBack" value="<%=unescapeGet(ssu(maxReBack))%>" size="45"></td>
</tr>
<tr><td class="forumRowHighlight" height="23" width="38%"><strong><u>ǰ̨��ҳ�Զ�����ʱ��</u></strong><br>��λ���룬�벻Ҫ���õ�̫С������300����5����Ϊ����</td>						<td class="forumRowHighlight" width="62%"><input name="hxtime" value="<%=unescapeGet(ssu(hxtime))%>" size="45">		</td>				</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>ǰ̨�û�ע���Ƿ���Ҫ��̨���</u></strong><br>Ĭ���ǲ���Ҫ���</td>						<td class="forumRowHighlight" width="62%">							<select name="hxLook"><option value="1"  <%If (Not isNull(unescapeGet(ssu(hxLook)))) Then If ("1" = CStr(unescapeGet(ssu(hxLook)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>����Ҫ���</option>
      <option value="0" <%If (Not isNull(unescapeGet(ssu(hxLook)))) Then If ("0" = CStr(unescapeGet(ssu(hxLook)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>��Ҫ���</option>							
      </select>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�û������Ƿ��Զ���¼</u></strong><br>Ĭ������Ҫ���</td>							<td class="forumRowHighlight" width="62%">								<select name="G_All_InAuto">
        <option value="1"  <%If (Not isNull(unescapeGet(ssu(G_All_InAuto)))) Then If ("1" = CStr(unescapeGet(ssu(G_All_InAuto)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>�Զ���¼</option>
        <option value="0" <%If (Not isNull(unescapeGet(ssu(G_All_InAuto)))) Then If ("0" = CStr(unescapeGet(ssu(G_All_InAuto)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>���Զ���¼</option>								
        </select>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�û����볬�������Զ����</u></strong><br>��������Զ���ˣ����������Ϊ10000�����10000</td>						<td class="forumRowHighlight" width="62%">							<input name="G_all_InNumb" value="<%=unescapeGet(ssu(G_all_InNumb))%>" size="45"> ���10000						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>������ַ���Ƿ���������ַ��</u></strong><br>���鲻Ҫ���룬ûʲô��Ҫ</td>						<td class="forumRowHighlight" width="62%">							<select name="G_All_dhList_f">
          <option value="1" <%If (Not isNull(unescapeGet(ssu(G_All_dhList_f)))) Then If ("1" = CStr(unescapeGet(ssu(G_All_dhList_f)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>�Զ�����</option>
          <option value=""  <%If (Not isNull(unescapeGet(ssu(G_All_dhList_f)))) Then If ("" = CStr(unescapeGet(ssu(G_All_dhList_f)))) Then Response.Write("selected=""selected""") : Response.Write("")%>>������</option>							
          </select>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>���ֲ���--�û�����һ�����Ӷ���</u></strong><br>Ĭ���ǿգ�Ϊ������</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_lailu" value="<%=unescapeGet(ssu(G_jifen_lailu))%>" size="45"> ����Ϊ2������һ������2������						</td>					</tr>				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="http://www.ingtiancms.com" target="_blank"><span style="color:#0000FF">Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25" width="38%">��վ������Ϣ����</th>				<th class="tableHeaderText" height="25" width="62%"></th>			</tr>			<tr>				<td colspan="2" id="b_id_2">					<table cellpadding="0" cellspacing="0" border="0" width="100%">						<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ��ҳ����(<font color="#FF0000">�ظ�</font>)</u></strong><br>�������д������ ��վ����</td>						<td class="forumRowHighlight" width="62%"><input name="G_WEBTITLE" value="<%=G_WEBTITLE%>" size="45" style="color:#FF0000"> ���磺������ַ����վ</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ����(<font color="#FF0000">�ظ�</font>)</u></strong><br>��վ����</td>						<td class="forumRowHighlight" width="62%"><input name="G_WEBNAME" value="<%=G_WEBNAME%>" size="45" style="color:#FF0000"> ���磺���쵼��</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ����URL(<font color="#FF0000">�ظ�</font>)</u></strong><br>						��վ����URL����һ��Ҫ��������/,����̬ҳ���޷�����</td>						<td class="forumRowHighlight" width="62%"><input name="G_WEBURL" value="<%=G_WEBURL%>" size="45" style="color:#FF0000">	���磺http://www.baidu.com/</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ��ʡ������(<font color="#FF0000">�ظ�</font>)</u></strong><br>��վ��ʡ������</td>						<td class="forumRowHighlight" width="62%">						<input name="G_WEBURL_2" value="<%=G_WEBURL_2%>" size="45" style="color:#FF0000"> ���磺ingtiancms.com</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ�Ŀͷ�(<font color="#FF0000">�ظ�</font>)</u></strong><br>��վ�Ŀͷ�</td>						<td class="forumRowHighlight" width="62%"><input name="G_QQ" value="<%=G_QQ%>" size="45" style="color:#FF0000">	���磺314048526</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վemail(<font color="#FF0000">�ظ�</font>)</u></strong><br>��վemail</td>						<td class="forumRowHighlight" width="62%">						<input name="G_EMAIL" value="<%=G_EMAIL%>" size="45" style="color:#FF0000">	���磺314048526@.com</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ������Ϣ(<font color="#FF0000">�ظ�</font>)</u></strong><br>��վ������Ϣ,û������д"���ڱ�����"</td>						<td class="forumRowHighlight" width="62%"><input name="G_BEIAN" value="<%=G_BEIAN%>" size="45" style="color:#FF0000"> δ��������д��δ����</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ�Ŀͷ��绰</u></strong><br>��վ�Ŀͷ��绰</td>						<td class="forumRowHighlight" width="62%"><input name="G_TEL" value="<%=G_TEL%>" size="45">	���磺(0)13588888888</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ�ؼ���</u></strong><br>��վ�ؼ���,�����Լ�Ҫ��д�ã����������ƹ��ʱ��Ƚ�����</td>						<td class="forumRowHighlight" width="62%"><input name="G_KEY" value="<%=G_KEY%>" size="45">	û��������</td>					</tr><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ����</u></strong><br>��վ����</td>						<td class="forumRowHighlight" width="62%"><input name="G_DIE" value="<%=G_DIE%>" size="45">	û��������</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>������֤�ļ���</u></strong><br>ֻ�������ݺ���ĸ��ɣ���ø��ӵ㣬����:ingtianunion</td>						<td class="forumRowHighlight" width="62%"><input name="G_union_my" value="<%=G_union_my%>" size="45">					</td></tr>				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="http://www.ingtiancms.com" target="_blank"><span style="color:#0000FF">?Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25"><a name="#yunxingmoshi"></a>��վ�����ʺ�����</th>				<th class="tableHeaderText" align="left" height="25">&nbsp;����д�ӴֵĲ���</th>			</tr>			<tr>				<td colspan="2" id="b_id_31">					<table cellpadding="0" cellspacing="0" border="0" width="100%">					<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�Կ��ʺ�</u></strong><br>û�еĻ��벻Ҫ��д�����磺mm_10599941_0_0</td>						<td class="forumRowHighlight" width="62%">						<input name="G_lm_taobao" value="<%=G_lm_taobao%>" size="45"> <a href="../p_inc/turnto.asp?u=http://www.alimama.com/" target="_blank">�������</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>���������ID</u></strong><br>û�еĻ��벻Ҫ��д</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_gouwuke_s" value="<%=G_lm_gouwuke_s%>" size="45"> <a href="../p_inc/turnto.asp?u=http://www.yiifa.com/" target="_blank">�������</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>����΢��ID</u></strong><br>û�еĻ��벻Ҫ��д</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_sina_weibo" value="<%=G_lm_sina_weibo%>" size="45"> <a href="../p_inc/turnto.asp?u=http://www.weibo.com/" target="_blank">�������</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��������</u></strong><br>û�еĻ��벻Ҫ��д�����磺P-276318</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_dangdang_s" value="<%=G_lm_dangdang_s%>" size="45"> <a href="../p_inc/turnto.asp?u=http://union.dangdang.com/" target="_blank">�������</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>����ѷ����</u></strong><br>û�еĻ��벻Ҫ��д�����磺wjlhkp-23</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_amazon_s" value="<%=G_lm_amazon_s%>" size="45"> <a href="../p_inc/turnto.asp?u=https://associates.amazon.cn/" target="_blank">�������</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�����̳�</u></strong><br>û�еĻ��벻Ҫ��д�����磺1688</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_360buy" value="<%=G_lm_360buy%>" size="45"> <a href="../p_inc/turnto.asp?u=http://u.jd.com/" target="_blank">�������</a>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>�ٶ������ʺ�</u><br>û�еĻ��벻Ҫ��д�����磺wjlhkp_pg</td>						<td class="forumRowHighlight" width="62%">							<input name="G_lm_baidu" value="<%=G_lm_baidu%>" size="45">	Ŀǰ�޷����룬�������˺ŵ��û�						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>�ٶ������ʺ�CH</u><br>û�еĻ��벻Ҫ��д�����磺5</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_baidu_ch" value="<%=G_lm_baidu_ch%>" size="45">	Ŀǰ�޷����룬�������˺ŵ��û�						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>Google����</u><br>û�еĻ��벻Ҫ��д�����磺pub-0520467129961361</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_google_s" value="<%=G_lm_google_s%>" size="45"> Ŀǰ�޷����룬�������˺ŵ��û�						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>sogou����</u><br>û�еĻ��벻Ҫ��д�����磺ingtiandy</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_sogou_s" value="<%=G_lm_sogou_s%>" size="45"> Ŀǰ�޷����룬�������˺ŵ��û�						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>�е�����</u><br>û�еĻ��벻Ҫ��д�����磺aaaaa</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_youdao" value="<%=G_lm_youdao%>" size="45"> Ŀǰ�޷����룬�������˺ŵ��û�						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><u>SOSO����</u><br>û�еĻ��벻Ҫ��д�����磺m400000_0001</td>						<td class="forumRowHighlight" width="62%"><input name="G_lm_soso" value="<%=G_lm_soso%>" size="45"> Ŀǰ�޷����룬�������˺ŵ��û�						</td>					</tr>				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="http://www.ingtiancms.com" target="_blank"><span style="color:#0000FF">?Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25">ģ�����</th>				<th class="tableHeaderText" align="left" height="25"></th>			</tr>			<tr>				<td colspan="2" id="b_id_31">					<table cellpadding="0" cellspacing="0" border="0" width="100%">					<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>ģ��ѡ��</u></strong><br>����ģ�涼����/template/Ŀ¼��      </td>						<td class="forumRowHighlight" width="62%">							<select name="G_moban" size="1">
		           <option value="<%=G_moban%>" selected=""><%=G_moban%></option>	
		  						</select>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ��ҳ���ļ�����</u></strong><br>����index.html��index.htm<br></td>						<td class="forumRowHighlight" width="62%">							<select name="G_JIN_TAI_IndexPage">
		  						  <option value="index.shtml" <%If (Not isNull(G_JIN_TAI_IndexPage)) Then If ("index.shtml" = CStr(G_JIN_TAI_IndexPage)) Then Response.Write("selected=""selected""") : Response.Write("")%>>index.shtml</option>
		  						  <option value="index.html"  <%If (Not isNull(G_JIN_TAI_IndexPage)) Then If ("index.html" = CStr(G_JIN_TAI_IndexPage)) Then Response.Write("selected=""selected""") : Response.Write("")%>>index.html</option>
		  						  <option value="index.htm" <%If (Not isNull(G_JIN_TAI_IndexPage)) Then If ("index.htm" = CStr(G_JIN_TAI_IndexPage)) Then Response.Write("selected=""selected""") : Response.Write("")%>>index.htm</option>

</select>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>ģ����õ�·��</u></strong><br>Ĭ���ǣ�html,���ĵĻ����ᱻ�˵��ߵ�Ŷ��</td>						<td class="forumRowHighlight" width="62%"><input name="G_moban_html" value="<%=G_moban_html%>" size="15" id="G_moban_html"></td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>���о�̬����Ŀ¼��</u></strong><br>Ĭ�϶��ڸ�Ŀ¼��ע���벻Ҫ��дϵͳ�ļ�����</td>						<td class="forumRowHighlight" width="62%"><input name="G_jingtai_wenjian_mulu" value="<%=G_jingtai_wenjian_mulu%>" size="45"> ������д�ļ�����������s</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>����ҳ����ģʽ</u></strong><br></td>						<td class="forumRowHighlight" width="62%">							<select name="G_List_yemian">
  <option value="" <%If (Not isNull(G_List_yemian)) Then If ("" = CStr(G_List_yemian)) Then Response.Write("selected=""selected""") : Response.Write("")%>>movie2.html--��ID--�����ظ�</option>
  <option value="1" <%If (Not isNull(G_List_yemian)) Then If ("1" = CStr(G_List_yemian)) Then Response.Write("selected=""selected""") : Response.Write("")%>>movie.html--����--���ظ��Ŀ���</option>
  <option value="2" <%If (Not isNull(G_List_yemian)) Then If ("2" = CStr(G_List_yemian)) Then Response.Write("selected=""selected""") : Response.Write("")%>>lifefuwumovie.html--�����С���ƴ��</option>
  <option value="3"  <%If (Not isNull(G_List_yemian)) Then If ("3" = CStr(G_List_yemian)) Then Response.Write("selected=""selected""") : Response.Write("")%>>/movie/--�ļ�����ʽ</option>							
  </select>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�����ļ�����Ŀ¼ǰ׺��</u></strong><br>�������а����ɵ�Ŀ¼<br></td>						<td class="forumRowHighlight" width="62%"><input name="G_JIN_TAI_PageOne" value="<%=G_JIN_TAI_PageOne%>" size="45"></td>										  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�Զ��徲̬ҳ���׺��</u></strong><br>.html��.htm.��.shtml</td>						<td class="forumRowHighlight" width="62%">							<select name="G_HTML">
    <option value=".html" <%If (Not isNull(G_HTML)) Then If (".html" = CStr(G_HTML)) Then Response.Write("selected=""selected""") : Response.Write("")%>>.html</option>
    <option value=".htm" <%If (Not isNull(G_HTML)) Then If (".htm" = CStr(G_HTML)) Then Response.Write("selected=""selected""") : Response.Write("")%>>.htm</option>							
    </select>						</td>				  	</tr>				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="http://www.ingtiancms.com" target="_blank"><span style="color:#0000FF">?Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25">��վ��ȫ����</th>				<th class="tableHeaderText" align="left" height="25"></th>			</tr>			<tr>				<td colspan="2" id="b_id_8">					<table cellpadding="0" cellspacing="0" border="0" width="100%">					<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�Ƿ�ֻ��һ���û���½(��̨)</u></strong><br>�Ƿ�ֻ��һ���û���½������</td>						<td class="forumRowHighlight" width="62%">							<select name="G_FLAG">
      <option value="1" <%If (Not isNull(G_FLAG)) Then If ("1" = CStr(G_FLAG)) Then Response.Write("selected=""selected""") : Response.Write("")%>>��</option>
      <option value="0"  <%If (Not isNull(G_FLAG)) Then If ("0" = CStr(G_FLAG)) Then Response.Write("selected=""selected""") : Response.Write("")%>>��</option>							
      </select>						</td>					</tr> 					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��̨��½��֤���Ƿ���</u></strong><br>���鿪��</td>						<td class="forumRowHighlight" width="62%">							<select name="G_yzm">
        <option value="true" <%If (Not isNull(G_yzm)) Then If ("true" = CStr(G_yzm)) Then Response.Write("selected=""selected""") : Response.Write("")%>>��</option>
        <option value="False" <%If (Not isNull(G_yzm)) Then If ("False" = CStr(G_yzm)) Then Response.Write("selected=""selected""") : Response.Write("")%>>��</option>							
        </select>						</td>					</tr> 					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��̨�ļ��е�Ŀ¼</u></strong><br>��̨�ļ��е�Ŀ¼��ֻ֧��һ��Ŀ¼�������Ժ���Ѷ�Ӧ��/admin�ļ���Ҳ�ĺ�	</td>						<td class="forumRowHighlight" width="62%"><input name="G_ADMIN" value="<%=G_ADMIN%>" size="45"></td>					</tr> 				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="#" target="_blank"><span style="color:#0000FF">Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25">ǰ̨�û���������</th>				<th class="tableHeaderText" align="left" height="25"></th>			</tr>			<tr>				<td colspan="2" id="b_id_23">					<table cellpadding="0" cellspacing="0" border="0" width="100%">					<tbody><tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�û������Ƿ���</u></strong><br></td>						<td class="forumRowHighlight" width="62%">						<select name="G_user_mem" onChange="f_G_jifen_tuiguang_s()">
          <option value=""  <%If (Not isNull(G_user_mem)) Then If ("" = CStr(G_user_mem)) Then Response.Write("selected=""selected""") : Response.Write("")%>>Ĭ�Ͽ����û�������ҳ</option>
          <option value="1" <%If (Not isNull(G_user_mem)) Then If ("1" = CStr(G_user_mem)) Then Response.Write("selected=""selected""") : Response.Write("")%>>�ر��û�����-���ǲ��ر�ע��</option>
          <option value="2" <%If (Not isNull(G_user_mem)) Then If ("2" = CStr(G_user_mem)) Then Response.Write("selected=""selected""") : Response.Write("")%>>�ر��û�����-���ǹر�ע��-�ر�����</option>						
          </select>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>����--�û�ע���Ͷ��ٻ���</u></strong><br>���鱣��ԭʼ����</td>						<td class="forumRowHighlight" width="62%"><input name="G_zhuce_j2" value="<%=G_zhuce_j2%>" size="45"> Ĭ����5</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>����--�û���½һ���Ͷ��ٻ���</u></strong><br>һ�����ֻ��һ��</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_denglu" value="<%=G_jifen_denglu%>" size="45"> Ĭ����1</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>����--�û��ƹ�һ�������Ͷ��ٻ���</u></strong><br>�ƹ���һ��ֻ���ƹ�һ���ʺ�</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_tuijian" value="<%=G_jifen_tuijian%>" size="45"></td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>����--�û��Զ�������ҳ�Ͷ��ٻ���</u></strong><br> 24Сʱ֮�ڷ���ֻ��һ��</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_home" value="<%=G_jifen_home%>" size="45"></td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�û��Զ�������ҳ�Ͷ��ٻ���--�ӳ�ʱ��</u></strong><br>����˵����ҳ����ʱ���Ժ�ʼ�Ƿ�</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_home_time" value="<%=G_jifen_home_time%>" size="45">  ���磺10 ��ʾĬ��10��</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�ƹ����ģʽ</u></strong><br>��ʱ�䡢��IP</td>						<td class="forumRowHighlight" width="62%">							<select name="G_jifen_tuiguang_s" onChange="f_G_jifen_tuiguang_s()">
            <option value=""  <%If (Not isNull(G_jifen_tuiguang_s)) Then If ("" = CStr(G_jifen_tuiguang_s)) Then Response.Write("selected=""selected""") : Response.Write("")%>>��IP�ǻ���</option>
            <option value="1" <%If (Not isNull(G_jifen_tuiguang_s)) Then If ("1" = CStr(G_jifen_tuiguang_s)) Then Response.Write("selected=""selected""") : Response.Write("")%>>��ʱ��ǻ���</option>
            <option value="2" <%If (Not isNull(G_jifen_tuiguang_s)) Then If ("2" = CStr(G_jifen_tuiguang_s)) Then Response.Write("selected=""selected""") : Response.Write("")%>>��PV�ǻ���</option>							
            </select>							<span id="G_jifen_tuiguang_s_span">1IPֻ��һ���ƹ����</span>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�ƹ����-�û�ÿ�ջ�����������</u></strong><br>��������ã���ô���ֿ�����������</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_s_f_1" value="<%=G_jifen_s_f_1%>" size="45" type="text">							<span id="G_jifen_s_f_1_span">�磺500</span>						</td>				  	</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�ƹ����--�ӳ�ʱ��</u></strong><br>����˵���ƹ����Ӷ���ʱ���Ժ�ʼ��¼����λ�Ǻ���</td>						<td class="forumRowHighlight" width="62%">							<input name="G_jifen_tuiguang_time" value="<%=G_jifen_tuiguang_time%>" size="45">  ���磺10 ��ʾĬ��10��						</td>				  	</tr>					<tr style="display: none;" id="G_jifen_timer_tr">						<td class="forumRowHighlight" height="23" width="38%"><strong><u>���ֲ���--����ʱ����ֻ��һ�λ���</u></strong><br>�������Կ�����Ĭ����0�����ǲ�����</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_timer" value="<%=G_jifen_timer%>" size="45">��λ�� ��</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>�۵��ٷֵı���</u></strong><br>д���֣�Ĭ����0�����ǲ�����</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_jifen_bili" value="<%=G_jifen_jifen_bili%>" size="45"> ֵ����0-100֮��</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>��������������</u></strong><br>Ĭ�����֣�����</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_jifen_name" value="<%=G_jifen_jifen_name%>" size="45"> ���磺J�ҡ�H�� ��</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>����������</u></strong><br>���������1��:200,����ֻҪ��д200����</td>						<td class="forumRowHighlight" width="62%"><input name="G_jifen_jifen_zhifubao_bili" value="<%=G_jifen_jifen_zhifubao_bili%>" size="45"> ���磺200</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>���������</u></strong><br>Ĭ����1Ԫ</td>						<td class="forumRowHighlight" width="62%"><input name="G_tikuan_smail" value="<%=G_tikuan_smail%>" size="45"> ���磺10</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>������Ϊ��ҳ����</u></strong><br>�����û���ÿ��Ϊ��ҳһ�Σ����߼�������Ӧ�Ļ���</td>						<td class="forumRowHighlight" width="62%">						<select name="G_xiaxian_zhuye_1a">
              <option value=""  <%If (Not isNull(G_xiaxian_zhuye_1a)) Then If ("" = CStr(G_xiaxian_zhuye_1a)) Then Response.Write("selected=""selected""") : Response.Write("")%>>������</option>
              <option value="1" <%If (Not isNull(G_xiaxian_zhuye_1a)) Then If ("1" = CStr(G_xiaxian_zhuye_1a)) Then Response.Write("selected=""selected""") : Response.Write("")%>>����</option>						
              </select>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>���ߵ�½����</u></strong><br>�����û���ÿ��½һ�Σ����߼�������Ӧ�Ļ���</td>						<td class="forumRowHighlight" width="62%">						<select name="G_xiaxian_zhuye_2a">
                <option value=""  <%If (Not isNull(G_xiaxian_zhuye_2a)) Then If ("" = CStr(G_xiaxian_zhuye_2a)) Then Response.Write("selected=""selected""") : Response.Write("")%>>������</option>
                <option value="1" <%If (Not isNull(G_xiaxian_zhuye_2a)) Then If ("1" = CStr(G_xiaxian_zhuye_2a)) Then Response.Write("selected=""selected""") : Response.Write("")%>>����</option>						
                </select>						</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>���߻�ȡ�Ľ�������</u></strong><br>�����ñ���������0.5��Ĭ����1,����100%���</td>						<td class="forumRowHighlight" width="62%"><input name="G_xiaxian_zhuye_1_bili" value="<%=G_xiaxian_zhuye_1_bili%>" type="text">�����д0.5 �� 1</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>����������߽���</u></strong><br>�����ñ���������0.1��Ĭ����0.1</td>						<td class="forumRowHighlight" width="62%"><input name="G_xiaxian_2_jiangli" value="<%=G_xiaxian_2_jiangli%>" type="text"> ����  0.1����������дС����0.1��10%</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>ǰ̨�Ƿ񿪷Ż�����ϸ��ѯ</u></strong><br>Ĭ����ֻ�й���Ա���ܲ鿴</td>						<td class="forumRowHighlight" width="62%">						<select name="G_mingxi_look">
                  <option value="" <%If (Not isNull(G_mingxi_look)) Then If ("" = CStr(G_mingxi_look)) Then Response.Write("selected=""selected""") : Response.Write("")%>>ֻ�ܹ���Ա���ܲ鿴</option>
                  <option value="1"  <%If (Not isNull(G_mingxi_look)) Then If ("1" = CStr(G_mingxi_look)) Then Response.Write("selected=""selected""") : Response.Write("")%>>������ϸ��ȫ���û����Ų鿴</option>						
                  </select>						<span id="G_jifen_tuiguang_s_span"></span>							</td>					</tr>					<tr>						<td class="forumRowHighlight" height="23" width="38%"><strong><u>ǰ̨�Ƿ񿪷Ű󶨱�����ҵĹ���</u></strong><br>Ĭ���ǿ���</td>						<td class="forumRowHighlight" width="62%">						<select name="G_jinbi_kaifang">
                    <option value="1"  <%If (Not isNull(G_jinbi_kaifang)) Then If ("1" = CStr(G_jinbi_kaifang)) Then Response.Write("selected=""selected""") : Response.Write("")%>>Ĭ�Ͽ���</option>
                    <option value="2" <%If (Not isNull(G_jinbi_kaifang)) Then If ("2" = CStr(G_jinbi_kaifang)) Then Response.Write("selected=""selected""") : Response.Write("")%>>�رմ˹���</option>						
                    </select>						<span id="G_jifen_tuiguang_s_span"></span>							</td>					</tr>				  	<tr>						<td colspan="2" class="forumRowHighlight" align="right">							<a href="http://www.ingtiancms.com" target="_blank"><span style="color:#0000FF">?Tcms.com</span></a>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>				<th class="tableHeaderText" height="25">ǰ̨�û�ע������</th>				<th class="tableHeaderText" align="left" height="25"><font color="#ff0000">1008�汾�����Ͽ���</font></th>			</tr>			<tr>				<td colspan="2" id="b_id_23">					<table cellpadding="0" cellspacing="0" border="0" width="100%">				  	<tbody><tr>				  		<td class="forumRowHighlight" height="23" width="38%"><strong><u>ǰ̨�Ƿ񿪷�Email����ָ�����</u></strong><br>�û��һ������ʱ������Լ���������û����ʼ�</td>				  		<td class="forumRowHighlight" width="62%">				  		<select name="G_email_f_1">
                      <option value=""  <%If (Not isNull(G_email_f_1)) Then If ("" = CStr(G_email_f_1)) Then Response.Write("selected=""selected""") : Response.Write("")%>>Ĭ�Ϲر�</option>
                      <option value="1" <%If (Not isNull(G_email_f_1)) Then If ("1" = CStr(G_email_f_1)) Then Response.Write("selected=""selected""") : Response.Write("")%>>���Ŵ˹���</option>				  		
                      </select>				  		<span id="G_jifen_tuiguang_s_span">��Ҫ �ʼ������������� </span>						</td>				  	</tr>				  	<tr>				  		<td class="forumRowHighlight" height="23" width="38%"><strong><u>ǰ̨�û�ע���Ƿ���Email��֤����</u></strong><br>�����Ļ���û��Email��֤�Ļ����޷���½�˺�</td>				  		<td class="forumRowHighlight" width="62%">				  		<select name="G_soojs_yz_str">
                        <option value="" <%If (Not isNull(G_soojs_yz_str)) Then If ("" = CStr(G_soojs_yz_str)) Then Response.Write("selected=""selected""") : Response.Write("")%>>Ĭ�ϲ�����</option>
                        <option value="1" <%If (Not isNull(G_soojs_yz_str)) Then If ("1" = CStr(G_soojs_yz_str)) Then Response.Write("selected=""selected""") : Response.Write("")%>>���Ŵ˹���</option>				  		
                        </select>				  		<span id="G_jifen_tuiguang_s_span">��Ҫ �ʼ������������� </span>						</td>				  	</tr>					</tbody></table>				</td>			</tr> 			<tr>			<td colspan="2" class="forumRowHighlight" align="center" height="23">				<input name="Submit" value="��������" id="Submit_ok" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				<input name="Submit2" value="��&nbsp;&nbsp;&nbsp;&nbsp;��" type="reset">&nbsp;&nbsp;&nbsp;&nbsp;				<input name="beifen" checked="checked" value="1" type="checkbox">�Ƿ񱸷�Դ�ļ�				</td>			</tr>		</tbody>	</table></form>
<!--14-04-19 ������ȱ�ٵ�form���-->




<%
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = form;")
		WriteLn("	with(oForm){")
			WriteLn("		G_KEY.value='" & G_KEY & "';")
			WriteLn("		G_DIE.value='" & G_DIE & "';")
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
%>


<script>f_G_jifen_tuiguang_s()</script>
<%
end if
If request("action")="save" Then
Dim str
str=""
'str=str&"<"&chr(37)&"@ LANGUAGE = VBScript.Encode "&chr(37)&">"&chr(10)   ����޸� ��ʱ���� ��ֹ�ظ�ͷ�ļ�����
str=str&"<"&chr(37)&chr(10)
str=str&"'----------------------����������浼��ϵͳ�����ļ�����--------------------------------"&chr(10)
str=str&"On Error Resume Next"&chr(13)&chr(10)
str=str&" G_VIRTUAL_ROOT_DIR = "&re("G_VIRTUAL_ROOT_DIR")&chr(13)&chr(10)
str=str&" G_CONN_STR = "&re("G_CONN_STR")&chr(13)&chr(10)
str=str&" G_IS_SL_User_DB = "&re("G_IS_SL_User_DB")&chr(13)&chr(10)
str=str&" G_SL_IP = "&re("G_SL_IP")&chr(13)&chr(10)
str=str&" G_SL_DATA = "&re("G_SL_DATA")&chr(13)&chr(10)
str=str&" G_SL_USER = "&re("G_SL_USER")&chr(13)&chr(10)
str=str&" G_SL_PASS = "&re("G_SL_PASS")&chr(13)&chr(10)
str=str&" G_WEBTITLE = "&re("G_WEBTITLE")&chr(13)&chr(10)
str=str&" G_WEBNAME = "&re("G_WEBNAME")&chr(13)&chr(10)
str=str&" G_WEBURL = "&re("G_WEBURL")&chr(13)&chr(10)
str=str&" G_WEBURL_2 = "&re("G_WEBURL_2")&chr(13)&chr(10)
str=str&" G_QQ = "&re("G_QQ")&chr(13)&chr(10)


str=str&" G_TEL = "&re("G_TEL")&chr(13)&chr(10)
str=str&" G_EMAIL = "&re("G_EMAIL")&chr(13)&chr(10)
str=str&" G_BEIAN = "&re("G_BEIAN")&chr(13)&chr(10)
str=str&" G_KEY = "&re("G_KEY")&chr(13)&chr(10)
str=str&" G_DIE = "&re("G_DIE")&chr(13)&chr(10)
str=str&" G_moshi = "&re("G_moshi")&chr(13)&chr(10)
str=str&" G_moban = "&re("G_moban")&chr(13)&chr(10)
str=str&" G_moban_html = "&re("G_moban_html")&chr(13)&chr(10)
str=str&" G_HTML = "&re("G_HTML")&chr(13)&chr(10)
str=str&" G_JIN_TAI_PageOne = "&re("G_JIN_TAI_PageOne")&chr(13)&chr(10)
str=str&" G_Time_For = "&re("G_Time_For")&chr(13)&chr(10)
str=str&" G_FLAG = "&re("G_FLAG")&chr(13)&chr(10)
str=str&" G_yzm = "&re("G_yzm")&chr(13)&chr(10)
str=str&" G_ADMIN = "&re("G_ADMIN")&chr(13)&chr(10)
str=str&" EnableUploadFile = "&re("EnableUploadFile")&chr(13)&chr(10)
str=str&" G_BIG_T = "&re("G_BIG_T")&chr(13)&chr(10)
str=str&" MaxFileSize = "&re("MaxFileSize")&chr(13)&chr(10)
str=str&" UpFileType = "&re("UpFileType")&chr(13)&chr(10)
str=str&" G_SHUIYIN = "&re("G_SHUIYIN")&chr(13)&chr(10)
str=str&" G_SHUIYIN_TYPE = "&Replace(re("G_FLAG"),"""","")&chr(13)&chr(10)
str=str&" G_S_PicUrl = "&re("G_S_PicUrl")&chr(13)&chr(10)
str=str&" G_S_MarkText = "&re("G_S_MarkText")&chr(13)&chr(10)
str=str&" G_S_MarkFontColor = "&re("G_S_MarkFontColor")&chr(13)&chr(10)
str=str&" G_S_MarkFontName = "&re("G_S_MarkFontName")&chr(13)&chr(10)
str=str&" G_S_MarkFontBond = "&re("G_S_MarkFontBond")&chr(13)&chr(10)
str=str&" G_S_MarkFontSize = "&re("G_S_MarkFontSize")&chr(13)&chr(10)
str=str&" G_S_MarkPosition = "&re("G_S_MarkPosition")&chr(13)&chr(10)

str=str&" G_lm_baidu = "&re("G_lm_baidu")&chr(13)&chr(10)
str=str&" G_lm_baidu_ch = "&re("G_lm_baidu_ch")&chr(13)&chr(10)
str=str&" G_lm_taobao = "&re("G_lm_taobao")&chr(13)&chr(10)
str=str&" G_lm_xunlei = "&re("G_lm_xunlei")&chr(13)&chr(10)
str=str&" G_lm_google_s = "&re("G_lm_google_s")&chr(13)&chr(10)
str=str&" G_lm_sogou_s = "&re("G_lm_sogou_s")&chr(13)&chr(10)
str=str&" G_lm_amazon_s = "&re("G_lm_amazon_s")&chr(13)&chr(10)
str=str&" G_lm_dangdang_s = "&re("G_lm_dangdang_s")&chr(13)&chr(10)
str=str&" G_lm_360buy = "&re("G_lm_360buy")&chr(13)&chr(10)
str=str&" G_lm_youdao = "&re("G_lm_youdao")&chr(13)&chr(10)
str=str&" G_lm_soso = "&re("G_lm_soso")&chr(13)&chr(10)
str=str&" G_lm_500wan_s = "&re("G_lm_500wan_s")&chr(13)&chr(10)
str=str&" G_JIN_TAI_IndexPage = "&re("G_JIN_TAI_IndexPage")&chr(13)&chr(10)

str=str&" G_union_my = "&re("G_union_my")&chr(13)&chr(10)
str=str&" G_List_yemian = "&re("G_List_yemian")&chr(13)&chr(10)
str=str&" G_u_Cookies = "&re("G_u_Cookies")&chr(13)&chr(10)

str=str&" G_zhuce_j2 = "&re("G_zhuce_j2")&chr(13)&chr(10)
str=str&" G_jifen_denglu = "&re("G_jifen_denglu")&chr(13)&chr(10)
str=str&" G_jifen_tuijian = "&re("G_jifen_tuijian")&chr(13)&chr(10)
str=str&" G_jingtai_wenjian_mulu = "&re("G_jingtai_wenjian_mulu")&chr(13)&chr(10)

str=str&" G_jifen_lailu = "&re("G_jifen_lailu")&chr(13)&chr(10)
str=str&" G_jifen_timer = "&re("G_jifen_timer")&chr(13)&chr(10)
str=str&" G_jifen_tuiguang_s = "&re("G_jifen_tuiguang_s")&chr(13)&chr(10)
str=str&" G_jifen_jifen_bili = "&re("G_jifen_jifen_bili")&chr(13)&chr(10)
str=str&" G_jifen_jifen_name = "&re("G_jifen_jifen_name")&chr(13)&chr(10)
str=str&" G_jifen_home = "&re("G_jifen_home")&chr(13)&chr(10)
str=str&" G_jifen_home_time = "&re("G_jifen_home_time")&chr(13)&chr(10)

str=str&" G_jifen_jifen_zhifubao_bili = "&re("G_jifen_jifen_zhifubao_bili")&chr(13)&chr(10)
str=str&" G_tikuan_smail = "&re("G_tikuan_smail")&chr(13)&chr(10)
str=str&" G_xiaxian_renwu_1 = "&re("G_xiaxian_renwu_1")&chr(13)&chr(10)
str=str&" G_xiaxian_c_1 = "&re("G_xiaxian_c_1")&chr(13)&chr(10)
str=str&" G_xiaxian_c_2 = "&re("G_xiaxian_c_2")&chr(13)&chr(10)
str=str&" G_mingxi_look = "&re("G_mingxi_look")&chr(13)&chr(10)
str=str&" G_xiaxian_zhuye_1a = "&re("G_xiaxian_zhuye_1a")&chr(13)&chr(10)
str=str&" G_xiaxian_zhuye_2a = "&re("G_xiaxian_zhuye_2a")&chr(13)&chr(10)
str=str&" G_jinbi_kaifang = "&re("G_jinbi_kaifang")&chr(13)&chr(10)
str=str&" G_xiaxian_2_jiangli = "&re("G_xiaxian_2_jiangli")&chr(13)&chr(10)
str=str&" G_xiaxian_zhuye_1_bili = "&re("G_xiaxian_zhuye_1_bili")&chr(13)&chr(10)
str=str&" G_jifen_lailu_out = "&re("G_jifen_lailu_out")&chr(13)&chr(10)
str=str&" G_jifen_timer_lailu = "&re("G_jifen_timer_lailu")&chr(13)&chr(10)
str=str&" G_jifen_jifen_bili_lailu = "&re("G_jifen_jifen_bili_lailu")&chr(13)&chr(10)
str=str&" G_jifen_jifen_numbs_lailu = "&re("G_jifen_jifen_numbs_lailu")&chr(13)&chr(10)

str=str&" G_email_f_1 = "&re("G_email_f_1")&chr(13)&chr(10)
str=str&" G_jifen_s_f_1 = "&re("G_jifen_s_f_1")&chr(13)&chr(10)
str=str&" G_soojs_yz_str = "&re("G_soojs_yz_str")&chr(13)&chr(10)
str=str&" G_user_mem = "&re("G_user_mem")&chr(13)&chr(10)

str=str&" G_lm_gouwuke_s = "&re("G_lm_gouwuke_s")&chr(13)&chr(10)
str=str&" G_lm_sina_weibo = "&re("G_lm_sina_weibo")&chr(13)&chr(10)

str=str&" G_jifen_tuiguang_time = "&re("G_jifen_tuiguang_time")&chr(13)&chr(10)

str=str&chr(37)&">"&chr(13)&chr(10)
'save file-----start
'start copy file ����֮ǰ�ȱ���
N_Fso.CreateFolders "/backup/"
IF request.Form("beifen")="1" Then
	Pa="../backup"
	Set d_file1=server.CreateObject(G_FSO)
	set d_folder1=d_file1.GetFolder(""&server.mappath(Pa)&"")
	d_file1.CopyFile server.MapPath("../p_inc/config.asp"),server.MapPath(Pa&"/config_"&FormatDate(now,11)&""&".asp")	
End IF
'end copy file
Path = "../p_inc"
FileName = "config.asp"
EditFile = Server.MapPath(Path) & "\" & FileName
Dim FsoObj,FileObj,FileStreamObj
'Set FsoObj = Server.CreateObject(G_FSO)
'Set FileObj = FsoObj.GetFile(EditFile)
	'Set FileStreamObj = FileObj.OpenAsTextStream(2)
	'FileStreamObj.Write str
    'FileStreamObj.save
'response.Write EditFile
'''----------------------------
write2file EditFile, str, false 
'�¼���д���ļ�����
sub write2file(strfile, strcontent, blnappend) 
'д���ļ� 
'strfile �ļ���(·��) , strcontent д�������, blnappend �Ƿ�׷�� 
on error resume next 
set objfso = server.createobject("scripting.filesystemobject") 
if blnappend then 
set objwritetext = objfso.opentextfile(strfile,8,true) 
else 
set objwritetext = objfso.opentextfile(strfile,2,true) 
end if 
objwritetext.writeline (strcontent) 
set objwritetext = nothing 
set objfso = nothing 
'�ݴ��� 
select case err 
case 424 response.write "·��δ�ҵ����Ŀ¼û��д��Ȩ��." 
case else 
response.write err.description 
response.write err 
end select 
end sub 

'���÷���: 
'write2file "c:��dd.ini", "dd", true 
'�� 
'call write2file ("c:��dd.ini", "dd", true) 


'response.End()


'==================��ʼ��������ͳ��config===================
str=""
str=str&"<"&chr(37)&chr(10)
str=str&" hxCacheName = "&re("hxCacheName")&chr(13)&chr(10)
str=str&" cneip = """""&chr(13)&chr(10)
str=str&" maxReBack = "&re("maxReBack")&chr(13)&chr(10)
str=str&" hxtime = "&re("hxtime")&chr(13)&chr(10)
str=str&" hxLook = "&re("hxLook")&chr(13)&chr(10)
str=str&" G_All_moshi = "&re("G_All_moshi")&chr(13)&chr(10)
str=str&" G_All_InAuto = "&re("G_All_InAuto")&chr(13)&chr(10)
str=str&" G_all_InNumb = "&re("G_all_InNumb")&chr(13)&chr(10)
str=str&" G_All_dhList_f = "&re("G_All_dhList_f")&chr(13)&chr(10)
str=str&chr(37)&">"&chr(13)&chr(10)
IF request.Form("beifen")="1" Then
	Pa="../backup"
	Set d_file1=server.CreateObject(G_FSO)
	set d_folder1=d_file1.GetFolder(""&server.mappath(Pa)&"")
	d_file1.CopyFile server.MapPath("../p_inc/qingtiancms.com.config__.asp"),server.MapPath(Pa&"/config_dh_"&FormatDate(now,11)&""&".asp")	
End IF
Path = "../p_inc"
FileName = "qingtiancms.com.config__.asp"
EditFile = Server.MapPath(Path) & "\" & FileName


Set FsoObj = Server.CreateObject(G_FSO)
Set FileObj = FsoObj.GetFile(EditFile)
Set FileStreamObj = FileObj.OpenAsTextStream(2)
FileStreamObj.Write str



'===��ʼ����д���ļ�================
str1=ReadAllTextFile(Add_Root_Dir("/tUnion/js/1.config"))
IF G_VIRTUAL_ROOT_DIR="" Then
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL)
Else
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")
End IF
N_Fso.CreateFolderFile Add_Root_Dir("/tUnion/js/1.js"),str1

str1=ReadAllTextFile(Add_Root_Dir("/tUnion/js/2.config"))
IF G_VIRTUAL_ROOT_DIR="" Then
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL)
Else
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")
End IF
N_Fso.CreateFolderFile Add_Root_Dir("/tUnion/js/2.js"),str1

'save file-----end

'===��ʼд���������==================
str1=ReadAllTextFile(Add_Root_Dir("/p_inc/qingtiancms.com........asp"))
IF G_VIRTUAL_ROOT_DIR="" Then
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL)
	str1=replace(str1,"{G_VIRTUAL_ROOT_DIR}","/")
Else
	str1=Replace(str1,"{t:G_WEBURL}",G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")
	str1=replace(str1,"{G_VIRTUAL_ROOT_DIR}","/"&request("G_VIRTUAL_ROOT_DIR")&"/")
End IF
str1=Replace(str1,"{t:G_All_moshi}",request("G_All_moshi"))
str1=Replace(str1,"{t:G_All_dhList_f}",request("G_All_dhList_f"))
str1=Replace(str1,"{t:G_WEBNAME}",request("G_WEBNAME"))
str1=Replace(str1,"{t:G_moban}",request("G_moban"))
str1=Replace(str1,"{t:G_jifen_home_time}",Bint(request("G_jifen_home_time"))*1000)
str1=Replace(str1,"{t:G_jifen_tuiguang_time}",Bint(request("G_jifen_tuiguang_time"))*1000)
str1=MakeHTML_CMS(str1)

N_Fso.CreateFolderFile Add_Root_Dir("/p_inc/public.js"),str1

IF Cadmin="" Then
str_f=Add_Root_Dir("/template/"&G_moban&"/js/public4/rebuild/css/index.css.gif")
str1=ReadAllTextFile(str_f)
str1_u="http://"&request.ServerVariables("HTTP_HOST")&Add_Root_Dir("/")&"Template/"&G_moban&"/images/logo.png"
str1=Replace(str1,"http://hao123.ingti"&"andy.cn/skin19"&"s/Template/skin19_4_20100527/images/logo.png",str1_u)
N_Fso.CreateFolderFile Add_Root_Dir("/template/"&G_moban&"/js/public4/rebuild/css/index.css"),str1
End IF


response.write"<table cellpadding=2 cellspacing=1 border=0 width=400 class=tableBorder align=center>"
response.write"<TR>"
response.write"<TH class=tableHeaderText colSpan=2 height=25>������վ��Ϣ</TH>"
'response.Flush()
'response.write"<TR><tr><td height=85 valign=top class=forumRowHighlight><div align=left><br><br>����ת�����ò��ŷ�ʽ���벻Ҫ�ر�....<br>"
'response.Flush()
'response.Write "��ǰ֧�ָ�ʽ��"&G_v_type&"<br>"
'response.Write "����֧�ָ�ʽ��"&request("G_v_type")&"<br>"
'
'G_v_type_arr=split(G_v_type,",")
'G_v_type_t=G_v_type
'For i=0 To Ubound(G_v_type_arr)
'	IF Instr(request("G_v_type"),G_v_type_arr(i))>0 Then
'		G_v_type_t=replace(G_v_type_t,G_v_type_arr(i),"")
'	End IF
'Next
'G_v_type_t=PrintArray(G_v_type_t,",")
'response.Write "ȥ����ʽ��"&G_v_type_t&"<br>"
'G_v_type_t_arr=Split(G_v_type_t,",")
'For i=0 To Ubound(G_v_type_t_arr)
'	G_v_type_t_1=Trim(G_v_type_t_arr(i))
'	IF G_v_type_t_1<>"" Then
'		conn.execute("update ingtiandy_movie set m_look=0 where m_type3='"&G_v_type_t_1&"'")
'	End IF
'Next
'response.Write"ת�����!</div></td></tr>"
response.write"<TR><tr><td height=85 valign=top class=forumRowHighlight><div align=center><br><br>��վ���ñ���ɹ���</div></td></tr>"
response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='qingtiancms.com.setting.asp'>&lt;&lt; ������һҳ</a></td>"
response.write"</tr>"
response.write"</table>"
response.write"<br><br>" 
Response.Write "<script>parent.left.location.reload()</script>"
end if



%>
</body>
</html>
