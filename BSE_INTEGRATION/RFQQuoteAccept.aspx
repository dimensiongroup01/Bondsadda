<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQQuoteAccept.aspx.cs" Inherits="BSE_INTEGRATION_RFQQuoteAccept" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>RFQ Quote Accept</title>

    <!-- ✅ Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- ✅ Bootstrap Bundle JS (Includes Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <link href="../css/Style_Bse/style.css" rel="stylesheet" />

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
  <%-- <form id="form1" runat="server" onsubmit="return validateForm()">--%>
    <form id="form1" runat="server" >
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
                    <asp:TextBox ID="txtRFQDealID" runat="server" CssClass="form-control" placeholder="Enter RFQ Deal ID" maxlength="15"
                        OnTextChanged="txtISINNumber_TextChanged" AutoPostBack="True" />
                </div>  


                    <div class="form-group">
                        <label for="rfqordernumber">RFQ Order Number:</label>
                        <asp:TextBox ID="txtRFQOrderNumber" runat="server" CssClass="form-control" placeholder="Enter RFQ Order Number starting with 'R'"  maxlength="16" />
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
                        <asp:TextBox ID="txtISINNumber" runat="server" CssClass="form-control" placeholder="Enter ISIN Number"  maxlength="12" />
                    </div>

                    <div class="form-group">
                        <label for="value">Value:</label>
                        <asp:TextBox ID="txtValue" runat="server" CssClass="form-control" placeholder="Enter Value"  />
                    </div>

                    <div class="form-group">
                        <label for="proclient">PRO Client Code:</label>
                        <asp:TextBox ID="txtProClientCode" runat="server" CssClass="form-control" placeholder="Enter PRO Client Code"  maxlength="6" />
                    </div>

                    <div class="form-group">
                        <label for="buyerclientcode">Buyer Client Code:</label>
                        <asp:TextBox ID="txtBuyerClientCode" runat="server" CssClass="form-control" placeholder="Enter Buyer Client Code"  maxlength="15" />
                    </div>

                    <div class="form-group">
                        <label for="sellerclientcode">Seller Client Code:</label>
                        <asp:TextBox ID="txtSellerClientCode" runat="server" CssClass="form-control" placeholder="Enter Seller Client Code"  maxlength="15" />
                    </div>
                    <div class="form-group">
                        <label for="sellerbrokercode">Seller Broker Code:</label>
                        <asp:TextBox ID="lblSellerBrokerCode" runat="server" CssClass="form-control" placeholder="Enter Seller Client Code"  maxlength="15" />
                    </div>

                    <div class="form-group">
                        <label>Direct Brokered:</label>
                        <asp:RadioButtonList ID="rblDirectBrokered" runat="server" CssClass="form-control">
                            <asp:ListItem Text="BROKERED" Value="BROKERED" />
                            <asp:ListItem Text="DIRECT" Value="DIRECT" />
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
                            <asp:ListItem Text="Brokered" >BROKER</asp:ListItem>
                            <asp:ListItem Text="Direct" >DIRECT</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                                <asp:Label ID="Label1" runat="server" CssClass="text-danger fw-bold"></asp:Label>

<span class="auto-style1"
                    <div class="form-group">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-custom" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>
                <!-- Success/Error Message -->
        <div class="row mt-3">
            <div class="col-md-6 offset-md-3 text-center">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>
            </div>
        </div>

            
                   

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
                        <tr><th>RFQ Deal ID</th><td><asp:Label ID="rfqdealid" runat="server" Text="" /></td></tr>
                        <tr><th>RFQ Order Number</th><td><asp:Label ID="rfqordernumber" runat="server" Text="" /></td></tr>
                        <tr><th>Product</th><td><asp:Label ID="product" runat="server" Text="" /></td></tr>
                        <tr><th>User Type</th><td><asp:Label ID="usertype" runat="server" Text="" /></td></tr>
                        <tr><th>Quote Type</th><td><asp:Label ID="quotetype" runat="server" Text="" /></td></tr>
                        <tr><th>ISIN Number</th><td><asp:Label ID="isinnumber" runat="server" Text="" /></td></tr>
                        <tr><th>Value (₹)</th><td><asp:Label ID="value" runat="server" Text="" /></td></tr>
                        <tr><th>Pro Client</th><td><asp:Label ID="proclient" runat="server" Text="" /></td></tr>
                        <tr><th>Seller Client Code</th><td><asp:Label ID="sellerclientcode" runat="server" Text="" /></td></tr>
                        <tr><th>Direct Brokered</th><td><asp:Label ID="directbrokered" runat="server" Text="" /></td></tr>
                        <tr><th>Seller Broker Code</th><td><asp:Label ID="sellerbrokercode" runat="server" Text="" /></td></tr>
                        <tr><th>RFQ Quote Accept</th><td><asp:Label ID="rfqquoteaccept" runat="server" Text="" /></td></tr>
                    </tbody>
                </table>
            </div>

            <div class="modal-footer">
                <asp:Button ID="btnAcceptQuote" runat="server" CssClass="btn btn-success" Text="Accept Quote" OnClick="btnAcceptQuote_Click" UseSubmitBehavior="false" />
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">Close</button>
            </div>
        </div>
    </div>
</asp:Panel>

</form>
           
       
</body>
</html>
