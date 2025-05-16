<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaymenyGateway.aspx.cs" Inherits="BSE_INTEGRATION_PaymenyGateway" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>BSE Payment Gateway Integration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center">BSE Payment Gateway</h2>

            <div class="mb-3">
                <label for="txtOrderNo" class="form-label">Order Number:</label>
                <asp:TextBox ID="txtOrderNo" runat="server" CssClass="form-control" required="true"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtTradeDate" class="form-label">Trade Date:</label>
                <asp:TextBox ID="txtTradeDate" runat="server" CssClass="form-control" TextMode="Date" required="true"></asp:TextBox>
            </div>

            <asp:Button ID="btnGeneratePaymentLink" runat="server" CssClass="btn btn-primary" Text="Generate Payment Link" OnClick="btnGeneratePaymentLink_Click" />

            <div class="mt-3">
                <asp:Label ID="lblResponse" runat="server" CssClass="text-success"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>