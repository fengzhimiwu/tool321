<%
Function listPages(LinkFile) 
   if not (rs.eof and rs.bof) then
	gopage=currentpage
	totalpage=n
	blockPage=Int((gopage-1)/10)*10+1
'	if instr(linkfile,"?page=")>0 or instr(linkfile,"&page=")>0 then
'	pos=instr(linkfile,"page=")-2
'	linkfile=left(linkfile,pos)
'	end if
	
	If LCase(Request.ServerVariables("HTTPS")) = "off" Then 
    strTemp = "http://" 
    Else 
    strTemp = "https://" 
    End If 
    strTemp = strTemp & CheckStr(Request.ServerVariables("SERVER_NAME")) 
    If Request.ServerVariables("SERVER_PORT") <> 80 Then strTemp = strTemp & ":" & CheckStr(Request.ServerVariables("SERVER_PORT")) 
    strTemp = strTemp & CheckStr(Request.ServerVariables("URL"))
    lenstrTemp=len(strTemp)+1	
	if instr(left(linkfile,lenstrTemp),"?")>0 then 
	
	if blockPage = 1 Then
		Response.Write "<span disabled>����ǰ10ҳ</span>&nbsp;"
	Else
		Response.Write("<span disabled>��</span><a href=" & LinkFile & "&page="&blockPage-10&">��ǰ10ҳ</a>&nbsp;")
	End If
   i=1
   Do Until i > 10 or blockPage > n
    If blockPage=int(gopage) Then
		Response.Write("<font color=#FF0000>[<b>"&blockPage&"</b>]</font>")
	Else
		Response.Write(" <a href=" & LinkFile & "&page="&blockPage&">["&blockPage&"]</a> ")
    End If
    blockPage=blockPage+1
    i = i + 1
    Loop
	if blockPage > totalpage Then
		Response.Write "&nbsp;<span disabled>��10ҳ����"
	Else
		Response.Write("&nbsp;<a href=" & LinkFile & "&page="&blockPage&">��10ҳ��</a><span disabled>��")
	End If 
	response.write" ֱ�ӵ��� "
	response.write"<select onchange=if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;}>"
    for i=1 to totalpage
    response.write"<option value='" & LinkFile & "&page=" & i & "'"
    if i=gopage then response.write"selected"
    response.write">"&i&"</option>"
    next
    response.write"</select>"
    response.write" ҳ<Br><Br>"
	
	else
	
	if blockPage = 1 Then
		Response.Write "<span disabled>����ǰ10ҳ</span>&nbsp;"
	Else
		Response.Write("<span disabled>��</span><a href=" & LinkFile & "?page="&blockPage-10&">��ǰ10ҳ</a>&nbsp;")
	End If
   i=1
   Do Until i > 10 or blockPage > n
    If blockPage=int(gopage) Then
		Response.Write("<font color=#FF0000>[<b>"&blockPage&"</b>]</font>")
	Else
		Response.Write(" <a href=" & LinkFile & "?page="&blockPage&">["&blockPage&"]</a> ")
    End If
    blockPage=blockPage+1
    i = i + 1
    Loop
	if blockPage > totalpage Then
		Response.Write "&nbsp;<span disabled>��10ҳ����"
	Else
		Response.Write("&nbsp;<a href=" & LinkFile & "?page="&blockPage&">��10ҳ��</a><span disabled>��")
	End If 
	response.write" ֱ�ӵ��� "
	response.write"<select onchange=if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;}>"
    for i=1 to totalpage
    response.write"<option value='" & LinkFile & "?page=" & i & "'"
    if i=gopage then response.write"selected"
    response.write">"&i&"</option>"
    next
    response.write"</select>"
    response.write" ҳ<Br><Br>"
	
	End If
	
	Startinfo=((gopage-1)*msg_per_page)+1
	Endinfo=gopage*msg_per_page
	if Endinfo>totalrec then Endinfo=totalrec
		Response.Write("&nbsp;&nbsp;�� "&totalrec&" ����Ϣ ��ǰ��ʾ�� "&Startinfo&" - "&Endinfo&" �� ÿҳ "&msg_per_page&" ����Ϣ �� "&n&" ҳ")
end if
End Function


%>






<%
rs.pagesize=msg_per_page '�����ҳ��¼��ÿҳ��ʾ��¼��

if not (rs.eof and rs.bof) then
	totalrec=RS.RecordCount'�ܼ�¼����
	if rs.recordcount mod msg_per_page=0 then'������ҳ��,recordcount:���ݵ��ܼ�¼��
		n=rs.recordcount\msg_per_page'n:��ҳ��
	else
		n=rs.recordcount\msg_per_page+1                        
	end if                                                                
	currentpage=request("page")'currentpage:��ǰҳ
	If currentpage <> "" then
		currentpage =  cint(currentpage)
		if currentpage < 1 then  
			currentpage = 1
		end if  
		if err.number <> 0 then '������
			err.clear
			currentpage=1
		end if
	else
		currentpage=1
	End if                                                                
	if currentpage*msg_per_page > totalrec and not((currentpage-1)*msg_per_page < totalrec)then 
		currentPage=1
	end if
	rs.absolutepage=currentpage'absolutepage������ָ��ָ��ĳҳ��ͷ
	rowcount=rs.pagesize'pagesize������ÿһҳ�����ݼ�¼��
end if
%>