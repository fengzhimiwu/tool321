<!--#include file="../p_inc/Include_func.asp"-->
<!--#include file="../p_inc/openconn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="upublic.asp"-->


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
<title>�û����� - <%=G_WEBNAME%></title>
</head>
<body>

<div class="wrap">
	<!--#include file="head.asp"-->
	
	<div class="main-content">
		<div class="leftbar">
			<style type="text/css">
			.box-base {BORDER-RIGHT: #bbd6f1 1px solid; BORDER-TOP: #bbd6f1 1px solid; BACKGROUND: #fff; BORDER-LEFT: #bbd6f1 1px solid; BORDER-BOTTOM: #bbd6f1 1px solid; clear:both}
			.box-base .box-hd {
	PADDING-RIGHT: 5px; PADDING-LEFT: 5px; BACKGROUND: url(Uimg/n/bg_repeat.png?v=20100526) #e2f4ff repeat-x 0px -174px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; BORDER-BOTTOM: #bbd6f1 1px solid; HEIGHT: 26px
}
			.box-hd .box-t-l {
				MARGIN-TOP: 2px; FONT-SIZE: 14px; FLOAT: left
			}
			.tool-img:unknown {
				CLEAR: both; DISPLAY: block; HEIGHT: 0px; content: ' '
			}
			.tool-img {
				PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; ZOOM: 1; clear:both
			}
			.tool-img LI {
				FLOAT: left; MARGIN-BOTTOM: 8px; WIDTH: 193px; MARGIN-RIGHT: 1px; POSITION: relative
			}
			.tool-img LI A {
				BORDER-RIGHT: #fff 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #fff 1px solid; DISPLAY: block; PADDING-LEFT: 44px; PADDING-BOTTOM: 0px; BORDER-LEFT: #fff 1px solid; PADDING-TOP: 0px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 50px
			}
			.tool-img LI A:hover {
				BORDER-RIGHT: #fee69e 1px solid; BORDER-TOP: #fee69e 1px solid; BACKGROUND: url(Uimg/n/bg_repeat.png?v=20100526) repeat-x 0px -113px; BORDER-LEFT: #fee69e 1px solid; BORDER-BOTTOM: #fee69e 1px solid; cursor:pointer; text-decoration:none
			}
			.tool-img LI.hover A {
				BORDER-RIGHT: #fee69e 1px solid; BORDER-TOP: #fee69e 1px solid; BACKGROUND: url(Uimg/n/bg_repeat.png?v=20100526) repeat-x 0px -113px; BORDER-LEFT: #fee69e 1px solid; BORDER-BOTTOM: #fee69e 1px solid; cursor:pointer; text-decoration:none
			}
			.tool-img .ico {
				LEFT: 5px; BACKGROUND-IMAGE: url(Uimg/n/tools_icons.png?v=20100715); WIDTH: 32px; BACKGROUND-REPEAT: no-repeat; POSITION: absolute; TOP: 5px; HEIGHT: 32px
			}
			.tool-panel .ico {
				LEFT: 5px; BACKGROUND-IMAGE: url((Uimg/n/tools_icons.png?v=20100715); WIDTH: 32px; BACKGROUND-REPEAT: no-repeat; POSITION: absolute; TOP: 5px; HEIGHT: 32px
			}
			.tool-img .ico-sha {
				BACKGROUND-POSITION: 0px -215px; LEFT: 2px; OVERFLOW: hidden; WIDTH: 39px; POSITION: absolute; TOP: 38px; HEIGHT: 4px
			}
			.tool-img A:hover .ico-sha {
				BACKGROUND-POSITION: 0px -222px
			}
			.tool-img LI.hover A .ico-sha {
				BACKGROUND-POSITION: 0px -222px
			}
			.tool-img .tool-name {
				DISPLAY: block; FONT-WEIGHT: 700; FONT-SIZE: 12px; COLOR: #36c; PADDING-TOP: 7px; HEIGHT: 18px
			}
			.tool-img .tool-bar {
				DISPLAY: none; RIGHT: 5px; POSITION: absolute; TOP: 5px
			}
			.tool-img LI.hover .tool-bar {
				DISPLAY: block; Z-INDEX: 10
			}			
			</style>
			<%IF G_gonggao_1="1" Then%>
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl"><a href="./">��Ա�����б�</a></h3>
					<div class="hr"></div>
				</div>
				<ul class="mv15 line-24 mface">
                <%
				Set Rs = Server.CreateObject("ADODB.Recordset")
				Sql =  "SELECT * FROM qingtiandy_gonggao where id>0"
				
				Sql = Sql&" ORDER BY Id desc"
				
				Rs.Open Sql,Conn,1,1
			  
				Rs.pagesize=10
				Pgsize = Rs.pagesize
				RecordNum=Rs.RecordCount
				Pagenum=Rs.PageCount
				
				CurrentPage=Clng(Bint(Request("page")))
				if CurrentPage="" or IsNull(CurrentPage) or CurrentPage=0 or  not(IsNumeric(CurrentPage)) then
					CurrentPage=1
				End if	
				if RecordNum=-1 then
				   RecordNum=0
				End if
				
				ss=CurrentPage mod (Pgsize\4)
				If ss = 0 then ss = Pgsize\4
				If CurrentPage <= Pgsize\4 then ss = CurrentPage - 1
				iStart = CurrentPage - ss
				iEnd = CurrentPage + Pgsize\4 - ss
				If iEnd >= Pagenum then iEnd = Pagenum
				
				If CurrentPage>1 then
					Pager = Pager &  "<a href='./?page="&(CurrentPage-1)&"' class=""list"" >[��һҳ]</a> "
				Else
					Pager = Pager &  "[��һҳ] "
				End if
				For i = iStart To iEnd
					If i = clng(CurrentPage) then
						Pager = Pager &  "<font color=red >["&i&"]</font> "
					Else
						Pager = Pager &  "<a href='./?page=" & i & "' class=""list"" >["&i&"]</a> "
					End if
				Next
				If clng(Pagenum)>clng(CurrentPage) then
					Pager = Pager &  "<a href='./?page=" & (CurrentPage+1) & "' class=""list"" >[��һҳ]</a> "
				Else
					Pager = Pager &  "[��һҳ] "
				End if	
				
				PageInfo="��ǰ�ڵ� "& CurrentPage &" ҳ ���� "& Pagenum &" ��ҳ�� ���� "& RecordNum &" ����¼"
				
				NN=1
				Str="<table style=""width:600px; margin:0 auto; line-height:25px;"" border=""0"" cellspacing=""0"" cellpadding=""0"">"
				If Not Rs.Eof then
					
					Rs.AbsolutePage = CurrentPage
					
					Do While Not Rs.Eof and NN<Pgsize
						
						sID 			= Rs.Fields.Item("ID").Value
						sn_title		= Rs.Fields.Item("n_title").Value
						sn_date			= FormatDate(Rs("n_date"),5)
						sHref			= "./gg_detail.asp?id="&sID
				
					
						Str=str&"<tr><td width=""15"" height=25></td><td align='left'><a href="""&sHref&"""  target=""_self"">"&NN&". "&sn_title&"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"&sn_date&"</td></tr>"
						
						NN=NN+1
						Rs.MoveNext()
					Loop
				Else
					Str=str&"<tr><td>���޹���</td></tr>"	
				End If
				Str=Str&"</table>"
				Rs.Close: set Rs=Nothing
				Response.Write Str
			    %>		
				<%IF RecordNum>10 Then%>
				<table style="width:600px; margin:0 auto; line-height:25px;" border="0" cellspacing="0" cellpadding="0">	
				<tr height="10"><td></td></tr>
				<tr style="text-align:center; line-height:30px"><td><%=PageInfo%> <%=Pager%></td></tr>
				</table>		
				<%End IF%>	
				</ul>				
			</div>
			<div style="font-size:0px; line-height:0px; clear:both"></div>			
			<%End IF%>
			
			<div id="tool_live" class="box-base mb5">
				<div class="box-hd">
					<h3 class="box-t-l">�¹���Ӧ��</h3>
				</div>
				<div style="font-size:0px; line-height:0px; clear:both"></div>
				<ul class="tool-img">
					<li>
						<a href="./j_tikuan.asp">
							<b class="ico" style="background:url(Uimg/b/1.gif)"></b>
							<b class="ico-sha"></b>
							<span class="tool-name">֧�������<span class="ico-hot">&nbsp;</span></span>
							<span class="ext">������1Ԫ=<%=G_jifen_jifen_zhifubao_bili%><%=G_jifen_jifen_name%></span>
						</a>
					</li>
	
					<li>
						<a target="_self" href="j_getcode.asp">
							<b class="ico" style="background:url(Uimg/b/6.gif)"></b>
							<b class="ico-sha"></b>
							<span class="tool-name">�����ƹ�<span class="ico-hot">&nbsp;</span></span>
							<span class="ext">�ɻ������һ��������<%=G_jifen_jifen_name%></span>
						</a>
					</li>
					<li>
						<a  href="./p_paihang_all.asp">
							<b class="ico" style="background:url(Uimg/b/10.gif)"></b>
							<b class="ico-sha"></b>
							<span class="tool-name"><%=G_jifen_jifen_name%>������<span class="ico-hot">&nbsp;</span></span>
							<span class="ext">���¡��ܡ���������</span>
						</a>
					</li>					
																							
				</ul>
				<div style="font-size:0px; line-height:0px; clear:both"></div>
			</div>
			<div style="font-size:0px; line-height:0px; clear:both"></div>
				





		    <div class=" box-yellow p10">
			<%IF zsoojs_u_card="" Then%>
				<p>��������������<a href="./uedit.asp"><span style="color:#3366cc">���֤����</span></a>��Ϣ�����������һ�����֮�ã��������������޷��һء� </p>
			<%Else%>
				<p>С��ʿ����������һ����룬���μ���<span style="color:#3366cc">���֤����</span>��<span style="color:#3366cc">E-mail��ַ</span>��</p>			
			<%End IF%>	
			</div>
			<style type="text/css">
			<!--
			.mface{width:100px;  float:left; text-align:center}
			.mface img{ width:90px; height:90px}
			-->
			</style>			
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">��������</h3>
					<p><a href="uedit.asp">�޸�</a></p>
					<div class="hr"></div>
				</div>
				<ul class="mv15 pl-110 line-24" style="width:250px;  float:left">
					<li>UID��<%=zsoojs_id%></li>
					<li>�ǳƣ�<%=zsoojs_u%></li>
					<li>�Ա�<%
					IF zsoojs_sex="0" Then
						Response.Write "����"
					ElseIF zsoojs_sex="1" Then
						Response.Write "��"
					ElseIF zsoojs_sex="2" Then
						Response.Write "Ů"
					Else
						Response.Write "����"
					End IF
					%>
					</li>
				    <li>���գ�<%=zsoojs_u_birth%></li>
					<li>Ŀǰ��ס�أ�
					<%IF zsoojs_u_Province="2386" Then%>
					δ֪
					<%Else%>
					<script>Get_InfoWhereValue(<%=zsoojs_u_Province%>)+document.write(" ")+ Get_InfoWhereValue(<%=zsoojs_u_City%>)</script>
					<%End IF%>
					</li>
				</ul>
				<ul class="mv15 pl-110 line-24 mface">
					<a href="ueditpic.asp"><img src="<%=zsoojs_u_pic%>" alt="�޸ĸ���ͷ��"/></a><br />
					<li><a href="ueditpic.asp">�޸�ͷ��</a></li>
				</ul>				
			</div>
			<div style="font-size:0px; line-height:0px; clear:both"></div>
			<div>
				<div class="title">
					<h3>��ȫ����</h3>
					<div class="hr"></div>
				</div>
				<ul class="pl-110 mv10">
					<li><a href="./ueditpass.asp">�޸�����</a></li>
					<li><a href="./ueditemail.asp">�޸�����</a></li>
					<li><a href="./uedit.asp">�޸����֤</a></li>
					<%IF zsoojs_u_alipay="" Then%>
					<li><a href="./ueditalipay.asp"><font color="#FF0000">����֧����(���԰�<%=G_jifen_jifen_name%>�������,������<%=G_jifen_jifen_zhifubao_bili%><%=G_jifen_jifen_name%>�һ������1Ԫ)</font></a></li>
					<%Else%>
					<li><a href="./ueditalipay.asp">�޸�֧����</a></li>
					<%End IF%>
				</ul>
			</div>
			<div style="font-size:0px; line-height:0px; clear:both"></div>
			<div>
				<div class="title">
					<h3>���»</h3>
					<div class="hr"></div>
				</div>
				<ul class="pl-110 mv10">
					<li><span style="color:#FF0000; font-weight:bold">ȫ���Ƴ��󶨱�����ȡ<%=G_jifen_jifen_name%>����</span></li>
					<li><a href="./ujifeninstr.asp">�������ʹ�øù���,��ø���<%=G_jifen_jifen_name%></a></li>
				</ul>
			</div>			

		    <div class=" box-yellow p10 orange">
				<p>����ǰ��<%=G_jifen_jifen_name%>�� <span style="font-weight:bold; color:#0000FF"><%=zsoojs_jifen%></span> ��ͨ������2�ַ�ʽ���㽫�л����ȡ����<%=G_jifen_jifen_name%>��<a href="j_glist.asp">�һ�</a>�������ش�</p>				
			</div>	
			<%IF G_mingxi_look_Flag Then%>
			<div class="pv10">
				<div class="title">
					<h3 class="font-14 fl">�ҵ�<%=G_jifen_jifen_name%></h3>
					<p><a><%=G_jifen_jifen_name%>��ϸ</a></p>
					<div class="hr"></div>
				</div>
				<ul class="mv15 pl-110 line-24">
					<li class="ga"><a href="j_list.asp"><span class="red">����鿴������ϸ</span></a></li>
				</ul>
			</div>
			<%End IF%>	
							
			<div>
				<div class="title">
					<h3>��ȡ<%=G_jifen_jifen_name%></h3>
					<div class="hr"></div>
				</div>
				<ul class="pl-110 mv10">
					<li class="ga mt5">1.ÿ���½�û���̨һ�Σ�ÿ��½һ�Σ����� <span class="red"><%=G_jifen_denglu%></span> <%=G_jifen_jifen_name%>��</li>
					<li class="ga mt5">2.�Ƽ�������ѷ��ʱ�վ��ÿ�Ƽ�һ�������� <span class="red"><%=G_jifen_tuijian%></span> <%=G_jifen_jifen_name%>�� 
					<a href="j_getcode.asp"><span class="red" style="cursor:pointer">�������ȡ�ƹ�����</span></a>
					</li>
				</ul>
			</div>	
			<%IF G_xiaxian_1="1" Then%>
			<a name="tuiguang"></a>
			<div>
				<div class="title">
					<h3>�����ƹ�</h3>
					<p><a href="u_xiaxian.asp?id=<%=zsoojs_id%>">����鿴���ƹ�����</a></p>
					<div class="hr"></div>
				</div>
				<ul class="pl-110 mv10">
					<li class="ga mt5">��Ϊ��ҳ�����������������ÿ����Ϊ��ҳ���õ�<font color="#FF0000"><%=G_xiaxian_zhuye_1_bili*100%>%</font><%=G_jifen_jifen_name%>�� <a href="j_getcode2.asp"><span class="red" style="cursor:pointer">�������ȡ�ƹ�����</span></a>
					</li>	

					<%IF G_xiaxian_1_zhuye="1" And G_xiaxian_zhuye_1a="1" Then%>
					<li class="ga mt5">��Ϊ��ҳ�����������������ÿ����Ϊ��ҳ���õ�<font color="#FF0000"><%=G_xiaxian_zhuye_1_bili*100%>%</font><%=G_jifen_jifen_name%>�� <a href="j_getcode2.asp"><span class="red" style="cursor:pointer">�������ȡ�ƹ�����</span></a>
					</li>					
					<%End IF%>
					<%IF G_xiaxian_1_zhuye="1" And G_xiaxian_zhuye_2a="1" Then%>
					<li class="ga mt5">�û���½�����������������ÿ�ε�½�û��������õ�<font color="#FF0000"><%=G_xiaxian_zhuye_1_bili*100%>%</font><%=G_jifen_jifen_name%>�� <a href="j_getcode2.asp"><span class="red" style="cursor:pointer">�������ȡ�ƹ�����</span></a>
					</li>					
					<%End IF%>					
				</ul>
			</div>				
			<%End IF%>
					
	  </div>
		<!--#include file="uright.asp"-->
	</div>
	<!--#include file="ubottom.asp"-->
</div>
</body>
</html>