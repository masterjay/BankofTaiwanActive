<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetBallotTest.aspx.cs" Inherits="GetBallotTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding:10px;">
            <asp:Button ID="btGetTime" Text="抽獎" runat="server" OnClick="btGetTime_Click" /><br /><br />

        籤號 Ballot = <asp:Label ID="lbBallot" runat="server" /><br />
        所有籤數 AllTimes = <asp:Label ID="lbAllTimes" runat="server" /><br />
        使用籤數 UsedTimes = <asp:Label ID="lbUsedTimes" runat="server" /><br />
        剩餘籤數 CanUsedTimes = <asp:Label ID="lbCanUsedTimes" runat="server" /><br />
    </div>
    </form>
</body>
</html>