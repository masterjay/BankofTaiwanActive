function UploadDelChk(objckb,objhid)   //更新upload元件中刪除確認的checkbox對應的hidden值hidden default value ='no'
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
	if(aryDate.length != 3){alert('日期格式錯誤\n正確日期格式ex：2004/1/1');return false;}
	var d = new Date(aryDate[0],aryDate[1]-1,aryDate[2]);
	return d;
}

function RadioCheck(obj,msg)//判斷是否有選擇radio button
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

function isEmpty(obj,msg){     //---  是否有空值判斷 ---
	if(obj.value=='' || obj.value==null){alert(msg);obj.focus();return false;}
	else return true;
}

function isEmail(obj,msg)  //---  Email 判斷 ---
{
	if (obj.value!="" && (obj.value.indexOf("@") == "-1" || obj.value.indexOf(".") == "-1" ))
		{
			alert(msg);
			//obj.value="";
			obj.focus();return false}
	else return true;
}

function TwoValuesEmpty(obj1,obj2,msg){  //---  兩個類別都沒有選擇 ---
	if(obj1.value == "" && obj2.value == ""){alert(msg);obj1.focus();return false;}
}

function OnlyOne(obj1,obj2,msg){  //---  只能選擇一種類別 ---
	if(obj1.value !="" && obj2.value != ""){alert(msg);obj1.focus();return false;}
}

function OverWrite(obj,Num,msg){   //--- 超過字數 ---
   if (obj.value!="" && obj.value.length > Num ){alert(msg);obj.focus();return false;}
}

function lessInt(obj,num,msg){  // -- 少於數字
   if(obj.value.length < num){alert(msg);obj.focus();return false;}
}

function isTheSame(obj1,obj2,msg)
{
	if(obj1.value==obj2.value)return true;
	else {alert(msg);obj1.focus();return false;}
}

function isInt(obj,msg)   //---- 判別數字 -----
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

function isEnglish(obj,msg)  //---- 判斷英文-----
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

function isChinese(obj,msg)  //---- 判別中文字 
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

//---------------身分證字號檢查
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
	    alert('請輸入您的身份證字號!!');
	    obj.focus();
	    return false;
	}
    else if ( obj.value.length != 10)
	{
	    alert('喔！喔！身份證字號格式不對!!');
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
	        alert('喔！喔！身份證字號格式不對!!');
			obj.focus();
			return(false);
		}
	}
	cs=cs+c*1;
	if ((cs % 10) != 0) 
	{
		//alert("喔！喔！身份證字號檢查碼不對");
		obj.focus();
		return(false);	
	}
	else return true;


}
//-------------------------------------身分證字號檢查

function confirmdel(fromobj,toobj)
{
	if(fromobj.checked==true)toobj.value='yes';
	else if(fromobj.checked==false)toobj.value='no';
}