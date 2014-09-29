<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PlayGame.aspx.cs" Inherits="PlayGame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>2015好預兆眾神保庇大禮到</title>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #7fd7f8;
        }
		img { margin:0; padding:0; border:0;}
		#flashContent {
        /*    width:894px;
            height:575px;*/
            min-width:894px;
            min-height:575px;
            overflow:hidden !important; 
        }

        -->
    </style>
    <script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
    <script src="JSfiles/swfobject.js" type="text/javascript"></script>
    <script src="JSfiles/detect-zoom.js" type="text/javascript"></script>
</head>
<body >
    <form id="form1" runat="server">

        <table width="894" border="0" align="center" cellpadding="0" cellspacing="0" id="___01">
            <tr>
                <td>
                    <script type="text/javascript">
                        AC_FL_RunContent('codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0', 'width', '894', 'height', '432', 'src', 'actiontop', 'quality', 'high', 'pluginspage', 'http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash', 'movie', 'flash/actiontop'); //end AC code
                    </script>
                    <noscript>
          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="894" height="432">
            <param name="movie" value="flash/actiontop.swf" />
            <param name="quality" value="high" />
            <embed src="flash/actiontop.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="894" height="432"></embed></object></noscript>
                </td>
            </tr>
            <tr>
                <td><img src="image/web02_01.jpg" width="894" height="82" /></td>
            </tr>
            <tr>
                <td align="center" style="background-color:gray;">
                    <a name="Game"></a>
                    <div id="flashContent" style="text-align:center; background-color:#82D5F7;">
                        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="100%" height="100%" id="BankofTaiwanActive" align="middle">
                            <param name="movie" value="flash/BankofTaiwanActive.swf" />
                            <param name="quality" value="high" />
                            <param name="bgcolor" value="#82D5F7" />
                            <param name="play" value="true" />
                            <param name="loop" value="true" />
                            <param name="wmode" value="opaque" />
                            <param name="scale" value="showall" />
                            <param name="menu" value="true" />
                            <param name="devicefont" value="false" />
                            <param name="salign" value="" />
                            <param name="allowScriptAccess" value="sameDomain" />
                            <!--[if !IE]>-->
                            <object type="application/x-shockwave-flash" data="flash/BankofTaiwanActive.swf" width="100%" height="100%" align="middle">
                                <param name="movie" value="flash/BankofTaiwanActive.swf" />
                                <param name="quality" value="high" />
                                <param name="bgcolor" value="#82D5F7" />
                                <param name="play" value="true" />
                                <param name="loop" value="true" />
                                <param name="wmode" value="opaque" />
                                <param name="scale" value="showall" />
                                <param name="menu" value="true" />
                                <param name="devicefont" value="false" />
                                <param name="salign" value="" />
                                <param name="allowScriptAccess" value="sameDomain" />
                                <!--<![endif]-->
                                <a href="http://www.adobe.com/go/getflash">
                                    <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
                                </a>
                                <!--[if !IE]>-->
                            </object>
                            <!--<![endif]-->
                        </object>
                    </div>
                    <!-- flash end -->
                </td>
            </tr>
        </table>
    </form>

     <!-- flash -->
            <script type="text/javascript">
                    var zoom = detectZoom.zoom();
                    var device = detectZoom.device();

                    var Sys = {};
                    var ua = navigator.userAgent.toLowerCase();
                    var s;
                    (s = ua.match(/rv:([\d.]+)\) like gecko/)) ? Sys.ie = s[1] :
                    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
                    (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
                    (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
                    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
                    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
                   

                    console.log("zoom=" + zoom);
                    console.log("device=" + device);

                    
                    
                  
                var flashvars = {};
                flashvars.host = "../Ebank_2015lucky/";
               // flashvars.host = "http://haosen.dr.com/";
                flashvars.version="0916"
                               
                if (Sys.chrome)
                 {
                      flashvars.zoom= device;
                 }
                 else
                 {
                      flashvars.zoom=  zoom;
                 }
                var params = {};
                params.allowScriptAccess = "always";
                params.allowFullScreen = "false";
                params.wmode = "opaque";
                var attributes = {};
                var version = "2014.09.15"
                swfobject.embedSWF("flash/BankofTaiwanActive.swf?" + version, "flashContent", "100%", "100%", "10.2.0", "expressInstall.swf", flashvars, params, attributes);
            </script>
            <script type="text/javascript">
                /*
                window.onresize = fnOnResize;
                function fnOnResize(event)
                {

                    var deviceZoom = detectZoom.device();
                //    alert(deviceZoom);
                        console.log(deviceZoom);
                        var flashApp = document.getElementById('flashContent');
                        console.log("get " +flashApp)
                        flashApp.fnSwfResize(deviceZoom);
                }*/

                window.onresize = function onresize() {
           //         console.log("onresize")
                    var zoom = detectZoom.zoom();
                    var device = detectZoom.device();

                    var Sys = {};
                    var ua = navigator.userAgent.toLowerCase();
                    var s;
                    (s = ua.match(/rv:([\d.]+)\) like gecko/)) ? Sys.ie = s[1] :
                    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
                    (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
                    (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
                    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
                    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
                    /*
                    if (Sys.ie) document.write('IE: ' + Sys.ie);
                    if (Sys.firefox) document.write('Firefox: ' + Sys.firefox);
                    if (Sys.chrome) document.write('Chrome: ' + Sys.chrome);
                    if (Sys.opera) document.write('Opera: ' + Sys.opera);
                    if (Sys.safari) document.write('Safari: ' + Sys.safari);*/

                    console.log("zoom=" + zoom);
                    console.log("device=" + device);

               //     console.log(zoom, device);
                    var flashApp = document.getElementById('flashContent');
                    if (Sys.chrome) {
                        flashApp.fnSwfResize(device);
                    }
                    else {
                        flashApp.fnSwfResize(zoom);
                    }
                }
            </script>
    </body>
</html>