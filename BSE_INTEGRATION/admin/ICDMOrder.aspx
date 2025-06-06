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
    <link href="../../css/Style_Bse/style.css" rel="stylesheet" />

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
    <div class="container">
        
           <div class="d-flex justify-content-between align-items-center mb-4">
  <a href="Dashboard.aspx">
    <img src="https://bondsadda.com/img/logo.png" alt="Bondsadda Logo" class="sizelogo" />
</a>

  <h4 class="mb-0">ICDM Order</h4>
</div>


   <form id="form1" runat="server">
<!-- ICDM Order Entry Card -->
<div class="card card-gold mb-4">
    <div class="card-header py-2">
        <h6 class="mb-0"><i class="fas fa-file-invoice me-2"></i>ICDM Order Entry</h6>
    </div>
    <div class="card-body px-4 py-3">
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold mb-2 d-block"></asp:Label>

        <!-- Row 1 -->
        <div class="row mb-3">
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtISIN" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-barcode me-1"></i>ISIN Number
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtISIN" runat="server" CssClass="form-control form-control-sm" placeholder="Enter ISIN" />
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="ddlOrderType" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-exchange-alt me-1"></i>Order Type
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlOrderType" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem Text="SELL" Value="1" />
                        <asp:ListItem Text="BOTH (CROSS DEAL)" Value="2" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="ddlIssueType" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-file-invoice-dollar me-1"></i>Issue Type
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlIssueType" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem Text="ICDM" Value="ICDM" />
                        <asp:ListItem Text="CP" Value="CP" />
                        <asp:ListItem Text="CD" Value="CD" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <!-- Row 2 -->
        <div class="row mb-3">
            <div class="col-md-4 d-flex align-items-center">
                <label for="chkpreviousdaydeal" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-calendar-day me-1"></i>Prev Day Deal
                </label>
                <div class="col-7 d-flex align-items-center">
                    <asp:CheckBox ID="chkpreviousdaydeal" runat="server" CssClass="form-check-input me-2" />
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="txtValue" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-rupee-sign me-1"></i>Value
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtValue" runat="server" CssClass="form-control form-control-sm" placeholder="Enter Value" />
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="txtPrice" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-percentage me-1"></i>Price
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control form-control-sm" placeholder="Enter Price" />
                </div>
            </div>
        </div>

        <!-- Row 3 -->
        <div class="row">
            <div class="col-md-4 d-flex align-items-center">
                <label for="ddlSettleDays" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-calendar-check me-1"></i>Settle Days
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlSettleDays" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem Text="T+0" Value="0" />
                        <asp:ListItem Text="T+1" Value="1" />
                        <asp:ListItem Text="T+2" Value="2" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="txtModAcrr" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-calculator me-1"></i>Mod.Accr.Int
                </label>
                <div class="col-7">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Trade Execution Details Card -->
