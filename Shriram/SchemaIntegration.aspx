<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SchemaIntegration.aspx.cs" Inherits="Shriram_SchemaIntegration" Async="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Schema API Interaction</title>
      <link rel="stylesheet" type="text/css" href="/css/style_shriram/css/styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
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
                <div class="response-container">
                    <asp:Label ID="litResponse" runat="server" Text="" CssClass="response-label" Visible="true"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>