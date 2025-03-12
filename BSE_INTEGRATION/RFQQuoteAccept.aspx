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
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center">RFQ Quote Accept</h2>

            <!-- Enter ISIN Number -->
            <div class="row mt-4">
                <div class="col-md-6 offset-md-3">
                    <label for="txtISINNumber" class="form-label"><b>Enter ISIN Number:</b></label>
                    <asp:TextBox ID="txtISINNumber" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtISINNumber_TextChanged"></asp:TextBox>
                </div>
            </div>

            <!-- Show Details Button -->
            <div class="row mt-4">
                <div class="col-md-6 offset-md-3 text-center">
                    <asp:Button ID="btnShowPopup" runat="server" CssClass="btn btn-info" Text="Show Quote Details" OnClientClick="showPopup(); return false;" />
                </div>
            </div>

            <!-- Bootstrap Modal for RFQ Quote Details -->
            <div class="modal fade" id="rfqPopup" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">RFQ Quote Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr class="rfq-field"><th>RFQ Deal ID</th><td><span id="rfqdealid" runat="server"></span></td></tr>
                                    <tr class="rfq-field"><th>RFQ Order Number</th><td><span id="rfqordernumber" runat="server"></span></td></tr>
                                    <tr class="rfq-field"><th>Product</th><td><span id="product" runat="server"></span></td></tr>
                                    <tr class="rfq-field"><th>User Type</th><td><span id="usertype" runat="server"></span></td></tr>
                                    <tr class="rfq-field"><th>Quote Type</th><td><span id="quotetype" runat="server"></span></td></tr>
                                    <tr class="rfq-field"><th>ISIN Number</th><td><span id="isinnumber" runat="server"></span></td></tr>
                                    <tr class="rfq-field"><th>Value (₹)</th><td><span id="value" runat="server"></span></td></tr>
                                    <tr class="rfq-field"><th>Pro Client</th><td><span id="proclient" runat="server"></span></td></tr>
                                    <tr class="rfq-field"><th>Seller Client Code</th><td><span id="sellerclientcode" runat="server"></span></td></tr>
                                    <tr class="rfq-field"><th>Direct Brokered</th><td><span id="directbrokered" runat="server"></span></td></tr>
                                    <tr class="rfq-field"><th>Seller Broker Code</th><td><span id="sellerbrokercode" runat="server"></span></td></tr>
                                    <tr class="rfq-field"><th>RFQ Quote Accept</th><td><span id="rfqquoteaccept" runat="server"></span></td></tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnAcceptQuote" runat="server" CssClass="btn btn-success" Text="Accept Quote" OnClick="btnAcceptQuote_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
        </div>
    </form>
</body>
</html>
