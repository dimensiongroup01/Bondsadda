<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="UserManagement.aspx.cs" Inherits="Admin_UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>

                        <ContentTemplate>
    <div class="main-content">
        <asp:HiddenField ID ="hfUserId" runat="server" />
            <div class="page-content">
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">ADD USERS</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">USERS</a></li>
                                        <li class="breadcrumb-item active">ADD USERS</li>
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
                                                        <label for="firstNameinput" class="form-label">FullName*</label>
                                                        <asp:TextBox ID ="txtFullName" runat="server"  type="text" class="form-control" placeholder="Enter FullName"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Email*</label>
                                           <asp:TextBox ID ="txtEmail" runat="server" class="form-control" placeholder="Enter Email"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>

                                                                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Mobile*</label>
                                           <asp:TextBox ID ="txtMobile" runat="server"  type="number" class="form-control" placeholder="Enter Mobile"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>

                                         <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">UserName*</label>
                                           <asp:TextBox ID ="txtUserName" runat="server"  type="text" class="form-control" placeholder="Enter UserName"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                  

                                               
                                                <!--end col-->
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">Password*</label>
        <asp:TextBox ID ="txtPassword" runat="server" class="form-control" placeholder="Enter Password"></asp:TextBox>
                                           
                                                        
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Image</label>
                                             <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control"/>
                                                        <progress id="ImagefileProgress" style="display: none"></progress>
                      <asp:HiddenField ID="hfImageFilePath" runat="server" />
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">RM</label>
                                                           <asp:CheckBox ID="chkRM" runat="server" CssClass="form-control" />
                                           
                                                        
                                                    </div>
                                                </div>

                                            <%--<div class="col-md-6">
                                                <div class="mb-3">
                                                 <label for="ForminputState" class="form-label">Role*</label>
            <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control chosen">
                <asp:ListItem Value="" Selected="True">Choose One</asp:ListItem>
                <asp:ListItem Value="Admin Panel">Admin</asp:ListItem>
                <asp:ListItem Value="User">User</asp:ListItem>
            </asp:DropDownList>
                                           
                                                        
                                                    </div>
                                                </div>--%>


                                                <!--end col-->
                                                <div class="col-lg-12">
                                                    <div class="text-end">
            <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-primary" OnClick="lnkAdd_Click" >Add User</asp:LinkButton>
                                                        
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
                    <!--end row-->
                        </asp:Panel>
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
                                    
                                     
                                 
                                    <asp:TemplateField HeaderText="FullName" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FullName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("Email")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Mobile" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("Mobile")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="UserName" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("UserName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    

                                    <asp:TemplateField HeaderText="Password" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("Password")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Image" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                      <asp:Image ID="cteimages" runat="server" ImageUrl='<%#Eval("Image").ToString().Replace("~/","../") %>' Width="100px" Height="100px" onerror="this.onload = null; this.src='../Signup/img/avtar.jpg';" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="RM" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#Eval("RM") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 

                                       <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Action" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                              <asp:CheckBox ID="chkIsActive"  runat="server" Checked='<%#Eval("IsActive")%>' ToolTip='<%#Eval("UserId")%>'
                                                        OnCheckedChanged="chkIsActive_CheckedChanged" AutoPostBack="true" />
                                 <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("UserId")%>' OnClick="lnkEdit_Click">
                                                    <i class="material-icons">border_color</i></asp:LinkButton>
                                               </ItemTemplate>
                                    </asp:TemplateField>
                                                                            <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Delete" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                             <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("UserId")%>' OnClick="lnkDelete_Click">
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
    <script>
        function ShowDefaultImage(img) {
            img.src = "../Signup/img/avtar.jpg";
        }
    </script>
</asp:Content>

