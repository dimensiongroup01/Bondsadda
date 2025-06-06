 
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQOrder.aspx.cs" Inherits="BSE_INTEGRATION_RFQOrder" Async="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>RFQ Order Entry</title>

    <!-- CSS -->
    <link href="../../css/Style_Bse/style.css" rel="stylesheet" />
    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

     <script type="text/javascript" src="../../js/bse_i/rfq.js"></script>
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
     <!-- External JavaScript -->
 <script src="../../js/bse_i/timepicker.js"></script>

   
     <!-- Custom JavaScript File -->
 <script type="text/javascript" src="../js/bse_i/rfq.js"></script>
    <!-- ✅ Bootstrap JS (Required for Modals) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  



    

    <!-- Custom JavaScript File -->
   
</head>


<body>
<div class="container">
                               <div class="d-flex justify-content-between align-items-center mb-4">
  <a href="Dashboard.aspx">
    <img src="https://bondsadda.com/img/logo.png" alt="Bondsadda Logo" class="sizelogo" />
</a>

  <h4 class="mb-0">RFQ Order</h4>
</div>
   
<form id="form1" runat="server">
   <div class="container">

    <!-- ICDM Order Entry Card -->
    <div class="card border border-warning shadow-sm">
        <div class="card-header py-2 bg-warning bg-gradient">
            <h6 class="mb-0 text-dark fw-bold"><i class="fas fa-file-invoice me-2"></i>ICDM Order Entry</h6>
        </div>

        <div class="card-body px-4 py-3">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold mb-2 d-block"></asp:Label>

            <!-- Row 1 -->
            <div class="row mb-3">
                <!-- Customer Mobile no -->
                <div class="col-md-4 d-flex align-items-center">
                    <label for="txtcustmob" class="col-5 col-form-label text-end pe-2">
                        <i class="bi bi-telephone-fill me-1"></i>Customer Mobile no
                    </label>
                    <div class="col-7">
                        <asp:TextBox ID="txtcustmob" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                    </div>
                </div>

                <!-- Product -->
                <div class="col-md-4 d-flex align-items-center">
                    <label for="ddlProduct" class="col-5 col-form-label text-end pe-2">
                        <i class="bi bi-globe2 me-1"></i>Product
                    </label>
                    <div class="col-7">
                        <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-select form-select-sm border-warning border-2">
                            <asp:ListItem Text="ICDM" Value="ICDM" />
                            <asp:ListItem Text="GSEC" Value="GSEC" />
                            <asp:ListItem Text="CP" Value="CP" />
                            <asp:ListItem Text="CD" Value="CD" />
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Quote Type -->
                <div class="col-md-4 d-flex align-items-center">
                    <label for="ddlQuoteType" class="col-5 col-form-label text-end pe-2">
                        <i class="bi bi-arrow-left-right me-1"></i>Quote Type
                    </label>
                    <div class="col-7">
                        <asp:DropDownList ID="ddlQuoteType" runat="server" CssClass="form-select form-select-sm border-warning border-2">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="BID" Value="BID" />
                            <asp:ListItem Text="OFFER" Value="OFFER" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <!-- Row 2 -->
            <div class="row mb-3">
                <!-- ISIN Number -->
                <div class="col-md-4 d-flex align-items-center">
                    <label for="txtISINNumber" class="col-5 col-form-label text-end pe-2">
                        <i class="bi bi-upc-scan me-1"></i>ISIN Number
                    </label>
                    <div class="col-7">
                        <asp:TextBox ID="txtISINNumber" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                    </div>
                </div>

                <!-- PRO/CLIENT -->
                <div class="col-md-4 d-flex align-items-center">
                    <label for="ddlProClient" class="col-5 col-form-label text-end pe-2">
                        <i class="bi bi-person-badge me-1"></i>PRO/CLIENT
                    </label>
                    <div class="col-7">
                        <asp:DropDownList ID="ddlProClient" runat="server" CssClass="form-select form-select-sm border-warning border-2">
                            <asp:ListItem Value="PRO">PRO</asp:ListItem>
                            <asp:ListItem Value="CLIENT">CLIENT</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Example Field -->
                <div class="col-md-4 d-flex align-items-center">
                    <label for="txtExample" class="col-5 col-form-label text-end pe-2">
                        <i class="bi bi-cash-coin me-1"></i>Example Field
                    </label>
                    <div class="col-7">
                        <asp:TextBox ID="txtExample" runat="server" CssClass="form-control form-control-sm border-warning border-2" placeholder="Enter Value" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bid & Offer Section -->
    <div class="card border border-warning shadow-sm mt-4">
        <div class="card-header py-2 bg-warning bg-gradient">
            <h6 class="mb-0 text-dark fw-bold"><i class="fas fa-scale-balanced me-2"></i>Bid & Offer Parameters</h6>
        </div>

        <div class="card-body px-4 py-3">
            <div class="row">

                <!-- Bid Section -->
                <div class="col-md-6 border-end pe-md-4">
                    <h5 class="text-primary mb-3"><i class="bi bi-graph-up-arrow me-2"></i>Bid Parameters</h5>

                    <div class="mb-3 row">
                        <label for="txtBidValue" class="col-5 col-form-label text-end pe-2">
                            <i class="bi bi-currency-rupee me-1"></i>Bid Value
                        </label>
                        <div class="col-7">
                            <asp:TextBox ID="txtBidValue" runat="server" CssClass="form-control form-control-sm border-warning border-2" TextMode="Number" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="txtBidMinValue" class="col-5 col-form-label text-end pe-2">
                            <i class="bi bi-arrow-down-short me-1"></i>Bid Min Value
                        </label>
                        <div class="col-7">
                            <asp:TextBox ID="txtBidMinValue" runat="server" CssClass="form-control form-control-sm border-warning border-2" TextMode="Number" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="ddlBidYieldType" class="col-5 col-form-label text-end pe-2">
                            <i class="bi bi-percent me-1"></i>Yield Type
                        </label>
                        <div class="col-7">
                            <asp:DropDownList ID="ddlBidYieldType" runat="server" CssClass="form-select form-select-sm border-warning border-2">
                                <asp:ListItem Text="YTM" Value="YTM" />
                                <asp:ListItem Text="YTP" Value="YTP" />
                                <asp:ListItem Text="YTC" Value="YTC" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="txtBidYieldValue" class="col-5 col-form-label text-end pe-2">
                            <i class="bi bi-graph-up me-1"></i>Yield Value
                        </label>
                        <div class="col-7">
                            <asp:TextBox ID="txtBidYieldValue" runat="server" CssClass="form-control form-control-sm border-warning border-2" TextMode="Number" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="txtBidPrice" class="col-5 col-form-label text-end pe-2">
                            <i class="bi bi-tags me-1"></i>Bid Price
                        </label>
                        <div class="col-7">
                            <asp:TextBox ID="txtBidPrice" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                        </div>
                    </div>
                </div>

                <!-- Offer Section -->
                <div class="col-md-6 ps-md-4">
                    <h5 class="text-danger mb-3"><i class="bi bi-graph-down-arrow me-2"></i>Offer Parameters</h5>

                    <div class="mb-3 row">
                        <label for="txtOfferValue" class="col-5 col-form-label text-end pe-2">
                            <i class="bi bi-currency-rupee me-1"></i>Offer Value
                        </label>
                        <div class="col-7">
                            <asp:TextBox ID="txtOfferValue" runat="server" CssClass="form-control form-control-sm border-warning border-2" TextMode="Number" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="txtOfferMinValue" class="col-5 col-form-label text-end pe-2">
                            <i class="bi bi-arrow-down-short me-1"></i>Offer Min Value
                        </label>
                        <div class="col-7">
                            <asp:TextBox ID="txtOfferMinValue" runat="server" CssClass="form-control form-control-sm border-warning border-2" TextMode="Number" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="ddlOfferYieldType" class="col-5 col-form-label text-end pe-2">
                            <i class="bi bi-percent me-1"></i>Yield Type
                        </label>
                        <div class="col-7">
                            <asp:DropDownList ID="ddlOfferYieldType" runat="server" CssClass="form-select form-select-sm border-warning border-2">
                                <asp:ListItem Text="YTM" Value="YTM" />
                                <asp:ListItem Text="YTP" Value="YTP" />
                                <asp:ListItem Text="YTC" Value="YTC" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="txtOfferYieldValue" class="col-5 col-form-label text-end pe-2">
                            <i class="bi bi-graph-down me-1"></i>Yield Value
                        </label>
                        <div class="col-7">
                            <asp:TextBox ID="txtOfferYieldValue" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="txtOfferPrice" class="col-5 col-form-label text-end pe-2">
                            <i class="bi bi-tags me-1"></i>Offer Price
                        </label>
                        <div class="col-7">
                            <asp:TextBox ID="txtOfferPrice" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>


     <div class="container">
            <div class="card">
       <div class="card-header py-2">
           <h6 class="mb-0"><i class="fas fa-stopwatch me-2"></i>Validity & Deal Time</h6>
       </div>
       <div class="card-body px-4 py-3">
           <div class="row mb-3 align-items-center">
               <div class="col-md-6">
                   <div class="row">
                       <label class="col-5 col-form-label text-end pe-2" for="<%= chkGFD.ClientID %>">
                           <i class="fas fa-calendar-check text-warning me-1"></i>Validity Time
                       </label>
                       <div class="col-7 d-flex align-items-center">
                           <asp:CheckBox ID="chkGFD" runat="server" CssClass="form-check-input border-warning me-2" />
                           <label class="form-check-label" for="<%= chkGFD.ClientID %>">GFD</label>
                       </div>
                   </div>
               </div>
               <div class="col-md-3">
                   <div class="row">
                       <label for="<%= ddlDealTimeHours.ClientID %>" class="col-5 col-form-label text-end pe-2">
                           <i class="fas fa-clock text-warning me-1"></i>Hours
                       </label>
                       <div class="col-7">
                           <asp:DropDownList ID="ddlDealTimeHours" runat="server" CssClass="form-select form-select-sm border-warning" />
                       </div>
                   </div>
               </div>
               <div class="col-md-3">
                   <div class="row">
                       <label for="<%= ddlDealTimeMinutes.ClientID %>" class="col-5 col-form-label text-end pe-2">
                           <i class="fas fa-clock text-warning me-1"></i>Minutes
                       </label>
                       <div class="col-7">
                           <asp:DropDownList ID="ddlDealTimeMinutes" runat="server" CssClass="form-select form-select-sm border-warning" />
                       </div>
                   </div>
               </div>
           </div>

           <!-- Other Details -->
           <div class="row g-3 mt-4">
               <div class="col-md-6">
                   <label for="<%= ddlNegotiableTag.ClientID %>" class="form-label d-block">
                       <i class="bi bi-arrows-move me-2 text-warning"></i>Negotiable
                   </label>
                   <asp:DropDownList ID="ddlNegotiableTag" runat="server" CssClass="form-control">
                       <asp:ListItem Text="YES" Value="YES" />
                       <asp:ListItem Text="NO" Value="NO" />
                   </asp:DropDownList>

                   <label for="<%= ddlObpPlatform.ClientID %>" class="form-label d-block mt-3">
                       <i class="bi bi-hdd-network me-2 text-warning"></i>OBP Platform
                   </label>
                   <asp:DropDownList ID="ddlObpPlatform" runat="server" CssClass="form-control">
                       <asp:ListItem Text="YES" Value="YES" />
                       <asp:ListItem Text="NO" Value="NO" />
                   </asp:DropDownList>

                   <label for="<%= txtRating.ClientID %>" class="form-label d-block mt-3">
                       <i class="bi bi-stars me-2 text-warning"></i>Rating
                   </label>
                   <asp:DropDownList ID="txtRating" runat="server" CssClass="form-select border-warning">
                       <asp:ListItem Text="AAA" Value="AAA" />
                       <asp:ListItem Text="AA+" Value="AA+" />
                       <asp:ListItem Text="AA" Value="AA" />
                       <asp:ListItem Text="AA-" Value="AA-" />
                       <asp:ListItem Text="A+" Value="A+" />
                       <asp:ListItem Text="A" Value="A" />
                       <asp:ListItem Text="A-" Value="A-" />
                       <asp:ListItem Text="BBB+" Value="BBB+" />
                       <asp:ListItem Text="BBB" Value="BBB" />
                       <asp:ListItem Text="BBB-" Value="BBB-" />
                       <asp:ListItem Text="BB+" Value="BB+" />
                       <asp:ListItem Text="BB" Value="BB" />
                       <asp:ListItem Text="BB-" Value="BB-" />
                       <asp:ListItem Text="B+" Value="B+" />
                       <asp:ListItem Text="B" Value="B" />
                       <asp:ListItem Text="B-" Value="B-" />
                       <asp:ListItem Text="C+" Value="C+" />
                       <asp:ListItem Text="C" Value="C" />
                       <asp:ListItem Text="C-" Value="C-" />
                       <asp:ListItem Text="SOVEREIGN" Value="SOVEREIGN" />
                   </asp:DropDownList>

                   <label for="<%= ddlRatingAgency.ClientID %>" class="form-label d-block mt-3">
                       <i class="bi bi-building me-2 text-warning"></i>Rating Agency
                   </label>
                   <asp:DropDownList ID="ddlRatingAgency" runat="server" CssClass="form-select border-warning">
                       <asp:ListItem Text="Acuite Ratings & Research Limited" Value="ACUITE" />
                       <asp:ListItem Text="Brickwork Ratings" Value="BRICKWORK" />
                       <asp:ListItem Text="Care Rating" Value="CARE" />
                       <asp:ListItem Text="ICRA" Value="ICRA" />
                       <asp:ListItem Text="Infomerics" Value="INFOMERICS" />
                       <asp:ListItem Text="SOVEREIGN" Value="SOVEREIGN" />
                       <asp:ListItem Text="India Ratings" Value="INDIARATING" />
                   </asp:DropDownList>
               </div>

               <div class="col-md-6">
                   <label for="<%= ddlUserType.ClientID %>" class="form-label d-block">
                       <i class="bi bi-person-check me-2 text-warning"></i>User Type
                   </label>
                   <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                       <asp:ListItem Text="BROKERED" Value="BROKERED" />
                       <asp:ListItem Text="DIRECT" Value="DIRECT" />
                   </asp:DropDownList>

                   <div id="brokerNameContainer" style="display:none;">
                       <label for="<%= txtBrokerName.ClientID %>" class="form-label d-block mt-3">
                           <i class="bi bi-person-lines-fill me-2 text-warning"></i>Broker Name
                       </label>
                       <asp:TextBox ID="txtBrokerName" runat="server" CssClass="form-control border-warning" />
                   </div>

                   <label for="<%= ddlSettleType.ClientID %>" class="form-label d-block mt-3">
                       <i class="bi bi-box-arrow-in-right me-2 text-warning"></i>Settlement Type
                   </label>
                   <asp:DropDownList ID="ddlSettleType" runat="server" CssClass="form-control">
                       <asp:ListItem Text="T+0" Value="0" />
                       <asp:ListItem Text="T+1" Value="1" />
                   </asp:DropDownList>

                   <label for="<%= ddlDisclosedIdentity.ClientID %>" class="form-label d-block mt-3">
                       <i class="bi bi-eye me-2 text-warning"></i>Disclosed Identity
                   </label>
                   <asp:DropDownList ID="ddlDisclosedIdentity" runat="server" CssClass="form-control">
                       <asp:ListItem Text="NO" Value="NO" />
                       <asp:ListItem Text="YES" Value="YES" />
                   </asp:DropDownList>

                   <label for="<%= ddlOtoOtm.ClientID %>" class="form-label d-block mt-3">
                       <i class="bi bi-gear-fill me-2 text-warning"></i>OTO/MOTO
                   </label>
                   <asp:DropDownList ID="ddlOtoOtm" runat="server" CssClass="form-control">
                       <asp:ListItem Value="OTO">OTO</asp:ListItem>
                       <asp:ListItem Value="OTM">OTM</asp:ListItem>
                   </asp:DropDownList>
               </div>
           </div>

           <!-- Submit Button -->
           <div class="text-center mt-4">
               <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-warning px-4 text-dark fw-bold" Text="Submit" OnClick="btnSubmit_Click" />
           </div>    
      </div>
