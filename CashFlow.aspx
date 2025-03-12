<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="CashFlow.aspx.cs" Inherits="CashFlow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .box{
            border:none;
/*            border-radius:0;*/
            box-shadow:none;
        }
/*        .timlines .interest-box {
            border:none !important;
            box-shadow:none !important;
}*/
    </style>
        <link rel="shortcut icon" href="Image/logo1.png" />

    <link href="Signup/css/cashflowstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upnl" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlAllData" runat="server">
    <asp:HiddenField ID ="hfProductsId" runat="server" />
    <asp:HiddenField ID ="hfEOM" runat="server" />
        <asp:HiddenField ID ="hfMaturityType" runat="server" />
    <asp:HiddenField ID ="hfLastDates" runat="server" />
    <asp:HiddenField ID ="hfFaces" runat="server" />
    <asp:HiddenField ID ="hfFaceee" runat="server" />
    <asp:HiddenField ID ="hfIntFirst" runat="server" />
    <asp:HiddenField ID ="hfTotalInt" runat="server" />
    <asp:HiddenField ID ="hfTotalFullInt" runat="server" />
    <asp:HiddenField ID ="hfPercentFirst" runat="server" />
    <asp:HiddenField ID ="hfTotalPercent" runat="server" />
    <asp:HiddenField ID ="hfTotalFullPercent" runat="server" />
    <asp:HiddenField ID="hfPriceRate" runat="server" />
    <asp:HiddenField ID="hfAdhar" runat="server" />
    <asp:HiddenField ID="hfPAN" runat="server" />
    <asp:HiddenField ID="hfDemate" runat="server" />
    <asp:HiddenField ID="hfBankdetails" runat="server" />
                <asp:HiddenField ID="hfLastIPDateXIRR" runat="server" />
                <asp:HiddenField ID="hfYieldValue" runat="server" />
               
                
    <asp:Repeater ID ="rptDataBind" runat="server" OnItemDataBound="rptDataBind_ItemDataBound">
        <ItemTemplate>
                        <section class="py-5 title">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <p class="font-weight-bold mb-0">Home / Our Collections
                            /
                            Highly safe Bonds / <%#Eval("Security") %></p>

                        <h1 class="h2 font-weight-normal" style="text-transform:capitalize"> <%#Eval("Security") %></h1>
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
    <asp:Panel ID="pnlViewOverView" runat="server">

              <section class="overview-box mt-md-4 mt-4">
            <div class="container-fluid ">
                <div class="row">
                    <div class="col-md-12 p-md-3 p-1">
                        <div class="box p-lg-5 p-md-4 p-3">
                            <div class="tab-wrapper mb-5 ">
                                <div id="taba" class="tabs">

                                    <asp:LinkButton ID="lnktab1" runat="server" OnClick="lnktab1_Click">Overview</asp:LinkButton>
                                     <asp:LinkButton ID="lnktab4" runat="server" OnClick="lnktab4_Click" Visible="false">Investment Calculator</asp:LinkButton>
                                      <asp:LinkButton ID="lnktab2" runat="server" OnClick="lnktab2_Click" Visible="false">Your Investment Interest</asp:LinkButton>
                                     <asp:LinkButton ID="lnktab3" runat="server" OnClick="lnktab3_Click">Deal Calculator</asp:LinkButton>
                                  <%-- <a href="#" data-tab="1" class="tab-link active">Overview</a>
                                    <a href="#" data-tab="4" class="tab-link">Investment Calculator </a>
                                    <a href="#" data-tab="2" class="tab-link">Your Investment Interest</a>
                                    <a href="#" data-tab="3" class="tab-link">Deal Calculator</a>
                                  --%>

                                </div>
                            </div>
                            <asp:Panel ID="pnl1" runat="server">
<%--                                   <div id="tab-1" class="tab-content active">--%>
<%--                                <asp:UpdatePanel ID ="upnel" runat="server">
                                    <ContentTemplate>--%>
                                        <asp:Repeater ID ="rptViewproduct" runat="server" OnItemDataBound="rptViewproduct_ItemDataBound">
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
                                        <h4 class="font-weight-normal h4"> <%#Eval("ISINNumber") %></h4>
                                   <%--     <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                    </div>
                                    <div class="col-md-3 py-md-4  col-6">
                                        <p class="mb-0 font-weight-normal ">CREDIT RATING</p>
                                          
                                        <h4 class="font-weight-normal h4">
                                          <asp:HiddenField ID ="hfProducts" runat="server" Value='<%#Eval("ProductsId") %>' />
                                                 <asp:Repeater ID ="rptCredit" runat="server">
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
                                        <h4 class="font-weight-normal h4"> <%#Eval("CouponRate") %>%</h4>
                                   <%--     <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                    </div>
                                            <div class="col-md-3 py-md-4  col-6">
                                        <p class="mb-0 font-weight-normal ">RATE</p>
                                                <h4 class="font-weight-normal h4">₹ <asp:Label ID="lblPriceDate" runat="server" Text='<%#Eval("Price") %>'></asp:Label></h4>
                                         <asp:HiddenField ID="hfIsInvest" runat="server" Value='<%#Eval("IsInvestNow") %>' />
                                                  <asp:Panel ID ="pnlPrice" runat="server">
<%--                                        <h4 class="font-weight-normal h4">₹<%#Eval("Price") %> </h4>--%>

                                   <asp:Repeater ID="rptRMView" runat="server">
                                        <ItemTemplate>
                                            <a href="tel:+91<%#Eval("Mobile") %>" class="btn btn1" style="font-size:15px;" >Connect with RM</a>
                                         </ItemTemplate>
                                    </asp:Repeater>
                                                      </asp:Panel>
<%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                                <asp:Panel ID ="pnlPriceView" runat="server">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" style="font-size:25px;" OnClick="LinkButton1_Click">Login to view</asp:LinkButton>
                                                    </asp:Panel>
                                    </div>
                                    <div class="col-md-3 py-md-4  col-6">
                                        <p class="mb-0 font-weight-normal ">RATING AGENCIES</p>
                                        <h4 class="font-weight-normal h4"> 
                                 <asp:HiddenField ID ="hfAgencies" runat="server" Value='<%#Eval("ProductsId") %>' />
                                            <asp:Repeater ID ="rptAgencies" runat="server">
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
                                         <asp:Panel ID ="pnlYield" runat="server">
                                             <h4 class="font-weight-normal h4"><asp:Label ID="lblYield" runat="server"></asp:Label>%</h4>
                                      <%--  <h4 class="font-weight-normal h4"><%#Eval("YTM") %>% </h4>--%>
                                                                                         </asp:Panel>
                                                    <asp:Panel ID ="pnlYieldView" runat="server">
                                                        <asp:LinkButton ID="LinkButton2" runat="server" style="font-size:25px;" OnClick="LinkButton1_Click">Login to view</asp:LinkButton>
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
                                        <p class="mb-0 font-weight-normal ">LAST INTEREST PAYMENT DATE</p>
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
                                        <p class="mb-0 font-weight-normal ">INSTRUMENT TYPE</p>
                                        <h4 class="font-weight-normal h4"><%#Eval("DataStatus") %> </h4>
<%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                    </div>
                                    <div class="col-md-3 py-md-4  col-6">
                                        <p class="mb-0 font-weight-normal ">PUT DATE</p>
                                        <h4 class="font-weight-normal h4"><%#Eval("PutCallDate") %> </h4>
<%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                    </div>
                                 <div class="col-md-3 py-md-4  col-6">
                                        <p class="mb-0 font-weight-normal ">CALL DATE</p>
                                        <h4 class="font-weight-normal h4"><%#Eval("CallDate") %> </h4>
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

                                            <div class="col-md-3 py-md-4  col-6">
                                                <asp:Label ID="lblredemption" runat="server" Visible="false" Value='<%#Eval("MaturityType") %>'></asp:Label>
                                        <p class="mb-0 font-weight-normal ">Redemption Type</p>
                                        <h4 class="font-weight-normal h4">
                                            <asp:Label ID="lblm" runat="server"></asp:Label></h4>
<%--                                        <small class="font-weight-normal">For
                                            Settlement date as
                                            21st June 2023<span
                                                class="text-danger"> *</span></small>--%>
                                    </div>
                                    
                                </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:Panel ID="pnlInvest" runat="server">
                                    <div class="row">
                                        <div class="col-md-2">
                                      <asp:LinkButton ID ="lnkinvest" runat="server" CssClass="btn btn1" OnClick="lnkinvest_Click" style="font-size:25px;" >Invest Now</asp:LinkButton>
                                        </div>
                                        <div class="col-md-3" runat="server" id="vinvesttype">
                                            
                                            <asp:DropDownList ID="ddlInvestType" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="" Selected="True">Choose Invest Type</asp:ListItem>
                                                <asp:ListItem Value="Investment of less than Rs.1L">Investment of less than ₹1L</asp:ListItem>
                                                <asp:ListItem Value="Investment of Rs.1L or more">Investment of ₹1L or more</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div class="col-md-2" runat="server" id="vsubmit">
                                    <asp:LinkButton ID="lnkSubmitDetails" runat="server" CssClass="btn btn1" OnClick="lnkSubmitDetails_Click">Submit</asp:LinkButton>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:Repeater ID="rptRM" runat="server">
                                                <ItemTemplate>
                                                    <a href="tel:+91<%#Eval("Mobile") %>" class="btn btn1" style="font-size:25px;" >Connect with RM</a>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>

                                    

                                </asp:Panel>

                                <asp:Panel ID="pnlinvestlogin" runat="server">
                                     <asp:Button ID="LinkButton1" runat="server" CssClass="btn btn1" Text="Login to view full details" OnClick="LinkButton1_Click" />
                                </asp:Panel>

                                <asp:Panel ID="pnlCloseDeal" runat="server">

                                            <div data-toggle="modal" data-target="#investnow" style="cursor: pointer;">
                                                <h1 class="btn btn-primary">Invest Now</h1>
                                            </div>
                                </asp:Panel>
                                <div class="modal fade" id="investnow" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="exampleModalLabel">Bond Calculator</h3>
                                                <span aria-hidden="true" data-dismiss="modal" style="cursor:pointer;font-size:30px;">&times;</span>
                                            </div>

                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label for="txtFaceValue">Sattlement Date:</label>
                                                            <asp:TextBox ID="txtSDate" runat="server" CssClass="form-control datepicker" placeholder="DD/MM/YYYY"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="txtCouponRate">Quantity:</label>
                                                            <asp:TextBox ID="txtQty" runat="server" TextMode="Number" min="1" CssClass="form-control"></asp:TextBox>
                                                        </div>

                                                    </div>

                                            <div class="modal-footer">
                                                <asp:Button ID="btnInterestSheet" runat="server" Text="Interest Sheet" OnClick="btnInterestSheet_Click" CssClass="btn btn-primary" />
                                                <asp:Button ID="btnInterestSheet1" runat="server" Text="Deal Confirmation" OnClick="btnInvestNow_Click" CssClass="btn btn-primary"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                               <%--     </ContentTemplate>
                                </asp:UpdatePanel>   --%>
                         <%--   </div>      --%>                      
                            </asp:Panel>
                            
                            <asp:Panel ID="pnl2" runat="server">
<%--                                                                               <div id="tab-2" class="tab-content">--%>
<%--                                <asp:UpdatePanel ID ="updatepnl" runat="server">
                                    <ContentTemplate>--%>
                                        <div class="row">
                                     <div class="col-md-12 p-md-3 p-0">
                                        <div class="table box p-md-5 p-4 font_2">
                                            <h2
                                                class="font-weight-normal mb-md-4">Your Investment Interest Sheet</h2>
                                            <table
                                                class="table table-striped table-hover text-center">
                                                <thead>
                                                    <tr>
                                                        <th> Date</th>
                                                        <th>Invest Amount</th>
                                                        <th>Total Consideration Amount</th>
                                                        <th>Security</th>
<%--                                                        <th>Total</th>
                                                        <th>Interest Rate</th>--%>
                                                    </tr>

                                                </thead>
                                                <asp:Panel ID ="pnlCashFlow" runat="server">
                                                    <tbody>
                                                    
                                                    <asp:Repeater ID ="rptCashFlowDetails" runat="server">
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
                                  <%--  </ContentTemplate>
                                </asp:UpdatePanel>--%>
                         <%--   </div>     --%>            
                            </asp:Panel>
                            <asp:Panel ID="pnl4" runat="server">
