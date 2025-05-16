<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQApprove.aspx.cs" Inherits="BSE_INTEGRATION_RFQApprove" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <!-- Nav Tabs for Form Sections -->
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="product-info-tab" data-toggle="tab" href="#product-info" role="tab" aria-controls="product-info" aria-selected="true">Product Info</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="client-info-tab" data-toggle="tab" href="#client-info" role="tab" aria-controls="client-info" aria-selected="false">Client Info</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="bank-info-tab" data-toggle="tab" href="#bank-info" role="tab" aria-controls="bank-info" aria-selected="false">Bank Info</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="freeze-info-tab" data-toggle="tab" href="#freeze-info" role="tab" aria-controls="freeze-info" aria-selected="false">Freeze Info</a>
        </li>
    </ul>

    <div class="tab-content" id="myTabContent">
        <!-- Product Info Tab -->
        <div class="tab-pane fade show active" id="product-info" role="tabpanel" aria-labelledby="product-info-tab">
            <form id="productForm" runat="server" method="post">
                <div class="form-group">
                    <label for="product">Product (ICDM/GSEC):</label>
                    <input type="text" class="form-control" id="product" name="product" required maxlength="5" placeholder="Enter product">
                </div>

                <div class="form-group">
                    <label for="usertype">User Type (BROKER):</label>
                    <input type="text" class="form-control" id="usertype" name="usertype" required maxlength="11" placeholder="Enter user type">
                </div>

                <div class="form-group">
                    <label for="isinnumber">ISIN Number:</label>
                    <input type="text" class="form-control" id="isinnumber" name="isinnumber" required maxlength="12" placeholder="Enter ISIN number">
                </div>

                <div class="form-group">
                    <label for="rfqdealid">RFQ Deal ID:</label>
                    <input type="text" class="form-control" id="rfqdealid" name="rfqdealid" required maxlength="15" placeholder="Enter RFQ Deal ID">
                </div>

                <div class="form-group">
                    <label for="icdmordernumber">ICDM Order Number:</label>
                    <input type="text" class="form-control" id="icdmordernumber" name="icdmordernumber" required maxlength="15" placeholder="Enter ICDM Order Number">
                </div>

                <div class="form-group">
                    <label for="proposeapprove">Propose Approval (APPROVE):</label>
                    <input type="text" class="form-control" id="proposeapprove" name="proposeapprove" required maxlength="7" placeholder="Enter propose approval">
                </div>

                <div class="form-group">
                    <label for="maturity_call_putdate">Maturity Call/Put Date:</label>
                    <input type="date" class="form-control" id="maturity_call_putdate" name="maturity_call_putdate" required>
                </div>
            </form>
        </div>

        <!-- Client Info Tab -->
        <div class="tab-pane fade" id="client-info" role="tabpanel" aria-labelledby="client-info-tab">
            <div class="form-group">
                <label for="clientcode">Client Code (BUYER CLIENT CODE):</label>
                <input type="text" class="form-control" id="clientcode" name="clientcode" required maxlength="15" placeholder="Enter client code">
            </div>

            <div class="form-group">
                <label for="custodiancode">Custodian Code:</label>
                <input type="text" class="form-control" id="custodiancode" name="custodiancode" required maxlength="10" placeholder="Enter custodian code">
            </div>
        </div>

        <!-- Bank Info Tab -->
        <div class="tab-pane fade" id="bank-info" role="tabpanel" aria-labelledby="bank-info-tab">
            <div class="form-group">
                <label for="bankifsc">Bank IFSC:</label>
                <input type="text" class="form-control" id="bankifsc" name="bankifsc" maxlength="11" placeholder="Enter bank IFSC">
            </div>

            <div class="form-group">
                <label for="accountnumber">Account Number:</label>
                <input type="text" class="form-control" id="accountnumber" name="accountnumber" maxlength="20" placeholder="Enter account number">
            </div>

            <div class="form-group">
                <label for="dptype">DP Type:</label>
                <input type="text" class="form-control" id="dptype" name="dptype" maxlength="4" placeholder="Enter DP Type">
            </div>

            <div class="form-group">
                <label for="dpid">DP ID:</label>
                <input type="text" class="form-control" id="dpid" name="dpid" maxlength="8" placeholder="Enter DP ID">
            </div>

            <div class="form-group">
                <label for="dpclientid">DP Client ID:</label>
                <input type="text" class="form-control" id="dpclientid" name="dpclientid" maxlength="16" placeholder="Enter DP Client ID">
            </div>
        </div>

        <!-- Freeze Info Tab -->
        <div class="tab-pane fade" id="freeze-info" role="tabpanel" aria-labelledby="freeze-info-tab">
            <div class="form-group">
                <label for="freeze">Freeze (YES/NO):</label>
                <select class="form-control" id="freeze" name="freeze" required>
                    <option value="YES">YES</option>
                    <option value="NO">NO</option>
                </select>
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>

<span class="auto-style1">

            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>