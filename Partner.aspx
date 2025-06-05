<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Partner.aspx.cs" Inherits="Partner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .upload label {
            cursor: pointer;
            /* Style as you please, it will become the visible UI component. */
            
        }

        .upload #upload-photo {
            opacity: 1;
            /* position: absolute; */
            border: 3px dashed lightgray ;
            z-index: 0;
        }
    </style>
    <section style="font-family: 'Segoe UI', sans-serif; background: linear-gradient(to right, #085D94, #F57C00);  ">
           <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <div class="container">

            <div class="row">
                <div class="col-12 py-md-5 py-4 text-center">

                    
                    <div class="jumbotron box">
                        <h1 class="h3 font-weight-normal color1">BUSINESS <span class="color2">PARTNERS</span> </h1>
                        <p class="lead">Start your own Business</p>

                        <div class="form-box px-lg-5">
                            <hr class="my">
                            <ul class="text-left">
                                <li>We known for life-long and steady relationships with our Business
                                    Partners/Associates.</li>
                                <li>We believe in long-term commitment & association that plays a vital role in the
                                    growth of the business.</li>
                                <li>We believes in growing with our Business Partners/Associates.</li>
                                <li>To Be most trusted & preferred diversified financial services Provider.</li>
                                <li>We provide the most appropriate and reliable Financial Services through well
                                    informed & knowledgeable</li>
                                <li>resource, committed employees & Innovation. </li>
                            </ul>
                            <hr>
                            <div class="text-left font_2 ">
                                <div class="row">
                                    <div class="form-group col-md-4 mb-md-3 mb-0">
                                        <label for="exampleFormControlInput1">Name:</label>
                                        <asp:TextBox ID ="txtFirstName" runat="server" class="form-control"
                                            placeholder="First Name*"></asp:TextBox>
                                      
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name Required" ForeColor="Red" Visible="true"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-0">
                                        <label for="exampleFormControlInput1"></label>
                                        <asp:TextBox ID ="txtMiddleName" runat="server" class="mt-2 form-control"
                                            placeholder="Middle Name"></asp:TextBox>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-0">
                                        <label for="exampleFormControlInput1 "></label>
                                        <asp:TextBox ID="txtLastname" runat="server" class="mt-2 form-control"
                                            placeholder="Last Name*"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>

                                </div>
                                <hr>
                                <div class="row">
                                    <div class="form-group col-md-6 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Email Address:<span style="color:red">*</span></label>
                                        <asp:TextBox ID="txtEmail" runat="server" type="email" class="form-control"
                                            placeholder="abc@example.com"></asp:TextBox>

                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-6 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Mobile Number<span style="color:red">*</span></label>
                                        <asp:TextBox ID="txtMobile" runat="server" type="number" MaxLength="10" class="form-control"
                                            placeholder="Mobile No." onkeypress="limitKeypress(event,this.value,10)"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile Number Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="form-group col-md-6 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Address:<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtAddress" runat="server" class="form-control"
                                            placeholder="example: 3rd floor"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-6 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Apartment, Suite, etc.</label>
                                        <asp:TextBox ID ="txtAppartment" runat="server" class="form-control"
                                            placeholder="Appartment "></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-3 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">City<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtCity" runat="server" class="form-control"
                                            placeholder="City Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCity" ErrorMessage="City Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-md-3 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">State / Province /Region<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtState" runat="server" class="form-control"
                                            placeholder="State Name"></asp:TextBox>
                                                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtState" ErrorMessage="State Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-md-3 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">Country<span style="color:red">*</span></label>
                                        <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
                                       
                                            </asp:DropDownList>
                                                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlCountry" ErrorMessage="Country Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-md-3 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">Postal Code<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtPostalCode" runat="server" class="form-control"
                                            placeholder="Postal code"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Postal Code Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <hr>
                                <p><b>Bank Account Details for Brokerage/other payments</b></p>
                                <div class="row">
                                    <div class="form-group col-md-12 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Full Name:<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtBankHolderName" runat="server" class="form-control"
                                            placeholder="Account holder name"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtBankHolderName" ErrorMessage="Bank Holder Name Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">Bank Name:<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtBankName" runat="server" class="form-control"
                                            placeholder="Bank Name"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtBankName" ErrorMessage="Bank Name Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>

                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">Branch:<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtBankBranch" runat="server" class="form-control"
                                            placeholder="Branch Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtBankBranch" ErrorMessage="Branch Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">City:<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtBankCity" runat="server" class="form-control"
                                            placeholder="Bank City Name"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtBankCity" ErrorMessage="Bank City Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Account Number:<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtAccountNumber" runat="server" class="form-control"
                                            placeholder="Account Number"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtAccountNumber" ErrorMessage="Account Number Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">MICR Code:</label>
                                        <asp:TextBox ID ="txtMICRCode" runat="server" class="form-control"
                                            placeholder="MICR Code"></asp:TextBox>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">IFSC Code:<span style="color:red">*</span></label>
                                        <asp:TextBox ID="txtBankIFSCCode" runat="server" class="form-control"
                                            placeholder="IFSC Code"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtBankIFSCCode" ErrorMessage="IFSC Code Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                </div>
                                <hr>
                                <p><b>Upload your Verification Documents</b></p>
                                <div class="row upload">
                                    <div class="form-group col-md-6 mb-md-3 mb-3">
                                        <label for="upload-photo">Upload your Aadhaar<span style="color:red">*</span></label>
                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                         <progress id="AdharfileProgress" style="display: none"></progress>
                      <asp:HiddenField ID="hfAdharFilePath" runat="server" />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Aadhaar Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
                                       <%-- <input type="file" class="form-control" id="upload-photo"
                                            placeholder="">--%>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-6 mb-md-3 mb-3">
                                        <label for="upload-photo">Upload your PAN Card<span style="color:red">*</span></label>
                                        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
                                         <progress id="PANfileProgress" style="display: none"></progress>
                      <asp:HiddenField ID="hfPANFilePath" runat="server" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="FileUpload2" ErrorMessage="PAN Card Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
                                     <%--   <input type="file" class="form-control" id="upload-photo"
                                            placeholder="">--%>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                </div>
                                <p><b>Enter your DEMAT details</b></p>
                                <div class="row ">
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="upload-photo">DEMAT Account Type<span style="color:red">*</span></label>
                                        <asp:DropDownList ID="ddlDematetype" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlDematetype_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Value="" Selected="True">Choose One</asp:ListItem>
                                            <asp:ListItem Value="NSDL">NSDL</asp:ListItem>
                                            <asp:ListItem Value="CDSL">CDSL</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="ddlDematetype" ErrorMessage="Demat Type Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="upload-photo">DP Name<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtDPName" runat="server" class="form-control"
                                            placeholder="DP Name"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtDPName" ErrorMessage="DP Name Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3" runat="server" id="vDPId">
                                        <label for="upload-photo">DP ID<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtDPId" runat="server" class="form-control" MaxLength="8"
                                            placeholder="Enter 8 digit DP ID"></asp:TextBox>
                                                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3" runat="server" id="vClientId">
                                        <label for="upload-photo">Client ID<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtClientId" runat="server" class="form-control" MaxLength="8"
                                            placeholder="Enter 8 digit Client Id"></asp:TextBox>
                                                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>

                                    <div class="form-group col-md-4 mb-md-3 mb-3" runat="server" id="vFull">
                                        <label for="upload-photo">CDSL Id<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtCDSLId" runat="server" class="form-control" MaxLength="16"
                                            placeholder="Enter 16 digit Id"></asp:TextBox>
                                                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name Required" ForeColor="Red"  ValidationGroup="PartnerDetails"></asp:RequiredFieldValidator>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Is there something we should know?</label>
                                    <asp:TextBox ID="txtDescription" runat="server" class="form-control" TextMode="MultiLine" rows="5" placeholder="if any"></asp:TextBox>
                                </div>
                                <div class="text-center">
                                    <asp:LinkButton ID="lnkSubmit" runat="server" CssClass="btn btn1" OnClick="lnkSubmit_Click" CausesValidation="true" ValidationGroup="PartnerDetails">Submit</asp:LinkButton>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