<%--                                                                            <div id="tab-4" class="tab-content cashflow ">--%>
                         <%--         <asp:UpdatePanel ID ="upnl" runat="server">
        <ContentTemplate>--%>
                            <asp:HiddenField ID ="hfCouponRate" runat="server" />
                            <asp:HiddenField ID ="hfMaturityDate" runat="server" />
                            <asp:HiddenField ID ="hfIPDate" runat="server" />
                            <asp:HiddenField ID ="hfRatePrice" runat="server" />
                            <asp:HiddenField ID ="hfFaceValueForBond" runat="server" />
                            <asp:HiddenField ID ="hfDayValue" runat="server" />
                            <asp:HiddenField ID ="hfMonth" runat="server" />
                            <asp:HiddenField ID ="hfQuerterly" runat="server" />
                            <asp:HiddenField ID ="hfYearly" runat="server" />
                            <asp:HiddenField ID ="hfHalfYearly" runat="server" />
                            <asp:HiddenField ID ="hfMonthlyInterest" runat="server" />
                            <asp:HiddenField ID ="hfYearlyInterest" runat="server" />
                            <asp:HiddenField ID ="hfQuarterlyInterest" runat="server" />
                            <asp:HiddenField ID ="hfHalfYearlyInterest" runat="server" />
                            <asp:HiddenField ID ="hfFirstIntDay" runat="server" />
                            <asp:HiddenField ID ="hfSecondIntDay" runat="server" />
                            <asp:HiddenField ID ="hfFirstMonthly" runat="server" />
                            <asp:HiddenField ID ="hfFirstQuarterly" runat="server" />
                            <asp:HiddenField ID ="hfFirstHalf" runat="server" />
                            <asp:HiddenField ID ="hfFirstYearly" runat="server" />
                            <asp:HiddenField ID ="hfRemainingDay" runat="server" />
                            <asp:HiddenField ID ="hfRemainingMonth" runat="server" />
                            <asp:HiddenField ID ="hfLastMonthly" runat="server" />
                            <asp:HiddenField ID ="hfLastYearly" runat="server" />
                            <asp:HiddenField ID ="hfLastHalfYear" runat="server" />
                            <asp:HiddenField ID ="hfLastQuarterly" runat="server" />
                            <asp:HiddenField ID ="hfTotalMonth" runat="server" />
                            <asp:HiddenField ID ="hfTotalYear" runat="server" />
                            <asp:HiddenField ID ="hfTotalDay" runat="server" />
                            <asp:HiddenField ID ="hfIPDates" runat="server" />
                            <asp:HiddenField ID ="hfOneDayInterest" runat="server" />
                            <asp:HiddenField ID ="hfLastDate" runat="server" />
                            <asp:HiddenField ID ="hfSattlementDate" runat="server" />
                            <asp:HiddenField ID ="hfNumberofDays" runat="server" />
                            <asp:HiddenField ID ="hfFacrValueForDeal" runat="server" />
                            <asp:HiddenField ID="hfPaymentType" runat="server" />
                            <asp:HiddenField ID ="hfSpecialDate" runat="server" />
                            <asp:HiddenField ID ="hfTotalConserationAmount" runat="server" />
                            <asp:HiddenField ID ="hfIPDateaaa" runat="server" />
                            <asp:HiddenField ID ="hfFrequencyType" runat="server" />
                            <asp:HiddenField ID ="hfQuantity" runat="server" />
                            <asp:HiddenField ID ="hfPrincipalAmount" runat="server" />
                            <asp:HiddenField ID ="hfTotalAssuredInterest" runat="server" />
                            <asp:HiddenField ID ="hfGrossConsideration" runat="server" />
                            <asp:HiddenField ID ="hfQuar" runat="server" />
                            <asp:HiddenField ID ="hfTotalGrossAmount" runat="server" />
                            <asp:HiddenField ID ="hfSattlementDateforbond" runat="server" />
                                <div class="row">
                                    <div class="col-md-4 p-md-3 p-0">
                                        <div class="box border p-md-5 p-4 font_2 ">
                                            <h2
                                                class="font-weight-normal mb-md-4">Pricing</h2>
                                            <div>
                                                <asp:Repeater ID ="rptBondCalculator" runat="server" OnItemDataBound="rptBondCalculator_ItemDataBound">
                                                    <ItemTemplate>
                         
                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label ">
                                                        Coupon Rate</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtCouponRate" runat="server" type="number"
                                                            class="text-right form-control" ReadOnly="true" Text='<%#Eval("CouponRate") %>'></asp:TextBox>
                                                    </div>
                                                </div>
                                                        <div class="form-group row" runat="server">
                                                             <label for="staticEmail"
                                                                 class="col-5 col-form-label">Yield</label>
                                                             <div class="col-7">
                                                                 <asp:TextBox ID ="txtYTM" runat="server"
                                                                     class="text-right form-control"
            
                                                                      ReadOnly="true"></asp:TextBox>
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

                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Maturity Date</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtMaturityDate" runat="server"
                                                            class="text-right form-control" ReadOnly="true" Text='<%#Eval("MaturityDate") %>' 
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>
                                             
                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Call Option</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtCallOption" runat="server" type="number"
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

                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Last Interst Payment Date</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtLastIP" runat="server"
                                                            
                                                            class="text-right form-control" ReadOnly="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">ISIN Number</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtISINNumber" runat="server"
                                                           
                                                            class="text-right form-control" ReadOnly="true" Text='<%#Eval("ISINNumber") %>'
                                                            
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>
                                                
                                                <div class="form-group row">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Rate</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtRate" runat="server" Text='<%#Eval("Price") %>'
                                                            class="text-right form-control"
                                                            
                                                            value="0" ReadOnly="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row" runat="server">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Face Value For Bond(Rs.)</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtFaceValueBond" runat="server" ReadOnly="true"
                                                            class="text-right form-control" Text='<%#Eval("FacevalueForBond") %>'
                                                           
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>
                                                               
                         <div class="form-group row" runat="server" visible="false">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Payment Type/Frequency*</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID="ddlPaymentType" runat="server" CssClass="text-right form-control" ReadOnly="true" Text='<%#Eval("PaymentTypeHead") %>'></asp:TextBox>
                                                    </div>
                                                </div>
            
            
                                                        <div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Settlement Date*</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtSattlementdate" runat="server"
                                                            class="text-right form-control datepicker" OnTextChanged="txtSattlementdate_TextChanged" AutoPostBack="true" 
                                                            ></asp:TextBox>

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
            
                                                                 <div class="form-group row" runat="server">
                                                        <label for="inputPassword"
                                                            class="col-5 col-form-label">Quantity</label>
                                                        <div class="col-7">
                                                            <asp:TextBox ID ="txtQuantity" runat="server" OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true"
          
                                                                class="text-right form-control"
            
                                                                ></asp:TextBox>
                                                        </div>
                                                    </div>

                                                                                                <div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label ">Face Value For Deal(Rs.)*</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID="txtFaceValueDeal" runat="server" CssClass="text-right form-control" 
                                                            placeholder="Face Value For Deal" OnTextChanged="txtFaceValueDeal_TextChanged" AutoPostBack="true" ReadOnly="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                                        <div class="form-group row" runat="server" visible="false">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Number of Days</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtNumberDays" runat="server"
                                                            class="text-right form-control" ReadOnly="true"
                                                            
                                                            placeholder=""></asp:TextBox>
                                                    </div>
                                                </div>
                                                 
                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Principal Amount</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtPrincipalAmount" runat="server"
                                                            class="text-right form-control" ReadOnly="true"
                                                            
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Accrued Interest</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtAccured" runat="server"
                                                            class="text-right form-control" ReadOnly="true"
                                                            
                                                            placeholder=""></asp:TextBox>
                                                    </div>
                                                </div>
                                                

                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Gross Consideration</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtGrossConder" runat="server" ReadOnly="true"
                                                          class="text-right form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Stamp Duty</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtStampDuty" runat="server" type="text"
                                                            
                                                            class="text-right form-control" ReadOnly="true"
                                                            
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Total Consideration(Rs.) with Stamp Duty</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtConsiderationStamp" runat="server" ReadOnly="true"
                                                            
                                                            class="text-right form-control"
                                                           
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>
                   
                                            
                                                                                                  </ItemTemplate>
                                                </asp:Repeater>
                                                <div class="row">
                                                    <p class="h6 font_2" style="margin-left:10px;">
                                                 <asp:LinkButton ID="lnkClear" runat="server" CssClass="btn btn-primary" OnClick="lnkClear_Click">Clear</asp:LinkButton>
                                                        </p>
                                                <asp:Panel ID ="pnlViewSheet" runat="server">
                                                    <p class="h6 font_2" style="margin-left:10px;">
                                                <asp:LinkButton ID="lnkInterestSheet" runat="server" CssClass="btn btn-primary" OnClick="lnkInterestSheet_Click">View Interest Sheet</asp:LinkButton>
                                                        </p>
                                                    </asp:Panel>
                                                <asp:Panel ID ="pnlLoginToView" runat="server">
                                                    <p class="h6 font_2" style="margin-left:10px;">
                                                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-primary" OnClick="LinkButton3_Click">Login To View Interest Sheet</asp:LinkButton>
                                                        </p>
                                                </asp:Panel>
                                                    </div>
                                        </div>
                                    </div>
                                        </div>
                                        
                                    <div class="col-md-8 p-md-3 p-0">
                                        <div class="table box p-md-5 p-4 font_2">
                                            <asp:Panel ID="pnlViewInteresr" runat="server">
                                              <table>
       <tr>
           <td>
               <h3><strong>Dimension Financial Solutions Pvt Ltd</strong></h3>
               <p>Plot No-10, Third Floor, Dimension Group Building,<br>Commercial Area, Kaushambi, Ghaziabad U.P -
                   201010<br />
              <strong>CIN</strong> - U74140DL2009PTC186563<br />
              <strong> Email Id </strong> - debt@dimensiongroup.co.in<br />
               <strong>Mobile No</strong> - +91 9650700244 / 9650799558<br />                                                          

           <%--    <p><strong>As per our mutual discussion(s) we confirm to Sale the following securities as per details
                       given below:</strong></p>--%>
           </td>
           <td>
              <img src="Signup/Picture1.png" style="width:70%;"/>
           </td>
       </tr>
   </table>
  <table  style="width:100%;">
      <tr>
          <td class="border-top-0">To ,</td>
      </tr>

             <tr>
                 <td class="text-left border-top-0"><strong> <asp:Label ID="lblCustomers" runat="server"></asp:Label></strong></td>
          <td class="text-right border-top-0"><strong> <asp:Label ID="lblCDate" runat="server"></asp:Label></strong></td>
      </tr>
                                            </table>
                                            <table style="width:100%;">
                                                
                                                <tr>
                                                    <td>ISIINNo</td>
                                                    <td><asp:Label ID="lblISIN" runat="server"></asp:Label></td>
                                                    <td>Price</td>
                                                    <td><asp:Label ID="lblPrice" runat="server"></asp:Label></td>
                                                </tr>
                                                                                                <tr>
                                                    <td class="border-top-0">Face Value</td>
                                                    <td class="border-top-0"><asp:Label ID="lblFaceValue" runat="server"></asp:Label></td>
                                                    <td class="border-top-0">Yield</td>
                                                    <td class="border-top-0"><asp:Label ID="lblYield" runat="server"></asp:Label>%</td>
                                                </tr>
                                                                                                <tr>
                                                    <td class="border-top-0">Coupon Rate</td>
                                                    <td class="border-top-0"><asp:Label ID="lblCouponRates" runat="server"></asp:Label> %</td>
                                                    <td class="border-top-0">YTC/Yield</td>
                                                    <td class="border-top-0"><asp:Label ID="lblYTC" runat="server"></asp:Label></td>
                                                </tr>
                                                                                                <tr>
                                                    <td class="border-top-0">Maturity Date</td>
                                                    <td class="border-top-0"><asp:Label ID="lblMaturity" runat="server"></asp:Label></td>
                                                    <td class="border-top-0">Allotment Date</td>
                                                    <td class="border-top-0"><asp:Label ID="lblAllotment" runat="server"></asp:Label></td>
                                                </tr>
                                                                                                <tr>
                                                    <td class="border-top-0">Put Option</td>
                                                    <td class="border-top-0"><asp:Label ID="lblPut" runat="server"></asp:Label></td>
                                                    <td class="border-top-0">Payment Frequency</td>
                                                    <td class="border-top-0"><asp:Label ID="lblPaymentFrequesce" runat="server"></asp:Label></td>
                                                </tr>
                                                                                                <tr>
                                                    <td class="border-top-0">Call Option</td>
                                                    <td class="border-top-0"><asp:Label ID="lblCall" runat="server"></asp:Label></td>
                                                    <td class="border-top-0">Last Interest Payment</td>
                                                    <td class="border-top-0"><asp:Label ID="lblLastIP" runat="server"></asp:Label></td>
                                                </tr>
                                            </table>
                                                </asp:Panel>
                                            <h2 class="font-weight-normal mb-md-4 text-center">Interest Sheet</h2>
                                             <asp:Panel ID ="pnlInterestBullet" runat="server">
                                            <table
                                                class="table table-striped table-hover text-center">
                                                <thead>
                                                    <tr>
                                                        <th>Interest Date</th>
                                                        <th>Coupon</th>
<%--                                                        <th>Interest Amount(actual)</th>--%>
                                                        <th>Days</th>
                                                        <th>Interest Amount</th>
                                                    </tr>

                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID ="rptCash" runat="server">
                                                        <ItemTemplate>
                                                             <tr>
                                                        <td><%#Eval("InterestDate") %></td>
                                                        <td><%#Eval("CouponRate") %>%</td>
<%--                                                        <td><%#Eval("InterestValue") %></td>--%>
                                                        <td><%#Eval("MonthDayValue") %></td>
                                                        <td><%#Eval("InterestValue365") %></td>
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
                                                                                                                                                                                                                                                              <asp:Panel ID ="pnlInterestStaggered" runat="server">
                                                                    <table
                                                                    class="table table-striped table-hover text-center">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Interest Date</th>
                                                                            <th>Coupon</th>
                                                                            <th>Interest Amount</th>
                                                                            <th>Principal Redemption</th>
                                                                            <th>Face Value For Deal</th>
                                                                            <th>Days</th>
                                                                            <th>Interest Amount</th>
                                                                        </tr>

                                                                    </thead>
                                                                    <tbody style=" height:100px; overflow-y: auto; width:auto">
                                                                        <asp:Repeater ID ="rptStaggeredSheet" runat="server" OnItemDataBound="rptStaggeredSheet_ItemDataBound">
                                                                            <ItemTemplate>
                                                                                    <tr>
                                                                            <td><%#Eval("InterestDate") %></td>
                                                                            <td><%#Eval("CouponRate") %>%</td>
                                                                            <td><%#Eval("InterestValue") %></td>

                                                                <asp:HiddenField ID ="hfPrincipal" runat="server" Value='<%#Eval("PrincipalAmount") %>' />
                                                                
                                                                            <td>
                                                                                    <asp:Panel ID ="pnlHide" runat="server">
                                                                                <%#Eval("PrincipalAmount") %> @  <%#Eval("Percentage") %> %
                                                                                                                                                        </asp:Panel>
                                                                            </td>

                                                                            <td><%#Eval("DealValue") %></td>
                                                                            <td><%#Eval("MonthDayValue") %></td>
                                                                                        <td><%#Eval("InterestValue365") %></td>
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

                                            <asp:Panel ID ="pnlInterestCumulative" runat="server">
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
                                                <tbody style=" height:100px; overflow-y: auto; width:auto">
                                                    <asp:Panel ID ="pnlDetailsCumulative" runat="server">
                                                        <tr>
                                                        <td>
                                                            <asp:Label ID="lblInterestDate" runat="server"></asp:Label></td>
                                                            <td><asp:Label ID="lblCoupon" runat="server"></asp:Label>%</td>
                                                        <td><asp:Label ID="lblInterest" runat="server"></asp:Label></td>
                                                        <td><asp:Label ID="lblDays" runat="server"></asp:Label></td>

                                                        <%--<td>366</td>--%>
                                                    </tr>
                                                    </asp:Panel>

                                                             

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
                      <%--      
             </ContentTemplate>
    </asp:UpdatePanel>--%>
<%--                            </div>         --%>       
                            </asp:Panel>
                            <asp:Panel ID="pnl3" runat="server">
<%--                                                                                             <div id="tab-3" class="tab-content cashflow ">--%>
                               <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                     <ContentTemplate>--%>
                                         <div class="row">
                                    <div class="col-md-4 p-md-3 p-0">
                                        <div class="box border p-md-5 p-4 font_2 ">
                                            <h2 class="font-weight-normal mb-md-4">Deal</h2>
                                            
                                                <asp:Repeater ID ="rptDeal" runat="server" OnItemDataBound="rptDeal_ItemDataBound">
                                                    <ItemTemplate>
                         <asp:HiddenField ID="hfSecurity" runat="server" Value='<%#Eval("Security") %>' />
                                                        <asp:HiddenField ID="hfIPDate" runat="server" Value='<%#Eval("IPDate") %>'/>
                                                        <asp:HiddenField ID="hfMaturityType" runat="server" Value='<%#Eval("PaymentTypeHead") %>' />
                                                        <asp:HiddenField ID="hfPutDate" runat="server" Value='<%#Eval("PutCallDate") %>'/>
                                                        <asp:HiddenField ID="hfCallDate" runat="server" Value='<%#Eval("CallDate") %>' />
                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label ">
                                                        Coupon Rate</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtCouponRate" runat="server" type="number"
                                                            class="text-right form-control" ReadOnly="true" Text='<%#Eval("CouponRate") %>'></asp:TextBox>
                                                    </div>
                                                </div>


                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Maturity Date</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtMaturityDate" runat="server"
                                                            class="text-right form-control" ReadOnly="true" Text='<%#Eval("MaturityDate") %>' 
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>
                                             
                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Call Option</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtCallOption" runat="server" type="number"
                                                            class="text-right form-control" ReadOnly="true"
                                                            
                                                            placeholder="NA"></asp:TextBox>
                                                    </div>
                                                </div>
                                                

                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Last Interest Payment Date</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtLastIP" runat="server"                                                           
                                                            class="text-right form-control" ReadOnly="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">ISIN Number</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtISINNumber" runat="server"
                                                           class="text-right form-control" ReadOnly="true" Text='<%#Eval("ISINNumber") %>'></asp:TextBox>
                                                    </div>
                                                </div>
                                                
                                                <div class="form-group row">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Rate</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtRate" runat="server" Text='<%#Eval("Price") %>'
                                                            class="text-right form-control"
                                                            
                                                            value="0" ReadOnly="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                               <div class="form-group row" runat="server">
                                                        <label for="staticEmail"
                                                            class="col-5 col-form-label">Yield</label>
                                                        <div class="col-7">
                                                            <asp:TextBox ID ="txtYTM" runat="server"
                                                                class="text-right form-control"
            
                                                                 ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                <div class="form-group row" runat="server">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Face Value For Bond(Rs.)</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtFaceValueBond" runat="server" ReadOnly="true"
                                                            class="text-right form-control" Text='<%#Eval("FacevalueForBond") %>'
                                                           
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>
                                                               
                         <div class="form-group row" runat="server" visible="false">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Payment Type/Frequency*</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID="ddlPaymentType" runat="server" CssClass="text-right form-control" ReadOnly="true" Text='<%#Eval("PaymentTypeHead") %>'></asp:TextBox>
                                                    </div>
                                                </div>
                                                   <div class="form-group row">
                                                            <label for="inputPassword"
                                                                class="col-5 col-form-label">Deal Date*</label>
                                                            <div class="col-7">
                                                                <asp:TextBox ID ="txtDealDate" runat="server" class="text-right form-control datepicker" placeholder="DD/MM/YYYY" ></asp:TextBox>

                                                            </div>
                                                        </div>
            
                                                        <div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Settlement Date*</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtSattlementdateD" runat="server"
                                                            class="text-right form-control datepicker" OnTextChanged="txtSattlementdateD_TextChanged" AutoPostBack="true" placeholder="DD/MM/YYYY"
                                                            ></asp:TextBox>

                                                    </div>
                                                </div>
                                            <div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label ">Quantity*</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID="txtQuantityValue" runat="server" CssClass="text-right form-control" 
                                                            placeholder="Quantity" OnTextChanged="txtQuantityValue_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label ">Face Value For Deal(Rs.)*</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID="txtFaceValueDealD" runat="server" CssClass="text-right form-control" ReadOnly="true" 
                                                            placeholder="Face Value For Deal"></asp:TextBox>
                                                    </div>
                                                </div>
                                                        <div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Number of Days</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtNumberDays" runat="server"
                                                            class="text-right form-control" ReadOnly="true"
                                                            
                                                            placeholder=""></asp:TextBox>
                                                    </div>
                                                </div>
            <%--<div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Quantity</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtQuantity" runat="server" ReadOnly="true"
                                                          
                                                            class="text-right form-control"
                                                            
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>--%>
                                                <div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Principal Amount</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtPrincipalAmount" runat="server"
                                                            class="text-right form-control" ReadOnly="true"
                                                            
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Accrued Interest</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtAccured" runat="server"
                                                            class="text-right form-control" ReadOnly="true"
                                                            
                                                            placeholder=""></asp:TextBox>
                                                    </div>
                                                </div>
                                                

                                                <div class="form-group row" runat="server" visible="false">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Gross Consideration</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtGrossConder" runat="server" ReadOnly="true"
                                                          class="text-right form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="inputPassword"
                                                        class="col-5 col-form-label">Stamp Duty</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtStampDuty" runat="server" type="text"
                                                            
                                                            class="text-right form-control" ReadOnly="true"
                                                            
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="staticEmail"
                                                        class="col-5 col-form-label">Total Consideration(Rs.) with Stamp Duty</label>
                                                    <div class="col-7">
                                                        <asp:TextBox ID ="txtConsiderationStamp" runat="server" ReadOnly="true"
                                                            
                                                            class="text-right form-control"
                                                           
                                                            ></asp:TextBox>
                                                    </div>
                                                </div>

                                                        <asp:LinkButton ID="lnkClearfield" runat="server" CssClass="btn btn-primary" OnClick="lnkClearfield_Click">
                                                            Clear
                                                        </asp:LinkButton>

                                                                                                  </ItemTemplate>
                                                </asp:Repeater>
<%--                                                <asp:Panel ID ="Panel1" runat="server">
                                                <asp:LinkButton ID="lnkDInterestSheet" runat="server" CssClass="btn btn-primary" OnClick="lnkDInterestSheet_Click">View Interest Sheet</asp:LinkButton>
                                                    </asp:Panel>
                                                <asp:Panel ID ="Panel2" runat="server">
                                                    <p class="h6 font_2">
                                                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn btn-primary" OnClick="LinkButton3_Click">Login To View Interest Sheet</asp:LinkButton>
                                                        </p>
                                                </asp:Panel>--%>
                                        
                                    </div>
                                        </div>


                                    <div class="col-md-8 p-md-3 p-0" runat="server" id="pnlDealConfirmation">
                                        <asp:HiddenField ID="hfDealConfirmationId" runat="server" />
                                        <asp:HiddenField ID="hfCustomerName" runat="server" />
                                         <div class="col-md-12 text-right">
                                               <asp:LinkButton ID="lnkprint" runat="server" CssClass="btn btn-primary" OnClick="lnkprint_Click">Download</asp:LinkButton>
                                                                                </div>

                                        <div class="table box p-md-5 p-4 font_2" id="printarea">
                                               <table>
                                                    <tr>
                                                        <td>
                                                            <h3><strong>Dimension Financial Solutions Pvt Ltd</strong></h3>
                                                            <p>Plot No-10, Third Floor, Dimension Group Building,<br>Commercial Area, Kaushambi, Ghaziabad U.P -
                                                                201010<br />
                                                           <strong>CIN</strong> - U74140DL2009PTC186563<br />
                                                           <strong> Email Id </strong> - debt@dimensiongroup.co.in<br />
                                                            <strong>Mobile No</strong> - +91 9650700244 / 9650799558<br />                                                          
                                                             <strong>Ref No:</strong> - DFS/227/2023-24,<br>to<br><strong> <asp:Label ID="lblCustomer" runat="server"></asp:Label></strong></p>
                                                        <%--    <p><strong>As per our mutual discussion(s) we confirm to Sale the following securities as per details
                                                                    given below:</strong></p>--%>
                                                        </td>
                                                        <td>
                                                           <img src="Signup/Picture1.png" style="width:100%"/>
                                                        </td>
                                                    </tr>
                                                </table>
                        <table style="width: 100%;" border="1">
                            <tr>
                                <td><strong>Transaction Type</strong></td>
                                <td colspan="3"><strong>Security Sale</strong></td>
                            </tr>
                            <tr>
                                <td>Deal Date</td>
                                <td><asp:Label ID="lblDealDate" runat="server"></asp:Label></td>
                                <td>Settlement Date</td>
                                <td><asp:Label ID ="lblSattlementDate" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="4">Security Details :-</td>
                            </tr>
                            <tr>
                                <td>Name of Security</td>
                                <td colspan="3"><asp:Label ID="lblSecurity" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>ISIN Number</td>
                                <td colspan="3"><asp:Label ID="lblISINNumber" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Coupon Rate</td>
                                <td colspan="3"><asp:Label ID="lblCouponRate" runat="server"></asp:Label>%</td>
                            </tr>
