<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../inc/classDbPager.asp"-->
<!--#include file="../inc/public.asp"-->
<!--#include file="../inc/openconn.asp"-->
<!--#include file="News/Config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��վ��Ϣ����</title>
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<style type="text/css">
<!--
.bg66{ color:#666666}

-->
</style>
</head>
<body>
<%

If request.Cookies(Sky_Admin_Cookies_1)("admin_u")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_p")="" or request.Cookies(Sky_Admin_Cookies_1)("admin_m")="" Then
	response.Redirect(Add_Root_Dir("/"&G_ADMIN&"/login.asp"))
	response.End()
End IF
response.Cookies("qingtiandy.cn")=""
If request("action")="" Then
Function Basic_1()
	IF G_IS_SQL_User_DB="1" Then
		Basic_1="(<font color=""#FF0000"">�ظ�</font>)"
	Else
		Basic_1=""
	End IF
End Function

Function Basic_2()
	IF G_IS_SQL_User_DB="1" Then
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
	Ghelp="<a href='"&v&"' target=_blank><img src='../images/help.gif' border=0 alt='�鿴����'></a>"
End Function
Function req(v)
	req=""""&request.Form(v)&""""
End Function
%>
<script src="../js/basicjs.js"></script>
<script src="images/admincitys.js"></script>
<script src="images/admin.js"></script>
<form action="?action=save" method="post" name="form">







<!--������-->

<table class="tableBorder" cellpadding="3" cellspacing="1" align="center" border="0" width="98%"><tbody><tr><th class="tableHeaderText" height="25" width="38%">1616��������</th><th class="tableHeaderText" height="25" width="62%"></th></tr>  <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>����Ԥ��Ĭ��ѡ�����</u></strong><br>			  �����ѡ��Ĭ���������жϵ�</td>				<td class="forumRowHighlight" width="62%">				  <select id="w_pro" onChange="Weather.cp(this.value)">	

<option value="100">Z �����ж�</option>					<option value="109">B ����</option>					<option value="117">S �Ϻ�</option>					<option value="110">T ���</option>					<option value="135">C ����</option>					<option value="119">A ����</option>					<option value="123">F ����</option>					<option value="127">G �㶫</option>					<option value="128">G ����</option>					<option value="137">G ����</option>					<option value="131">G ����</option>					<option value="111">H �ӱ�</option>					<option value="124">H ����</option>					<option value="125">H ����</option>					<option value="126">H ����</option>					<option value="129">H ����</option>					<option value="116">H ������</option>					<option value="122">J ����</option>					<option value="120">J ����</option>					<option value="115">J ����</option>					<option value="114">L ����</option>					<option value="132">N ����</option>					<option value="113">N ���ɹ�</option>					<option value="133">Q �ຣ</option>					<option value="118">S ɽ��</option>					<option value="112">S ɽ��</option>					<option value="130">S ����</option>					<option value="136">S �Ĵ�</option>					<option value="139">X ����</option>					<option value="134">X �½�</option>					<option value="138">Y ����</option>					<option value="121">Z �㽭</option>					<option value="140">X ���</option>					<option value="141">A ����</option>					<option value="142">T ̨��</option>				  </select>				  <select id="w_city" onChange="Weather.cc(this.value);"></select>				  <select id="l_city" name="G_qTcms_Com_16_City"></select>				</td>			</tr>				</tbody></table>  	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>Ĭ��������������</u></strong><br>			  Ĭ���ǰٶ�</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_sosuo_q">
  <option value="" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>Ĭ��</option>
  <option value="baidu"  <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("baidu" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>�ٶ�����</option>
  <option value="google" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("google" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>�ȸ�����</option>
  <option value="s360" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("s360" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>360����</option>
  <option value="sogou" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("sogou" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>�ѹ�����</option>
  <option value="bing" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("bing" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>��Ӧ����</option>
  <option value="youdao" <%If (Not isNull(G_qTcms_Com_16_sosuo_q)) Then If ("youdao" = CStr(G_qTcms_Com_16_sosuo_q)) Then Response.Write("selected=""selected""") : Response.Write("")%>>�е�����</option>				 
  </select>				</td>			</tr>		</tbody></table>  	</td>  </tr>   <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>��վ�Ƿ����ڽ���QQ���</u></strong><br>			  ���QQ��½��������ύ��ˣ������ѡ��</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_qq">
    <option value="" <%If (Not isNull(G_qTcms_Com_16_qq)) Then If ("" = CStr(G_qTcms_Com_16_qq)) Then Response.Write("selected=""selected""") : Response.Write("")%>>QQ��½����ʾ</option>
    <option value="1" <%If (Not isNull(G_qTcms_Com_16_qq)) Then If ("1" = CStr(G_qTcms_Com_16_qq)) Then Response.Write("selected=""selected""") : Response.Write("")%>>QQ��½�������</option>
    <option value="2"  <%If (Not isNull(G_qTcms_Com_16_qq)) Then If ("2" = CStr(G_qTcms_Com_16_qq)) Then Response.Write("selected=""selected""") : Response.Write("")%>>QQ��ͨ�����</option>				 
    </select>				</td>			</tr>		</tbody></table>  	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>���������Ƿ���ʾ</u></strong><br>			  Ĭ������ʾ</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_yq">
      <option value="1"  <%If (Not isNull(G_qTcms_Com_16_yq)) Then If ("1" = CStr(G_qTcms_Com_16_yq)) Then Response.Write("selected=""selected""") : Response.Write("")%>>��ʾ</option>
      <option value="2" <%If (Not isNull(G_qTcms_Com_16_yq)) Then If ("2" = CStr(G_qTcms_Com_16_yq)) Then Response.Write("selected=""selected""") : Response.Write("")%>>����</option>				 
      </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>Ĭ��Ƥ������</u></strong><br>			  �����ѡ��Ĭ���ǿհ׵�</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_Pifu">
        <option value="" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>Ĭ�Ͽհ�</option>
        <option value="singer" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("singer" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--���Ǹ���</option>
        <option value="2014newyear" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("2014newyear" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--������(�������)</option>
        <option value="2014qrj" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("2014qrj" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--�������˽�(02.14)</option>
        <option value="qrj" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("qrj" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--���˽�(02.14)</option>
        <option value="smqm" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("smqm" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--����</option>
        <option value="spring" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("spring" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--ˮī����(������)</option>
        <option value="childrens" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("childrens" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��һ��ͯ��(06.01)</option>
        <option value="kxl" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("kxl" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��ѧ��</option>
        <option value="teacher" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("teacher" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��ʦ�ڿ���(09.10)</option>
        <option value="xmas" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("xmas" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--ʥ����(12.25)</option>
        <option value="practical" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("practical" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��ʵ�õ���ַ����</option>
        <option value="rocket" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("rocket" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--�ɿ�Ļ��</option>
        <option value="hellokitty" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("hellokitty" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--hellokitty</option>
        <option value="gytt" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("gytt" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--������̳</option>
        <option value="meng" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("meng" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--�ȵ���</option>
        <option value="dpx" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("dpx" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��ƽ��</option>
        <option value="yuanfan" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("yuanfan" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--Զ��</option>
        <option value="zoro" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("zoro" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��¡�������ȹ���</option>
        <option value="love" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("love" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--������Զ��һ��</option>
        <option value="qhc" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("qhc" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--�໨��</option>
        <option value="byj" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("byj" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��ҵ��</option>
        <option value="fly" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("fly" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--���w�Լ������҉���</option>
        <option value="qb" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("qb" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--�������ᡤ�ǰ�</option>
        <option value="color" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("color" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��ɫ��ǩ</option>
        <option value="shopping" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("shopping" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��������-����ʱ��</option>
        <option value="summer" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("summer" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--���պ���</option>
        <option value="butterfly" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("butterfly" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--�����ɷ�</option>
        <option value="angryBirds" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("angryBirds" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��ŭ��С��</option>
        <option value="emotionalBus" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("emotionalBus" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��а�ʿ</option>
        <option value="2012guoqin" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("2012guoqin" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--����63����</option>
        <option value="classicsPink" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("classicsPink" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--�����</option>
        <option value="pink" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("pink" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--�ۺ�ɫ</option>
        <option value="classicsGreen" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("classicsGreen" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--������</option>
        <option value="green"  <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("green" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��ɫ(��hao123)</option>
        <option value="classicsBlue" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("classicsBlue" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--������</option>
        <option value="blue" <%If (Not isNull(G_qTcms_Com_16_Pifu)) Then If ("blue" = CStr(G_qTcms_Com_16_Pifu)) Then Response.Write("selected=""selected""") : Response.Write("")%>>--��ɫ</option>				 
        </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>   <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>�Զ��ɼ�ģ��</u></strong><br>			  �����Ϣ��ʱ��ѡ�������ģ��Ϳ���֧���Զ��ɼ�</td>				<td class="forumRowHighlight" width="62%">				<table cellpadding="0" cellspacing="0" border="0" width="100%">				  <tbody><tr>					<td>
		<%

		getG_qTcms_Com_16_mkuai=Split(G_qTcms_Com_16_mkuai,",") '����Ķ���ȡ������֮ǰ���浽���ݿ��еķָ�� 
		

Function check(temp) 
check="" 
For I=0 To UBound(getG_qTcms_Com_16_mkuai) 
if temp=trim(getG_qTcms_Com_16_mkuai(I)) Then 
check="checked" 
End if 
Next 
End Function 
			
		%>
		
							<input name="G_qTcms_Com_16_mkuai" value="*"  type="checkbox" <%=check("*")%>>ȫ��					</td>				  </tr>				  <tr>					<td>					<hr>					</td>				  </tr>				  <tr>					<td>					<input name="G_qTcms_Com_16_mkuai" value="qingtiancms_com_toutiao" type="checkbox" <%=check("qingtiancms_com_toutiao")%>>
        ͷ��					<input name="G_qTcms_Com_16_mkuai" value="xinwen" type="checkbox" <%=check("xinwen")%>>����					<input name="G_qTcms_Com_16_mkuai" value="junshi" type="checkbox" <%=check("junshi")%>>����					<input name="G_qTcms_Com_16_mkuai" value="tiyu" type="checkbox" <%=check("tiyu")%>>����					<input name="G_qTcms_Com_16_mkuai" value="bagua" type="checkbox" <%=check("bagua")%>>����									<input name="G_qTcms_Com_16_mkuai" value="guonei" type="checkbox" <%=check("guonei")%>>����									<input name="G_qTcms_Com_16_mkuai" value="guoji" type="checkbox" <%=check("guoji")%>>����									<input name="G_qTcms_Com_16_mkuai" value="yule" type="checkbox" <%=check("yule")%>>����									<input name="G_qTcms_Com_16_mkuai" value="hulianwang" type="checkbox" <%=check("hulianwang")%>>������				<br>					<input name="G_qTcms_Com_16_mkuai" value="keji" type="checkbox" <%=check("keji")%>>�Ƽ�									<input name="G_qTcms_Com_16_mkuai" value="caijing" type="checkbox" <%=check("caijing")%>>�ƾ�									<input name="G_qTcms_Com_16_mkuai" value="fangchan" type="checkbox" <%=check("fangchan")%>>����									<input name="G_qTcms_Com_16_mkuai" value="jiaoyu" type="checkbox" <%=check("jiaoyu")%>>����									<input name="G_qTcms_Com_16_mkuai" value="youxi" type="checkbox" <%=check("youxi")%>> ��Ϸ									<input name="G_qTcms_Com_16_mkuai" value="nvxing" type="checkbox" <%=check("nvxing")%>>Ů��									<input name="G_qTcms_Com_16_mkuai" value="jiankang" type="checkbox" <%=check("jiankang")%>>����									<input name="G_qTcms_Com_16_mkuai" value="shehui" type="checkbox" <%=check("shehui")%>>���									</td>				  </tr>				  <tr>					<td>					<hr>					</td>				  </tr>				  <tr>					<td>					<input name="G_qTcms_Com_16_mkuai" value="shipin" type="checkbox" <%=check("shipin")%>>��Ƶ					<input name="G_qTcms_Com_16_mkuai" value="dianying" type="checkbox" <%=check("dianying")%>>��Ӱ					<input name="G_qTcms_Com_16_mkuai" value="zongyi" type="checkbox" <%=check("zongyi")%>>����					<input name="G_qTcms_Com_16_mkuai" value="dongman" type="checkbox" <%=check("dongman")%>>����						<input name="G_qTcms_Com_16_mkuai" value="tv" type="checkbox" <%=check("tv")%>>���Ӿ�						<input name="G_qTcms_Com_16_mkuai" value="mingxing" type="checkbox" <%=check("mingxing")%>>����						<input name="G_qTcms_Com_16_mkuai" value="meinv" type="checkbox" <%=check("meinv")%>>��Ů						</td>				  </tr>				  <tr>					<td>					<hr>					</td>				  </tr>				  <tr>					<td>										<input name="G_qTcms_Com_16_mkuai" value="qingtiancms_com_xiaohua" type="checkbox" <%=check("qingtiancms_com_xiaohua")%>>Ц��						</td>				  </tr>				  <tr>					<td>					<hr>					</td>				  </tr>				  <tr>					<td>					<input name="G_qTcms_Com_16_mkuai" value="bgyl" type="checkbox" <%=check("bgyl")%>>��������					<input name="G_qTcms_Com_16_mkuai" value="mnyy" type="checkbox" <%=check("mnyy")%>>������Ů					<input name="G_qTcms_Com_16_mkuai" value="mryx" type="checkbox" <%=check("mryx")%>>ÿ��һЦ					</td>				  </tr>				  <tr>					<td>					<hr>					</td>				  </tr>				  <tr>					<td>										<input name="G_qTcms_Com_16_mkuai" value="qingtiancms_com_toplist" type="checkbox" check>������ؼ���						</td>				  </tr>				</tbody></table>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>��ҳ��վ������ʾ����</u></strong><br>			  Ĭ������ʾ</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_right_mz">
          <option value="48"  <%If (Not isNull(G_qTcms_Com_16_right_mz)) Then If ("48" = CStr(G_qTcms_Com_16_right_mz)) Then Response.Write("selected=""selected""") : Response.Write("")%>>Ĭ��48��</option>
          <option value="60" <%If (Not isNull(G_qTcms_Com_16_right_mz)) Then If ("60" = CStr(G_qTcms_Com_16_right_mz)) Then Response.Write("selected=""selected""") : Response.Write("")%>>60��</option>				 
          </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>�������Żݰ�� �Ƿ���ʾ</u></strong><br>			  Ĭ������ʾ</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_qingtiancms_b_b1">
            <option value="2"  <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b1)) Then If ("2" = CStr(G_qTcms_Com_16_qingtiancms_b_b1)) Then Response.Write("selected=""selected""") : Response.Write("")%>>Ĭ����ʾ</option>
            <option value="1" <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b1)) Then If ("1" = CStr(G_qTcms_Com_16_qingtiancms_b_b1)) Then Response.Write("selected=""selected""") : Response.Write("")%>>���ظð��</option>				 
            </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>�������ְɰ�� �Ƿ���ʾ</u></strong><br>			  Ĭ������ʾ</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_qingtiancms_b_b2">
              <option value="2"  <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b2)) Then If ("2" = CStr(G_qTcms_Com_16_qingtiancms_b_b2)) Then Response.Write("selected=""selected""") : Response.Write("")%>>Ĭ����ʾ</option>
              <option value="1" <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b2)) Then If ("1" = CStr(G_qTcms_Com_16_qingtiancms_b_b2)) Then Response.Write("selected=""selected""") : Response.Write("")%>>���ظð��</option>				 
              </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>��ù��߰�� �Ƿ���ʾ</u></strong><br>			  Ĭ������ʾ</td>				<td class="forumRowHighlight" width="62%">				<select name="G_qTcms_Com_16_qingtiancms_b_b3">
                <option value="2" <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b3)) Then If ("2" = CStr(G_qTcms_Com_16_qingtiancms_b_b3)) Then Response.Write("selected=""selected""") : Response.Write("")%>>Ĭ����ʾ</option>
                <option value="1" <%If (Not isNull(G_qTcms_Com_16_qingtiancms_b_b3)) Then If ("1" = CStr(G_qTcms_Com_16_qingtiancms_b_b3)) Then Response.Write("selected=""selected""") : Response.Write("")%>>���ظð��</option>				 
                </select>				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>�������Żݰ�� ����������</u></strong><br>			  Ĭ������ʾ</td>				<td class="forumRowHighlight" width="62%">				<input name="G_qTcms_Com_16_qingtiancms_b_c1" id="G_qTcms_Com_16_qingtiancms_b_c1" value="<%=G_qTcms_Com_16_qingtiancms_b_c1%>"> 10����������				Ƥ���汾��1005�Լ�������Ч�����ģ������������				</td>			</tr>			</tbody></table> 	</td>  </tr>    <tr><td colspan="2">		<table cellpadding="0" cellspacing="0" border="0" width="100%">				<tbody><tr>			<td class="forumRowHighlight" height="23" width="38%"><strong><u>�������ְɰ�� ����������</u></strong><br>			  Ĭ������ʾ</td>				<td class="forumRowHighlight" width="62%">				<input name="G_qTcms_Com_16_qingtiancms_b_c2" id="G_qTcms_Com_16_qingtiancms_b_c2" value="<%=G_qTcms_Com_16_qingtiancms_b_c2%>"> 10����������				Ƥ���汾��1005�Լ�������Ч�����ģ������������				</td>			</tr>			</tbody></table> 	</td>  </tr> 				  <tr>					<td colspan="2" class="forumRowHighlight" align="right">						<a href="http://www.qingtiancms.com" target="_blank"><span style="color:#0000FF">?qTcms.com</span></a>					</td>				  </tr>



	
	<tr>
	  <td colspan="2" class="forumRowHighlight" align="center" height="23"><input name="Submit" value="��������" id="Submit_ok" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="Submit2" value="��&nbsp;&nbsp;&nbsp;&nbsp;��" type="reset">&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
  </tr>	  	



  






</tbody></table>




	
	<TR>
	  <td height=23 colspan="2" class="forumRowHighlight" align="center"><input type="submit" name="Submit" value="��������" id="Submit_ok">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="reset" name="Submit2" value="��&nbsp;&nbsp;&nbsp;&nbsp;��">&nbsp;&nbsp;&nbsp;&nbsp;
	  </td>
  </tr>	  	
</form>


  



<%
end if
If request("action")="save" Then



Dim str
str=""
str=str&"<"&chr(37)&chr(10)
str=str&" G_qTcms_Com_16_Time = "&req("G_qTcms_Com_16_Time")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_City = "&req("G_qTcms_Com_16_City")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_Pifu = "&req("G_qTcms_Com_16_Pifu")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_lie = "&req("G_qTcms_Com_16_lie")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_mz = "&req("G_qTcms_Com_16_mz")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_tj2 = "&req("G_qTcms_Com_16_tj2")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_yq = "&req("G_qTcms_Com_16_yq")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qq = "&req("G_qTcms_Com_16_qq")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_sosuo_q = "&req("G_qTcms_Com_16_sosuo_q")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_mkuai = "&req("G_qTcms_Com_16_mkuai")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_right_mz = "&req("G_qTcms_Com_16_right_mz")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qingtiancms_b_b1 = "&req("G_qTcms_Com_16_qingtiancms_b_b1")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qingtiancms_b_b2 = "&req("G_qTcms_Com_16_qingtiancms_b_b2")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qingtiancms_b_b3 = "&req("G_qTcms_Com_16_qingtiancms_b_b3")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qingtiancms_b_c1 = "&req("G_qTcms_Com_16_qingtiancms_b_c1")&chr(13)&chr(10)
str=str&" G_qTcms_Com_16_qingtiancms_b_c2 = "&req("G_qTcms_Com_16_qingtiancms_b_c2")&chr(13)&chr(10)
str=str&chr(37)&">"&chr(13)&chr(10)


Path = "../../p_inc/qingtiancms.com.Config_Self.asp"


N_Fso.WriteToFile Path,str





response.write"<table cellpadding=2 cellspacing=1 border=0 width=400 class=tableBorder align=center>"
response.write"<TR>"
response.write"<TH class=tableHeaderText colSpan=2 height=25>������վ��Ϣ</TH>"

response.write"<TR><tr><td height=85 valign=top class=forumRowHighlight><div align=center><br><br>���ñ���ɹ���</div></td></tr>"
response.write"<tr align=center><td height=30 class=forumRowHighlight><a href='setting.asp'>&lt;&lt; ������һҳ</a></td>"
response.write"</tr>"
response.write"</table>"
response.write"<br><br>" 
end if



%>
</body>
</html>
