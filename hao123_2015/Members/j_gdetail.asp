<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="upublic.asp"-->
<!--#include file="function_u.asp"-->

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
<script type="text/javascript" src="Ujs/FormCity.js"></script>
<script type="text/javascript" src="Ujs/FormScript.js"></script>
<title>��Ʒ��ϸ��Ϣ - �û����� - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">��Ʒ��ϸ��Ϣ</h3>
					<p><a href="j_glist.asp">���ؽ�Ʒ�б�</a></p>
					<div class="hr"></div>
				</div>	
				<%
					zid=Bint(Request("id"))
					Set oRs_detail=Server.CreateObject(G_RS)
					oRs_detail.open "Select * From qingtiandy_jifen_goods Where id="&zid,conn,1,1
					IF Not oRs_detail.Eof Then 
						zg_pic=Add_Root_Dir(oRs_detail("g_pic"))
						zg_jifen=oRs_detail("g_jifen")
						zg_name=oRs_detail("g_name")
						zg_content=oRs_detail("g_content")
						zg_content=HTMLEncode5(zg_content)
				%>	
				<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
				  <tr>
					<td width="37%" rowspan="2" align="center" valign="middle"><img src="<%=zg_pic%>" border="0" onload='javascript:if(this.width>100)this.width=100' /><br /><span class="red">����<%=G_jifen_jifen_name%>��<%=zg_jifen%></span></td>
					<td width="63%" height="40" class="blue"><%=zg_name%></td>
				  </tr>
				  				  
				  <tr>
					<td style="line-height:25px">
					��Ʒ��飺<br />
					<%=zg_content%>
					</td>
				  </tr>
				</table>
				<%Else
					Response.End()
				%>
				<%End IF%>
				<div class="title">
					<h3 class="font-14 fl">��д������Ϣ</h3>
					<div class="hr"></div>
				</div>				
				<form method="post" action="./regok.asp" id="info" name="info" onSubmit="return checkForm_jp(this);">
				<input type="hidden" name="jid" value="<%=zid%>" />
				<input type="hidden" name="uuu" value="0" />
				<input type="hidden" name="id" value="0" id="id" />
				<input type="hidden" name="uid" value="<%=Request.Cookies(G_u_Cookies)("soojs_id")%>" id="uid" />
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<%IF p<>"" Then%>
					<tr>
						<th></th>
						<td><font color="#FF0000"><%=p%></font></td>
						<td></td>
					</tr>				
					<%End IF%>
					<tr>
						<th></th>
						<td>������<%=G_jifen_jifen_name%>��<span class="red"><%=zsoojs_jifen%></span>��  ��Ʒ����<%=G_jifen_jifen_name%>��<span class="red"><%=zg_jifen%></span>�� </td>
						<td></td>
					</tr>
					<%IF Clng(zsoojs_jifen)<Clng(zg_jifen) Then%>
					<tr>
						<th></th>
						<td class="red">С��ʾ������<%=G_jifen_jifen_name%>���㣬�޷����в���ҽ�����Ŭ��׬ȡ<%=G_jifen_jifen_name%>Ŷ</td>
						<td></td>
					</tr>	
					<tr>
						<th></th>
						<td><a href="j_glist.asp">���ؽ�Ʒ�б�</a></td>
						<td></td>
					</tr>									
					<%Else%>
					<tr>
						<th><span class="red">*</span> ��ϵ�ˣ�</th>
						<td>
							<input type="text" name="m_name" value="<%=zsoojs_uu_name%>" class="input-text" id="m_name" rel="text_flag"  tabindex="2" maxlength="10" />
						</td>
						<td><em class="form-info msg-info" id="m_name_1">2-4���ֵ�������</em></td>
					</tr>
					<tr>
						<th><span class="red">*</span> ��ϵ�绰��</th>
						<td>
							<input type="text" name="m_tel" value="<%=zsoojs_u_tel%>" class="input-text" id="m_tel" rel="text_flag"   tabindex="3" maxlength="20" />
						</td>
						<td><em class="form-info msg-info" id="m_tel_1">�̶��绰(����-����)���ֻ�</em></td>
					</tr>
					<tr>
						<th><span class="red">*</span> E-mail��</th>
						<td>
							<input type="text" name="m_email" value="<%=zsoojs_u_email%>" class="input-text" id="m_email" rel="text_flag"   tabindex="3" maxlength="11" disabled="disabled" />
						</td>
						<td><em class="form-info msg-info" id="m_email_1">��ȷ�����ַ</em></td>
					</tr>					
					<tr>
						<th><span class="red">*</span> ��ϵ��ַ��</th>
						<td>
							<input type="text" name="m_addr" value="<%=zsoojs_u_addr%>" class="input-text" id="m_addr" rel="text_flag"   tabindex="4" maxlength="250" />
						</td>
						<td><em class="form-info msg-info" id="m_addr_1">��ϸ�ʼĵ�ַ</em></td>
					</tr>
					<tr>
						<th><span class="red">*</span> ��ϵ�ʱࣺ</th>
						<td>
							<input type="text" name="m_code" value="<%=zsoojs_u_code%>" class="input-text" id="m_code" rel="text_flag"   tabindex="5" maxlength="10" />
						</td>
						<td><em class="form-info msg-info" id="m_code_1">6λ�����ʱ�</em></td>
					</tr>	
					<tr>
						<th><span class="red">*</span> ��ϵQQ��</th>
						<td>
							<input type="text" name="m_qq" value="<%=zsoojs_u_qq%>" class="input-text" id="m_qq" rel="text_flag"   tabindex="5" maxlength="11" />
						</td>
						<td><em class="form-info msg-info" id="m_qq_1">5-11λQQ</em></td>
					</tr>	
					<tr>
						<th>��ֵ�˺ţ�</th>
						<td>
							<input type="text" name="m_shouji" value="" class="input-text" id="m_shouji" rel="text_flag"   tabindex="5" maxlength="50" />
						</td>
						<td><em class="form-info msg-info" id="m_shouji_1">�����Ʒ��ֵ�˺�</em></td>
					</tr>													
                    <tr>
						<th>��ע��</th>
						<td>
                            <textarea class="input-text" name="m_content" id="m_content" style="height:80px;" tabindex="6"></textarea>
                            <p>ֻ����1000���ַ�</p>
                        </td>
						<td><em class="form-info" id="m_content_1"></em></td>
					</tr>	
					<tr>
						<th><span class="red">*</span> ��֤�룺</th>
						<td>
							<input type="text" name="soojs_code" value="" class="input-text" id="soojs_code" rel="text_flag"   tabindex="5" maxlength="4" style="width:60px" />
							<IMG id=verifypic src="Ujs/code.asp" border=0 >
							<a href="javascript:newverifypic();" title="��������ߵ��ַ�">�����壿</a>
						</td>
						<td><em class="form-info msg-info" id="soojs_code_1">����ͼ�е��ַ�,�����ִ�Сд</em></td>
					</tr>								
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="gdetail"><input type="submit" class="button btn-blue" value="ȷ�ϲ���ҽ�"  tabindex="7"/> <input type="button" class="button btn-gray" value="���ؽ�Ʒ�б�" onClick="window.location='./j_glist.asp'"  /></td>
						<td>&nbsp;</td>
					</tr>
					<%End IF%>
				</table>
				</form>				
				
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>