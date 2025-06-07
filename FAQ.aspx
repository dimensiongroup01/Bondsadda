<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="Signup/css/cashflowstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section class="breadcrumb-collection  py-md-4 gradient" style="font-family: 'Segoe UI', sans-serif;color:white; background: linear-gradient(to right, #085D94, #F57C00);">
            <div class="container">
                <div class="row">
                    <div class="col-12 p-md-3 p-0">
                        <div
                            class="breadcrumbs py-md-2 pt-md-3 px-md-5 pt-3 py-2  px-3 text-white">
                            <h1 class="h3 font-weight-normal ">FAQ</h1>
                            <p class=" font_2">Home / FAQ</p>
                        </div>
                    </div>
                </div>
                
            </div>
        </section>
    <section class=" faq" style="font-family: 'Segoe UI', sans-serif;color:white; background: linear-gradient(to right, #085D94, #F57C00);">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <main>
                            <asp:Panel ID ="pnlView" runat="server">
                                <div class="container">
<%--                                <h2 class="font-weight-bold h3">FAQ</h2>--%>
                                <!--accordion-->
                                <asp:Repeater ID ="rptFAQ" runat="server">
                                    <ItemTemplate>
                                        <div class="accordion">
                                    <div class="accordion-header">
                                        <h3 class="h5 font-weight-normal"><%#Eval("Question") %></h3>
                                        <div class="close"><span></span>
                                            <span></span>
                                        </div>
                                    </div>
                                    <div class="accordion-body">
                                        <p><%#Eval("Answer") %></p>
                                    </div>
                                    <hr class="bg-dark">
                                </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                        
                                 
                                
                                <!--/accordion-->
                                <!--accordion-->
<%--                                <div class="accordion">
                                    <div class="accordion-header">
                                        <h3 class="h5 font-weight-normal">Lorem
                                            ipsum dolor sit
                                            amet, consectetur adipiscing elit,</h3>
                                        <div class="close"><span></span>
                                            <span></span>
                                        </div>
                                    </div>
                                    <div class="accordion-body">
                                        <p>
                                            Lorem Ipsum is simply dummy text of
                                            the printing and typesetting
                                            industry. Lorem Ipsum has been
                                            the industry's standard dummy text
                                            ever since the 1500s, when an
                                            unknown printer took a galley
                                            of type and scrambled it to make a
                                            type specimen book. It has survived
                                            not only five centuries,
                                            but also the leap into electronic
                                            typesetting, remaining essentially
                                            unchanged. It was
                                            popularised in the 1960s with the
                                            release of Letraset sheets
                                            containing Lorem Ipsum passages,
                                            and more recently with desktop
                                            publishing software like Aldus
                                            PageMaker including versions of
                                            Lorem Ipsum</p>
                                    </div>
                                </div>
                                <hr class="bg-dark">
                                <!--/accordion-->
                                <!--accordion-->
                                <div class="accordion">
                                    <div class="accordion-header">
                                        <h3 class="h5 font-weight-normal">Lorem
                                            ipsum dolor sit
                                            amet, consectetur adipiscing elit,</h3>
                                        <div class="close"><span></span>
                                            <span></span>
                                        </div>
                                    </div>
                                    <div class="accordion-body">
                                        <p>
                                            Lorem Ipsum is simply dummy text of
                                            the printing and typesetting
                                            industry. Lorem Ipsum has been
                                            the industry's standard dummy text
                                            ever since the 1500s, when an
                                            unknown printer took a galley
                                            of type and scrambled it to make a
                                            type specimen book. It has survived
                                            not only five centuries,
                                            but also the leap into electronic
                                            typesetting, remaining essentially
                                            unchanged. It was
                                            popularised in the 1960s with the
                                            release of Letraset sheets
                                            containing Lorem Ipsum passages,
                                            and more recently with desktop
                                            publishing software like Aldus
                                            PageMaker including versions of
                                            Lorem Ipsum</p>

                                    </div>
                                </div>
                                <hr class="bg-dark">--%>
                                <!--accordion-->
                            </div>
                            </asp:Panel>
                            
                        </main>

                    </div>
                </div>
            </div>
        </section>
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>--%>

