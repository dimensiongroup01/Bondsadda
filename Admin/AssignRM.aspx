<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AssignRM.aspx.cs" Inherits="Admin_AssignRM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        button {
    border: 0px !IMPORTANT;
    background:none;
}

        td button:hover {
         
    color:#8c68cd;
}
        

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                                                        <asp:HiddenField ID ="hfAdhar" runat="server" />
                            <asp:HiddenField ID ="hfBank" runat="server" />
                            <asp:HiddenField ID ="hfPAN" runat="server" />
                            <asp:HiddenField ID ="hfDemate" runat="server" />
                            <asp:HiddenField ID ="hfAdharStatus" runat="server" />
                            <asp:HiddenField ID ="hfBankStatus" runat="server" />
                            <asp:HiddenField ID ="hfPANStatus" runat="server" />
                            <asp:HiddenField ID ="hfDemateStatus" runat="server" />
                            <asp:HiddenField ID ="hfRM" runat="server" />
    <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">
                                        <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">VIEW ASSIGN RM'S</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">ASSIGN RM'S</a></li>
                                        <li class="breadcrumb-item active">VIEW ASSIGN RM'S</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <asp:Panel ID ="pnlFilter" runat="server">
                        <div class="row">
                        <div class="card-body">
                            <div class="row">
                             <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">RM Name</label>
                                                       
                                                    
                                     <asp:DropDownList ID="ddlRM" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlRM_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                 </div>

                            <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Customer Name</label>
                               <asp:DropDownList ID="ddlCustomerName" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCustomerName_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                    </div>
                                                </div>
                                </div>
                        </div>
                    </div>
                    </asp:Panel>
                    
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
                                    
                              <asp:TemplateField HeaderText="Register Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("EntryDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 
                                    <asp:TemplateField HeaderText="RM Name" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FullName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-CssClass="text-right" HeaderStyle-HorizontalAlign="right" HeaderText="Customer Name">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfCustomerName" runat="server" Value='<%#Eval("CustomerId") %>' />
                                            <!-- Button trigger modal -->


                                            
                                            <button type="button" data-bs-toggle="modal" data-bs-target="#specification<%#Eval("CustomerId") %>">
                                                <%#Eval("CFullName") %>
                                            </button>
                                            <div id="specification<%#Eval("CustomerId") %>" class="modal fade bs-example-modal-xl" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-xl">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="myModalLabel">Customer Details</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="col-xxl-12">
                         
                            <div class="card">

                                    <!-- Nav tabs -->
                                    <ul class="nav nav-pills nav-justified mb-3" role="tablist">
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#cd<%#Eval("CustomerId") %>" role="tab">
                                                Customer Details
                                            </a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#ad<%#Eval("CustomerId") %>" role="tab">
                                                Adhar Details
                                            </a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#pd<%#Eval("CustomerId") %>" role="tab">
                                                PAN Details
                                            </a>
                                        </li>
                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#dd<%#Eval("CustomerId") %>" role="tab">
                                                Demate Account Details
                                            </a>
                                        </li>

                                        <li class="nav-item waves-effect waves-light">
                                            <a class="nav-link" data-bs-toggle="tab" href="#bd<%#Eval("CustomerId") %>" role="tab">
                                                Bank Details
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content text-muted">
                                        <div class="tab-pane active" id="cd<%#Eval("CustomerId") %>" role="tabpanel">
                                                <asp:GridView ID="grdCustomer" ClientIDMode="Static" runat="server" CssClass="table"
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
                                                                                                                                
                                                                    
                                    <asp:TemplateField HeaderText="Register Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("EntryDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 
                                    <asp:TemplateField HeaderText="FullName" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CFullName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CEmail")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Mobile" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CMobile")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                                                    </Columns>
                                                    </asp:GridView>
                                        </div>
                                        <div class="tab-pane" id="ad<%#Eval("CustomerId") %>" role="tabpanel">
                                          <asp:GridView ID="grdItems" ClientIDMode="Static" runat="server" CssClass="table"
                                                                AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                                                EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" ShowFooter="true"
                                                                EmptyDataRowStyle-VerticalAlign="Middle"
                                                                EmptyDataRowStyle-Height="100">
                                                                <Columns>

                                                                    <asp:TemplateField HeaderText="S.N.">
                                                                        <ItemTemplate>
                                                                            <strong><%#Container.DataItemIndex+1 %></strong>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Adhar Number">
                                                                        <ItemTemplate>
                                                                            <%#Eval("AdharNumber")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                                                                                                                                 <asp:TemplateField HeaderText="Adhar Status">
                                                                        <ItemTemplate>
                                                                            <%#Eval("AdharStatus")%>
                                                                        </ItemTemplate>
                                    
                                                                    </asp:TemplateField>

                                                                </Columns>
                                                            </asp:GridView>
                                        </div>
                                        <div class="tab-pane" id="pd<%#Eval("CustomerId") %>" role="tabpanel">
                                            <asp:GridView ID="grdItemsPAN" ClientIDMode="Static" runat="server" CssClass="table"
                                                                AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                                                EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" ShowFooter="true"
                                                                EmptyDataRowStyle-VerticalAlign="Middle"
                                                                EmptyDataRowStyle-Height="100">
                                                                <Columns>

                                                                    <asp:TemplateField HeaderText="S.N.">
                                                                        <ItemTemplate>
                                                                            <strong><%#Container.DataItemIndex+1 %></strong>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="PAN Number">
                                                                        <ItemTemplate>
                                                                            <%#Eval("PANNumber")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                                                                                                                                 <asp:TemplateField HeaderText="PAN Status">
                                                                        <ItemTemplate>
                                                                            <%#Eval("Status")%>
                                                                        </ItemTemplate>
                                         <%--<FooterTemplate>
                                 <asp:LinkButton ID="lnkCancelPAN" runat="server" CssClass="btn btn-danger" OnClick="lnkCancelPAN_Click">Cancel</asp:LinkButton>
                                               <asp:LinkButton ID="lnlPAN" runat="server" CssClass="btn btn-primary" OnClick="lnlPAN_Click">Approved</asp:LinkButton>
                                         </FooterTemplate>--%>
                                                                    </asp:TemplateField>

                                                                </Columns>
                                                            </asp:GridView>
                                        </div>
                                        <div class="tab-pane" id="dd<%#Eval("CustomerId") %>" role="tabpanel">
                                            <asp:GridView ID="grdItemsDemate" ClientIDMode="Static" runat="server" CssClass="table"
                                                                AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                                                EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" ShowFooter="true"
                                                                EmptyDataRowStyle-VerticalAlign="Middle"
                                                                EmptyDataRowStyle-Height="100">
                                                                <Columns>

                                                                    <asp:TemplateField HeaderText="S.N.">
                                                                        <ItemTemplate>
                                                                            <strong><%#Container.DataItemIndex+1 %></strong>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Demate Account Number">
                                                                        <ItemTemplate>
                                                                            <%#Eval("DemateAccountNumber")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                                                                                                                                 <asp:TemplateField HeaderText="Demate Account Status">
                                                                        <ItemTemplate>
                                                                            <%#Eval("DemateStatus")%>
                                                                        </ItemTemplate>
                                         <%--<FooterTemplate>
                                <asp:LinkButton ID="lnkCancelDemate" runat="server" CssClass="btn btn-danger" OnClick="lnkCancelDemate_Click">Cancel</asp:LinkButton>
                                               <asp:LinkButton ID="lnkDemate" runat="server" CssClass="btn btn-primary" OnClick="lnkDemate_Click">Approved</asp:LinkButton>
                                         </FooterTemplate>--%>
                                                                    </asp:TemplateField>

                                                                </Columns>
                                                            </asp:GridView>
                                        </div>

                                      <div class="tab-pane" id="bd<%#Eval("CustomerId") %>" role="tabpanel">
                                          <asp:GridView ID="grdItemsBank" ClientIDMode="Static" runat="server" CssClass="table"
                                                                AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                                                EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" ShowFooter="true"
                                                                EmptyDataRowStyle-VerticalAlign="Middle"
                                                                EmptyDataRowStyle-Height="100">
                                                                <Columns>

                                                                    <asp:TemplateField HeaderText="S.N.">
                                                                        <ItemTemplate>
                                                                            <strong><%#Container.DataItemIndex+1 %></strong>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Bank Account Number">
                                                                        <ItemTemplate>
                                                                            <%#Eval("BankAccountNumber")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                                                                                        
                                                                    <asp:TemplateField HeaderText="Bank Acc Holder">                                                                        <ItemTemplate>
                                                                            <%#Eval("BankHolderName")%>
                                                                        </ItemTemplate>
                                                                   </asp:TemplateField>
                                                                                                                                                           <asp:TemplateField HeaderText="Bank Name">
                                                                        <ItemTemplate>
                                                                            <%#Eval("BankName")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
 
                                                                    <asp:TemplateField HeaderText="IFSC Code">
                                                                        <ItemTemplate>
                                                                            <%#Eval("IFSCCode")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField><asp:TemplateField HeaderText="Bank Status">
                                                                        <ItemTemplate>
                                                                            <%#Eval("BankStatus")%>
                                                                        </ItemTemplate>
                                         <%--<FooterTemplate>
                            <asp:LinkButton ID="lnkCancelBank" runat="server" CssClass="btn btn-danger" OnClick="lnkCancelBank_Click">Cancel</asp:LinkButton>
                                               <asp:LinkButton ID="lnkBank" runat="server" CssClass="btn btn-primary" OnClick="lnkBank_Click">Approved</asp:LinkButton>
                                         </FooterTemplate>--%>
                                                                    </asp:TemplateField>

                                                                </Columns>
                                                            </asp:GridView>
                                          </div>

                                    </div>
                                <!-- end card-body -->
                            </div><!-- end card -->
                        </div>
                                                                                                                 

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                           
                                                        </div>

                                                    </div><!-- /.modal-content -->
                                                </div><!-- /.modal-dialog -->
                                            </div><!-- /.modal -->
                                       

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-CssClass="text-left" HeaderText="Add Deal">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfCustomer" runat="server" Value='<%#Eval("CustomerId") %>' />
                                            <!-- Button trigger modal -->

                                  <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModal<%#Eval("CustomerId") %>">
                                                Add Deal
                                            </button>

                                                    <div id="myModal<%#Eval("CustomerId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="myModalLabel">Deal Add</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                           <div class="row">
                        <div class="col-xxl-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="live-preview">
                                        <div action="javascript:void(0);">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">ProductName*</label>
                                                    <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Deal Date</label>
                                                        <asp:TextBox ID ="txtDealDate" runat="server" class="form-control datepicker" placeholder="Deal Date"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Payment Date</label>
                                                        <asp:TextBox ID ="txtPaymentDate" runat="server" class="form-control datepicker" placeholder="Payment Date"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                                <div class="col-md-3">
                                                    <div class="mb-3">
                                                            <label for="firstNameinput" class="form-label"></label>
            <asp:LinkButton ID="lnkAddDeal" runat="server" CssClass="btn btn-primary" OnClick="lnkAddDeal_Click" >Deal Add</asp:LinkButton>
                                                        
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

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                           
                                                        </div>

                                                    </div><!-- /.modal-content -->
                                                </div><!-- /.modal-dialog -->
                                            </div>
                                              
                                            <!-- /.modal -->
                                       

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-CssClass="text-left" HeaderText="View Deal">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfCustomerViewDeal" runat="server" Value='<%#Eval("CustomerId") %>' />
                                            <!-- Button trigger modal -->
                                  <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModalsss<%#Eval("CustomerId") %>">
                                                View Deal
                                            </button>

                                            <div id="myModalsss<%#Eval("CustomerId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-xl">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="myModalLabel">Deal Details</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                           <asp:GridView ID="grdCustomerDeal" ClientIDMode="Static" runat="server" CssClass="table"
                                                                AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                                                EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" ShowFooter="true"
                                                                EmptyDataRowStyle-VerticalAlign="Middle"
                                                                EmptyDataRowStyle-Height="100">
                                                                <Columns>

                                                                    <asp:TemplateField HeaderText="S.N.">
                                                                        <ItemTemplate>
                                                                            <strong><%#Container.DataItemIndex+1 %></strong>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Product Name">
                                                                        <ItemTemplate>
                                                                            <%#Eval("ProductName")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                                                                                                                                                             <asp:TemplateField HeaderText="Deal Date">
                                                                        <ItemTemplate>
                                                                            <%#Eval("DealDate")%>
                                                                        </ItemTemplate>
                                         
                                                                    </asp:TemplateField>
                                                                                                                                                                                                 <asp:TemplateField HeaderText="Payment Date">
                                                                        <ItemTemplate>
                                                                            <%#Eval("PaymentDate")%>
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

                                         <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Action" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                              <asp:CheckBox ID="chkIsActive"  runat="server" Checked='<%#Eval("IsActive")%>' ToolTip='<%#Eval("RMAssignId")%>'
                                                        OnCheckedChanged="chkIsActive_CheckedChanged" AutoPostBack="true" />

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
                    
                    </div>
                </div>
        </div>
                            </ContentTemplate>
                            </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   
                <link href="../chosen/chosen.css" rel="stylesheet" />
    <script src="../chosen/chosen.jquery.js"></script>
    <script src="../chosen/chosen.jquery.min.js"></script>
    
      <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--select2 cdn-->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script src="https://themesbrand.com/velzon/html/galaxy/assets/js/pages/select2.init.js"></script>

    <!-- App js -->
<%--    <script src="https://themesbrand.com/velzon/html/galaxy/assets/js/app.js"></script>--%>

    <script src="https://themesbrand.com/velzon/html/galaxy/assets/js/pages/select2.init.js"></script>
             <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">

      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker({
                dateFormat: "dd/mm/yy", changeMonth: true, changeYear: true, yearRange: '-115:+10'
            });
            $("#datepicker").datepicker("show");
        });
    </script>
    <script>
        $(document).ready(function () {
            $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-10:+50" });
            $(".chosen").chosen();

            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function () {
                $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-10:+50" });
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