<div class="card card-gold mb-4">
    <div class="card-header">
        <h5 class="mb-0"><i class="fas fa-file-contract me-2"></i>Trade Execution Details</h5>
    </div>
    <div class="card-body px-3 py-2">
        <div class="row mb-3">

            <!-- Mod Accr Int -->
            <div class="col-md-4 d-flex">
                <label for="txtModAcrr" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-calculator me-1"></i>Mod.Accr.Int
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtModAcrr" runat="server" CssClass="form-control form-control-sm" required="true"></asp:TextBox>
                </div>
            </div>

            <!-- Seller Participant -->
            <div class="col-md-4 d-flex">
                <label for="txtSellerParticipantLoginId" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-user-tag me-1"></i>Seller Participant Id
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtSellerParticipantLoginId" runat="server" CssClass="form-control form-control-sm" ReadOnly="true" Text="BSEFI"></asp:TextBox>
                </div>
            </div>

            <!-- Seller Dealer -->
            <div class="col-md-4 d-flex">
                <label for="txtSellerDealerLoginId" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-user-tie me-1"></i>Seller Dealer Id
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtSellerDealerLoginId" runat="server" CssClass="form-control form-control-sm" ReadOnly="true" Text="BSEFID1"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="row mb-3">
            <!-- Seller Client -->
            <div class="col-md-4 d-flex">
                <label for="txtSellerClientLoginId" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-users me-1"></i>Seller Client Id
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtSellerClientLoginId" runat="server" CssClass="form-control form-control-sm" ReadOnly="true" Text="BSEFI"></asp:TextBox>
                </div>
            </div>

            <!-- Buyer Dealer -->
            <div class="col-md-4 d-flex">
                <label for="txtBuyerDealerId" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-user-shield me-1"></i>Buyer Dealer Id
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtBuyerDealerId" runat="server" CssClass="form-control form-control-sm" ReadOnly="true" Text="BSEFID1"></asp:TextBox>
                </div>
            </div>

            <!-- Buyer Client -->
            <div class="col-md-4 d-flex">
                <label for="txtBuyerClientId" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-user-friends me-1"></i>Buyer Client Id
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtBuyerClientId" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>
        </div>

       <div class="row">
    <!-- Execution Time -->
    <div class="col-md-4 d-flex align-items-center">
        <label for="ddlHours" class="col-5 col-form-label text-end pe-2">
            <i class="fas fa-clock me-1"></i>Execution Time (HH:MM)
        </label>
        <div class="col-7 d-flex align-items-center">
            <asp:DropDownList ID="ddlHours" runat="server" CssClass="form-select form-select-sm me-1 w-50"></asp:DropDownList>
            <span class="input-group-text px-2">:</span>
            <asp:DropDownList ID="ddlMinutes" runat="server" CssClass="form-select form-select-sm ms-1 w-50"></asp:DropDownList>
        </div>
    </div>

    <!-- Yield Type -->
    <div class="col-md-4 d-flex align-items-center">
        <label for="ddlYieldType" class="col-5 col-form-label text-end pe-2">
            <i class="fas fa-chart-line me-1"></i>Yield Type
        </label>
        <div class="col-7">
            <asp:DropDownList ID="ddlYieldType" runat="server" CssClass="form-control form-control-sm">
                <asp:ListItem Text="YTM" Value="YTM" />
                <asp:ListItem Text="YTP" Value="YTP" />
                <asp:ListItem Text="YTC" Value="YTV" />
            </asp:DropDownList>
        </div>
    </div>
</div>

    </div>
</div>

    <!-- Yield Type -->
  <%--  <div class="col-md-4">
        <label class="form-label gold-label"><i class="fas fa-chart-line me-1"></i>Yield Type</label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-chart-line"></i></span>
            <asp:DropDownList ID="ddlYieldType" runat="server" CssClass="form-select">
                <asp:ListItem Text="YTM" Value="YTM" />
                <asp:ListItem Text="YTP" Value="YTP" />
                <asp:ListItem Text="YTC" Value="YTV" />
            </asp:DropDownList>
        </div>
    </div>--%>

    <!-- Is Broker -->
   <!-- Order Details Card -->
<div class="card card-gold mb-4">
    <div class="card-header">
        <h5 class="mb-0"><i class="fas fa-clipboard-list me-2"></i>Order Details</h5>
    </div>
    <div class="card-body px-3 py-2">

        <div class="row mb-3">
            <!-- Is Broker -->
            <div class="col-md-4 d-flex">
                <label for="ddlIsBroker" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-handshake me-1"></i>Is Broker
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlIsBroker" runat="server" CssClass="form-select form-select-sm"
                        AutoPostBack="true" OnSelectedIndexChanged="ddlIsBroker_SelectedIndexChanged">
                        <asp:ListItem Text="DIRECT" Value="DIRECT" />
                        <asp:ListItem Text="BROKERED" Value="BROKERED" />
                    </asp:DropDownList>
                </div>
                 
            </div>
             <!-- Yield -->
         <div class="col-md-4 d-flex">
             <label for="txtYield" class="col-5 col-form-label text-end pe-2">
                 <i class="fas fa-percentage me-1"></i>Yield
             </label>
             <div class="col-7">
                 <asp:TextBox ID="txtYield" runat="server" CssClass="form-control form-control-sm" required></asp:TextBox>
             </div>
         </div>
          

            <!-- Brokered Name -->
            <div class="col-md-4 d-flex">
                <label for="txtBrokeredName" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-user-circle me-1"></i>Brokered Name
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtBrokeredName" runat="server" CssClass="form-control form-control-sm" Enabled="false"></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- Row 2 -->
        <div class="row mb-3">
            <!-- Reference Number -->
            <div class="col-md-4 d-flex">
                <label for="txtSellerReferenceno" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-hashtag me-1"></i>Reference Number
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtSellerReferenceno" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <asp:Button ID="btnCreateICDM" runat="server" Text="Create Order"  CssClass="btn w-100" OnClick="btnCreateICDM_Click" />
            </div>
        </div>

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
    </div>

</body>
</html>
