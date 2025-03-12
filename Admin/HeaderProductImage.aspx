<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="HeaderProductImage.aspx.cs" Inherits="Admin_HeaderProductImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                                <h4 class="mb-sm-0">ADD PRODUCT IMAGE</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">CATEGORIES</a></li>
                                        <li class="breadcrumb-item active">ADD PRODUCT IMAGE</li>
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

                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Category Name*</label>
                                                        
                                                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                    </div>
                                                </div>
                                                                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Product Name*</label>
                                                        
                                                        <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control" ></asp:DropDownList>
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

                                                <!--end col-->
                                                <div class="col-lg-12">
                                                    <div class="text-end">
            <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-primary" OnClick="lnkAdd_Click" >Add ProductImage</asp:LinkButton>
                                                        
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
                              <asp:TemplateField HeaderText="Product Name" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("ProductName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Category Image" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                      <asp:Image ID="cteimage" runat="server" ImageUrl='<%#Eval("HProductImagePath").ToString().Replace("~/","../") %>' Width="100px" Height="100px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                         <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Action" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                              <asp:CheckBox ID="chkIsActive"  runat="server" Checked='<%#Eval("IsActive")%>' ToolTip='<%#Eval("HProductImageId")%>'
                                                        OnCheckedChanged="chkIsActive_CheckedChanged" AutoPostBack="true" />
                                 <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("HProductImageId")%>' OnClick="lnkEdit_Click">
                                                    <i class="material-icons">border_color</i></asp:LinkButton>
                                           </ItemTemplate>
                                    </asp:TemplateField>
                                                                              <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Delete" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                             <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("HProductImageId")%>' OnClick="lnkDelete_Click">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

