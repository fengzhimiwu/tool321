<!--#include file="Config.asp"-->
<!--#include file="upfile_class.asp"-->

<%
If request.Cookies("qt1")("admin_u")="" or request.Cookies("qt1")("admin_p")="" or request.Cookies("qt1")("admin_m")="" Then Response.End()

const upload_type=0   '�ϴ�������0=�޾�������ϴ��࣬1=FSO�ϴ� 2=lyfupload��3=aspupload��4=chinaaspupload

dim upload,file,formName,SavePath,filename,fileExt
dim upNum
dim EnableUpload
dim Forumupload
dim ranNum
dim uploadfiletype
dim msg,founderr
msg=""
founderr=false
EnableUpload=false
UpFileType=Replace(UpFileType,"|",",")
f2=request("f2")
f1=request("f1")  
img_w_o=Trim(request("w"))
Img_h_o=Trim(request("h"))
bg=Trim(request("bg"))
IF bg="" Then 
	sBg="#fff"
Else
	sBg="#"&bg
End IF
c=Request("c")
acd=Request("acd") 'ԭʼͼƬ·��
'IF Instr(acd,"/")>0 Then
'	a=Instrrev(acd,"/")
'	a1=left(acd,a-1)
'	SavePath=a1
'	osfilename=acd
'Else
'	SavePath=f1	
'End IF
SavePath=f1	
N_Fso.C_N_CreateFolders SavePath
if right(SavePath,1)<>"/" then SavePath=SavePath&"/" 
%>

