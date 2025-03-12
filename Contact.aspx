<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <section class="contact-banner mt-md-5">

        <div class="container">
            <asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="uPanel" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-7">
                            <img src="img/contactsvg.svg" alt="">
                        </div>
                        <div class="col-md-5 mt-md-5 mt-4">
                            <div class="box2 p-lg-5 py-4 font_2">
                                <h2 class="h4 py-md-4 py-3 font-weight-normal color1">Get in Touch <span class="color2">with Us!</span></h2>
                                <div>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtFullName" runat="server" placeholder="Full Name"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox type="email" class="form-control" ID="txtEmail" runat="server" placeholder="Email Address"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control numbers" ID="txtMobile" runat="server" placeholder="Mobile Number" onkeypress="limitKeypress(event,this.value,10)"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtSubject" runat="server" placeholder="Subject"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="txtMessage" runat="server" Rows="5" TextMode="MultiLine" placeholder="Drop your message here"></asp:TextBox>
                                    </div>
                                    <asp:Button ID="lnkSubmit" runat="server" CssClass="btn btn1" OnClick="lnkSubmit_Click" Text="Submit" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>



        </div>
    </section>

    <section class="bg1  mb-md-5 mb-3">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5  align-items-center d-flex">
                    <div class="contact-info p-md-0 p-4">
                        <h3 class="text-white font-weight-normal h3 ">Contact Info.</h3>
                        <a href="" class="text-white pb-2 d-inline-block"><i class="fa fa-phone" aria-hidden="true"></i>0120-4376552, 0120-4151349
                        </a>
                        <br>
                        <a href="" class="text-white pb-2 d-inline-block"><i class="fa fa-envelope" aria-hidden="true"></i>customercare@bondsadda.com</a><br>
                        <a href="" class="text-white pb-2 d-inline-block"><i class="fas fa-map-marker"></i>KAUSHAMBI, GHAZIABAD
                            ,
                            <br>
                           Dimension Tower, PLOT NO 10, 3rd Floor,<br />
                            Commercial Area,Kaushambi,<br />
                            Ghaziabad, U.P - 201010</a>




                    </div>
                </div>
                <div class="col-md-6 p-0">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3501.5137762495096!2d77.3250735752419!3d28.644331275658345!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cfbc9245336a5%3A0x2f67b7d888713075!2sDIMENSION%20GROUP!5e0!3m2!1sen!2sin!4v1688798413640!5m2!1sen!2sin" width="100%" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>
    </section>
    <section class="subscribe pb-md-5 pb-3">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="box2 ">
                        <div class="row">
                            <div
                                class="col-md-7 p-md-5 p-5 text-md-left text-center d-flex justify-content-center align-items-center">
                                <div
                                    class="">
                                    <h2 class="font-weight-normal color1 h3">Subscribe
                                        to
                                        our <span class="color2">Newsletter</span></h2>
                                    <p>
                                        DON’T FALL BEHIND<br />
                                        Stay current with a recap of today’s computing news from digital trend by bonds adda.
                                    </p>
                                    <asp:UpdatePanel ID="uPnl" runat="server">
                                        <ContentTemplate>
                                            <div class="form-inline row">
                                                <div
                                                    class="form-group col-md-8 mb-2 pr-md-0">
                                                    <asp:TextBox ID="txtEmailAddress" runat="server"
                                                        class="form-control col-12"
                                                        placeholder="Enter your Email Address"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 mb-2 pl-md-0">
                                                    <asp:Button ID="btnSubscribe" runat="server"
                                                        class="btn btn-dark col-12" Text="Subscribe Now" OnClick="btnSubscribe_Click" />
                                                </div>

                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>

                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-3 ">
                                <img class="d-lg-block d-md-block d-none" src="img/news.svg" alt="">
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>

