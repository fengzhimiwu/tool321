		<style type="text/css">
		.explain-btn {
			border-bottom: 1px dotted black;
			font-size: 11px;
			font-weight:normal;
			cursor: pointer;
		}
		.explain-content {
			position: absolute;
			z-index: 100;
			padding: 5px;
			border: 1px solid #AAA;
			background-color: #FFFFDC;
			font-size: 13px;
			font-weight: normal;
			width: 220px;
			text-indent: 2em;
			top: 25px;
			display:none;
		}
		.explain-content .close-btn {
			float: right;
			color: blue;
			cursor: pointer;
			font-size: 12px;
		}
		
		.task-btn {
			border-bottom: 1px dotted black;
			font-size: 11px;
			font-weight:normal;
			cursor: pointer;
		}
		.task-content {
			position: absolute;
			z-index: 100;
			padding: 10px;
			border: 1px solid #AAA;
			background-color: #FFFFDC;
			font-size: 13px;
			font-weight: normal;
			width: 160px;
			left: 78px;
			top: 0px;
			display:none;
		}
		.task-content .close-btn {
			float: right;
			color: blue;
			cursor: pointer;
			font-size: 12px;
		}
				
		.li_new{ background:url(Uimg/new.gif) 50px no-repeat;}
		</style>
		<script type="text/javascript" src="Ujs/jquery.js"></script>
        <div class="rightbar">
			<div class="box-gray p10">	
				<%IF G_xxiaoxi_1="1" Then
					ppkstr=""
					IF zCount_xxiao_numb>0 Then 
						ppkstr="<a href=""./xx_list2.asp""><font color=red>"&zCount_xxiao_numb&"��δ����Ϣ</font></a>"
					Else
						IF Instr(zsoojs_u_xiaoxi_y,"{")>0 Then
							ppkstr="<a href=""./xx_list3.asp""><font color=red>����δ����Ϣ</font></a>"
						Else
							ppkstr="<a href=""./xx_list2.asp"">�յ�����Ϣ</a>"
						End IF
					End IF
					Response.Write Replace(qtcmsdh.qTcmsConstStr("31","",G_xxiaoxi_1),"{#1}",ppkstr)
				End IF%>	
				<h4 class="font-14">�ղط���</h4>
				<ul class="p10">
                <li><a href="./c_t_add.asp">����·���</a></li>
				<li><a href="./c_t_list.asp">�ҵķ����б�</a></li>
                </ul>
				<h4 class="font-14">�ղ��б�</h4>
				<ul class="p10">
                <li><a href="./c_l_add.asp">������ղ�</a></li>
				<li><a href="./c_l_list.asp">�ҵ��ղ��б�</a></li>
                </ul>
				<h4 class="font-14">�ҵ�<%=G_jifen_jifen_name%></h4>
				<ul class="p10">
				<%IF Request.Cookies(Sky_Admin_Cookies_1)("admin_u")<>"" Then%>
                <li><a href="./j_list.asp"><%=G_jifen_jifen_name%>��ϸ</a></li>
				<%End IF%>
				<li><a href="./j_getcode.asp">��ȡ<%=G_jifen_jifen_name%>�ƹ����</a></li>
				<li><a href="./j_glist.asp"><%=G_jifen_jifen_name%>�һ���Ʒ</a></li>
				<li><a href="./j_glist_list.asp"><%=G_jifen_jifen_name%>�һ���Ʒ��ϸ</a></li>
                </ul>	

				
				
			
				<h4 class="font-14">֧�������</h4>
				<ul class="p10">	
				<li class="li_new"><a href="./j_tikuan.asp"><font color="#FF0000">��Ҫ���</font></a></li>
				<li><a href="./j_list_1.asp">�����ϸ</a></li>
				<li><a href="./ueditalipay.asp">֧�����޸�</a></li>
				</ul>	


				<hr />				
                <h4 class="font-14" style="position:relative;">վ������ &nbsp; <span class="explain-btn" onclick="$(this).next().slideToggle()">ʲô��վ�����ܣ�</span><div class="explain-content">վ��������Ҫվ��ͨ�������֤��������֤���ɿ�ͨ��ͨ����֤��վ������Ϊ�Լ����������뿪ͨ ���� Ϊվ���û��ṩ����վ������չ�����磺�����������ܣ������Լ�����վ���������������<br/><span class="close-btn" onclick="$(this).parent().slideUp();">�ر�</span></div></h4>
                <ul class="p10">
					<%IF zsoojs_u_Webf="0" Then%>
					<li><a href="./webAdd.asp">��ͨվ������</a></li>	
					<%Else%>
                    <li><a href="./w_add.asp">�����վ</a></li>
                    <li><a href="./w_list.asp">�ҵ���վ</a></li>
					<li><a href="./w_getcode.asp">��ȡ�ƹ����</a></li>
                    <li><a href="./webadd.asp">�޸�վ������</a></li>					
					<%End IF%>
                </ul>
			</div>
		</div>