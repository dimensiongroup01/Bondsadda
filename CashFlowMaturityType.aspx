<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="CashFlowMaturityType.aspx.cs" Inherits="CashFlowMaturityType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .box {
            border: none;
            border-radius: 0;
            box-shadow: none;
        }
        /*        .timlines .interest-box {
            border:none !important;
            box-shadow:none !important;
}*/
    </style>
    <link href="Signup/css/cashflowstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="hfProductsId" runat="server" />
    <asp:HiddenField ID="hfEOM" runat="server" />
    <asp:HiddenField ID="hfMaturityType" runat="server" />
    <asp:HiddenField ID="hfLastDates" runat="server" />
    <asp:HiddenField ID="hfFaces" runat="server" />
    <asp:HiddenField ID="hfFaceee" runat="server" />

    <asp:HiddenField ID="hfIntFirst" runat="server" />
    <asp:HiddenField ID="hfTotalInt" runat="server" />
    <asp:HiddenField ID="hfTotalFullInt" runat="server" />
    <asp:HiddenField ID="hfPercentFirst" runat="server" />
    <asp:HiddenField ID="hfTotalPercent" runat="server" />
    <asp:HiddenField ID="hfTotalFullPercent" runat="server" />
    <asp:Repeater ID="rptDataBind" runat="server" OnItemDataBound="rptDataBind_ItemDataBound">
        <ItemTemplate>
            <section class="py-5 title">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <p class="font-weight-bold mb-0">
                                Home / Our Collections
                            /
                            Highly safe Bonds / <%#Eval("Security") %>
                            </p>

                            <h1 class="h2 font-weight-normal"><%#Eval("Security") %></h1>
                        </div>
                    </div>
                </div>
                <!-- <div class="row pt-md-5">
                <div class="col-12 text-center">
                    <h2 class="h3 font-weight-normal">Cash Flow</h2>
                </div>
            </div> -->
            </section>
        </ItemTemplate>
    </asp:Repeater>


    <section class="overview-box mt-md-4 mt-4">
        <div class="container-fluid ">
            <div class="row">
                <div class="col-md-12 p-md-3 p-1">
                    <div class="box p-lg-5 p-md-4 p-3">
                        <div class="tab-wrapper mb-5 ">
                            <div class="tabs">
                                <a href="#" data-tab="1"
                                    class="tab-link active">Overview</a>
                                <%--                                    <a href="#" data-tab="2" class="tab-link">Description</a>
                                    <a href="#" data-tab="3" class="tab-link">Issuer</a>
                                    <a href="#" data-tab="4" class="tab-link">Compare</a>--%>
                                <a href="#" data-tab="5" class="tab-link">Deal
                                         Calculator </a>
                                <a href="#" data-tab="2" class="tab-link">Your Investment Interest</a>
                            </div>
                        </div>
                        <div id="tab-1" class="tab-content active">
                            <asp:UpdatePanel ID="upnel" runat="server">
                                <ContentTemplate>
                                    <asp:Repeater ID="rptViewproduct" runat="server" OnItemDataBound="rptViewproduct_ItemDataBound">
                                        <ItemTemplate>
                                            <div class="row overview">
                                                <!-- overview content area -->

                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">FACE VALUE</p>

                                                    <h4 class="font-weight-normal h4">₹ <%#Eval("FacevalueForBond") %> </h4>


                                                    <%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                </div>

                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">ISIN No.</p>
                                                    <h4 class="font-weight-normal h4"><%#Eval("ISINNumber") %></h4>
                                                    <%--     <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                </div>
                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">CREDIT RATING</p>

                                                    <h4 class="font-weight-normal h4">
                                                        <asp:HiddenField ID="hfProducts" runat="server" Value='<%#Eval("MProductsId") %>' />
                                                        <asp:Repeater ID="rptCredit" runat="server">
                                                            <ItemTemplate>
                                                                <%#Eval("CreditRating") %>
                                                            </ItemTemplate>
                                                        </asp:Repeater>

                                                    </h4>

                                                    <%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                </div>
                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">COUPON RATE</p>
                                                    <h4 class="font-weight-normal h4"><%#Eval("CouponRate") %>%</h4>
                                                    <%--     <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                </div>
                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">Rate</p>
                                                    <asp:Panel ID="pnlPrice" runat="server">
                                                        <h4 class="font-weight-normal h4">₹<%#Eval("Price") %> </h4>
                                                    </asp:Panel>
                                                    <%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                    <asp:Panel ID="pnlPriceView" runat="server">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Login to view</asp:LinkButton>
                                                    </asp:Panel>
                                                </div>
                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">RATING AGENCIES</p>
                                                    <h4 class="font-weight-normal h4">
                                                        <asp:HiddenField ID="hfAgencies" runat="server" Value='<%#Eval("MProductsId") %>' />
                                                        <asp:Repeater ID="rptAgencies" runat="server">
                                                            <ItemTemplate>
                                                                <%#Eval("RatingAgencies") %>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </h4>
                                                    <%--     <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                </div>

                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">YIELD</p>
                                                    <asp:Panel ID="pnlYield" runat="server">
                                                        <h4 class="font-weight-normal h4"><%#Eval("YTM") %>% </h4>
                                                    </asp:Panel>
                                                    <asp:Panel ID="pnlYieldView" runat="server">
                                                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click">Login to view</asp:LinkButton>
                                                    </asp:Panel>
                                                    <%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                </div>

                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">IP FREQUENCY</p>
                                                    <h4 class="font-weight-normal h4"><%#Eval("PaymentTypeHead") %> </h4>
                                                    <%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                </div>
                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">IP DATE</p>
                                                    <h4 class="font-weight-normal h4">
                                                        <asp:Label ID="txtLastIP" runat="server"></asp:Label></h4>
                                                    <%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                </div>
                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">MATURITY DATE</p>

                                                    <h4 class="font-weight-normal h4"><%#Eval("MaturityDate") %> </h4>


                                                    <%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                </div>
                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">GUARANTEED BY</p>
                                                    <h4 class="font-weight-normal h4"><%#Eval("GuaranteedBy") %> </h4>
                                                    <%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                </div>

                                                <div class="col-md-3 py-md-4  col-6">
                                                    <p class="mb-0 font-weight-normal ">TYPE OF BONDS</p>
                                                    <h4 class="font-weight-normal h4"><%#Eval("CategoryHead") %> </h4>
                                                    <%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                </div>

                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ContentTemplate>
                            </asp:UpdatePanel>


                        </div>

                        <div id="tab-2" class="tab-content">
                            <asp:UpdatePanel ID="updatepnl" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-12 p-md-3 p-0">
                                            <div class="table box p-md-5 p-4 font_2">
                                                <h2
                                                    class="font-weight-normal mb-md-4">Your Investment Interest Sheet</h2>
                                                <table
                                                    class="table table-striped table-hover text-center">
                                                    <thead>
                                                        <tr>
                                                            <th>Date</th>
                                                            <th>Invest Amount</th>
                                                            <th>Total Consideration Amount</th>
                                                            <th>Security</th>
                                                            <%--                                                        <th>Total</th>
                                                        <th>Interest Rate</th>--%>
                                                        </tr>

                                                    </thead>
                                                    <asp:Panel ID="pnlCashFlow" runat="server">
                                                        <tbody>

                                                            <asp:Repeater ID="rptCashFlowDetails" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td><%#Eval("EntryDate") %></td>
                                                                        <td><%#Eval("FaceValueForDeal") %></td>
                                                                        <td><%#Eval("TotalConsiderationAmount") %></td>
                                                                        <td><%#Eval("Security") %></td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <%--                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>--%>
                                                        </tbody>
                                                    </asp:Panel>

                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                        <%--                            <div id="tab-2" class="tab-content">Description</div>

                            <div id="tab-3" class="tab-content">Issuer</div>
                            <div id="tab-4" class="tab-content">Compare</div>--%>
                        <div id="tab-5" class="tab-content cashflow ">
                            <asp:UpdatePanel ID="upnl" runat="server">
                                <ContentTemplate>
                                    <asp:HiddenField ID="hfCouponRate" runat="server" />
                                    <asp:HiddenField ID="hfMaturityDate" runat="server" />
                                    <asp:HiddenField ID="hfIPDate" runat="server" />
                                    <asp:HiddenField ID="hfRatePrice" runat="server" />
                                    <asp:HiddenField ID="hfFaceValueForBond" runat="server" />
                                    <asp:HiddenField ID="hfDayValue" runat="server" />
                                    <asp:HiddenField ID="hfMonth" runat="server" />
                                    <asp:HiddenField ID="hfQuerterly" runat="server" />
                                    <asp:HiddenField ID="hfYearly" runat="server" />
                                    <asp:HiddenField ID="hfHalfYearly" runat="server" />
                                    <asp:HiddenField ID="hfMonthlyInterest" runat="server" />
                                    <asp:HiddenField ID="hfYearlyInterest" runat="server" />
                                    <asp:HiddenField ID="hfQuarterlyInterest" runat="server" />
                                    <asp:HiddenField ID="hfHalfYearlyInterest" runat="server" />
                                    <asp:HiddenField ID="hfFirstIntDay" runat="server" />
                                    <asp:HiddenField ID="hfSecondIntDay" runat="server" />
                                    <asp:HiddenField ID="hfFirstMonthly" runat="server" />
                                    <asp:HiddenField ID="hfFirstQuarterly" runat="server" />
                                    <asp:HiddenField ID="hfFirstHalf" runat="server" />
                                    <asp:HiddenField ID="hfFirstYearly" runat="server" />
                                    <asp:HiddenField ID="hfRemainingDay" runat="server" />
                                    <asp:HiddenField ID="hfRemainingMonth" runat="server" />
                                    <asp:HiddenField ID="hfLastMonthly" runat="server" />
                                    <asp:HiddenField ID="hfLastYearly" runat="server" />
                                    <asp:HiddenField ID="hfLastHalfYear" runat="server" />
                                    <asp:HiddenField ID="hfLastQuarterly" runat="server" />
                                    <asp:HiddenField ID="hfTotalMonth" runat="server" />
                                    <asp:HiddenField ID="hfTotalYear" runat="server" />
                                    <asp:HiddenField ID="hfTotalDay" runat="server" />
                                    <asp:HiddenField ID="hfIPDates" runat="server" />
                                    <asp:HiddenField ID="hfOneDayInterest" runat="server" />
                                    <asp:HiddenField ID="hfLastDate" runat="server" />
                                    <asp:HiddenField ID="hfSattlementDate" runat="server" />
                                    <asp:HiddenField ID="hfNumberofDays" runat="server" />
                                    <asp:HiddenField ID="hfFacrValueForDeal" runat="server" />
                                    <asp:HiddenField ID="hfPaymentType" runat="server" />
                                    <asp:HiddenField ID="hfSpecialDate" runat="server" />
                                    <asp:HiddenField ID="hfTotalConserationAmount" runat="server" />
                                    <asp:HiddenField ID="hfIPDateaaa" runat="server" />
                                    <asp:HiddenField ID="hfFrequencyType" runat="server" />
                                    <asp:HiddenField ID="hfQuantity" runat="server" />
                                    <asp:HiddenField ID="hfPrincipalAmount" runat="server" />
                                    <asp:HiddenField ID="hfTotalAssuredInterest" runat="server" />
                                    <asp:HiddenField ID="hfGrossConsideration" runat="server" />
                                    <asp:HiddenField ID="hfQuar" runat="server" />
                                    <div class="row">
                                        <div class="col-md-4 p-md-3 p-0">
                                            <div
                                                class="box border p-md-5 p-4 font_2 ">
                                                <h2
                                                    class="font-weight-normal mb-md-4">Pricing</h2>
                                                <div>
                                                    <asp:Repeater ID="rptBondCalculator" runat="server" OnItemDataBound="rptBondCalculator_ItemDataBound">
                                                        <ItemTemplate>




                                                            <div class="form-group row">
                                                                <label for="staticEmail"
                                                                    class="col-5 col-form-label ">
                                                                    Coupon Rate</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtCouponRate" runat="server" type="number"
                                                                        class="text-right form-control" ReadOnly="true" Text='<%#Eval("CouponRate") %>'></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <%--                                                        <div class="form-group row">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label ">
                                                        Credit Rating</label>
                                                    <div class="col-7">
                                                        <asp:HiddenField ID ="hfBondCredit" runat="server" Value='<%#Eval("ProductsId") %>' />
                                                        <asp:Repeater ID ="BondCreditRating" runat="server">
                                                            <ItemTemplate>
                                                                        <asp:TextBox ID ="txtCreditrating" runat="server"
                                                            class="text-right form-control" ReadOnly Text='<%#Eval("CreditRating") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                
                                                    </div>
                                                </div>

                                                        <div class="form-group row">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label ">
                                                        Rating Agencies</label>
                                                    <div class="col-7">
                                                        <asp:HiddenField ID ="hfBondRatingAgencies" runat="server" Value='<%#Eval("ProductsId") %>' />
                                                        <asp:Repeater ID ="rptRating" runat="server">
                                                            <ItemTemplate>
                                                                        <asp:TextBox ID ="txtRatingAgencies" runat="server"
                                                            class="text-right form-control" ReadOnly Text='<%#Eval("RatingAgencies") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                
                                                    </div>
                                                </div>--%>

                                                            <div class="form-group row">
                                                                <label for="inputPassword"
                                                                    class="col-5 col-form-label">
                                                                    Matirity Date</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtMaturityDate" runat="server"
                                                                        class="text-right form-control" ReadOnly="true" Text='<%#Eval("MaturityDate") %>'></asp:TextBox>
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <label for="staticEmail"
                                                                    class="col-5 col-form-label">
                                                                    Call Option</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtCallOption" runat="server" type="number"
                                                                        class="text-right form-control" ReadOnly="true"
                                                                        placeholder="NA"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <%--<div class="form-group row">
                                                    <label for="staticEmail"
                                                   class="col-5 col-form-label">Interest Payment Date</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtInterestPaymentDate" runat="server"
                                                            class="text-right form-control" ReadOnly="true" placeholder="Last Date of Every Month"></asp:TextBox>
                                                    </div>
                                                </div>--%>

                                                            <div class="form-group row">
                                                                <label for="staticEmail"
                                                                    class="col-5 col-form-label">
                                                                    IP Date</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtLastIP" runat="server"
                                                                        class="text-right form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticEmail"
                                                                    class="col-5 col-form-label">
                                                                    ISIN Number</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtISINNumber" runat="server"
                                                                        class="text-right form-control" ReadOnly="true" Text='<%#Eval("ISINNumber") %>'></asp:TextBox>
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <label for="staticEmail"
                                                                    class="col-5 col-form-label">
                                                                    Rate</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtRate" runat="server" ReadOnly="true" Text='<%#Eval("Price") %>'
                                                                        class="text-right form-control"
                                                                        value="0"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticEmail"
                                                                    class="col-5 col-form-label">
                                                                    Face Value For Bond(Rs.)</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtFaceValueBond" runat="server" ReadOnly="true"
                                                                        class="text-right form-control" Text='<%#Eval("FacevalueForBond") %>'></asp:TextBox>
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <label for="inputPassword"
                                                                    class="col-5 col-form-label">
                                                                    Payment Type/Frequency*</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="ddlPaymentType" runat="server" CssClass="text-right form-control" ReadOnly="true" Text='<%#Eval("PaymentTypeHead") %>'></asp:TextBox>
                                                                </div>
                                                            </div>


                                                            <div class="form-group row">
                                                                <label for="inputPassword"
                                                                    class="col-5 col-form-label">
                                                                    Sattlement Date*</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtSattlementdate" runat="server"
                                                                        class="text-right form-control datepicker" OnTextChanged="txtSattlementdate_TextChanged" AutoPostBack="true"></asp:TextBox>

                                                                </div>
                                                            </div>


                                                            <%--<div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Last IP Date</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtLastIPDate" runat="server"
                                                            class="text-right form-control" ReadOnly="true" ></asp:TextBox>
                                                    </div>
                                                </div>--%>



                                                            <div class="form-group row">
                                                                <label for="inputPassword"
                                                                    class="col-5 col-form-label ">
                                                                    Face Value For Deal(Rs.)*</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtFaceValueDeal" runat="server" CssClass="text-right form-control"
                                                                        placeholder="Face Value For Deal" OnTextChanged="txtFaceValueDeal_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="inputPassword"
                                                                    class="col-5 col-form-label">
                                                                    Number of Days</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtNumberDays" runat="server"
                                                                        class="text-right form-control" ReadOnly="true"
                                                                        placeholder=""></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="inputPassword"
                                                                    class="col-5 col-form-label">
                                                                    Quantity</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtQuantity" runat="server" ReadOnly="true"
                                                                        class="text-right form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="inputPassword"
                                                                    class="col-5 col-form-label">
                                                                    Principal Amount</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtPrincipalAmount" runat="server"
                                                                        class="text-right form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="inputPassword"
                                                                    class="col-5 col-form-label">
                                                                    Accurred Interest</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtAccured" runat="server"
                                                                        class="text-right form-control" ReadOnly="true"
                                                                        placeholder=""></asp:TextBox>
                                                                </div>
                                                            </div>


                                                            <div class="form-group row">
                                                                <label for="staticEmail"
                                                                    class="col-5 col-form-label">
                                                                    Gross Consideration</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtGrossConder" runat="server" ReadOnly="true"
                                                                        class="text-right form-control"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="inputPassword"
                                                                    class="col-5 col-form-label">
                                                                    Stamp Duty</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtStampDuty" runat="server" type="text"
                                                                        class="text-right form-control" ReadOnly="true"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticEmail"
                                                                    class="col-5 col-form-label">
                                                                    Total Consideration(Rs.) with Stamp Duty</label>
                                                                <div class="col-7">
                                                                    <asp:TextBox ID="txtConsiderationStamp" runat="server" ReadOnly="true"
                                                                        class="text-right form-control"></asp:TextBox>
                                                                </div>
                                                            </div>

                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:Panel ID="pnlViewSheet" runat="server">
                                                        <asp:LinkButton ID="lnkInterestSheet" runat="server" CssClass="btn btn-primary" OnClick="lnkInterestSheet_Click">View Interest Sheet</asp:LinkButton>
                                                    </asp:Panel>
                                                    <asp:Panel ID="pnlLoginToView" runat="server">
                                                        <p class="h6 font_2">
                                                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-primary" OnClick="LinkButton3_Click">Login To View Interest Sheet</asp:LinkButton>
                                                        </p>
                                                    </asp:Panel>
                                                </div>
                                            </div>

                                            <div class="col-md-8 p-md-3 p-0">
                                                <div class="table box p-md-5 p-4 font_2">
                                                    <h2
                                                        class="font-weight-normal mb-md-4">Interest Sheet</h2>
                                                    <asp:Panel ID="pnlInterestBullet" runat="server">
                                                        <table
                                                            class="table table-striped table-hover text-center">
                                                            <thead>
                                                                <tr>
                                                                    <th>Interest Date</th>
                                                                    <th>Coupon</th>
                                                                    <th>Interest Amount</th>
                                                                    <th>Days</th>
                                                                    <%--                                                        <th>Interest Rate</th>--%>
                                                                </tr>

                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater ID="rptCash" runat="server">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td><%#Eval("InterestDate") %></td>
                                                                            <td><%#Eval("CouponRate") %>%</td>
                                                                            <td><%#Eval("InterestValue") %></td>
                                                                            <td><%#Eval("MonthDayValue") %></td>
                                                                            <%--<td>366</td>--%>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                <%-- 
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>--%>
                                                            </tbody>
                                                        </table>
                                                    </asp:Panel>

                                                    <asp:Panel ID="pnlInterestStaggered" runat="server">
                                                        <table
                                                            class="table table-striped table-hover text-center">
                                                            <thead>
                                                                <tr>
                                                                    <th>Interest Date</th>
                                                                    <th>Coupon</th>
                                                                    <th>Interest Amount</th>
                                                                    <th>Pricipal Amount</th>
                                                                    <th>Days</th>
                                                                    <%--                                                        <th>Interest Rate</th>--%>
                                                                </tr>

                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater ID="rptStaggeredSheet" runat="server">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td><%#Eval("InterestDate") %></td>
                                                                            <td><%#Eval("CouponRate") %>%</td>
                                                                            <td><%#Eval("InterestValue") %></td>
                                                                            <td><%#Eval("Percentage") %>% <%#Eval("PrincipalAmount") %></td>
                                                                            <td><%#Eval("MonthDayValue") %></td>
                                                                            <%--<td>366</td>--%>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                <%-- 
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>
                                                    <tr>
                                                        <td>13-mar-2023</td>
                                                        <td>78,200.00</td>
                                                        <td>0</td>
                                                        <td>78,200.00</td>
                                                        <td>366</td>
                                                    </tr>--%>
                                                            </tbody>
                                                        </table>
                                                    </asp:Panel>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>


                    </div>

                </div>
            </div>
        </div>

    </section>

    <asp:Panel ID="pnl" runat="server">
        <asp:HiddenField ID="hfInterstStatus" runat="server" />
        <asp:HiddenField ID="hfWidthForm" runat="server" />
        <section class=" timlines">
            <div class="container-fluid">
                <div class="box p-lg-2 p-md-4 p-0">

                    <div class="row">


                        <asp:Repeater ID="rptChartFace" runat="server" OnItemDataBound="rptChartFace_ItemDataBound">
                            <ItemTemplate>
                                <div class="col-12 p-0 pt-3">
                                    <!-- 200px(1 interest timeline size) X 8(number of interest) = 2000px(size of total number of interest) -->
                                    <div class="interest-box">

                                        <div class="box tag"></div>

                                        <div class="box flag">

                                            <div class="date">
                                                <h6><%#Eval("MaturityDate") %></h6>
                                            </div>
                                            <div class="timeline "></div>
                                            <div class="interest-rate">
                                                <small><b>Your Investment</b></small>
                                                <p class="h6">
                                                    <span class="icon">₹</span>
                                                    <span class="rate"><%#Eval("HFaceValueForDeal") %></span>
                                                </p>
                                            </div>
                                        </div>


                                        <asp:HiddenField ID="hfCashFlowId" runat="server" Value='<%#Eval("CashFlowId") %>' />
                                        <asp:Repeater ID="rptChart" runat="server" OnItemDataBound="rptChart_ItemDataBound">
                                            <ItemTemplate>

                                                <div class="box">
                                                    <div class="date">
                                                        <h6><%#Eval("HInterestDate") %></h6>
                                                    </div>

                                                    <div class="timeline"></div>

                                                    <%--<asp:Panel ID ="pnlTimeLineFill" runat="server">
                                    <div class="timeline fill"></div>
                                </asp:Panel>--%>
                                                    <div class="interest-rate">
                                                        <small>Interest</small>
                                                        <p class="h6">
                                                            <span class="icon">₹</span>
                                                            <span class="rate"><%#Eval("HInterestValue") %></span>
                                                        </p>
                                                    </div>
                                                </div>



                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </div>

                                </div>

                            </ItemTemplate>
                        </asp:Repeater>
                        <%--                            <div class="box">
                                <div class="date">
                                    <h6>26 Jun 2023</h6>
                                </div>
                                <div class="timeline fill"></div>
                                <div class="interest-rate">
                                    <small>Interest</small>
                                    <p class="h6">
                                        <span class="icon">₹</span>
                                        <span class="rate">27,500</span>
                                    </p>
                                </div>
                            </div>
                            <div class="box">
                                <div class="date">
                                    <h6>26 Jun 2023</h6>
                                </div>
                                <div class="timeline fill"></div>
                                <div class="interest-rate">
                                    <small>Interest</small>
                                    <p class="h6">
                                        <span class="icon">₹</span>
                                        <span class="rate">27,500</span>
                                    </p>
                                </div>
                            </div>
                            <div class="box">
                                <div class="date">
                                    <h6>26 Jun 2023</h6>
                                </div>
                                <div class="timeline fill"></div>
                                <div class="interest-rate">
                                    <small>Interest</small>
                                    <p class="h6">
                                        <span class="icon">₹</span>
                                        <span class="rate">27,500</span>
                                    </p>
                                </div>
                            </div>
                            <div class="box">
                                <div class="date">
                                    <h6>26 Jun 2023</h6>
                                </div>
                                <div class="timeline fill"></div>
                                <div class="interest-rate">
                                    <small>Interest</small>
                                    <p class="h6">
                                        <span class="icon">₹</span>
                                        <span class="rate">27,500</span>
                                    </p>
                                </div>
                            </div>
                            <div class="box">
                                <div class="date">
                                    <h6>26 Jun 2023</h6>
                                </div>
                                <div class="timeline fill"></div>
                                <div class="interest-rate">
                                    <small>Interest</small>
                                    <p class="h6">
                                        <span class="icon">₹</span>
                                        <span class="rate">27,500</span>
                                    </p>
                                </div>
                            </div>
                            <div class="box">
                                <div class="date">
                                    <h6>26 Jun 2023</h6>
                                </div>
                                <div class="timeline fill"></div>
                                <div class="interest-rate">
                                    <small>Interest</small>
                                    <p class="h6">
                                        <span class="icon">₹</span>
                                        <span class="rate">27,500</span>
                                    </p>
                                </div>
                            </div>--%>
                    </div>

                </div>
            </div>
        </section>
    </asp:Panel>
    <section class="my-md-5 my-5 faq">
        <div class="container">
            <div class="row">

                <div class="col-12">
                    <main>
                        <asp:Panel ID="pnlView" runat="server">
                            <div class="container">
                                <h2 class="font-weight-bold h3">FAQ</h2>
                                <!--accordion-->
                                <asp:Repeater ID="rptFAQ" runat="server">
                                    <ItemTemplate>
                                        <div class="accordion">
                                            <div class="accordion-header">
                                                <h3 class="h5 font-weight-normal"><%#Eval("Question") %></h3>
                                                <div class="close">
                                                    <span></span>
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
                                            class="">
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
    <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
        rel="stylesheet">

    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script>
        $(document).ready(function () {
            $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', minDate: 0, changeYear: true, changeMonth: true, yearRange: "+0:+50" });
            $(".chosen").chosen();

            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function () {
                $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', minDate: 0, changeYear: true, changeMonth: true, yearRange: "+0:+50" });
                $(".chosen").chosen();
            });

            debugger;
            var current = location.pathname.replace('/team/', '');
            $('.list li a').each(function () {
                var $this = $(this);
                // if the current path is like this link, make it active
                if ($this.attr('href').indexOf(current) !== -1) {
                    debugger;
                    $this.closest('li').addClass('active');
                    $this.closest('ul').show();
                    var $thisu = $this.closest('ul');
                    if ($thisu.hasClass("ml-menu")) {
                        $thisu.parent().find('a').addClass('toggled');
                    }
                }
            })
        });
    </script>
</asp:Content>

