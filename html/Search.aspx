<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>2015好預兆眾神保庇大禮到</title>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #7fd7f8;
            font-family: Lucida Sans Unicode, Lucida Grande, 蘋果儷中黑, Microsoft JhengHei, 微軟正黑體,細黑體, Sans-Serif;
        }

        .style6 {
            font-size: 18px;
            font-weight: bold;
            color: #660000;
        }

        .style7 {
            color: #660000;
            font-size: 18px;
        }

        a:link {
            text-decoration: none;
            color: #660000;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        a:active {
            text-decoration: none;
        }

        .style19 {
            font-size: 18;
            font-weight: bold;
            color: #660000;
        }

        .style20 {
            font-size: 18;
        }

        .style21 {
            font-size: 16px;
        }

        .style22 {
            color: #0033CC;
        }

        .style23 {
            font-size: 16px;
            font-weight: bold;
            color: #0033CC;
        }
        .search-5 {	font-size: 16px;
	        color: #900;
        }
        .search-7 {	
	        font-size: 16px;
	        color: #069;
        }
        .search-8 {	
	        font-size: 15px;
	        color: #333;
        }
        -->
    </style>
    <script type="text/javascript">
    <!--
    function MM_preloadImages() { //v3.0
        var d = document; if (d.images) {
            if (!d.MM_p) d.MM_p = new Array();
            var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
        }
    }
    function MM_swapImgRestore() { //v3.0
        var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
    }
    function MM_findObj(n, d) { //v4.01
        var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
            d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
        }
        if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
        for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
        if (!x && d.getElementById) x = d.getElementById(n); return x;
    }

    function MM_swapImage() { //v3.0
        var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2) ; i += 3)
            if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
    }
    //-->
    </script>
    <script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
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
<body onload="MM_preloadImages('image/03buttonb01.png','image/web03button01a.png','image/web03button02a.png','image/web03button03a.png','image/web03button04a.png','image/web03button05a.png')">
    <form id="form1" runat="server">
        <table width="338" height="651" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="90">
                    <table width="895" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="895" height="48">
                                <script type="text/javascript">
                                    AC_FL_RunContent('codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0', 'width', '894', 'height', '432', 'src', 'actiontop', 'quality', 'high', 'pluginspage', 'http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash', 'movie', 'flash/actiontop'); //end AC code
                                </script>
                                <noscript>
                                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="894" height="432">
                                        <param name="movie" value="flash/actiontop.swf" />
                                        <param name="quality" value="high" />
                                        <embed src="flash/actiontop.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="894" height="432" /></embed>
                                    </object>
                                </noscript>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="450" height="83" border="0" align="center">
                                    <tr>
                                        <td width="205" height="69"><a href="Search.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image11','','image/web03button05a.png',1)"><img src="image/web03button05.png" name="Image11" width="185" height="67" border="0" id="Image11" /></a></td>
                                        <td width="291"><a href="PlayGame.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','image/web03button03a.png',1)"><img src="image/web03button03.png" name="Image9" width="185" height="67" border="0" id="Image9" /></a></td>
                                        <td width="249"><a href="Default.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image12','','image/web03button04a.png',1)"><img src="image/web03button04.png" name="Image12" width="185" height="67" border="0" id="Image12" /></a></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="561">
                    <table width="894" border="0" align="center" cellpadding="0" cellspacing="0" id="___01">
                        <tr>
                            <td colspan="3"><img id="web03_01" src="image/web03_01.jpg" width="894" height="60" alt="" /></td>
                        </tr>
                        <tr>
                                <asp:Panel ID="plSearch" runat="server">
                                    <td width="90"><img id="web03_02" src="image/web03_02.jpg" width="90" height="414" alt="" /></td>
                                    <td width="714" bgcolor="#fff2a8">
                                        <table width="714" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="714" height="64"><img src="image/web03_03.jpg" width="714" height="113" /></td>
                                            </tr>
                                            <tr>
                                                <td height="72" align="center">
                                                    <asp:TextBox ID="txtID" runat="server" MaxLength="10" Width="200" TextMode="Password"  />
                                                    <div>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtID" SetFocusOnError="true" ForeColor="red"
                                                                        Display="Dynamic" ErrorMessage="(身分證統一編號不可以空白)" />
                                                            <asp:CustomValidator id="Customstu_id" runat="server" Enabled="true"
                                                                        ControlToValidate="txtID" Display="Dynamic" ErrorMessage="(請輸入正確的身分證統一編號)"
                                                                        ClientValidationFunction="stu_id_check" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="114">
                                                    <table width="232" border="0" align="center">
                                                        <tr>
                                                            <td width="241">
                                                                &nbsp;<asp:ValidationSummary ID="ValidationSummary1" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" runat="server" />
                                                                <asp:ImageButton ID="ibtSearch" AlternateText="查詢記錄" ImageUrl="image/03buttonb.png" runat="server" OnClick="ibtSearch_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="34">
                                                    <table width="592" border="0" align="center">
                                                        <tr>
                                                            <td height="25" class="style6">
                                                                <div align="center">
                                                                    <span class="style7">
                                                                        還沒有臺灣銀行網銀的快去申請喔!<br />
                                                                    </span>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="25" class="style6"><div align="center"><span class="style7"><a href="https://ebank.bot.com.tw/NetBank/NNBank/Default.aspx?ITrnTm=1334822561085" target="_blank">申請GO&gt;&gt;</a></span></div></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="90"><img id="web03_04" src="image/web03_04.jpg" width="90" height="414" alt="" /></td>
                                </asp:Panel>

                                <asp:Panel ID="plResult" Visible="false" runat="server">
                                    <td width="90"><img src="image/web04_02.jpg" width="90" height="600" /></td>
                                    <td width="714" bgcolor="#fff2a8">
                                        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="714" height="64"><img src="image/web04_03.jpg" width="714" height="64" /></td>
                                            </tr>
                                            <tr>
                                                <td height="251">
                                                    <div style="text-align:center;">
                                                        <h1 class="search-5"><asp:Label ID="lbId" runat="server" />***您好!</h1>
                                                    </div>

                                                    <table width="330" height="121" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bgcolor="#FFFFFF">
                                                        <tr>
                                                            <td width="156" height="38" class="style4"><div align="center" class="style22"><span class="style21">月下老人</span></div></td>
                                                            <td width="168" height="38"><div align="center" class="style23"> <asp:Label ID="lbPrize1" runat="server" /> 次</div></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="38" class="style4"><div align="center" class="style22"><span class="style21">文昌帝君</span></div></td>
                                                            <td height="38"><div align="center" class="style23"> <asp:Label ID="lbPrize2" runat="server" /> 次</div></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="38" class="style4"><div align="center" class="style22"><span class="style21">觀音菩薩</span></div></td>
                                                            <td height="38"><div align="center" class="style23"> <asp:Label ID="lbPrize3" runat="server" /> 次</div></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="38" class="style4"><div align="center" class="style22"><span class="style21">財神爺</span></div></td>
                                                            <td height="38"><div align="center" class="style23"> <asp:Label ID="lbPrize4" runat="server" /> 次</div></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="38" class="style4"><div align="center" class="style22"><span class="style21">關聖帝君</span></div></td>
                                                            <td height="38"><div align="center" class="style23"> <asp:Label ID="lbPrize5" runat="server" /> 次</div></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="38" class="style4"><div align="center" class="style22"><span class="style21">彌勒佛</span></div></td>
                                                            <td height="38"><div align="center" class="style23"> <asp:Label ID="lbPrize6" runat="server" /> 次</div></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="103">
                                                    <table width="249" align="center">
                                                        <tr>
                                                            <td width="241" height="30"><span class="style4">您共有 <asp:Label ID="lbTotal" Text="0" style="font-weight:bold; font-size:17px; text-decoration:underline;" runat="server" /> 次求籤機會</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30"><span class="style4">已求籤 <asp:Label ID="lbUsedCount" Text="0" style=" text-decoration:underline;" runat="server" /> 次</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30">
                                                                <span class="style4">
                                                                    目前尚餘 <asp:Label ID="lbNotUsed" style="font-weight:bold; font-size:21px; text-decoration:underline;" runat="server" /> 次求籤機會<br />
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div style="text-align:center; padding-bottom:10px;">
                                                        <asp:ImageButton ID="ibtPrize" ImageUrl="image/web03button03.png" PostBackUrl="~/PlayGame.aspx" Visible="false" runat="server" />
                                                        <asp:Label ID="lbDefault" Text="<span class='search-7'>您目前已選完抽籤機會</span><br />" Visible="false" runat="server" />
                                                        <asp:HyperLink ID="hlDefault" Text="<span class='search-8'>回活動首頁&gt;&gt;</span>" NavigateUrl="~/Default.aspx" runat="server" Visible="false" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="13">
                                                    <table width="625" border="0" align="center" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="17"><span class="style19">*</span></td>
                                                            <td width="581" >
                                                                <span class="style19">
                                                                    請於103年12月15日下午4時前完成求籤，以取得抽獎資格，活動結束後求籤者，<br />
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td><span class="style20"></span></td>
                                                            <td><span class="style19">視同放棄抽獎資格。交易次數愈多，中獎機會愈高喔~</span></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="90"><img src="image/web04_04.jpg" width="90" height="600" /></td>
                                </asp:Panel>

                        </tr>
                        <tr>
                            <td height="87" colspan="3"><img src="image/web03_05.jpg" width="894" height="87" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
