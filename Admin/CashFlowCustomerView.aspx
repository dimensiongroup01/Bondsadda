<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="CashFlowCustomerView.aspx.cs" Inherits="Admin_CashFlowCustomerView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <style>
        a#ContentPlaceHolder1_lnkAdd {
    margin-top: 25px;
}
        
        div#divGridViewScroll {
    text-wrap: wrap;
}
    
           </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
              <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>

                        <ContentTemplate>
                            <asp:HiddenField ID ="hfRM" runat="server" />
                            <asp:HiddenField ID ="hfTotalMonth" runat="server" />
                            <asp:HiddenField ID ="hfTotalYear" runat="server" />
                            <asp:HiddenField ID ="hfTotalDay" runat="server" />
                            <asp:HiddenField ID ="hfMonth" runat="server" />
                            <asp:HiddenField ID ="hfRemainingDay" runat="server" />
                            <asp:HiddenField ID ="hfYearly" runat="server" />
                            <asp:HiddenField ID ="hfQuerterly" runat="server" />
                            <asp:HiddenField ID ="hfHalfYearly" runat="server" />
                            <asp:HiddenField ID ="hfPaymentType" runat="server" />
                            <asp:HiddenField ID ="hfSattlementDate" runat="server" />
                            <asp:HiddenField ID ="hfLastIPDate" runat="server" />
                            <asp:HiddenField ID ="hfFirstIntDay" runat="server" />
                            <asp:HiddenField ID ="hfSecondIntDay" runat="server" />
                            <asp:HiddenField ID="hfDayValue" runat="server" />
                            <asp:HiddenField ID ="hfEOM" runat="server" />
                            <asp:HiddenField ID ="hfQuar" runat="server" />
                            <asp:HiddenField ID ="hfMaturityDate" runat="server" />
                            <asp:HiddenField ID ="hfIPDates" runat="server" />
                            <asp:HiddenField ID ="hfQuantity" runat="server" />
                            <asp:HiddenField ID ="hfPrincipalAmount" runat="server" />
                            <asp:HiddenField ID ="hfTotalAssuredInterest" runat="server" />
                            <asp:HiddenField ID ="hfGrossConsideration" runat="server" />
                            <asp:HiddenField ID ="hfFaceValueForDeal" runat="server" />
                            <asp:HiddenField ID ="hfTotalConsiderationAmount" runat="server" />
                            <asp:HiddenField ID ="hfCouponRate" runat="server" />
                            <asp:HiddenField ID ="hfFirstMonthly" runat="server" />
                            <asp:HiddenField ID ="hfFirstQuarterly" runat="server" />
                            <asp:HiddenField ID ="hfFirstHalf" runat="server" />
                            <asp:HiddenField ID ="hfFirstYearly" runat="server" />
                            <asp:HiddenField ID ="hfLastMonthly" runat="server" />
                            <asp:HiddenField ID ="hfLastYearly" runat="server" />
                            <asp:HiddenField ID ="hfLastHalfYear" runat="server" />
                            <asp:HiddenField ID ="hfLastQuarterly" runat="server" />
                            <asp:HiddenField ID ="hfLastDate" runat="server" />
                            <asp:HiddenField ID ="hfMInterest" runat="server" />
                            <asp:HiddenField ID ="hfIPDa" runat="server" />
                            <asp:HiddenField ID ="hfRMemail" runat="server" />
                           <asp:HiddenField ID ="hfProductName" runat="server" />
                            <asp:HiddenField ID ="hfGuaranteed" runat="server" />
                            <asp:HiddenField ID ="hfRate" runat="server" />
                            <asp:HiddenField ID="hfMaturityType" runat="server" />
                            <asp:HiddenField ID ="hfFaces" runat="server" />
                            <asp:HiddenField ID ="hfTotalPercent" runat="server" />

    <div class="main-content"> 
        <asp:HiddenField ID ="hfUserId" runat="server" />
            <div class="page-content">
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">VIEW CUSTOMER CASHFLOW SEARCH DETAILS</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">CUSTOMER CASHFLOW VIEW</a></li>
                                        <li class="breadcrumb-item active">CUSTOMER CASHFLOW VIEW</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end page title -->
                    <div class="row">
                        <div class="col-xxl-12">
                            <div class="card">


                                <div class="card-body">
                                    <div class="live-preview">
                                        <div action="javascript:void(0);">
                                            <div class="row">

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Customer Name*</label>
                                                       <asp:DropDownList ID="ddlCustomerName" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Security*</label>
                                          <asp:DropDownList ID="ddlProductName" runat="server" CssClass="form-control"></asp:DropDownList>
                                                       
                                                    </div>
                                                </div>

                                                <!--end col-->
                                                <div class="col-lg-3">
                                                    <div class="mb-3">
                                                            <label for="firstNameinput" class="form-label"></label>
            <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-primary" OnClick="lnkAdd_Click" >Filter Data</asp:LinkButton>
                                                        
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                            <!--end row-->
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div> <!-- end col -->

                         <!-- end col -->
                    </div>
                    
                    <asp:Panel ID ="pnlView" runat="server">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card card-height-100">
                                
                                <!-- end cardheader -->

                                    
                                <div class="card-body">


                                      <div class="table-responsive table-card">
                            
                            <div class="col-md-12" runat="server" id="Div3">
                                <asp:GridView ID="grdData" OnRowDataBound="grdData_RowDataBound" runat="server" CssClass="table table-nowrap table-centered align-middle" HeaderStyle-CssClass="fixedheader" AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-VerticalAlign="Middle" EmptyDataRowStyle-Height="320">
                                <Columns>

                                    <asp:TemplateField HeaderText="S.N.">
                                        <ItemTemplate>
                                            <strong><%#Container.DataItemIndex+1 %></strong>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                               <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           <asp:HiddenField ID ="hfCustomer" runat="server" Value='<%#Eval("CustomerId") %>' />
                                            <asp:HiddenField ID ="hfCashFlowView" runat="server" Value='<%#Eval("CashFlowViewId") %>' />
                                            <asp:HiddenField ID ="hfProduct" runat="server" Value='<%#Eval("ProductsId") %>' />
                                            <asp:HiddenField ID ="hfFrequency" runat="server" Value='<%#Eval("PaymentType") %>' />
                                            <%#Eval("EntryDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 
                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CFullName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Product Name" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                          <div id="divGridViewScroll" style="width:300px; height:100px; overflow: auto; scrollbar-width:auto">
                                            <%#Eval("Security")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Sattlement Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SattlementDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                            <asp:TemplateField HeaderText="Face Value For Deal" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FaceValueForDeal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Total Consideration Amount" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("TotalConsiderationAmount")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                 <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Left">
                                     <ItemTemplate>
                          <asp:LinkButton ID="lnkDealClose" runat="server" CssClass="btn btn-primary" CommandArgument='<%#Eval("CashFlowViewId")%>' OnClick="lnkDealClose_Click">
                                                   Deal Close</asp:LinkButton>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Left">
                                     <ItemTemplate>
                          <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("CashFlowViewId")%>' OnClick="lnkDelete_Click">
                                                    <i class="material-icons">delete</i></asp:LinkButton>
                                     </ItemTemplate>
                                 </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                            </div>
                         </div>
                                       

                                    

                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div><!-- end col -->

                        <!-- end col -->
                    </div>
                        </asp:Panel>

                </div> <!-- container-fluid -->
            </div>
            <!-- End Page-content -->


            
        </div>
                              </ContentTemplate>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

