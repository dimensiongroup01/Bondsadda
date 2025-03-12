<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Admin_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--      <link rel="shortcut icon" href="https://themesbrand.com/velzon/html/galaxy/assets/images/favicon.ico">--%>

    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />



    <!-- App Css-->
    <link href="https://themesbrand.com/velzon/html/galaxy/assets/css/app.min.css" rel="stylesheet" type="text/css" />

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
                                <h4 class="mb-sm-0">ADD CATEGORIES</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">CATEGORIES</a></li>
                                        <li class="breadcrumb-item active">ADD CATEGORIES</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end page title -->
                    <asp:Panel ID ="pnlAdd" runat="server">
                        <div class="row">
                        <div class="col-xxl-12">
                            <div class="card">


                                <div class="card-body">
                                    <div class="live-preview">
                                        <div action="javascript:void(0);">
                                            <div class="row">

                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Category Name*</label>
                                                        <asp:TextBox ID ="txtCategoryName" runat="server"  type="text" class="form-control" placeholder="Enter Category Name"></asp:TextBox>
                                                    </div>
                                                </div>
                                               <%--<div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Category Font Icon</label>
                                                        <asp:TextBox ID ="txtFontIcon" runat="server"  type="text" class="form-control" placeholder="Enter Category Font Icon"></asp:TextBox>
                                                    </div>
                                                </div>--%>

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Image</label>
                                             <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control"/>
                                                        <progress id="ImagefileProgress" style="display: none"></progress>
                      <asp:HiddenField ID="hfImageFilePath" runat="server" />
                                                       
                                                    </div>
                                                </div>

                                                                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Icon(Optional)</label>
                                            <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control"/>
                                                        <progress id="IconfileProgress" style="display: none"></progress>
                      <asp:HiddenField ID="hfIconFilePath" runat="server" />
                                                       
                                                    </div>
                                                </div>
                                                                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Sequency Number*</label>
                                                        <asp:TextBox ID ="txtSequency" runat="server"  type="text" class="form-control" placeholder="Enter Sequency Number"></asp:TextBox>
                                                    </div>
                                                </div>
                                         <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Tags</label>
  <asp:ListBox ID="ddlTags" runat="server" CssClass="form-control js-example-basic-multiple" SelectionMode="Multiple" ></asp:ListBox>
                                                       
                                                    </div>
                                                </div>
                                              

                                                <!--end col-->
                                                <div class="col-lg-12">
                                                    <div class="text-end">
            <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-primary" OnClick="lnkAdd_Click" >Add Category</asp:LinkButton>
                                                        
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
                    </asp:Panel>

                    
                    <!--end row-->
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
                                    
                                     
                                 
                                    <asp:TemplateField HeaderText="Category Name" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CategoryHead")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                                                         <asp:TemplateField HeaderText="Category Sequence" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CategorySequence")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Category Image" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                      <asp:Image ID="cteimage" runat="server" ImageUrl='<%#Eval("CategoryImage").ToString().Replace("~/","../") %>' Width="100px" Height="100px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Icon" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                      <asp:Image ID="cteimages" runat="server" ImageUrl='<%#Eval("CategoryIcon").ToString().Replace("~/","../") %>' Width="100px" Height="100px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                      <asp:TemplateField ItemStyle-CssClass="text-center" HeaderText="Tags">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfCategoryId" runat="server" Value='<%#Eval("CategoryId") %>' />
                                            <!-- Button trigger modal -->


                                            
                                            <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModal<%#Eval("CategoryId") %>">
                                                View
                                            </button>
                                            <div id="myModal<%#Eval("CategoryId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
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
                                                                    <asp:TemplateField HeaderText="Tags Head">
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


                                    


                                 

                                         <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Action" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                              <asp:CheckBox ID="chkIsActive"  runat="server" Checked='<%#Eval("IsActive")%>' ToolTip='<%#Eval("CategoryId")%>'
                                                        OnCheckedChanged="chkIsActive_CheckedChanged" AutoPostBack="true" />
                                 <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("CategoryId")%>' OnClick="lnkEdit_Click">
                                                    <i class="material-icons">border_color</i></asp:LinkButton>
                                           </ItemTemplate>
                                    </asp:TemplateField>
<%--                                                                              <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Delete" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                             <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("CategoryId")%>' OnClick="lnkDelete_Click">
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
                    

                </div> <!-- container-fluid -->
            </div>
            <!-- End Page-content -->


            
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
            

    <!--jquery cdn-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--select2 cdn-->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script src="https://themesbrand.com/velzon/html/galaxy/assets/js/pages/select2.init.js"></script>

    <!-- App js -->
<%--    <script src="https://themesbrand.com/velzon/html/galaxy/assets/js/app.js"></script>--%>

    <script src="https://themesbrand.com/velzon/html/galaxy/assets/js/pages/select2.init.js"></script>
</asp:Content>

