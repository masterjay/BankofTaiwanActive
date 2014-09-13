function ChangeOtherImg( obj, GraphPath )
{
    var tb = eval('document.aspnetForm.' + obj);
    
    tb.src = "/images/" + GraphPath;
}

function ChangeImg( obj, GraphPath )
{
    obj.src = GraphPath;
}

function showImg(loc)
{
	window.open(loc,'view','scrollbars=no,menubar=no');
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

function CountChars(str, fixlength, limitchars, strcountchars, strcolumns, ErrorName)
{
    var numChar=0;
    var tmp_str="";
    var err=0;
    for(var i=0; i<str.length; i++)
    {
        if(str.charCodeAt(i) > 256)
        {
            numChar += 2;
            if(numChar > fixlength) err = 1;
        }
        else
        {
            numChar ++;
            if(numChar > fixlength) err = 1;
        }
        if(!err) tmp_str += str.substr(i,1);
    }
    
    if(err)
    {
        if(fixlength == limitchars)
        {
            alert( ErrorName + "不可超過 " + fixlength/2 + " 個中文字");
            document.all[strcolumns].value = tmp_str;
        }
    }
    
    if(fixlength == limitchars)
    {
        var N = (fixlength-parseInt(numChar)<0) ? 0 : fixlength-parseInt(numChar);
        document.all[strcountchars].innerHTML=(N/2).toFixed(0);
    }
}

function ValidateBegDate(source, args)
{
   var txt,cb;
   var bol = true; 
   txt = self.aspnetForm.ctl00$ContentPlaceHolder1$cpBegDate$DateBox;
   cb = self.aspnetForm.ctl00$ContentPlaceHolder1$cbForever;

   if ( cb.checked == false && txt.value == "")
      bol = false;

    args.IsValid = bol;
}

function ValidateEndDate(source, args)
{
   var txt,cb;
   var bol = true; 
   txt = self.aspnetForm.ctl00$ContentPlaceHolder1$cpEndDate$DateBox;
   cb = self.aspnetForm.ctl00$ContentPlaceHolder1$cbForever;

   if ( cb.checked == false && txt.value == "")
      bol = false;

    args.IsValid = bol;
}