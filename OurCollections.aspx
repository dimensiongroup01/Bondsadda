﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="OurCollections.aspx.cs" Inherits="OurCollections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        table#ContentPlaceHolder1_ddlInvest {
            padding: 0px !IMPORTANT;
        }

        table#ContentPlaceHolder1_ddlYield {
            padding: 0px !IMPORTANT;
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

        span.kgs {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2; /* number of lines to show */
            line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        span.mmm {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1; /* number of lines to show */
            line-clamp: 1;
            -webkit-box-orient: vertical;
        }
        /*               input#ContentPlaceHolder1_rptCreditRating_btnCredit_0 {
    background: #e7fde9;
    border: 2px solid #02a713;
    color: #02a713;
    cursor: pointer;
}*/
        span.abs {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1; /* number of lines to show */
            line-clamp: 1;
            -webkit-box-orient: vertical;
        }

        .table-paging {
            border: 1px solid #ff00dc2b;
            width: fit-content;
        }

            .table-paging tbody tr td {
                border: 1px solid #ff00dc2b;
            }

                .table-paging tbody tr td a {
                    padding: 10px;
                }

                .table-paging tbody tr td .aspNetDisabled {
                    padding: 10px;
                    color: #cec072;
                }
                .filter-scroll-wrapper {
        max-height: 600px; /* Adjust height as needed */
        overflow-y: auto;
        padding-right: 10px;
        scrollbar-width: thin; /* Firefox */
    }

    /* Optional for better styling in WebKit browsers */
    .filter-scroll-wrapper::-webkit-scrollbar {
        width: 6px;
    }

    .filter-scroll-wrapper::-webkit-scrollbar-thumb {
        background-color: #f39c12;
        border-radius: 10px;
    }

    .filter-scroll-wrapper::-webkit-scrollbar-track {
        background-color: #f0f0f0;
    }
.highlight-marquee {
  margin: 5px;
  color: #335682;
  border: 2px solid #5183BE;
  border-radius: 12px;
  padding: 16px 0;
  overflow: hidden;
  font-size: 1.1rem;
  font-weight: bold;
  white-space: nowrap;
  box-shadow: 0 0 12px rgba(255, 204, 0, 0.5);
  position: relative;
  text-shadow: 0 0 4px rgba(255, 255, 255, 0.6);
  animation: marqueeGlow 2s ease-in-out infinite alternate;
}

.highlight-track {
  display: inline-block;
  white-space: nowrap;
  animation: scrollLeft 12s linear infinite;
}

.highlight-marquee:hover .highlight-track {
  animation-play-state: paused;
}

.highlight-text {
  display: inline-block;
  padding-right: 200px;
}

@keyframes scrollLeft {
  0% {
    transform: translateX(0%);
  }
  100% {
    transform: translateX(-50%);
  }
}

@keyframes marqueeGlow {
  0% {
    box-shadow: 0 0 10px #007bff;
  }
  100% {
    box-shadow: 0 0 18px #5082BD;
  }
}    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="hfIPDateaaa" runat="server" />
    <asp:HiddenField ID="hfFrequencyType" runat="server" />
    <asp:HiddenField ID="hfQuar" runat="server" />
    <asp:HiddenField ID="hfPageCount" runat="server" />
    <asp:HiddenField ID="hfData" runat="server" />
    <asp:HiddenField ID="hfDataa" runat="server" />
    <asp:HiddenField ID="hfUserId" runat="server" />
    <asp:HiddenField ID="hfRequestQueryingstring" runat="server" />
    <asp:HiddenField ID="hfCreditRating" runat="server" />
    <asp:HiddenField ID="hfTagsData" runat="server" />
    <asp:HiddenField ID="hfCheckdata" runat="server" />
    <asp:HiddenField ID="hfInvest" runat="server" />
    
    <div class="gradient">
        <section class="breadcrumb-collection py-md-4">
            <div class="container">
                <div class="row">
                    <div class="col-12 p-md-0 p-0">
                        <div class="breadcrumbs py-md-2 pt-md-3 px-md-5 pt-3 py-2  px-3 text-white">
                            <h1 class="h3 font-weight-normal ">Our
                            Collections</h1>
                            <p class=" font_2">Home / Collections</p>
                        </div>
<div class="highlight-marquee">
  <div class="highlight-track">
    <span class="highlight-text">
      🔔 <strong>Important:</strong> The mentioned rates are subject to market conditions & availability. Please confirm the rates and availability of securities before finalizing. 
    </span>
    <span class="highlight-text">
      🔔 <strong>Important:</strong> The mentioned rates are subject to market conditions & availability. Please confirm the rates and availability of securities before finalizing. 
    </span>
  </div>
</div>
                    </div>
                </div>
            </div>
        </section>
        <section class="collection ">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 pr-md-0 sidebar overflow-scroll filter-scroll-wrapper">
                        <div class="main-box px-3 ">
                            <div class="row box ">
                                <div class="p-4 col-lg-12 col-md-6 font_2">
                                    <h2 class="h4 font-weight-normal color2">Filter</h2>
                                    <hr>
                                    <div class="bond-category">
                                        <h4 class="h6 font-weight-normal">Type of Bonds:</h4>

                                        <div action="" method="get">
                                            <%--       <asp:Repeater ID ="rptCategory" runat="server" OnItemDataBound="rptCategory_ItemDataBound">
                                        <ItemTemplate>--%>

                                            <asp:CheckBoxList ID="chkData" runat="server" class="table-check-input" type="checkboxlist" OnSelectedIndexChanged="chkData_SelectedIndexChanged" AutoPostBack="true" DataTextField="CategoryHead" DataValueField="CategoryId" />

                                            <%--                                        </ItemTemplate>
                                    </asp:Repeater>--%>
                                            <%--                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">

                                                Sovereign Gold Bonds
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckChecked">
                                            <label class="form-check-label" for="flexCheckChecked">
                                                Listed Corporate Bonds
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckChecked">
                                            <label class="form-check-label" for="flexCheckChecked">
                                                NCD IPOs
                                            </label>
                                        </div>--%>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="bond-rating">
                                        <h4 class="h6 font-weight-normal">Credit Rating:</h4>
                                        <span class="button">
                                            <asp:Repeater ID="rptCreditRating" runat="server">
                                                <ItemTemplate>

                                                    <asp:Button ID="btnCredit" runat="server" CssClass="button" OnClick="btnCredit_Click" CommandArgument='<%#Eval("CreditRatingId") %>' Text='<%#Eval("CreditRating") %>' />

                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </span>
                                        <%--                                    <button>A</button>
                                    <button>A+</button>
                                    <button>AA</button>
                                    <button>AA+</button>
                                    <button>A-</button>
                                    <button>AA-</button>
                                    <button>BBB+</button>
                                    <button>BBB-</button>--%>
                                    </div>
                                    <hr>

                                    <div class="bond-category">
                                        <h4 class="h6 font-weight-normal">Type of Tags:</h4>

                                        <div action="" method="get">
                                            <%--       <asp:Repeater ID ="rptCategory" runat="server" OnItemDataBound="rptCategory_ItemDataBound">
                                        <ItemTemplate>--%>

                                            <asp:CheckBoxList ID="checkTags" runat="server" class="table-check-input" type="checkboxlist" DataTextField="TagsHead" DataValueField="TagsId" AutoPostBack="true" OnSelectedIndexChanged="checkTags_SelectedIndexChanged" />

                                            <%--                                        </ItemTemplate>
                                    </asp:Repeater>--%>
                                        </div>
                                    </div>

                                    <hr />

                                    <asp:Panel ID="pnlInvestment" runat="server">
                                        <div class="bond-investment">
                                            <h4 class="h6 font-weight-normal">Investment:</h4>
                                            <div action="" method="get">
                                                <asp:RadioButtonList ID="ddlInvest" runat="server" CssClass="form-input" OnSelectedIndexChanged="ddlInvest_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Value="0">Less then 1 Lac</asp:ListItem>
                                                    <asp:ListItem Value="1">1-10 Lac</asp:ListItem>
                                                    <asp:ListItem Value="2">10 Lac +</asp:ListItem>
                                                </asp:RadioButtonList>

                                                <%--                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">

                                                Less Than 1 Lac
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckChecked">
                                            <label class="form-check-label" for="flexCheckChecked">
                                                1 - 10 Lac
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckChecked">
                                            <label class="form-check-label" for="flexCheckChecked">
                                                10 Lac +
                                            </label>
                                        </div>--%>
                                            </div>
                                        </div>
                                        <hr>
                                    </asp:Panel>


                                    <asp:Panel ID="pnlYield" runat="server">
                                        <div class="bond-investment">
                                            <h4 class="h6 font-weight-normal">Yield Bonds:</h4>
                                            <div action="" method="get">
                                                <asp:RadioButtonList ID="ddlYield" runat="server" CssClass="form-check-label" OnSelectedIndexChanged="ddlYield_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Value="8">Upto 8%</asp:ListItem>
                                                    <asp:ListItem Value="10">Upto 8-11%</asp:ListItem>
                                                    <asp:ListItem Value="11">11% +</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <%--<div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">

                                                Upto 8%
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckChecked">
                                            <label class="form-check-label" for="flexCheckChecked">
                                                Upto 8 to 11%
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                id="flexCheckChecked">
                                            <label class="form-check-label" for="flexCheckChecked">
                                                11% +
                                            </label>
                                        </div>--%>
                                            </div>
                                        </div>
                                        <hr>
                                    </asp:Panel>


                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-9 pl-md-4">

                        <div id="myDiv" class="row">
                            <asp:Repeater ID="rptData" runat="server" OnItemDataBound="rptData_ItemDataBound">
                                <ItemTemplate>

                                    <div class="col-lg-4 col-md-6 col-12 border-0">
                                        <div class="box">
                                            <button class="status-button">OPEN</button>
                                            <br>
                                            <div class="box0">
                                                <div class="row">
                                                    <div class="col-7">
                                                        <h3 class="h6 font-weight-normal">
                                                            <span class="kgs" style="text-transform: capitalize;" title='<%#Eval("Security") %>'>
                                                                <%#Eval("Security") %>
                                                                <asp:Label ID="hfPayment" runat="server" Visible="false" Value='<%#Eval("PaymentTypeHead") %>' />
                                                                <asp:Label ID="hfEOM" runat="server" Visible="false" Value='<%#Eval("EOM") %>' />
                                                                <asp:HiddenField ID="lblIP" runat="server" Value='<%#Eval("IPDate") %>' />
                                                            </span>

                                                        </h3>
                                                    </div>
                                                    <asp:HiddenField ID="hfProductName" runat="server" Value='<%#Eval("ProductName") %>' />
                                                    <asp:HiddenField ID="hfCategory" runat="server" Value='<%#Eval("CategoryId") %>' />
                                                    <div class="col-5">
                                                        <asp:Repeater ID="rptproductimg" runat="server">
                                                            <ItemTemplate>
                                                                <img src='<%#Eval("HProductImagePath").ToString().Replace("~/","") %>' class="border col-12 p-0" height="60" alt="" />
                                                            </ItemTemplate>
                                                        </asp:Repeater>

                                                        <%-- <img src="img/bonds/bond1.png" class="border col-12 p-0" alt>--%>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="box1">
                                                <div class="row">
                                                    <div class="col-7">

                                                        <small>Face Value</small>
                                                        <p class="h6  font_2 ">
                                                            ₹<%#Eval("FacevalueForBond") %>
                                                        </p>



                                                    </div>
                                                    <div class="col-5 text-right ">
                                                        <asp:HiddenField ID="hfProducts" runat="server" Value='<%#Eval("ProductsId") %>' />
                                                        <!-- dynamic rating icon -->
                                                        <div class="rating-icon">
                                                            <asp:Repeater ID="rptCredit" runat="server">
                                                                <ItemTemplate>
                                                                    <%#Eval("CreditRating") %>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-7">
                                                        <small>Coupon</small>
                                                        <p class="h6  font_2">
                                                            <%#Eval("CouponRate")%>%
                                                        </p>
                                                    </div>
                                                    <div class="col-5 text-right" runat="server" visible="false">
                                                        <asp:Panel ID="pnlYield" runat="server">
                                                            <small>Yield</small>
                                                            <p class="h6  font_2">

                                                                <%#Eval("YTM") %>%
                                                            </p>
                                                        </asp:Panel>

                                                        <asp:Panel ID="pnlYieldView" runat="server">
                                                            <small>Yield</small>
                                                            <p class="h6  font_2">
                                                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click">Login to view</asp:LinkButton>
                                                            </p>
                                                        </asp:Panel>

                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-7">
                                                        <small>Last IPDate</small>
                                                        <p class="h6  font_2">
                                                            <span class="abs">
                                                                <asp:Label ID="txtLastIP" runat="server"></asp:Label>
                                                            </span>

                                                        </p>
                                                    </div>
                                                    <div class="col-5 text-right">
                                                        <small>Maturity Date</small>
                                                        <p class="h6  font_2">

                                                            <%#Eval("MaturityDate") %>
                                                        </p>


                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <small>Type of Bond</small>

                                                        <p class="h6  font_2">
                                                            <span class="mmm" title='<%#Eval("CategoryHead") %>'>
                                                                <%#Eval("CategoryHead") %>
                                                            </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <small>Redemption Type</small>

                                                        <p class="h6  font_2">
                                                <asp:Label ID="lblredemption" runat="server" Visible="false" Value='<%#Eval("MaturityType") %>'></asp:Label>
                                                            <asp:Label ID="lblm" runat="server"></asp:Label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="button">
                                                    <a href="<%=ResolveUrl("~")%>CashFlow?oId=<%#Eval("ProductsId") %>" class="font_2 text-white">View
                                            Details</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <%--<div class="card border-0">
                            <div class="box">
                                <button class="status-button">OPEN</button>
                                <br>
                                <div class="box0">
                                    <div class="row">
                                        <div class="col-7">
                                            <h3 class="h6 font-weight-normal">
                                                7.41% GOI 19
                                                DEC 2036
                                            </h3>
                                        </div>
                                        <div class="col-5">
                                            <img src="img/bonds/bond1.png" class="border col-12 p-0" alt>
                                        </div>
                                    </div>
                                </div>

                                <div class="box1">
                                    <div class="row">
                                        <div class="col-7">
                                            <small>Price</small>
                                            <p class="h6  font_2 ">
                                                ₹ 10,05,500
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <img src="img/rate/AA.png" class="border  col-6 p-0" alt>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-7">
                                            <small>Coupon</small>
                                            <p class="h6  font_2">
                                                9.62%
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <small>Yield</small>
                                            <p class="h6  font_2">
                                                9.80%
                                            </p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-7">
                                            <small>IP Frequency</small>
                                            <p class="h6  font_2">
                                                QUARTERLY
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <small>Maturity Date</small>
                                            <p class="h6  font_2">
                                                31 May 2028
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <small>Type of Bond</small>
                                            <p class="h6  font_2">
                                                NCD TAXABLE
                                            </p>
                                        </div>
                                    </div>
                                    <div class="button">
                                        <a href="#" class="font_2 text-white">View
                                            Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card border-0">
                            <div class="box status-button">
                                <button class="status-button">OPEN</button>
                                <br>
                                <div class="box0">
                                    <div class="row">
                                        <div class="col-7">
                                            <h3 class="h6 font-weight-normal">
                                                7.41% GOI 19
                                                DEC 2036
                                            </h3>
                                        </div>
                                        <div class="col-5">
                                            <img src="img/bonds/bond1.png" class="border col-12 p-0" alt>
                                        </div>
                                    </div>
                                </div>

                                <div class="box1">
                                    <div class="row">
                                        <div class="col-7">
                                            <small>Price</small>
                                            <p class="h6  font_2 ">
                                                ₹ 10,05,500
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <img src="img/rate/AA.png" class="border  col-6 p-0" alt>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-7">
                                            <small>Coupon</small>
                                            <p class="h6  font_2">
                                                9.62%
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <small>Yield</small>
                                            <p class="h6  font_2">
                                                9.80%
                                            </p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-7">
                                            <small>IP Frequency</small>
                                            <p class="h6  font_2">
                                                QUARTERLY
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <small>Maturity Date</small>
                                            <p class="h6  font_2">
                                                31 May 2028
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <small>Type of Bond</small>
                                            <p class="h6  font_2">
                                                NCD TAXABLE
                                            </p>
                                        </div>
                                    </div>
                                    <div class="button">
                                        <a href="#" class="font_2 text-white">View
                                            Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card border-0">
                            <div class="box">
                                <button class="status-button">OPEN</button>
                                <br>
                                <div class="box0">
                                    <div class="row">
                                        <div class="col-7">
                                            <h3 class="h6 font-weight-normal">
                                                7.41% GOI 19
                                                DEC 2036
                                            </h3>
                                        </div>
                                        <div class="col-5">
                                            <img src="img/bonds/bond1.png" class="border col-12 p-0" alt>
                                        </div>
                                    </div>
                                </div>

                                <div class="box1">
                                    <div class="row">
                                        <div class="col-7">
                                            <small>Price</small>
                                            <p class="h6  font_2 ">
                                                ₹ 10,05,500
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <img src="img/rate/AA.png" class="border  col-6 p-0" alt>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-7">
                                            <small>Coupon</small>
                                            <p class="h6  font_2">
                                                9.62%
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <small>Yield</small>
                                            <p class="h6  font_2">
                                                9.80%
                                            </p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-7">
                                            <small>IP Frequency</small>
                                            <p class="h6  font_2">
                                                QUARTERLY
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <small>Maturity Date</small>
                                            <p class="h6  font_2">
                                                31 May 2028
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <small>Type of Bond</small>
                                            <p class="h6  font_2">
                                                NCD TAXABLE
                                            </p>
                                        </div>
                                    </div>
                                    <div class="button">
                                        <a href="#" class="font_2 text-white">View
                                            Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card border-0">
                            <div class="box">
                                <button class="status-button">OPEN</button>
                                <br>
                                <div class="box0">
                                    <div class="row">
                                        <div class="col-7">
                                            <h3 class="h6 font-weight-normal">
                                                7.41% GOI 19
                                                DEC 2036
                                            </h3>
                                        </div>
                                        <div class="col-5">
                                            <img src="img/bonds/bond1.png" class="border col-12 p-0" alt>
                                        </div>
                                    </div>
                                </div>

                                <div class="box1">
                                    <div class="row">
                                        <div class="col-7">
                                            <small>Price</small>
                                            <p class="h6  font_2 ">
                                                ₹ 10,05,500
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <img src="img/rate/AA.png" class="border  col-6 p-0" alt>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-7">
                                            <small>Coupon</small>
                                            <p class="h6  font_2">
                                                9.62%
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <small>Yield</small>
                                            <p class="h6  font_2">
                                                9.80%
                                            </p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-7">
                                            <small>IP Frequency</small>
                                            <p class="h6  font_2">
                                                QUARTERLY
                                            </p>
                                        </div>
                                        <div class="col-5 text-right">
                                            <small>Maturity Date</small>
                                            <p class="h6  font_2">
                                                31 May 2028
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <small>Type of Bond</small>
                                            <p class="h6  font_2">
                                                NCD TAXABLE
                                            </p>
                                        </div>
                                    </div>
                                    <div class="button">
                                        <a href="#" class="font_2 text-white">View
                                            Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        </div>
                        <%--<div class="card-footer">
                                
                                        <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList1" CssClass="table-paging"
                                            OnItemCommand="DataList1_ItemCommand">
                                            <ItemTemplate>
                                           <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:DataList>
                                                                                        <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList2" CssClass="table-paging"
                                            OnItemCommand="DataList2_ItemCommand">
                                            <ItemTemplate>
                                           <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:DataList>
                                             <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList3" CssClass="table-paging"  OnItemCommand="DataList3_ItemCommand">
                                             <ItemTemplate>
                                            <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                           </ItemTemplate>
                                               </asp:DataList>
                                         <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList4" CssClass="table-paging" OnItemCommand="DataList4_ItemCommand">
                                               <ItemTemplate>
                                        <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                            </ItemTemplate>
                                            </asp:DataList>
                                                <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList5" CssClass="table-paging" OnItemCommand="DataList5_ItemCommand">
                                            <ItemTemplate>
                                       <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:DataList>
                                       <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList6" CssClass="table-paging" OnItemCommand="DataList6_ItemCommand">
                                       <ItemTemplate>
                                       <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList7" CssClass="table-paging" OnItemCommand="DataList7_ItemCommand">
                                    <ItemTemplate>
                                   <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:DataList>
                                  <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList8" CssClass="table-paging" OnItemCommand="DataList8_ItemCommand">
                                        <ItemTemplate>
                                       <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList9" CssClass="table-paging"  OnItemCommand="DataList9_ItemCommand">
                                        <ItemTemplate>
                                       <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:DataList>
                                      <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList10" CssClass="table-paging" OnItemCommand="DataList10_ItemCommand">
                                    <ItemTemplate>
                                   <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:DataList>
                                 <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList11" CssClass="table-paging" OnItemCommand="DataList11_ItemCommand">
                                        <ItemTemplate>
                                       <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:DataList>
                               <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="DataList12" CssClass="table-paging" OnItemCommand="DataList12_ItemCommand">
                                    <ItemTemplate>
                                   <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:DataList>
   
</div>--%>
                    </div>
                </div>
            </div>
        </section>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <style>
        .table-check-input > tbody > tr > td > input {
            margin-right: 5px;
            padding: 10px;
        }
    </style>
   
    <script>
       
        var cIndex = 0;
        var PageCount = 2;
        var cState = 0;
        var UserId = document.getElementById('<%=hfUserId.ClientID%>').value
        var QueryString = document.getElementById('<%=hfRequestQueryingstring.ClientID%>').value
        var CreditRating = document.getElementById('<%=hfCreditRating.ClientID%>').value
        var Invest = document.getElementById('<%=hfInvest.ClientID%>').value
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            cIndex = 0;
            cState = 0;
            sendData();
        });
        
        $(window).scroll(function () {
            sendData();
        });

        $(document).ready(function () {
            //  debugger;
            sendData();
            $(window).scroll(function () {
                        sendData();
            });

        });


        
        function sendData() {
            
            if (cState == 0) {
                if (cIndex < PageCount) {
                    debugger;
                    tags = document.getElementById('<%=hfTagsData.ClientID%>').value
                    Category = document.getElementById('<%=hfCheckdata.ClientID%>').value
                    cIndex++;
                    cState = 1;
                    // debugger;
                    $.ajax(
                        {
                            type: "POST",
                            url: "TMWebService.asmx/GetBondsData",
                            data: "{'pageIndex':'" + cIndex + "','UserId':'" + UserId + "','querystring':'" + QueryString + "','creditrating':'" + CreditRating + "','tagsdata':'" + tags + "','categorytype':'" + Category + "','investvalue':'" + Invest + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            async: "true",
                            cache: "false",
                            success: function (response) {
                                debugger;
                                var datas = $.parseJSON(response.d);
                                debugger;
                                $("#myDiv").append(datas.DataString);
                                document.getElementById('<%=hfPageCount.ClientID%>').value = datas.PageCount;
                                PageCount = datas.PageCount;
                                cState = 0;
                            },

                            Error: function (x, e) {
                                alert("Some error");
                            }
                        });
                }
            }
        }
    </script>

    <%--     <script>  
         $(window).scroll(function () {
             if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                 appendData();
             }
         });
         function appendData() {
             var html = '';
             for (i = 0; i < 10; i++) {
                 html +=

                     '<p class="dynamic">Dynamic Data : Life treats you in the same way, how you treat your life.Follow your passion, be prepared, do not let anyone limit your dreams. My Passion towards my life !!! - See more at:<a href="http://sibeeshpassion.com/">http://sibeeshpassion.com/</a> </p>';
             }
             $('#myScroll').append(html);
             alert(htm);
         }
     </script>  --%>
</asp:Content>