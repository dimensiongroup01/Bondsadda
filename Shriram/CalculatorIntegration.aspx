<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CalculatorIntegration.aspx.cs" Inherits="Shriram_CalculatorIntegration" Async="true" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Calculator API Interaction</title>
     <link rel="stylesheet" type="text/css" href="/css/style_shriram/css/styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
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
                 <div class="response-container">
     <asp:Label ID="litResponse" runat="server" Text="" CssClass="response-label" Visible="true"></asp:Label>
 </div>
            </div>
        </div>
    </form>
</body>
</html>