<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQModify.aspx.cs" Inherits="BSE_INTEGRATION_RFQModify" Async="true" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>RFQ Modify Order</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/bse_i/rfq.js"></script>
    <link href="../css/Style_Bse/style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center">Modify RFQ Order</h2>

            <div class="row">
                <div class="col-md-6">
                    <label>Bond Type:</label>
                    <asp:DropDownList ID="ddlBondType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="ICDM">ICDM</asp:ListItem>
                        <asp:ListItem Value="GSEC">GSEC</asp:ListItem>
                        <asp:ListItem Value="CP">CP</asp:ListItem>
                        <asp:ListItem Value="CD">CD</asp:ListItem>
                    </asp:DropDownList>
                </div>
                  <div class="col-md-6">
                      <label>Deal Type:</label>
                      <asp:DropDownList ID="ddlDealType" runat="server" CssClass="form-control">
                          <asp:ListItem Value="DIRECT">DIRECT</asp:ListItem>
                          <asp:ListItem Value="BROKER">BROKER</asp:ListItem>
                      </asp:DropDownList>
                  </div>
                
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <label>Bid/Offer Type:</label>
                    <asp:DropDownList ID="ddlBidOffer" runat="server" CssClass="form-control">
                        <asp:ListItem Value="BID">BID</asp:ListItem>
                        <asp:ListItem Value="OFFER">OFFER</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-md-6">
                    <label>RFQ Order Number:</label>
                    <asp:TextBox ID="txtRFQOrderNumber" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-3">
            <div class="col-md-6">
                <label for="txtISINNumber">ISIN Number:</label>
               <asp:TextBox ID="txtISINNumber" runat="server" AutoPostBack="true" OnTextChanged="txtISINNumber_TextChanged" CssClass="form-control"></asp:TextBox>

            </div>

                
                <div class="col-md-6">
                    <label>Value (₹):</label>
                    <asp:TextBox ID="txtValue" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-3">
               

                
                 <div class="col-md-6">
                     <label>Minimum Value (₹):</label>
                     <asp:TextBox ID="txtMinimumValue" runat="server" CssClass="form-control"></asp:TextBox>
                 </div>

                <div class="col-md-6">
                    <label>Yield (%):</label>
                    <asp:TextBox ID="txtYield" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <label>Price (₹):</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                     <label>RFQ Deal Id:</label>
                     <asp:TextBox ID="txtRfqDealId" runat="server" CssClass="form-control"></asp:TextBox>
                 </div>

               <div class="row">
                    <div class="col-md-6">
                        <label>Validity Time *</label>
                        <div class="form-check">
                           <asp:CheckBox ID="chkGFD" runat="server" CssClass="form-check-input" onclick="toggleDealTime()" data-clientid="<%= chkGFD.ClientID %>" />
                            <label class="form-check-label" for="chkGFD">GFD </label>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <label>Deal Time (Hours)</label>
                      <asp:DropDownList ID="ddlDealTimeHours" runat="server" CssClass="form-control"  data-clientid="<%= ddlDealTimeHours.ClientID %>"> </asp:DropDownList>
                    </div>

                    <div class="col-md-3">
                        <label>Deal Time (Minutes)</label>
                        <asp:DropDownList ID="ddlDealTimeMinutes" runat="server" CssClass="form-control"  data-clientid="<%= ddlDealTimeMinutes.ClientID %>"></asp:DropDownList>
                    </div>

                     
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-12 text-center">
                    <asp:Button ID="btnModifyRFQ" runat="server" CssClass="btn btn-primary" Text="Modify RFQ" OnClick="btnModifyRFQ_Click" />
                </div>
            </div>

            <div class="mt-3 text-center">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
