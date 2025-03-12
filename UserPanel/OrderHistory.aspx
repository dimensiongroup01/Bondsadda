<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/MasterPage.master" AutoEventWireup="true" CodeFile="OrderHistory.aspx.cs" Inherits="UserPanel_OrderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                  <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
    <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">ORDER HISTORY</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">ORDER HISTORY</a></li>
                                        <li class="breadcrumb-item active">VIEW ORDER HISTORY</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xxl-12">
                            <div class="card">


                                <div class="card-body">
                                    <div class="live-preview">
                                        <div action="javascript:void(0);">
                                            <div class="row">

                                                

                                                

                                                

                                                <div class="col-md-3">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Category Bond</label>
                                                <asp:DropDownList ID="ddlMobile" runat="server" CssClass="form-control chosen">
                                                    <asp:ListItem Value="" Selected="True">Choose One</asp:ListItem>
                                                    <asp:ListItem Value="">Category1</asp:ListItem>
                                                    <asp:ListItem Value="">Category2</asp:ListItem>
                                                </asp:DropDownList>
                                                    </div>
                                                </div>

                                                

                                                                                                <div class="col-md-2">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">From Date</label>
                                           <asp:TextBox ID ="txtFromDate" runat="server" TextMode="Date" class="form-control datepicker"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>

                                         <div class="col-md-2">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">To Date</label>
                                           <asp:TextBox ID ="txtToDate" runat="server" TextMode="Date" class="form-control datepicker"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                  <div class="col-md-2">
                                                      <div class="mt-4"></div>
                                           <label for="firstNameinput" class="form-label"></label>
                                                     <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-primary" OnClick="lnkFilter_Click" >Filter</asp:LinkButton>
                                                       
                                                    
                                                </div>

                                               


                                                <!--end col-->
                                                
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
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card card-height-100">
                                
                                <!-- end cardheader -->

                                    
                                <div class="card-body">


                                      <div class="table-responsive table-card">
                            
                            <div class="col-md-12" runat="server" id="Div3">
                                <asp:GridView ID="grdData" runat="server" CssClass="table table-nowrap table-centered align-middle" HeaderStyle-CssClass="fixedheader" AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-VerticalAlign="Middle" EmptyDataRowStyle-Height="320">
                                <Columns>

                                    <asp:TemplateField HeaderText="S.N.">
                                        <ItemTemplate>
                                            <strong><%#Container.DataItemIndex+1 %></strong>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                <asp:TemplateField HeaderText="Category Bond" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FullName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 
                                    <asp:TemplateField HeaderText="Product Name" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FullName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    

                                   <asp:TemplateField HeaderText="Price" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("Mobile")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="Address" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("Address")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    
                                 

                                         <%--<asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Action" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                              <asp:CheckBox ID="chkIsActive"  runat="server" Checked='<%#Eval("IsActive")%>' ToolTip='<%#Eval("UserId")%>'
                                                        OnCheckedChanged="chkIsActive_CheckedChanged" AutoPostBack="true" />
                                 <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("UserId")%>' OnClick="lnkEdit_Click">
                                                    <i class="material-icons">border_color</i></asp:LinkButton>
                                           
                                     
                                             <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("UserId")%>' OnClick="lnkDelete_Click">
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
                    </div>
                </div>
        </div>
                            </ContentTemplate>
                            </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

