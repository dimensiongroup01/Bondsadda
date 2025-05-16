<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UCCManagement.aspx.cs" Inherits="BSE_INTEGRATION_UCCManagement" Async="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>UCC Management</title>
    <link href="../css/Style_Bse/style.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-size: 14px;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 100%;
            padding: 20px;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            overflow: hidden; /* Prevent scrolling */
        }

        /* Header Styling */
        h4 {
            text-align: center;
            margin-bottom: 30px;
        }

        /* Error Message */
        .error-message {
            text-align: center;
            margin-bottom: 10px;
        }

        .nav-tabs .nav-link {
            border-radius: 12px 12px 0 0;
            font-size: 16px;
            font-weight: bold;
            padding: 12px;
        }

        .nav-tabs .nav-link.active {
            background-color: #343a40;
            color: white;
        }

        .tab-content {
            flex-grow: 1; /* Allows the content to take the remaining space */
            background-color: white;
            padding: 20px;
            border: 1px solid #ddd;
            border-top: none;
            border-radius: 0 0 12px 12px;
            overflow: auto;
        }

        /* Card Styling */
        .card {
            border: 1px solid #ddd;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
            margin-bottom: 20px;
        }

        .card:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .card-header {
            background-color: #343a40;
            color: white;
            font-size: 16px;
            padding: 12px;
        }

        .card-body {
            padding: 20px;
        }

        /* Button Styling */
        .btn-custom {
            font-size: 14px;
            padding: 12px 20px;
            text-transform: uppercase;
            border-radius: 30px;
            border: none;
            transition: all 0.3s ease-in-out;
            min-width: 150px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-custom:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        /* Specific Button Colors */
        .btn-success-custom {
            background-color: #28a745;
            color: white;
        }

        .btn-success-custom:hover {
            background-color: #218838;
        }

        .btn-warning-custom {
            background-color: #ffc107;
            color: white;
        }

        .btn-warning-custom:hover {
            background-color: #e0a800;
        }

        .btn-danger-custom {
            background-color: #dc3545;
            color: white;
        }

        .btn-danger-custom:hover {
            background-color: #c82333;
        }

        .btn-custom:focus {
            outline: none;
        }

        /* Form Elements */
        .form-label {
            font-size: 14px;
            margin-bottom: 8px;
        }

        .form-control {
            font-size: 14px;
            padding: 8px;
            border-radius: 8px;
            width: 100%;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Page Header -->
            <h4>UCC Management</h4>

            <!-- Error Message -->
            <div class="error-message">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>
            </div>

            <!-- Navigation Tabs -->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#basicDetails" role="tab" aria-controls="basicDetails" aria-selected="true">Basic Details</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="identity-tab" data-bs-toggle="tab" href="#identityAddress" role="tab" aria-controls="identityAddress" aria-selected="false">Identity & Address</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="bank-tab" data-bs-toggle="tab" href="#bankDetails" role="tab" aria-controls="bankDetails" aria-selected="false">Bank Details</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="dp-tab" data-bs-toggle="tab" href="#dpDetails" role="tab" aria-controls="dpDetails" aria-selected="false">DP Details</a>
                </li>
            </ul>

            <!-- Tab Content -->
            <div class="tab-content" id="myTabContent">
                <!-- Basic Details Tab -->
                <div class="tab-pane fade show active" id="basicDetails" role="tabpanel" aria-labelledby="home-tab">
                    <div class="card">
                        <div class="card-header">
                            <h5>Basic Details</h5>
                        </div>
                        <div class="card-body">
                             <label class="form-label">Client UCC:</label>
                            <asp:TextBox ID="txtClientUCC" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtClientUCC_TextChanged"></asp:TextBox>
                            <label class="form-label">Category:</label>
                            <asp:DropDownList ID="txtCategory" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Others" Value="0">Others</asp:ListItem>
                            <asp:ListItem Text="MUTUAL FUNDS" Value="1">MUTUAL FUNDS</asp:ListItem>
                            <asp:ListItem Text="INSURANCE COMPANY" Value="2">INSURANCE COMPANY</asp:ListItem>
                            <asp:ListItem Text="BANKS" Value="3">BANKS</asp:ListItem>
                            <asp:ListItem Text="NBFC" Value="4">NBFC</asp:ListItem>
                            <asp:ListItem Text="BROKER" Value="5">BROKER</asp:ListItem>
                            <asp:ListItem Text="CORPORATE" Value="6">CORPORATE</asp:ListItem>
                            <asp:ListItem Text="F II" Value="7">F II</asp:ListItem>
                            <asp:ListItem Text="FII-SUB" Value="8">FII-SUB</asp:ListItem>
                            <asp:ListItem Text="VC" Value="9">VC</asp:ListItem>
                            <asp:ListItem Text="FVCI" Value="10">FVCI</asp:ListItem>
                            <asp:ListItem Text="PMS" Value="11">PMS</asp:ListItem>
                            <asp:ListItem Text="DFI" Value="12">DFI</asp:ListItem>
                            <asp:ListItem Text="TRUST" Value="13">TRUST</asp:ListItem>
                            <asp:ListItem Text="PD" Value="14">PD</asp:ListItem>
                            <asp:ListItem Text="CUSTODY" Value="21">CUSTODY</asp:ListItem>
                            <asp:ListItem Text="INDIVIDUAL" Value="24">INDIVIDUAL</asp:ListItem>
                            </asp:DropDownList>
                           <label class="form-label">First Name:</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>

                        <label class="form-label">Middle Name:</label>
                        <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control"></asp:TextBox>

                        <label class="form-label">Last Name:</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>

                        <label class="form-label">Gender:</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>

                        <label class="form-label">Date of Birth:</label>
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                        <label class="form-label">Mobile No:</label>
                        <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control"></asp:TextBox>

                        <label class="form-label">Phone No:</label>
                        <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="form-control"></asp:TextBox>

                        <label class="form-label">Email ID:</label>
                        <asp:TextBox ID="txtEmailID" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <!-- Identity & Address Tab -->
                <div class="tab-pane fade" id="identityAddress" role="tabpanel" aria-labelledby="identity-tab">
                    <div class="card">
                        <div class="card-header">
                            <h5>Identity & Address</h5>
                        </div>
                        <div class="card-body">
                            <label class="form-label">PAN No:</label>
                            <asp:TextBox ID="txtPANNo" runat="server" CssClass="form-control"></asp:TextBox>
                           <label class="form-label">Aadhar No:</label>
                        <asp:TextBox ID="txtAadharNo" runat="server" CssClass="form-control"></asp:TextBox>

                        <label class="form-label">Address:</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

                        <label class="form-label">City:</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>

                        <label class="form-label">State:</label>
                         <asp:DropDownList ID="txtState" runat="server" CssClass="form-control">
                             <asp:ListItem Text="ANDAMAN AND NICOBAR ISLANDS" Value="38"></asp:ListItem>
                             <asp:ListItem Text="ANDHRA PRADESH" Value="39"></asp:ListItem>
                             <asp:ListItem Text="ARUNACHAL PRADESH " Value="40"></asp:ListItem>
                             <asp:ListItem Text="ASSAM " Value="41"></asp:ListItem>
                             <asp:ListItem Text="BIHAR " Value="42"></asp:ListItem>
                             <asp:ListItem Text="CHANDIGARH  " Value="76"></asp:ListItem>
                             <asp:ListItem Text="CHHATTISGARH " Value="44"></asp:ListItem>
                             <asp:ListItem Text="DADRA AND NAGAR HAVELI " Value="45"></asp:ListItem>
                             <asp:ListItem Text="DAMAN AND DIU  " Value="46"></asp:ListItem>
                             <asp:ListItem Text="DELHI " Value="47"></asp:ListItem>
                             <asp:ListItem Text="GOA" Value="48"></asp:ListItem>
                             <asp:ListItem Text="GUJARAT  " Value="49"></asp:ListItem>
                             <asp:ListItem Text="HARYANA " Value="50"></asp:ListItem>
                            <asp:ListItem Text="HIMACHAL PRADESH" Value="51"></asp:ListItem>
                            <asp:ListItem Text="JAMMU AND KASHMIR  " Value="52"></asp:ListItem>
                            <asp:ListItem Text="JHARKHAND" Value="53"></asp:ListItem>
                            <asp:ListItem Text="KARNATAKA" Value="54"></asp:ListItem>
                            <asp:ListItem Text="KERALA  " Value="55"></asp:ListItem>
                            <asp:ListItem Text="LAKSHADWEEP " Value="56"></asp:ListItem>
                            <asp:ListItem Text="MADHYA PRADESH" Value="57"></asp:ListItem>
                            <asp:ListItem Text="MAHARASHTRA  " Value="58"></asp:ListItem>
                            <asp:ListItem Text="MANIPUR " Value="59"></asp:ListItem>
                            <asp:ListItem Text="MEGHALAYA " Value="60"></asp:ListItem>
                            <asp:ListItem Text="MIZORAM " Value="61"></asp:ListItem>
                              <asp:ListItem Text="NAGALAND " Value="62"></asp:ListItem>
                             <asp:ListItem Text="ODISHA  " Value="63"></asp:ListItem>
                             <asp:ListItem Text="PONDICHERRY " Value="65"></asp:ListItem>
                             <asp:ListItem Text="PUNJAB " Value="66"></asp:ListItem>
                             <asp:ListItem Text="RAJASTHAN   " Value="67"></asp:ListItem>
                             <asp:ListItem Text="SIKKIM " Value="68"></asp:ListItem>
                             <asp:ListItem Text="TAMIL NADU " Value="69"></asp:ListItem>
                             <asp:ListItem Text="TRIPURA   " Value="70"></asp:ListItem>
                             <asp:ListItem Text="UTTAR PRADESH  " Value="71"></asp:ListItem>
                             <asp:ListItem Text="WEST BENGAL " Value="73"></asp:ListItem>
                             <asp:ListItem Text="TELANGANA " Value="74"></asp:ListItem>
                             <asp:ListItem Text="UTTARAKHAND  " Value="75"></asp:ListItem>
                         </asp:DropDownList>
                       

                        <label class="form-label">Country:</label>
                        <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control"></asp:TextBox>

                        <label class="form-label">PIN Code:</label>
                        <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <!-- Bank Details Tab -->
                <div class="tab-pane fade" id="bankDetails" role="tabpanel" aria-labelledby="bank-tab">
                    <div class="card">
                        <div class="card-header">
                            <h5>Bank Details</h5>
                        </div>
                        <div class="card-body">
                            <label class="form-label">Bank IFSC Code:</label>
                        <asp:TextBox ID="txtBankIFSC1" runat="server" CssClass="form-control"></asp:TextBox>

                        <label class="form-label">Bank Account No:</label>
                        <asp:TextBox ID="txtBankAccNo1" runat="server" CssClass="form-control"></asp:TextBox>

                        <label class="form-label">Bank Account Type:</label>
                        <asp:DropDownList ID="ddlBankAccType1" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Saving" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Current" Value="2"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:CheckBox ID="chkDefaultBank1" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label">Default Bank</label>
                        </div>
                    </div>
                </div>

                <!-- DP Details Tab -->
                <div class="tab-pane fade" id="dpDetails" role="tabpanel" aria-labelledby="dp-tab">
                    <div class="card">
                        <div class="card-header">
                            <h5>DP Details</h5>
                        </div>
                        <div class="card-body">
                            <label class="form-label">DP Client ID:</label>
                        <asp:TextBox ID="txtDPClientID1" runat="server" CssClass="form-control"></asp:TextBox>

                        <label class="form-label">DP Type:</label>
                        <asp:DropDownList ID="ddlDPType1" runat="server" CssClass="form-control">
                            <asp:ListItem Text="NSDL" Value="NSDL"></asp:ListItem>
                            <asp:ListItem Text="CDSL" Value="CDSL"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:CheckBox ID="chkDefaultDP1" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label">Default DP</label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Submit Buttons -->
            <div class="text-center mt-3">
                <asp:Button ID="btnCreateUCC" runat="server" Text="Create UCC" CssClass="btn-custom btn-success-custom mx-1" OnClick="btnCreateUCC_Click" />
                <asp:Button ID="btnModifyUCC" runat="server" Text="Modify UCC" CssClass="btn-custom btn-warning-custom mx-1" OnClick="btnModifyUCC_Click" />
                <asp:Button ID="btnDeleteUCC" runat="server" Text="Delete UCC" CssClass="btn-custom btn-danger-custom mx-1" OnClick="btnDeleteUCC_Click" />
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
