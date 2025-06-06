<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UCCManagement.aspx.cs" Inherits="BSE_INTEGRATION_UCCManagement" Async="true" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>UCC Management</title>

    <!-- Bootstrap CSS (fixed extra '>' character) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <!-- Custom CSS (make sure path is correct relative to this .aspx file) -->
    <link href="../../css/Style_Bse/style.css" rel="stylesheet" />
</head>


<body>
  <form id="form1" runat="server">
    <div class="container">
        <!-- Page Header -->
       <div class="d-flex justify-content-between align-items-center mb-4">
  <a href="Dashboard.aspx">
    <img src="https://bondsadda.com/img/logo.png" alt="Bondsadda Logo" class="sizelogo" />
</a>

  <h4 class="mb-0">Client Details</h4>
</div>


  
        <!-- Error Message -->
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold mb-3 d-block"></asp:Label>

        <!-- Basic Details Card -->
   <div class="card mb-4 card-gold">
    <div class="card-header py-2">
        <h6 class="mb-0"><i class="fas fa-id-card me-2"></i>Basic Details</h6>
    </div>
    <div class="card-body py-3 px-4">

        <!-- Row 1 -->
        <div class="row mb-3">
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtClientUCC" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-user-tag me-1"></i>Client UCC
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtClientUCC" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnTextChanged="txtClientUCC_TextChanged" />
                </div>
            </div>

           <div class="col-md-4 d-flex align-items-center">
    <label for="ddlCategory" class="col-5 col-form-label text-end pe-2">
        <i class="fas fa-layer-group me-1"></i>Category
    </label>
    <div class="col-7">
        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
            <asp:ListItem Text="OTHERS" Value="0" />
            <asp:ListItem Text="MUTUAL FUNDS" Value="1" />
            <asp:ListItem Text="INSURANCE COMPANY" Value="2" />
            <asp:ListItem Text="BANKS" Value="3" />
            <asp:ListItem Text="NBFC" Value="4" />
            <asp:ListItem Text="BROKER" Value="5" />
            <asp:ListItem Text="CORPORATE" Value="6" />
            <asp:ListItem Text="FII" Value="7" />
            <asp:ListItem Text="FII-SUB" Value="8" />
            <asp:ListItem Text="VC" Value="9" />
            <asp:ListItem Text="FVCI" Value="10" />
            <asp:ListItem Text="PMS" Value="11" />
            <asp:ListItem Text="DFI" Value="12" />
            <asp:ListItem Text="TRUST" Value="13" />
            <asp:ListItem Text="PD" Value="14" />
            <asp:ListItem Text="CUSTODY" Value="21" />
            <asp:ListItem Text="INDIVIDUAL" Value="24" />
        </asp:DropDownList>
    </div>
</div>


            <div class="col-md-4 d-flex align-items-center">
                <label for="txtFirstName" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-user me-1"></i>First Name
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>
        </div>

        <!-- Row 2 -->
        <div class="row mb-3">
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtMiddleName" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-user me-1"></i>Middle Name
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="txtLastName" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-user me-1"></i>Last Name
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="ddlGender" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-venus-mars me-1"></i>Gender
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Third Gender" Value="Third Gender"></asp:ListItem>
                        </asp:DropDownList>
                </div>
            </div>
        </div>

        <!-- Row 3 -->
        <div class="row mb-3">
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtDOB" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-calendar-alt me-1"></i>DOB
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control form-control-sm" TextMode="Date" />
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="txtMobileNo" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-mobile-alt me-1"></i>Mobile
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="txtPhoneNo" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-phone me-1"></i>Phone
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>
        </div>

        <!-- Row 4 -->
        <div class="row">
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtEmailID" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-envelope me-1"></i>Email ID
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtEmailID" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>
        </div>

    </div>
</div>





        <!-- Identity & Address Card -->
      <div class="card mb-4 card-gold">
    <div class="card-header py-2">
        <h6 class="mb-0"><i class="fas fa-address-card me-2"></i>Identity & Address</h6>
    </div>
    <div class="card-body py-3 px-4">

        <!-- Row 1 -->
        <div class="row mb-3">
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtPANNo" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-id-badge me-1"></i>PAN No
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtPANNo" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="txtAadharNo" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-fingerprint me-1"></i>Aadhar No
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtAadharNo" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="txtAddress" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-map-marker-alt me-1"></i>Address
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="2" />
                </div>
            </div>
        </div>

        <!-- Row 2 -->
        <div class="row mb-3">
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtCity" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-city me-1"></i>City
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="txtState" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-flag me-1"></i>State
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="txtState" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem Text="ANDAMAN AND NICOBAR ISLANDS" Value="38" />
                        <asp:ListItem Text="ANDHRA PRADESH" Value="39" />
                        <asp:ListItem Text="ARUNACHAL PRADESH" Value="40" />
                        <asp:ListItem Text="ASSAM" Value="41" />
                        <asp:ListItem Text="BIHAR" Value="42" />
                        <asp:ListItem Text="CHANDIGARH" Value="76" />
                        <asp:ListItem Text="CHHATTISGARH" Value="44" />
                        <asp:ListItem Text="DADRA AND NAGAR HAVELI" Value="45" />
                        <asp:ListItem Text="DAMAN AND DIU" Value="46" />
                        <asp:ListItem Text="DELHI" Value="47" />
                        <asp:ListItem Text="GOA" Value="48" />
                        <asp:ListItem Text="GUJARAT" Value="49" />
                        <asp:ListItem Text="HARYANA" Value="50" />
                        <asp:ListItem Text="HIMACHAL PRADESH" Value="51" />
                        <asp:ListItem Text="JAMMU AND KASHMIR" Value="52" />
                        <asp:ListItem Text="JHARKHAND" Value="53" />
                        <asp:ListItem Text="KARNATAKA" Value="54" />
                        <asp:ListItem Text="KERALA" Value="55" />
                        <asp:ListItem Text="LAKSHADWEEP" Value="56" />
                        <asp:ListItem Text="MADHYA PRADESH" Value="57" />
                        <asp:ListItem Text="MAHARASHTRA" Value="58" />
                        <asp:ListItem Text="MANIPUR" Value="59" />
                        <asp:ListItem Text="MEGHALAYA" Value="60" />
                        <asp:ListItem Text="MIZORAM" Value="61" />
                        <asp:ListItem Text="NAGALAND" Value="62" />
                        <asp:ListItem Text="ODISHA" Value="63" />
                        <asp:ListItem Text="PONDICHERRY" Value="65" />
                        <asp:ListItem Text="PUNJAB" Value="66" />
                        <asp:ListItem Text="RAJASTHAN" Value="67" />
                        <asp:ListItem Text="SIKKIM" Value="68" />
                        <asp:ListItem Text="TAMIL NADU" Value="69" />
                        <asp:ListItem Text="TRIPURA" Value="70" />
                        <asp:ListItem Text="UTTAR PRADESH" Value="71" />
                        <asp:ListItem Text="WEST BENGAL" Value="73" />
                        <asp:ListItem Text="TELANGANA" Value="74" />
                        <asp:ListItem Text="UTTARAKHAND" Value="75" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="col-md-4 d-flex align-items-center">
                <label for="txtPinCode" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-mail-bulk me-1"></i>PIN Code
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>
        </div>

        <!-- Row 3 -->
        <div class="row">
            <div class="col-md-4 d-flex align-items-center">
                <label for="txtCountry" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-globe-asia me-1"></i>Country
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>
        </div>

    </div>