</form>
   <!-- Bootstrap Modal for Receipt -->
      
          <div class="modal fade" id="receiptModal" tabindex="-1" aria-labelledby="receiptModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
             <div class="modal-content shadow-lg rounded">
         
                 <!-- Modal Header with Logo & Title -->
                 <div class="modal-header bg-primary text-white d-flex align-items-center">
                     <img src="/img/logo.png" alt="Company Logo"  style="width: 350px; height: 60px;">
                    
                     <button type="button" class="btn-close ms-auto" data-bs-dismiss="modal" aria-label="Close"></button>
                 </div>

                 <!-- Modal Body with Receipt Details -->
                 <div class="modal-body p-4">
                     <div class="text-center">
                         <h4 class="fw-bold text-primary">Transaction Receipt</h4>
                         <p class="text-muted">Thank you for your transaction!</p>
                     </div>
                     <hr>

                     <!-- Transaction Details -->
                     <div class="row">
                         <div class="col-md-6">
                             <p><strong>Bid RFQ Order No:</strong> <span id="bidrfqordernumber"></span></p>
                             <p><strong>ISIN Number:</strong> <span id="isinnumber"></span></p>
                             <p><strong>Bid Price:</strong> ₹<span id="bidprice"></span></p>
                             <p><strong>Bid Quantity:</strong> <span id="bidquantity"></span></p>
                         </div>
                         <div class="col-md-6">
                             <p><strong>Bid Value:</strong> ₹<span id="bidvalue"></span></p>
                             <p><strong>Bid Yield:</strong> <span id="bidyield"></span>%</p>
                             <p><strong>Settlement Date:</strong> <span id="settlementdate"></span></p>
                             <p><strong>Order Status:</strong> <span id="orderstatus"></span></p>
                         </div>
                     </div>

                     <!-- Message -->
                     <div class="text-center mt-3">
                         <p class="fw-bold text-success" id="message"></p>
                     </div>
                 </div>

                 <!-- Footer with Buttons -->
                 <div class="modal-footer d-flex justify-content-between">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                         <i class="fas fa-times"></i> Close
                     </button>
                     <button type="button" class="btn btn-primary" onclick="downloadReceipt()">
                         <i class="fas fa-download"></i> Download
                     </button>
                 </div>

             </div>
         </div>
     </div>
    
</div>
                        
</body>
</html>
