

<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="RFQ.aspx.cs" Inherits="RFQ" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom styles */
        .container {
            margin-top: 50px;
        }

        .form-group {
            margin-bottom: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section class="breadcrumb-collection  py-md-4 gradient" style="margin-top:-10px;">
            <div class="container">
                <div class="row">
                    <div class="col-12 p-md-3 p-0">
                        <div
                            class="breadcrumbs py-md-2 pt-md-3 px-md-5 pt-3 py-2  px-3 text-white">
                            <h1 class="h3 font-weight-normal ">RFQ Integration</h1>
                            <p class=" font_2">Home / RFQ Integration</p>
                        </div>
                    </div>
                </div>
                
            </div>
        </section>

    
        <div class="container" style="margin-top:-10px;">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="form-group">
                        <label for="MemberCodeTextBox">MEMBERCODE:</label>
                        <asp:TextBox ID="MemberCodeTextBox" runat="server" CssClass="form-control" Required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="UserIdTextBox">USERID:</label>
                        <asp:TextBox ID="UserIdTextBox" runat="server" CssClass="form-control" Required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="PasswordTextBox">PASSWORD:</label>
                        <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="form-control" Required></asp:TextBox>
                    </div>
                    <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
                    <br /><br />
                    <asp:Label ID="ApiResponseLabel" runat="server" Text="Waiting for API response..." CssClass="text-muted"></asp:Label>
                </div>
            </div>
        </div>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>