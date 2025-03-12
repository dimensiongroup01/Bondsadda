<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ReAssignRM.aspx.cs" Inherits="Admin_ReAssignRM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        a#ContentPlaceHolder1_lnkReAssign {
    margin-top: 27px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:HiddenField ID ="hfReAssignLogId" runat="server" />
    <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">
                                        <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">REASSIGN</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">REASSIGN</a></li>
                                        <li class="breadcrumb-item active">ADD REASSIGN</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <asp:Panel ID ="pnlAdd" runat="server">
                                    <div class="row">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Customer Name</label>
                               <asp:DropDownList ID="ddlCustomerName" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCustomerName_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                    </div>
                                                </div>
                             <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">RM Name</label>
                                                       
                                                    
                                     <asp:DropDownList ID="ddlRM" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                 </div>

                            

                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label"></label>
                              <asp:LinkButton ID="lnkReAssign" runat="server" CssClass="btn btn-primary" OnClick="lnkReAssign_Click">Submit</asp:LinkButton>
                                                    </div>
                                                </div>

                                </div>
                        </div>
                    </div>
                                </asp:Panel>
                    <!-- end page title -->

                    <br />
                    <br />
                    <asp:Panel ID ="pnlView" runat="server">
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
                                  <asp:TemplateField HeaderText="Customer Name" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CFullName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-CssClass="text-left" HeaderText="RMAssign History">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfCustomerView" runat="server" Value='<%#Eval("CustomerId") %>' />
                                            <!-- Button trigger modal -->
                                  <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModalsss<%#Eval("CustomerId") %>">
                                                View Details
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
                                                                    <asp:TemplateField HeaderText="RM Name">
                                                                        <ItemTemplate>
                                                                            <%#Eval("RMAssignUser")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                                                                                                                                                             <asp:TemplateField HeaderText="Customer Name">
                                                                        <ItemTemplate>
                                                                            <%#Eval("CFullName")%>
                                                                        </ItemTemplate>
                                         
                                                                    </asp:TemplateField>
                                                                                                                                                                                                 <asp:TemplateField HeaderText="Assign Date">
                                                                        <ItemTemplate>
                                                                            <%#Eval("AssignDate")%>
                                                                        </ItemTemplate>
                                         
                                                                    </asp:TemplateField>

                                                                                                                                                                            <asp:TemplateField HeaderText="Remove">
                                                                        <ItemTemplate>
                                                                            <%#Eval("AssignDateOut")%>
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

                                         
                                  
                                 

                                </Columns>
                            </asp:GridView>
                            </div>
                                </div>
                                       

                                    

                                </div>
                    </asp:Panel>
                    
                    </div>
                </div>
        </div>
                            </ContentTemplate>
                            </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

