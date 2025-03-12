<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UCCManagement.aspx.cs" Inherits="BSE_INTEGRATION_UCCManagement" Async="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>UCC Management</title>
    <link href="../css/Style_Bse/style.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">UCC Management</h2>

            <!-- Error Message -->
            <div class="text-center mb-3">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>
            </div>

            <div class="row">
                <!-- Left Column -->
                <div class="col-md-6">
                    <h4>Basic Details</h4>

                    <div class="mb-3">
                        <label class="form-label">Client UCC:</label>
                       <asp:TextBox ID="txtClientUCC" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtClientUCC_TextChanged"></asp:TextBox>

                    </div>

                    <div class="mb-3">
                        <label class="form-label">Category:</label>
                        <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">First Name:</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Middle Name:</label>
                        <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Last Name:</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Gender:</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Third Gender" Value="Third Gender"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Date of Birth:</label>
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mobile No:</label>
                        <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone No:</label>
                        <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email ID:</label>
                        <asp:TextBox ID="txtEmailID" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <!-- Right Column -->
                <div class="col-md-6">
                    <h4>Identity & Address</h4>

                    <div class="mb-3">
                        <label class="form-label">PAN No:</label>
                        <asp:TextBox ID="txtPANNo" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Aadhar No:</label>
                        <asp:TextBox ID="txtAadharNo" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Address:</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">City:</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">State:</label>
                        <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Country:</label>
                        <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">PIN Code:</label>
                        <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <h4>Bank Details</h4>

                    <div class="mb-3">
                        <label class="form-label">Bank IFSC Code:</label>
                        <asp:TextBox ID="txtBankIFSC1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Bank Account No:</label>
                        <asp:TextBox ID="txtBankAccNo1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Bank Account Type:</label>
                        <asp:DropDownList ID="ddlBankAccType1" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Saving" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Current" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3 form-check">
                        <asp:CheckBox ID="chkDefaultBank1" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label">Default Bank</label>
                    </div>
                </div>
           

           <h4 class="mt-4">DP Details</h4>
            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">DP Client ID:</label>
                    <asp:TextBox ID="txtDPClientID1" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">DP Type:</label>
                    <asp:DropDownList ID="ddlDPType1" runat="server" CssClass="form-control">
                        <asp:ListItem Text="NSDL" Value="NSDL"></asp:ListItem>
                        <asp:ListItem Text="CDSL" Value="CDSL"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="mb-3 form-check">
                <asp:CheckBox ID="chkDefaultDP1" runat="server" CssClass="form-check-input" />
                <label class="form-check-label">Default DP</label>
            </div>
            <!-- Submit Buttons -->
            <div class="text-center mt-4">
                <asp:Button ID="btnCreateUCC" runat="server" Text="Create UCC" CssClass="btn btn-success mx-2" OnClick="btnCreateUCC_Click" />
                <asp:Button ID="btnModifyUCC" runat="server" Text="Modify UCC" CssClass="btn btn-warning mx-2" OnClick="btnModifyUCC_Click" />
                <asp:Button ID="btnDeleteUCC" runat="server" Text="Delete UCC" CssClass="btn btn-danger mx-2" OnClick="btnDeleteUCC_Click" />
            </div>
        </div>
    </form>
</body>
</html>
