<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetGameLogPlay.aspx.cs" Inherits="GetGameLogPlay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" method="post" action="GetBallot.aspx" runat="server">
    <div>
    <asp:TextBox ID="GLId" Text="" Width="400" ReadOnly="false" runat="server"></asp:TextBox><br />
        <input id="Submit2" name="bt1" type="submit" value="送出"  />
    </div>
    </form>
</body>
</html>
