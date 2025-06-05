 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQModify.aspx.cs" Inherits="BSE_INTEGRATION_RFQModify" Async="true" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>RFQ Modify Order</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <script type="text/javascript" src="../js/bse_i/rfq.js"></script>
    <link href="../css/Style_Bse/style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
    <div class="container mt-4">
        <h2 class="text-center text-warning mb-4"><i class="bi bi-pencil-square me-2"></i>Modify RFQ Order</h2>

        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-collection me-2 text-warning"></i>Bond Type</label>
                <asp:DropDownList ID="ddlBondType" runat="server" CssClass="form-select">
                    <asp:ListItem Value="ICDM">ICDM</asp:ListItem>
                    <asp:ListItem Value="GSEC">GSEC</asp:ListItem>
                    <asp:ListItem Value="CP">CP</asp:ListItem>
                    <asp:ListItem Value="CD">CD</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-diagram-3 me-2 text-warning"></i>Deal Type</label>
                <asp:DropDownList ID="ddlDealType" runat="server" CssClass="form-select">
                    <asp:ListItem Value="DIRECT">DIRECT</asp:ListItem>
                    <asp:ListItem Value="BROKER">BROKER</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-arrow-left-right me-2 text-warning"></i>Bid/Offer Type</label>
                <asp:DropDownList ID="ddlBidOffer" runat="server" CssClass="form-select">
                    <asp:ListItem Value="BID">BID</asp:ListItem>
                    <asp:ListItem Value="OFFER">OFFER</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-receipt-cutoff me-2 text-warning"></i>RFQ Order Number</label>
                <asp:TextBox ID="txtRFQOrderNumber" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-upc me-2 text-warning"></i>ISIN Number</label>
                <asp:TextBox ID="txtISINNumber" runat="server" AutoPostBack="true" OnTextChanged="txtISINNumber_TextChanged" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-currency-rupee me-2 text-warning"></i>Value (₹)</label>
                <asp:TextBox ID="txtValue" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-cash-stack me-2 text-warning"></i>Minimum Value (₹)</label>
                <asp:TextBox ID="txtMinimumValue" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-percent me-2 text-warning"></i>Yield (%)</label>
                <asp:TextBox ID="txtYield" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-coin me-2 text-warning"></i>Price (₹)</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-hash me-2 text-warning"></i>RFQ Deal ID</label>
                <asp:TextBox ID="txtRfqDealId" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- Validity Time and Deal Time Row -->
            <div class="col-md-6">
                <label class="form-label fw-semibold"><i class="bi bi-clock-history me-2 text-warning"></i>Validity Time *</label>
                <div class="form-check">
                    <asp:CheckBox ID="chkGFD" runat="server" CssClass="form-check-input" onclick="toggleDealTime()" data-clientid="<%= chkGFD.ClientID %>" />
                    <label class="form-check-label ms-2" for="chkGFD">GFD</label>
                </div>
            </div>

            <div class="col-md-3">
                <label class="form-label fw-semibold"><i class="bi bi-hourglass-top me-2 text-warning"></i>Deal Time (Hours)</label>
                <asp:DropDownList ID="ddlDealTimeHours" runat="server" CssClass="form-select" data-clientid="<%= ddlDealTimeHours.ClientID %>"></asp:DropDownList>
            </div>

            <div class="col-md-3">
                <label class="form-label fw-semibold"><i class="bi bi-hourglass-split me-2 text-warning"></i>Deal Time (Minutes)</label>
                <asp:DropDownList ID="ddlDealTimeMinutes" runat="server" CssClass="form-select" data-clientid="<%= ddlDealTimeMinutes.ClientID %>"></asp:DropDownList>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="row mt-4">
            <div class="col-md-12 text-center">
                <asp:Button ID="btnModifyRFQ" runat="server" CssClass="btn btn-warning btn-lg px-4" Text="Modify RFQ" OnClick="btnModifyRFQ_Click" />
            </div>
        </div>

        <!-- Message -->
        <div class="mt-3 text-center">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-semibold"></asp:Label>
        </div>
    </div>
</form>

</body>
</html>
