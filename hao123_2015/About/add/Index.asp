<!--#include file="../../p_inc/Include_func.asp"-->
<!--#include file="../../p_inc/openconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>��վ��¼ - <%=G_WEBNAME%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="../css/qingtian_base.css" type=text/css rel=stylesheet>
<LINK href="../css/qingtian_style.css" type=text/css rel=stylesheet>
<style>
<!--


.record
{
	width:670px;
	border:solid #ACE;
	border-width:1px 1px 0 0;
	overflow: hidden;
	float: left;
}
.record th
{
	width:120px;
	line-height:18px;
	padding:3px 8px;
	background:#FFFFFF;
	border:solid #ACE;
	border-width:0 0 1px 1px;
	font-weight:normal;
	text-align:left;
}
.record td
{
  line-height:18px;
  padding:3px 8px;
  border:solid #ACE;
  border-width:0 0 1px 1px;
}
td.bot
{
  text-align:center;
  background:#EDF6FF;
}
td.bot1
{
  background:#EDF6FF;
}
.record em
{
  margin-left:8px;
  font-style:normal;
  color:#E00;
}
.record .txt
{
  border:1px solid #ACE;
  font:12px Verdana;
  color:#07519A;
  width:180px;
  padding:2px 3px;
}
.record textarea
{
	border:1px solid #ACE;
	width:300px;
	height:60px;
	font:12px/18px Verdana;
	color:#07519A;
}
.record .btn
{
	border:1px solid #ACE;
	font:12px Verdana;
	height:22px;
	line-height:19px;
	background:#DAECFE;
	color:#07519A;
	padding-right: 5px;
	padding-left: 5px;
	margin-top: 5px;
	margin-bottom: 5px;
}

-->
</style>
</HEAD>
<BODY>
<script type="text/javascript" src="1/common.js"></script>
<DIV id=header>
	<DIV id=logo></DIV>
	<UL id=menu>
	  <LI><A href="../../">������ҳ</A> </LI>
	  <LI class=on><A href="../add">��վ��¼</A> </LI>
	  <LI><A href="../sk">��������</A> </LI>
	  <LI><A href="../about">��������</A> </LI>
	  <LI><A href="../map">��վ��ͼ</A> </LI>
	  <LI><A href="../links">��������</A> </LI>
	</UL>
