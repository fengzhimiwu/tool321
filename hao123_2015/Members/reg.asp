<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<%
IF Bint(Request.Cookies(G_u_Cookies)("soojs_id"))<>0 Then
	Response.Write "�Բ������Ѿ�ע����ˣ��޷��ټ���ע�ᣬ<a href='../' target=_self>���������ҳ</a>"
	Response.End()
End IF
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta content="<%=G_WEBNAME%>�û����ģ�ֻҪ��ע����<%=G_WEBNAME%>�˺ţ��Ϳ�������<%=G_WEBNAME%>Ϊ���ṩ�����и��Ի�����ֻҪ����һ�����֣��Ϳ�һվͨ�С�" name="description">
<meta content="<%=G_WEBNAME%>�û�����,<%=G_WEBURL_2%>,�û�����,һվͨ" name="keywords">
<link rel="stylesheet" type="text/css" href="Ucss/reset.css" />
<link rel="stylesheet" type="text/css" href="Ucss/common.css" />
<link rel="stylesheet" type="text/css" href="Ucss/layout.css" />
<script type="text/javascript" src="Ujs/checkUser.js"></script>

<title>�����û� - <%=G_WEBNAME%></title>
</head>
<body>
		<style type="text/css">
		.item_desc {
			MARGIN-TOP: 1px; COLOR: #666
		}
		.item_green {
			COLOR: #008000
		}		
		</style>		
	  <DIV id=check_username_script style="DISPLAY: none"></DIV>
      <DIV id=err_msg style="DISPLAY: none" class="err_child" >
		  <DIV id=msg_pw_verify>ȷ�����������벻һ��</DIV>	  
		  <DIV id=msg_if_format>����ȷ��дURL</DIV>
		  <DIV id=msg_ik_blank>����д�ؼ���</DIV>
		  <DIV id=msg_ik_format>�ؼ��ʽ���ʹ�ú��֡����֡��ո���ĸ���»���</DIV>	  	  	  

		  <DIV id=msg_cn_ok>��������ϸ��Ϣ</SPAN></DIV>
		  <DIV id=msg_format>ע�����ݸ�ʽ����</DIV>
		  <DIV id=msg_unknow>ע��ʱ����δ֪����</DIV>


		  <DIV id=msg_un_checking><SPAN class=item_desc>���ڼ���ǳ��Ƿ���ã����Ժ򡭡�</SPAN></DIV>
		  <DIV id=msg_un_ok><SPAN class=item_green>��������ǳƿ��ã��������</SPAN></DIV>
		  <DIV id=msg_un_blank>�������ǳ�</DIV>
		  <DIV id=msg_un_length_max>����16���ֽ�</DIV>
		  <DIV id=msg_un_length_min>��������4���ֽ�</DIV>
		  <DIV id=msg_un_format>�ǳƽ���ʹ�����֡���ĸ���»���</DIV>
		  <DIV id=msg_un_exists>���ǳ��Ѵ��ڣ�����һ��</DIV>


		  <DIV id=msg_pw_blank>����д����</DIV>
		  <DIV id=msg_pw_length>[4~14]���ֺ��ַ�</DIV>
		  <DIV id=msg_pw_format>������������֣���ĸ���»������</DIV>
		  <DIV id=msg_pw_seclow class=item_desc>��������ṹ���ڼ򵥣�����������֣���ĸ��ϵ�����</DIV>
		  <DIV id=msg_pw_secmid class=item_green>�����������һ����ȫ�ԣ����ʹ�����֣���ĸ���»�����ϵ�����</DIV>
		  <DIV id=msg_pw_sechigh class=item_green>���������൱��ȫ����Ǻ�</DIV>



		  
		  <DIV id=msg_email_checking><SPAN class=item_desc>���ڼ���ʼ��Ƿ���ã����Ժ򡭡�</SPAN></DIV>
		  <DIV id=msg_email_blank>�������ʼ���ַ</DIV>
		  <DIV id=msg_email>�ʼ���ʽ����ȷ</DIV>
		  <DIV id=msg_email_exists>���ʼ��Ѵ��ڣ�����һ��</DIV>
		  <DIV id=msg_email_ok><SPAN class=item_green>��������ʼ����ã��������</SPAN></DIV>


		  <DIV id=msg_vc_checking><SPAN class=item_desc>���ں˶���֤�룬���Ժ򡭡�</SPAN></DIV>
		  <DIV id=msg_vc_blank>��������֤��</DIV>
		  <DIV id=msg_vc_format>��֤���ʽ����</DIV>
		  <DIV id=msg_vc_err>��֤�����</DIV>
		  <DIV id=msg_vc_ok><SPAN class=item_green>���������֤����ȷ��</SPAN></DIV>
		  
	  </DIV>
	  
	  
	  
	  
