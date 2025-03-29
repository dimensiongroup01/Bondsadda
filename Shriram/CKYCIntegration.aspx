<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CKYCIntegration.aspx.cs" Inherits="Shriram_CKYCIntegration" Async="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>CKYC API Interaction</title>
     <link rel="stylesheet" type="text/css" href="/css/style_shriram/css/styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
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
                <div class="response-container">
                <asp:Label ID="litResponse" runat="server" Text="" CssClass="response-label" Visible="true"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>