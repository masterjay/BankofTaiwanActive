function UploadDelChk(objckb,objhid)   //��supload���󤤧R���T�{��checkbox������hidden��hidden default value ='no'
{
	if(objckb.checked==true)objhid.value='yes';
	else if(objckb.checked==false)objhid.value='no';
}

function ModifyChk(objckb,objhid,tvalue,fvalue)   
{
	if(objckb.checked==true)objhid.value=tvalue;
	else if(objckb.checked==false)objhid.value=fvalue;
}

function toDate(strDate)
{
	var aryDate = strDate.split('/');
	if(aryDate.length != 3){alert('����榡���~\n���T����榡ex�G2004/1/1');return false;}
	var d = new Date(aryDate[0],aryDate[1]-1,aryDate[2]);
	return d;
}

function RadioCheck(obj,msg)//�P�_�O�_�����radio button
{
  var vtype1 = obj.length;
  var vtype=0;
  for (var i=0;i<vtype1;i++)
     {
     if(obj[i].checked == true){
        vtype = vtype + 1;
        }
     }
  if(vtype == 0){alert(msg);obj[0].focus();return false;}
	else return true;
}

function isEmpty(obj,msg){     //---  �O�_���ŭȧP�_ ---
	if(obj.value=='' || obj.value==null){alert(msg);obj.focus();return false;}
	else return true;
}

function isEmail(obj,msg)  //---  Email �P�_ ---
{
	if (obj.value!="" && (obj.value.indexOf("@") == "-1" || obj.value.indexOf(".") == "-1" ))
		{
			alert(msg);
			//obj.value="";
			obj.focus();return false}
	else return true;
}

function TwoValuesEmpty(obj1,obj2,msg){  //---  ������O���S����� ---
	if(obj1.value == "" && obj2.value == ""){alert(msg);obj1.focus();return false;}
}

function OnlyOne(obj1,obj2,msg){  //---  �u���ܤ@�����O ---
	if(obj1.value !="" && obj2.value != ""){alert(msg);obj1.focus();return false;}
}

function OverWrite(obj,Num,msg){   //--- �W�L�r�� ---
   if (obj.value!="" && obj.value.length > Num ){alert(msg);obj.focus();return false;}
}

function lessInt(obj,num,msg){  // -- �֩�Ʀr
   if(obj.value.length < num){alert(msg);obj.focus();return false;}
}

function isTheSame(obj1,obj2,msg)
{
	if(obj1.value==obj2.value)return true;
	else {alert(msg);obj1.focus();return false;}
}

function isInt(obj,msg)   //---- �P�O�Ʀr -----
{
	var len = obj.value.length;
    var No_Number = 0;
	for( i = 0; i < len; i++ )
	{
	   strValue = obj.value;
	   intAscii = strValue.charCodeAt(i);
       if(intAscii>57 || intAscii<48)	
          {alert(msg);//obj.value='';
		  obj.focus();return false;}
   }
}

function isEnglish(obj,msg)  //---- �P�_�^��-----
{
	var index = obj.value.length;   
    countE_Ur=0;
    for( i = 0; i < index; i++ )
    {
      strValue=obj.value;
      intAscii = strValue.charCodeAt(i); 
      
      if( (intAscii>=65 && intAscii<=90) || (intAscii>=95 && intAscii<=122) )	
        countE_Ur = countE_Ur + 1
	}
	
    if( index != countE_Ur ) 
    {alert(msg);obj.focus();return false;}
}

function isChinese(obj,msg)  //---- �P�O����r 
{
	var index = obj.value.length;   
    countE_Ur=0;
    for( i = 0; i < index; i++ )
    {
      strValue=obj.value;
      intAscii = strValue.charCodeAt(i); 
      if( intAscii>=32 && intAscii<=255)	
      	{alert(msg);//obj.value='';
		obj.focus();return false;}
	}
}

function isZero(obj,msg)
{
	if(obj.value==0)
		{alert(msg);return false;}
}

//---------------�����Ҧr���ˬd
function ids() {
  this.A=1;this.B=0;this.C=9;this.D=8;this.E=7;
  this.F=6;this.G=5;this.H=4;this.J=3;this.K=2;
  this.L=2;this.M=1;this.N=0;this.P=9;this.Q=8;
  this.R=7;this.S=6;this.T=5;this.U=4;this.V=3;
  this.X=3;this.Y=2;this.W=1;this.Z=0;this.I=9;this.O=8;
}

function isNationalId(obj)
{
	var id = new ids;
	if (obj.value == '')
	{
	    alert('�п�J�z�������Ҧr��!!');
	    obj.focus();
	    return false;
	}
    else if ( obj.value.length != 10)
	{
	    alert('��I��I�����Ҧr���榡����!!');
		obj.focus();
		return false;
	}
	
	obj.value=(obj.value.charAt(0)).toUpperCase()+obj.value.substring(1,10);
	var cs=id[obj.value.charAt(0)];
	for (var i=1;i<10;i++)
	{
		var c=obj.value.charAt(i);
		cs=cs+c*(9-i);
		if (c<"0" || c>"9")
		{
	        alert('��I��I�����Ҧr���榡����!!');
			obj.focus();
			return(false);
		}
	}
	cs=cs+c*1;
	if ((cs % 10) != 0) 
	{
		//alert("��I��I�����Ҧr���ˬd�X����");
		obj.focus();
		return(false);	
	}
	else return true;


}
//-------------------------------------�����Ҧr���ˬd

function confirmdel(fromobj,toobj)
{
	if(fromobj.checked==true)toobj.value='yes';
	else if(fromobj.checked==false)toobj.value='no';
}