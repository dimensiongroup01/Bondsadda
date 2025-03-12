<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="SellBond.aspx.cs" Inherits="Admin_SellBond" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
              <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID ="upnl" runat="server">
                        <ContentTemplate>
                            <asp:HiddenField ID ="hfCategory" runat="server" />
                            <asp:HiddenField ID ="hfISINNumber" runat="server" />
                            <asp:HiddenField ID ="hfProductName" runat="server" />
                            <asp:HiddenField ID ="hfSecurity" runat="server" />
                             <asp:HiddenField ID ="hfCouponRate" runat="server" />
                             <asp:HiddenField ID ="hfRatingAgencies" runat="server" />
                             <asp:HiddenField ID ="hfPutCallDate" runat="server" />
                             <asp:HiddenField ID ="hfMaturityDate" runat="server" />
                             <asp:HiddenField ID ="hfIPDate" runat="server" />
                             <asp:HiddenField ID ="hfPriceRate" runat="server" />
                             <asp:HiddenField ID ="hfYTCYieldSemi" runat="server" />
                             <asp:HiddenField ID ="hfYTM" runat="server" />
                             <asp:HiddenField ID ="hfFacevalueForBond" runat="server" />
                            <asp:HiddenField ID ="hfProductImage" runat="server" />
                            <asp:HiddenField ID ="hfProductFile" runat="server" />
                            <asp:HiddenField ID ="hfBond" runat="server" />
                            <asp:HiddenField ID ="hfSellBonId" runat="server" />
                            <asp:HiddenField ID ="hfCreditRating" runat="server" />
                            <asp:HiddenField ID ="hfDataStatus" runat="server" />
                            <asp:HiddenField ID ="hfPaymentTypeId" runat="server" />
                            <asp:HiddenField ID ="hfCallDate" runat="server" />
                            <asp:HiddenField ID ="hfGuaranteedBy" runat="server" />
    <div class="main-content">
        <asp:HiddenField ID ="hfUserId" runat="server" />
            <div class="page-content">
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">VIEW SELL BONDS</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">SELL BONDS</a></li>
                                        <li class="breadcrumb-item active">VIEW SELL BONDS</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end page title -->
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
                                  <asp:TemplateField HeaderText="Customer Name" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                             <asp:HiddenField ID ="hfCustomer" runat="server" Value='<%#Eval("CustomerId") %>' />
                             <asp:HiddenField ID ="hfSellBondId" runat="server" Value='<%#Eval("SellBondId") %>' />
                                            <%#Eval("CFullName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Category" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CategoryHead")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 
                                    <asp:TemplateField HeaderText="ISIN No" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SISINNumber")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
<%--                                    <asp:TemplateField HeaderText="Credit Rating" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CreditRating") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Rating Agencies" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("RatingAgencies") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                  <%-- <asp:TemplateField HeaderText="Security" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("Security")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                               --%>     <asp:TemplateField HeaderText="Product Name" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SProductName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

<%--                                    <asp:TemplateField HeaderText="Security" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           <%#Eval("Security") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>

                                   <asp:TemplateField HeaderText="CouponRate" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SCouponRate") %> %
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                <asp:TemplateField HeaderText="PUT Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SPutCallDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="CALL Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SCallDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Guaranteed By" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SGuaranteedBy") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Maturity Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SMaturityDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                               <asp:TemplateField HeaderText="IP Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SIPDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                <asp:TemplateField HeaderText="Price" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SPriceRate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="YTC/YIELD SEMI" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SYTCYieldSemi") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                            <asp:TemplateField HeaderText="YTM" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SYTM") %> %
                                        </ItemTemplate>
                                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Face Value For Bond" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("SFacevalueForBond") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 <%--<asp:TemplateField HeaderText="Data Status" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DataStatus") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                             <asp:TemplateField HeaderText="Bond Status" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("BondStatus") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
<%--                             <asp:TemplateField HeaderText="Product Image" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                               <a href='<%#Eval("SProductImage").ToString().Replace("~/","../") %>'>View</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Product File" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                             <a href='<%#Eval("SProductFile").ToString().Replace("~/","../") %>'>View</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkApproved" runat="server" CssClass="btn btn-primary" OnClick="lnkApproved_Click">Approve</asp:LinkButton>
                                       <asp:LinkButton ID="lnkReject" runat="server" CssClass="btn btn-danger" OnClick="lnkReject_Click">Reject</asp:LinkButton>

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
        </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

