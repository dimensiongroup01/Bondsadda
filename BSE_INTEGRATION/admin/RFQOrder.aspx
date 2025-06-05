 
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQOrder.aspx.cs" Inherits="BSE_INTEGRATION_RFQOrder" Async="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>RFQ Order Entry</title>

    <!-- CSS -->
    <link href="../css/Style_Bse/style.css" rel="stylesheet" />
    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

     <script type="text/javascript" src=".../js/bse_i/rfq.js"></script>
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
     <!-- External JavaScript -->
 <script src="../js/bse_i/timepicker.js"></script>

    <style>
        .container{
            width:100;
            margin:0 auto;
        }
        .input-icon {
            position: relative;
        }
        
        .input-icon input {
            padding-left: 2.5rem;
        }
        
        .input-icon i {
            position: absolute;
            left: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            color: #f39c12; /* Gold Icon */
        }

        .form-control.border-warning {
            border-color: #f39c12; /* Gold Border */
        }

        .btn-warning {
            background-color: #f39c12; /* Gold Button */
            color: white;
        }

        .btn-warning:hover {
            background-color: #e67e22;
        }

        .form-label {
            color: #6c757d; /* Muted label color */
        }

    </style>

    <!-- ✅ Bootstrap JS (Required for Modals) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function showReceipt(responseData) {
            // Populate the receipt modal with response data
            document.getElementById("bidrfqordernumber").textContent = responseData.bidrfqordernumber;
            document.getElementById("isinnumber").textContent = responseData.isinnumber;
            document.getElementById("bidprice").textContent = responseData.bidprice.toFixed(2);
            document.getElementById("bidquantity").textContent = responseData.bidquantity;
            document.getElementById("bidvalue").textContent = responseData.bidvalue.toFixed(2);
            document.getElementById("bidyield").textContent = responseData.bidyield.toFixed(2);
            document.getElementById("settlementdate").textContent = responseData.settlementdate;
            document.getElementById("orderstatus").textContent = responseData.orderstatus;
            document.getElementById("message").textContent = responseData.message;

            // Show the modal
            let receiptModal = new bootstrap.Modal(document.getElementById('receiptModal'));
            receiptModal.show();
        }
        function downloadReceipt() {
            // Select the modal content (excluding close buttons)
            let receiptModal = document.getElementById("receiptModal");

            // Clone only the necessary parts (header + body)
            let receiptContent = receiptModal.querySelector(".modal-content").cloneNode(true);

            // Remove the close button from the cloned content
            receiptContent.querySelector(".btn-close").remove();

            // Create a printable area and add the cloned content
            let printableArea = document.createElement("div");
            printableArea.style.padding = "20px";
            printableArea.style.textAlign = "center";

            // Append the company logo and title
            printableArea.innerHTML = `
        <div style="text-align: center; margin-bottom: 10px;">
            <img src="/img/logo.png" alt="Company Logo" style="width: 350px; height: 60px; border-radius: 50%;">
            <h2 style="color: #007bff; margin-top: 10px;">Transaction Receipt</h2>
        </div>
    `;

            // Append the receipt details
            printableArea.appendChild(receiptContent);

            // Convert the content to PDF
            html2pdf()
                .from(printableArea)
                .set({
                    margin: 10,
                    filename: 'Transaction_Receipt.pdf',
                    image: { type: 'jpeg', quality: 0.98 },
                    html2canvas: { scale: 2 },
                    jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
                })
                .save();
        }
  
       
    </script>






    

   
    
      


    <!-- Custom JavaScript File -->
   
</head>


<body>
<form id="form1" runat="server">
    <div class="container p-4 bg-white shadow rounded mt-4 mb-5 border border-3 border-warning">

        <!-- Title -->
        <div class="mb-4 border-bottom pb-2 text-center">
            <h3 class="text-warning fw-bold"><i class="bi bi-pencil-square me-2"></i>RFQ Order Entry</h3>
        </div>
        <asp:Label ID="lblMessage" runat="server" Text="Status will appear here." ForeColor="Blue" Font-Bold="true" />
         <div class="col-md-4">
     <label class="form-label text-muted"><i class="bi bi-telephone me-2 text-warning"></i>
