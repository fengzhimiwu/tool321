//ʡ����������
function Get_Company_where(){
	var n1,str,n2,n3
	str=""
	for(var i=0;i<G_Company_where.length;i++){
		n1=G_Company_where[i][0] //һ������
		n2=G_Company_where[i][1]
		n3=G_Company_where[i][2]
		if(n1=="0"){
			str=str+"<option value='"+n2+"'>"+n3+"</option>"
		}
	}
	document.write(str)
}
function Get_Company_where_2(value,value2,p1,p2){
	document.getElementById(p2).length=0;
	var ii,n2
	ii=0;
	document.getElementById(p2).style.display=""
	for(var i=0;i<G_Company_where.length;i++){
		n1=G_Company_where[i][0];
		n2=G_Company_where[i][1]
		n3=G_Company_where[i][2]
		if(value==n1){
			ii++;
			document.getElementById(p2).options[document.getElementById(p2).length] = new Option(n3, n2);	
			if(value2==n2)
				document.getElementById(p2)[ii-1].selected=true;
		}	
	}
	
	if(ii==0)
		document.getElementById(p2).style.display="none"
}

function Get_InfoWhereValue(v){
	for(var i=0;i<G_Company_where.length;i++){
		n1=G_Company_where[i][0] //һ������
		n2=G_Company_where[i][1]
		n3=G_Company_where[i][2]
		if(parseInt(n2)==parseInt(v)){
			str=n3;
			break;
		}
	}
	document.write(str)
}



/*ͨ�������˵�*/
function Get_$select(v,name,array){
	//��ʼֵ,select��,������
	eval("var a=Get_$a("+array+")")
	var str,c1,c2
	str='<select name="'+name+'" id="'+name+'">'
	for(i=0;i<a.length;i++){
		if(v==a[i]){
			c2=" selected"
			v=a[i]
			}
		else
			c2=""
		str=str+'<option value="'+a[i]+'" '+c2+'>'+a[i]+'</option>'			
	}
	str=str+'</select>'
	document.write(str)
}
/*ͨ�������˵�2*/
function Get_$select2(v,name,array){
	//��ʼֵ,select��,������
	eval("var a=Get_$a("+array+")")
	var str,c1,c2
	str='<select name="'+name+'" id="'+name+'">'
	for(i=0;i<a.length;i++){
		c1=a[i].split("{,}")
		if(v==c1[0]){
			c2=" selected"
			v=c1[0]
			}
		else
			c2=""
		str=str+'<option value="'+c1[0]+'" '+c2+'>'+c1[1]+'</option>'			
	}
	str=str+'</select>'
	document.write(str)
}
//ͨ��CheckBox
function Get_Company_Type(v,name,array,l){
	////��ʼֵ,CheckBox��,������,�����ʾ����
	var str=""
	var c,c1,c2,c3,c4
	c1=v;
	c2=c1.split("{,}")
	eval("var a=Get_$a("+array+")")
		for(var i=0;i<a.length;i++){
			c=a[i].split("{,}")
			for(var j=0;j<c2.length;j++){
				c3=c2[j]			
				if(c3==c[0]&&c3!=""){
					c4=" checked";
					break;
				}
				else
					c4=""
			}
			str=str+'<input name="'+name+'" value="'+c[0]+'" type="checkbox" '+c4+' onclick="return Check_box_length(\''+name+'\','+l+');" />'+c[1]
		}
	document.write(str)
}
function Check_box_length(v,len){
   var svalue="";
   var checkedbox=document.getElementsByName(v);  
   for(var i=0;i < checkedbox.length;i++){
    if (checkedbox[i].checked)
    {
	  svalue+="0";
    }
  }
  if (svalue.length > len)
  {
    alert("�Բ������ֻ��ѡ��"+len+"��");
	return false;
  }
  return svalue.length
}

function isIdCardNo(num){   
	num = num.toUpperCase();  
	//���֤����Ϊ15λ����18λ��15λʱȫΪ���֣�18λǰ17λΪ���֣����һλ��У��λ������Ϊ���ֻ��ַ�X��   
	if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num)))   
	{ 
	   alert('��������֤�ų��Ȳ��ԣ����ߺ��벻���Ϲ涨��\n15λ����ӦȫΪ���֣�18λ����ĩλ����Ϊ���ֻ�X��'); 
	  return false; 
	} 
	//У��λ����ISO 7064:1983.MOD 11-2�Ĺ涨���ɣ�X������Ϊ������10�� 
	//����ֱ�����������ں�У��λ 
	var len, re; 
	len = num.length; 
	if (len == 15){ 
		re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/); 
		var arrSplit = num.match(re); 
		//������������Ƿ���ȷ 
		var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]); 
		var bGoodDay; 
		bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
		if (!bGoodDay) { 
		  alert('��������֤����������ڲ��ԣ�');   
		  return false; 
		} 
		else{ 
			//��15λ���֤ת��18λ 
			//У��λ����ISO 7064:1983.MOD 11-2�Ĺ涨���ɣ�X������Ϊ������10�� 
          	var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
           var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
           var nTemp = 0, i;   
            num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6); 
           for(i = 0; i < 17; i ++){ 
                nTemp += num.substr(i, 1) * arrInt[i]; 
           } 
           num += arrCh[nTemp % 11];   
           return num;   
		}   
	} 
	if (len == 18){ 
		re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/); 
		var arrSplit = num.match(re); 
		
		//������������Ƿ���ȷ 
		var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]); 
		var bGoodDay; 
		bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
		if (!bGoodDay){ 
			//alert(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4])
			//alert(dtmBirth.getYear()); 
			//alert(arrSplit[2]); 
			alert('��������֤����������ڲ��ԣ�'); 
			return false; 
		} 
		else{ 
			//����18λ���֤��У�����Ƿ���ȷ�� 
			//У��λ����ISO 7064:1983.MOD 11-2�Ĺ涨���ɣ�X������Ϊ������10�� 
//			var valnum; 
//			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
//			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
//			var nTemp = 0, i; 
//			for(i = 0; i < 17; i ++){ 
//				nTemp += num.substr(i, 1) * arrInt[i]; 
//			} 
//			valnum = arrCh[nTemp % 11]; 
//			if (valnum != num.substr(17, 1)) { 
//				//alert('18λ���֤��У���벻��ȷ��Ӧ��Ϊ��' + valnum);
//				alert('18λ���֤��У���벻��ȷ');
//				return false; 
//			} 
			if($_soojs("yyyy").value!=arrSplit[2]||$_soojs("mm").value!=arrSplit[3]||$_soojs("dd").value!=arrSplit[4]){
				alert('���֤��У���������ղ���!');
				return false;									
			}
			return num; 
		} 
	} 
	return false; 
}   
function Get_InfoWhereValue(v){
	for(var i=0;i<G_Company_where.length;i++){
		n1=G_Company_where[i][0] //һ������
		n2=G_Company_where[i][1]
		n3=G_Company_where[i][2]
		if(parseInt(n2)==parseInt(v)){
			str=n3;
			break;
		}
	}
	document.write(str)
}