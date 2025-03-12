<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="BSE_INTEGRATION_Login" Async="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login - BSE Integration</title>
    <link href="../css/Style_Bse/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>BSE API Login</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <div>
                <label>Participant ID:</label>
                <asp:TextBox ID="txtParticipantID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <label>Dealer ID:</label>
                <asp:TextBox ID="txtDealerID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <label>Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>