<!--#include file="../../p_inc/Include_func.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>�������� - <%=G_WEBNAME%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../css/qingtian_base.css" type=text/css rel=stylesheet>
<LINK href="../css/qingtian_style.css" type=text/css rel=stylesheet>
<LINK href="../css/sk.css" type=text/css rel=stylesheet>
</HEAD>
<BODY>
<DIV id=header>
	<DIV id=logo></DIV>
	<UL id=menu>
	  <LI><A href="../../">������ҳ</A> </LI>
	  <LI><A href="../add">��վ��¼</A> </LI>
	  <LI class=on><A href="../sk">��������</A> </LI>
	  <LI><A href="../about">��������</A> </LI>
	  <LI><A href="../map">��վ��ͼ</A> </LI>
	  <LI><A href="http://panxinyou.com/links">��������</A> </LI>
	</UL>
</DIV>
<script>
function subForm() {
   if(userForm.intro.value=="") {
      alert('������д���������') ;
	  userForm.intro.focus() ;
	  return false ;
   }
   if(userForm.intro.value.length>=400) {
      alert('����������������400�����ڣ�') ;
	  userForm.intro.focus() ;
	  return false ;
   }   
   document.userForm.submit();
}
</script>
<DIV id=box>
	<DIV id=left><IMG src="../images/img_about.jpg"> </DIV><!--left end-->
	<DIV id=right>
		<DIV class=content>
			<DIV class=title_h1><SPAN>02</SPAN> <STRONG><%=G_WEBURL_2%></STRONG>&nbsp;��������</DIV>
				<table width="90%" border="0" cellpadding="0" cellspacing="0" class="fk_rt">
				<form name="userForm" action="../../template/<%=G_moban%>/images/g_js/support.asp" method="post" >
				<input name="m_type" type="hidden" value="1" />
				<input name="mmore" type="hidden" value="1" />
				<input name="m_turnurl" type="hidden" value="<%=Add_Root_Dir("/About/Sk/o.asp")%>" />
				<tr>
				<td align="left" class="fk_jy"><img src="../images/support/tx.gif" width="18" height="17" /><b>��ӭ�����������·��������</b></td>
				</tr>
				<tr>
				<td align="left" class="fk_tips2"><div class="fk_tips2a">��л����֧�֣������İ����£�<%=G_WEBURL_2%> ϵ����ַ�������������ƣ��ø����������������Ȥ��<br />
				�뽫���������ֱ������ <span class="cRed">400</span> �����ڣ��������������ִ��ύ��</div></td>
				</tr>
				<tr>
				<td align="left"><label>
				<textarea name="intro" class="fk_input3"></textarea>
				</label></td>
				</tr>
				<tr>
				<td align="left"><a href="#" class="fk_anniu" onclick="subForm()">�ύ��Ϣ</a><a href="javascript:window.close()" class="fk_anniu">�رմ���</a></td>
				</tr>
				</form>
				</table>

			<DIV class=clear></DIV>
		</DIV>
	</DIV>
</DIV>
<DIV id=bottom >
	<P><%=G_WEBNAME%> ��Ȩ���� Copyright&copy; 2012-2015 <%=G_BEIAN%> </P>
</DIV>

</BODY></HTML>