</div>

        <!-- Bank Details Card -->
       <div class="card card-gold mb-4">
    <div class="card-header">
        <h5 class="mb-0"><i class="fas fa-university me-2"></i>Bank Details</h5>
    </div>
    <div class="card-body px-3 py-2">

        <div class="row mb-3">
            <div class="col-md-3 d-flex">
                <label for="txtBankIFSC1" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-code me-1"></i> IFSC Code
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtBankIFSC1" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>

            <div class="col-md-3 d-flex">
                <label for="txtBankAccNo1" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-hashtag me-1"></i> Account No
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtBankAccNo1" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>

            <div class="col-md-3 d-flex">
                <label for="ddlBankAccType1" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-wallet me-1"></i> Type
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlBankAccType1" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem Text="Saving" Value="1" />
                        <asp:ListItem Text="Current" Value="2" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="col-md-3 d-flex align-items-center">
                <label for="chkDefaultBank1" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-star me-1"></i> Default
                </label>
                <div class="col-7">
                    <asp:CheckBox ID="chkDefaultBank1" runat="server" CssClass="form-check-input" />
                </div>
            </div>
        </div>

    </div>
</div>



        <!-- DP Details Card -->
        <div class="card card-gold mb-4">
    <div class="card-header">
        <h5 class="mb-0"><i class="fas fa-database me-2"></i>DP Details</h5>
    </div>
    <div class="card-body px-3 py-2">
        <div class="row mb-3">
            <!-- DP Client ID -->
            <div class="col-md-4 d-flex">
                <label for="txtDPClientID1" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-id-badge me-1"></i> DP Client ID
                </label>
                <div class="col-7">
                    <asp:TextBox ID="txtDPClientID1" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>

            <!-- DP Type -->
            <div class="col-md-4 d-flex">
                <label for="ddlDPType1" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-layer-group me-1"></i> DP Type
                </label>
                <div class="col-7">
                    <asp:DropDownList ID="ddlDPType1" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem Text="NSDL" Value="NSDL" />
                        <asp:ListItem Text="CDSL" Value="CDSL" />
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Default DP Checkbox -->
            <div class="col-md-4 d-flex align-items-center">
                <label for="chkDefaultDP1" class="col-5 col-form-label text-end pe-2">
                    <i class="fas fa-star me-1"></i> Default DP
                </label>
                <div class="col-7">
                    <asp:CheckBox ID="chkDefaultDP1" runat="server" CssClass="form-check-input" />
                </div>
            </div>
        </div>
    </div>
</div>


        <!-- Submit Buttons -->
        <div class="text-center mt-3">
           <div class="d-flex justify-content-center gap-3 my-4 flex-wrap">

    <!-- Create UCC Button -->
    <asp:Button ID="btnCreateUCC" runat="server"
        Text=' Create UCC'
        CssClass="btn btn-success btn-lg shadow-sm px-4 fw-semibold d-flex align-items-center gap-2"
        OnClick="btnCreateUCC_Click"
        UseSubmitBehavior="false" />

    <!-- Modify UCC Button -->
    <asp:Button ID="btnModifyUCC" runat="server"
        Text=' Modify UCC'
        CssClass="btn btn-warning btn-lg text-dark shadow-sm px-4 fw-semibold d-flex align-items-center gap-2"
        OnClick="btnModifyUCC_Click"
        UseSubmitBehavior="false" />

    <!-- Delete UCC Button -->
    <asp:Button ID="btnDeleteUCC" runat="server"
        Text=' Delete UCC'
        CssClass="btn  shadow-sm px-4 fw-semibold d-flex align-items-center gap-2"
        OnClick="btnDeleteUCC_Click"
        UseSubmitBehavior="false" />

</div>

             <%--<asp:Button ID="btnCreateUCC" runat="server" Text="Create UCC" CssClass="btn btn-success mx-1" OnClick="btnCreateUCC_Click" />--%>
        </div>
    </div>
</form>



    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