<%--                            <tr>
                                <td>Date of Allotment</td>
                                <td colspan="3"><asp:Label ID="lblDateofallotment" runat="server"></asp:Label></td>
                            </tr>--%>
                            <tr>
                                <td>Interest Payment Date</td>
                                <td colspan="3"><asp:Label ID="lblMaturitytype" runat="server"></asp:Label>-<asp:Label ID="lblIPDate" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Maturity Date</td>
                                <td colspan="3"><asp:Label ID="lblMaturityDate" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Put/Call Option</td>
                                <td colspan="3"><asp:Label ID="lblPutDate" runat="server"></asp:Label>/<asp:Label ID="lblCallDate" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Last Interest Payment Date</td>
                                <td colspan="3"><asp:Label ID="lblLastIPDate" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Number of Days</td>
                                <td colspan="3"><asp:Label ID="lblNoOfDays" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Face Value of Per Bond</td>
                                <td colspan="3"><asp:Label ID="lblFacevaluebond" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Quantity</td>
                                <td colspan="3"><asp:Label ID="lblQuantity" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Rate (Rs.)</td>
                                <td><asp:Label ID="lblRate" runat="server"></asp:Label></td>
                                <td>YTM</td>
                                <td><asp:Label ID="lblYTM" runat="server"></asp:Label> %</td>
                            </tr>
                            <tr>
                                <td>Face Value of Deal (Rs.)</td>
                                <td colspan="3"><asp:Label ID="lblFaceValueofdeal" runat="server"></asp:Label></td>
                            </tr>
                                    <tr>
                                <td>Principal Amount (Rs.)</td>
                                <td colspan="3"><asp:Label ID="lblPrincipalAmount" runat="server"></asp:Label></td>
                            </tr>
                                    <tr>
                                <td>Accured Interest (Rs.)</td>
                                <td colspan="3"><asp:Label ID="lblAccuredInterest" runat="server"></asp:Label></td>
                            </tr>
                                    <tr>
                                <td>Total Consideration (Rs.)</td>
                                <td colspan="3"><asp:Label ID="lblTotalConsideration" runat="server"></asp:Label></td>
                            </tr>
                                    <tr>
                                <td>Stamp Duty (Rs.)</td>
                                <td colspan="3"><asp:Label ID="lblStampduty" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px 0;">
                                    <strong> Total Consideration (Rs.) With Stamp Duty</strong>
                                </td>
                                <td colspan="3"><asp:Label ID="lblConsiderationwithduty" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                        <p>**This document is system genrated, doesn't require any signature..**</p>
                        <table style="width: 100%;">
                            <tr>
                                <td>Yours Faithfully</td>
                            </tr>
                            <tr>
                                <td>We hereby confirm the deal</td>
                                <td>We are agreeable to buy the security as per terms mentioned above</td>
                            </tr>
                            <tr>
                                <td>For Dimension Financial Solutions Pvt. Ltd.</td>
                                <td>For <strong><asp:Label ID="lblCustomerName" runat="server"></asp:Label></strong></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>(Authorised Signatory)<br>

                                    Our Pan : AADCD0669G
<%--                                                    <img src="Signup/Picture2.jpg" style="height: 50px;" alt=""/>--%>
                                   <%-- <img src="#stamp Image" style="height: 60px;" alt="">--%>
                                </td>
                                <td style="text-align: center;">Authorised Signatory</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center;">

                                    Dimension Financial Solutions Pvt. Ltd.<br>
                                    Regd. Office: 302, Dakha Chamber, 38/2068, Naiwala Karol Bagh, New Delhi-110005 <br>
                                    Tel.: 0120-4376552, 4336551-52 Fax: +91-0120-4151349 <br>
                                    Website: www.dimensiongroup.co.in

                                </td>
                            </tr>

                        </table>
                                                                                  
                                        </div>
                                    </div>
                              
                                    
                            </div>
                               <%--      </ContentTemplate>
                                 </asp:UpdatePanel>--%>
                        <%--    </div>    --%> 
                            </asp:Panel>
                                                                                        
                                         <div class="col-md-8 p-md-3 p-0" runat="server" visible="false">
                                            <div class="table box">
                                              
                                              <h2 class="font-weight-normal mb-md-4">Interest Sheet</h2>
                                              <asp:Panel ID ="Panel3" runat="server">
                                                <table
                                                    class="table table-striped table-hover text-center">
                                                    <thead>
                                                        <tr>
                                                            <th>Interest Date</th>
                                                            <th>Coupon</th>
                                                            <th>Interest Amount</th>
                                                            <th>Days</th>
                                                            <th>Interest Rate</th>
                                                        </tr>

                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID ="rptFlow" runat="server">
                                                            <ItemTemplate>
                                                                    <tr>
                                                            <td><%#Eval("InterestDate") %></td>
                                                            <td><%#Eval("CouponRate") %>%</td>
                                                            <td><%#Eval("InterestValue") %></td>
                                                            <td><%#Eval("MonthDayValue") %></td>
               
                                                        </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
              

                                                    </tbody>
                                                </table>
                                                        </asp:Panel>
                                                <asp:Panel ID ="Panel4" runat="server">
                                                    <table
                                                    class="table table-striped table-hover text-center">
                                                    <thead>
                                                        <tr>
                                                            <th>Interest Date</th>
                                                            <th>Coupon</th>
                                                            <th>Interest Amount</th>
                                                            <th>Principal Redemption</th>
                                                            <th>Face Value For Deal</th>
                                                            <th>Days</th>

                                                        </tr>

                                                    </thead>
                                                    <tbody style=" height:100px; overflow-y: auto; width:auto">
                                                        <asp:Repeater ID ="rptSFlow" runat="server" OnItemDataBound="rptStaggeredSheet_ItemDataBound">
                                                            <ItemTemplate>
                                                                    <tr>
                                                            <td><%#Eval("InterestDate") %></td>
                                                            <td><%#Eval("CouponRate") %>%</td>
                                                            <td><%#Eval("InterestValue") %></td>

                                                <asp:HiddenField ID ="hfPrincipal" runat="server" Value='<%#Eval("PrincipalAmount") %>' />
                            
                                                            <td>
                                                                    <asp:Panel ID ="pnlHide" runat="server">
                                                                <%#Eval("PrincipalAmount") %> @  <%#Eval("Percentage") %> %
                                                                                                                                        </asp:Panel>
                                                            </td>

                                                            <td><%#Eval("DealValue") %></td>
                                                            <td><%#Eval("MonthDayValue") %></td>


                                                        </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
              

                                                    </tbody>
                                                </table>
                                                </asp:Panel>

                                                <asp:Panel ID ="Panel5" runat="server">
                                                    <table
                                                    class="table table-striped table-hover text-center">
                                                    <thead>
                                                        <tr>
                                                            <th>Interest Date</th>
                                                            <th>Coupon</th>
                                                            <th>Interest Amount</th>
                                                            <th>Days</th>
                                                        </tr>

                                                    </thead>
                                                    <tbody style=" height:100px; overflow-y: auto; width:auto">
                                                        <asp:Panel ID ="Panel6" runat="server">
                                                            <tr>
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server"></asp:Label></td>
                                                                <td><asp:Label ID="Label2" runat="server"></asp:Label>%</td>
                                                            <td><asp:Label ID="Label3" runat="server"></asp:Label></td>
                                                            <td><asp:Label ID="Label4" runat="server"></asp:Label></td>

                                                        </tr>
                                                        </asp:Panel>

                         

              

                                                    </tbody>
                                                </table>
                                                </asp:Panel>
                                            </div>
                                        </div>                                               
                                                                                        
                                                                                        
                    </div>

                </div>
            </div>
                </div>

        </section>
        </asp:Panel>

                <asp:Panel ID="pnlViewDealCalculation" runat="server">
                    <div class="card">
                                                         <div class="col-md-12 p-md-3 p-0" runat="server" id="Div1">
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <asp:HiddenField ID="HiddenField2" runat="server" />


                                        <div class="table box p-md-5 p-4 font_2" id="printareas">
                                               <table>
                                                    <tr>
                                                        <td style="width:60%">
                                                            <h3><strong>Dimension Financial Solutions Pvt Ltd</strong></h3>
                                                            <p>Plot No-10, Third Floor, Dimension Group Building,<br>Commercial Area, Kaushambi, Ghaziabad U.P -
                                                                201010<br />
                                                           <strong>CIN</strong> - U74140DL2009PTC186563<br />
                                                           <strong> Email Id </strong> - debt@dimensiongroup.co.in<br />
                                                            <strong>Mobile No</strong> - +91 9650700244 / 9650799558<br />                                                          
                                                             <strong>Ref No:</strong> - DFS/227/2023-24,<br>to<br><strong> <asp:Label ID="Label5" runat="server"></asp:Label></strong></p>
                                                        <%--    <p><strong>As per our mutual discussion(s) we confirm to Sale the following securities as per details
                                                                    given below:</strong></p>--%>
                                                        </td>
                                                        <td style="width:40%; text-align:right;">
                                                           <img src="Signup/Picture1.png" style="width:100%"/>
                                                        </td>
                                                    </tr>
                                                </table>
                        <table style="width: 100%;" border="1">
                            <tr>
                                <td><strong>Transaction Type</strong></td>
                                <td colspan="3"><strong>Security Sale</strong></td>
                            </tr>
                            <tr>
                                <td>Deal Date</td>
                                <td><asp:Label ID="lblDealDates" runat="server"></asp:Label></td>
                                <td>Settlement Date</td>
                                <td><asp:Label ID ="lblSattlementDates" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="4">Security Details :-</td>
                            </tr>
                            <tr>
                                <td>Name of Security</td>
                                <td colspan="3"><asp:Label ID="lblSecuritys" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>ISIN Number</td>
                                <td colspan="3"><asp:Label ID="lblISINNumbers" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Coupon Rate</td>
                                <td colspan="3"><asp:Label ID="lblCouponRatess" runat="server"></asp:Label>%</td>
                            </tr>
<%--                            <tr>
                                <td>Date of Allotment</td>
                                <td colspan="3"><asp:Label ID="lblDateofallotment" runat="server"></asp:Label></td>
                            </tr>--%>
                            <tr>
                                <td>Interest Payment Date</td>
                                <td colspan="3"><asp:Label ID="lblMaturitytypes" runat="server"></asp:Label>-<asp:Label ID="lblIPDates" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Maturity Date</td>
                                <td colspan="3"><asp:Label ID="lblMaturityDates" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Put/Call Option</td>
                                <td colspan="3"><asp:Label ID="lblPutDates" runat="server"></asp:Label>/<asp:Label ID="lblCallDates" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Last Interest Payment Date</td>
                                <td colspan="3"><asp:Label ID="lblLastIPDates" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Number of Days</td>
                                <td colspan="3"><asp:Label ID="lblNoOfDayss" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Face Value of Per Bond</td>
                                <td colspan="3"><asp:Label ID="lblFacevaluebonds" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Quantity</td>
                                <td colspan="3"><asp:Label ID="lblQuantitys" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Rate (Rs.)</td>
                                <td><asp:Label ID="lblRates" runat="server"></asp:Label></td>
                                <td>YTM</td>
                                <td><asp:Label ID="lblYTMs" runat="server"></asp:Label> %</td>
                            </tr>
                            <tr>
                                <td>Face Value of Deal (Rs.)</td>
                                <td colspan="3"><asp:Label ID="lblFaceValueofdeals" runat="server"></asp:Label></td>
                            </tr>
                                    <tr>
                                <td>Principal Amount (Rs.)</td>
                                <td colspan="3"><asp:Label ID="lblPrincipalAmounts" runat="server"></asp:Label></td>
                            </tr>
                                    <tr>
                                <td>Accured Interest (Rs.)</td>
                                <td colspan="3"><asp:Label ID="lblAccuredInterests" runat="server"></asp:Label></td>
                            </tr>
                                    <tr>
                                <td>Total Consideration (Rs.)</td>
                                <td colspan="3"><asp:Label ID="lblTotalConsiderations" runat="server"></asp:Label></td>
                            </tr>
                                    <tr>
                                <td>Stamp Duty (Rs.)</td>
                                <td colspan="3"><asp:Label ID="lblStampdutys" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px 0;">
                                    <strong> Total Consideration (Rs.) With Stamp Duty</strong>
                                </td>
                                <td colspan="3"><asp:Label ID="lblConsiderationwithdutys" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                        <p>**This document is system genrated, doesn't require any signature..**</p>
                        <table style="width: 100%;">
                            <tr>
                                <td>Yours Faithfully</td>
                            </tr>
                            <tr>
                                <td>We hereby confirm the deal</td>
                                <td>We are agreeable to buy the security as per terms mentioned above</td>
                            </tr>
                            <tr>
                                <td>For Dimension Financial Solutions Pvt. Ltd.</td>
                                <td>For <strong><asp:Label ID="lblCustomerNames" runat="server"></asp:Label></strong></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>(Authorised Signatory)<br>

                                    Our Pan : AADCD0669G
<%--                                                    <img src="Signup/Picture2.jpg" style="height: 50px;" alt=""/>--%>
                                   <%-- <img src="#stamp Image" style="height: 60px;" alt="">--%>
                                </td>
                                <td style="text-align: center;">Authorised Signatory</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center;">

                                    Dimension Financial Solutions Pvt. Ltd.<br>
                                    Regd. Office: 302, Dakha Chamber, 38/2068, Naiwala Karol Bagh, New Delhi-110005 <br>
                                    Tel.: 0120-4376552, 4336551-52 Fax: +91-0120-4151349 <br>
                                    Website: www.dimensiongroup.co.in

                                </td>
                            </tr>

                        </table>
                                                                                  
                                        </div>

                                         <div class="col-md-12">
                                               <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-primary" OnClick="lnkprint_Click">Download</asp:LinkButton>
                                                                                            <asp:LinkButton ID="lnkConfirmDeal" runat="server" CssClass="btn btn-primary" OnClick="lnkConfirmDeal_Click">Confirm Your Deal</asp:LinkButton>
                                                                                </div>

                                    </div>
                        </div>
                </asp:Panel>

                <asp:Panel ID="pnlViewInterestSheet" runat="server">
                                                        <div class="col-md-12 p-0">
                                        <div class="table box p-4 font_2">
                                               <table>
                                                    <tr>
                                                        <td style="width:70%">
                                                            <h3><strong>Dimension Financial Solutions Pvt Ltd</strong></h3>
                                                            <p>Plot No-10, Third Floor, Dimension Group Building,<br>Commercial Area, Kaushambi, Ghaziabad U.P -
                                                                201010<br />
                                                           <strong>CIN</strong> - U74140DL2009PTC186563<br />
                                                           <strong> Email Id </strong> - debt@dimensiongroup.co.in<br />
                                                            <strong>Mobile No</strong> - +91 9650700244 / 9650799558<br />                                                          

                                                        <%--    <p><strong>As per our mutual discussion(s) we confirm to Sale the following securities as per details
                                                                    given below:</strong></p>--%>
                                                        </td>
                                                        <td style="width:30%; text-align:right;">
                                                           <img src="Signup/Picture1.png" style="width:70%;"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            <h2 class="font-weight-normal mb-md-4 text-center">Interest Sheet</h2>
                                             <asp:Panel ID ="pnlInBullet" runat="server">
                                            <table
                                                class="table table-striped table-hover text-center">
                                                <thead>
                                                    <tr>
                                                        <th>Interest Date</th>
                                                        <th>Coupon</th>
<%--                                                        <th>Interest Amount(actual)</th>--%>
                                                        <th>Days</th>
                                                        <th>Interest Amount</th>
                                                    </tr>

                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID ="rptbullet" runat="server">
                                                        <ItemTemplate>
                                                             <tr>
                                                        <td><%#Eval("InterestDate") %></td>
                                                        <td><%#Eval("CouponRate") %>%</td>