<div class="wrap">
	<div class="head">
		<h1 class="logo fl"><a href="./"><%=G_WEBNAME%> �û�����</a></h1>
		<p class="gray text-right pv10">
			<a href="../">������ҳ</a> |  
		</p>
		<div class="guide">				
			<h2 class="font-14">ע��/��½�û�</h2>
		</div>
	</div>
	<div class="main-content">
		<div class="leftbar" style="float:left; width:600px">
			<div class="box1">
				<div class="box-head">
					<h3 class="inline">ע��</h3>
					<span  class="pw10">�������û�������ע��</span>
				</div>
				<form class="mv15 pv10 leftform" id="userreg"  method="post" action="regok.asp" autocomplete="off" onSubmit="return checkForm(this);" name="form1_s">
				<input type="hidden" name="action" value="reg" />
				<input name="Back_url2" type="hidden" value="<%=server.HTMLEncode(LoseeeHtml(request.ServerVariables("HTTP_REFERER")))%>">
					<fieldset>
						<legend>�û�ע��</legend>
						<div>
							<label for="reg-email">
								<span class="form-caption">����Email��ַ��</span>
								<input type="text" class="input-text" id="soojs_u_email" name="soojs_u_email" value="" maxlength="50"  rel="text_flag"  onchange=checkOnChange(this); tabindex="1" /><span class="form-tips" id="soojs_u_email_1">���� abc@qq.com��������֤�����ʻ����¼</span>
							</label>
						</div>
						<div>
							<label for="reg-name">
								<span class="form-caption">�ǳƣ�</span>
								<input  type="text" class="input-text" id="soojs_u_name" name="soojs_u_name" value="" maxlength="16" rel="text_flag"  onchange=checkOnChange(this); tabindex="2" /><span class="form-tips" id="soojs_u_name_1">����4���ַ�,������16���ַ�(���֣���ĸ���»���)</span>
							</label>
						</div>
						<div>
							<label for="reg-pw"> <span class="form-caption">�������룺</span>
								<input type="password" class="input-text" id="soojs_u_pass" name="soojs_u_pass" value="" maxlength="14" rel="text_flag" onchange=checkOnChange(this); tabindex="3" />
								<span class="form-tips" id="soojs_u_pass_1">��4-14��Ӣ����ĸ�����֡��»�����ɡ�</span>
							</label>				
						</div>
						<div>
							<label for="reg-vpw">
								<span class="form-caption">�ظ����룺</span>
								<input type="password" class="input-text" id="soojs_u_pass2" name="soojs_u_pass2" rel="text_flag" value="" maxlength="14" onchange=checkOnChange(this); tabindex="4" /><span class="form-tips" id="soojs_u_pass2_1">������ͬ����</span>
							</label>
						</div>
						<div>
							<label for="reg-code">
								<span class="form-caption">��֤�룺</span>
							<input type="text" class="input-text valicode" id="soojs_code" value="" name="soojs_code" maxlength="4" onchange=checkOnChange(this); rel="text_flag" tabindex="5"  />
								<IMG id=verifypic src="Ujs/code.asp" border=0 >
								<a href="javascript:newverifypic();" title="��������ߵ��ַ�">�����壿</a>
								<em class="form-info" id="reg-code_msg"></em>								<span class="form-tips" id="soojs_code_1">����ͼ�е��ַ�,�����ִ�Сд</span>
							</label>
						</div>
                        
						<div>
							<span class="form-caption">&nbsp;</span><input type="submit"  class="button btn-green" value="��Ϣ����ˣ�����ע��" tabindex="6" />
						</div>
                        <input name="referer" type="hidden" id="referer" value="http://fav.115.com/" />
					</fieldset>
				</form>
			</div>
		</div>
		<div class="rightbar" style="float:right; width:300px">
			<div class="box2">
				<div class="box-head">
						<h3 class="inline">��¼</h3>
						<span class="pw10">�Ѿ�ע����ˣ��������¼</span>
				</div>
				<form class="pv3 rightform" id="userlogin" method="post" action="regok.asp" name="form1_s2">
				<input name="action" type="hidden" value="login" />
				<input name="Back_url2" type="hidden" value="<%=server.HTMLEncode(LoseeeHtml(request.ServerVariables("HTTP_REFERER")))%>">
					<fieldset>
						<legend>�û���¼</legend>
						<div>
							<em id="message"></em></div>
                        <div>
							<label for="log-email">
								<p class="form-caption">�ǳ�/Email��ַ��</p>
								<input type="text" class="input-text" id="soojs_u_email" name="soojs_u_email" value="" maxlength="60"/>
							</label>
						</div>
						<div>
							<label for="log-pw">
								<p class="form-caption">���룺</p>
								<input type="password" class="input-text" id="soojs_u_pass" name="soojs_u_pass" value="" maxlength="20"/>
							</label>
						</div>
                       <div>
							<a class="fr" href="./ugetpass.asp">�һ�����</a>
							<!--
							<label for="log-time">
								<input type="checkbox" id="remember" name="remember" />
								<span>�´��Զ���¼</span>
							</label>
							-->
						</div>
						<!--
						<div id="log-time-msg">
				             <span class="red">ѡ�������´ν��Զ���¼������һ������Ч����Ϊ��������Ϣ��ȫ���벻Ҫ�����ɻ��õ�����ʹ�á�</span>
			            </div>
						-->
						<div>
							<input type="submit" class="button btn-blue" value="��¼" name="soojs_su" id="soojs_su" />
						<a href="http://www.panxinyou.com/Api_qqlogin/redirect.asp"><img src="http://www.panxinyou.com/template/skin19_4_20100527/images/other/qq_login.png"></a>
						</div>
					</fieldset>
				</form>
								
			</div>
		</div>
	</div>
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>