<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ViewInvestmentNow.aspx.cs" Inherits="Admin_ViewInvestmentNow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main-content">
<asp:HiddenField ID ="hfUserId" runat="server" />
        <asp:HiddenField ID="hfRM" runat="server" />
    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">VIEW INVESTMENT DETAILS</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">INVESTMENT DETAILS</a></li>
                                <li class="breadcrumb-item active">VIEW INVESTMENT DETAILS</li>
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

                        <asp:GridView ID="grdData" runat="server" CssClass="table table-striped dataTable table-nowrap table-centered align-middle" HeaderStyle-CssClass="fixedheader" AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                        EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-VerticalAlign="Middle" EmptyDataRowStyle-Height="320">
                        <Columns>

                            <asp:TemplateField HeaderText="S.N.">
                                <ItemTemplate>
                                    <strong><%#Container.DataItemIndex+1 %></strong>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                           <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                   
                                    <%#Eval("EntryDate")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                         
                            <asp:TemplateField HeaderText="Bonds Name" HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                   
                                    <%#Eval("Security")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Customer" HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                   <%#Eval("CFullName") %> - <%#Eval("CMobile")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                         <asp:TemplateField HeaderText="RM Name" HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                   
                                    <%#Eval("RMName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Investment Details" HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                   
                                    <%#Eval("InvestmentType")%>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