</DIV>
<DIV id=box>
	<DIV id=left><IMG src="../images/img_about.jpg"> </DIV><!--left end-->
	<DIV id=right>
		<DIV class=content>
		<DIV class=title_h1><SPAN>01</SPAN> <STRONG><%=G_WEBURL_2%></STRONG>&nbsp;��վ��¼�ύ</DIV>
		  1. ����¼�з�����ɫ�顢�Ĳ��Ȳ������ݻ��ṩ�����������ӵ���վ���Լ���վ���ƻ�����Υ�������й����߷������վ��<br>
		  2. ����¼���в�����ľ��������������������˵������õ���վ�����ж������������վ��<br>
		  3. ����¼��վ���ƺ�ʵ�����ݲ�������վ�����վ���ڽ����У�����δ��ȷ�������վ���벻������������¼����ӭ���ڹ�վ������Ϻ������룻 <br>
		  4. ������Ƕ����������ҿ�����վ�㡢��ʵ�����ݣ�ֻ�ṩ����ָ�����վ����е�ҳ���ݵ���վ�� 
		  <br>
		  5. ��������վ��������ȷʵ�ж���֮������վ��������¼ <br>
		  6. ��վ������¼����Ȩ�Լ���վ�ڱ�վ��ַ���ݿ���������ݵı༭����Ȩ <br>
		<strong>�ر�ǿ����<br>1����վ����¼PRֵ���ڵ���3��Alexa����100W���ڣ�BAIDU��GOOGLE������¼�����������ݲ�ÿ�ո��£��Ҿ�����ʵ����Ϣ��ҵ��ICP/IP������Ϣ�ĸ�����վ��<br>
		2��������¼����վ�����ڹ�վ����ҳ���á�<%=G_WEBNAME%>�����������ӽ������ȿ�����¼��</strong> <br> <br>
		    <form action="../../members/shoulusave.asp" method="post" name='formAdd' onSubmit="return checkFormaddurl(this);">
			<input name="mmore" type="hidden" value="1" />
			<input name="m_turnurl" type="hidden" value="<%=Add_Root_Dir("/")%>" />		
			<table border="0" cellpadding="0" cellspacing="0" class="record">
					<td colspan="2" class="bot1">������¼<em>����ѡ���Ϊ������</em></td>
			  <tr>
				<th>��վ���ƣ�</th>
				<td>
				  <input name="m_name" type="text" class="txt" id="m_name" value="" maxlength="40"  /> <font color="#FF0000">*</font>
				</td>
			  </tr>
			  <tr>
				<th>��վ��ַ��</th>
				<td>
				  <input name="m_url" type="text" class="txt" id="m_url" value="http://" maxlength="255"/> <font color="#FF0000">*</font>
				</td>
			  </tr>
			  <tr>
				<th>��վ��飺</th>
				<td>
				  <textarea name="m_content" cols="" rows="5" id="m_content"></textarea>
          �뽫��������������200������</td>
			  </tr>
			  <tr>
				<th>��վ��������</th>
				<td>
				  <input name="ips" type="text" class="txt" id="ips" value="" maxlength="10"/>
          �ն���IP</td>
			  </tr>
			  <tr>
				<th>��վ���ࣺ</th>
				<td>
					<Select name="m_type1" onChange="Get_type1(this.value,'div_m_type2')" id="m_type1">
						<Option value="0">һ�����</Option>
					<%
						Set oRs_t=Server.CreateObject(G_RS)
						oRs_t.open "Select * from qingtiandh_type1 order by typehide asc,typeno asc,typeid asc",conn,1,1
						Do While Not oRs_t.Eof 
							kTypeid=oRs_t("typeid")
							kTypename=oRs_t("typename")
							IF Cstr(am_type1)=Cstr(kTypeid) Then
								kS1=" Selected"
							Else
								kS1=""
							End IF
							
					%>
							<Option value="<%=kTypeid%>"<%=kS1%>><%=kTypename%></Option>
					<%		
							oRs_t.MoveNext
						Loop
						oRs_t.close:Set oRs_t=Nothing
					%>
					</Select>				
		
				<span id="div_m_type2">			 
					<Select name="m_type2" id="m_type2" onChange="Get_type2(this.value,'div_m_type3')">
						<Option value="0">�������</Option>
					</Select>	
				</span>				
		
				<span id="div_m_type3">			 
				<Select name="m_type3" id="m_type3">
					<Option value="0">�������</Option>					
				</Select>	
				</span>			
					
				<font color="#FF0000">*</font>
				  
				  </td>
			  </tr>
			  <tr>
				<th>��վʱ�䣺</th>
				<td>
				  <input name="m_jtime" type="text" class="txt" id="m_jtime" value="" maxlength="20" />
				</td>
			  </tr>
			  <tr>
				<th>�� ϵ �ˣ�</th>
				<td>
				  <input name="m_contactname" type="text" class="txt" id="m_contactname" value="" maxlength="20"/>
				</td>
			  </tr>
			  <tr>
				<th>��ϵ�绰��</th>
				<td>
				  <input name="m_tel" type="text" class="txt" id="m_tel" value="" maxlength="50"/>
				</td>
			  </tr>
			  <tr>
				<th>��ϵ�ѣѣ�</th>
				<td>
				  <input name="m_qq" type="text" class="txt" id="m_qq" value="" maxlength="11"/>
				</td>
			  </tr>
			  <tr>
				<th>�������ӣ�</th>
				<td>
				  <input name="m_youqing" type="radio" value="1" />
				  ��
				  <input name="m_youqing" type="radio" value="0" checked="checked" />
				  ��<em>��ѡ,���������ӽ�������¼</em></td>
			  </tr>
			  <tr>
				<th>��֤�룺</th>
				<td>
				  <input name="authCode" type="text" class="txt" id="authCode" value="" maxlength="10"/>
				  <IMG id=verifypic src="1/code.asp" border=0 >
				  <a href="javascript:newverifypic();" title="��������ߵ��ַ�">�����壿</a>
				  </td>
			  </tr>
			  <tr>
				<td colspan="2" class="bot">
				  <input type="submit" value="�ύ����" class="btn" />
				  &nbsp;
				  <input type="button" value="������վ��ҳ" class="btn" onclick="window.location='../../'" />
				</td>
			  </tr>
			</table>
		  </form>
			<DIV class=clear></DIV></DIV>
	</DIV>
</DIV>
<DIV id=bottom >
	<P><%=G_WEBNAME%> ��Ȩ���� Copyright&copy; 2012-2015 <%=G_BEIAN%> </P>
</DIV>

</BODY></HTML>
