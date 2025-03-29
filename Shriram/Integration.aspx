\<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Integration.aspx.cs" Inherits="Shriram_Integration" Async="true" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>Schema and Calculator API Interaction</title>
    
    <link rel="stylesheet" type="text/css" href="/css/style_shriram/css/styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Schema API Section -->
            <div class="section">
                <h2>Schema API</h2>
                <div class="form-group">
                    <asp:Label ID="lblAction" runat="server" Text="Action:"></asp:Label><br />
                    <asp:TextBox ID="txtStrAction" runat="server" Placeholder="Action"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblCompany" runat="server" Text="Company:"></asp:Label><br />
                    <asp:TextBox ID="txtStrCompany" runat="server" Placeholder="Company"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblType" runat="server" Text="Type:"></asp:Label><br />
                    <asp:TextBox ID="txtStrType" runat="server" Placeholder="Type"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label><br />
                    <asp:TextBox ID="txtStrGender" runat="server" Placeholder="Gender"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSubmitSchema" runat="server" Text="Submit Schema" OnClick="SubmitSchema" />
                </div>
                  <!-- Response Section -->
                <div class="response-container">
                <asp:Label ID="litResponse" runat="server" Text="" CssClass="response-label" Visible="true"></asp:Label>
                </div>
            </div>

            <!-- Calculator Section -->
            <div class="section">
                <h2>Calculator API</h2>
                <div class="form-group">
                    <asp:Label ID="lblCertDate" runat="server" Text="Cert Date:"></asp:Label><br />
                    <asp:TextBox ID="txtCertDate" runat="server" Placeholder="CertDate"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblInvAmt" runat="server" Text="Investment Amount:"></asp:Label><br />
                    <asp:TextBox ID="txtDblInvamt" runat="server" Placeholder="Investment Amount"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblComp" runat="server" Text="Company:"></asp:Label><br />
                    <asp:TextBox ID="txtStrComp" runat="server" Placeholder="Company"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblInvType" runat="server" Text="Investment Type:"></asp:Label><br />
                    <asp:TextBox ID="txtStrInvType" runat="server" Placeholder="Investment Type"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblSCFlag" runat="server" Text="SC Flag:"></asp:Label><br />
                    <asp:TextBox ID="txtStrSCFlag" runat="server" Placeholder="SC Flag"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblTenure" runat="server" Text="Tenure:"></asp:Label><br />
                    <asp:TextBox ID="txtStrTenure" runat="server" Placeholder="Tenure"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblScheme" runat="server" Text="Scheme:"></asp:Label><br />
                    <asp:TextBox ID="txtScheme" runat="server" Placeholder="scheme"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblSubtype" runat="server" Text="Subtype:"></asp:Label><br />
                    <asp:TextBox ID="txtStrSubtype" runat="server" Placeholder="Subtype"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblGenderCalc" runat="server" Text="Gender:"></asp:Label><br />
                    <asp:TextBox ID="txtStrGenderCalc" runat="server" Placeholder="Gender"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSubmitCalculator" runat="server" Text="Submit Calculator" OnClick="SubmitCalculator" />
                </div>
            </div>

            <!-- CKYC Section -->
            <div class="section">
                <h2>CKYC Section</h2>
                <div class="form-group">
                    <asp:Label ID="lblStrAction" runat="server" Text="Action:"></asp:Label><br />
                    <asp:TextBox ID="TextBox1" runat="server" Placeholder="Action"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblVendorName" runat="server" Text="Vendor Name:"></asp:Label><br />
                    <asp:TextBox ID="txtVendorName" runat="server" Placeholder="Vendor Name"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblBACode" runat="server" Text="BA Code:"></asp:Label><br />
                    <asp:TextBox ID="txtBACode" runat="server" Placeholder="BA Code"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Company:"></asp:Label><br />
                    <asp:TextBox ID="txtCompany" runat="server" Placeholder="Company"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblModule" runat="server" Text="Module:"></asp:Label><br />
                    <asp:TextBox ID="txtModule" runat="server" Placeholder="Module"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblRequestType" runat="server" Text="Request Type:"></asp:Label><br />
                    <asp:TextBox ID="txtRequestType" runat="server" Placeholder="Request Type"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblRequestId" runat="server" Text="Request ID:"></asp:Label><br />
                    <asp:TextBox ID="txtRequestId" runat="server" Placeholder="Request ID"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblDOB" runat="server" Text="Date of Birth:"></asp:Label><br />
                    <asp:TextBox ID="txtDOB" runat="server" Placeholder="Date of Birth"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblMobileNumber" runat="server" Text="Mobile Number:"></asp:Label><br />
                    <asp:TextBox ID="txtMobileNumber" runat="server" Placeholder="Mobile Number"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPincode" runat="server" Text="Pincode:"></asp:Label><br />
                    <asp:TextBox ID="txtPincode" runat="server" Placeholder="Pincode"></asp:TextBox><br />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSubmitCKYC" runat="server" Text="Submit CKYC" OnClick="SubmitCKYC" />
                </div>

                
            </div>
        </div>
    </form>
</body>
</html>
