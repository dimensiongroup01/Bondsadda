<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQOrder.aspx.cs" Inherits="BSE_INTEGRATION_RFQOrder" Async="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>RFQ Order Entry</title>

    <!-- CSS -->
    <link href="../css/Style_Bse/style.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

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
    <script type="text/javascript" src="../js/bse_i/rfq.js"></script>
</head>


<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center">RFQ Order Entry</h2>
              
            <!-- Market and Quote Type Dropdowns -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label><b>Market:</b></label>
                    <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control">
                        <asp:ListItem Text="ICDM" Value="ICDM" />
                        <asp:ListItem Text="GSEC" Value="GSEC" />
                        <asp:ListItem Text="CP" Value="CP" />
                        <asp:ListItem Text="CD" Value="CD" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <label><b>Quote Type:</b></label>
                    <asp:DropDownList ID="ddlQuoteType" runat="server" CssClass="form-control"
                        AutoPostBack="false" data-clientid="<%= ddlQuoteType.ClientID %>">
                        <asp:ListItem Text="BID" Value="BID" />
                        <asp:ListItem Text="OFFER" Value="OFFER" />
                    </asp:DropDownList>
                </div>
                   
               <div class="col-md-6">
                     <label>ISIN Number</label>
                     <asp:TextBox ID="txtISINNumber" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
                
                </div>

                <div class="col-md-6">
                    <label>PRO/CLIENT</label>
                    <asp:DropDownList ID="ddlProClient" runat="server" CssClass="form-control">
                        <asp:ListItem Value="PRO">PRO</asp:ListItem>
                        <asp:ListItem Value="CLIENT">CLIENT</asp:ListItem>
      
                    </asp:DropDownList>
                </div>
            
            </div>

            <!-- Bid and Offer Fields -->
            <div class="row">
                <!-- Bid Parameters (Left) -->
                <div class="col-md-6 border-end">
                    <h4 class="text-center text-primary">Bid Parameters</h4>
                    
                    <label>Bid Value</label>
                    <asp:TextBox ID="txtBidValue" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>

                    <label>Bid Minimum Value:</label>
                    <asp:TextBox ID="txtBidMinValue" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>

                    <label>Bid Yield Type:</label>
                    <asp:DropDownList ID="ddlBidYieldType" runat="server" CssClass="form-control">
                        <asp:ListItem Text="YTM" Value="YTM"></asp:ListItem>
                        <asp:ListItem Text="YTP" Value="YTP"></asp:ListItem>
                        <asp:ListItem Text="YTC" Value="YTC"></asp:ListItem>
                    </asp:DropDownList>

                    <label>Bid Yield Value:</label>
                    <asp:TextBox ID="txtBidYieldValue" runat="server" CssClass="form-control" ></asp:TextBox>

                    <label>Bid Price</label>
                    <asp:TextBox ID="txtBidPrice" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>

                <!-- Offer Parameters (Right) -->
                <div class="col-md-6">
                    <h4 class="text-center text-danger">Offer Parameters</h4>

                    <label>Offer Value</label>
                    <asp:TextBox ID="txtOfferValue" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>

                    <label>Offer Minimum Value:</label>
                    <asp:TextBox ID="txtOfferMinValue" runat="server" CssClass="form-control" TextMode ="Number"></asp:TextBox>

                    <label>Offer Yield Type:</label>
                    <asp:DropDownList ID="ddlOfferYieldType" runat="server" CssClass="form-control">
                        <asp:ListItem Text="YTM" Value="YTM"></asp:ListItem>
                        <asp:ListItem Text="YTP" Value="YTP"></asp:ListItem>
                        <asp:ListItem Text="YTC" Value="YTC"></asp:ListItem>
                    </asp:DropDownList>

                    <label>Offer Yield Value:</label>
                    <asp:TextBox ID="txtOfferYieldValue" runat="server" CssClass="form-control" ></asp:TextBox>

                    <label>Offer Price</label>
                    <asp:TextBox ID="txtOfferPrice" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
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


            <!-- Other Fields Below -->
            <div class="row mt-4">
                <div class="col-md-6">

                     <label>Negotiable*</label>
                     <asp:DropDownList ID="ddlNegotiableTag" runat="server" ClientIDMode="Static" CssClass="form-control">

                     <asp:ListItem Text="YES" Value="YES"></asp:ListItem>
                     <asp:ListItem Text="NO" Value="NO"></asp:ListItem>
                    </asp:DropDownList>
                  
                    <label>OBP Platform:</label>
                     <asp:DropDownList ID="ddlObpPlatform" runat="server" CssClass="form-control">
                         <asp:ListItem Text="YES" Value="YES" />
                         <asp:ListItem Text="NO" Value="NO" />
                     </asp:DropDownList>

                    <label>Rating</label>
                    <asp:TextBox ID="txtRating" runat="server" CssClass="form-control"></asp:TextBox>

                    <label>Rating Agency</label>
                    <asp:TextBox ID="txtRatingAgency" runat="server" CssClass="form-control"></asp:TextBox>


               
                    
                 </div>
                    <div class="col-md-6">
                        <label>User Type *</label>
                        <asp:DropDownList ID="ddlUserType" runat="server" ClientIDMode="Static" CssClass="form-control">
                      
                        <asp:ListItem Text="BROKERED" Value="BROKERED"></asp:ListItem>
                        <asp:ListItem Text="DIRECT" Value="DIRECT"></asp:ListItem>
      
                    </asp:DropDownList>
               

                    <div class="col-md-6" id="brokerNameContainer" style="display: none;">
                        <label>Broker Name *</label>
                        <asp:TextBox ID="txtBrokerName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>


                   <label>Settlement Type:</label>
                    <asp:DropDownList ID="ddlSettleType" runat="server" CssClass="form-control">
                        <asp:ListItem Text="T+0" Value="0" />
                        <asp:ListItem Text="T+1" Value="1" />
                    </asp:DropDownList>

                   <label>Disclosed Identity:</label>
                     <asp:DropDownList ID="ddlDisclosedIdentity" runat="server" CssClass="form-control">
                         <asp:ListItem Text="NO" Value="NO" />
                         <asp:ListItem Text="YES" Value="YES" />
                     </asp:DropDownList>
                    
                   <label>OTO/MOTO</label>
                    <asp:DropDownList ID="ddlOtoOtm" runat="server" CssClass="form-control">
                        <asp:ListItem Value="OTO">OTO</asp:ListItem>
                        <asp:ListItem Value="OTM">OTM</asp:ListItem>
      
                    </asp:DropDownList>
                 
                </div>
            </div>

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


            <!-- Submit Button -->
            <div class="text-center mt-4">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>
