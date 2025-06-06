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
  <!-- CSS --> <link href="../../css/Style_Bse/style.css" rel="stylesheet" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

    <form id="productForm" runat="server">
        <div class="container">
            <h3 class="text-center mb-4">RFQ Product Entry</h3>

            <div class="card card-gold mb-4">
    <div class="card-header py-2">
        <h6 class="mb-0"><i class="fas fa-file-invoice me-2"></i>Additional RFQ Details</h6>
    </div>

    <div class="card-body px-4 py-3">
        <!-- Row 1 -->
        <div class="row mb-3">
            <!-- Product Option -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="ddlProduct" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-box-seam me-1 text-warning"></i>Product:
                    <span class="text-danger">*</span>
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-select form-select-sm border-warning border-2" AppendDataBoundItems="true" required="true">
                        <asp:ListItem Text="-- Select Product --" Value="" />
                        <asp:ListItem Text="ICDM" Value="ICDM" />
                        <asp:ListItem Text="GSEC" Value="GSEC" />
                    </asp:DropDownList>
                </div>
            </div>

            <!-- User Type -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="userType" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-person-badge me-1"></i>User Type
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="userType" runat="server" CssClass="form-select form-select-sm border-warning border-2">
                        <asp:ListItem Text="BROKER" Value="BROKER" />
                    </asp:DropDownList>
                </div>
            </div>

            <!-- ISIN Number -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="isinNumber" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-upc-scan me-1"></i>ISIN Number
                </label>
                <div class="col-7">
                    <asp:TextBox ID="isinNumber" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                    <asp:RequiredFieldValidator ID="rfvIsinNumber" runat="server" ControlToValidate="isinNumber"
                        ErrorMessage="ISIN Number is required" ForeColor="Red" Display="Dynamic" />
                </div>
            </div>
        </div>

        <!-- Row 2 -->
        <div class="row mb-3">
            <!-- Internal RFQ Order Number -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtRFQOrder" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-hash me-1 text-warning"></i>RFQ Order No
                    <span class="text-danger">*</span>
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtRFQOrder" runat="server" CssClass="form-control form-control-sm border-warning border-2"
                        MaxLength="16" placeholder="Starts with 'R'" />
                </div>
            </div>

            <!-- RFQ Deal ID -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtRFQDealID" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-tag me-1 text-warning"></i>RFQ Deal ID
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtRFQDealID" runat="server" CssClass="form-control form-control-sm border-warning border-2"
                        MaxLength="15" placeholder="Unique RFQ Deal ID" required="true" />
                </div>
            </div>

            <!-- Yield Type -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="ddlYieldType" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-percent me-1 text-warning"></i>Yield Type:
                    <span class="text-danger">*</span>
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlYieldType" runat="server" CssClass="form-select form-select-sm border-warning border-2" AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Select Yield Type --" Value="" />
                        <asp:ListItem Text="YTM" Value="YTM" />
                        <asp:ListItem Text="YTP" Value="YTP" />
                        <asp:ListItem Text="YTC" Value="YTC" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <!-- Row 3 -->
        <div class="row mb-3">
            <!-- Yield -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="yield" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-graph-up-arrow me-1 text-warning"></i>Yield
                </label>
                <div class="col-7">
                    <asp:TextBox ID="yield" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                </div>
            </div>
        </div>
    </div>
