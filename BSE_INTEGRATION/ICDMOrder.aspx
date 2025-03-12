<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ICDMOrder.aspx.cs" Inherits="BSE_INTEGRATION_ICDMOrder" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ICDM Order</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

    <!-- Flatpickr for Time Picker -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

    <!-- Custom Styles -->
    <link href="../Style_bse/style.css" rel="stylesheet" />

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Flatpickr JS -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

    <!-- External JavaScript -->
    <script src="../js/bse_i/timepicker.js"></script>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center mt-4 text-primary"><i class="fas fa-file-invoice"></i> ICDM Order Entry</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>

            <div class="card shadow p-4 mt-4">
                <div class="row g-3">
                    <!-- ISIN Number -->
                    <div class="col-md-6">
                        <label class="form-label">ISIN Number:</label>
                        <asp:TextBox ID="txtISIN" runat="server" CssClass="form-control" required placeholder="Enter ISIN"></asp:TextBox>
                    </div>

                    <!-- Order Type -->
                    <div class="col-md-6">
                        <label class="form-label">Order Type:</label>
                        <asp:DropDownList ID="ddlOrderType" runat="server" CssClass="form-select">
                            <asp:ListItem Text="SELL" Value="1"></asp:ListItem>
                            <asp:ListItem Text="BOTH (CROSS DEAL)" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Issue Type -->
                    <div class="col-md-6">
                        <label class="form-label">Issue Type:</label>
                        <asp:DropDownList ID="ddlIssueType" runat="server" CssClass="form-select">
                            <asp:ListItem Text="ICDM" Value="ICDM"></asp:ListItem>
                            <asp:ListItem Text="CP" Value="CP"></asp:ListItem>
                            <asp:ListItem Text="CD" Value="CD"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Previous Day Deal -->
                    <div class="col-md-6">
                        <div class="form-check mt-4">
                            <asp:CheckBox ID="chkpreviousdaydeal" runat="server" CssClass="form-check-input" />
                            <label class="form-check-label">Previous Day Deal</label>
                        </div>
                    </div>

                    <!-- Value & Price -->
                    <div class="col-md-6">
                        <label class="form-label">Value:</label>
                        <asp:TextBox ID="txtValue" runat="server" CssClass="form-control" required placeholder="Enter Value"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Price:</label>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" required placeholder="Enter Price"></asp:TextBox>
                    </div>

                    <!-- Settle Days -->
                    <div class="col-md-6">
                        <label class="form-label">Settle Days:</label>
                        <asp:DropDownList ID="ddlSettleDays" runat="server" CssClass="form-select">
                            <asp:ListItem Text="T+0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="T+1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="T+2" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Mod Accr Int -->
                    <div class="col-md-6">
                        <label class="form-label">Mod.Accr.Int:</label>
                        <asp:TextBox ID="txtModAcrr" runat="server" CssClass="form-control" required ></asp:TextBox>
                    </div>

                    <!-- Seller & Buyer Details -->
                    <div class="col-md-6">
                        <label class="form-label">Seller Participant Id:</label>
                        <asp:TextBox ID="txtSellerParticipantLoginId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFI"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Seller Dealer Id:</label>
                        <asp:TextBox ID="txtSellerDealerLoginId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFID1"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Seller Client Id:</label>
                        <asp:TextBox ID="txtSellerClientLoginId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFI"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Buyer Dealer Id:</label>
                        <asp:TextBox ID="txtBuyerDealerId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFID1"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Buyer Client Id:</label>
                        <asp:TextBox ID="txtBuyerClientId" runat="server" CssClass="form-control" ></asp:TextBox>
                    </div>

                    <!-- Execution Time -->
                 <div class="col-md-6">
                    <label class="form-label">Execution Time (HH:MM):</label>
                    <div class="d-flex gap-2">
                        <asp:DropDownList ID="ddlHours" runat="server" CssClass="form-select w-50"></asp:DropDownList>
                        <span class="fw-bold">:</span>
                        <asp:DropDownList ID="ddlMinutes" runat="server" CssClass="form-select w-50"></asp:DropDownList>
                    </div>
                </div>

                  <div class="col-md-6">
                     <label class="form-label">Yield Type:</label>
                     <asp:DropDownList ID="ddlYieldType" runat="server" CssClass="form-select">
                         <asp:ListItem Text="YTM" Value="YTM"></asp:ListItem>
                         <asp:ListItem Text="YTP" Value="YTP"></asp:ListItem>
                         <asp:ListItem Text="YTC" Value="YTV"></asp:ListItem>
                     </asp:DropDownList>
                 </div>

                <div class="col-md-6">
                    <label class="form-label">Is Broker:</label>
                    <asp:DropDownList ID="ddlIsBroker" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlIsBroker_SelectedIndexChanged">
                        <asp:ListItem Text="DIRECT" Value="DIRECT"></asp:ListItem>
                        <asp:ListItem Text="BROKERED" Value="BROKERED"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Yield:</label>
                    <asp:TextBox ID ="txtYield" runat="server" CssClass="form-control" required></asp:TextBox>

                </div>
                <div class="col-md-6">
                    <label class="form-label">Brokered Name:</label>
                    <asp:TextBox ID="txtBrokeredName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Reference Number:</label>
                    <asp:TextBox ID="txtSellerReferenceno" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>


                    <!-- Submit Button -->
                    <div class="col-12 text-center mt-4">
                        <asp:Button ID="btnCreateICDM" runat="server" Text="Create Order" CssClass="btn btn-primary btn-lg w-100" OnClick="btnCreateICDM_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
