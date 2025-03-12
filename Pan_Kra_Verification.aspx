<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Pan_Kra_Verification.aspx.cs" Inherits="Pan_Kra_Verification"  Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  

          <asp:UpdatePanel ID="upnl" runat="server">
              <ContentTemplate>
                  <div class="container" style="margin-top:-10px;">
                                      <div class="col-12 py-md-5 py-4">
                                                              <div class="jumbotron box">
                                                                  
                        <h1 class="h3 font-weight-normal color1 text-center">PAN KRA <span class="color2">VERIFICATION</span> </h1>
                                                                                          <div class="form-box px-lg-5">
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="MemberCodeTextBox">PAN NUMBER:</label>
                        <asp:TextBox ID="txtPanNumber" runat="server" style="text-transform:uppercase" CssClass="form-control"></asp:TextBox>
                    </div>

                    <asp:LinkButton ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click"></asp:LinkButton>
                    <br /><br />


                </div>

                <div class="col-md-6 mt-2">
                                        <asp:Label ID="lbl" runat="server"></asp:Label><br />
                    <asp:Label ID="lblPanNumber" runat="server"></asp:Label><br />
                    <asp:Label ID="lblpankrastatus" runat="server"></asp:Label><br />
                    <asp:Label ID="lblkrastatus" runat="server"></asp:Label><br />
                    <asp:Label ID="lblkradescription" runat="server"></asp:Label><br />
                    <asp:Label ID="lblkraagency" runat="server"></asp:Label>
                </div>
            </div>
                                          </div>
                                          </div>
                      </div>
        </div>
      </ContentTemplate>
  </asp:UpdatePanel>
      
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