Customer Mobile no</label>
     <asp:TextBox ID="txtcustmob" runat="server" CssClass="form-control border-warning" />
 </div>
        <!-- Market Info -->
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label text-muted fw-semibold"><i class="bi bi-globe2 me-2 text-warning"></i>Market</label>
                <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-select">
                       <asp:ListItem Text="ICDM" Value="ICDM" />
                       <asp:ListItem Text="GSEC" Value="GSEC" />
                       <asp:ListItem Text="CP" Value="CP" />
                       <asp:ListItem Text="CD" Value="CD" />
                   </asp:DropDownList>
            </div>
            <div class="col-md-6">
                <label class="form-label  fw-semibold">
                    <i class="fa-solid fa-arrow-left-right me-2 text-warning"></i>Quote Type
                </label>
                <asp:DropDownList ID="ddlQuoteType" runat="server" CssClass="form-select">
                    <asp:ListItem Text="--Select--" Value="" />
                    <asp:ListItem Text="BID" Value="BID" />
                    <asp:ListItem Text="OFFER" Value="OFFER" />
                </asp:DropDownList>

            </div>
            <div class="col-md-4">
                <label class="form-label text-muted"><i class="bi bi-upc-scan me-2 text-warning"></i>ISIN Number</label>
                <asp:TextBox ID="txtISINNumber" runat="server" CssClass="form-control border-warning" />
            </div>
            <div class="col-md-6">
                <label class="form-label text-muted"><i class="bi bi-person-badge me-2 text-warning"></i>PRO/CLIENT</label>
                <asp:DropDownList ID="ddlProClient" runat="server" CssClass="form-select">
                       <asp:ListItem Value="PRO">PRO</asp:ListItem>
                       <asp:ListItem Value="CLIENT">CLIENT</asp:ListItem>
                   </asp:DropDownList>
            </div>
        </div>

        <!-- Bid and Offer Section -->
        <div class="row g-4 mt-4">
            <!-- BID -->
            <div class="col-md-6 border-end" id="bidSection">
                <h5 class="text-primary"><i class="bi bi-graph-up-arrow me-2"></i>Bid Parameters</h5>
                <label>Bid Value</label>
                <asp:TextBox ID="txtBidValue" runat="server" CssClass="form-control border-warning" TextMode="Number" />
                <label>Bid Min Value</label>
                <asp:TextBox ID="txtBidMinValue" runat="server" CssClass="form-control border-warning" TextMode="Number" />
                <label>Bid Yield Type</label>
                <asp:DropDownList ID="ddlBidYieldType" runat="server" CssClass="form-control">
                       <asp:ListItem Text="YTM" Value="YTM"></asp:ListItem>
                       <asp:ListItem Text="YTP" Value="YTP"></asp:ListItem>
                       <asp:ListItem Text="YTC" Value="YTC"></asp:ListItem>
                   </asp:DropDownList>
                <label>Bid Yield Value</label>
                <asp:TextBox ID="txtBidYieldValue" runat="server" CssClass="form-control border-warning" TextMode="Number" />
                <label>Bid Price</label>
                <asp:TextBox ID="txtBidPrice" runat="server" CssClass="form-control border-warning" />
            </div>

            <!-- OFFER -->
            <div class="col-md-6" id="offerSection" >
                <h5 class="text-danger"><i class="bi bi-graph-down-arrow me-2"></i>Offer Parameters</h5>
                <label>Offer Value</label>
                <asp:TextBox ID="txtOfferValue" runat="server" CssClass="form-control border-warning" TextMode="Number" />
                <label>Offer Min Value</label>
                <asp:TextBox ID="txtOfferMinValue" runat="server" CssClass="form-control border-warning" TextMode="Number" />
                <label>Offer Yield Type</label>
                <asp:DropDownList ID="ddlOfferYieldType" runat="server" CssClass="form-control">
                       <asp:ListItem Text="YTM" Value="YTM"></asp:ListItem>
                       <asp:ListItem Text="YTP" Value="YTP"></asp:ListItem>
                       <asp:ListItem Text="YTC" Value="YTC"></asp:ListItem>
                   </asp:DropDownList>
                <label>Offer Yield Value</label>
                <asp:TextBox ID="txtOfferYieldValue" runat="server" CssClass="form-control border-warning" />
                <label>Offer Price</label>
                <asp:TextBox ID="txtOfferPrice" runat="server" CssClass="form-control border-warning" />
            </div>
        </div>

        <!-- Validity & Deal Time -->
        <div class="row g-3 mt-4">
            <div class="col-md-6">
                <label><i class="bi bi-calendar-check me-2 text-warning"></i>Validity Time</label>
                <div class="form-check">
                    <asp:CheckBox ID="chkGFD" runat="server" CssClass="form-check-input border-warning" />
                    <label class="form-check-label ms-2">GFD</label>
                </div>
            </div>
            <div class="col-md-3">
                <label><i class="bi bi-clock me-2 text-warning"></i>Deal Time (Hours)</label>
                <asp:DropDownList ID="ddlDealTimeHours" runat="server" CssClass="form-select border-warning" />
            </div>
            <div class="col-md-3">
                <label><i class="bi bi-clock-history me-2 text-warning"></i>Deal Time (Minutes)</label>
                <asp:DropDownList ID="ddlDealTimeMinutes" runat="server" CssClass="form-select border-warning" />
            </div>
        </div>

        <!-- Other Details -->
        <div class="row g-3 mt-4">
            <div class="col-md-6">
                <label><i class="bi bi-arrows-move me-2 text-warning"></i>Negotiable</label>
                <asp:DropDownList ID="ddlNegotiableTag" runat="server" CssClass="form-control">
                       <asp:ListItem Text="YES" Value="YES"></asp:ListItem>
                       <asp:ListItem Text="NO" Value="NO"></asp:ListItem>
                   </asp:DropDownList>
                <label><i class="bi bi-hdd-network me-2 text-warning"></i>OBP Platform</label>
                 <asp:DropDownList ID="ddlObpPlatform" runat="server" CssClass="form-control">
                       <asp:ListItem Text="YES" Value="YES" />
                       <asp:ListItem Text="NO" Value="NO" />
                   </asp:DropDownList>
               <label><i class="bi bi-stars me-2 text-warning"></i>Rating</label>
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

               <label><i class="bi bi-building me-2 text-warning"></i>Rating Agency</label>
                <asp:DropDownList ID="ddlRatingAgency" runat="server" CssClass="form-select border-warning">
                    <asp:ListItem Text="Acuite Ratings & Research Limited " Value="ACUITE" />
                    <asp:ListItem Text="Brickwork Ratings" Value="BRICKWORK" />
                    <asp:ListItem Text="Care Rating" Value="CARE" />
                    <asp:ListItem Text="ICRA" Value="ICRA" />
                    <asp:ListItem Text="Infomerics" Value="INFOMERICS" />
                    <asp:ListItem Text="SOVEREIGN" Value="SOVEREIGN" />
                    <asp:ListItem Text="India Ratings" Value="INDIARATING" />
                </asp:DropDownList>

            </div>
            <div class="col-md-6">
                <label><i class="bi bi-person-check me-2 text-warning"></i>User Type</label>
                <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                       <asp:ListItem Text="BROKERED" Value="BROKERED"></asp:ListItem>
                       <asp:ListItem Text="DIRECT" Value="DIRECT"></asp:ListItem>
                   </asp:DropDownList>
                <div id="brokerNameContainer" style="display:none;">
                    <label><i class="bi bi-person-lines-fill me-2 text-warning"></i>Broker Name</label>
                    <asp:TextBox ID="txtBrokerName" runat="server" CssClass="form-control border-warning" />
                </div>
                <label><i class="bi bi-box-arrow-in-right me-2 text-warning"></i>Settlement Type</label>
                <asp:DropDownList ID="ddlSettleType" runat="server" CssClass="form-control">
                       <asp:ListItem Text="T+0" Value="0" />
                       <asp:ListItem Text="T+1" Value="1" />
                   </asp:DropDownList>
                <label><i class="bi bi-eye me-2 text-warning"></i>Disclosed Identity</label>
               <asp:DropDownList ID="ddlDisclosedIdentity" runat="server" CssClass="form-control">
                       <asp:ListItem Text="NO" Value="NO" />
                       <asp:ListItem Text="YES" Value="YES" />
                   </asp:DropDownList>
                <label><i class="bi bi-gear-fill me-2 text-warning"></i>OTO/MOTO</label>
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
    
</body>
</html>
