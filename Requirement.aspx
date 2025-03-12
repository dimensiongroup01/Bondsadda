<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Requirement.aspx.cs" Inherits="Requirement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Signup/css/css/css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
    <div class="section kyc-box py-md-5 py-4">
            <div class="container">
                <div class="row">
                    <div class="col-12 ">
                        <div class="custom-progress-bar text-center">
                            <div class="progress-line understand fill">
                                <h4 class="h6 font-weight-normal">Rquirement</h4>
                                <span>1</span>
                            </div>
                            <div class="progress-line indentity ">
                                <h4 class="h6 font-weight-normal">ID Proof</h4>
                                <span>2</span>
                            </div>
                            <div class="progress-line bank">
                                <h4 class="h6 font-weight-normal">Bank Details</h4>
                                <span>3</span>
                            </div>
                        </div>
                        <div class="info-box py-md-5 py-5">
                            <h3 class="h4 font-weight-normal">Identification Proof</h3>
                        <%--    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Est, velit quas adipisci rem asperiores quaerat dolor autem dignissimos quibusdam dolorum quod suscipit in laudantium, provident non aspernatur, enim consectetur fuga?</p>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Est, velit quas adipisci rem asperiores quaerat dolor autem dignissimos quibusdam dolorum quod suscipit in laudantium, provident non aspernatur, enim consectetur fuga?</p>
                            <h3 class="h4 font-weight-normal">Bank Details</h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Est, velit quas adipisci rem asperiores quaerat dolor autem dignissimos quibusdam dolorum quod suscipit in laudantium, provident non aspernatur, enim consectetur fuga?</p>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Est, velit quas adipisci rem asperiores quaerat dolor autem dignissimos quibusdam dolorum quod suscipit in laudantium, provident non aspernatur, enim consectetur fuga?</p>--%>
                            <p>What are the documentary proofs required to support identity and address?
Proof of identity/ Identification Proof
</p>
                            <ul>
                                <li>
                                    Passport
                                </li>
                                <li>
                                    PAN Card (Mandatory)
                                </li>
                                <li>
                                    Adhar Card (Mandatory)
                                </li>
                                <li>
                                    Voter ids
                                </li>
                            </ul>
                             <h3 class="h4 font-weight-normal">Bank Details Disclaimer :</h3>
                            <p>For bank details, Bondsadda or our associates shall seek Bank Account Number, IFSC Code and Cancelled Cheque to authenticate and proceed with your KYC process.</p>
                        </div>
                        <div class="text-center">

                            <a href="<%=ResolveUrl("~")%>IDProofDetails" class="btn btn1">I Understood</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

