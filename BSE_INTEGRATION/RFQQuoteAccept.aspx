<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQQuoteAccept.aspx.cs" Inherits="BSE_INTEGRATION_RFQQuoteAccept" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RFQ Quote Accept</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap Bundle JS (Includes Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // JavaScript Validation
        function validateForm() {
            let isValid = true;

            // Validate RFQ Deal ID (Length = 15, Required)
            let rfqDealID = document.getElementById('txtRFQDealID').value;
            if (rfqDealID.length !== 15) {
                alert('RFQ Deal ID must be 15 characters.');
                isValid = false;
            }

            // Validate RFQ Order Number (Length = 16, Starts with "R", Required)
            let rfqOrderNumber = document.getElementById('txtRFQOrderNumber').value;
            if (rfqOrderNumber.length !== 16 || rfqOrderNumber.charAt(0) !== 'R') {
                alert('RFQ Order Number must be 16 characters and start with "R".');
                isValid = false;
            }

            // Validate ISIN Number (Length = 12, Required)
            let isinNumber = document.getElementById('txtISINNumber').value;
            if (isinNumber.length !== 12) {
                alert('ISIN Number must be 12 characters.');
                isValid = false;
            }

            // Validate Value (Must be numeric, greater than or equal to min value, and in multiple of 100)
            let value = document.getElementById('txtValue').value;
            let minValue = 1000; // Assuming minimum value is 1000
            if (isNaN(value) || value < minValue || value % 100 !== 0) {
                alert('Value must be a number greater than or equal to ' + minValue + ' and in multiples of 100.');
                isValid = false;
            }

            // Validate Direct Brokered (if Brokered and Quote Type is OFFER/BID)
            let directBrokered = document.querySelector('input[name="rblDirectBrokered"]:checked');
            let quoteType = document.getElementById('ddlQuoteType').value;
            if (directBrokered && directBrokered.value === "YES" && quoteType === 'OFFER') {
                let sellerBrokerCode = document.getElementById('txtSellerBrokerCode').value;
                if (sellerBrokerCode.length !== 15) {
                    alert('Seller Broker Code is required when Direct Brokered is YES and Quote Type is OFFER.');
                    isValid = false;
                }
            }
            if (directBrokered && directBrokered.value === "YES" && quoteType === 'BID') {
                let buyerBrokerCode = document.getElementById('txtBuyerBrokerCode').value;
                if (buyerBrokerCode.length !== 15) {
                    alert('Buyer Broker Code is required when Direct Brokered is YES and Quote Type is BID.');
                    isValid = false;
                }
            }

            return isValid;
        }
    </script>

    <style>
        /* Custom Styling for the Form */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            padding-top: 20px;
        }

        .container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 20px;
        }

        h2 {
            font-size: 1.5rem;
            font-weight: 600;
            color: #343a40;
        }

        .nav-tabs {
            border-bottom: 2px solid #007bff;
        }

        .nav-tabs .nav-link {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 10px 15px;
            font-size: 1rem;
            color: #007bff;
            background-color: #f8f9fa;
        }

        .nav-tabs .nav-link.active {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }

        .tab-content {
            padding-top: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            color: #495057;
        }

        .form-control {
            font-size: 14px;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            border: none;
            padding: 10px 20px;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm()">
        <div class="container">
            <h2>RFQ Quote Accept</h2>

            <!-- Navigation Tabs -->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="rfq-details-tab" data-bs-toggle="tab" href="#rfq-details" role="tab" aria-controls="rfq-details" aria-selected="true">RFQ Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="quote-acceptance-tab" data-bs-toggle="tab" href="#quote-acceptance" role="tab" aria-controls="quote-acceptance" aria-selected="false">Quote Acceptance</a>
                </li>
            </ul>

            <div class="tab-content mt-3">
                <!-- RFQ Details Tab -->
                <div class="tab-pane fade show active" id="rfq-details" role="tabpanel" aria-labelledby="rfq-details-tab">
                    <div class="form-group">
                        <label for="rfqdealid">RFQ Deal ID:</label>
                        <asp:TextBox ID="txtRFQDealID" runat="server" CssClass="form-control" placeholder="Enter RFQ Deal ID" required maxlength="15" />
                    </div>

                    <div class="form-group">
                        <label for="rfqordernumber">RFQ Order Number:</label>
                        <asp:TextBox ID="txtRFQOrderNumber" runat="server" CssClass="form-control" placeholder="Enter RFQ Order Number starting with 'R'" required maxlength="16" />
                    </div>

                    <div class="form-group">
                        <label for="product">Product:</label>
                        <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control">
                            <asp:ListItem Text="ICDM" Value="ICDM" />
                            <asp:ListItem Text="GSEC" Value="GSEC" />
                            <asp:ListItem Text="CP" Value="CP" />
                            <asp:ListItem Text="CD" Value="CD" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="quotetype">Quote Type:</label>
                        <asp:DropDownList ID="ddlQuoteType" runat="server" CssClass="form-control">
                            <asp:ListItem Text="BID" Value="BID" />
                            <asp:ListItem Text="OFFER" Value="OFFER" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="isinnumber">ISIN Number:</label>
                        <asp:TextBox ID="txtISINNumber" runat="server" CssClass="form-control" placeholder="Enter ISIN Number" required maxlength="12" />
                    </div>

                    <div class="form-group">
                        <label for="value">Value:</label>
                        <asp:TextBox ID="txtValue" runat="server" CssClass="form-control" placeholder="Enter Value" required />
                    </div>

                    <div class="form-group">
                        <label for="proclient">PRO Client Code:</label>
                        <asp:TextBox ID="txtProClientCode" runat="server" CssClass="form-control" placeholder="Enter PRO Client Code" required maxlength="6" />
                    </div>

                    <div class="form-group">
                        <label for="buyerclientcode">Buyer Client Code:</label>
                        <asp:TextBox ID="txtBuyerClientCode" runat="server" CssClass="form-control" placeholder="Enter Buyer Client Code" required maxlength="15" />
                    </div>

                    <div class="form-group">
                        <label for="sellerclientcode">Seller Client Code:</label>
                        <asp:TextBox ID="txtSellerClientCode" runat="server" CssClass="form-control" placeholder="Enter Seller Client Code" required maxlength="15" />
                    </div>
                    <div class="form-group">
                        <label for="sellerbrokercode">Seller Broker Code:</label>
                        <asp:TextBox ID="lblSellerBrokerCode" runat="server" CssClass="form-control" placeholder="Enter Seller Client Code" required maxlength="15" />
                    </div>

                    <div class="form-group">
                        <label>Direct Brokered:</label>
                        <asp:RadioButtonList ID="rblDirectBrokered" runat="server" CssClass="form-control">
                            <asp:ListItem Text="YES" Value="YES" />
                            <asp:ListItem Text="NO" Value="NO" />
                        </asp:RadioButtonList>
                    </div>
                </div>
                 
                <!-- Quote Acceptance Tab -->
                <div class="tab-pane fade" id="quote-acceptance" role="tabpanel" aria-labelledby="quote-acceptance-tab">
                    <div class="form-group">
                        <label for="rfqquoteaccept">RFQ Quote Accept:</label>
                        <asp:RadioButtonList ID="rblRFQQuoteAccept" runat="server" CssClass="form-control">
                            <asp:ListItem Text="ACCEPT" Value="ACCEPT" />
                            <asp:ListItem Text="REJECT" Value="REJECT" />
                        </asp:RadioButtonList>
                    </div>


                    <div class="form-group">
                        <label for="respondercomment">Responder Comment:</label>
                        <asp:TextBox ID="txtResponderComment" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                    </div>
                    <div class="form-group">
                        <label for="usertype">UserType</label>
                        <asp:DropDownList ID="lblUserType" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Brokered" >Brokered</asp:ListItem>
                            <asp:ListItem Text="Directs" >Direct</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>

<span class="auto-style1"
                    <div class="form-group">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-custom" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>