<%--                                                        <td><%#Eval("InterestValue") %></td>--%>
                                                        <td><%#Eval("MonthDayValue") %></td>
                                                        <td><%#Eval("InterestValue365") %></td>
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
                                                                                                                                                                                                                                                              <asp:Panel ID ="pnlStaggered" runat="server">
                                                                    <table
                                                                    class="table table-striped table-hover text-center">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Interest Date</th>
                                                                            <th>Coupon</th>
                                                                            <th>Interest Amount</th>
                                                                            <th>Principal Redemption</th>
                                                                            <th>Face Value For Deal</th>
                                                                            <th>Days</th>
                                                                            <th>Interest Amount</th>
                                                                        </tr>

                                                                    </thead>
                                                                    <tbody style=" height:100px; overflow-y: auto; width:auto">
                                                                        <asp:Repeater ID ="rptstag" runat="server" OnItemDataBound="rptstag_ItemDataBound">
                                                                            <ItemTemplate>
                                                                                    <tr>
                                                                            <td><%#Eval("InterestDate") %></td>
                                                                            <td><%#Eval("CouponRate") %>%</td>
                                                                            <td><%#Eval("InterestValue") %></td>

                                                                <asp:HiddenField ID ="hfPrincipal" runat="server" Value='<%#Eval("PrincipalAmount") %>' />
                                                                
                                                                            <td>
                                                                                    <asp:Panel ID ="pnlHide" runat="server">
                                                                                <%#Eval("PrincipalAmount") %> @  <%#Eval("Percentage") %> %
                                                                                                                                                        </asp:Panel>
                                                                            </td>

                                                                            <td><%#Eval("DealValue") %></td>
                                                                            <td><%#Eval("MonthDayValue") %></td>
                                                                                        <td><%#Eval("InterestValue365") %></td>
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

                                            <asp:Panel ID ="pnlcumu" runat="server">
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
                                                <tbody style=" height:100px; overflow-y: auto; width:auto">
                                                    <asp:Panel ID ="Panel9" runat="server">
                                                        <tr>
                                                        <td>
                                                            <asp:Label ID="Label19" runat="server"></asp:Label></td>
                                                            <td><asp:Label ID="Label20" runat="server"></asp:Label>%</td>
                                                        <td><asp:Label ID="Label21" runat="server"></asp:Label></td>
                                                        <td><asp:Label ID="Label22" runat="server"></asp:Label></td>

                                                        <%--<td>366</td>--%>
                                                    </tr>
                                                    </asp:Panel>


                                                </tbody>
                                            </table>
                                            </asp:Panel>
                                        </div>
                                    </div>
                </asp:Panel>

                


                <asp:Panel ID="pnlDescription" runat="server">
                                      <section class="overview-box mt-md-4 mt-4">
                <div class="container-fluid ">
                    <div class="row">
                                            <div class="col-md-12 p-md-3 p-1">
                            <div class="box p-lg-3 p-md-4 p-3">
                    <h4><strong>Description:</strong></h4>
                    
                                <asp:Repeater ID="rptDescription" runat="server">
                                    <ItemTemplate>
                                                        <p><%#Eval("Description") %></p>
                                    </ItemTemplate>
                                </asp:Repeater>

                        </div>
                    </div>
                      </div>
             </div>
                      </section>
                </asp:Panel>
                              
                <asp:Panel ID ="pnl" runat="server">
                    <asp:HiddenField ID ="hfInterstStatus" runat="server" />
                    <asp:HiddenField ID ="hfWidthForm" runat="server" />
                    <section class=" timlines" runat="server" visible="false">
                        <div class="container-fluid">
                
                                                                 <div class="box p-lg-2 p-md-4 p-0">
                     
                            <div class="row">

                                                                    
                                        <asp:Repeater ID ="rptChartFace" runat="server" OnItemDataBound="rptChartFace_ItemDataBound">
                                            <ItemTemplate>
                                                                            <div class="col-12 p-0 pt-3">
                                    <!-- 200px(1 interest timeline size) X 8(number of interest) = 2000px(size of total number of interest) -->
                                    <div class="interest-box">

                                                                                <div class="box tag"></div>

                                    
                                                                   
                              
                                                <asp:HiddenField ID ="hfCashFlowId" runat="server" Value='<%#Eval("CashFlowId") %>' />
                                        <asp:Repeater ID ="rptChart" runat="server" OnItemDataBound="rptChart_ItemDataBound">
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
                                                    <div class="box flag">

                <div class="date">
                    <h6><%#Eval("MaturityDate") %></h6>
                </div>
                <div class="timeline" style="background:none;"></div>
                <div class="interest-rate">
                    <small><b>Your Investment</b></small>
                    <p class="h6">
                        <span class="icon">₹</span>
                        <span class="rate"><%#Eval("HFaceValueForDeal") %></span>
                    </p>
                </div>
            </div>
                                                                                                            <div class="box tag"></div>
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
        <%--<section class="my-md-5 my-5 faq">
            <div class="container">
                <div class="row">

                    <div class="col-12">
                        <main>
                            <asp:Panel ID ="pnlView" runat="server">
                                <div class="container">
                                <h2 class="font-weight-bold h3">FAQ</h2>
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
                                <hr class="bg-dark">--%
                                <!--accordion-->
                            </div>
                            </asp:Panel>
                            
                        </main>

                    </div>
                            </div>
                      
            </div>
        </section>--%>
      

      

    <asp:UpdatePanel ID="uPanel" runat="server">
        <ContentTemplate>

            <section class="subscribe pb-md-5 pb-3 mt-3">
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
                                  <p>DON’T FALL BEHIND<br />
Stay current with a recap of today’s computing news from digital trend by bonds adda.</p>
                                    <div class="form-inline row">
                                        <div
                                            class="form-group col-md-8 mb-2 pr-md-0">
                                            <asp:TextBox ID ="txtEmail" runat="server"
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
        </asp:Panel>

                <asp:Panel ID="pnlLoginData" runat="server">
        <section class="signup-page">
    <div class="container">
        <div class="row border">
            <div class="col-md-6">
