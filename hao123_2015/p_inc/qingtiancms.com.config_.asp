<%
'Const-----------------------------------------------
'��ȫ����������ã���0,3,4,2,0����
'���ã�����ͨ���������ݿ��SQLע��õ��˹���Ա������������Բ��ܽ���ϵͳ
'��1λ	�Ƿ����ð�ȫ���� Ϊ0ʱ������ Ϊ1ʱ����
'��2λ	ȡ��֤���еĵڼ�λ�������㣬ȡ1-4֮�������
'��3λ	ȡ��֤���еĵڼ�λ�������㣬ȡ1-4֮�������
'��4λ	��ȡ�õ���λ��֤����ʲô���㣬1Ϊ�ӷ����㣻2Ϊ�˷�����
'��5λ	���õ��Ľ�����뵽����ĵڼ�λ����
'���簲ȫ���������Ϊ1��1��3��2��5  ��Ϊ���ð�ȫ�룬����֤��ĵ�һλ�͵���λ��˵Ľ�����뵽����ĵ���λ����
'������½ʱ ��������֤��Ϊ3568 ����Ա����ΪTryLogin
'����Ӧ�����������ΪTryLo18gin
'�����������֤�����������ĸ���벻Ҫʹ�ô˹���
Const G_SAFE_PASS_SET_STR = "0,1,2,2,2"
'������̬����
'Const G_JING_TAI=true
'�Ƿ�������ҳ��̬����
'Const G_JING_TAI_PLAY=true
'�Ƿ�������ҳ��̬����
'Const G_JING_TAI_DOWN=true
'���ŵ�ַ
'���������������ʼ------------------------------------------------------------------------------------
'Scripting.FileSystemObject��
Const G_FSO = "Scripting.FileSystemObject"
'Adodb.RecordSet��
Const G_RS = "Adodb.RecordSet"
'Adodb.Connection��
Const G_CONN = "Adodb.Connection"
Const G_Comm = "cms"
Const G_Com = "com"
Dim G_XMLHTTP:G_XMLHTTP="MSXML2.XMLHTTP"
Dim Temp_G_Stream_2:Temp_G_Stream_2="stream"
Dim G_Stream:G_Stream="adodb."&Temp_G_Stream_2
'---------------------������-------------------------------------------------------------------------

'Dim-------------------------------------------------

Dim G_error_page_1
G_error_page_1=G_WEBURL&G_VIRTUAL_ROOT_DIR&""
Dim G_error_page_2
G_error_page_2=G_WEBURL&G_VIRTUAL_ROOT_DIR&"/"&G_ADMIN&"/login.asp"
Dim G_qingtiandh_m_language
G_qingtiandh_m_language=Array("����","Ӣ��")
Dim kp_1,kp_2,kp_3
kp_1=true
kp_2=false
kp_3=true
G_music_abc="0-9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,k,u,v,w,x,y,z"
G_music_abc_array=split(G_music_abc,",")
Set N_Fso=New Class_QingTian_FSO
IF G_moban_html="" Then G_moban_html="html"

G_G_H="http://load.qtcms.net/"
G_1616_sql="1"
G_gonggao_1="1"
G_xiaxian_1="1"
G_xiaxian_1_zhuye="1"
G_xiaxian_2="2"
%>