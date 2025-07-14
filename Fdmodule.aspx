<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fdmodule.aspx.cs" Inherits="Fdmodule" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FD Registration Form</title>
    <style>
        .form-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        .form-group {
            margin-bottom: 12px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
        }
        .form-actions {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>FD Registration Form</h2>

            <div class="form-group">
                <label for="txtName">Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
            </div>

            <div class="form-group">
                <label for="txtPAN">PAN</label>
                <asp:TextBox ID="txtPAN" runat="server" CssClass="form-control" MaxLength="10" />
            </div>

            <div class="form-group">
                <label for="txtAadhaar">Aadhaar</label>
                <asp:TextBox ID="txtAadhaar" runat="server" CssClass="form-control" MaxLength="12" />
            </div>

            <div class="form-group">
                <label for="ddlFDType">FD Type</label>
                <asp:DropDownList ID="ddlFDType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="-- Select FD Type --" Value="" />
                    <asp:ListItem Text="SANCHAY" Value="SANCHAY" />
                    <asp:ListItem Text="SHRI RAM FINANCE" Value="SHRIRAM" />
                    <asp:ListItem Text="BAJAJ" Value="BAJAJ" />
                    <asp:ListItem Text="PNB" Value="PNB" />
                   
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="fuPAN">Upload PAN (PDF/JPG)</label>
                <asp:FileUpload ID="fuPAN" runat="server" />
            </div>

            <div class="form-group">
                <label for="fuAadhaar">Upload Aadhaar (PDF/JPG)</label>
                <asp:FileUpload ID="fuAadhaar" runat="server" />
            </div>

            <div class="form-actions">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>