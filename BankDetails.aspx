<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="BankDetails.aspx.cs" Inherits="BankDeails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Signup/css/css/css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID ="uPanel" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID ="hfBank" runat="server" />
            <asp:HiddenField ID ="hfAdhar" runat="server" />
            <asp:HiddenField ID ="hfPAN" runat="server" />
            <asp:HiddenField ID ="hfDemate" runat="server" />
            <asp:Panel ID="pnlADD" runat="server">
                <div class="section kyc-box py-md-5 py-4">
            <div class="container">
                <div class="row">
                    <div class="col-12 ">
                        <div class="custom-progress-bar text-center">
                            <div class="progress-line understand fill">
                                <h4 class="h6 font-weight-normal">Rquirement</h4>
                                <span>1</span>
                            </div>
                            <div class="progress-line indentity fill">
                                <h4 class="h6 font-weight-normal ">ID Proof</h4>
                                <span>2</span>
                            </div>
                            <div class="progress-line bank fill">
                                <h4 class="h6 font-weight-normal">Bank Details</h4>
                                <span>3</span>
                            </div>
                        </div>
                        <div class="info-box py-md-5 py-5 ">
                            <div class="row">
                                
                                <div class="col-md-6">
                                    <div class="p-md-5">
                                        <div class="form-group">
                                          <label class="font_1" for="exampleFormControlInput1 ">Account Numner</label>
                                          <asp:TextBox ID ="txtAccountNumber" runat="server" class="form-control" placeholder="example: 1234 5678 9010"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                          <label class="font_1" for="exampleFormControlSelect1">Your Name</label>
                                          <asp:TextBox ID ="txtFullName" runat="server" class="form-control" placeholder="example: Jhon"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                          <label class="font_1" for="exampleFormControlSelect1">Bank Name</label>
                                          <asp:TextBox ID ="txtBankName" runat="server"  class="form-control" placeholder="example: HDFC Bank, place, 110001"></asp:TextBox>
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="font_1" for="exampleFormControlTextarea1">IFSC Code</label>
                                          <asp:TextBox ID ="txtIFSCCode" runat="server"  class="form-control" placeholder="example: ABC12345EF"></asp:TextBox>
                                        </div>
                                        <asp:LinkButton ID ="lnkSubmit" runat="server" OnClientClick="return confirm('Are you sure you want submit');" class="btn btn1" OnClick="lnkSubmit_Click">Submit</asp:LinkButton>
                                      </div>    
                                </div>
                                <div class="col-md-6 p-md-5 py-3 align-items-center d-flex">
                                    <div>
                                    <h3 class="font-weight-normal">Disclaimer:</h3>
                                    <p>By entering your bank account details, you hereby authorize Bondsadda or its associates to contact you for seeking physical documents for the information provided for the process.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </asp:Panel>
            <asp:Panel ID ="pnlView" runat="server">
                <div class="section kyc-box py-md-5 py-4">
            <div class="container">
                <div class="row">
                    <div class="col-12 ">
                        <div class="custom-progress-bar text-center">
                            <div class="progress-line understand fill">
                                <h4 class="h6 font-weight-normal">Rquirement</h4>
                                <span>1</span>
                            </div>
                            <div class="progress-line indentity fill">
                                <h4 class="h6 font-weight-normal ">ID Proof</h4>
                                <span>2</span>
                            </div>
                            <div class="progress-line bank fill">
                                <h4 class="h6 font-weight-normal">Bank Details</h4>
                                <span>3</span>
                            </div>
                        </div>
                        <div class="info-box py-md-5 py-5 ">
                            <div class="row">
                               
                                <asp:Repeater ID ="rptBind" runat="server" OnItemDataBound="rptBind_ItemDataBound">
                                    <ItemTemplate>
                               
                                        <div class="col-md-6" runat="server">
                                    <div class="p-md-5">
                                        
                                        <div class="form-group">
                                          <label class="font_1" runat="server" for="exampleFormControlInput1 ">Account Number : <%#Eval("BankStatus") %></label>
                     <asp:TextBox ID="TextBox1" runat="server" class="form-control" disabled="" Text='<%#Eval("BankAccountNumber") %>'>
                         
                     </asp:TextBox>
                                            
                                         </div>
                                        <div class="form-group">
                                          <label class="font_1" runat="server" for="exampleFormControlSelect1">Your Name : <%#Eval("BankStatus") %></label>
                         <asp:TextBox ID="TextBox2" runat="server" class="form-control" disabled="" Text='<%#Eval("BankHolderName") %>'></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                          <label class="font_1" runat="server" for="exampleFormControlSelect1">Bank Name : <%#Eval("BankStatus") %></label>
                        <asp:TextBox ID="TextBox3" runat="server" class="form-control" disabled="" Text='<%#Eval("BankName") %>' ></asp:TextBox>
                                        </div>
                                        
                                        <div class="form-group">
                            <label class="font_1" runat="server" for="exampleFormControlTextarea1">IFSC Code : <%#Eval("BankStatus") %></label>
                      <asp:TextBox ID="TextBox4" runat="server" class="form-control" disabled="" Text='<%#Eval("IFSCCode") %>'></asp:TextBox>
                                        </div>
                   <asp:LinkButton ID ="lnkView" runat="server" class="btn btn1" OnClick="lnkView_Click">Back</asp:LinkButton>
                                </div>
                            </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                
                                <div class="col-md-6 p-md-5 py-3 align-items-center d-flex">
                                    <div>
                                    <h3 class="font-weight-normal">Disclaimer:</h3>
                                    <p>By entering your bank account details, you hereby authorize Bondsadda or its associates to contact you for seeking physical documents for the information provided for the process.</p>

                                           <h3 class="font-weight-normal">KYC Status : <asp:Label ID="lblStatus" runat="server"></asp:Label></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </asp:Panel>

            
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

