<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="upublic.asp"-->
<!--#include file="function_u.asp"-->
<%
sId = Bint(Request.QueryString("id"))
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
<script type="text/javascript" src="Ujs/WaddcheckUser.js"></script>
<script type="text/javascript" src="Ujs/FormCity.js"></script>
<script type="text/javascript" src="Ujs/FormScript.js"></script>
<title>�����վ - �û����� - <%=G_WEBNAME%></title>
</head>
<body>
<%
p=Request("p")

%>
<div class="wrap">
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


		  <DIV id=msg_url_checking><SPAN class=item_desc>���ڼ�������Ƿ����Ժ򡭡�</SPAN></DIV>
		  <DIV id=msg_url_ok><SPAN class=item_green>��վ�������ã��������</SPAN></DIV>
		  <DIV id=msg_url_blank>��������վ����</DIV>
		  <DIV id=msg_url_format>��վ������ʽ����</DIV>
		  <DIV id=msg_url_exists>�������Ѵ��ڣ�����һ��</DIV>


		  <DIV id=msg_n_blank>����д��վ����</DIV>
		  <DIV id=msg_n_length>2-40���ַ����ڵ�����</DIV>
		  <DIV id=msg_n_ok><SPAN class=item_green>�ɹ�</SPAN></DIV>

		  <DIV id=msg_ty1_blank>��ѡ�����</DIV>
		  <DIV id=msg_ty1_ok><SPAN class=item_green>�ɹ�</SPAN></DIV>
		  
	  </DIV>
	  
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">�����վ</h3>
					<div class="hr"></div>
				</div>
				<form method="post" action="./regok.asp" id="info" name="info" onSubmit="return checkForm(this);">
				<input type="hidden" name="uuu" value="0" />
				<input type="hidden" name="id" value="0" id="id" />
				<input type="hidden" name="uid" value="<%=Request.Cookies(G_u_Cookies)("soojs_id")%>" />
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<%IF p<>"" Then%>
					<tr>
						<th></th>
						<td><font color="#FF0000"><%=p%></font></td>
						<td></td>
					</tr>				
					<%End IF%>
					<tr>
						<th><span class="red">*</span> ��վ������</th>
						<td>http:// <input type="text" name="w_url" value="" class="input-text" style="width: 200px;"  id="w_url"  rel="text_flag"  onchange=checkOnChange(this); tabindex="1" maxlength="250" />
                         </td>
						<td><em class="form-info msg-info" id="w_url_1">������http://����ַ</em></td>
					</tr>
					<tr>
						<th><span class="red">*</span> ��վ���ƣ�</th>
						<td>
							<input type="text" name="w_name" value="" class="input-text" id="w_name" rel="text_flag"  onchange=checkOnChange(this); tabindex="2" maxlength="40" />
						</td>
						<td><em class="form-info msg-info" id="w_name_1">40���ַ����ڵ�����</em></td>
					</tr>

					<tr>
						<th> ��վ���</th>
						<td>
							<select name="w_type1" id="w_type1" tabindex="3">
								<%
								For ii=0 To Ubound(G_u_w_type1)
									t1=G_u_w_type1(ii)
									t1_a=split(t1,"|")
									p1=t1_a(0) 'ID
									p2=t1_a(1) 'name
									Response.Write "<option value='"&p1&"'>"&p2&"</option>"&vbcrlf
								Next
								%>
                          	</select>
						</td>
						<td><em class="form-info" id="w_type1_1"></em></td>
					</tr>
                    <tr>
						<th> ��վ��������</th>
						<td>
							<select name="w_number"  id="w_number" tabindex="4">
								<%
								For ii=0 To Ubound(G_u_w_number)
									t1=G_u_w_number(ii)
									t1_a=split(t1,"|")
									p1=t1_a(0) 'ID
									p2=t1_a(1) 'name
									Response.Write "<option value='"&p1&"'>"&p2&"</option>"&vbcrlf
								Next
								%>
                          	</select>
						</td>
						<td><em class="form-info" id="pv_grade-msg"></em></td>
					</tr>
                    <tr>
						<th>��վ������</th>
						<td>
                            <textarea class="input-text" name="w_content" id="w_content" style="height:80px;" tabindex="5"></textarea>
                            <p>ֻ����110���ַ�</p>
                        </td>
						<td><em class="form-info" id="w_content_1"></em></td>
					</tr>
                    <tr>
						<th>������Ϣ��</th>
						<td><input type="text" name="w_beian" class="input-text" id="w_beian" maxlength="30" tabindex="6" /></td>
						<td><em class="form-info" id="w_beian_1"></em></td>
					</tr>
					<tr>
						<th> </th>
						<td><input type="hidden" name="action" value="w_a"><input type="submit" class="button btn-blue" value="�ύ����"  tabindex="7" id="submit_f"/> <input type="button" class="button btn-gray" value="����" onClick="window.location='./w_list.asp'"  /></td>
						<td>&nbsp;</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>
	<!--#include file="ubottom.asp"-->
</div>
<SCRIPT language="VBSCRIPT" RUNAT="SERVER">
	Function ShowInfo(sId)
		WriteLn("<S"&"CRIPT LANGUAGE=JAVASCRIPT>")
		WriteLn("	var oForm = info;")
		WriteLn("	with(oForm){")
		Set rsObj = Conn.Execute( "SELECT * FROM qingtiandy_url WHERE Id=" & sId )
		If not rsObj.Eof Then 
			WriteLn("		id.value='" & Str4Js(sId) & "';")
			WriteLn("		uid.value='" & Str4Js(rsObj.Fields.Item("w_uid").Value) & "';")
			WriteLn("		w_url.value='" & Str4Js(rsObj.Fields.Item("w_url").Value) & "';")
			WriteLn("		w_name.value='" & Str4Js(rsObj.Fields.Item("w_name").Value) & "';")
			WriteLn("		w_type1.value='" & Str4Js(rsObj.Fields.Item("w_type1").Value) & "';")
			WriteLn("		w_number.value='" & Str4Js(rsObj.Fields.Item("w_number").Value) & "';")
			WriteLn("		w_content.value='" & Str4Js(HTMLDecodeTextArea(HTMLDecode(rsObj.Fields.Item("w_content").Value))) & "';")
			WriteLn("		w_beian.value='" & Str4Js(rsObj.Fields.Item("w_beian").Value) & "';")
			WriteLn("		submit_f.value='�ύ�޸�';")
			ow_status=		Str4Js(rsObj.Fields.Item("w_status").Value)
			IF ow_status="1" Then
				WriteLn("		uuu.value='1';")
				WriteLn("		w_url.disabled=true;")
			End IF
		End If
		WriteLn("	}")
		WriteLn("</S"&"CRIPT>")
	End Function
</SCRIPT>
<%
	If CLng(sId)>0 Then
		ShowInfo sId
	End If
%>
</body>
</html>