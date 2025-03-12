<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ViewBullet.aspx.cs" Inherits="Admin_EmailNotification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link href="../assets/css/app.min.css" rel="stylesheet" />
    <style>

              ul {
            background:#fff;
        }
              td {
    padding: 5px;
}
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>


<div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">VIEW BULLET PRODUCT</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">BULLET PRODUCT</a></li>
                                    <li class="breadcrumb-item active">BULLET PRODUCT</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->
                <asp:Panel ID ="pnlAdd" runat="server">
                        <div class="row">
    <div class="col-md-8">
        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
         

                <asp:DropDownList ID="ddlSecurity" runat="server" CssClass="form-control" style="margin-left:10px"></asp:DropDownList>
            <asp:TextBox ID="txtISINNumber" runat="server" CssClass="form-control" placeholder="ISIN Number" AutoCompleteType="Disabled"></asp:TextBox>
               <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-primary" style="margin-left:5px;" OnClick="lnkFilter_Click">Filter</asp:LinkButton>
        </div>
    </div>
        
</div>
                </asp:Panel>

                
                <!--end row-->
                <asp:Panel ID ="pnlView" runat="server">
                            <asp:Panel ID ="pnlCreateView" runat="server">
    <div class="row">
    <div class="col-xl-12">
                                    <asp:LinkButton ID="lnkcheckall" runat="server" CssClass="btn btn-primary" OnClick="lnkcheckall_Click">Check All</asp:LinkButton>
        <asp:LinkButton ID="lnkdeletecheck" runat="server" CssClass="btn btn-primary" OnClick="lnkdeletecheck_Click" OnClientClick="return confirm('Are you sure you want delete');">Check Data Delete</asp:LinkButton>
        <div class="card card-height-100">
            
            <!-- end cardheader -->

                
            <div class="card-body">


                  <div class="table-responsive table-card">
        
        <div class="col-md-12" runat="server" id="Div3">
            <asp:GridView ID="grdData" OnRowDataBound="grdData_RowDataBound" runat="server" CssClass="table table-striped dataTable table-nowrap table-centered align-middle" HeaderStyle-CssClass="fixedheader" AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
            EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-VerticalAlign="Middle" EmptyDataRowStyle-Height="320">
                <%-- <alternatingrowstyle BackColor="White" ForeColor="#284775"></alternatingrowstyle>--%>
            <Columns>

                <asp:TemplateField HeaderText="S.N.">
                    <ItemTemplate>
                        <strong><%#Container.DataItemIndex+1 %></strong>
                    </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Select For Delete" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                          <asp:CheckBox ID="chkdeleteData"  runat="server" ToolTip='<%#Eval("ProductsId")%>' />
                       
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Home Page Data" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                          <asp:CheckBox ID="chkShowData"  runat="server" Checked='<%#Eval("ShowData")%>' ToolTip='<%#Eval("ProductsId")%>'
                                    OnCheckedChanged="chkShowData_CheckedChanged" AutoPostBack="true" />
                       
                  </ItemTemplate>
                </asp:TemplateField>
         <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Invest Now Data" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                          <asp:CheckBox ID="chkInvestNow"  runat="server" Checked='<%#Eval("IsInvestNow")%>' ToolTip='<%#Eval("ProductsId")%>'
                                    OnCheckedChanged="chkInvestNow_CheckedChanged" AutoPostBack="true" />
                       
                  </ItemTemplate>
                </asp:TemplateField>
                
              <asp:TemplateField HeaderText="Category" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("CategoryHead")%>
                    </ItemTemplate>
                </asp:TemplateField>
             
                <asp:TemplateField HeaderText="ISIN No" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("ISINNumber")%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Security" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("Security")%>
                    </ItemTemplate>
                </asp:TemplateField>

                

               <asp:TemplateField HeaderText="CouponRate" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("CouponRate") %> %
                    </ItemTemplate>
                </asp:TemplateField>

              

                <asp:TemplateField HeaderText="SECURED/UNSECURED" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("DataStatus") %>
                    </ItemTemplate>
                </asp:TemplateField>

            <asp:TemplateField HeaderText="Put Date" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("PutCallDate") %>
                    </ItemTemplate>
                </asp:TemplateField>
           <asp:TemplateField HeaderText="Call Date" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("CallDate") %>
                    </ItemTemplate>
                </asp:TemplateField>
        <asp:TemplateField HeaderText="Guaranteed By" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("GuaranteedBy") %>
                    </ItemTemplate>
                </asp:TemplateField>

              <asp:TemplateField HeaderText="Maturity Date" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("MaturityDate")%>
                    </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="PaymentType/Frequency" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("PaymentTypeHead") %>
                    </ItemTemplate>
                </asp:TemplateField>
           <asp:TemplateField HeaderText="IP Date" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("IPDate") %>
                    </ItemTemplate>
                </asp:TemplateField>

            <asp:TemplateField HeaderText="Price" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("Price") %>
                    </ItemTemplate>
                </asp:TemplateField>
         <asp:TemplateField HeaderText="YTC/YIELD SEMI" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("YTCYieldSemi") %>
                    </ItemTemplate>
                </asp:TemplateField>
        <asp:TemplateField HeaderText="YTM" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("YTM") %> %
                    </ItemTemplate>
                </asp:TemplateField>
         <asp:TemplateField HeaderText="Face Value For Bond" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
                        <%#Eval("FacevalueForBond") %>
                    </ItemTemplate>
                </asp:TemplateField>
         <asp:TemplateField HeaderText="Product Image" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
           <a href='<%#Eval("ProductImage").ToString().Replace("~/","../") %>'>View</a>
                    </ItemTemplate>
                </asp:TemplateField>
         <asp:TemplateField HeaderText="Product File" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
         <a href='<%#Eval("ProductFile").ToString().Replace("~/","../") %>'>View</a>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Memorandum File" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       
         <a href='<%#Eval("MemorandumFile").ToString().Replace("~/","../") %>'>View</a>
                    </ItemTemplate>
                </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Description" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                       <div id="divGridViewScroll" style="width:300px; height:100px; overflow: auto">
                        <%#Eval("Description") %>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField ItemStyle-CssClass="text-center" HeaderText="Rating Agencies">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfProductId" runat="server" Value='<%#Eval("ProductsId") %>' />
                        <!-- Button trigger modal -->


                        
                        <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModal<%#Eval("ProductsId") %>">
                            View
                        </button>
                        <div id="myModal<%#Eval("ProductsId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="myModalLabel">Tags</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                       <asp:GridView ID="grdItems" ClientIDMode="Static" runat="server" CssClass="table"
                                            AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                            EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center"
                                            EmptyDataRowStyle-VerticalAlign="Middle"
                                            EmptyDataRowStyle-Height="200">
                                            <Columns>

                                                <asp:TemplateField HeaderText="S.N.">
                                                    <ItemTemplate>
                                                        <strong><%#Container.DataItemIndex+1 %></strong>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Rating Agencies">
                                                    <ItemTemplate>
                                                        <%#Eval("RatingAgencies")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                            </Columns>
                                        </asp:GridView>                                                      

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                       
                                    </div>

                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                   

                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderText="Credit Rating">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfProductsId" runat="server" Value='<%#Eval("ProductsId") %>' />
                        <!-- Button trigger modal -->


                        
                        <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#mySpace<%#Eval("ProductsId") %>">
                            View
                        </button>
                        <div id="mySpace<%#Eval("ProductsId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="mySpaceLabel">Tags</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                       <asp:GridView ID="grdItemsData" ClientIDMode="Static" runat="server" CssClass="table"
                                            AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                            EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center"
                                            EmptyDataRowStyle-VerticalAlign="Middle"
                                            EmptyDataRowStyle-Height="200">
                                            <Columns>

                                                <asp:TemplateField HeaderText="S.N.">
                                                    <ItemTemplate>
                                                        <strong><%#Container.DataItemIndex+1 %></strong>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Credit Rating">
                                                    <ItemTemplate>
                                                        <%#Eval("CreditRating")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                            </Columns>
                                        </asp:GridView>                                                      

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                       
                                    </div>

                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                   

                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="text-center" HeaderText="Tags">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfProductssId" runat="server" Value='<%#Eval("ProductsId") %>' />
                        <!-- Button trigger modal -->


                        
                        <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#mySpacess<%#Eval("ProductsId") %>">
                            View
                        </button>
                        <div id="mySpacess<%#Eval("ProductsId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="mySpaceLabel">Tags</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                       <asp:GridView ID="grdItemsDataTags" ClientIDMode="Static" runat="server" CssClass="table"
                                            AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                            EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center"
                                            EmptyDataRowStyle-VerticalAlign="Middle"
                                            EmptyDataRowStyle-Height="200">
                                            <Columns>

                                                <asp:TemplateField HeaderText="S.N.">
                                                    <ItemTemplate>
                                                        <strong><%#Container.DataItemIndex+1 %></strong>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tags">
                                                    <ItemTemplate>
                                                        <%#Eval("TagsHead")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                            </Columns>
                                        </asp:GridView>                                                      

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                       
                                    </div>

                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                   

                    </ItemTemplate>
                </asp:TemplateField>

<%--                     <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Action" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                          <asp:CheckBox ID="chkIsActive"  runat="server" Checked='<%#Eval("IsActive")%>' ToolTip='<%#Eval("ProductsId")%>'
                                    OnCheckedChanged="chkIsActive_CheckedChanged" AutoPostBack="true" />
             <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("ProductsId")%>' OnClick="lnkEdit_Click">
                                <i class="material-icons">border_color</i></asp:LinkButton>
                       
                  </ItemTemplate>
                </asp:TemplateField>
                                                         <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Delete" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                         <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("ProductsId")%>' OnClick="lnkDelete_Click">
                                <i class="material-icons">delete</i></asp:LinkButton>
                       </ItemTemplate>
                </asp:TemplateField>--%>
              
             

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
</asp:Panel>
                

            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->


        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="../assets/js/pages/select2.init.js"></script>
        <script src="https://themesbrand.com/velzon/html/galaxy/assets/js/app.js"></script>



</asp:Content>

