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
<title>��ȡ�ƹ���� - �û����� - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">��ȡ�ƹ����</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 red">
					��������վ����ӱ�վ���������ӻ��Զ������ӣ����ӵ�ַ��<b><%=G_WEBURL%></b> ���ֿ����Զ��塣<br />
					��վ<b><%=maxReBack%>����������</b>������Խ�࣬������ҲԽ�࣬��ҿ�����������վ����Ŀλ�÷��ϱ�վ�����Ӽ���
				</div>				
				<table width="100%" border="0" cellpadding="3" cellspacing="0" bordercolor="#C2DAEF"  >
				<tr>
				  <td><strong>�����ַ��</strong><input NAME="codetxt0" ROWS="1" size="70" value="<%=G_WEBURL%><%=IIf(G_VIRTUAL_ROOT_DIR="","",G_VIRTUAL_ROOT_DIR&"/")%>#<%=zsoojs_id%>" id="codetxt0"> <a href="javascript:copycode(document.getElementById('codetxt0').value)">����</a><br>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<font color="#666666">�������Զ�������ӵ����ֻ���ͼƬ,����DIY������ô����ô����</font>)</td>
				</tr>
				</table>
				<br />
				�����ж��ִ��빩��ѡ����������ͼƬ���ٶȣ���Ҳ���԰�ͼƬ��JS�ϴ������Ŀռ䣬˫�����ɸ���<br /><br />
				<B><font color=red>���㵯���룬����ʸߣ��ʺϸ���վ��</font></B> <a href="../qtUnion/js/1.html" target="_blank">��ʾ</a> <a href="javascript:copycode(document.getElementById('codetxt1').value)">����</a><br>
				<TEXTAREA NAME="codetxt1" ROWS="5" COLS="110" ondblclick="copycode(this.value);" id="codetxt1"><script src="<%=IIf(G_VIRTUAL_ROOT_DIR="",G_WEBURL,G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")%>qtUnion/js/1.js"></script></TEXTAREA>
				<br><br>

				<B><font color=red>�����½�Ư������(256x160)</font></B> <a href="../qtUnion/js/2.html" target="_blank">��ʾ</a> <a href="javascript:copycode(document.getElementById('codetxt2').value)">����</a><br>
				<TEXTAREA NAME="codetxt2" ROWS="5" COLS="110" ondblclick="copycode(this.value);" id="codetxt2"><script src="<%=IIf(G_VIRTUAL_ROOT_DIR="",G_WEBURL,G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")%>qtUnion/js/2.js"></script></textarea> 
				<br><br>
				
				<B><font color=red>���������Ӵ���</font></B> <a href="../qtUnion/js/3.html" target="_blank">��ʾ</a> <a href="javascript:copycode(document.getElementById('codetxt3').value)">����</a><br>
				<TEXTAREA NAME="codetxt3" ROWS="5" COLS="110" ondblclick="copycode(this.value);" id="codetxt3"><a href="<%=IIf(G_VIRTUAL_ROOT_DIR="",G_WEBURL,G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")%>#<%=zsoojs_id%>" target="_blank"><img src="<%=IIf(G_VIRTUAL_ROOT_DIR="",G_WEBURL,G_WEBURL&G_VIRTUAL_ROOT_DIR&"/")%>qtUnion/img/3.gif" alt="<%=WebName%>" border="0"></a></textarea>  
				<br><br>		
						
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>