<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="EnquiryForm.aspx.cs" Inherits="EnqueryForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <section class="contact-banner mt-md-5">

        <div class="container">
            <div class="text-center">
                                        <h2 class="h3 font-weight-normal color1">Enquiry <span class="color2">Form</span></h2>
                
            </div>
            <asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server"></asp:ScriptManager>
                                     <asp:UpdatePanel ID="upnl" runat="server">
                          <ContentTemplate>
                <div class="modal-body">
                    <div class="contact-banner">
                                                <div class="box2 p-lg-5 py-4 font_2">
                    <div class="row">
                        <div class="col-md-6">
                    <div class="form-group">
                      <label for="recipient-name" class="col-form-label">First Name</label>
                      <asp:TextBox ID="txtFirstName" runat="server" type="text" class="form-control" placeholder="Enter First Name"></asp:TextBox>
                    </div>
                            </div>
                                      <div class="col-md-6">
                                  <div class="form-group">
                      <label for="recipient-name" class="col-form-label">Last Name</label>
                      <asp:TextBox ID="txtLastName" runat="server" type="text" class="form-control" placeholder="Enter Last Name"></asp:TextBox>
                    </div>
                                          </div>
                                      <div class="col-md-6">
                                  <div class="form-group">
                      <label for="recipient-name" class="col-form-label">Mobile</label>
                      <asp:TextBox ID="txtMobile" runat="server" type="number" class="form-control" placeholder="Enter Mobile"></asp:TextBox>
                    </div>
                                          </div>
                                      <div class="col-md-6">
                                  <div class="form-group">
                      <label for="recipient-name" class="col-form-label">Email</label>
                      <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter Email"></asp:TextBox>
                    </div>
                                          </div>
                                      <div class="col-md-12">
                                  <div class="form-group">
                      <label for="recipient-name" class="col-form-label">Message</label>
                      <asp:textBox ID="txtMessage" runat="server" class="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter Messege Here"></asp:textBox>
                    </div>
                    </div>
        
                <div class="col-md-6">
                            <div class="form-group">
                                  <asp:TextBox ID="txtCapchaCode" runat="server" CssClass="form-control"  placeholder="Enter Security Code Here" title="Enter Security Code Here" />
                              </div>
	                </div>
                <div class="col-md-5">
                          <div class="form-group">
                                <asp:TextBox ID="lblCaptcha" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                              </div>
                          </div>
                 			                <div class="col-md-1">
                          <div class="form-group">
                                     <asp:LinkButton ID="lnkRefresh" runat="server" ToolTip="Load New" OnClick="lnkRefresh_Click"><i class="fa fa-refresh" style="font-size:42px;"></i></asp:LinkButton>                                        
                                              </div>
                                              </div>

                        <div class="col-md-12 text-center">
                            <div class="form-group">
                                <asp:LinkButton ID="lnkSubmit" runat="server" CssClass="btn btn1" OnClick="lnkSubmit_Click">Submit</asp:LinkButton>
                            </div>
                        </div>
                  </div>
                    </div>
                    </div>
                    </div>
                                              </ContentTemplate>
                      </asp:UpdatePanel>



        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

