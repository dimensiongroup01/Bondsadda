<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ViewRegisteredCustomer.aspx.cs" Inherits="Admin_ViewRegisteredCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <style>
        .modal-content.san {
    width: 180%;
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
                                <h4 class="mb-sm-0">VIEW REGISTERED CUSTOMERS</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">CUSTOMERS</a></li>
                                        <li class="breadcrumb-item active">VIEW REGISTERED CUSTOMERS</li>
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
                                <asp:GridView ID="grdData" runat="server" OnRowDataBound="grdData_RowDataBound" CssClass="table table-striped dataTable table-nowrap table-centered align-middle" HeaderStyle-CssClass="fixedheader" AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
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
                                   <asp:TemplateField HeaderText="Date of Birth" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DateOfBirth")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Password" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:HiddenField ID ="hfPassword" runat="server" Value='<%#Eval("CPassword") %>' />
                                            <asp:TextBox ID="txtPassword" runat="server" type="password"  Value='<%#Eval("CPassword") %>' style="width: 120px;"> 
</asp:TextBox>
                                             <i class="ri-eye-fill" id="togglePassword" onclick="showPassword(this)" style="margin-left: -30px; cursor: pointer;"></i>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField ItemStyle-CssClass="text-center" HeaderText="Adhar">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfCustomerAdhar" runat="server" Value='<%#Eval("CustomerId") %>' />
                                            <!-- Button trigger modal -->


                                            <asp:Panel ID ="pnlAdharPending" runat="server">
                                                                                            <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModal<%#Eval("CustomerId") %>">
                                                Pending
                                            </button>
                                            </asp:Panel>
                                            <asp:Panel ID ="pnlAdharApproved" runat="server">
                                  <button type="button" class="btn btn-success " data-bs-toggle="modal" data-bs-target="#myModal<%#Eval("CustomerId") %>">
                                                Approved
                                            </button>
                                            </asp:Panel>
                                        <asp:Panel ID ="pnlAdharReject" runat="server">
                                  <button type="button" class="btn btn-danger " data-bs-toggle="modal" data-bs-target="#myModal<%#Eval("CustomerId") %>">
                                                Reject
                                            </button>
                                            </asp:Panel>

                                            <div id="myModal<%#Eval("CustomerId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="myModalLabel">Adhar Number Details</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                           <asp:GridView ID="grdItems" OnRowDataBound="grdItems_RowDataBound" ClientIDMode="Static" runat="server" CssClass="table"
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
                                         <%--<FooterTemplate>
                             <asp:LinkButton ID="lnkCancelAdhar" runat="server" CssClass="btn btn-danger" OnClick="lnkCancelAdhar_Click">Cancel</asp:LinkButton>                                            <asp:HiddenField ID="hfCustId" runat="server" Value='<%#Eval("CustomerId") %>' />

                                               <asp:LinkButton ID="lnkSubmit" runat="server" CssClass="btn btn-primary" CommandArgument='<%#Eval("CustomerId") %>' OnClick="lnkSubmit_Click">Approved</asp:LinkButton>
                                         </FooterTemplate>--%>
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

                                    <asp:TemplateField ItemStyle-CssClass="text-center" HeaderText="PAN Card">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfCustomerPAN" runat="server" Value='<%#Eval("CustomerId") %>' />
                                            <!-- Button trigger modal -->

                                            <asp:Panel ID ="pnlPendingPAN" runat="server">
                              <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModalss<%#Eval("CustomerId") %>">
                                               Pending
                                            </button>
                                            </asp:Panel>
                                            <asp:Panel ID ="pnlApprovedPAN" runat="server">
                             <button type="button" class="btn btn-success " data-bs-toggle="modal" data-bs-target="#myModalss<%#Eval("CustomerId") %>">
                                                Approved
                                            </button>
                                            </asp:Panel>
                                 <asp:Panel ID ="pnlRejectPAN" runat="server">
                             <button type="button" class="btn btn-danger " data-bs-toggle="modal" data-bs-target="#myModalss<%#Eval("CustomerId") %>">
                                                Reject
                                            </button>
                                            </asp:Panel>
                                            <div id="myModalss<%#Eval("CustomerId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="myModalLabel">PAN Number Details</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
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
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                           
                                                        </div>

                                                    </div><!-- /.modal-content -->
                                                </div><!-- /.modal-dialog -->
                                            </div><!-- /.modal -->
                                       

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-CssClass="text-center" HeaderText="Demate Account">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfCustomerDemate" runat="server" Value='<%#Eval("CustomerId") %>' />
                                            <!-- Button trigger modal -->


                                            <asp:Panel ID ="pnlPendingDemate" runat="server">
                               <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModals<%#Eval("CustomerId") %>">
                                                Pending
                                            </button>
                                            </asp:Panel>
                                            <asp:Panel ID ="pnlApprovedDemate" runat="server">
                           <button type="button" class="btn btn-success " data-bs-toggle="modal" data-bs-target="#myModals<%#Eval("CustomerId") %>">
                                                Approved
                                            </button>
                                            </asp:Panel>
                                      <asp:Panel ID ="pnlRejectDemate" runat="server">
                           <button type="button" class="btn btn-danger " data-bs-toggle="modal" data-bs-target="#myModals<%#Eval("CustomerId") %>">
                                                Reject
                                            </button>
                                            </asp:Panel>

                                            <div id="myModals<%#Eval("CustomerId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="myModalLabel">Demate Account Details</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
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
                                                                    <asp:TemplateField HeaderText="DP ID">
                                                                        <ItemTemplate>
                                                                            <%#Eval("DemateAccountNumber")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                                                                                        <asp:TemplateField HeaderText="Client Id">
                                                                        <ItemTemplate>
                                                                            <%#Eval("ClientId")%>
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
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                           
                                                        </div>

                                                    </div><!-- /.modal-content -->
                                                </div><!-- /.modal-dialog -->
                                            </div><!-- /.modal -->
                                       

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-CssClass="text-center" HeaderText="Bank Details">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfCustomerBank" runat="server" Value='<%#Eval("CustomerId") %>' />
                                            <!-- Button trigger modal -->

                                            <asp:Panel ID ="pnlPendingBank" runat="server">
                                                                                            <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModalsss<%#Eval("CustomerId") %>">
                                                Pending
                                            </button>
                                            </asp:Panel>
                                            <asp:Panel ID ="pnlApprovedBank" runat="server">
                       <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModalsss<%#Eval("CustomerId") %>">
                                                Approved
                                            </button>
                                            </asp:Panel>
                                       <asp:Panel ID ="pnlRejectBank" runat="server">
                       <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myModalsss<%#Eval("CustomerId") %>">
                                                Reject
                                            </button>
                                            </asp:Panel>

                                            <div id="myModalsss<%#Eval("CustomerId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content san">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="myModalLabel">Bank Details</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
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
                                              <asp:CheckBox ID="chkIsActive"  runat="server" Checked='<%#Eval("IsActive")%>' ToolTip='<%#Eval("CustomerId")%>'
                                                        OnCheckedChanged="chkIsActive_CheckedChanged" AutoPostBack="true" />

<%--                                 <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("UserId")%>' OnClick="lnkEdit_Click">
                                                    <i class="material-icons">border_color</i></asp:LinkButton>
                                           
                                     
                                             <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("UserId")%>' OnClick="lnkDelete_Click">
                                                    <i class="material-icons">delete</i></asp:LinkButton>--%>
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
    <script>
        
        function showPassword(el) {
            debugger;
            // toggle the type attribute
            var inp = $(el).prev('input');
          //  const type = inp.getAttribute('type') === 'password' ? 'text' : 'password';
         //   inp.type = 'text';
            if (inp.attr("type") == 'text') {
                inp.attr('type', 'password');
            }
            else {
                inp.attr('type', 'text');
            }
            // toggle the eye slash icon
            el.classList.toggle('ri-eye-off-fill');
        };
    </script>
</asp:Content>

