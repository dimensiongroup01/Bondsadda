<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="BlogNewsDetails.aspx.cs" Inherits="BlogNewsDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        label.form-check-label {
            padding: 5px;
        }

        span .button {
            background: none;
            margin-bottom: 4px;
            padding: 5px 15px;
            border: none;
            font-size: 14px;
            border-radius: 5px;
            background: #e7fde9;
            border: 2px solid #02a713;
            color: #02a713;
            cursor: pointer
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="SM1" EnableCdn="true" runat="server"></asp:ScriptManager>
    <section class="py-md-5 py-4" style="background: linear-gradient(to bottom, #ffffff, rgba(0, 126, 167, 0.15), rgba(0, 53, 77, 0.3));">
        <div class="container">
            <div class="row">

                <div class="col-lg-8">
                    <asp:Repeater ID="rptBlogDetails" runat="server">
                        <ItemTemplate>
                            <div class="post-main-box">
                                <div class="blog-featured-image box">


                                    <div class="overlay p-md-4 py-3">
                                        <p class="mb-0">Date: <%#Eval("BlogDate") %> | Author: <%#Eval("AuthorBy") %></p>
                                        <h1 class="h4 font-weight-normal"><%#Eval("BlogTitle") %>: <%#Eval("BlogSubTitle") %></h1>
                                    </div>
                                    <%--                            <img src="img/blog/blog1.png" class="col-12 p-0 border-0" alt="">--%>
                                    <img src='<%#Eval("BlogImage").ToString().Replace("~/","") %>' class="col-12 p-0 border-0" alt="" />
                                </div>
                                <div class="content-area">
                                    <div class="summery py-md-5 px-md-1 py-4">
                                        <p class="h6"><q><i><%#Eval("MetaDescription") %></i></q></p>
                                    </div>
                                    <p><%#Eval("Description") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div class="col-lg-4 pr-md-0">
                    <div class="main-box px-3 ">
                        <div class="row" >
                            <div class="box p-4 col-lg-12 col-md-6 font_2">
                                <h2 class="h4 font-weight-normal color2">Filter</h2>
                                <hr>
                                <div class="bond-category">
                                    <h4 class="h6 font-weight-normal">Type of Bonds:</h4>

                                    <div action="" method="get">
                                        <asp:Repeater ID="rptTags" runat="server">
                                            <ItemTemplate>

                                                <asp:LinkButton ID="lnkdetail" runat="server"  style="text-decoration: none; color: #000;" CommandArgument='<%#Eval("BlogCategoryId") %>' OnClick="lnkdetail_Click"><%#Eval("BlogcategoryHead") %></asp:LinkButton>


                                                <br />


                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </div>
                                </div>
                                <hr>
                                <div class="bond-rating">
                                    <h4 class="h6 font-weight-normal">Blog Tags</h4>
                                    <span class="button">
                                        <asp:Repeater ID="rptCreditRating" runat="server">
                                            <ItemTemplate>

                                                <asp:Button ID="btnCredit" runat="server" CssClass="button" OnClick="btnCredit_Click" CommandArgument='<%#Eval("TagsId") %>' Text='<%#Eval("TagsHead") %>' />

                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </span>

                                </div>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <asp:UpdatePanel ID="uPanel" runat="server">
        <ContentTemplate>
            <section class="subscribe pb-md-5 pb-3">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="box2 ">
                                <div class="row">
                                    <div
                                        class="col-md-7 p-md-5 p-5 text-md-left text-center d-flex justify-content-center align-items-center">
                                        <div
                                            class>
                                            <h2 class="font-weight-normal color1 h3">Subscribe
                                        to
                                        our <span class="color2">Newsletter</span></h2>
                                            <p>
                                                DON’T FALL BEHIND<br />
                                                Stay current with a recap of today’s computing news from digital trend by bonds adda.
                                            </p>
                                            <div class="form-inline row">
                                                <div
                                                    class="form-group col-md-8 mb-2 pr-md-0">
                                                    <asp:TextBox ID="txtEmail" runat="server"
                                                        class="form-control col-12"
                                                        placeholder="Enter your Email Address"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 mb-2 pl-md-0">
                                                    <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe Now"
                                                        class="btn btn-dark col-12 " OnClick="btnSubscribe_Click"></asp:Button>

                                                </div>

                                            </div>
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
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>