<%--                <a href="<%=ResolveUrl("~")%>Index" class="text-dark btn box"><i class="fa-solid fa-house"></i>Go Back to Home</a><br />--%>
                <br />
                <svg xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 323 221" fill="none">
                    <g clip-path="url(#clip0_306_45)">
                        <path
                            d="M227.97 0C201.01 0 162.77 6.83 121.85 20.08C48.3799 43.87 -5.9501 79.35 0.5199 99.33C3.3899 108.18 17.6999 112.5 39.1499 112.5C43.5699 112.5 48.2999 112.32 53.2799 111.95C53.6599 111.46 54.0599 110.94 54.4599 110.39C59.7099 103.32 64.0899 100.48 68.0799 100.24C68.2699 100.23 68.4699 100.22 68.6599 100.22C70.9299 100.22 73.0799 101.06 75.2099 102.43C77.0799 103.64 79.9199 105.77 82.9499 108.15C83.1499 108.12 83.3499 108.08 83.5499 108.04C83.2299 103.69 83.0899 99.79 83.3999 97.74C83.5099 96.99 83.8099 96.31 84.2399 95.68C83.8799 93 88.1099 93.76 85.8099 91.17C83.0399 88.06 86.8499 85.06 88.9199 82.64C90.9999 80.22 89.3199 77.8 89.6699 71.92C90.0199 66.04 94.6299 57.39 102.93 54.16C104.4 53.59 105.85 53.35 107.24 53.35C113.7 53.35 118.89 58.42 118.89 58.42C118.89 58.42 124.83 59.8 125.35 65.11C125.87 70.41 122.12 77.68 120.97 81.08C119.82 84.48 122.01 84.14 121.7 86.5C121.39 88.86 119.7 88.81 121.32 91.98C121.92 93.16 121.74 94.23 121.28 95.12C121.89 95.63 122.36 96.17 122.6 96.71C122.74 97.04 123.04 97.83 123.45 98.94C130.24 97.07 137.16 95.01 144.15 92.76V21.08V21.06C144.15 21.06 144.15 21.05 144.15 21.04V21.03C144.15 21.03 144.15 21 144.15 20.99C144.15 20.99 144.15 20.98 144.15 20.97C144.15 20.97 144.15 20.96 144.15 20.95C144.18 19.6 144.62 18.35 145.36 17.33C146.27 16.06 147.64 15.14 149.22 14.79C149.22 14.79 149.22 14.79 149.23 14.79C149.63 14.7 150.04 14.65 150.46 14.64C150.46 14.64 150.47 14.64 150.48 14.64C150.48 14.64 150.49 14.64 150.5 14.64C150.5 14.64 150.51 14.64 150.52 14.64C150.52 14.64 150.53 14.64 150.54 14.64C150.54 14.64 150.54 14.64 150.55 14.64H150.56H266.91C266.82 14.15 266.7 13.66 266.55 13.18C263.74 4.32 249.42 0 227.97 0Z"
                            fill="#F2F6FB" />
                        <path
                            d="M132.61 130.43L131.63 136.47C131.63 136.47 129.26 136.15 128.49 135.88C128.22 135.79 127.8 134.8 127.35 133.57C125.07 134.98 122.89 136.39 120.81 137.8C120.83 138.27 120.84 138.7 120.86 139.11C120.89 139.77 120.92 140.33 120.93 140.76C121.12 140.76 121.32 140.74 121.52 140.74C122.6 140.74 123.79 140.9 124.72 141.54C125.46 142.05 126.42 142.9 127.32 143.75L130.33 144.43L132.6 130.44M284.93 86.12C284.44 86.12 283.94 86.12 283.44 86.12V100.49C283.44 104.06 280.55 106.95 276.98 106.95H184.07C170.6 111.83 158.1 117.18 146.97 122.73H172.4C172.97 122.73 173.41 123.25 173.31 123.81L168.84 149.46L168.66 150.5C168.59 150.94 168.2 151.26 167.76 151.26H158.36L161 152.76L173.33 171.55C173.33 171.55 177.89 173.15 182.89 175.12C184.8 175.87 186.77 176.66 188.59 177.45C198.39 175.13 208.57 172.28 218.95 168.92C281.54 148.65 327.46 117.33 321.52 98.95C318.74 90.35 305.09 86.11 284.94 86.11"
                            fill="#F2F6FB" />
                        <path
                            d="M303.24 49.96C298.07 49.96 292.1 50.91 285.97 52.9C285.12 53.18 284.28 53.47 283.46 53.77V82.39C287.04 81.94 290.84 81.1 294.7 79.85C310.68 74.68 321.68 64.45 319.27 57.01C317.79 52.42 311.55 49.97 303.25 49.97"
                            fill="#F2F6FB" />
                        <path
                            d="M272.69 156.58C264.02 156.58 252.48 158.57 240.28 162.52C216.44 170.24 199.07 182.53 201.48 189.97C202.66 193.6 208.32 195.41 216.59 195.41C225.26 195.41 236.8 193.42 249 189.47C272.84 181.75 290.21 169.46 287.8 162.02C286.62 158.39 280.96 156.58 272.69 156.58Z"
                            fill="#F2F6FB" />
                        <path
                            d="M283.45 21.08V100.48C283.45 104.05 280.56 106.94 276.99 106.94H150.62C147.05 106.94 144.16 104.05 144.16 100.48V21.08C144.16 17.51 147.05 14.62 150.62 14.62H276.99C280.56 14.62 283.45 17.51 283.45 21.08Z"
                            fill="#E1E6F4" />
                        <path
                            d="M283.45 21.08V27.54H144.17V21.08C144.17 18.24 146 15.83 148.55 14.96C149.2 14.74 149.9 14.62 150.63 14.62H277C280.57 14.62 283.46 17.51 283.46 21.08"
                            fill="#6776E8" />
                        <path
                            d="M149.25 32.38V102.18C149.25 103.07 149.97 103.79 150.86 103.79H212.2C213.09 103.79 213.81 103.07 213.81 102.18V101.7C213.81 100.81 214.53 100.09 215.42 100.09H283.45V100.49C283.45 104.06 280.56 106.95 276.99 106.95H150.62C147.05 106.95 144.16 104.06 144.16 100.49V28.19C144.46 27.79 144.93 27.54 145.45 27.54H283.44V30.77H150.85C149.96 30.77 149.24 31.49 149.24 32.38"
                            fill="#C3C9E0" />
                        <mask id="mask0_306_45"
                            style="mask-type: luminance"
                            maskUnits="userSpaceOnUse" x="144" y="14"
                            width="140" height="14">
                            <path
                                d="M148.55 14.97C145.99 15.84 144.17 18.24 144.17 21.09V27.55H283.45V24.09H150.4C149.39 24.09 148.56 23.26 148.56 22.25V14.98"
                                fill="white" />
                        </mask>
                        <g mask="url(#mask0_306_45)">
                            <path
                                d="M283.45 14.97H144.17V27.54H283.45V14.97Z"
                                fill="#5350CD" />
                        </g>
                        <path
                            d="M240.85 16.81H170.19C169.46 16.81 168.86 17.4 168.86 18.14C168.86 18.88 169.45 19.47 170.19 19.47H240.85C241.58 19.47 242.18 18.88 242.18 18.14C242.18 17.4 241.59 16.81 240.85 16.81Z"
                            fill="#67A2E6" />
                        <path
                            d="M268.49 16.47H248.24C247.45 16.47 246.8 17.11 246.8 17.91V18.03C246.8 18.83 247.44 19.47 248.24 19.47H268.49C269.28 19.47 269.93 18.83 269.93 18.03V17.91C269.93 17.11 269.28 16.47 268.49 16.47Z"
                            fill="#67A2E6" />
                        <path
                            d="M218.34 49.14H205.97C204.865 49.14 203.97 50.0354 203.97 51.14V61.36C203.97 62.4646 204.865 63.36 205.97 63.36H218.34C219.444 63.36 220.34 62.4646 220.34 61.36V51.14C220.34 50.0354 219.444 49.14 218.34 49.14Z"
                            fill="#4167AA" />
                        <path
                            d="M213.04 56.67L214.07 59.52H210.25L211.25 56.65C210.65 56.33 210.25 55.69 210.25 54.97C210.25 53.91 211.1 53.06 212.16 53.06C213.22 53.06 214.07 53.91 214.07 54.97C214.07 55.71 213.65 56.34 213.04 56.67Z"
                            fill="#343D5B" />
                        <path
                            d="M218.48 49.14H215.71V45.93C215.71 43.93 214.08 42.3 212.08 42.3C210.08 42.3 208.45 43.93 208.45 45.93V47.54H205.68V45.93C205.68 42.4 208.55 39.53 212.08 39.53C215.61 39.53 218.48 42.4 218.48 45.93V49.14Z"
                            fill="#8697BF" />
                        <path
                            d="M243.25 72.58H180.07C178.966 72.58 178.07 73.4754 178.07 74.58V80.57C178.07 81.6746 178.966 82.57 180.07 82.57H243.25C244.355 82.57 245.25 81.6746 245.25 80.57V74.58C245.25 73.4754 244.355 72.58 243.25 72.58Z"
                            fill="white" />
                        <path
                            d="M243.25 87.19H180.07C178.966 87.19 178.07 88.0854 178.07 89.19V95.18C178.07 96.2846 178.966 97.18 180.07 97.18H243.25C244.355 97.18 245.25 96.2846 245.25 95.18V89.19C245.25 88.0854 244.355 87.19 243.25 87.19Z"
                            fill="white" />
                        <path
                            d="M236.99 78.96H186.49C185.79 78.96 185.22 78.39 185.22 77.69C185.22 76.99 185.79 76.42 186.49 76.42H236.99C237.69 76.42 238.26 76.99 238.26 77.69C238.26 78.39 237.69 78.96 236.99 78.96Z"
                            fill="#C3C9E0" />
                        <path
                            d="M196.1 92.55C196.1 93.26 195.52 93.84 194.81 93.84C194.1 93.84 193.52 93.26 193.52 92.55C193.52 91.84 194.1 91.26 194.81 91.26C195.52 91.26 196.1 91.84 196.1 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M200.94 92.55C200.94 93.26 200.36 93.84 199.65 93.84C198.94 93.84 198.36 93.26 198.36 92.55C198.36 91.84 198.94 91.26 199.65 91.26C200.36 91.26 200.94 91.84 200.94 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M205.78 92.55C205.78 93.26 205.2 93.84 204.49 93.84C203.78 93.84 203.2 93.26 203.2 92.55C203.2 91.84 203.78 91.26 204.49 91.26C205.2 91.26 205.78 91.84 205.78 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M210.62 92.55C210.62 93.26 210.04 93.84 209.33 93.84C208.62 93.84 208.04 93.26 208.04 92.55C208.04 91.84 208.62 91.26 209.33 91.26C210.04 91.26 210.62 91.84 210.62 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M215.47 92.55C215.47 93.26 214.89 93.84 214.18 93.84C213.47 93.84 212.89 93.26 212.89 92.55C212.89 91.84 213.47 91.26 214.18 91.26C214.89 91.26 215.47 91.84 215.47 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M220.31 92.55C220.31 93.26 219.73 93.84 219.02 93.84C218.31 93.84 217.73 93.26 217.73 92.55C217.73 91.84 218.31 91.26 219.02 91.26C219.73 91.26 220.31 91.84 220.31 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M225.15 92.55C225.15 93.26 224.57 93.84 223.86 93.84C223.15 93.84 222.57 93.26 222.57 92.55C222.57 91.84 223.15 91.26 223.86 91.26C224.57 91.26 225.15 91.84 225.15 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M229.99 92.55C229.99 93.26 229.41 93.84 228.7 93.84C227.99 93.84 227.41 93.26 227.41 92.55C227.41 91.84 227.99 91.26 228.7 91.26C229.41 91.26 229.99 91.84 229.99 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M316 209.63C316 215.87 248.71 220.93 165.7 220.93C82.6904 220.93 15.4004 215.87 15.4004 209.63C15.4004 203.39 82.6904 198.33 165.7 198.33C248.71 198.33 316 203.39 316 209.63Z"
                            fill="#E1E6F4" />
                        <path
                            d="M209.93 210.82C209.93 214.79 170.43 218.01 121.71 218.01C72.9902 218.01 33.4902 214.79 33.4902 210.82C33.4902 206.85 72.9902 203.63 121.71 203.63C170.43 203.63 209.93 206.85 209.93 210.82Z"
                            fill="#9EA9CC" />
                        <path
                            d="M299.48 209.24C299.48 211.06 280.69 212.54 257.51 212.54C234.33 212.54 215.54 211.06 215.54 209.24C215.54 207.42 234.33 205.94 257.51 205.94C280.69 205.94 299.48 207.42 299.48 209.24Z"
                            fill="#9EA9CC" />
                        <path
                            d="M193.55 196.34C190.74 208.87 174.15 212.48 135.64 213.17C97.1295 213.86 56.3095 212.02 33.9495 202.34C11.5795 192.65 21.2695 156.67 32.3395 138.85C43.4095 121.04 45.9495 121.85 54.4795 110.39C59.7295 103.32 64.1095 100.48 68.0995 100.24C70.5895 100.08 72.9195 100.95 75.2295 102.44C81.2295 106.31 97.2895 119.78 97.2895 119.78C97.2895 119.78 147.63 167.28 168.86 173.05C180.19 176.13 187.26 178.99 190.97 182.89C194.2 186.29 194.86 190.5 193.55 196.34Z"
                            fill="#FFC655" />
                        <path
                            d="M94.8602 172.77C94.6802 172.77 94.5102 172.78 94.3602 172.81C93.3702 172.99 90.9102 173.32 88.0102 173.65C91.9802 174.6 96.1802 175.3 100.35 175.83C100.81 174.86 97.0702 172.77 94.8602 172.77ZM84.7802 120.36C80.7702 121.93 72.5402 127.77 66.1002 149.41C62.4502 161.66 70.8302 168.4 82.7502 172.21C84.3502 171.92 85.9202 171.68 87.2002 171.55C92.7302 170.97 85.1302 170.98 77.7502 166.14C70.3702 161.3 73.8302 151.26 73.8302 151.26C75.9102 160.59 78.6702 159.68 81.9002 161.58C82.3702 161.86 82.7202 161.99 82.9802 161.99C84.4702 161.99 82.8302 157.39 84.2302 149.42C84.7402 146.49 85.8802 143.48 87.2102 140.73C87.2302 140.07 87.3702 139.22 87.4402 138.2C87.4802 137.61 87.4902 136.82 87.4902 135.97C87.4902 133.61 87.3802 130.75 87.3602 130.43C87.3602 130.41 87.3602 130.4 87.3602 130.4C87.3602 130.4 87.3102 130.38 86.9002 130.24C86.4402 130.09 86.2102 130.17 85.8902 128.75C85.7802 128.23 85.3002 124.81 84.7702 120.37"
                            fill="#FFAA56" />
                        <path
                            d="M193.55 196.34C190.74 208.87 174.15 212.48 135.64 213.17C97.1295 213.86 56.3095 212.02 33.9495 202.34C11.5795 192.65 21.2695 156.67 32.3395 138.85C43.4095 121.04 45.9495 121.85 54.4795 110.39C59.7295 103.32 64.1095 100.48 68.0995 100.24C63.4395 103.41 55.4295 109.9 52.8595 118.39C49.1695 130.61 43.3295 137.9 34.1795 146.06C25.0295 154.22 24.2595 179.27 32.3395 189.41C40.4095 199.56 65.7795 204.86 98.2895 208.09C130.8 211.32 185.24 209.38 188.58 196.75C189.84 191.94 190.56 187.07 190.97 182.89C194.2 186.29 194.86 190.5 193.55 196.34Z"
                            fill="#FF8A57" />
                        <path
                            d="M73.8395 151.25C73.8395 151.25 70.3795 161.29 77.7595 166.13C85.1395 170.97 92.7395 170.96 87.2095 171.54C81.6795 172.12 70.8395 174.66 75.4495 174.66C80.0595 174.66 91.8695 173.28 94.3595 172.82C96.8495 172.36 102.66 175.82 99.4295 176.28C96.1995 176.74 94.8195 180.66 94.8195 180.66C94.8195 180.66 98.7895 176.13 107.3 178.28C115.81 180.43 114.44 178.79 119.27 182.38C124.1 185.97 127.1 187.35 123.87 184.01C120.64 180.67 117.89 178.36 119.27 179.51C119.86 180 123.88 179.99 129.1 179.97C136.07 179.95 145.16 179.93 151.01 181.12C161.23 183.21 171.84 193.21 171.84 193.21L161 178.58C161 178.58 91.1495 163.71 88.3595 156.76C85.5695 149.81 93.8895 129.92 93.8895 129.92C93.8895 129.92 85.8595 140.06 84.2295 149.4C82.5995 158.74 85.1295 163.46 81.8995 161.56C78.6695 159.67 75.8995 160.58 73.8295 151.24"
                            fill="#FF8A57" />
                        <path
                            d="M36.7099 158.52C36.7099 158.52 23.4799 178.8 50.5999 190.95C77.7199 203.1 96.5799 201.56 97.2399 200.64C97.8999 199.72 100.88 197.15 95.9199 193.21C90.9599 189.27 56.5599 183.42 51.9199 174.51C47.2899 165.59 45.2999 151.76 36.6999 158.52H36.7099Z"
                            fill="#FFE461" />
                        <path
                            d="M105.52 195.53C105.52 195.53 148.23 194.19 147.55 199.42C146.87 204.65 146.95 205.57 132.02 205.57C117.09 205.57 94.9297 199.95 105.52 195.53Z"
                            fill="#FFE461" />
                        <path
                            d="M118.92 58.44C118.92 58.44 111.25 50.95 102.95 54.17C94.6501 57.4 90.0401 66.05 89.6901 71.93C89.3401 77.81 91.0201 80.23 88.9401 82.65C86.8601 85.07 83.0601 88.07 85.8301 91.18C88.6001 94.29 81.9101 92.56 85.1401 97.81C88.3701 103.06 118.92 97.58 118.92 97.58C118.92 97.58 122.96 95.16 121.34 91.99C119.73 88.82 121.41 88.88 121.72 86.51C122.03 84.15 119.84 84.49 120.99 81.09C122.14 77.69 125.89 70.42 125.37 65.12C124.85 59.82 118.91 58.43 118.91 58.43"
                            fill="#252549" />
                        <path
                            d="M98.1704 89.57C98.1704 89.57 99.3204 89.63 99.2004 88.19C99.0804 86.75 98.4504 87.5 100.64 83.98C102.83 80.46 102.2 80.06 101.39 78.1C100.58 76.14 103.95 74.76 105.96 71.93C107.96 69.11 110.44 65.59 112.58 63.63C114.71 61.67 116.73 61.61 117.88 62.19C119.03 62.77 119.38 64.03 119.38 64.03C119.38 64.03 119.09 76.54 116.5 81.15C113.91 85.76 112 85.88 109.75 85.19C109.75 85.19 108.94 89.17 109.4 90.67C109.86 92.17 114.88 94.18 112 98.28C109.12 102.37 101.36 104.32 98.6304 99.78C95.9004 95.24 98.1704 89.58 98.1704 89.58"
                            fill="#FFBF9F" />
                        <path
                            d="M190.17 190.06C190.17 190.06 197.07 191.6 199.56 192.87C202.05 194.15 205.33 194.58 206.83 192.41C208.33 190.24 208.07 188.72 210.55 186.74C213.04 184.75 218.65 181.79 217.76 179.7C216.87 177.61 214.98 178.05 213.41 179.63C211.83 181.21 204.53 182.49 203.2 183.13C201.86 183.77 197.31 183.82 196.36 183.82C195.41 183.82 190.83 182.16 190.83 182.16L190.17 190.07"
                            fill="#FFBF9F" />
                        <path
                            d="M181.15 200.03C181.15 200.03 186.84 204.26 187.61 206.95C188.38 209.64 190.3 212.33 192.91 211.95C195.52 211.57 196.45 210.34 199.6 210.8C202.75 211.26 208.75 213.34 209.67 211.26C210.59 209.18 208.98 208.11 206.75 208.03C204.52 207.95 198.6 203.49 197.22 202.96C195.84 202.42 190.83 199.5 190.18 198.81C189.53 198.12 187.38 195.12 187.38 195.12L181.15 200.04V200.03Z"
                            fill="#FFBF9F" />
                        <path
                            d="M193.55 191.24C193.16 192.12 192.82 192.75 192.6 193C191.71 194.01 187.19 191.08 186.96 190.92L186.98 190.95C187.29 191.27 189.75 193.91 190.18 195.53C190.6 197.28 180.85 201.99 179 202.34C177.16 202.69 163.78 184 163.78 184C163.78 184 148.56 179.39 146.83 178.59C146 178.2 138.45 178.19 130.88 178.28C122.79 178.38 114.67 178.59 114.67 178.59C114.67 178.59 110.64 177.21 106.6 175.59C102.56 173.98 87.3897 169.48 87.3897 169.48C87.3897 169.48 84.4697 167.17 84.4697 157.95C84.4697 148.73 89.5397 139.77 89.5397 139.77L97.1797 140.32L119.3 141.92L156.99 150.45L161.03 152.76L173.36 171.55C173.36 171.55 177.92 173.15 182.92 175.12C188.81 177.43 195.35 180.23 195.85 181.48C196.55 183.24 194.84 188.44 193.57 191.25"
                            fill="#3B345B" />
                        <path
                            d="M163.09 183.79L163.77 184C163.73 183.99 163.49 183.92 163.09 183.79ZM151.01 180.03L151.21 180.09C151.16 180.07 151.1 180.06 151.05 180.04C151.02 180.04 151.01 180.03 151.01 180.03Z"
                            fill="#5D3C2E" />
                        <path
                            d="M115.23 158.52C115.23 158.52 131.72 163.25 141.06 165.09C150.4 166.93 153.51 170.86 154.32 176.04C154.87 179.59 153.12 180.15 151.96 180.15C151.52 180.15 151.17 180.07 151.05 180.04C151.1 180.06 151.16 180.07 151.21 180.09L163.09 183.78C163.49 183.9 163.73 183.97 163.77 183.99C163.48 183.61 150.16 166.46 149.25 165.55C148.33 164.63 115.24 158.52 115.24 158.52"
                            fill="#26242F" />
                        <path
                            d="M173.34 171.54L186.95 190.91C187.15 191.05 190.47 193.2 192 193.2C192.26 193.2 192.47 193.14 192.6 192.99C192.82 192.74 193.16 192.1 193.55 191.23C191.35 190.04 189.35 188.58 188.11 186.82C185.92 183.74 184.13 179.04 182.9 175.11C177.9 173.15 173.34 171.54 173.34 171.54Z"
                            fill="#26242F" />
                        <path
                            d="M88.2402 142.35C86.7402 145.67 84.4502 151.75 84.4502 157.95C84.4502 167.17 87.3702 169.48 87.3702 169.48C87.3702 169.48 102.54 173.97 106.58 175.59C110.62 177.2 114.65 178.59 114.65 178.59C114.65 178.59 122.77 178.38 130.86 178.28C118.01 176.59 100.82 170.29 95.7802 160.38C93.2402 155.38 94.4602 148.44 96.3002 142.78C92.4402 142.66 89.2202 142.52 88.2402 142.37"
                            fill="#26242F" />
                        <path
                            d="M125.66 128.05C125.66 128.05 127.73 135.61 128.5 135.88C129.27 136.15 131.64 136.47 131.64 136.47L133.14 127.24L132.12 125.85C132.12 125.85 124.63 124.5 125.67 128.05"
                            fill="#FFBF9F" />
                        <path
                            d="M132.7 125.83C132.74 126.2 131.95 126.61 130.87 126.97C128.77 127.67 125.55 128.21 125.1 128.02C124.41 127.73 122.05 119.42 122.05 119.42C122.05 119.42 122.03 119.54 121.99 119.77V119.79C121.95 119.99 121.91 120.28 121.86 120.63C121.66 122.11 121.29 124.8 120.95 128.02C120.81 129.34 120.75 130.82 120.74 132.3C120.71 134.79 120.81 137.3 120.88 139.1C120.94 140.23 120.97 141.07 120.95 141.45C120.89 142.78 117.61 143.29 110.57 143.12C103.54 142.95 89.2603 142.68 88.0303 142.3C86.8003 141.91 87.3003 140.49 87.4603 138.19C87.6203 135.88 87.3903 130.39 87.3903 130.39L86.9303 130.23C86.4703 130.08 86.2403 130.16 85.9203 128.74C85.6203 127.32 82.5103 103.99 83.4303 97.76C84.3503 91.54 98.1903 89.58 98.1903 89.58C98.1903 89.58 99.4503 91.6 100.84 93.27C102.22 94.94 107.53 98.06 107.99 98.06C108.45 98.06 109.37 97.3 110.24 94.78C111.11 92.23 109.43 90.68 109.43 90.68C109.43 90.68 111.04 90.68 113.58 91.37C116.12 92.06 121.6 94.37 122.64 96.73C123.67 99.09 132.61 124.75 132.72 125.84"
                            fill="#6776E8" />
                        <path
                            d="M121.85 120.64C121.65 122.12 121.28 124.81 120.94 128.03C120.8 129.35 120.74 130.83 120.73 132.31L121.85 120.64Z"
                            fill="#7972D3" />
                        <path
                            d="M94.9805 106.94C94.9805 106.94 96.8205 125.55 96.8205 127C96.8205 128.21 96.1905 128.31 95.9705 128.31C95.9205 128.31 95.8905 128.31 95.8905 128.31C95.9005 128.46 96.4405 133.77 97.2005 134.07C97.9705 134.38 117.95 140.91 118.88 140.91C119.27 140.91 120.03 140.79 120.93 140.74C120.92 140.31 120.89 139.75 120.86 139.09C117.13 138.34 111.9 137.18 107.97 135.87C101.14 133.6 96.9005 131.37 97.4405 129.52C97.8205 128.23 103.34 127.77 108.27 127.77C110.37 127.77 112.37 127.85 113.82 127.99C118.66 128.45 120.74 132.29 120.74 132.29C120.74 130.8 120.81 129.33 120.95 128.01C121.29 124.79 121.66 122.1 121.86 120.62L122.43 114.69C122.43 114.69 120.27 118.15 117.27 119.15C115.95 119.59 113.15 119.87 110.12 119.87C106.28 119.87 102.07 119.43 100.06 118.31C96.4405 116.31 94.9905 106.93 94.9905 106.93"
                            fill="#5350CD" />
                        <path
                            d="M87.3697 130.42C87.3797 130.75 87.4997 133.6 87.4997 135.96C87.4997 136.81 87.4897 137.61 87.4497 138.19C87.3697 139.31 87.2197 140.22 87.2197 140.91C87.2197 141.63 87.3897 142.11 88.0197 142.31C88.9897 142.61 97.9697 142.83 105.2 143C101.75 142.4 98.1097 141.77 95.7497 141.07C90.5197 139.53 89.3697 138.59 88.7597 136.99C88.1697 135.46 87.4497 130.84 87.3797 130.42"
                            fill="#5350CD" />
                        <path
                            d="M87.3701 130.39C87.3701 130.39 89.4501 130.24 91.6701 129.85C93.9001 129.47 95.9001 128.31 95.9001 128.31C95.9001 128.31 96.4401 133.77 97.2101 134.07C97.9801 134.38 117.96 140.91 118.89 140.91C119.82 140.91 122.81 140.22 124.73 141.52C126.65 142.83 130.01 146.42 130.01 146.42C130.01 146.42 130.22 149.39 128.74 149.39C127.26 149.39 127.03 146.05 123.34 146.74C121.88 147.01 120.32 147.65 118.81 147.32C117.32 147 115.58 145.99 114.34 145.12C112.5 143.81 100.97 142.58 95.7401 141.05C90.5101 139.51 89.3601 138.57 88.7501 136.97C88.1401 135.37 87.3701 130.37 87.3701 130.37"
                            fill="#FFBF9F" />
                        <path
                            d="M119.28 104.13L122.42 114.71L121.98 119.78C122.02 119.55 122.04 119.43 122.04 119.43C122.04 119.43 124.4 127.73 125.09 128.03C125.15 128.06 125.26 128.07 125.42 128.07C126.4 128.07 129.05 127.59 130.87 126.98C130.23 126.88 129.34 126.74 128.2 126.55C125.56 126.11 124.05 119.79 124.05 116.72C124.05 113.65 119.58 104.7 119.29 104.14"
                            fill="#5350CD" />
                        <path
                            d="M96.9499 94.49C96.1199 94.49 95.6399 95.07 95.8199 96.64C95.8199 96.64 99.1999 109.25 107.43 110.32C107.77 110.36 108.09 110.39 108.41 110.39C115.74 110.39 116.63 98.78 115.97 96.64C115.64 95.59 115.25 95.14 114.72 95.14C114.13 95.14 113.37 95.71 112.36 96.64C110.91 97.97 108.8 99.35 106.76 99.35C106.1 99.35 105.44 99.2 104.82 98.87C103.02 97.89 98.9599 94.49 96.9499 94.49Z"
                            fill="#678EE7" />
                        <path
                            d="M186.97 190.95C187.28 191.27 189.74 193.91 190.17 195.53C188.41 193.29 187.14 191.26 186.97 190.95Z"
                            fill="white" />
                        <path
                            d="M109.76 85.19C109.76 85.19 106.7 83.69 105.44 82.94C104.17 82.19 103.94 82.13 103.94 82.13C103.94 82.13 107 89.63 107.63 88.94C108.26 88.25 109.76 85.19 109.76 85.19Z"
                            fill="#FF9B80" />
                        <path
                            d="M173.33 123.8L168.86 149.45L168.68 150.49C168.61 150.93 168.22 151.25 167.78 151.25H112.36C111.85 151.25 111.44 150.84 111.44 150.34C111.44 149.82 111.86 149.41 112.36 149.41H128.75C129.2 149.41 129.59 149.09 129.66 148.64L133.74 123.51C133.8 123.06 134.19 122.73 134.64 122.73H172.42C172.99 122.73 173.43 123.25 173.33 123.81"
                            fill="#696B84" />
                        <path
                            d="M153.55 135.88C153.55 137.17 152.98 138.22 152.28 138.22C151.58 138.22 151.01 137.17 151.01 135.88C151.01 134.59 151.58 133.54 152.28 133.54C152.98 133.54 153.55 134.59 153.55 135.88Z"
                            fill="#8186AA" />
                        <path
                            d="M135.77 122.72H134.64C134.19 122.72 133.8 123.04 133.74 123.5L133.13 127.24L132.98 128.16L130.02 146.44L129.66 148.63C129.59 149.08 129.2 149.4 128.75 149.4H112.36C111.85 149.4 111.44 149.82 111.44 150.32C111.44 150.84 111.86 151.24 112.36 151.24H167.78C168.22 151.24 168.61 150.93 168.68 150.48L168.86 149.44H133.51C132.38 149.44 131.51 148.42 131.69 147.29L135.77 122.71"
                            fill="#535777" />
                        <path
                            d="M228.3 175.35H293.02C293.53 175.35 293.94 175.76 293.94 176.27V181.83C293.94 182.34 293.53 182.75 293.02 182.75H228.3C227.79 182.75 227.38 182.34 227.38 181.83V176.27C227.38 175.76 227.79 175.35 228.3 175.35Z"
                            fill="#FF8A57" />
                        <path
                            d="M293.94 179.81V181.83C293.94 182.35 293.52 182.75 293.02 182.75H228.3C227.79 182.75 227.38 182.34 227.38 181.83V176.27C227.38 175.76 227.8 175.35 228.3 175.35H231.69V177.97C231.69 178.98 232.52 179.81 233.53 179.81H293.95H293.94Z"
                            fill="#E25247" />
                        <path
                            d="M237.52 182.76L230.51 209.8C230.32 210.54 229.76 211.09 229.08 211.3C228.73 211.41 228.35 211.43 227.97 211.35C226.97 211.13 226.29 210.23 226.29 209.26C226.29 209.09 226.31 208.93 226.35 208.75L232.04 185.66L232.75 182.76H237.51H237.52Z"
                            fill="#E25247" />
                        <path
                            d="M237.52 182.76L230.51 209.8C230.32 210.54 229.76 211.09 229.08 211.3C232.12 201.69 234.45 185.66 234.45 185.66H232.05L232.76 182.76H237.52Z"
                            fill="#B2322B" />
                        <path
                            d="M282.72 182.76L289.73 209.8C289.92 210.54 290.48 211.09 291.16 211.3C291.51 211.41 291.89 211.43 292.27 211.35C293.27 211.13 293.95 210.23 293.95 209.26C293.95 209.09 293.93 208.93 293.89 208.75L288.2 185.66L287.49 182.76H282.73H282.72Z"
                            fill="#E25247" />
                        <path
                            d="M282.72 182.76L289.73 209.8C289.92 210.54 290.48 211.09 291.16 211.3C288.12 201.69 285.79 185.66 285.79 185.66H288.19L287.48 182.76H282.72Z"
                            fill="#B2322B" />
                        <path
                            d="M253.36 170.05C253.36 170.05 249.82 169.67 249.67 167.36C249.52 165.05 248.36 165.52 247.06 165.59C245.75 165.67 244.91 164.74 245.14 163.36C245.37 161.98 243.3 160.75 244.52 160.13C245.75 159.51 246.67 159.59 247.29 160.67C247.91 161.75 249.26 162.13 250.85 161.48C252.44 160.83 253.36 161.13 252.9 162.9C252.44 164.67 254.98 162.27 255.74 165.44C256.5 168.6 253.36 170.05 253.36 170.05Z"
                            fill="#1D5B45" />
                        <path
                            d="M258.74 169.43C258.74 169.43 255.68 165.98 256.66 164.13C257.65 162.27 259.36 163.67 259.82 161.59C260.28 159.51 260.81 158.75 262.66 159.13C264.5 159.51 263.35 156.29 265.81 156.82C268.27 157.36 267.42 159.36 265.81 160.51C264.2 161.66 267.58 163.28 265.12 164.35C262.66 165.43 261.01 164.5 261.91 166.04C262.81 167.58 261.43 169.19 260.28 169.42C259.13 169.65 258.74 169.42 258.74 169.42V169.43Z"
                            fill="#2C8443" />
                        <path
                            d="M254.97 168.67C254.97 168.67 252.05 167.82 252.97 165.29C253.89 162.75 250.05 162.75 250.97 160.75C251.89 158.75 251.12 158.06 250.28 157.45C249.43 156.83 250.74 155.22 252.62 155.99C254.5 156.76 252.89 159.76 255.27 160.14C257.65 160.52 257.96 161.91 257.42 163.14C256.88 164.37 259.96 164.68 259.8 166.75C259.65 168.83 254.96 168.67 254.96 168.67H254.97Z"
                            fill="#6EAF45" />
                        <path
                            d="M264.42 171.5C264.42 171.92 264.36 172.29 264.25 172.66C263.76 174.22 262.3 175.34 260.59 175.34H251.82C249.7 175.34 247.98 173.62 247.98 171.5C247.98 169.88 248.97 168.5 250.38 167.93C250.82 167.75 251.31 167.65 251.82 167.65H260.59C262.71 167.65 264.43 169.37 264.43 171.49L264.42 171.5Z"
                            fill="#C3C9E0" />
                        <path
                            d="M264.25 172.67C263.76 174.23 262.3 175.35 260.59 175.35H251.82C249.7 175.35 247.98 173.63 247.98 171.51C247.98 169.89 248.97 168.51 250.38 167.94C250.56 168.35 250.67 168.82 250.67 169.31C250.67 171.16 252.17 172.67 254.03 172.67H264.26H264.25Z"
                            fill="#9EA9CC" />
                        <path
                            d="M289.53 102.1H220.2C218.162 102.1 216.51 103.752 216.51 105.79V138.69C216.51 140.728 218.162 142.38 220.2 142.38H289.53C291.568 142.38 293.22 140.728 293.22 138.69V105.79C293.22 103.752 291.568 102.1 289.53 102.1Z"
                            fill="#E1E6F4" />
                        <path
                            d="M293.21 105.79V108.71H216.5V105.79C216.5 105.05 216.71 104.37 217.08 103.8C217.74 102.78 218.89 102.1 220.19 102.1H289.52C290.82 102.1 291.97 102.77 292.63 103.8C293 104.37 293.21 105.05 293.21 105.79Z"
                            fill="#6776E8" />
                        <path
                            d="M268.92 117.86H241.1C240.547 117.86 240.1 118.308 240.1 118.86V120.63C240.1 121.182 240.547 121.63 241.1 121.63H268.92C269.472 121.63 269.92 121.182 269.92 120.63V118.86C269.92 118.308 269.472 117.86 268.92 117.86Z"
                            fill="#C3C9E0" />
                        <path
                            d="M239.1 124.85H232.57C232.018 124.85 231.57 125.298 231.57 125.85V134.53C231.57 135.082 232.018 135.53 232.57 135.53H239.1C239.653 135.53 240.1 135.082 240.1 134.53V125.85C240.1 125.298 239.653 124.85 239.1 124.85Z"
                            fill="#8697BF" />
                        <path
                            d="M252.17 124.85H245.64C245.087 124.85 244.64 125.298 244.64 125.85V134.53C244.64 135.082 245.087 135.53 245.64 135.53H252.17C252.722 135.53 253.17 135.082 253.17 134.53V125.85C253.17 125.298 252.722 124.85 252.17 124.85Z"
                            fill="#8697BF" />
                        <path
                            d="M265.23 124.85H258.7C258.148 124.85 257.7 125.298 257.7 125.85V134.53C257.7 135.082 258.148 135.53 258.7 135.53H265.23C265.782 135.53 266.23 135.082 266.23 134.53V125.85C266.23 125.298 265.782 124.85 265.23 124.85Z"
                            fill="#8697BF" />
                        <path
                            d="M278.3 124.85H271.77C271.217 124.85 270.77 125.298 270.77 125.85V134.53C270.77 135.082 271.217 135.53 271.77 135.53H278.3C278.852 135.53 279.3 135.082 279.3 134.53V125.85C279.3 125.298 278.852 124.85 278.3 124.85Z"
                            fill="#8697BF" />
                        <path
                            d="M222.11 138.53H293.21V138.69C293.21 140.73 291.56 142.38 289.52 142.38H220.19C218.15 142.38 216.5 140.73 216.5 138.69V108.96C216.69 108.8 216.94 108.71 217.21 108.71H292.05C292.69 108.71 293.2 109.23 293.2 109.86C293.2 110.49 292.68 111.01 292.05 111.01H222.11C221.47 111.01 220.96 111.53 220.96 112.16V137.37C220.96 138.01 221.48 138.52 222.11 138.52V138.53Z"
                            fill="#C3C9E0" />
                        <path
                            d="M292.63 103.79H217.09C217.75 102.77 218.9 102.09 220.2 102.09H289.53C290.83 102.09 291.98 102.76 292.64 103.79H292.63Z"
                            fill="#67AFE5" />
                    </g>
                    <defs>
                        <clippath id="clip0_306_45">
                            <rect width="322.03" height="220.93"
                                fill="white" />
                        </clippath>
                    </defs>
                </svg>



            </div>
            <div class="col-md-1"></div>

            <div class="col-md-5 py-5">
                <h1 class="h3 font-weight-normal">Login</h1>
                <br />

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:HiddenField ID="hfOTP" runat="server" />
                            <div class="form-group">
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="fa-solid fa-phone"></i>
                                        </div>
                                    </div>
                                    <asp:TextBox ID="txtUserName" runat="server" class="form-control"
                                        placeholder="Mobile/Email"></asp:TextBox>
                                </div>
                                <asp:LinkButton ID="lnkGetOTP" runat="server" CssClass="btn btn-primary" OnClientClick="js-startTimer()" OnClick="lnkGetOTP_Click">Get OTP</asp:LinkButton>
                                
                            </div>

                            <div class="form-group" runat="server" id="votp">
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="fa-solid fa-number"></i>
                                        </div>
                                    </div>
                                    <asp:TextBox ID="txtOTP" runat="server" class="form-control"
                                        placeholder="Enter OTP"></asp:TextBox>
                                </div>
                            </div>
                            <asp:Panel ID="pnlResend" runat="server">
                                <p>Resend OTP in <span class="js-timeout">2:00</span></p>
                            </asp:Panel>
                            <div id="pnlResendOTP" style="display: none;">
                                    <asp:LinkButton ID="lnkResend" runat="server" CssClass="btn btn-primary" OnClick="lnkResend_Click">Resend OTP</asp:LinkButton>
                                </div>
                            <span id="timerLabel" runat="server"></span>
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input"
                                    id="exampleCheck1" />
                                <label class="form-check-label"
                                    for="exampleCheck1">
                                    <small>Remember me
                                    </small><small>&nbsp;|&nbsp; <a href="<%=ResolveUrl("~")%>Signup">I don't have a account</a></small></label>
                            </div>
                            <br />
                            <asp:LinkButton ID="lnkSubmit" runat="server" class="btn btn1" OnClick="lnkSubmit_Click">Submit</asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <script src="assets/js/validation.js"></script>
                    <script src="assets/js/app.js"></script>


                    <script>
                        var input = document.getElementById("txtUserName");
                        var input = document.getElementById("txtPassword");
                        input.addEventListener("keypress", function (event) {
                            if (event.key === "Enter") {
                                event.preventDefault();
                                document.getElementById("lnkSubmit").click();
                            }
                        });
                    </script>

                    <script type="text/javascript">

                        function resendotp() {
                            timer(120);
                        }

                    </script>
                    <script>
                        var interval;

                        function countdown() {
                            // clearInterval(interval);
                            interval = setInterval(function () {
                                var timer = $('.js-timeout').html();
                                timer = timer.split(':');
                                var minutes = timer[0];
                                var seconds = timer[1];
                                seconds -= 1;
                                if (minutes < 0) return;
                                else if (seconds < 0 && minutes != 0) {
                                    minutes -= 1;
                                    seconds = 59;
                                }
                                else if (seconds < 10 && length.seconds != 2) seconds = '0' + seconds;

                                $('.js-timeout').html(minutes + ':' + seconds);

                                if (minutes == 0 && seconds == 0) {
                                   
                                    document.getElementById("<%=pnlResend.ClientID %>").style.visibility = "hidden";
                                    $('#pnlResendOTP').show();
                                }
                                /*   clearInterval(interval);*/
                            }, 1000);
                        }

                        function lnkresendotp() {
                            $('.js-timeout').text("2:00");
                            countdown();

                        };

                    </script>
               
            </div>

            <div class="col-md-1"></div>

        </div>

    </div>
