	
	<script type="text/javascript" src="../p_inc/public.js"></script>
	<div class="head">
		<h1 class="logo fl"><a href="./"><%=G_WEBNAME%> �û�����</a></h1>
		<p class="gray text-right pv10">
			<%IF zCount_xxiao_numb>0 Then%>
			<a href="./xx_list2.asp"><img src="Uimg/xiaoxi/notice_newpm.gif" border="0" /></a>
			<%Else%>
				<%IF Instr(zsoojs_u_xiaoxi_y,"{")>0 Then%>
					<a href="./xx_list3.asp"><img src="Uimg/xiaoxi/notice_newpm.gif" border="0" /></a>
				<%End IF%>
			<%End IF%>		
			<%IF Instr(zsoojs_u_email,"qq.com")=0 Then%>
			<span class="blue"><strong><%=zsoojs_u_email%></strong></span> | 
			<%End IF%>
			<a href="../">��վ��ҳ</a> | 
			<a href="./">�ҵ��ʻ�</a>  |  
			<a href="regok.asp?action=out">�˳�</a>
		</p>
		<div class="guide">				
			<span class="head_left_1">
			<%=zsoojs_u%>���˺�<font color="#FF0000">(�ҵĻ���<%=zsoojs_jifen%>) </font>
			</span>
			<%IF G_jinbi_kaifang="1" Then%>
			<%IF Request.Cookies("soojsjj")<>"1" Then%>
			<span class="head_left_2" id="head_left_2"><a href="./regok.asp?action=ifipin"><font style='color:blue;cursor:pointer'>�󶨱���<%=G_jifen_jifen_name%></font></a></span>
			<%Else%>
			<span class="head_left_2" id="head_left_2"><font color=#009a00><%=G_jifen_jifen_name%>�Ѱ󶨱���</font></a></span>
			<%End IF%>
			<%End IF%>
		</div>
	</div>
	<script language="javascript">
	<!--	
//	//�󶨱���<%=G_jifen_jifen_name%>
//	var pif="a";
//	var soojs_jj=qTcms.Cookie.get("soojsjj");
//	if(soojs_jj==null) 
//		soojs_jj=0;
//	else
//		if(soojs_jj=="")
//			soojs_jj=0
//	//soojs_jj 0:δ��֤ 1������֤
//	
//	qTcms.Ajax("Ujs/check.asp?tag=ifip&m="+new Date().getTime(),function(d){
//		var c=d.responseText;
//			
//		if(c=="0"){
//			qTcms.Dom.get("head_left_2").innerHTML="<span onclick='cipin()' style='color:blue;cursor:pointer'>�󶨱���<%=G_jifen_jifen_name%></span>"
//		}else{
//			qTcms.Dom.get("head_left_2").innerHTML="<font color=#009a00><%=G_jifen_jifen_name%>�Ѱ󶨱���.</font>"
//		}
//	})
//	
//	function cipin(){
//		qTcms.Ajax("Ujs/check.asp?tag=ifipin&m="+new Date().getTime(),function(d){
//			var c=d.responseText;	
//			if(c=="1"){
//				alert("�󶨳ɹ�!��<%=G_WEBURL_2%>��Ϊ��ҳ,�˵���ÿ�δ�IE����,����<%=G_jifen_jifen_name%>��������")
//				qTcms.Dom.get("head_left_2").innerHTML="<font color=#009a00><%=G_jifen_jifen_name%>�Ѱ󶨱���</font>"
//			}
//		})			
//	}
	-->
	</script>	
	
