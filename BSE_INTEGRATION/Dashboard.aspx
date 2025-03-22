<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="BSE_INTEGRATION_Dashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Dashboard - BSE API</title>
    <link href="../css/Style_Bse/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar">
            <h3>BSE Dashboard</h3>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger" OnClick="btnLogout_Click" />
        </nav>

        <div class="container">
            <h2>Welcome to the BSE API Dashboard</h2>
            <p>Your Dealer ID: <asp:Label ID="lblDealerID" runat="server"></asp:Label></p>

            <div class="dashboard-menu">
                <a href="UCCManagement.aspx" class="btn btn-primary">UCC Management</a>
                <a href="ICDMOrder.aspx" class="btn btn-primary">ICDM Order</a>
                <a href="RFQOrder.aspx" class="btn btn-primary">RFQ Order</a>
                <a href="RFQModify.aspx" class="btn btn-primary">Modify RFQ</a>
                <a href="RFQQuoteAccept.aspx" class="btn btn-primary">RFQ Quote Accept</a>
                <a href="RFQDealPropose.aspx" class="btn btn-primary">RFQ Deal Propose</a>
                <a href="RFQApprove.aspx" class="btn btn-primary">RFQ Deal Approve</a>
            </div>
        </div>
    </form>
</body>
</html>