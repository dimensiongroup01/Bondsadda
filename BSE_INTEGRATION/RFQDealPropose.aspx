<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQDealPropose.aspx.cs" Inherits="BSE_INTEGRATION_RFQDealPropose" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Form with Bootstrap Tabs</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
     .section-header {
            background: linear-gradient(to right, #ffd700, #ffcc00);
            padding: 10px 20px;
            font-weight: bold;
            color: #000;
            font-size: 1.2rem;
            border-radius: 6px 6px 0 0;
            margin-top: 30px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .form-box {
            background: #fffef2;
            border: 1px solid #e6c400;
            padding: 25px;
            border-radius: 0 0 6px 6px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.08);
        }

        .form-group label {
            font-weight: 500;
        }

        .form-icon {
            margin-right: 8px;
            color: #cc9900;
            min-width: 20px;
        }

        .btn-submit {
            background: linear-gradient(90deg, #ffd700, #ffcc00);
            color: #000;
            font-weight: bold;
            padding: 10px 30px;
            border: none;
            border-radius: 6px;
        }
        .bg-gold{
            background:gold;
        }
    </style>
</head>
<body>

    <form id="productForm" runat="server">
        <div class="container">
            <h3 class="text-center mb-4">RFQ Product Entry</h3>

            <!-- Product Option -->
            <div class="form-group">
                <label><i class="bi bi-box-seam mr-2 bg-gold"></i>Product Option:</label><br />
                <asp:RadioButton ID="icdmRadio" runat="server" GroupName="productOption" Text=" ICDM " />
                <asp:RadioButton ID="gsecRadio" runat="server" GroupName="productOption" Text=" GSEC " />
            </div>

            <!-- User Type -->
            <div class="form-group">
                <label><i class="bi bi-person-badge mr-2"></i>User Type:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-person-badge"></i></span>
                    </div>
                    <asp:DropDownList ID="userType" runat="server" CssClass="form-control">
                        <asp:ListItem Text="BROKER" Value="BROKER" />
                    </asp:DropDownList>
                </div>
            </div>

            <!-- ISIN Number -->
            <div class="form-group">
                <label><i class="bi bi-upc-scan mr-2"></i>ISIN Number:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-upc-scan"></i></span>
                    </div>
                    <asp:TextBox ID="isinNumber" runat="server" CssClass="form-control" />
                </div>
                <asp:RequiredFieldValidator ID="rfvIsinNumber" runat="server" ControlToValidate="isinNumber"
                    ErrorMessage="ISIN Number is required" ForeColor="Red" Display="Dynamic" />
            </div>

            <!-- Yield Type -->
            <div class="form-group">
                <label><i class="bi bi-percent mr-2"></i>Yield Type:</label><br />
                <asp:RadioButton ID="ytmRadio" runat="server" GroupName="yieldType" Text=" YTM " />
                <asp:RadioButton ID="ytpRadio" runat="server" GroupName="yieldType" Text=" YTP " />
                <asp:RadioButton ID="ytcRadio" runat="server" GroupName="yieldType" Text=" YTC " />
            </div>

            <!-- Quote Accepted -->
            <div class="form-group">
                <label><i class="bi bi-check-circle mr-2"></i>Quote Accepted:</label><br />
                <asp:RadioButton ID="QuoteAcceptedPrice" runat="server" GroupName="quoteAccepted" Text=" Price " />
                <asp:RadioButton ID="QuoteAcceptedYield" runat="server" GroupName="quoteAccepted" Text=" Yield " />
            </div>

            <!-- Yield -->
            <div class="form-group">
                <label><i class="bi bi-graph-up-arrow mr-2"></i>Yield:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-graph-up-arrow"></i></span>
                    </div>
                    <asp:TextBox ID="yield" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- Price -->
            <div class="form-group">
                <label><i class="bi bi-currency-rupee mr-2"></i>Price:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-currency-rupee"></i></span>
                    </div>
                    <asp:TextBox ID="price" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- Custodian Code -->
            <div class="form-group">
                <label><i class="bi bi-key mr-2"></i>Custodian Code:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-key"></i></span>
                    </div>
                    <asp:TextBox ID="custodiancode" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- Bank IFSC -->
            <div class="form-group">
                <label><i class="bi bi-bank mr-2"></i>Bank IFSC:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-bank"></i></span>
                    </div>
                    <asp:TextBox ID="bankifsc" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- Bank Account Number -->
            <div class="form-group">
                <label><i class="bi bi-credit-card mr-2"></i>Bank Account Number:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-credit-card"></i></span>
                    </div>
                    <asp:TextBox ID="bankaccountnumber" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- DP Type -->
            <div class="form-group">
                <label><i class="bi bi-database mr-2"></i>DP Type:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-database"></i></span>
                    </div>
                    <asp:TextBox ID="dptype" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- DP ID -->
            <div class="form-group">
                <label><i class="bi bi-card-heading mr-2"></i>DP ID:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-card-heading"></i></span>
                    </div>
                    <asp:TextBox ID="dpid" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- DP Client ID -->
            <div class="form-group">
                <label><i class="bi bi-person-lines-fill mr-2"></i>DP Client ID:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-person-lines-fill"></i></span>
                    </div>
                    <asp:TextBox ID="dpclientid" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- Message & Submit -->
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger font-weight-bold" />
            <div class="text-center mt-4">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-submit" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>

    <!-- JS Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
 </body>
</html>