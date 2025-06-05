<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQApprove.aspx.cs" Inherits="BSE_INTEGRATION_RFQApprove" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Form</title>
    <!-- Bootstrap CSS -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
</head>
    <style>
       

        .container {
           
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 30px;
            margin-top: 50px;
        }

        .form-group label {
            font-weight: 600;
            color: #333;
        }

        .btn-primary {
            background: linear-gradient(to right, #f1c40f, #f39c12);
            border: none;
            font-weight: bold;
            padding: 10px 25px;
            border-radius: 5px;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #f39c12, #f1c40f);
        }
        .bg-gold{
            background-color:gold;
        }
    </style>
<body>
  <form id="form1" runat="server">
        <div class="container">
            <h3 class="text-center mb-4">RFQ Approve Form</h3>

            <!-- Product Info -->
            <div class="form-group">
                <label>Product (ICDM/GSEC):</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-box-seam"></i></span>
                    </div>
                    <asp:TextBox ID="txtProduct" runat="server" CssClass="form-control" MaxLength="5" />
                </div>
            </div>

            <div class="form-group">
                <label>User Type (BROKER):</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-person-badge"></i></span>
                    </div>
                    <asp:TextBox ID="txtUserType" runat="server" CssClass="form-control" MaxLength="11" />
                </div>
            </div>

            <div class="form-group">
                <label>ISIN Number:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text  bg-gold"><i class="bi bi-upc-scan"></i></span>
                    </div>
                    <asp:TextBox ID="txtISIN" runat="server" CssClass="form-control" MaxLength="12" />
                </div>
            </div>

            <div class="form-group">
                <label>RFQ Deal ID:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-receipt"></i></span>
                    </div>
                    <asp:TextBox ID="txtRFQDealID" runat="server" CssClass="form-control" MaxLength="15" />
                </div>
            </div>

            <div class="form-group">
                <label>ICDM Order Number:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-hash"></i></span>
                    </div>
                    <asp:TextBox ID="txtICDMOrderNumber" runat="server" CssClass="form-control" MaxLength="15" />
                </div>
            </div>

            <div class="form-group">
                <div class="mb-3">
                    <label for="ddlProposeApproval" class="form-label">
                        <i class="bi bi-check-circle me-2 text-warning"></i>Propose Approval
                    </label>
                    <div class="input-group">
                        <span class="input-group-text bg-gold">
                            <i class="bi bi-check-circle text-white"></i>
                        </span>
                        <asp:DropDownList 
                            ID="ddlProposeApproval" 
                            runat="server" 
                            CssClass="form-select" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Text="-- Select Status --" Value="" />
                            <asp:ListItem Text="Approve" Value="Approve" />
                            <asp:ListItem Text="Purpose" Value="Purpose" />
                        </asp:DropDownList>
                </div>
            </div>

            </div>

            <div class="form-group">
                <label>Maturity Call/Put Date:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-calendar-date"></i></span>
                    </div>
                    <asp:TextBox ID="txtMaturityDate" runat="server" CssClass="form-control" TextMode="Date" />
                </div>
            </div>

            <!-- Client Info -->
            <div class="form-group">
                <label>Client Code:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-person-square"></i></span>
                    </div>
                    <asp:TextBox ID="txtClientCode" runat="server" CssClass="form-control" MaxLength="15" />
                </div>
            </div>

            <div class="form-group">
                <label>Custodian Code:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-shield-check"></i></span>
                    </div>
                    <asp:TextBox ID="txtCustodianCode" runat="server" CssClass="form-control" MaxLength="10" />
                </div>
            </div>

            <!-- Bank Info -->
            <div class="form-group">
                <label>Bank IFSC:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-bank"></i></span>
                    </div>
                    <asp:TextBox ID="txtBankIFSC" runat="server" CssClass="form-control" MaxLength="11" />
                </div>
            </div>

            <div class="form-group">
                <label>Account Number:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-123"></i></span>
                    </div>
                    <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="form-control" MaxLength="20" />
                </div>
            </div>

            <div class="form-group">
                <label>DP Type:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-ui-checks"></i></span>
                    </div>
                    <asp:TextBox ID="txtDPType" runat="server" CssClass="form-control" MaxLength="4" />
                </div>
            </div>

            <div class="form-group">
               <div class="mb-3">
                    <label for="ddlDPID" class="form-label">
                        <i class="bi bi-hash me-2 text-warning"></i>DP ID:
                    </label>
                    <div class="input-group">
                        <span class="input-group-text bg-gold">
                            <i class="bi bi-hash text-white"></i>
                        </span>
                        <asp:DropDownList 
                            ID="ddlDPID" 
                            runat="server" 
                            CssClass="form-select" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Text="-- Select DP ID --" Value="" />
                            <asp:ListItem Text="NSDL" Value="NSDL" />
                            <asp:ListItem Text="CDSL" Value="CDSL" />
                        </asp:DropDownList>
                    </div>
                </div>

            </div>

            <div class="form-group">
                <label>DP Client ID:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-person-lines-fill"></i></span>
                    </div>
                    <asp:TextBox ID="txtDPClientID" runat="server" CssClass="form-control" MaxLength="16" />
                </div>
            </div>

            <!-- Freeze Info -->
            <div class="form-group">
                <label>Freeze (YES/NO):</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-gold"><i class="bi bi-toggle-on"></i></span>
                    </div>
                    <asp:DropDownList ID="ddlFreeze" runat="server" CssClass="form-control">
                        <asp:ListItem Text="YES" Value="YES" />
                        <asp:ListItem Text="NO" Value="NO" />
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Submit -->
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold" />
            <div class="text-center mt-4">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>