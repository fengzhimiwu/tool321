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
<script>
function copycode(str){
	window.clipboardData.setData("Text",str);
	alert("�����Ѿ����Ƶ������壡");
}
</script>
<title>��ȡ<%=G_jifen_jifen_name%>�ƹ���� - �û����� - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">��ȡ<%=G_jifen_jifen_name%>�ƹ����</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 red">
					1��IP��ȡ<%=G_jifen_tuijian%>��<%=G_jifen_jifen_name%>�������ظ���ȡ��<%=G_jifen_jifen_name%>���������ҽ�Ŷ~<br />
				</div>				
				<table width="100%" border="0" cellpadding="3" cellspacing="0" bordercolor="#C2DAEF"  >
				<tr>
				  <td><strong>�ƹ����ӣ�</strong><input NAME="codetxt0" ROWS="1" size="70" value="<%=G_WEBURL%><%=IIf(G_VIRTUAL_ROOT_DIR="","",G_VIRTUAL_ROOT_DIR&"/")%>?<%=zsoojs_id%>" id="codetxt0"> <a href="javascript:copycode(document.getElementById('codetxt0').value)">����</a><br>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<font color="#666666">����������ӷ����������ѣ�ͬѧ��ͬ�£����Ѱɣ�</font>)</td>
				</tr>
				</table>		
						
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>