</section>
    </asp:Panel>

                            <asp:Panel ID="pnllogindata2" runat="server">
        <section class="signup-page">
    <div class="container">
        <div class="row border">
            <div class="col-md-6">
<%--                <a href="<%=ResolveUrl("~")%>Index" class="text-dark btn box"><i class="fa-solid fa-house"></i>Go Back to Home</a><br />--%>
                <br />
                <svg xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 323 221" fill="none">
                    <g clip-path="url(#clip0_306_45)">
                        <path
                            d="M227.97 0C201.01 0 162.77 6.83 121.85 20.08C48.3799 43.87 -5.9501 79.35 0.5199 99.33C3.3899 108.18 17.6999 112.5 39.1499 112.5C43.5699 112.5 48.2999 112.32 53.2799 111.95C53.6599 111.46 54.0599 110.94 54.4599 110.39C59.7099 103.32 64.0899 100.48 68.0799 100.24C68.2699 100.23 68.4699 100.22 68.6599 100.22C70.9299 100.22 73.0799 101.06 75.2099 102.43C77.0799 103.64 79.9199 105.77 82.9499 108.15C83.1499 108.12 83.3499 108.08 83.5499 108.04C83.2299 103.69 83.0899 99.79 83.3999 97.74C83.5099 96.99 83.8099 96.31 84.2399 95.68C83.8799 93 88.1099 93.76 85.8099 91.17C83.0399 88.06 86.8499 85.06 88.9199 82.64C90.9999 80.22 89.3199 77.8 89.6699 71.92C90.0199 66.04 94.6299 57.39 102.93 54.16C104.4 53.59 105.85 53.35 107.24 53.35C113.7 53.35 118.89 58.42 118.89 58.42C118.89 58.42 124.83 59.8 125.35 65.11C125.87 70.41 122.12 77.68 120.97 81.08C119.82 84.48 122.01 84.14 121.7 86.5C121.39 88.86 119.7 88.81 121.32 91.98C121.92 93.16 121.74 94.23 121.28 95.12C121.89 95.63 122.36 96.17 122.6 96.71C122.74 97.04 123.04 97.83 123.45 98.94C130.24 97.07 137.16 95.01 144.15 92.76V21.08V21.06C144.15 21.06 144.15 21.05 144.15 21.04V21.03C144.15 21.03 144.15 21 144.15 20.99C144.15 20.99 144.15 20.98 144.15 20.97C144.15 20.97 144.15 20.96 144.15 20.95C144.18 19.6 144.62 18.35 145.36 17.33C146.27 16.06 147.64 15.14 149.22 14.79C149.22 14.79 149.22 14.79 149.23 14.79C149.63 14.7 150.04 14.65 150.46 14.64C150.46 14.64 150.47 14.64 150.48 14.64C150.48 14.64 150.49 14.64 150.5 14.64C150.5 14.64 150.51 14.64 150.52 14.64C150.52 14.64 150.53 14.64 150.54 14.64C150.54 14.64 150.54 14.64 150.55 14.64H150.56H266.91C266.82 14.15 266.7 13.66 266.55 13.18C263.74 4.32 249.42 0 227.97 0Z"
                            fill="#F2F6FB" />
                        <path
                            d="M132.61 130.43L131.63 136.47C131.63 136.47 129.26 136.15 128.49 135.88C128.22 135.79 127.8 134.8 127.35 133.57C125.07 134.98 122.89 136.39 120.81 137.8C120.83 138.27 120.84 138.7 120.86 139.11C120.89 139.77 120.92 140.33 120.93 140.76C121.12 140.76 121.32 140.74 121.52 140.74C122.6 140.74 123.79 140.9 124.72 141.54C125.46 142.05 126.42 142.9 127.32 143.75L130.33 144.43L132.6 130.44M284.93 86.12C284.44 86.12 283.94 86.12 283.44 86.12V100.49C283.44 104.06 280.55 106.95 276.98 106.95H184.07C170.6 111.83 158.1 117.18 146.97 122.73H172.4C172.97 122.73 173.41 123.25 173.31 123.81L168.84 149.46L168.66 150.5C168.59 150.94 168.2 151.26 167.76 151.26H158.36L161 152.76L173.33 171.55C173.33 171.55 177.89 173.15 182.89 175.12C184.8 175.87 186.77 176.66 188.59 177.45C198.39 175.13 208.57 172.28 218.95 168.92C281.54 148.65 327.46 117.33 321.52 98.95C318.74 90.35 305.09 86.11 284.94 86.11"
                            fill="#F2F6FB" />
                        <path
                            d="M303.24 49.96C298.07 49.96 292.1 50.91 285.97 52.9C285.12 53.18 284.28 53.47 283.46 53.77V82.39C287.04 81.94 290.84 81.1 294.7 79.85C310.68 74.68 321.68 64.45 319.27 57.01C317.79 52.42 311.55 49.97 303.25 49.97"
                            fill="#F2F6FB" />
                        <path
                            d="M272.69 156.58C264.02 156.58 252.48 158.57 240.28 162.52C216.44 170.24 199.07 182.53 201.48 189.97C202.66 193.6 208.32 195.41 216.59 195.41C225.26 195.41 236.8 193.42 249 189.47C272.84 181.75 290.21 169.46 287.8 162.02C286.62 158.39 280.96 156.58 272.69 156.58Z"
                            fill="#F2F6FB" />
                        <path
                            d="M283.45 21.08V100.48C283.45 104.05 280.56 106.94 276.99 106.94H150.62C147.05 106.94 144.16 104.05 144.16 100.48V21.08C144.16 17.51 147.05 14.62 150.62 14.62H276.99C280.56 14.62 283.45 17.51 283.45 21.08Z"
                            fill="#E1E6F4" />
                        <path
                            d="M283.45 21.08V27.54H144.17V21.08C144.17 18.24 146 15.83 148.55 14.96C149.2 14.74 149.9 14.62 150.63 14.62H277C280.57 14.62 283.46 17.51 283.46 21.08"
                            fill="#6776E8" />
                        <path
                            d="M149.25 32.38V102.18C149.25 103.07 149.97 103.79 150.86 103.79H212.2C213.09 103.79 213.81 103.07 213.81 102.18V101.7C213.81 100.81 214.53 100.09 215.42 100.09H283.45V100.49C283.45 104.06 280.56 106.95 276.99 106.95H150.62C147.05 106.95 144.16 104.06 144.16 100.49V28.19C144.46 27.79 144.93 27.54 145.45 27.54H283.44V30.77H150.85C149.96 30.77 149.24 31.49 149.24 32.38"
                            fill="#C3C9E0" />
                        <mask id="mask0_306_45"
                            style="mask-type: luminance"
                            maskUnits="userSpaceOnUse" x="144" y="14"
                            width="140" height="14">
                            <path
                                d="M148.55 14.97C145.99 15.84 144.17 18.24 144.17 21.09V27.55H283.45V24.09H150.4C149.39 24.09 148.56 23.26 148.56 22.25V14.98"
                                fill="white" />
                        </mask>
                        <g mask="url(#mask0_306_45)">
                            <path
                                d="M283.45 14.97H144.17V27.54H283.45V14.97Z"
                                fill="#5350CD" />
                        </g>
                        <path
                            d="M240.85 16.81H170.19C169.46 16.81 168.86 17.4 168.86 18.14C168.86 18.88 169.45 19.47 170.19 19.47H240.85C241.58 19.47 242.18 18.88 242.18 18.14C242.18 17.4 241.59 16.81 240.85 16.81Z"
                            fill="#67A2E6" />
                        <path
                            d="M268.49 16.47H248.24C247.45 16.47 246.8 17.11 246.8 17.91V18.03C246.8 18.83 247.44 19.47 248.24 19.47H268.49C269.28 19.47 269.93 18.83 269.93 18.03V17.91C269.93 17.11 269.28 16.47 268.49 16.47Z"
                            fill="#67A2E6" />
                        <path
                            d="M218.34 49.14H205.97C204.865 49.14 203.97 50.0354 203.97 51.14V61.36C203.97 62.4646 204.865 63.36 205.97 63.36H218.34C219.444 63.36 220.34 62.4646 220.34 61.36V51.14C220.34 50.0354 219.444 49.14 218.34 49.14Z"
                            fill="#4167AA" />
                        <path
                            d="M213.04 56.67L214.07 59.52H210.25L211.25 56.65C210.65 56.33 210.25 55.69 210.25 54.97C210.25 53.91 211.1 53.06 212.16 53.06C213.22 53.06 214.07 53.91 214.07 54.97C214.07 55.71 213.65 56.34 213.04 56.67Z"
                            fill="#343D5B" />
                        <path
                            d="M218.48 49.14H215.71V45.93C215.71 43.93 214.08 42.3 212.08 42.3C210.08 42.3 208.45 43.93 208.45 45.93V47.54H205.68V45.93C205.68 42.4 208.55 39.53 212.08 39.53C215.61 39.53 218.48 42.4 218.48 45.93V49.14Z"
                            fill="#8697BF" />
                        <path
                            d="M243.25 72.58H180.07C178.966 72.58 178.07 73.4754 178.07 74.58V80.57C178.07 81.6746 178.966 82.57 180.07 82.57H243.25C244.355 82.57 245.25 81.6746 245.25 80.57V74.58C245.25 73.4754 244.355 72.58 243.25 72.58Z"
                            fill="white" />
                        <path
                            d="M243.25 87.19H180.07C178.966 87.19 178.07 88.0854 178.07 89.19V95.18C178.07 96.2846 178.966 97.18 180.07 97.18H243.25C244.355 97.18 245.25 96.2846 245.25 95.18V89.19C245.25 88.0854 244.355 87.19 243.25 87.19Z"
                            fill="white" />
                        <path
                            d="M236.99 78.96H186.49C185.79 78.96 185.22 78.39 185.22 77.69C185.22 76.99 185.79 76.42 186.49 76.42H236.99C237.69 76.42 238.26 76.99 238.26 77.69C238.26 78.39 237.69 78.96 236.99 78.96Z"
                            fill="#C3C9E0" />
                        <path
                            d="M196.1 92.55C196.1 93.26 195.52 93.84 194.81 93.84C194.1 93.84 193.52 93.26 193.52 92.55C193.52 91.84 194.1 91.26 194.81 91.26C195.52 91.26 196.1 91.84 196.1 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M200.94 92.55C200.94 93.26 200.36 93.84 199.65 93.84C198.94 93.84 198.36 93.26 198.36 92.55C198.36 91.84 198.94 91.26 199.65 91.26C200.36 91.26 200.94 91.84 200.94 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M205.78 92.55C205.78 93.26 205.2 93.84 204.49 93.84C203.78 93.84 203.2 93.26 203.2 92.55C203.2 91.84 203.78 91.26 204.49 91.26C205.2 91.26 205.78 91.84 205.78 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M210.62 92.55C210.62 93.26 210.04 93.84 209.33 93.84C208.62 93.84 208.04 93.26 208.04 92.55C208.04 91.84 208.62 91.26 209.33 91.26C210.04 91.26 210.62 91.84 210.62 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M215.47 92.55C215.47 93.26 214.89 93.84 214.18 93.84C213.47 93.84 212.89 93.26 212.89 92.55C212.89 91.84 213.47 91.26 214.18 91.26C214.89 91.26 215.47 91.84 215.47 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M220.31 92.55C220.31 93.26 219.73 93.84 219.02 93.84C218.31 93.84 217.73 93.26 217.73 92.55C217.73 91.84 218.31 91.26 219.02 91.26C219.73 91.26 220.31 91.84 220.31 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M225.15 92.55C225.15 93.26 224.57 93.84 223.86 93.84C223.15 93.84 222.57 93.26 222.57 92.55C222.57 91.84 223.15 91.26 223.86 91.26C224.57 91.26 225.15 91.84 225.15 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M229.99 92.55C229.99 93.26 229.41 93.84 228.7 93.84C227.99 93.84 227.41 93.26 227.41 92.55C227.41 91.84 227.99 91.26 228.7 91.26C229.41 91.26 229.99 91.84 229.99 92.55Z"
                            fill="#C3C9E0" />
                        <path
                            d="M316 209.63C316 215.87 248.71 220.93 165.7 220.93C82.6904 220.93 15.4004 215.87 15.4004 209.63C15.4004 203.39 82.6904 198.33 165.7 198.33C248.71 198.33 316 203.39 316 209.63Z"
                            fill="#E1E6F4" />
                        <path
                            d="M209.93 210.82C209.93 214.79 170.43 218.01 121.71 218.01C72.9902 218.01 33.4902 214.79 33.4902 210.82C33.4902 206.85 72.9902 203.63 121.71 203.63C170.43 203.63 209.93 206.85 209.93 210.82Z"
                            fill="#9EA9CC" />
                        <path
                            d="M299.48 209.24C299.48 211.06 280.69 212.54 257.51 212.54C234.33 212.54 215.54 211.06 215.54 209.24C215.54 207.42 234.33 205.94 257.51 205.94C280.69 205.94 299.48 207.42 299.48 209.24Z"
                            fill="#9EA9CC" />
                        <path
                            d="M193.55 196.34C190.74 208.87 174.15 212.48 135.64 213.17C97.1295 213.86 56.3095 212.02 33.9495 202.34C11.5795 192.65 21.2695 156.67 32.3395 138.85C43.4095 121.04 45.9495 121.85 54.4795 110.39C59.7295 103.32 64.1095 100.48 68.0995 100.24C70.5895 100.08 72.9195 100.95 75.2295 102.44C81.2295 106.31 97.2895 119.78 97.2895 119.78C97.2895 119.78 147.63 167.28 168.86 173.05C180.19 176.13 187.26 178.99 190.97 182.89C194.2 186.29 194.86 190.5 193.55 196.34Z"
                            fill="#FFC655" />
                        <path
                            d="M94.8602 172.77C94.6802 172.77 94.5102 172.78 94.3602 172.81C93.3702 172.99 90.9102 173.32 88.0102 173.65C91.9802 174.6 96.1802 175.3 100.35 175.83C100.81 174.86 97.0702 172.77 94.8602 172.77ZM84.7802 120.36C80.7702 121.93 72.5402 127.77 66.1002 149.41C62.4502 161.66 70.8302 168.4 82.7502 172.21C84.3502 171.92 85.9202 171.68 87.2002 171.55C92.7302 170.97 85.1302 170.98 77.7502 166.14C70.3702 161.3 73.8302 151.26 73.8302 151.26C75.9102 160.59 78.6702 159.68 81.9002 161.58C82.3702 161.86 82.7202 161.99 82.9802 161.99C84.4702 161.99 82.8302 157.39 84.2302 149.42C84.7402 146.49 85.8802 143.48 87.2102 140.73C87.2302 140.07 87.3702 139.22 87.4402 138.2C87.4802 137.61 87.4902 136.82 87.4902 135.97C87.4902 133.61 87.3802 130.75 87.3602 130.43C87.3602 130.41 87.3602 130.4 87.3602 130.4C87.3602 130.4 87.3102 130.38 86.9002 130.24C86.4402 130.09 86.2102 130.17 85.8902 128.75C85.7802 128.23 85.3002 124.81 84.7702 120.37"
                            fill="#FFAA56" />
                        <path
                            d="M193.55 196.34C190.74 208.87 174.15 212.48 135.64 213.17C97.1295 213.86 56.3095 212.02 33.9495 202.34C11.5795 192.65 21.2695 156.67 32.3395 138.85C43.4095 121.04 45.9495 121.85 54.4795 110.39C59.7295 103.32 64.1095 100.48 68.0995 100.24C63.4395 103.41 55.4295 109.9 52.8595 118.39C49.1695 130.61 43.3295 137.9 34.1795 146.06C25.0295 154.22 24.2595 179.27 32.3395 189.41C40.4095 199.56 65.7795 204.86 98.2895 208.09C130.8 211.32 185.24 209.38 188.58 196.75C189.84 191.94 190.56 187.07 190.97 182.89C194.2 186.29 194.86 190.5 193.55 196.34Z"
                            fill="#FF8A57" />
                        <path
                            d="M73.8395 151.25C73.8395 151.25 70.3795 161.29 77.7595 166.13C85.1395 170.97 92.7395 170.96 87.2095 171.54C81.6795 172.12 70.8395 174.66 75.4495 174.66C80.0595 174.66 91.8695 173.28 94.3595 172.82C96.8495 172.36 102.66 175.82 99.4295 176.28C96.1995 176.74 94.8195 180.66 94.8195 180.66C94.8195 180.66 98.7895 176.13 107.3 178.28C115.81 180.43 114.44 178.79 119.27 182.38C124.1 185.97 127.1 187.35 123.87 184.01C120.64 180.67 117.89 178.36 119.27 179.51C119.86 180 123.88 179.99 129.1 179.97C136.07 179.95 145.16 179.93 151.01 181.12C161.23 183.21 171.84 193.21 171.84 193.21L161 178.58C161 178.58 91.1495 163.71 88.3595 156.76C85.5695 149.81 93.8895 129.92 93.8895 129.92C93.8895 129.92 85.8595 140.06 84.2295 149.4C82.5995 158.74 85.1295 163.46 81.8995 161.56C78.6695 159.67 75.8995 160.58 73.8295 151.24"
                            fill="#FF8A57" />
                        <path
                            d="M36.7099 158.52C36.7099 158.52 23.4799 178.8 50.5999 190.95C77.7199 203.1 96.5799 201.56 97.2399 200.64C97.8999 199.72 100.88 197.15 95.9199 193.21C90.9599 189.27 56.5599 183.42 51.9199 174.51C47.2899 165.59 45.2999 151.76 36.6999 158.52H36.7099Z"
                            fill="#FFE461" />
                        <path
                            d="M105.52 195.53C105.52 195.53 148.23 194.19 147.55 199.42C146.87 204.65 146.95 205.57 132.02 205.57C117.09 205.57 94.9297 199.95 105.52 195.53Z"
                            fill="#FFE461" />
                        <path
                            d="M118.92 58.44C118.92 58.44 111.25 50.95 102.95 54.17C94.6501 57.4 90.0401 66.05 89.6901 71.93C89.3401 77.81 91.0201 80.23 88.9401 82.65C86.8601 85.07 83.0601 88.07 85.8301 91.18C88.6001 94.29 81.9101 92.56 85.1401 97.81C88.3701 103.06 118.92 97.58 118.92 97.58C118.92 97.58 122.96 95.16 121.34 91.99C119.73 88.82 121.41 88.88 121.72 86.51C122.03 84.15 119.84 84.49 120.99 81.09C122.14 77.69 125.89 70.42 125.37 65.12C124.85 59.82 118.91 58.43 118.91 58.43"
                            fill="#252549" />
                        <path
                            d="M98.1704 89.57C98.1704 89.57 99.3204 89.63 99.2004 88.19C99.0804 86.75 98.4504 87.5 100.64 83.98C102.83 80.46 102.2 80.06 101.39 78.1C100.58 76.14 103.95 74.76 105.96 71.93C107.96 69.11 110.44 65.59 112.58 63.63C114.71 61.67 116.73 61.61 117.88 62.19C119.03 62.77 119.38 64.03 119.38 64.03C119.38 64.03 119.09 76.54 116.5 81.15C113.91 85.76 112 85.88 109.75 85.19C109.75 85.19 108.94 89.17 109.4 90.67C109.86 92.17 114.88 94.18 112 98.28C109.12 102.37 101.36 104.32 98.6304 99.78C95.9004 95.24 98.1704 89.58 98.1704 89.58"
                            fill="#FFBF9F" />
                        <path
                            d="M190.17 190.06C190.17 190.06 197.07 191.6 199.56 192.87C202.05 194.15 205.33 194.58 206.83 192.41C208.33 190.24 208.07 188.72 210.55 186.74C213.04 184.75 218.65 181.79 217.76 179.7C216.87 177.61 214.98 178.05 213.41 179.63C211.83 181.21 204.53 182.49 203.2 183.13C201.86 183.77 197.31 183.82 196.36 183.82C195.41 183.82 190.83 182.16 190.83 182.16L190.17 190.07"
                            fill="#FFBF9F" />
                        <path
                            d="M181.15 200.03C181.15 200.03 186.84 204.26 187.61 206.95C188.38 209.64 190.3 212.33 192.91 211.95C195.52 211.57 196.45 210.34 199.6 210.8C202.75 211.26 208.75 213.34 209.67 211.26C210.59 209.18 208.98 208.11 206.75 208.03C204.52 207.95 198.6 203.49 197.22 202.96C195.84 202.42 190.83 199.5 190.18 198.81C189.53 198.12 187.38 195.12 187.38 195.12L181.15 200.04V200.03Z"
                            fill="#FFBF9F" />
                        <path
                            d="M193.55 191.24C193.16 192.12 192.82 192.75 192.6 193C191.71 194.01 187.19 191.08 186.96 190.92L186.98 190.95C187.29 191.27 189.75 193.91 190.18 195.53C190.6 197.28 180.85 201.99 179 202.34C177.16 202.69 163.78 184 163.78 184C163.78 184 148.56 179.39 146.83 178.59C146 178.2 138.45 178.19 130.88 178.28C122.79 178.38 114.67 178.59 114.67 178.59C114.67 178.59 110.64 177.21 106.6 175.59C102.56 173.98 87.3897 169.48 87.3897 169.48C87.3897 169.48 84.4697 167.17 84.4697 157.95C84.4697 148.73 89.5397 139.77 89.5397 139.77L97.1797 140.32L119.3 141.92L156.99 150.45L161.03 152.76L173.36 171.55C173.36 171.55 177.92 173.15 182.92 175.12C188.81 177.43 195.35 180.23 195.85 181.48C196.55 183.24 194.84 188.44 193.57 191.25"
                            fill="#3B345B" />
                        <path
                            d="M163.09 183.79L163.77 184C163.73 183.99 163.49 183.92 163.09 183.79ZM151.01 180.03L151.21 180.09C151.16 180.07 151.1 180.06 151.05 180.04C151.02 180.04 151.01 180.03 151.01 180.03Z"
                            fill="#5D3C2E" />
                        <path
                            d="M115.23 158.52C115.23 158.52 131.72 163.25 141.06 165.09C150.4 166.93 153.51 170.86 154.32 176.04C154.87 179.59 153.12 180.15 151.96 180.15C151.52 180.15 151.17 180.07 151.05 180.04C151.1 180.06 151.16 180.07 151.21 180.09L163.09 183.78C163.49 183.9 163.73 183.97 163.77 183.99C163.48 183.61 150.16 166.46 149.25 165.55C148.33 164.63 115.24 158.52 115.24 158.52"
                            fill="#26242F" />
                        <path
                            d="M173.34 171.54L186.95 190.91C187.15 191.05 190.47 193.2 192 193.2C192.26 193.2 192.47 193.14 192.6 192.99C192.82 192.74 193.16 192.1 193.55 191.23C191.35 190.04 189.35 188.58 188.11 186.82C185.92 183.74 184.13 179.04 182.9 175.11C177.9 173.15 173.34 171.54 173.34 171.54Z"
                            fill="#26242F" />
                        <path
                            d="M88.2402 142.35C86.7402 145.67 84.4502 151.75 84.4502 157.95C84.4502 167.17 87.3702 169.48 87.3702 169.48C87.3702 169.48 102.54 173.97 106.58 175.59C110.62 177.2 114.65 178.59 114.65 178.59C114.65 178.59 122.77 178.38 130.86 178.28C118.01 176.59 100.82 170.29 95.7802 160.38C93.2402 155.38 94.4602 148.44 96.3002 142.78C92.4402 142.66 89.2202 142.52 88.2402 142.37"
                            fill="#26242F" />
                        <path
                            d="M125.66 128.05C125.66 128.05 127.73 135.61 128.5 135.88C129.27 136.15 131.64 136.47 131.64 136.47L133.14 127.24L132.12 125.85C132.12 125.85 124.63 124.5 125.67 128.05"
                            fill="#FFBF9F" />
                        <path
                            d="M132.7 125.83C132.74 126.2 131.95 126.61 130.87 126.97C128.77 127.67 125.55 128.21 125.1 128.02C124.41 127.73 122.05 119.42 122.05 119.42C122.05 119.42 122.03 119.54 121.99 119.77V119.79C121.95 119.99 121.91 120.28 121.86 120.63C121.66 122.11 121.29 124.8 120.95 128.02C120.81 129.34 120.75 130.82 120.74 132.3C120.71 134.79 120.81 137.3 120.88 139.1C120.94 140.23 120.97 141.07 120.95 141.45C120.89 142.78 117.61 143.29 110.57 143.12C103.54 142.95 89.2603 142.68 88.0303 142.3C86.8003 141.91 87.3003 140.49 87.4603 138.19C87.6203 135.88 87.3903 130.39 87.3903 130.39L86.9303 130.23C86.4703 130.08 86.2403 130.16 85.9203 128.74C85.6203 127.32 82.5103 103.99 83.4303 97.76C84.3503 91.54 98.1903 89.58 98.1903 89.58C98.1903 89.58 99.4503 91.6 100.84 93.27C102.22 94.94 107.53 98.06 107.99 98.06C108.45 98.06 109.37 97.3 110.24 94.78C111.11 92.23 109.43 90.68 109.43 90.68C109.43 90.68 111.04 90.68 113.58 91.37C116.12 92.06 121.6 94.37 122.64 96.73C123.67 99.09 132.61 124.75 132.72 125.84"
                            fill="#6776E8" />
                        <path
                            d="M121.85 120.64C121.65 122.12 121.28 124.81 120.94 128.03C120.8 129.35 120.74 130.83 120.73 132.31L121.85 120.64Z"
                            fill="#7972D3" />
                        <path
                            d="M94.9805 106.94C94.9805 106.94 96.8205 125.55 96.8205 127C96.8205 128.21 96.1905 128.31 95.9705 128.31C95.9205 128.31 95.8905 128.31 95.8905 128.31C95.9005 128.46 96.4405 133.77 97.2005 134.07C97.9705 134.38 117.95 140.91 118.88 140.91C119.27 140.91 120.03 140.79 120.93 140.74C120.92 140.31 120.89 139.75 120.86 139.09C117.13 138.34 111.9 137.18 107.97 135.87C101.14 133.6 96.9005 131.37 97.4405 129.52C97.8205 128.23 103.34 127.77 108.27 127.77C110.37 127.77 112.37 127.85 113.82 127.99C118.66 128.45 120.74 132.29 120.74 132.29C120.74 130.8 120.81 129.33 120.95 128.01C121.29 124.79 121.66 122.1 121.86 120.62L122.43 114.69C122.43 114.69 120.27 118.15 117.27 119.15C115.95 119.59 113.15 119.87 110.12 119.87C106.28 119.87 102.07 119.43 100.06 118.31C96.4405 116.31 94.9905 106.93 94.9905 106.93"
                            fill="#5350CD" />
                        <path
                            d="M87.3697 130.42C87.3797 130.75 87.4997 133.6 87.4997 135.96C87.4997 136.81 87.4897 137.61 87.4497 138.19C87.3697 139.31 87.2197 140.22 87.2197 140.91C87.2197 141.63 87.3897 142.11 88.0197 142.31C88.9897 142.61 97.9697 142.83 105.2 143C101.75 142.4 98.1097 141.77 95.7497 141.07C90.5197 139.53 89.3697 138.59 88.7597 136.99C88.1697 135.46 87.4497 130.84 87.3797 130.42"
                            fill="#5350CD" />
                        <path
                            d="M87.3701 130.39C87.3701 130.39 89.4501 130.24 91.6701 129.85C93.9001 129.47 95.9001 128.31 95.9001 128.31C95.9001 128.31 96.4401 133.77 97.2101 134.07C97.9801 134.38 117.96 140.91 118.89 140.91C119.82 140.91 122.81 140.22 124.73 141.52C126.65 142.83 130.01 146.42 130.01 146.42C130.01 146.42 130.22 149.39 128.74 149.39C127.26 149.39 127.03 146.05 123.34 146.74C121.88 147.01 120.32 147.65 118.81 147.32C117.32 147 115.58 145.99 114.34 145.12C112.5 143.81 100.97 142.58 95.7401 141.05C90.5101 139.51 89.3601 138.57 88.7501 136.97C88.1401 135.37 87.3701 130.37 87.3701 130.37"
                            fill="#FFBF9F" />
                        <path
                            d="M119.28 104.13L122.42 114.71L121.98 119.78C122.02 119.55 122.04 119.43 122.04 119.43C122.04 119.43 124.4 127.73 125.09 128.03C125.15 128.06 125.26 128.07 125.42 128.07C126.4 128.07 129.05 127.59 130.87 126.98C130.23 126.88 129.34 126.74 128.2 126.55C125.56 126.11 124.05 119.79 124.05 116.72C124.05 113.65 119.58 104.7 119.29 104.14"
                            fill="#5350CD" />
                        <path
                            d="M96.9499 94.49C96.1199 94.49 95.6399 95.07 95.8199 96.64C95.8199 96.64 99.1999 109.25 107.43 110.32C107.77 110.36 108.09 110.39 108.41 110.39C115.74 110.39 116.63 98.78 115.97 96.64C115.64 95.59 115.25 95.14 114.72 95.14C114.13 95.14 113.37 95.71 112.36 96.64C110.91 97.97 108.8 99.35 106.76 99.35C106.1 99.35 105.44 99.2 104.82 98.87C103.02 97.89 98.9599 94.49 96.9499 94.49Z"
                            fill="#678EE7" />
                        <path
                            d="M186.97 190.95C187.28 191.27 189.74 193.91 190.17 195.53C188.41 193.29 187.14 191.26 186.97 190.95Z"
                            fill="white" />
                        <path
                            d="M109.76 85.19C109.76 85.19 106.7 83.69 105.44 82.94C104.17 82.19 103.94 82.13 103.94 82.13C103.94 82.13 107 89.63 107.63 88.94C108.26 88.25 109.76 85.19 109.76 85.19Z"
                            fill="#FF9B80" />
                        <path
                            d="M173.33 123.8L168.86 149.45L168.68 150.49C168.61 150.93 168.22 151.25 167.78 151.25H112.36C111.85 151.25 111.44 150.84 111.44 150.34C111.44 149.82 111.86 149.41 112.36 149.41H128.75C129.2 149.41 129.59 149.09 129.66 148.64L133.74 123.51C133.8 123.06 134.19 122.73 134.64 122.73H172.42C172.99 122.73 173.43 123.25 173.33 123.81"
                            fill="#696B84" />
                        <path
                            d="M153.55 135.88C153.55 137.17 152.98 138.22 152.28 138.22C151.58 138.22 151.01 137.17 151.01 135.88C151.01 134.59 151.58 133.54 152.28 133.54C152.98 133.54 153.55 134.59 153.55 135.88Z"
                            fill="#8186AA" />
                        <path
                            d="M135.77 122.72H134.64C134.19 122.72 133.8 123.04 133.74 123.5L133.13 127.24L132.98 128.16L130.02 146.44L129.66 148.63C129.59 149.08 129.2 149.4 128.75 149.4H112.36C111.85 149.4 111.44 149.82 111.44 150.32C111.44 150.84 111.86 151.24 112.36 151.24H167.78C168.22 151.24 168.61 150.93 168.68 150.48L168.86 149.44H133.51C132.38 149.44 131.51 148.42 131.69 147.29L135.77 122.71"
                            fill="#535777" />
                        <path
                            d="M228.3 175.35H293.02C293.53 175.35 293.94 175.76 293.94 176.27V181.83C293.94 182.34 293.53 182.75 293.02 182.75H228.3C227.79 182.75 227.38 182.34 227.38 181.83V176.27C227.38 175.76 227.79 175.35 228.3 175.35Z"
                            fill="#FF8A57" />
                        <path
                            d="M293.94 179.81V181.83C293.94 182.35 293.52 182.75 293.02 182.75H228.3C227.79 182.75 227.38 182.34 227.38 181.83V176.27C227.38 175.76 227.8 175.35 228.3 175.35H231.69V177.97C231.69 178.98 232.52 179.81 233.53 179.81H293.95H293.94Z"
                            fill="#E25247" />
                        <path
                            d="M237.52 182.76L230.51 209.8C230.32 210.54 229.76 211.09 229.08 211.3C228.73 211.41 228.35 211.43 227.97 211.35C226.97 211.13 226.29 210.23 226.29 209.26C226.29 209.09 226.31 208.93 226.35 208.75L232.04 185.66L232.75 182.76H237.51H237.52Z"
                            fill="#E25247" />
                        <path
                            d="M237.52 182.76L230.51 209.8C230.32 210.54 229.76 211.09 229.08 211.3C232.12 201.69 234.45 185.66 234.45 185.66H232.05L232.76 182.76H237.52Z"
                            fill="#B2322B" />
                        <path
                            d="M282.72 182.76L289.73 209.8C289.92 210.54 290.48 211.09 291.16 211.3C291.51 211.41 291.89 211.43 292.27 211.35C293.27 211.13 293.95 210.23 293.95 209.26C293.95 209.09 293.93 208.93 293.89 208.75L288.2 185.66L287.49 182.76H282.73H282.72Z"
                            fill="#E25247" />
                        <path
                            d="M282.72 182.76L289.73 209.8C289.92 210.54 290.48 211.09 291.16 211.3C288.12 201.69 285.79 185.66 285.79 185.66H288.19L287.48 182.76H282.72Z"
                            fill="#B2322B" />
                        <path
                            d="M253.36 170.05C253.36 170.05 249.82 169.67 249.67 167.36C249.52 165.05 248.36 165.52 247.06 165.59C245.75 165.67 244.91 164.74 245.14 163.36C245.37 161.98 243.3 160.75 244.52 160.13C245.75 159.51 246.67 159.59 247.29 160.67C247.91 161.75 249.26 162.13 250.85 161.48C252.44 160.83 253.36 161.13 252.9 162.9C252.44 164.67 254.98 162.27 255.74 165.44C256.5 168.6 253.36 170.05 253.36 170.05Z"
                            fill="#1D5B45" />
                        <path
                            d="M258.74 169.43C258.74 169.43 255.68 165.98 256.66 164.13C257.65 162.27 259.36 163.67 259.82 161.59C260.28 159.51 260.81 158.75 262.66 159.13C264.5 159.51 263.35 156.29 265.81 156.82C268.27 157.36 267.42 159.36 265.81 160.51C264.2 161.66 267.58 163.28 265.12 164.35C262.66 165.43 261.01 164.5 261.91 166.04C262.81 167.58 261.43 169.19 260.28 169.42C259.13 169.65 258.74 169.42 258.74 169.42V169.43Z"
                            fill="#2C8443" />
                        <path
                            d="M254.97 168.67C254.97 168.67 252.05 167.82 252.97 165.29C253.89 162.75 250.05 162.75 250.97 160.75C251.89 158.75 251.12 158.06 250.28 157.45C249.43 156.83 250.74 155.22 252.62 155.99C254.5 156.76 252.89 159.76 255.27 160.14C257.65 160.52 257.96 161.91 257.42 163.14C256.88 164.37 259.96 164.68 259.8 166.75C259.65 168.83 254.96 168.67 254.96 168.67H254.97Z"
                            fill="#6EAF45" />
                        <path
                            d="M264.42 171.5C264.42 171.92 264.36 172.29 264.25 172.66C263.76 174.22 262.3 175.34 260.59 175.34H251.82C249.7 175.34 247.98 173.62 247.98 171.5C247.98 169.88 248.97 168.5 250.38 167.93C250.82 167.75 251.31 167.65 251.82 167.65H260.59C262.71 167.65 264.43 169.37 264.43 171.49L264.42 171.5Z"
                            fill="#C3C9E0" />
                        <path
                            d="M264.25 172.67C263.76 174.23 262.3 175.35 260.59 175.35H251.82C249.7 175.35 247.98 173.63 247.98 171.51C247.98 169.89 248.97 168.51 250.38 167.94C250.56 168.35 250.67 168.82 250.67 169.31C250.67 171.16 252.17 172.67 254.03 172.67H264.26H264.25Z"
                            fill="#9EA9CC" />
                        <path
                            d="M289.53 102.1H220.2C218.162 102.1 216.51 103.752 216.51 105.79V138.69C216.51 140.728 218.162 142.38 220.2 142.38H289.53C291.568 142.38 293.22 140.728 293.22 138.69V105.79C293.22 103.752 291.568 102.1 289.53 102.1Z"
                            fill="#E1E6F4" />
                        <path
                            d="M293.21 105.79V108.71H216.5V105.79C216.5 105.05 216.71 104.37 217.08 103.8C217.74 102.78 218.89 102.1 220.19 102.1H289.52C290.82 102.1 291.97 102.77 292.63 103.8C293 104.37 293.21 105.05 293.21 105.79Z"
                            fill="#6776E8" />
                        <path
                            d="M268.92 117.86H241.1C240.547 117.86 240.1 118.308 240.1 118.86V120.63C240.1 121.182 240.547 121.63 241.1 121.63H268.92C269.472 121.63 269.92 121.182 269.92 120.63V118.86C269.92 118.308 269.472 117.86 268.92 117.86Z"
                            fill="#C3C9E0" />
                        <path
                            d="M239.1 124.85H232.57C232.018 124.85 231.57 125.298 231.57 125.85V134.53C231.57 135.082 232.018 135.53 232.57 135.53H239.1C239.653 135.53 240.1 135.082 240.1 134.53V125.85C240.1 125.298 239.653 124.85 239.1 124.85Z"
                            fill="#8697BF" />
                        <path
                            d="M252.17 124.85H245.64C245.087 124.85 244.64 125.298 244.64 125.85V134.53C244.64 135.082 245.087 135.53 245.64 135.53H252.17C252.722 135.53 253.17 135.082 253.17 134.53V125.85C253.17 125.298 252.722 124.85 252.17 124.85Z"
                            fill="#8697BF" />
                        <path
                            d="M265.23 124.85H258.7C258.148 124.85 257.7 125.298 257.7 125.85V134.53C257.7 135.082 258.148 135.53 258.7 135.53H265.23C265.782 135.53 266.23 135.082 266.23 134.53V125.85C266.23 125.298 265.782 124.85 265.23 124.85Z"
                            fill="#8697BF" />
                        <path
                            d="M278.3 124.85H271.77C271.217 124.85 270.77 125.298 270.77 125.85V134.53C270.77 135.082 271.217 135.53 271.77 135.53H278.3C278.852 135.53 279.3 135.082 279.3 134.53V125.85C279.3 125.298 278.852 124.85 278.3 124.85Z"
                            fill="#8697BF" />
                        <path
                            d="M222.11 138.53H293.21V138.69C293.21 140.73 291.56 142.38 289.52 142.38H220.19C218.15 142.38 216.5 140.73 216.5 138.69V108.96C216.69 108.8 216.94 108.71 217.21 108.71H292.05C292.69 108.71 293.2 109.23 293.2 109.86C293.2 110.49 292.68 111.01 292.05 111.01H222.11C221.47 111.01 220.96 111.53 220.96 112.16V137.37C220.96 138.01 221.48 138.52 222.11 138.52V138.53Z"
                            fill="#C3C9E0" />
                        <path
                            d="M292.63 103.79H217.09C217.75 102.77 218.9 102.09 220.2 102.09H289.53C290.83 102.09 291.98 102.76 292.64 103.79H292.63Z"
                            fill="#67AFE5" />
                    </g>
                    <defs>
                        <clippath id="clip0_306_45">
                            <rect width="322.03" height="220.93"
                                fill="white" />
                        </clippath>
                    </defs>
                </svg>



            </div>
            <div class="col-md-1"></div>

            <div class="col-md-5 py-5">
                <h1 class="h3 font-weight-normal">Login</h1>
                <br />

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:HiddenField ID="hfOTP1" runat="server" />
                            <div class="form-group">
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="fa-solid fa-phone"></i>
                                        </div>
                                    </div>
                                    <asp:TextBox ID="txtUserName1" runat="server" class="form-control"
                                        placeholder="Mobile/Email"></asp:TextBox>
                                </div>
                                <asp:LinkButton ID="lnkGetOtp2" runat="server" CssClass="btn btn-primary" OnClientClick="js-startTimer()" OnClick="lnkGetOtp2_Click">Get OTP</asp:LinkButton>
                                
                            </div>

                            <div class="form-group" runat="server" id="votp1">
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="fa-solid fa-number"></i>
                                        </div>
                                    </div>
                                    <asp:TextBox ID="txtOTP1" runat="server" class="form-control"
                                        placeholder="Enter OTP"></asp:TextBox>
                                </div>
                            </div>
                            <asp:Panel ID="pnlResend1" runat="server">
                                <p>Resend OTP in <span class="js-timeout">2:00</span></p>
                            </asp:Panel>
                            <div id="pnlResendOTP1" style="display: none;">
                                    <asp:LinkButton ID="lnkResend2" runat="server" CssClass="btn btn-primary" OnClick="lnkResend2_Click">Resend OTP</asp:LinkButton>
                                </div>
                            <span id="timelabel1" runat="server"></span>
                            <div class="form-check">
                                <small> <a href="<%=ResolveUrl("~")%>Signup">I don't have a account</a></small></label>
                            </div>
                            <br />
                            <asp:LinkButton ID="lnkSubmit2" runat="server" class="btn btn1" OnClick="lnkSubmit2_Click">Submit</asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <script src="assets/js/validation.js"></script>
                    <script src="assets/js/app.js"></script>


                    <script>
                        var input = document.getElementById("txtUserName");
                        var input = document.getElementById("txtPassword");
                        input.addEventListener("keypress", function (event) {
                            if (event.key === "Enter") {
                                event.preventDefault();
                                document.getElementById("lnkSubmit2").click();
                            }
                        });
                    </script>

                    <script type="text/javascript">

                        function resendotp() {
                            timer(120);
                        }

                    </script>
                    <script>
                        var interval;

                        function countdowns() {
                            // clearInterval(interval);
                            interval = setInterval(function () {
                                var timer = $('.js-timeout').html();
                                timer = timer.split(':');
                                var minutes = timer[0];
                                var seconds = timer[1];
                                seconds -= 1;
                                if (minutes < 0) return;
                                else if (seconds < 0 && minutes != 0) {
                                    minutes -= 1;
                                    seconds = 59;
                                }
                                else if (seconds < 10 && length.seconds != 2) seconds = '0' + seconds;

                                $('.js-timeout').html(minutes + ':' + seconds);

                                if (minutes == 0 && seconds == 0) {
                                   
                                    document.getElementById("<%=pnlResend1.ClientID %>").style.visibility = "hidden";
                                    $('#pnlResendOTP1').show();
                                }
                                /*   clearInterval(interval);*/
                            }, 1000);
                        }

                        function lnkresendotp() {
                            $('.js-timeout').text("2:00");
                            countdowns();

                        };

                    </script>
               
            </div>

            <div class="col-md-1"></div>

        </div>

    </div>
