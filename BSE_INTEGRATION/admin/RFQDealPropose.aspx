<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQDealPropose.aspx.cs" Inherits="BSE_INTEGRATION_RFQDealPropose" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Form with Bootstrap Tabs</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
    <style>
        .tab-content {
            padding: 20px;
        }
        .nav-tabs .nav-item:hover {
            background-color: #f0f0f0;
            cursor: pointer;
        }
        .auto-style1 {
            font-family: "Segoe UI";
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mt-5">Product Form</h2>
        
        <!-- Bootstrap Tabs -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="product-tab" data-toggle="tab" href="#product" role="tab" aria-controls="product" aria-selected="true">Product Details</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="pricing-tab" data-toggle="tab" href="#pricing" role="tab" aria-controls="pricing" aria-selected="false">Pricing Details</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="custodian-tab" data-toggle="tab" href="#custodian" role="tab" aria-controls="custodian" aria-selected="false">Custodian Details</a>
            </li>
        </ul>

       
        <form id="productForm" runat="server">
            <div class="tab-content" id="myTabContent">
                <!-- Product Details Tab -->
                <div class="tab-pane fade show active" id="product" role="tabpanel" aria-labelledby="product-tab">
                    <div class="form-group">
                        <label for="productOption">Product Option:</label><br />
                        <asp:RadioButton ID="icdmRadio" runat="server" GroupName="productOption" Text="ICDM" />
                        <asp:RadioButton ID="gsecRadio" runat="server" GroupName="productOption" Text="GSEC" />
                    </div>
                    <div class="form-group">
                        <label for="userType">User Type:</label>
                        <asp:DropDownList ID="userType" runat="server" class="form-control">
                            <asp:ListItem Text="BROKER" Value="BROKER" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="isinNumber">ISIN Number:</label>
                        <asp:TextBox ID="isinNumber" runat="server" CssClass="form-control" Required="true" />
                        <asp:RequiredFieldValidator ID="rfvIsinNumber" runat="server" ControlToValidate="isinNumber" InitialValue="" ErrorMessage="ISIN Number is required" ForeColor="Red" />
                    </div>
                </div>

                <!-- Pricing Details Tab -->
                <div class="tab-pane fade" id="pricing" role="tabpanel" aria-labelledby="pricing-tab">
                    <div class="form-group">
                        <label for="yieldType">Yield Type:</label><br />
                        <asp:RadioButton ID="ytmRadio" runat="server" GroupName="yieldType" Text="YTM" />
                        <asp:RadioButton ID="ytpRadio" runat="server" GroupName="yieldType" Text="YTP" />
                        <asp:RadioButton ID="ytcRadio" runat="server" GroupName="yieldType" Text="YTC" />
                    </div>
                    <div class="form-group">
                        <label for="quoteAccepted">Quote Accepted:</label><br />
                        <asp:RadioButton ID="QuoteAcceptedPrice" runat="server" GroupName="quoteAccepted" Text="Price" />
                        <asp:RadioButton ID="QuoteAcceptedYield" runat="server" GroupName="quoteAccepted" Text="Yield" />
                    </div>
                    <div class="form-group">
                        <label for="yield">Yield:</label>
                        <asp:TextBox ID="yield" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <asp:TextBox ID="price" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <!-- Custodian Details Tab -->
                <div class="tab-pane fade" id="custodian" role="tabpanel" aria-labelledby="custodian-tab">
                    <div class="form-group">
                        <label for="custodiancode">Custodian Code:</label>
                        <asp:TextBox ID="custodiancode" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="bankifsc">Bank IFSC:</label>
                        <asp:TextBox ID="bankifsc" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="bankaccountnumber">Bank Account Number:</label>
                        <asp:TextBox ID="bankaccountnumber" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="dptype">DP Type:</label>
                        <asp:TextBox ID="dptype" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="dpid">DP ID:</label>
                        <asp:TextBox ID="dpid" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="dpclientid">DP Client ID:</label>
                        <asp:TextBox ID="dpclientid" runat="server" CssClass="form-control" />
                    </div>
                </div>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>

            <span class="auto-style1">
                <!-- Submit Button -->
            </span>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary mt-4" style="font-family: 'Segoe UI'" />
        </form>
    </div>
</body>
</html>
