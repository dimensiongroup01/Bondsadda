<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="CustomerKYCDetails.aspx.cs" Inherits="CustomerKYCDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="uPanel" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hfStatus" runat="server" />
            <section class="signup-page ">
                <div class="container">
                    <div class="row border ">
                        <div class="col-md-12 ">
                            <h2 class="h3 font-weight-normal">Customer KYC</h2>
                            <br />
                            <div class="row">
                                <asp:Panel ID="pnlAddPAN" runat="server">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="fa-solid fa-address-card"></i></div>
                                            </div>
                                            <asp:TextBox ID="txtPAN" runat="server" type="text" class="form-control" aria-describedby="emailHelp"
                                                placeholder="PAN Number" onkeypress="limitKeypress(event,this.value,10)"></asp:TextBox>

                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPAN"
                                                Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Correct PAN Card Number" ValidationExpression="[A-Z]{5}\d{4}[A-Z]{1}"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlViewKYCDetails" runat="server">
                                    <asp:Repeater ID="rpt" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-12">
                                                <div class="input-group mb-2">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text"><i class="fa-solid fa-address-card"></i></div>
                                                    </div>
                                                    PAN Number :
                                    <asp:Label ID="lblPAN" runat="server" Text=' <%#Eval("PANNumber") %>'></asp:Label>, Status :
                                    
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>

                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </asp:Panel>
                                <asp:Panel ID="pnlAddAdhar" runat="server">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="fa-solid fa-address-card"></i></div>
                                            </div>
                                            <asp:TextBox ID="txtAdhar" runat="server" type="text" class="form-control numbers"
                                                aria-describedby="emailHelp"
                                                placeholder="Adhar Number" onkeypress="limitKeypress(event,this.value,12)"></asp:TextBox>

                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlViewAdhar" runat="server">
                                    <asp:Repeater ID="rptAdhar" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-12">
                                                <div class="input-group mb-2">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text"><i class="fa-solid fa-address-card"></i></div>
                                                    </div>
                                                    Adhar Number :
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("AdharNumber") %>'></asp:Label>, Status :
                                    
                                  <asp:Label ID="Label2" runat="server" Text='<%#Eval("AdharStatus") %>'></asp:Label>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </asp:Panel>

                                <asp:Panel ID="pnlAddDemate" runat="server">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa-solid fa-building-columns"></i>
                                                </div>
                                            </div>
                                            <asp:TextBox ID="txtDemateAccount" runat="server" type="text" class="form-control"
                                                aria-describedby="emailHelp"
                                                placeholder="Demate Account Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlViewDemate" runat="server">
                                    <asp:Repeater ID="rptDemate" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-12">
                                                <div class="input-group mb-2">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text"><i class="fa-solid fa-address-card"></i></div>
                                                    </div>
                                                    Demate Account Number :
                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("DemateAccountNumber") %>'></asp:Label>, Status :
                                    
                                  <asp:Label ID="Label4" runat="server" Text='<%#Eval("DemateStatus") %>'></asp:Label>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>




                                </asp:Panel>
                                <asp:Panel ID="pnlSubmit" runat="server">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="text-align">
                                                <asp:LinkButton ID="lnkKYCSubmit" runat="server" class="btn btn1" OnClientClick="return confirm('Are you sure to add this record?');" OnClick="lnkKYCSubmit_Click">Submit</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                            </div>










                            <div class="col-md-12">
                                <br />
                            </div>
                        </div>
                        <asp:Panel ID="pnlAddBank" runat="server">
                            <div class="col-md-12 ">
                                <h2 class="h3 font-weight-normal">Bank Details</h2>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa-solid fa-building-columns"></i>
                                                </div>
                                            </div>
                                            <asp:TextBox ID="txtAccountNumber" runat="server" type="email" class="form-control"
                                                placeholder="Account Number"></asp:TextBox>
                                        </div>

                                    </div>

                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa-solid fa-user"></i>
                                                </div>
                                            </div>
                                            <asp:TextBox ID="txtFullName" runat="server" class="form-control" placeholder="Your Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa-solid fa-building-columns"></i>
                                                </div>
                                            </div>
                                            <asp:TextBox ID="txtBankName" runat="server" class="form-control" placeholder="Bank Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="fa-solid fa-address-card"></i>
                                                </div>
                                            </div>
                                            <asp:TextBox ID="txtIFSCCode" runat="server" class="form-control"
                                                placeholder="IFSC Code"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <br />
                                <asp:LinkButton ID="lnkSubmit" runat="server" class="btn btn1" OnClientClick="return confirm('Are you sure to add this record?');" OnClick="lnkSubmit_Click">Save Bank Details</asp:LinkButton>

                            </div>
                        </asp:Panel>

                        <asp:Panel ID="pnlViewbank" runat="server">
                            <asp:Repeater ID="rptBank" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-12 ">
                                        <h2 class="h3 font-weight-normal">Bank Details</h2>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="input-group mb-2">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text">
                                                            <i class="fa-solid fa-building-columns"></i>
                                                        </div>
                                                    </div>
                                                    Account Number :
                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("BankAccountNumber") %>'></asp:Label>, Status :
                                    
                                  <asp:Label ID="Label4" runat="server" Text='<%#Eval("BankStatus") %>'></asp:Label>
                                                </div>

                                            </div>

                                            <div class="col-md-6">
                                                <div class="input-group mb-2">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text">
                                                            <i class="fa-solid fa-user"></i>
                                                        </div>
                                                    </div>
                                                    Account Holder :
                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("BankHolderName") %>'></asp:Label>, Status :
                                    
                                  <asp:Label ID="Label6" runat="server" Text='<%#Eval("BankStatus") %>'></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="input-group mb-2">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text">
                                                            <i class="fa-solid fa-building-columns"></i>
                                                        </div>
                                                    </div>
                                                    Bank Name :
                                    <asp:Label ID="Label7" runat="server" Text='<%#Eval("BankName") %>'></asp:Label>, Status :
                                    
                                  <asp:Label ID="Label8" runat="server" Text='<%#Eval("BankStatus") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="input-group mb-2">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text">
                                                            <i class="fa-solid fa-address-card"></i>
                                                        </div>
                                                    </div>
                                                    IFSCCode :
                                    <asp:Label ID="Label9" runat="server" Text='<%#Eval("IFSCCode") %>'></asp:Label>, Status :
                                    
                                  <asp:Label ID="Label10" runat="server" Text='<%#Eval("BankStatus") %>'></asp:Label>
                                                </div>
                                            </div>
                                        </div>



                                        <br />


                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>


                    </div>

                </div>
            </section>
        </ContentTemplate>
    </asp:UpdatePanel>

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