<html>
<head>
<style>
td{font-size:9pt;line-height:160%}
body{font-size:9pt;line-height:160%; background:<%=sBg%>}
a:link       { color: #0033CC; text-decoration: none }
a:visited    { color: #0033CC; text-decoration: none }
a:active     { color: #FF0000; text-decoration: none }
a:hover      { color: #000000; text-decoration: underline}
</style>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body bgcolor="#FFFFFF">
<%
if lcase(EnableUploadFile)="no" then
	response.write "ϵͳδ�����ļ��ϴ�����"
else
	select case upload_type
		case 0
			call upload_0()  'ʹ�û���������ϴ���
		case else
			'response.write "��ϵͳδ���Ų������"
			'response.end
	end select
End if
%>
</body>
</html>
<%
sub upload_0()    'ʹ�û���������ϴ���
	set upload=new upfile_class ''�����ϴ�����
	upload.GetData(MaxFileSize*1024)   'ȡ���ϴ�����,��������ϴ�10M
	if upload.err > 0 then  '�������
		select case upload.err
			case 1
				response.write "����ѡ����Ҫ�ϴ����ļ���<span onclick='javascript:history.back(-1)' style='cursor:pointer'>��˷���</span>"
			case 2
				response.write "���ϴ����ļ��ܴ�С������������ƣ�<font color=red>"&MaxFileSize&"K</font>��<span onclick='javascript:history.back(-1)' style='cursor:pointer;color:blue'>��˷���</span>"
		end select
		response.end
	end if
		
	for each formName in upload.file '�г������ϴ��˵��ļ�
		EnableUpload=False
		set ofile=upload.file(formName)  '����һ���ļ�����
		oFileSize=ofile.filesize
		if oFileSize<1 then
			msg="����ѡ����Ҫ�ϴ����ļ���"
			FoundErr=True
		elseif ofilesize>(MaxFileSize*1024) then
 			msg="�ļ���С���������ƣ����ֻ���ϴ�" & CStr(MaxFileSize) & "K���ļ���"
			FoundErr=true
		end if

		fileExt=lcase(ofile.FileExt)
		arrUpFileType=split(UpFileType,",")
		for i=0 to ubound(arrUpFileType)
			if fileEXT=trim(arrUpFileType(i)) then
				EnableUpload=true
				exit for
			end if
		next
		if fileEXT="asp" or fileEXT="asa" or fileEXT="aspx" or fileEXT="cer" or fileEXT="cdx" then
			EnableUpload=false
		end if
		if EnableUpload=false then
			msg="�����ļ����Ͳ������ϴ���\n\nֻ�����ϴ��⼸���ļ����ͣ�" & UpFileType
			FoundErr=true
		end if
		
		strJS="<SCRIPT language=javascript>" & vbcrlf
		if FoundErr<>true then
			randomize
			ranNum=int(900*rnd)+100
			IF Instr(osfilename,".")>0 Then
				filename=osfilename
			ELse
				filename=SavePath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
			End IF
			ofile.SaveToFile Server.mappath(FileName)   '�����ļ�
			whichfile=server.mappath(""& fileName & "")	
			dim muma
			muma=2	
			if muma<>1 then
				Response.Write "<a href=Uploadpicture.asp?acd="&fileName&"&f2="&f2&"&f1="&f1&"&w="&img_w_o&"&h="&img_h_o&"&bg="&Bg&"&c="&c&">[�����ϴ�]</a> <a href='"&fileName&"' target=_blank>[Ԥ��]</a>"  				
				strJS=strJS & "parent.document.getElementById('"&f2&"').value='"& fileName & "';" & vbcrlf
			else
				strJS=strJS & "alert('" & msg & "');" & vbcrlf
				strJS=strJS & "history.go(-1);" & vbcrlf
			end if
			strJS=strJS & "</script>" & vbcrlf
			response.write strJS
			IF img_w_o<>"" And img_h_o<>"" Then
				IF c="1" Then
					Get_pic_cc_jpeg Clng(img_w_o),Clng(img_h_o),fileName,fileName
				Else
					'�Զ�������������ͼ
					Get_pic_small_jpeg img_w_o,img_h_o,fileName,fileName
				End IF	
			End IF
		else
          	response.Write  "<script lanuage='javascript'>alert('"&msg&"');history.go(-1);</script>"		
		end if		
		set file=nothing

	next
	set upload=nothing

end sub

Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function

Function Get_pic_small_jpeg(imgW,imgH,jpg,savejpg)	
	If Not IsObjInstalled("Persits.Jpeg") Then Exit Function
	IF Instr(jpg,"http://")>0 Then Exit Function
	Set Jpeg = Server.CreateObject("Persits.Jpeg")
	Jpeg.Open Server.MapPath(jpg)
	IF Jpeg.OriginalWidth>imgW+2 And Jpeg.OriginalHeight>imgH+2 Then
	Else
		Exit Function
	End IF
	
	w= imgW / Jpeg.OriginalWidth
	h=imgH / Jpeg.OriginalHeight
	
	if w>h then
		'�Կ�Ϊ��׼,�߶Ƚ��вü�
		mate=w
	else
		'�Ը�Ϊ��׼
		mate=h
	end if
	
	Jpeg.Width = Jpeg.OriginalWidth * mate
	Jpeg.Height = Jpeg.OriginalHeight * mate
	
	if w>h then
		ty=(Jpeg.OriginalHeight * mate-imgH)/2
		Jpeg.Crop 0, ty, imgW, imgH+ty
	else
		tx=(Jpeg.OriginalWidth  * mate-imgW)/2
		Jpeg.Crop tx, 0, imgW+tx, imgH
	end if
	Jpeg.save server.mappath(savejpg)
End Function


'������
'    s_OriginalPath:     ԭͼƬ·�� ��:images/image1.gif
'    s_BuildBasePath:    ����ͼƬ�Ļ�·��,�����Ƿ��ԡ�/����β���� ��:images��images/
'    n_MaxWidth:         ����ͼƬ�����
'                        �����ǰ̨��ʾ������ͼ�� 100*100,���� n_MaxWidth=100,n_MaxHeight=100.
'    n_MaxHeight:        ����ͼƬ���߶�
'http://hi.baidu.com/vcoso/blog/item/cbc9635caa7b5d49faf2c056.html
Function Get_pic_cc_jpeg(n_MaxWidth,n_MaxHeight,s_OriginalPath, s_BuildBasePath)
    If Not IsObjInstalled("Persits.Jpeg") Then Exit Function
	Dim AspJpeg
    Set AspJpeg = Server.Createobject("Persits.Jpeg")
    Dim s_MapOriginalPath
    s_MapOriginalPath = Server.MapPath(s_OriginalPath)
    AspJpeg.Open s_MapOriginalPath '��ԭͼƬ
    '������ȡ������ͼ��Ⱥ͸߶�
    Dim n_OriginalWidth, n_OriginalHeight 'ԭͼƬ��ȡ��߶�
    Dim n_BuildWidth, n_BuildHeight '����ͼ��ȡ��߶�
    Dim div1, div2
    Dim n1, n2
    n_OriginalWidth = AspJpeg.Width
    n_OriginalHeight = AspJpeg.Height
    div1 = n_OriginalWidth / n_OriginalHeight
    div2 = n_OriginalHeight / n_OriginalWidth
    n1 = 0
    n2 = 0
    If n_OriginalWidth > n_MaxWidth Then
        n1 = n_OriginalWidth / n_MaxWidth
    Else
        n_BuildWidth = n_OriginalWidth
    End If
    If n_OriginalHeight > n_MaxHeight Then
        n2 = n_OriginalHeight / n_MaxHeight
    Else
        n_BuildHeight = n_OriginalHeight
    End If
    If n1 <> 0 Or n2 <> 0 Then
        If n1 > n2 Then
            n_BuildWidth = n_MaxWidth
            n_BuildHeight = n_MaxWidth * div2
        Else
            n_BuildWidth = n_MaxHeight * div1
            n_BuildHeight = n_MaxHeight
        End If
    End If

    'ָ����Ⱥ͸߶�����
    AspJpeg.Width = n_BuildWidth
    AspJpeg.Height = n_BuildHeight
    
    '--������ͼ���̿�ʼ--
    Dim pos, s_OriginalFileName, s_OriginalFileExt 'λ�á�ԭ�ļ�����ԭ�ļ���չ��
    pos = InStrRev(s_OriginalPath, "/") + 1
    s_OriginalFileName = Mid(s_OriginalPath, pos)
    pos = InStrRev(s_OriginalFileName, ".")
    s_OriginalFileExt = Mid(s_OriginalFileName, pos)

    Dim s_MapBuildBasePath, s_MapBuildPath, s_BuildFileName '����ͼ����·��������ͼ�ļ���
    Dim s_EndFlag 'СͼƬ�ļ�����β��ʶ ��: �����ͼƬ�ļ����ǡ�image1.gif��,��β��ʶ�ǡ�_small��,��ôСͼƬ�ļ������ǡ�image1_small.gif��
    
    AspJpeg.Save server.MapPath(s_BuildBasePath) '����
    '--������ͼ���̽���--
    'ע��ʵ��
    Set AspJpeg = Nothing
End Function


%>