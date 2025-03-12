<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="IDProofDetails.aspx.cs" Inherits="IDProofDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Signup/css/css/css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID ="uPanel" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID ="hfAdhar" runat="server" />
            <asp:HiddenField ID ="hfPAN" runat="server" />
            <asp:HiddenField ID ="hfDemate" runat="server" />
            <asp:HiddenField ID="hfBankDetail" runat="server" />
            <asp:Panel ID ="pnlADD" runat="server">
                <div class="section kyc-box py-md-5 py-4">
            <div class="container">
                <div class="row">
                    <div class="col-12 ">
                        <div class="custom-progress-bar text-center">
                            <div class="progress-line understand fill">
                                <h4 class="h6 font-weight-normal">Rquirement</h3>
                                <span>1</span>
                            </div>
                            <div class="progress-line indentity fill">
                                <h4 class="h6 font-weight-normal ">ID Proof</h3>
                                <span>2</span>
                            </div>
                            <div class="progress-line bank">
                                <h4 class="h6 font-weight-normal">Bank Details</h3>
                                <span>3</span>
                            </div>
                        </div>
                        <div class="info-box py-md-5 py-5 ">
                            <div class="row">
                                <div class="col-md-6 p-md-5 align-items-center d-flex">
                                    <div>
                                    <h3 class="font-weight-normal">Disclaimer:</h3>
                                    <p>By entering your personal details, you hereby authorize Bondsadda or its associates to contact you for seeking physical documents for the information provided for the KYC form.</p>

                                    </div>
                                    

                                </div>
                                
                                    <div class="col-md-6" runat="server" id="vAdd">
                                    <div class="p-md-5">
                                        <div class="form-group">
                                          <label class="font_1" for="exampleFormControlInput1 ">PAN Card Number</label>
                                 <asp:TextBox ID="txtPAN" runat="server" class="form-control" placeholder="PAN Number" onkeypress="limitKeypress(event,this.value,10)"></asp:TextBox>
                                        </div>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPAN"
                    Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Correct PAN Card Number" ValidationExpression="[A-Z]{5}\d{4}[A-Z]{1}"></asp:RegularExpressionValidator>
                                        <div class="form-group">
                                          <label class="font_1" for="exampleFormControlSelect1">Adhaar Card Number</label>
                            <asp:TextBox ID="txtAdhar" runat="server" class="form-control numbers" placeholder="example: 1234 5678 9010" onkeypress="limitKeypress(event,this.value,12)"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                          <label class="font_1" for="exampleFormControlSelect1">DP ID</label>
                                          <asp:TextBox ID ="txtDemate" runat="server" class="form-control numbers" placeholder="example: 12345"></asp:TextBox>
                                        </div>
                                      <div class="form-group">
                                          <label class="font_1" for="exampleFormControlSelect1">Client ID</label>
                                          <asp:TextBox ID ="txtClientId" runat="server" class="form-control numbers" placeholder="example: 12345"></asp:TextBox>
                                        </div>
                                        
                                        <div class="form-group">
                                          <label class="font_1" for="exampleFormControlTextarea1">Something we should know.</label>
                                          <asp:TextBox ID="txtDescription" runat="server" class="form-control" rows="3"></asp:TextBox>
                                        </div>
                                        <asp:LinkButton ID ="lnkSubmit" runat="server" class="btn btn1" OnClientClick="return confirm('Are you sure you want submit');" OnClick="lnkSubmit_Click">Save & Next</asp:LinkButton>
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
                                <h4 class="h6 font-weight-normal">Rquirement</h3>
                                <span>1</span>
                            </div>
                            <div class="progress-line indentity fill">
                                <h4 class="h6 font-weight-normal ">ID Proof</h3>
                                <span>2</span>
                            </div>
                            <div class="progress-line bank">
                                <h4 class="h6 font-weight-normal">Bank Details</h3>
                                <span>3</span>
                            </div>
                        </div>
                        <div class="info-box py-md-5 py-5 ">
                            <div class="row">
                                <div class="col-md-6 p-md-5 align-items-center d-flex">
                                    <div>
                                    <h3 class="font-weight-normal">Disclaimer:</h3>
                                    <p>By entering your personal details, you hereby authorize Bondsadda or its associates to contact you for seeking physical documents for the information provided for the KYC form.</p>
                                        <br />
                                          <h3 class="font-weight-normal">KYC Status : <asp:Label ID="lblStatus" runat="server"></asp:Label></h3>

                                    </div>
                                </div>
                                
                                    <asp:Repeater ID ="rptBind" runat="server" OnItemDataBound="rptBind_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="col-md-6" runat="server">
                                    <div class="p-md-5">
                                        <div class="form-group">
                                          <label class="font_1" runat="server" for="exampleFormControlInput1 ">PAN Number : <%#Eval("Status") %></label>
                     <asp:TextBox ID="TextBox1" runat="server" class="form-control" Text='<%#Eval("PANNumber") %>'>                       
                     </asp:TextBox>
                                                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1"
                    Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Correct PAN Card Number" ValidationExpression="[A-Z]{5}\d{4}[A-Z]{1}"></asp:RegularExpressionValidator>
                                         </div>
                                        <div class="form-group">
                                          <label class="font_1" runat="server" for="exampleFormControlSelect1">Adhaar Number : <%#Eval("AdharStatus") %></label>
                         <asp:TextBox ID="TextBox2" runat="server" class="form-control" onkeypress="limitKeypress(event,this.value,12)" Text='<%#Eval("AdharNumber") %>'></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                          <label class="font_1" runat="server" for="exampleFormControlSelect1">DP ID : <%#Eval("DemateStatus") %></label>
                        <asp:TextBox ID="TextBox3" runat="server" class="form-control" disabled="" Text='<%#Eval("DemateAccountNumber") %>' ></asp:TextBox>

                                        </div>
                                                                                <div class="form-group">
                                          <label class="font_1" runat="server" for="exampleFormControlSelect1">Client Id : <%#Eval("DemateStatus") %></label>
                        <asp:TextBox ID="TextBox5" runat="server" class="form-control" disabled="" Text='<%#Eval("ClientId") %>' ></asp:TextBox>

                                        </div>
                                        
                                        <div class="form-group">
                            <label class="font_1" runat="server" for="exampleFormControlTextarea1">Something we should know.</label>
                      <asp:TextBox ID="TextBox4" runat="server" class="form-control" disabled="" Text='<%#Eval("AdharDescription") %>'></asp:TextBox>
                                        </div>
                   <asp:LinkButton ID ="lnkView" runat="server" class="btn btn1" OnClick="lnkView_Click">Next</asp:LinkButton>
                <asp:LinkButton ID ="lnkReSubmit" runat="server" class="btn btn1" OnClick="lnkReSubmit_Click">Submit</asp:LinkButton>
                                </div>
                            </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                
                                
                                
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
     <script>
             $('.numbers').keypress(function (e) {
                 if (String.fromCharCode(e.keyCode).match(/[^0-9]/g)) return false;
             });
         </script>
                            <script>
                                function limitKeypress(event, value, maxLength) {
                                    if (value != undefined && value.toString().length >= maxLength) {
                                        event.preventDefault();
                                    }
                                }
                            </script>
</asp:Content>

