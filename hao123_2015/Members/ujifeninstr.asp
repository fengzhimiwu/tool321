<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<%
IF G_jinbi_kaifang="2" Then
	doAlert "�Բ��𣬴˹�����δ���ţ����ȷ��ת����ҳ","../"
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
<script type="text/javascript" src="Ujs/FormCity.js"></script>
<script type="text/javascript" src="Ujs/FormScript.js"></script>
<script>
function copycode(str){
	window.clipboardData.setData("Text",str);
	alert("�����Ѿ����Ƶ������壡");
}
</script>
<title>�������ʹ�ð󶨱�����ȡ<%=G_jifen_jifen_name%>���� - �û����� - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<script type="text/javascript" src="../p_inc/public.js"></script>
	<div class="head">
		<h1 class="logo fl"><a href="./"><%=G_WEBNAME%> �û�����</a></h1>
		<p class="gray text-right pv10">
			<a href="../">��վ��ҳ</a> | 
			<a href="./">�û�����</a> | 
			<a href="./login.asp">��½</a>  |  
			<a href="./reg.asp"><font color="#FF0000">ע�����û�</font></a>
		</p>
		<div class="guide">				
			<span class="head_left_1">��Ұ󶨱�����ϸ����</span>
			<span class="head_left_2" id="head_left_2"></span>
		</div>
	</div>
	<div class="main-content">
		<div class="leftbar">
			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">��ع���˵��</h3>
					<div class="hr"></div>
				</div>
				<div class="handle p10 ga2">
					Ϊʲô��<%=G_WEBURL_2%>��ַ������Ϊ��ҳ���Ϳ���׬Ǯ��
				</div>	
				<div class="handle px10 black line20p">
					<a href="<%=G_WEBURL%>" target="_blank"><%=G_WEBURL_2%></a>��Ϊ�û��ṩ�������۵���ַ����֮�࣬��Ϊ�û��ṩ��<%=G_jifen_jifen_name%>�����������������������������£�������Ϊ������ҳ��ÿ���ҳ��ʱ�����ʻ�<%=G_jifen_jifen_name%>Ҳ��֮���ӣ����߰����Ƽ������ĺ��ѣ�Ҳ������<%=G_jifen_jifen_name%>������Щ<a href="./j_tikuan.asp"><font color="#ff0000"><%=G_jifen_jifen_name%>���Զһ��ֽ�</font></a>���ֽ𽫻�ͨ��֧����֧��������ֻ<a href="./reg.asp">��Ҫע��һ���ʺ�</a>�����ɿ�ʼ׬�֡�<span style="color:#0000ff; font-weight:bold"><%=G_WEBNAME%>�Ǿ�רҵ�ŶӴ����������ַ��������һ��������ַ������������������˵�ͬʱ���ֿɻ��ӯ����һ�����ã����ֶ���Ϊ�أ�</span>
				</div>							
				<div class="handle p10 ga2">
					<%=G_jifen_jifen_name%>���ֽ�ı����Ƕ��٣�����Ǯ�ſ�����
				</div>	
				<div class="handle px10 black line20p">
					 ������ֽ���������������׬������˵�Ǻܸߵģ�<strong><font color="#ff0000">������<%=G_jifen_jifen_zhifubao_bili%><%=G_jifen_jifen_name%>�һ������1Ԫ��1Ԫ�������</font></strong>������û�����������ơ�
				</div>		
				<div class="handle p10 ga2">
					ע���Ҫ��ô�������ҵ��ʻ��Ż�Ʒ֣�
				</div>	
				<div class="handle px10 black line20p">
					ֻ��Ҫ��¼���Ļ�Ա����һ�����Ͻǵġ��󶨱���<%=G_jifen_jifen_name%>��������ͼ��<br>
					<img border="0" src="Uimg/jifen/0.jpg"><br><br>
					�󶨳ɹ��󣬻���ʾ��ɫ�ġ�<%=G_jifen_jifen_name%>�Ѱ󶨱�����������ͼ��<br>
					<img border="0" src="Uimg/jifen/1.jpg"><br><br>
					��<%=G_jifen_jifen_name%>���Ժ�<strong><font color="#ff0000">ÿ�δ�IE����<%=G_WEBURL_2%>��ҳʱ���ͻ��Զ���<%=G_jifen_home%><%=G_jifen_jifen_name%></font></strong>��ͬһ24Сʱ���ظ��򿪵ļ�<%=G_jifen_home%><%=G_jifen_jifen_name%>������<strong><font color="#0000ff">������������������ѵĵ���������ҳ�󶨣�ÿ��ͻ����Ӳ���<%=G_jifen_jifen_name%>����ΪIEÿʱÿ�̶���Ҫ��ʹ�õġ�</font></strong>
					</p>
				</div>	
				<div class="handle p10 ga2">
					<%=G_jifen_jifen_name%>��ζһ����ֽ������
				</div>		
				<div class="handle px10 black line20p">
					��¼�����Ҳ�ġ���Ҫ������д��������ύ�����ǻ���һ��֮�������ѿ���������<br>
					<img border="0" src="Uimg/jifen/2.jpg">
				</div>	
				<div class="handle p10 ga2">
					��������׬ȡ�ң�һ���ʻ�ֻ�ܰ�һ̨������
				</div>									
				<div class="handle px10 black line20p">
					һ���ʻ����԰󶨶�̨���ԣ��������������������ѵĵ����ϵ�¼����<%=G_WEBURL_2%>��Ա�ʺţ����һ�°󶨱���<%=G_jifen_jifen_name%>������<%=G_WEBURL_2%>��Ϊ�õ��Ե���ҳ����ô�Ժ�������������ĵ��Դ�IE����<%=G_WEBURL_2%>ʱ��<%=G_jifen_jifen_name%>Ҳ����������ʻ������������������ʮ̨���ԣ���ô����<%=G_jifen_jifen_name%>������ʮ�����ٶ����������ԣ��ӿ��ȡ<%=G_jifen_jifen_name%>����÷������Ƕ��Ƽ��������Ѱ�<%=G_WEBURL_2%>��Ϊ��ҳ����Ȼ����Ҫ����̨�����ϵ�¼һ�°������ʻ�<%=G_jifen_jifen_name%>��
				</div>	
				<div class="handle p10 ga2">
					���ѽ�𣺿��Բ�������ҳ׬<%=G_jifen_jifen_name%>��
				</div>					
				<div class="handle px10 black line20p">
					�𣺿��Եġ�����˵ ��������̨���� ֮���½һ������ID ���� �󶨱���  ֮��ʹ��̨������ҳ������Ϊ <%=G_WEBURL_2%>  ֻҪ��̨���Է�����<%=G_WEBURL_2%>  ����<%=G_jifen_jifen_name%>�ͻ����ӣ������÷ǵõ�¼�ſ��Լ�¼<%=G_jifen_jifen_name%>��
					 <br>
���磺��ȥ���� ��½��ID ���˱���   ֮��ֻҪ��������̨���Դ򿪹�<%=G_WEBURL_2%>����<%=G_jifen_jifen_name%>�͵����ˣ������������ҳ������Ū����ݷ�ʽ���������ϣ���ֻҪ���˵��������ݷ�ʽ��¼<%=G_WEBURL_2%> ������<%=G_jifen_jifen_name%>Ҳ�͵����ˡ� 
				</div>											
						
			</div>
		</div>
		<!--#include file="uright.asp"-->
	</div>		
	<!--#include file="ubottom.asp"-->
</div>

</body>
</html>