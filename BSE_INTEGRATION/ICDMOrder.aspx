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
    <style>
        .container{
            width:85%;
            margin:0 auto;
        }
    </style>

<body>
   <form id="form1" runat="server">
    <div class="container p-3">
        <div class="card border shadow-sm rounded-3 p-3">
            <h5 class="mb-3 text-primary fw-semibold">
                <i class="fas fa-file-invoice me-2"></i> ICDM Order Entry
            </h5>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold mb-2 d-block"></asp:Label>

            <div class="row g-2">
                <!-- ISIN -->
                <div class="col-md-4">
                    <label class="form-label" data-bs-toggle="tooltip" title="Enter the 12-digit ISIN">ISIN Number</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-barcode"></i></span>
                        <asp:TextBox ID="txtISIN" runat="server" CssClass="form-control" placeholder="Enter ISIN" required></asp:TextBox>
                    </div>
                </div>

                <!-- Order Type -->
                <div class="col-md-4">
                    <label class="form-label" data-bs-toggle="tooltip" title="Choose order type">Order Type</label>
                    <asp:DropDownList ID="ddlOrderType" runat="server" CssClass="form-select">
                        <asp:ListItem Text="SELL" Value="1" />
                        <asp:ListItem Text="BOTH (CROSS DEAL)" Value="2" />
                    </asp:DropDownList>
                </div>

                <!-- Issue Type -->
                <div class="col-md-4">
                    <label class="form-label" data-bs-toggle="tooltip" title="Select the issue type">Issue Type</label>
                    <asp:DropDownList ID="ddlIssueType" runat="server" CssClass="form-select">
                        <asp:ListItem Text="ICDM" Value="ICDM" />
                        <asp:ListItem Text="CP" Value="CP" />
                        <asp:ListItem Text="CD" Value="CD" />
                    </asp:DropDownList>
                </div>

                <!-- Previous Day Deal -->
                <div class="col-md-4 d-flex align-items-end">
                    <div class="form-check">
                        <asp:CheckBox ID="chkpreviousdaydeal" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label ms-1">Previous Day Deal</label>
                    </div>
                </div>

                <!-- Value -->
                <div class="col-md-4">
                    <label class="form-label">Value</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-rupee-sign"></i></span>
                        <asp:TextBox ID="txtValue" runat="server" CssClass="form-control" placeholder="Enter Value" required></asp:TextBox>
                    </div>
                </div>

                <!-- Price -->
                <div class="col-md-4">
                    <label class="form-label">Price</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-percentage"></i></span>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Price" required></asp:TextBox>
                    </div>
                </div>

                <!-- Settle Days -->
                <div class="col-md-4">
                    <label class="form-label">Settle Days</label>
                    <asp:DropDownList ID="ddlSettleDays" runat="server" CssClass="form-select">
                        <asp:ListItem Text="T+0" Value="0" />
                        <asp:ListItem Text="T+1" Value="1" />
                        <asp:ListItem Text="T+2" Value="2" />
                    </asp:DropDownList>
                </div>

                <!-- Mod Accr Int -->
                <div class="col-md-4">
                    <label class="form-label">Mod.Accr.Int</label>
                    <asp:TextBox ID="txtModAcrr" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>

                <!-- Seller Participant -->
                <div class="col-md-4">
                    <label class="form-label">Seller Participant Id</label>
                    <asp:TextBox ID="txtSellerParticipantLoginId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFI"></asp:TextBox>
                </div>

                <!-- Seller Dealer -->
                <div class="col-md-4">
                    <label class="form-label">Seller Dealer Id</label>
                    <asp:TextBox ID="txtSellerDealerLoginId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFID1"></asp:TextBox>
                </div>

                <!-- Seller Client -->
                <div class="col-md-4">
                    <label class="form-label">Seller Client Id</label>
                    <asp:TextBox ID="txtSellerClientLoginId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFI"></asp:TextBox>
                </div>

                <!-- Buyer Dealer -->
                <div class="col-md-4">
                    <label class="form-label">Buyer Dealer Id</label>
                    <asp:TextBox ID="txtBuyerDealerId" runat="server" CssClass="form-control" ReadOnly="true" Text="BSEFID1"></asp:TextBox>
                </div>

                <!-- Buyer Client -->
                <div class="col-md-4">
                    <label class="form-label">Buyer Client Id</label>
                    <asp:TextBox ID="txtBuyerClientId" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <!-- Execution Time -->
                <div class="col-md-4">
                    <label class="form-label">Execution Time (HH:MM)</label>
                    <div class="d-flex gap-1">
                        <asp:DropDownList ID="ddlHours" runat="server" CssClass="form-select w-50"></asp:DropDownList>
                        <span class="align-self-center">:</span>
                        <asp:DropDownList ID="ddlMinutes" runat="server" CssClass="form-select w-50"></asp:DropDownList>
                    </div>
                </div>

                <!-- Yield Type -->
                <div class="col-md-4">
                    <label class="form-label">Yield Type</label>
                    <asp:DropDownList ID="ddlYieldType" runat="server" CssClass="form-select">
                        <asp:ListItem Text="YTM" Value="YTM" />
                        <asp:ListItem Text="YTP" Value="YTP" />
                        <asp:ListItem Text="YTC" Value="YTV" />
                    </asp:DropDownList>
                </div>

                <!-- Is Broker -->
                <div class="col-md-4">
                    <label class="form-label">Is Broker</label>
                    <asp:DropDownList ID="ddlIsBroker" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlIsBroker_SelectedIndexChanged">
                        <asp:ListItem Text="DIRECT" Value="DIRECT" />
                        <asp:ListItem Text="BROKERED" Value="BROKERED" />
                    </asp:DropDownList>
                </div>

                <!-- Yield -->
                <div class="col-md-4">
                    <label class="form-label">Yield</label>
                    <asp:TextBox ID="txtYield" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>

                <!-- Brokered Name -->
                <div class="col-md-4">
                    <label class="form-label">Brokered Name</label>
                    <asp:TextBox ID="txtBrokeredName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>

                <!-- Reference Number -->
                <div class="col-md-4">
                    <label class="form-label">Reference Number</label>
                    <asp:TextBox ID="txtSellerReferenceno" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <!-- Submit -->
                <div class="col-12 mt-3">
                    <asp:Button ID="btnCreateICDM" runat="server" Text="Create Order" CssClass="btn btn-primary w-100" OnClick="btnCreateICDM_Click" />
                </div>
            </div>
        </div>
    </div>

    <script>
        // Enable tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.forEach(function (tooltipTriggerEl) {
            new bootstrap.Tooltip(tooltipTriggerEl);
        });
    </script>
</form>

</body>
</html>
