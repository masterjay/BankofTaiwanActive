<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Prize.aspx.cs" Inherits="Prize" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>臺灣銀行 網路銀行送好禮‧臺銀球星翻好運!</title>
    <style type="text/css">
    .copy {font-size: 11px;
	    line-height: 15px;
	    color: #999999;
	    font-family: "細明體";
    }
    body {
	    background-color: #191919;
    }
    </style>
    <script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
                <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="960" height="680">
                  <param name="movie" value="flash/Main.swf">
                  <param name="quality" value="high">
                  <param name="wmode" value="opaque">
                  <param name="swfversion" value="6.0.65.0">
                  <!-- 此 param 標籤會提示使用 Flash Player 6.0 r65 和更新版本的使用者下載最新版本的 Flash Player。如果您不想讓使用者看到這項提示，請將其刪除。 -->
                  <param name="expressinstall" value="Scripts/expressInstall.swf">
                  <!-- 下一個物件標籤僅供非 IE 瀏覽器使用。因此，請使用 IECC 將其自 IE 隱藏。 -->
                  <!--[if !IE]>-->
                  <object type="application/x-shockwave-flash" data="flash/Main.swf" width="960" height="680">
                    <!--<![endif]-->
                    <param name="quality" value="high">
                    <param name="wmode" value="opaque">
                    <param name="swfversion" value="6.0.65.0">
                    <param name="expressinstall" value="Scripts/expressInstall.swf">
                    <!-- 瀏覽器會為使用 Flash Player 6.0 和更早版本的使用者顯示下列替代內容。 -->
                    <div>
                      <h4>這個頁面上的內容需要較新版本的 Adobe Flash Player。</h4>
                      <p><a href="http://www.adobe.com/go/getflashplayer"><img src="https://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="取得 Adobe Flash Player" width="112" height="33" /></a></p>
                    </div>
                    <!--[if !IE]>-->
                  </object>
                  <!--<![endif]-->
                </object>


    </td>
  </tr>
  <tr>
    <td height="38" align="center" bgcolor="#000000" class="copy">請用IE 7.0以上版本及1024*768 之解析度觀看本網站<br />
      本網站為臺灣銀行版權所有，未經允許，不得以任何形式複製和使用，本活動小組感謝您的參與。</td>
  </tr>
</table>
        <script type="text/javascript">
            swfobject.registerObject("FlashID");
        </script>
    </form>
</body>
</html>
