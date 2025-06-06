<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQQuoteAccept.aspx.cs" Inherits="BSE_INTEGRATION_RFQQuoteAccept" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>RFQ Quote Accept</title>

    <!-- ✅ Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">


    <!-- ✅ Bootstrap Bundle JS (Includes Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

 <!-- CSS --> <link href="../../css/Style_Bse/style.css" rel="stylesheet" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script>
        function showPopup() {
            var myModal = new bootstrap.Modal(document.getElementById("rfqPopup"));
            myModal.show();
            hideEmptyFields();
        }

        function hideEmptyFields() {
            $(".rfq-field").each(function () {
                if ($(this).find("span").text().trim() === "") {
                    $(this).hide(); // Hide row if value is empty
                } else {
                    $(this).show(); // Show row if value exists
                }
            });
        }
    </script>
       <%--  /* Custom Styling for the Form */--%>
      
    
    
</head>
<body>

                               <div class="d-flex justify-content-between align-items-center mb-4">
  <a href="Dashboard.aspx">
    <img src="https://bondsadda.com/img/logo.png" alt="Bondsadda Logo" class="sizelogo" />
</a>

  <h4 class="mb-0">RFQ QUOTE ACCEPT</h4>
</div>
   
<form id="form1" runat="server">
   <div class="container">

   <div class="card card-gold mb-4">
    <div class="card-header py-2">
        <h6 class="mb-0">
            <i class="bi bi-box-arrow-in-down me-2"></i>ORDER DETAILS
        </h6>

       </div>
    <div class="card-body px-4 py-3">
        <asp:Label ID="Label1" runat="server" CssClass="text-danger fw-bold mb-2 d-block"></asp:Label>

        <!-- Row 1 -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="txtRFQDealID" class="form-label fw-semibold">
                    <i class="bi bi-hash text-warning me-2"></i>RFQ Deal ID
                </label>
                <asp:TextBox ID="txtRFQDealID" runat="server" CssClass="form-control form-control-sm border-warning border-2"
                    placeholder="Enter RFQ Deal ID" AutoPostBack="True" OnTextChanged="txtISINNumber_TextChanged" />
            </div>

            <div class="col-md-6">
                <label for="txtRFQOrderNumber" class="form-label fw-semibold">
                    <i class="bi bi-receipt-cutoff text-warning me-2"></i>RFQ Order Number
                </label>
                <asp:TextBox ID="txtRFQOrderNumber" runat="server" CssClass="form-control form-control-sm border-warning border-2"
                    placeholder="Enter RFQ Order Number starting with 'R'" MaxLength="16" />
            </div>
        </div>

        <!-- Row 2 -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="ddlProduct" class="form-label fw-semibold">
                    <i class="bi bi-boxes text-warning me-2"></i>Product
                </label>
                <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-select form-select-sm border-warning border-2">
                    <asp:ListItem Text="ICDM" Value="ICDM" />
                    <asp:ListItem Text="GSEC" Value="GSEC" />
                    <asp:ListItem Text="CP" Value="CP" />
                    <asp:ListItem Text="CD" Value="CD" />
                </asp:DropDownList>
            </div>

            <div class="col-md-6">
                <label for="ddlQuoteType" class="form-label fw-semibold">
                    <i class="bi bi-arrow-left-right text-warning me-2"></i>Quote Type
                </label>
                <asp:DropDownList ID="ddlQuoteType" runat="server" CssClass="form-select form-select-sm border-warning border-2">
                    <asp:ListItem Text="--Select--" Value="" />
                    <asp:ListItem Text="BID" Value="BID" />
                    <asp:ListItem Text="OFFER" Value="OFFER" />
                </asp:DropDownList>
            </div>
        </div>

        <!-- Row 3 -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="txtISINNumber" class="form-label fw-semibold">
                    <i class="bi bi-upc text-warning me-2"></i>ISIN Number
                </label>
                <asp:TextBox ID="txtISINNumber" runat="server" CssClass="form-control form-control-sm border-warning border-2"
                    placeholder="Enter ISIN Number" MaxLength="12" />
            </div>

            <div class="col-md-6">
                <label for="txtValue" class="form-label fw-semibold">
                    <i class="bi bi-cash-coin text-warning me-2"></i>Value
                </label>
                <asp:TextBox ID="txtValue" runat="server" CssClass="form-control form-control-sm border-warning border-2"
                    placeholder="Enter Value" />
            </div>
        </div>

        <!-- Row 4 -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="txtProClientCode" class="form-label fw-semibold">
                    <i class="bi bi-person-check-fill text-warning me-2"></i>PRO/Client
                </label>
                <asp:DropDownList ID="txtProClientCode" runat="server" CssClass="form-select form-select-sm border-warning border-2">
                    <asp:ListItem Text="-- Select --" Value="" />
                    <asp:ListItem Text="PRO" Value="PRO" />
                    <asp:ListItem Text="CLIENT" Value="CLIENT" />
                </asp:DropDownList>
            </div>

            <div class="col-md-6">
                <label for="txtBuyerClientCode" class="form-label fw-semibold">
                    <i class="bi bi-person-badge text-warning me-2"></i>Buyer Client Code
                </label>
                <asp:TextBox ID="txtBuyerClientCode" runat="server" CssClass="form-control form-control-sm border-warning border-2"
                    placeholder="Enter Buyer Client Code" MaxLength="15" />
            </div>
        </div>

        <!-- Row 5 -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="txtSellerClientCode" class="form-label fw-semibold">
                    <i class="bi bi-person-video3 text-warning me-2"></i>Seller Client Code
                </label>
                <asp:TextBox ID="txtSellerClientCode" runat="server" CssClass="form-control form-control-sm border-warning border-2"
                    placeholder="Enter Seller Client Code" MaxLength="15" />
            </div>

            <div class="col-md-6">
                <label for="lblSellerBrokerCode" class="form-label fw-semibold">
                    <i class="bi bi-person-gear text-warning me-2"></i>Seller Broker Code
                </label>
                <asp:TextBox ID="lblSellerBrokerCode" runat="server" CssClass="form-control form-control-sm border-warning border-2"
                    placeholder="Enter Seller Broker Code" MaxLength="15" />
            </div>
        </div>
        </div>
       
         <div class="card card-gold mb-4">
  <div class="card-header py-2">
      <h6 class="mb-0">
          <i class="bi bi-box-arrow-in-down me-2"></i>OTHER DETAILS
      </h6>
  </div>

        <!-- Row 6 -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="txtBuyerBrokerCode" class="form-label fw-semibold">
                    <i class="bi bi-person-badge me-2 text-warning"></i>Buyer Broker Participant ID
                    <small class="text-muted">(Required if DirectBrokered is <strong>Brokered</strong> and Quote Type is <strong>BID</strong>)</small>
                </label>
                <asp:TextBox ID="txtBuyerBrokerCode" runat="server" CssClass="form-control form-control-sm border-warning border-2"
                    MaxLength="15" placeholder="Enter Buyer Broker Code" />
            </div>

            <div class="col-md-6">
                <label for="rblDirectBrokered" class="form-label fw-semibold">
                    <i class="bi bi-person-vcard text-warning me-2"></i>Direct/Brokered
                </label>
                <asp:RadioButtonList ID="rblDirectBrokered" runat="server" CssClass="form-control form-control-sm border-warning border-2">
                    <asp:ListItem Text="BROKERED" Value="BROKERED" />
                    <asp:ListItem Text="DIRECT" Value="DIRECT" />
                </asp:RadioButtonList>
            </div>
        </div>

        <!-- Row 7 -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="rblRFQQuoteAccept" class="form-label fw-semibold">
                    <i class="bi bi-patch-check text-warning me-2"></i>RFQ Quote Accept
                </label>
                <asp:RadioButtonList ID="rblRFQQuoteAccept" runat="server" CssClass="form-control form-control-sm border-warning border-2">
                    <asp:ListItem Text="ACCEPT" Value="ACCEPT" />
                    <asp:ListItem Text="REJECT" Value="REJECT" />
                </asp:RadioButtonList>
            </div>

            <div class="col-md-6">
                <label for="txtResponderComment" class="form-label fw-semibold">
                    <i class="bi bi-chat-text text-warning me-2"></i>Responder Comment
                </label>
                <asp:TextBox ID="txtResponderComment" runat="server" TextMode="MultiLine" Rows="4"
                    CssClass="form-control form-control-sm border-warning border-2" />
            </div>
        </div>

        <!-- Row 8 -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="txtResponderReferenceNumber" class="form-label fw-semibold">
                    <i class="bi bi-123 me-2 text-warning"></i>Responder Reference Number
                    <small class="text-muted">(Optional)</small>
                </label>
                <asp:TextBox ID="txtResponderReferenceNumber" runat="server" CssClass="form-control form-control-sm border-warning border-2"
                    MaxLength="50" placeholder="Enter responder reference number (optional)" />
            </div>

            <div class="col-md-6">
                <label for="lblUserType" class="form-label fw-semibold">
                    <i class="bi bi-people-fill text-warning me-2"></i>User Type
                </label>
                <asp:DropDownList ID="lblUserType" runat="server" CssClass="form-select form-select-sm border-warning border-2">
                    <asp:ListItem Text="Brokered" Value="BROKER" />
                    <asp:ListItem Text="Direct" Value="DIRECT" />
                </asp:DropDownList>
            </div>
        </div>
             
        <!-- Row 9 -->
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="ddlOBPPlatform" class="form-label fw-semibold">
                    <i class="bi bi-diagram-3 me-2 text-warning"></i>OBP Platform
                    <span class="text-danger">*</span>
                </label>
                <div class="input-group">
                    <span class="input-group-text bg-gold">
                        <i class="bi bi-diagram-3 text-white"></i>
                    </span>
                    <asp:DropDownList ID="ddlOBPPlatform" runat="server" CssClass="form-select form-select-sm border-warning border-2"
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="YES" Value="YES" />
                        <asp:ListItem Text="NO" Value="NO" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>
             
        <!-- Submit Button -->
        <div class="text-center mt-4">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-warning btn-lg px-5 mt-3" OnClick="btnSubmit_Click" />
        </div>
    </div>
</div>


        <!-- Success/Error Message -->
        <div class="row mt-3">
            <div class="col-md-6 offset-md-3 text-center">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-semibold"></asp:Label>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <asp:Panel ID="pnlRfqModal" runat="server" CssClass="modal fade" ClientIDMode="Static">
        <div class="modal-dialog modal-lg">
            <div class="modal-content shadow rounded">
                <div class="modal-header">
                    <h5 class="modal-title">RFQ Quote Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-striped">
                        <tbody>
                            <tr><th>RFQ Deal ID</th><td><asp:Label ID="rfqdealid" runat="server" /></td></tr>
                            <tr><th>RFQ Order Number</th><td><asp:Label ID="rfqordernumber" runat="server" /></td></tr>
                            <tr><th>Product</th><td><asp:Label ID="product" runat="server" /></td></tr>
                            <tr><th>User Type</th><td><asp:Label ID="usertype" runat="server" /></td></tr>
                            <tr><th>Quote Type</th><td><asp:Label ID="quotetype" runat="server" /></td></tr>
                            <tr><th>ISIN Number</th><td><asp:Label ID="isinnumber" runat="server" /></td></tr>
                            <tr><th>Value (₹)</th><td><asp:Label ID="value" runat="server" /></td></tr>
                            <tr><th>Pro Client</th><td><asp:Label ID="proclient" runat="server" /></td></tr>
                            <tr><th>Seller Client Code</th><td><asp:Label ID="sellerclientcode" runat="server" /></td></tr>
                            <tr><th>Direct Brokered</th><td><asp:Label ID="directbrokered" runat="server" /></td></tr>
                            <tr><th>Seller Broker Code</th><td><asp:Label ID="sellerbrokercode" runat="server" /></td></tr>
                            <tr><th>RFQ Quote Accept</th><td><asp:Label ID="rfqquoteaccept" runat="server" /></td></tr>
                        </tbody>
                    </table>
                </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnAcceptQuote" runat="server" CssClass="btn btn-success" Text="Accept Quote" OnClick="btnSubmit_Click" UseSubmitBehavior="false" />
                    <asp:Button ID="btnCloseQuote" runat="server" CssClass="btn btn-secondary" Text="Close" OnClick="btnCloseQuote_Click" OnClientClick="return closeModal();" />
                </div>
            </div>

        
    </asp:Panel>
</form>


           
       
</body>
</html>
