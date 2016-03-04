<%

'//---- COCOON_�Զ�����_��ҳ�Ż����� ----//'
Class cc_db_Pager
	'--------------------------------
	'     COCOON Db_Pager �� (Ver: 1)
	'     ����: Sunrise_Chen (sunrise_chen@msn.com)
	'     �뱣������Ϣ��лл��
	'     Thanks for eway365 from Club.PCHOME.net
	'                           2003.6
	'
	'     2003-07-05	�Դ������˽ϴ�ĸĶ���������һЩ����
	'					������DISTINCTѡ������
	'--------------------------------
	
	'//-------------------- ������� --------------------//'
	Private sTableName		'//����
	Private sSqlString		'//�Զ���Sql���
	Private aCondition()	'//��ѯ����(����)
	Private sCondition		'//��ѯ����(�ַ���)
	Private iPage			'//��ǰҳ��
	Private iPageSize		'//ÿҳ��¼��
	Private iPageCount		'//��ҳ��
	Private iRecCount		'//��ǰ��ѯ�����µļ�¼��
	Private iTotalRecCount	'//�ܼ�¼��
	Private sFields			'//������ֶ���
	Private sOrderBy		'//�����ַ���
	Private sSql			'//��ǰ�Ĳ�ѯ���
	Private sPkey			'//����
	Private oConn			'//���Ӷ���
	Private iDefPageSize	'//Ĭ��ÿҳ��ʾ�ļ�¼��
	Private sProjectName	'/��Ŀ��
	Private sVersion		'/�汾��
	Private bShowError		'//�Ƿ���ʾ������Ϣ
	Private bDistionct		'//�Ƿ���ʾΨһ��¼
	Private sPageInfo		'//��¼����ҳ�����Ϣ
	Private sPagerFuncName	'//ǰ̨��ҳ������
	Private bDistinct		'//�Ƿ�Distinct
	Private sPageParam		'//page��������
	Private iStyle			'//��ҳ����ʽ
	Private iPagerSize		'//��ҳ��ť����ֵ
	Private sReWrite		'//��ISAP REWRITE����·��
	Private iTableKind		'//������ͣ��ǲ���Ҫ [ ]
	Private ss,iStart,iEnd,PgStart
	
	'//-------------------- �¼������� --------------------//'
	'//���ʼ���¼�
	Private Sub Class_Initialize()
		ReDim aCondition(-1)
		sProjectName	= "COCOON ��ϵ�� ���ݿⷭҳ�Ż���"
		sVersion		= "1.05"
		sPkey			= "ID"
		sFields			= "*"
		sCondition		= ""
		sOrderBy		= ""
		sSqlString		= ""
		iPageSize		= 10
		iPage			= 1
		iRecCount		= Null
		iTotalRecCount	= Null
		iPageCount		= Null
		bShowError		= True
		bDistionct		= False
		sPageInfo		= "ÿҳ<font color=red>%4</font>��,��ǰ<font color=red>%1</font>/%2 ҳ ��<font color=red>%3</font> "
		sPagerFuncName	= "__cc_doPage"
		sPageParam		= "page"
		iStyle			= 0
		iPagerSize		= 10
		iTableKind		= 0
	End Sub
	
	'//������¼�
	Private Sub Class_Terminate()
		Set oConn = Nothing
	End Sub
	
	'//����Ҳû�㶮��VBSCRIPT�ﾹȻû��IIF()����������
	Private Function IIf(Expr,Val1,Val2)
		If (Expr) Then
			IIf = Val1
		Else
			IIf = Val2
		End If
	End Function
	
	'//���������Ϣ
	Public Sub doError(s)
			Dim sTmp
			sTmp = CLng(Rnd() * 100)
			Response.Write( "<DIV STYLE='WIDTH:760;font-size:9pt;cursor:hand'>" )
			Response.Write( "<LABEL ONCLICK='ERRORDIV"&sTmp&".style.display=(ERRORDIV"&sTmp&".style.display==""""?""none"":"""")'><SPAN STYLE='BACKGROUND-COLOR:#CCCC00;COLOR:WHITE;'>�� CC_db_Pager ��ʾ��Ϣ ��</SPAN><BR></LABEL>" )
			Response.Write( "<DIV ID='ERRORDIV"&sTmp&"' STYLE='DISPLAY:NONE;WIDTH:100%;BORDER: 1PX SOLID #CCCC00;PADDING:5;overflow:hidden;text-overflow:ellipsis;'><NOBR>" )
			Response.Write( "<SPAN STYLE='COLOR:RED'>Description</SPAN>: " & s & "<BR>" )
			Response.Write( "<SPAN STYLE='COLOR:RED'>Provider</SPAN>: " & sProjectName & "&nbsp;&nbsp;<SPAN STYLE='COLOR:RED'>Version</SPAN>: " & sVersion & "<BR>" )
			Response.Write( "</NOBR></DIV></DIV><BR>" )
	End Sub
	
	'//������ҳ��SQL���
	Public Function getSql()
		Dim iStart, iEnd
		Call makeCondition()
		If Not isNumeric(iPage) Then iPage = 1
		If CLng(iPage)<1 Then iPage = 1
		iStart = ( iPage - 1 ) * iPageSize
		iEnd = iStart + iPageSize
		getSql  = " SELECT " & IIf(bDistinct,"DISTINCT","") & " " & sFields & " FROM " & TableFormat(sTableName) & " " _
				& " WHERE ["&sPKey&"] IN ( " _
				& "   SELECT TOP "&iEnd&" ["&sPKey&"] FROM " & TableFormat(sTableName) & " " & sCondition & " " & sOrderBy & " " _
				& " )"
		If CLng(iPage)>1 Then
			getSql = getSql & " AND ["&sPKey&"] NOT IN ( " _
					& "   SELECT TOP "&iStart&" ["&sPKey&"] FROM " & TableFormat(sTableName) & " " & sCondition & " " & sOrderBy & " " _
					& " )"
					
		End If
		getSql = getSql & " " & sOrderBy & " "
	End Function
	
	'//���������ַ���
	Private Sub makeCondition()
		If Len(sCondition)>0 Then Exit Sub
		If UBound(aCondition)>=0 Then
			sCondition = " WHERE " & Join(aCondition, " AND ")
		End If
	End Sub
	
	'//�����¼��
	Private Sub CaculateRecCount()
		On Error Resume Next
		Dim oRs
		Call makeCondition()
		sSqlString = "SELECT COUNT(["&sPKey&"]) FROM " & TableFormat(sTableName) & "" & IIf(Len(sCondition)<1,"",sCondition)
		Set oRs = oConn.Execute( sSqlString )
		If Err Then doError Err.Description : Response.End()
		iRecCount = oRs.Fields.Item(0).Value
		Set oRs = Nothing
	End Sub
	
	'//�����ܼ�¼��
	Private Sub CaculateTotalRecCount()
		Dim oRs
		Set oRs = oConn.Execute( "SELECT COUNT(*) FROM " & TableFormat(sTableName) & "" )
		iTotalRecCount = oRs.Fields.Item(0).Value
		Set oRs = Nothing
	End Sub
	
	'//����ҳ��
	Private Sub CaculatePageCount()
		If isNull(iRecCount) Then CaculateRecCount()
		If iRecCount = 0 Then iPageCount = 0 : Exit Sub
		iPageCount = Abs( Int( 0 - (iRecCount / iPageSize) ) )
	End Sub
	
	'//����ҳ��
	Private Function setPage(n)
		iPage = n
		If Not isNumeric(iPage) Then iPage = 1
		If CLng(iPage)<1 Then iPage = 1
	End Function

	'//��������
	Public Sub AddCondition(s)
		If Len(s)<0 Then Exit Sub
		ReDim Preserve aCondition(UBound(aCondition)+1)
		aCondition(UBound(aCondition)) = s
	End Sub

	'//�汾��Ϣ
	Public Function Information()
		doError "Coding by <A HREF='MAILTO:sunrise_chen@msn.com'>Sunrise_Chen</A> @ <A HREF='http://www.ccopus.com'>http://www.ccopus.com</A> ."
	End Function
	
	Private Function ReWrite(sReWrite,iPage)
		ReWrite = Replace(sReWrite,"*",iPage)
	End Function
	
	Private Function TableFormat(s)
		Select Case iTableKind
			Case 0
				TableFormat = "[" & s & "]"
			Case 1
				TableFormat = " " & s & " "
		End Select
	End Function
	
	'//-------------------- �������� --------------------//'
	'//�������Ӷ���
	Public Property Set ActiveConnection(o)
		Set oConn = o
	End Property
	
	'//�����ַ���
	Public Property Let ConnectionString(s)
		Set oConn = Server.CreateObject("ADODB.Connection")
		oConn.ConnectionString = s
		oConn.Open()
	End Property
	
	'//�����ѯ����
	Public Property Let TableName(s)
		sTableName = s
		'//������ֱ������� ( ����ô����Ϊ���� sql �����ɵı������Ͳ�Ҫ�� [] 
		If Instr(s,"(")>0 then iTableKind = 1
	End Property
	
	'//������Ҫ������ֶ���
	Public Property Let Fields(s)
		sFields = s
	End Property
	
	'//��������
	Public Property Let Pkey(s)
		sPkey = s
	End Property
	
	'//�����������
	Public Property Let OrderBy(s)
		sOrderBy = " ORDER BY " & s & " "
	End Property
	
	'//����ÿҳ�ļ�¼���� 
	Public Property Let PageSize(s)
		iPageSize = s
		If Not isNumeric(iPageSize) Then iPageSize = iDefaultPageSize
		If CLng(iPageSize)<1 Then iPageSize = iDefaultPageSize
	End Property
	
	'//���嵱ǰҳ��
	Public Property Let Page(s)
		setPage s
	End Property
	
	'//���嵱ǰҳ��(ͬProperty Page)
	Public Property Let AbsolutePage(s)
		setPage s
	End Property
	
	'//�Զ����ѯ���
	Public Property Let Sql(s)
		sSqlString = s
	End Property
	
	'//�Ƿ�DISTINCT
	Public Property Let Distinct(b)
		bDistinct = b
	End Property
	
	Public Property Let PageParam(s)
		sPageParam = LCase(s)
	End Property
	
	Public Property Let Style(s)
		iStyle = s
	End Property
	
	Public Property Let PagerSize(s)
		iPagerSize = s
	End Property
	
	Public Property Let ReWritePath(s)
		sReWrite = s
	End Property
	
	Public Property Let TableKind(i)
		iTableKind = i
	End Property
	
	Public Property Let RecordCount(i)
		iRecCount = i
	End Property

	Public Property Let PageCount(i)
		iPageCount = i
	End Property
	
	'//-------------------- ������� --------------------//'
	'//�����ѯ����
	Public Property Get TableName()
		TableName = sTableName
	End Property
	
	'//�����Ҫ������ֶ���
	Public Property Get Fields()
		Fields = sFields
	End Property
	
	'//�������
	Public Property Get Pkey()
		Pkey = sPkey
	End Property
	
	'//����������
	Public Property Get OrderBy()
		OrderBy = sOrderBy
	End Property
	
	'//ȡ�õ�ǰ�����µļ�¼��
	Public Property Get RecordCount
		If isNull(iRecCount) Then CaculateRecCount()
		RecordCount = iRecCount
	End Property
	
	'//ȡ��ÿҳ��¼��
	Public Property Get PageSize
		PageSize = iPageSize
	End Property
	
	'//ȡ�õ�ǰ��ѯ������
	Public Property Get Condition
		If Len(sCondition)<1 Then makeCondition()
		Condition = sCondition
	End Property
	
	'//ȡ�õ�ǰҳ��
	Public Property Get Page
		Page = iPage
	End Property

	'//ȡ�õ�ǰҳ��
	Public Property Get AbsolutePage
		AbsolutePage = iPage
	End Property
	
	'//ȡ���ܵļ�¼��
	Public Property Get TotalRecordCount
		If isNull(iTotalRecCount) Then CaculateTotalRecCount()
		TotalRecordCount = iTotalRecCount
	End Property
	
	'//ȡ����ҳ��
	Public Property Get PageCount
		If isNull(iPageCount) Then CaculatePageCount()
		PageCount = iPageCount
	End Property
	
	'//�õ���ҳ��ļ�¼��
	Public Property Get Recordset
		On Error Resume Next
		sSql = getSql()
		Set Recordset = oConn.Execute( sSql )
		If Err Then
			If bShowError Then doError Err.Description
			If Len(sSqlString)>0 Then
				Set Recordset = oConn.Execute( sSqlString )
				If Err Then
					doError Err.Description
					Response.End()
				End If
			Else
				doError Err.Description
			End If
		End If
		Err.Clear()
	End Property
	
	'//�汾��Ϣ
	Public Property Get Version
		Version = sVersion
	End Property
	
	'//�����ҳ��ǰ̨�ű�
	Public Property Get PagerScript
		Dim sUrl, sQueryString, x
		sUrl = Request.ServerVariables("URL")
		sQueryString = ""
		For Each x In Request.QueryString
			If LCase(x)<>sPageParam Then sQueryString = sQueryString & x & "=" & Request.QueryString(x) & "&"
		Next
		PagerScript = vbCrLf & _
					"<S"&"CRIPT LANGUAGE=""JavaScript"" ID=""cc_script_dbPager"">" & vbCrLf & _
					"    //"&sProjectName&" (ver: "&sVersion&")" & vbCrLf & _
					"    //Coding by Sunrise_Chen (sunrise_chen@msn.com)" & vbCrLf & _
					"    function " & sPagerFuncName & "(n){" & vbCrLf & _
					"        location.href='" & sUrl & "?" & sQueryString & sPageParam &"='+n+'" & "';" & vbCrLf & _
					"    }" & vbCrLf & _
					"</S"&"CRIPT>" & vbCrLf & _
					vbCrLf
	End Property
	
	'//���ҳ�뼰��¼������Ϣ
	Public Property Get PageInfo
		CaculatePageCount()
		PageInfo = Replace(Replace(Replace(Replace(sPageInfo,"%3",iRecCount),"%2",iPageCount),"%1",iPage),"%4",iPageSize)
	End Property
	
	'//�����ҳ��ť
	Public Property Get Pager
	
		
		Pager = "" & vbCrlf
		Select Case iStyle
		Case 1
		
			If iPageCount>0 then
				PgStart=clng(iPage\10)
				Pager = Pager &  "��ǰҳΪ��<font color=red> "&iPage&"</font> ҳ �� <font color=red>"& iPageCount &"</font> ҳ �� <font color=red>"&iRecCount&"</font> ����¼��"
				If iPage mod 10 = 0 then PgStart=PgStart-1
				If iPage>10 then
					Pager = Pager &  "<a href='javascript:"&sPagerFuncName&"("&PgStart*10&");'><font face=webdings>9</font></a> "
				Else
					Pager = Pager &  "<font face=webdings color=red >9</font> "
				End if
				If iPage>1 then
					Pager = Pager &  "<a href='javascript:"&sPagerFuncName&"("&iPage-1&");'><font face=webdings>7</font></a> "
				Else
					Pager = Pager &  "<font face=webdings color=red >7</font> "
				End if
				For i=1 to 10
					If iPageCount>=i+PgStart*10 then
						if i+PgStart*10=clng(iPage) then
							Pager = Pager &  "<font color=red ><b>"&i+PgStart*10&"</b></font> "
						else
							Pager = Pager &  "<a href='javascript:"&sPagerFuncName&"("&i+PgStart*10&");'><b>"&i+PgStart*10&"</b></a> "
						end if
					End if
				Next
				If clng(iPageCount)>clng(iPage) then
					Pager = Pager &  "<a href='javascript:"&sPagerFuncName&"("&iPage+1&");'><font face=webdings>8</font></a> "
				Else
					Pager = Pager &  "<font face=webdings color=red >8</font> "
				End if
				If clng(iPageCount)>PgStart*10+10 then
					Pager = Pager &  "<a href='javascript:"&sPagerFuncName&"("&PgStart*10+11&");'><font face=webdings>:</font></a>" 
				Else
					Pager = Pager &  "<font face=webdings color=red >:</font> "
				End if
			End if
			
		Case 2
			
			sUrl = Request.ServerVariables("URL")
			sQueryString = ""
			For Each x In Request.QueryString
				If LCase(x)<>sPageParam Then sQueryString = "&" & x & "=" & Request.QueryString(x) & sQueryString 
			Next
			
			If iPageCount>0 then
				iPage = CLNG(iPage)
				ss = iPage Mod ( iPagerSize\2 )
				If ss = 0 then ss = iPagerSize\2
				If iPage <= iPagerSize\2 then ss = iPage - 1
				iStart = iPage - ss
				iEnd = Page + iPagerSize - 1 - ss
				If iEnd >= iPageCount then iEnd = iPageCount
				If iPage>1 then
					Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & "1" & sQueryString & "' >[��ҳ]</a> "
					Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & (iPage-1) & sQueryString & "' >[��һҳ]</a> "
				Else
					Pager = Pager &  "[��ҳ] "
					Pager = Pager &  "[��һҳ] "
				End if
				For i = iStart To iEnd
					If i = clng(iPage) then
						Pager = Pager &  "<font color=red >["&i+PgStart*10&"]</font> "
					Else
						Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (i+PgStart*10) & sQueryString & "' >["&i+PgStart*10&"]</a> "
					End if
				Next
				If clng(iPageCount)>clng(iPage) then
					Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (iPage+1) & sQueryString & "' >[��һҳ]</a> "
					Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (iPageCount) & sQueryString & "' >[ĩҳ]</a> "
				Else
					Pager = Pager &  "[��һҳ] "
					Pager = Pager &  "[ĩҳ] "
				End if
			End if
			
		Case 3
			
			sUrl = Request.ServerVariables("URL")
			sQueryString = ""
			For Each x In Request.QueryString
				If LCase(x)<>sPageParam Then sQueryString = "&" & x & "=" & Request.QueryString(x) & sQueryString 
			Next
			
			If iPageCount>0 then
				iPage = CLNG(iPage)
				ss = iPage Mod ( iPagerSize\2 )
				If ss = 0 then ss = iPagerSize\2
				If iPage <= iPagerSize\2 then ss = iPage - 1
				iStart = iPage - ss
				iEnd = Page + iPagerSize - 1 - ss -4
				If iEnd >= iPageCount then iEnd = iPageCount
				If iPage>1 then
					Pager = Pager &  "<a href='" & ReWrite(sReWrite,(1)) & "' >[��ҳ]</a> "
					Pager = Pager &  "<a href='" & ReWrite(sReWrite,(iPage-1)) & "' >[��һҳ]</a> "
				Else
					Pager = Pager &  "[��ҳ] "
					Pager = Pager &  "[��һҳ] "
				End if
				For i = iStart To iEnd
					If i = clng(iPage) then
						Pager = Pager &  "<font color=red >["&i+PgStart*10&"]</font> "
					Else
						Pager = Pager &  "<a href='" & ReWrite(sReWrite,(i+PgStart*10)) & "' >["&i+PgStart*10&"]</a> "
					End if
				Next
				If clng(iPageCount)>clng(iPage) then
					Pager = Pager &  "<a href='" & ReWrite(sReWrite,(iPage+1)) & "' >[��һҳ]</a> "
					Pager = Pager &  "<a href='" & ReWrite(sReWrite,(iPageCount)) & "' >[ĩҳ]</a> "
				Else
					Pager = Pager &  "[��һҳ] "
					Pager = Pager &  "[ĩҳ] "
				End if


			End if




		Case 4
			
			sUrl = Request.ServerVariables("URL")
			sQueryString = ""
			For Each x In Request.QueryString
				If LCase(x)<>sPageParam Then sQueryString = "&" & x & "=" & Request.QueryString(x) & sQueryString 
			Next
			
			If iPageCount>0 then
				iPage = CLNG(iPage)
				ss = iPage Mod ( iPagerSize\2 )
				If ss = 0 then ss = iPagerSize\2
				If iPage <= iPagerSize\2 then ss = iPage - 1
				iStart = iPage - ss
				iEnd = Page + iPagerSize - 1 - ss
				If iEnd >= iPageCount then iEnd = iPageCount
				'add by zkh
				Pager=Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=1" & sQueryString & "' >[��ҳ]</a> "

				If iPage>1 then
					Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & (iPage-1) & sQueryString & "' >[��һҳ]</a> "
				Else
					Pager = Pager &  "[��һҳ] "
				End if

				For i = iStart To iEnd
					If i = clng(iPage) then
						Pager = Pager &  "<font color=red >["&i+PgStart*10&"]</font> "
					Else
						Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (i+PgStart*10) & sQueryString & "' >["&i+PgStart*10&"]</a> "
					End if
				Next
				If clng(iPageCount)>clng(iPage) then
					Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (iPage+1) & sQueryString & "' >[��һҳ]</a> "
				Else
					Pager = Pager &  "[��һҳ] "
				End if

				'add by zkh
				Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & iPageCount & sQueryString & "' >[ĩҳ]</a> "
			End if
			
		Case 5
			
			sUrl = Request.ServerVariables("URL")
			sQueryString = ""
			For Each x In Request.QueryString
				If LCase(x)<>sPageParam Then sQueryString = "&" & x & "=" & Request.QueryString(x) & sQueryString 
			Next
			
			If iPageCount>0 then
				iPage = CLNG(iPage)
				ss = iPage Mod ( iPagerSize\5 )
				If ss = 0 then ss = iPagerSize\5
				If iPage <= iPagerSize\5 then ss = iPage - 1
				iStart = iPage - ss
				iEnd = Page + iPagerSize - 1 - ss
				If iEnd >= iPageCount then iEnd = iPageCount
				'add by zkh
				Pager=Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=1" & sQueryString & "' >[��ҳ]</a> "

				If iPage>1 then
					Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & (iPage-1) & sQueryString & "' >[��һҳ]</a> "
				Else
					Pager = Pager &  "[��һҳ] "
				End if

				For i = iStart To iEnd
					If i = clng(iPage) then
						Pager = Pager &  "<font color=red >["&i+PgStart*10&"]</font>"
					Else
						Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (i+PgStart*10) & sQueryString & "' >["&i+PgStart*10&"]</a>"
					End if
				Next
				If clng(iPageCount)>clng(iPage) then
					Pager = Pager &  "<a href='"&sUrl & "?" & sPageParam & "=" & (iPage+1) & sQueryString & "' >[��һҳ]</a> "
				Else
					Pager = Pager &  "[��һҳ] "
				End if

				'add by zkh
				Pager = Pager &  "<a href='"&sUrl & "?"  & sPageParam & "=" & iPageCount & sQueryString & "' >[ĩҳ]</a> "
				
				Pager = Pager &  "����� <input type='text' name='"& sPageParam &"' size='7' > ҳ &nbsp;&nbsp;<input type='submit' value='ȷ��'>"
			End if
			
						
		Case Else
		
			Pager  = "" &  vbCrLf _
			& "[<A "&IIf(CLng(iPage)<=1,"disabled href='javascript:void(0);'","href='javascript:"&sPagerFuncName&"(1);'")&">��ҳ</A>]" & vbCrLf _
			& "[<A "&IIf(CLng(iPage)<=1,"disabled href='javascript:void(0);'","href='javascript:"&sPagerFuncName&"("&(iPage-1)&");'")&">ǰҳ</A>]" & vbCrLf _
			& "[<A "&IIf(CLng(iPage)>=CLng(iPageCount),"disabled href='javascript:void(0);'","href='javascript:"&sPagerFuncName&"("&(iPage+1)&");'")&">��ҳ</A>]" & vbCrLf _
			& "[<A "&IIf(CLng(iPage)>=CLng(iPageCount),"disabled href='javascript:void(0);'","href='javascript:"&sPagerFuncName&"("&iPageCount&");'")&">ĩҳ</A>]"
		
		End Select
	End Property
	
	'//����������
	Public Property Get ConnectionString()
		ConnectionString = oConn.ConnectionString
	End Property

	'//������Ӷ���
	Public Property Get Conn()
		Set Conn = oConn
	End Property
	
	
End Class

Sub Eg()
	Response.Write "iPageSize = 10<br>"
	Response.Write "Dim oDbPager<br>"
	Response.Write "Set oDbPager = New cc_db_Pager<br>"
	Response.Write "Set oDbPager.ActiveConnection = Conn<br>"
	Response.Write "oDbPager.TableName = """"<br>"
	Response.Write "oDbPager.Fields = ""*""<br>"
	Response.Write "oDbPager.PKey = """"<br>"
	Response.Write "oDbPager.OrderBy = """"<br>"
	Response.Write "oDbPager.AddCondition """"<br><br>"
	Response.Write "oDbPager.PageSize = iPageSize<br>"
	Response.Write "oDbPager.Page = Request.QueryString(""page"")<br>"
	Response.Write "iCurrPage = oDbPager.Page<br>"
	Response.Write "Set Rs = oDbPager.Recordset<br>"
	Response.Write "iRecCount = oDbPager.RecordCount<br>"
	Response.Write "iPageCount = oDbPager.PageCount<br>"
	Response.Write "Do While Not Rs.Eof<br>"
	Response.Write "Rs.MoveNext<br>Loop<br>Rs.Close"
End Sub

%>