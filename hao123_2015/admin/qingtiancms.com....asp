<LINK href="css/style.css" rel=stylesheet type=text/css>
<script>
 var sett;
 var i=1;
function $(id){return document.getElementById(id)}
function scrollWindow(){this.scroll(0, 6500000);sett=setTimeout('scrollWindow()',1);}
scrollWindow();
function scrollWindow2(){
if (i%2==1)
	clearTimeout(sett)
else
	scrollWindow();
	i++;
}
document.ondblclick=scrollWindow2;
</script>
<%
Response.Buffer = True

Sub RemoveAllCache()
	Dim cachelist,i
	Call InnerHtml("UpdateInfo","<b>��ʼִ������ǰվ�㻺��</b>��")
	Cachelist=split(GetallCache(),",")	
	If UBound(cachelist)>0 Then
		For i=0 to UBound(cachelist)-1
		   DelCahe Cachelist(i)
		   Call InnerHtml("UpdateInfo","���� <b>"&cachelist(i)&"</b> ���")
		Next
		Call InnerHtml("UpdateInfo","������"& UBound(cachelist) &"���������<br>")
	Else
		Call InnerHtml("UpdateInfo","<b>��ǰվ��ȫ������������ɡ�</b>")
	End If
End Sub

Function GetallCache()
	Dim Cacheobj
	For Each Cacheobj in Application.Contents
		GetallCache = GetallCache & Cacheobj & ","
	Next
End Function

Sub DelCahe(MyCaheName)
	Application.Lock
	Application.Contents.Remove(MyCaheName)
	Application.unLock
End Sub

Sub InnerHtml(obj,msg)
	Response.Write "<li>"&msg&"</li>"
	Response.Flush
End Sub
RemoveAllCache()

%>