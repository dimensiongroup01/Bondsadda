<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQApprove.aspx.cs" Inherits="BSE_INTEGRATION_RFQApprove" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Form</title>
    <!-- Bootstrap CSS -->
     <!-- CSS --> <link href="../../css/Style_Bse/style.css" rel="stylesheet" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
</head>
 
<body>
  <form id="form1" runat="server">
        <div class="container">
           <div class="card card-gold mb-4">
    <div class="card-header py-2">
        <h6 class="mb-0"><i class="bi bi-ui-checks-grid me-2"></i>RFQ Approve Form</h6>
    </div>

    <div class="card-body px-4 py-3">
        <asp:Label ID="lblApproveMessage" runat="server" CssClass="text-danger fw-bold mb-2 d-block"></asp:Label>

        <!-- Row 1 -->
        <div class="row mb-3">
            <!-- Product -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtProduct" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-box-seam me-1"></i>Product
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtProduct" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="5" />
                </div>
            </div>

            <!-- User Type -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtUserType" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-person-badge me-1"></i>User Type
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtUserType" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="11" />
                </div>
            </div>

            <!-- ISIN -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtISIN" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-upc-scan me-1"></i>ISIN
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtISIN" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="12" />
                </div>
            </div>
        </div>

        <!-- Row 2 -->
        <div class="row mb-3">
            <!-- RFQ Deal ID -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtRFQDealID" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-receipt me-1"></i>RFQ Deal ID
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtRFQDealID" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="15" />
                </div>
            </div>

            <!-- ICDM Order Number -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtICDMOrderNumber" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-hash me-1"></i>ICDM Order No.
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtICDMOrderNumber" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="15" />
                </div>
            </div>

            <!-- Approval -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="ddlProposeApproval" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-check-circle me-1"></i>Approval
                </label>
                <div class="col-7">
                    <asp:DropDownList 
                        ID="ddlProposeApproval" 
                        runat="server" 
                        CssClass="form-select form-select-sm border-warning border-2" 
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Select Status --" Value="" />
                        <asp:ListItem Text="Approve" Value="Approve" />
                        <asp:ListItem Text="Purpose" Value="Purpose" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <!-- Row 3 -->
        <div class="row mb-3">
            <!-- Maturity Date -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtMaturityDate" class="col-5 col-form-label text-end pe-2">
                    <i class="bi bi-calendar-date me-1"></i>Maturity Date
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtMaturityDate" runat="server" CssClass="form-control form-control-sm border-warning border-2" TextMode="Date" />
                </div>
            </div>

            <!-- Empty columns for alignment -->
            <div class="col-md-4"></div>
            <div class="col-md-4"></div>
        </div>
    </div>
</div>
<div class="card card-gold mb-4">
  <div class="card-header py-2">
    <h6 class="mb-0"><i class="bi bi-person-badge me-2"></i>Client & Bank Details</h6>
  </div>
  <div class="card-body px-4 py-3">
    
    <!-- Row 1 -->
    <div class="row mb-3">
      <!-- Client Code -->
      <div class="col-md-4 d-flex align-items-center">
        <label for="txtClientCode" class="col-5 col-form-label text-end pe-2">
          <i class="bi bi-person-square me-1"></i>Client Code
        </label>
        <div class="col-7">
          <asp:TextBox ID="txtClientCode" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="15" />
        </div>
      </div>

      <!-- Custodian Code -->
      <div class="col-md-4 d-flex align-items-center">
        <label for="txtCustodianCode" class="col-5 col-form-label text-end pe-2">
          <i class="bi bi-shield-check me-1"></i>Custodian Code
        </label>
        <div class="col-7">
          <asp:TextBox ID="txtCustodianCode" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="10" />
        </div>
      </div>

      <!-- Bank IFSC -->
      <div class="col-md-4 d-flex align-items-center">
        <label for="txtBankIFSC" class="col-5 col-form-label text-end pe-2">
          <i class="bi bi-bank me-1"></i>Bank IFSC
        </label>
        <div class="col-7">
          <asp:TextBox ID="txtBankIFSC" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="11" />
        </div>
      </div>
    </div>

    <!-- Row 2 -->
    <div class="row mb-3">
      <!-- Account Number -->
      <div class="col-md-4 d-flex align-items-center">
        <label for="txtAccountNumber" class="col-5 col-form-label text-end pe-2">
          <i class="bi bi-123 me-1"></i>Account Number
        </label>
        <div class="col-7">
          <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="20" />
        </div>
      </div>

      <!-- DP Type -->
      <div class="col-md-4 d-flex align-items-center">
        <label for="txtDPType" class="col-5 col-form-label text-end pe-2">
          <i class="bi bi-ui-checks me-1"></i>DP Type
        </label>
        <div class="col-7">
          <asp:TextBox ID="txtDPType" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="4" />
        </div>
      </div>

      <!-- DP ID -->
      <div class="col-md-4 d-flex align-items-center">
        <label for="ddlDPID" class="col-5 col-form-label text-end pe-2">
          <i class="bi bi-hash me-1 text-warning"></i>DP ID
        </label>
        <div class="col-7">
          <asp:DropDownList ID="ddlDPID" runat="server" CssClass="form-select form-select-sm border-warning border-2" AppendDataBoundItems="true">
            <asp:ListItem Text="-- Select DP ID --" Value="" />
            <asp:ListItem Text="NSDL" Value="NSDL" />
            <asp:ListItem Text="CDSL" Value="CDSL" />
          </asp:DropDownList>
        </div>
      </div>
    </div>

    <!-- Row 3 -->
    <div class="row mb-3">
      <!-- DP Client ID -->
      <div class="col-md-4 d-flex align-items-center">
        <label for="txtDPClientID" class="col-5 col-form-label text-end pe-2">
          <i class="bi bi-person-lines-fill me-1"></i>DP Client ID
        </label>
        <div class="col-7">
          <asp:TextBox ID="txtDPClientID" runat="server" CssClass="form-control form-control-sm border-warning border-2" MaxLength="16" />
        </div>
      </div>

      <!-- Freeze -->
      <div class="col-md-4 d-flex align-items-center">
        <label for="ddlFreeze" class="col-5 col-form-label text-end pe-2">
          <i class="bi bi-toggle-on me-1"></i>Freeze (YES/NO)
        </label>
        <div class="col-7">
          <asp:DropDownList ID="ddlFreeze" runat="server" CssClass="form-select form-select-sm border-warning border-2">
            <asp:ListItem Text="YES" Value="YES" />
            <asp:ListItem Text="NO" Value="NO" />
          </asp:DropDownList>
        </div>
      </div>

      <!-- Empty column for alignment -->
      <div class="col-md-4"></div>
    </div>

    <!-- Submit -->
    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold mb-2 d-block"></asp:Label>
    <div class="text-center mt-4">
      <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
    </div>

  </div>
</div>
    </form>

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>