</div>

          <div class="card card-gold mb-4">
    <div class="card-header py-2">
        <h6 class="mb-0"><i class="fas fa-receipt me-2"></i>Transaction Details</h6>
    </div>
    <div class="card-body px-4 py-3">

        <!-- Row 1 -->
        <div class="row mb-3">
            <!-- Price -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="price" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-currency-rupee me-1"></i>Price
                </label>
                <div class="col-7">
                    <asp:TextBox ID="price" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                </div>
            </div>

            <!-- Modified Accrued Interest -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtModacrint" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-cash-stack me-1"></i>Modacrint
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtModacrint" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="27" placeholder="e.g. 1234567890123456789012.34" />
                </div>
            </div>

            <!-- Consideration -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtConsideration" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-currency-rupee me-1"></i>Consideration
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtConsideration" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="27" placeholder="e.g. 1000000000000000000000.00" />
                </div>
            </div>
        </div>

        <!-- Row 2 -->
        <div class="row mb-3">
            <!-- Maturity Date -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtMaturityDate" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-calendar-event me-1"></i>Maturity Date
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtMaturityDate" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="10" placeholder="DD-MM-YYYY" />
                </div>
            </div>

            <!-- Settlement Date -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtSettlementDate" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-calendar-check me-1"></i>Settlement Date
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtSettlementDate" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="10" placeholder="DD-MM-YYYY" />
                </div>
            </div>

            <!-- Client Code -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtClientCode" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-person-badge me-1"></i>Client Code
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtClientCode" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="15" placeholder="Enter Seller Client Code" />
                </div>
            </div>
        </div>

        <!-- Row 3 -->
        <div class="row mb-3">
            <!-- Custodian Code -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="custodiancode" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-key me-1"></i>Custodian Code
                </label>
                <div class="col-7">
                    <asp:TextBox ID="custodiancode" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                </div>
            </div>

            <!-- Empty Columns (if needed for spacing) -->
            <div class="col-md-4"></div>
            <div class="col-md-4"></div>
        </div>

    </div>
</div>
<div class="card card-gold mb-4">
    <div class="card-header py-2">
        <h6 class="mb-0"><i class="bi bi-bank2 me-2"></i>Bank & DP Details</h6>
    </div>
    <div class="card-body px-4 py-3">

        <!-- Row 1 -->
        <div class="row mb-3">
            <!-- Bank IFSC -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="bankifsc" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-bank me-1"></i>Bank IFSC
                </label>
                <div class="col-7">
                    <asp:TextBox ID="bankifsc" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                </div>
            </div>

            <!-- Bank Account Number -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="bankaccountnumber" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-credit-card me-1"></i>Account No.
                </label>
                <div class="col-7">
                    <asp:TextBox ID="bankaccountnumber" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                </div>
            </div>

            <!-- DP Type -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="ddlDPType" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-database me-1"></i>DP Type
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlDPType" runat="server" CssClass="form-select form-select-sm border-warning border-2" AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Select DP Type --" Value="" />
                        <asp:ListItem Text="NSDL" Value="NSDL" />
                        <asp:ListItem Text="CDSL" Value="CDSL" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <!-- Row 2 -->
        <div class="row mb-3">
            <!-- DP ID -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="dpid" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-card-heading me-1"></i>DP ID
                </label>
                <div class="col-7">
                    <asp:TextBox ID="dpid" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                </div>
            </div>

            <!-- DP Client ID -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="dpclientid" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-person-lines-fill me-1"></i>Client ID
                </label>
                <div class="col-7">
                    <asp:TextBox ID="dpclientid" runat="server" CssClass="form-control form-control-sm border-warning border-2" />
                </div>
            </div>

            <!-- Seller Reference Number -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtReferenceNumber" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-hash me-1"></i>Ref. No.
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtReferenceNumber" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="50" placeholder="Optional" />
                </div>
            </div>
        </div>

        <!-- Row 3 -->
        <div class="row mb-3">
            <!-- Propose / Approve -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="ddlProposeApprove" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-check2-square me-1"></i>Propose/Approve
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlProposeApprove" runat="server" CssClass="form-select form-select-sm border-warning border-2" AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="PROPOSE" Value="PROPOSE" />
                        <%-- Add APPROVE in future if needed --%>
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Freeze -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="ddlFreeze" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-lock-fill me-1"></i>Freeze
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlFreeze" runat="server" CssClass="form-select form-select-sm border-warning border-2" AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Select --" Value="" />
                        <asp:ListItem Text="YES" Value="YES" />
                        <asp:ListItem Text="NO" Value="NO" />
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Empty col for alignment -->
            <div class="col-md-4"></div>
        </div>

        <!-- Message + Submit -->
        <div class="row mb-3">
            <div class="col-md-12 text-center">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold d-block mb-2" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-submit px-4" OnClick="btnSubmit_Click" />
            </div>
        </div>

    </div>
</div>
    </form>

    <!-- JS Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
 </body>
</html>