</section>
    </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <%--  <link href="chosen/chosen.css" rel="stylesheet" />--%>
<%--    <script src="chosen/chosen.jquery.js"></script>--%>
<%--    <script src="chosen/chosen.jquery.min.js"></script>--%>

    <%--<script>
     
        $(document).ready(function () {
            $("#tabs").on("click", function (e) {
                //debugger
                //var ref_this = $("ul.tabs li a.active");

                var target = $(e.target).attr("data-tab");
                if (target != null)
                    alert(target);
                else
                    alert('There is no active element');

            });
        });
    </script>--%>
 
    <script>
        document.onkeydown = function (t) {
            if (t.which == 9) {
                return false;
            }
        }
    </script>
             <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">

      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
   
       <script>
            $(document).ready(function () {
                $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', minDate:0, changeYear: true, changeMonth: true,  yearRange: "+0:+50" });

                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function () {
                    $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', minDate: 0, changeYear: true, changeMonth: true, yearRange: "+0:+50" });
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
        <script type="text/javascript">
            $(document).ready(function () {
                $('#lnkInterestSheet').click(function () {
                    window.location.reload("MasterPage.master");
                });
            }); 
        </script>

            <script language="javascript" type="text/javascript">
                $(function () {
                    $("#lnkprint").click(function () {
                        $('#printarea').jqprint();
                       
                    });
                });
            </script>
    <script>
        function ClosePopup() {
            debugger;
            $('#investnow').modal('toggle');
            $('#investnow').modal('hide');
            $('.modal-backdrop').removeClass('modal-backdrop');
            $('.fade').removeClass('fade');
            $('.in').removeClass('in');



            //$('#investnow').modal('toggle');
           // $('#investnow').modal('hide');
        }
    </script>

</asp:Content>

