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
<script type="text/javascript" src="Ujs/ajaxrequest.js"></script>

<title>��վ��֤ - �û����� - <%=G_WEBNAME%></title>
</head>
<body>
<%
p=Request("p")
u1=Request("u1")
id=Request("id")
%>
<div class="wrap">  
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
		    
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">��վ��֤</h3>
					<div class="hr"></div>
				</div>
				<table cellpadding="0" cellspacing="0" border="0" class="edit-form">
					<tr>
						<th>��վ������</th>
						<td><%=u1%></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>��֤�ļ���</th>
						<td>
							<a href="./regok.asp?id=<%=id%>&action=w_add_yz" target="_blank">������֤�ļ�</a>
						</td>
						<td>&nbsp;</td>
					</tr>
                    <tr>
                        <th>��֤������</th>
                        <td>
                            <ul>
                                <li>1. ���� ��������֤�ļ��� ��ȡ��֤�ļ�</li>
                                <li>2. ����֤�ļ��ϴ�����Ҫ��֤������վ���Ŀ¼��(��֤��ɺ�����ɾ����</li>
                                <li>3. �������ʼ��֤����ť</li>
                            </ul>
                        </td>
                    </tr>
					<tr>
						<th> </th>
						<td><input type="submit" id="auth_site" class="button btn-blue" value="��ʼ��֤" onclick="c2()" /> <img id="auth_site_loading_img" src="Uimg/loading.gif" alt="��֤�С���" style="vertical-align:middle; display:none"/></td>
						<td>&nbsp;</td>
					</tr>
                    <tr>
                        <th> </th>
                        <td id="auth_msg"></td>
                        <td></td>
                    </tr>
				</table>
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>
	<!--#include file="ubottom.asp"-->
</div>
<script>
function mycallback_d2(obj) {
	document.getElementById("auth_site_loading_img").style.display="none"
	var s=obj.responseText;
	if(s=="1")
		document.getElementById("auth_msg").innerHTML='<span style="color:green;">��֤�ɹ�</span>, <a href="./w_list.asp">�����ҵ�վ��</a>'
	else
		document.getElementById("auth_msg").innerHTML='<span style="color:red;">��֤ʧ��</span>'
}
function c2(){
	setTimeout('mycallback_d2(0)',10000)
	document.getElementById("auth_site_loading_img").style.display=""
	var ajax_d2=new AJAXRequest({
	url: "Ujs/check.asp?tag=checkw_ser&u1=<%=u1%>&id=<%=sId%>",
	method: "GET",
	oncomplete: mycallback_d2,
	charset: "GB2312"
	});
	ajax_d2.get();
}
</script>
</body>
</html>