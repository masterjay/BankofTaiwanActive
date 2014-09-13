<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>臺灣銀行 網路銀行送好禮‧臺銀球星翻好運!</title>
    <style type="text/css">
    .copy {font-size: 11px;
	    line-height: 15px;
	    color: #FFFEEA;
	    font-family: "細明體";
    }
    .search-1 {	font-family: "細明體";
	    font-size: 13px;
	    color: #333;
    }
    body {
	    background-color: #191919;
	    margin-left: 0px;
	    margin-top: 0px;
	    margin-right: 0px;
	    margin-bottom: 0px;
    }
.search-2 {	font-family: "微軟正黑體";
	font-size: 14px;
	color: #C00;
}
.search-31 {
	font-family: "微軟正黑體";
	font-size: 13px;
	color: #666;
}
.search-4 {	font-size: 16px;
	color: #FFF;
	font-family: "微軟正黑體";
}
.search-5 {	font-size: 16px;
	color: #900;
	font-family: "微軟正黑體";
}
.search-6 {	font-size: 13px;
	color: #069;
}

.search-7 {	font-family: "微軟正黑體";
	font-size: 16px;
	color: #069;
}

.search-8 {	font-family: "微軟正黑體";
	font-size: 15px;
	color: #333;
}
    </style>
    <script type="text/javascript" src="JSfiles/Default.js"></script>
    <script language="JavaScript" type="text/javascript">
    <!--
    function stu_id_check(source, args) //身分證字號驗正副程序
    {
        //var tid = args.Value.toUpperCase();
        var txt = document.getElementById('<%=this.txtID.ClientID%>');
        var tid = txt.value.toUpperCase();
        
        if (tid.length != 10) { args.IsValid = false; return; }
        else
        {
            var ch = tid.charAt(0);
            var ch2 = tid.charAt(1);

            if (ch2 < 'A' || ch2 > 'Z')    /* 以下本國ID */ {
                if (ch < 'A' || ch > 'Z') { args.IsValid = false; return; }
                if (tid.charAt(1) < '1' || tid.charAt(1) > '2') { args.IsValid = false; return; }
                for (var i = 2; i <= 9; i++) {
                    if (tid.charAt(i) < '0' || tid.charAt(i) > '9') { args.IsValid = false; return; }
                }

                var chksum = 0;
                var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                var chv = alphabet.indexOf(ch) + 65;
                if (ch >= 'A' && ch <= 'H') {
                    chksum = Math.floor((chv - 55) / 10) + ((chv - 55) % 10) * 9;
                }
                else if (ch >= 'J' && ch <= 'N') {
                    chksum = Math.floor((chv - 56) / 10) + ((chv - 56) % 10) * 9;
                }
                else if (ch >= 'P' && ch <= 'V') {
                    chksum = Math.floor((chv - 57) / 10) + ((chv - 57) % 10) * 9;
                }
                else switch (ch) {
                    case 'X': chksum = 3; break; case 'Y': chksum = 12; break;
                    case 'W': chksum = 21; break; case 'Z': chksum = 30; break;
                    case 'I': chksum = 39; break; case 'O': chksum = 48; break;
                }
                var ArabicNumber = "0123456789";
                for (i = 1; i <= 8; i++) {
                    chksum += ArabicNumber.indexOf(tid.charAt(i)) * (9 - i);
                }
                chksum += ArabicNumber.indexOf(tid.charAt(9));
                if (chksum % 10 == 0) { args.IsValid = true; }
                else { args.IsValid = false; return; }
            }
            else {
                if (!/^[a-zA-Z]{1}[a-dA-D1-2]{1}[0-9]{8}$/.test(tid)) {
                    args.IsValid = false; return;
                }
                else {
                    var id_ = tid.toUpperCase();
                    var sum = 0;
                    var str1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                    var str2 = "1011121314151617341819202122352324252627282932303133";
                    var t1 = str2.substr(str1.indexOf(id_.substr(0, 1)) * 2, 2);
                    var t2 = str2.substr(str1.indexOf(id_.substr(1, 1)) * 2, 2);
                    sum = t1.substr(0, 1) * 1 + t1.substr(1, 1) * 9;
                    sum += (t2 % 10) * 8;
                    var t10 = id_.substr(9, 1);

                    for (t_i = 3; t_i <= 9; t_i++) {
                        sum += id_.substr(t_i - 1, 1) * (10 - t_i);
                    }

                    (sum % 10 == 0) ? t10_ = 0 : t10_ = 10 - (sum % 10);

                    if (t10_ == t10) {
                        args.IsValid = true;
                    }
                    else {
                        args.IsValid = false; return;
                    }
                }
            }
        }


        /*
            if (tid.length != 10) { args.IsValid = false; return; }
            var ch = tid.charAt(0);
            if (ch < 'A' || ch > 'Z') { args.IsValid = false; return; }
            if (tid.charAt(1) < '1' || tid.charAt(1) > '2') { args.IsValid = false; return; }
            for (var i = 2; i <= 9; i++) {
                if (tid.charAt(i) < '0' || tid.charAt(i) > '9') { args.IsValid = false; return; }
            }

            var chksum = 0;
            var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            var chv = alphabet.indexOf(ch) + 65;
            if (ch >= 'A' && ch <= 'H') {
                chksum = Math.floor((chv - 55) / 10) + ((chv - 55) % 10) * 9;
            }
            else if (ch >= 'J' && ch <= 'N') {
                chksum = Math.floor((chv - 56) / 10) + ((chv - 56) % 10) * 9;
            }
            else if (ch >= 'P' && ch <= 'V') {
                chksum = Math.floor((chv - 57) / 10) + ((chv - 57) % 10) * 9;
            }
            else switch (ch) {
                case 'X': chksum = 3; break; case 'Y': chksum = 12; break;
                case 'W': chksum = 21; break; case 'Z': chksum = 30; break;
                case 'I': chksum = 39; break; case 'O': chksum = 48; break;
            }
            var ArabicNumber = "0123456789";
            for (i = 1; i <= 8; i++) {
                chksum += ArabicNumber.indexOf(tid.charAt(i)) * (9 - i);
            }
            chksum += ArabicNumber.indexOf(tid.charAt(9));
            if (chksum % 10 == 0) { args.IsValid = true; }
            else { args.IsValid = false; }
        */
        }
        //-->
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="960" height="180" id="top" align="middle">
      <param name="movie" value="flash/top.swf" />
      <param name="quality" value="high" />
      <param name="bgcolor" value="#ffffff" />
      <param name="play" value="true" />
      <param name="loop" value="true" />
      <param name="wmode" value="transparent" />
      <param name="scale" value="showall" />
      <param name="menu" value="true" />
      <param name="devicefont" value="false" />
      <param name="salign" value="" />
      <param name="allowScriptAccess" value="sameDomain" />
      <!--[if !IE]>-->
      <object type="application/x-shockwave-flash" data="flash/top.swf" width="960" height="180">
        <param name="movie" value="flash/top.swf" />
        <param name="quality" value="high" />
        <param name="bgcolor" value="#ffffff" />
        <param name="play" value="true" />
        <param name="loop" value="true" />
        <param name="wmode" value="transparent" />
        <param name="scale" value="showall" />
        <param name="menu" value="true" />
        <param name="devicefont" value="false" />
        <param name="salign" value="" />
        <param name="allowScriptAccess" value="sameDomain" />
        <!--<![endif]-->
        <a href="http://www.adobe.com/go/getflash"> <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="取得 Adobe Flash 播放程式" /></a>
        <!--[if !IE]>-->
      </object>
      <!--<![endif]-->
    </object></td>
  </tr>
  <tr>
    <td background="images/b-1.jpg">
                    <asp:Panel ID="plSearch" runat="server">
        <p>&nbsp;</p>
      <table width="243" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center"><p class="w2"><img src="images/search-p1.jpg" alt="" width="237" height="32" /></p></td>
        </tr>
        <tr>
          <td height="38" align="center" bgcolor="#FFFFFF"><span class="search-1">請輸入您的身分證統一編號&#13;(共10碼)&#13;</span></td>
        </tr>
        <tr>
          <td height="32" align="center" bgcolor="#FFFFFF"><span class="w">
            <asp:TextBox ID="txtID" runat="server" MaxLength="10" TextMode="Password" Width="140"  />
                             <div>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtID" SetFocusOnError="true" ForeColor="red"
                                   Display="Dynamic" ErrorMessage="(身分證統一編號不可以空白)" />
                              <asp:CustomValidator id="Customstu_id" runat="server" Enabled="true"
                                   ControlToValidate="txtID" Display="Dynamic" ErrorMessage="(請輸入正確的身分證統一編號)"
                                   ClientValidationFunction="stu_id_check" /> 
                             </div>
          </span></td>
        </tr>
        <tr>
          <td height="40" align="center" bgcolor="#FFFFFF"><p class="w">
 <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" runat="server" />
                              <asp:Button ID="btSearch" runat="server" onclick="btSearch_Click" Text="查詢記錄" />

                                                           </p></td>
        </tr>
        <tr>
          <td height="19" align="center"><span class="search-1" style="color:#036eb6;"><br />
            還沒有臺灣銀行網銀的快去申請喔!</span></td>
        </tr>
        <tr>
          <td height="32" align="center"><p class="search-1"><u><a href="apply.html" target="_blank">申請GO&gt;&gt;</a></u></p></td>
        </tr>
        <tr>
          <td align="center">&nbsp;</td>
        </tr>
      </table>

                    </asp:Panel>  

                    <asp:Panel ID="plResult" Visible="false" runat="server">
        <table width="380" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center"><h1 class="search-5"><asp:Label ID="lbId" runat="server" />***您好!</h1></td>
        </tr>
        <tr>
          <td height="38" align="center" bgcolor="#006699"><p class="search-4">您目前於各獎項累積的可抽獎次數</p></td>
        </tr>
        <tr>
          <td height="32" align="center" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="2" cellspacing="2">
            <tr>
              <td width="72%" height="30" align="center" bgcolor="#EFEFEF"><span class="search-6">sony Xperia ZR</span></td>
              <td width="28%" height="30" align="center" bgcolor="#EFEFEF"><span class="search-6"><asp:Label ID="lbPrize1" runat="server" /> 次</span></td>
            </tr>
            <tr>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6">iPad mini</span></td>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6"><asp:Label ID="lbPrize2" runat="server" /> 次</span></td>
            </tr>
            <tr>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6">DYSON DC45 <br />
                手持輕型無線吸塵器</span></td>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6"><asp:Label ID="lbPrize3" runat="server" /> 次</span></td>
            </tr>
            <tr>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6">tokuyo                                        A咖美腿機</span></td>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6"><asp:Label ID="lbPrize4" runat="server" /> 次</span></td>
            </tr>
            <tr>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6">CHIMEI奇美 <br />
                50吋LED大電視</span></td>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6"><asp:Label ID="lbPrize5" runat="server" /> 次</span></td>
            </tr>
            <tr>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6">Beats Wireless <br />
                無線藍牙耳罩式耳機</span></td>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6"><asp:Label ID="lbPrize6" runat="server" /> 次</span></td>
            </tr>
            <tr>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6">馬到成功黃金條塊</span></td>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6"><asp:Label ID="lbPrize7" runat="server" /> 次</span></td>
            </tr>
            <tr>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6">黃金存摺</span></td>
              <td height="30" align="center" bgcolor="#EFEFEF"><span class="search-6"><asp:Label ID="lbPrize8" runat="server" /> 次</span></td>
            </tr>
            <tr>
              <td colspan="2" height="30" align="center" style="background:#2994c9; color:#fff; font-size:15px; letter-spacing:2px;">已選獎 <span style="font-size:21px;"><strong><u><asp:Label ID="lbUsedCount" Text="0" runat="server" /></u></strong></span> 次</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td style="height:10px;"></td>
        </tr>
        <tr>
          <td height="40" align="center" bgcolor="#FFFFFF"><span class="search-2">您總共有 <asp:Label ID="lbTotal" Text="0"  style="font-weight:bold; font-size:17px;" runat="server" />  次選獎機會，
              您目前還剩 <span class="w5"><u>  <asp:Label ID="lbNotUsed" style="font-weight:bold; font-size:21px; text-decoration:underline;" runat="server" />  </u></span>次 選獎機會</span></td>
        </tr>
      </table>

      <table width="460" border="0" align="center">
        <tr>
          <td><span class="search-31">請於102年12月31日下午4:00前，選擇要抽的獎品項目，活動結束後未選擇抽獎項目者，視同放棄抽獎資格；交易的次數越多，中獎機會越大喔~</span></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td align="center">
<asp:ImageButton ID="ibtPrize" ImageUrl="images/search-icon1.jpg" PostBackUrl="~/Prize.aspx" Visible="false" runat="server" />
                             <asp:Label ID="lbDefault" Text="<span class='search-7'>您目前已選完抽獎機會</span><br />" Visible="false" runat="server" />
                             <asp:HyperLink ID="hlDefault" Text="<span class='search-8'>回活動首頁&gt;&gt;</span>" NavigateUrl="~/Default.aspx" runat="server" Visible="false" />
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><span class="search-31">小提醒: <br />
            1.活動期間，可以登入網路銀行點選「翻好運 抽大獎」更新最新的選獎次數。 <br />
            2.所有選獎時間記錄，以系統記錄的時間為準。 </span></td>
        </tr>
    </table>
                    </asp:Panel>  
    </td>
  </tr>
  <tr>
    <td bgcolor="#CA801D"><img src="images/b-2.jpg" width="960" height="22" /></td>
  </tr>
  <tr>
    <td height="38" align="center" bgcolor="#CA801D" class="copy"><iframe src="copy.html" height="50" width="880" scrolling="no" frameborder="0"> </iframe></td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
