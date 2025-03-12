<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddStaggeredProducts.aspx.cs" Inherits="Admin_AddStaggeredProducts" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
                <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

  <style>
              ul {
            background:#fff;
        }

  </style>
    
    <!-- App Css-->
<%--    <link href="https://themesbrand.com/velzon/html/galaxy/assets/css/app.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="../assets/css/app.min.css" rel="stylesheet" />
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtDateCount').on('input', function () {
                var count = parseInt($(this).val());
                var textBoxContainer = $('#textBoxContainer');
                textBoxContainer.empty();

                for (var i = 0; i < count; i++) {
                    textBoxContainer.append('<input type="text" name="dynamicTextBox" /><br />');
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
   <asp:HiddenField ID ="hfEM" runat="server" />
    <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">ADD STAGGERED PRODUCTS</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">STAGGERED PRODUCTS</a></li>
                                        <li class="breadcrumb-item active">ADD STAGGERED PRODUCTS</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>

                    <asp:Panel ID ="pnlbtncreate" runat="server">
                        <div class="row">
                        <div class="col-md-6">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                             

                                <div class="page-title-right">
                                                                       <ol class="breadcrumb m-0">
                                  
                                  <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary" OnClick="LinkButton1_Click">Create</asp:LinkButton>
                                         
                                                                           </ol>
                                   
                                </div>
                                                                    <asp:DropDownList ID="ddlSecurity" runat="server" CssClass="form-control" style="margin-left:10px"></asp:DropDownList>
                                <asp:TextBox ID="txtISINNumber" runat="server" CssClass="form-control"  placeholder="ISIN Number"></asp:TextBox>
                                                                  <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-primary" style="margin-left:5px;" OnClick="lnkFilter_Click">Filter</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlbtnView" runat="server">
                        <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                             

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                  <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary" OnClick="LinkButton2_Click">View</asp:LinkButton>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    </asp:Panel>
                    

                    <!-- end page title -->
                    <asp:Panel ID ="pnlAdd" runat="server">
                        <asp:Panel ID ="pnlCreate" runat="server">
                            <div class="row">
                        <div class="col-xxl-12">
                            <div class="card">


                                <div class="card-body">
                                    <div class="live-preview">
                                        <div action="javascript:void(0);">
                                            <div class="row">

                                                

                                                

                                                

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Category Name*</label>
                                                         <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control chosen">
                                                             <asp:ListItem Value="" Selected="True">Choose One</asp:ListItem>
                                                          
                                                         </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">ISIN No*</label>
                                           <asp:TextBox ID ="txtISIN" runat="server" class="form-control" placeholder="Enter ISIN No."></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Security*</label>
                                           <asp:TextBox ID ="txtProductName" runat="server" class="form-control" placeholder="Enter Security Name"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">ProductName*</label>
                                           <asp:TextBox ID ="txtProduct" runat="server" class="form-control" placeholder="Enter Product Name"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <%--<div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Image*</label>
                                             <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control"/>
                                                        <progress id="ImagefileProgress" style="display: none"></progress>
                      <asp:HiddenField ID="hfImageFilePath" runat="server" />
                                                       
                                                    </div>
                                                </div>--%>
                                                <%--<div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Security*</label>
                                           <asp:TextBox ID ="txtSecurity" runat="server" class="form-control" placeholder="Enter Security"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>--%>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Coupon Rate*</label>
                                           <asp:TextBox ID ="txtCouponRate" runat="server" class="form-control" placeholder="Enter Coupon Rate"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Credit Rating*</label>
                                               <asp:ListBox ID="ddlCreditRating" runat="server" CssClass="form-control js-example-basic-multiple" SelectionMode="Multiple" style="background:#fff;" ></asp:ListBox>
                                                       
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Rating Agencies*</label>
                                               <asp:ListBox ID="ddlRatingAgencies" runat="server" CssClass="form-control js-example-basic-multiple" SelectionMode="Multiple" >

                                               </asp:ListBox>
                                                       
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">SECURED / UNSECURED*</label>
                                             <asp:TextBox ID="txtsecure" runat="server" CssClass="form-control"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                           <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Put Date</label>
                                           <asp:TextBox ID ="txtPutCallDate" runat="server" class="form-control datepicker"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Call Date</label>
                                           <asp:TextBox ID ="txtCallDate" runat="server" class="form-control datepicker"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Guaranteed By*</label>
                                               <asp:TextBox ID="ddlGuaranteed" runat="server" CssClass="form-control"></asp:TextBox>
                                              <%-- <asp:DropDownList ID="ddlGuaranteed" runat="server" CssClass="form-control">
                                                   <asp:ListItem Value="" Selected="True">Choose one</asp:ListItem>
                                                   <asp:ListItem Value="State Govt.">State Govt.</asp:ListItem>
                                                   <asp:ListItem Value="Central Govt.">Central Govt.</asp:ListItem>
                                               </asp:DropDownList>
                                              --%>         
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Maturity Date*</label>
                                           <asp:TextBox ID ="txtMaturitydate" runat="server" class="form-control datepicker"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                                                         
                                               <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Payment/Frequency*</label>
                                                         <asp:DropDownList ID="ddlFrequency" runat="server" CssClass="form-control chosen">
                                                         </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">IP Date*</label>
        <asp:TextBox ID ="txtIPDate" runat="server" class="form-control datepicker" OnTextChanged="txtIPDate_TextChanged" AutoPostBack="true" placeholder="IP Date"></asp:TextBox>
                                           
                                                        
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">Price*</label>
        <asp:TextBox ID ="txtPrice" runat="server" class="form-control" placeholder="Enter Coupon Rate"></asp:TextBox>
                                           
                                                        
                                                    </div>
                                                </div>
                                       <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">YTC/YIELD SEMI*</label>
        <asp:TextBox ID ="txtYTCYIELD" runat="server" class="form-control" placeholder="Enter YTC/YIELD SEMI"></asp:TextBox>
                                           
                                                        
                                                    </div>
                                                </div>
                                                                                       <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">YTM*</label>
        <asp:TextBox ID ="txtYTM" runat="server" class="form-control" placeholder="Enter YTM"></asp:TextBox>
                                           
                                                        
                                                    </div>
                                                </div>
                                                                                       <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">Face Value For Bond*</label>
        <asp:TextBox ID ="txtFaceValue" runat="server" class="form-control" placeholder="Enter Face Value For Bond"></asp:TextBox>
                                           
                                                        
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">Product Tags</label>
 <asp:ListBox ID="ddlTags" runat="server" CssClass="form-control js-example-basic-multiple" SelectionMode="Multiple" ></asp:ListBox>
                                           
                                                    </div>
                                                </div>
                                                                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">Maturity Type*</label>
        <asp:DropDownList ID ="ddlMaturityType" runat="server" class="form-control" OnSelectedIndexChanged="ddlMaturityType_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="" Selected="True">Choose One</asp:ListItem>
          <%--  <asp:ListItem Value="Bullet">Bullet</asp:ListItem>--%>
            <asp:ListItem Value ="Staggered">Staggered</asp:ListItem>
        </asp:DropDownList>
                                           
                                                        
                                                    </div>
                                                </div>

                                                <div class="col-md-4" runat="server" id="vcreatecount">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">Count Date*</label>
        <asp:TextBox ID ="txtDateCount" runat="server" class="form-control" OnTextChanged="txtDateCount_TextChanged" AutoPostBack="true"></asp:TextBox>
                                           
                                                        
                                                    </div>
                                                </div>
                                               <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">Product Image</label>
                                             <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control"/>
                                                        <progress id="ImagefileProgress" style="display: none"></progress>
                      <asp:HiddenField ID="hfImageFilePath" runat="server" />
                                           
                                                    </div>
                                                </div>
                                              <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">Product File</label>
    <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control"/>
                                                        <progress id="IconfileProgress" style="display: none"></progress>
                      <asp:HiddenField ID="hfIconFilePath" runat="server" />
                                           
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="ForminputState" class="form-label">Memorandum File</label>
    <asp:FileUpload ID="FileUpload3" runat="server" CssClass="form-control"/>
                                                        <progress id="hfMemorandum" style="display: none"></progress>
                      <asp:HiddenField ID="hfMemo" runat="server" />
                                           
                                                    </div>
                                                </div>
                                                
                                                                                                <div class="col-md-12">
                                                
                                                        <label for="firstNameinput" class="form-label">Description</label>
   <CKEditor:CKEditorControl ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Description"></CKEditor:CKEditorControl>

                                                </div>

                                             <div class="col-md-8">
                                             <asp:Repeater ID ="rptTextBox" runat="server">
                               <HeaderTemplate>
          <table id="tblArtigos" class="table table-bordered dataTable text-center">
              <thead class="thead-dark">
                 <tr>
                     <th>Date *</th>
                     <th>Percentage *</th>
                     <th>Remark *</th>
                 </tr>
             </thead>
     </HeaderTemplate>
     <ItemTemplate>
         <tbody>
             <tr>
                 
                 <td>
                     <asp:DropDownList ID="ddlMaturityTypeDate" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlMaturityTypeDate_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                  </td>
                  <td>
                     <asp:TextBox ID="txtPercentage" CssClass="form-control" runat="server"></asp:TextBox>
                  </td>
                 <td>
                                          <asp:TextBox ID="txtRemark" CssClass="form-control" runat="server"></asp:TextBox>
                 </td>
                  
              </tr>
          </tbody>
      </ItemTemplate>
                                                 <FooterTemplate>
          </table>
      </FooterTemplate>
                                                                                                    </asp:Repeater>
                                                 </div>
                                               
                                                
                                                

                                                <!--end col-->
                                                <div class="col-lg-12">
                                                    <div class="text-end">
            <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-primary" OnClick="lnkAdd_Click" >Add Product</asp:LinkButton>
                                                        
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
                        
                    </asp:Panel>
                    
                    <!--end row-->
                    <asp:Panel ID ="pnlView" runat="server">
                        <asp:Panel ID ="pnlCreateView" runat="server">
                            <div class="row">
                        <div class="col-xl-12">
                                                        <asp:LinkButton ID="lnkcheckall" runat="server" CssClass="btn btn-primary" OnClick="lnkcheckall_Click">Check All</asp:LinkButton>
                            <asp:LinkButton ID="lnkdeletecheck" runat="server" CssClass="btn btn-primary" OnClick="lnkdeletecheck_Click"  OnClientClick="return confirm('Are you sure you want delete');">Check Data Delete</asp:LinkButton>

                            <div class="card card-height-100">

                                <!-- end cardheader -->

                                    
                                <div class="card-body">


                                      <div class="table-responsive table-card">
                            
                            <div class="col-md-12" runat="server" id="Div3">
                                <asp:GridView ID="grdData" OnRowDataBound="grdData_RowDataBound" runat="server" CssClass="table table-nowrap table-centered align-middle" HeaderStyle-CssClass="fixedheader" AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-VerticalAlign="Middle" EmptyDataRowStyle-Height="320" CellPadding="4" OnPageIndexChanging="grdData_PageIndexChanging" PageSize="50">
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

                                <asp:TemplateField HeaderText="PUT/CALL Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("PutCallDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Maturity Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("MaturityDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                <asp:TemplateField HeaderText="Guaranteed By" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("GuaranteedBy")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                <asp:TemplateField HeaderText="Maturity Type" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("MaturityType")%>
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
                                    <asp:TemplateField ItemStyle-CssClass="text-center" HeaderText="Staggered Data">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfProductsStag" runat="server" Value='<%#Eval("ProductsId") %>' />
                                            <!-- Button trigger modal -->


                                            
                                            <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myStagger<%#Eval("ProductsId") %>">
                                                View
                                            </button>
                                            <div id="myStagger<%#Eval("ProductsId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="mySpaceLabel">Date and Percentage</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                           <asp:GridView ID="grdStaggeredData" ClientIDMode="Static" runat="server" CssClass="table"
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
                                                                    <asp:TemplateField HeaderText="Date">
                                                                        <ItemTemplate>
                                                                            <%#Eval("MaturityTypeDateValue")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                                                                                                                                                             <asp:TemplateField HeaderText="Percentage">
                                                                        <ItemTemplate>
                                                                            <%#Eval("MaturityTypePercentage")%>%
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

                                         <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Action" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
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

                        
                    </asp:Panel>
                    

                </div> <!-- container-fluid -->
            </div>
            <!-- End Page-content -->


            
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--select2 cdn-->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<%--    <script src="https://themesbrand.com/velzon/html/galaxy/assets/js/pages/select2.init.js"></script>--%>
<script src="../assets/js/pages/select2.init.js"></script>
    <!-- App js -->

            <link href="../dist/chosen/chosen.css" rel="stylesheet" />
    <script src="../dist/chosen/chosen.jquery.js"></script>
    <script src="../dist/chosen/chosen.jquery.min.js"></script>
<%--    <script src="../ckeditor/build-config.js"></script>
    <script src="../ckeditor/config.js"></script>
    <link href="../ckeditor/contents.css" rel="stylesheet" />
    <script src="../ckeditor/styles.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>--%>
    <script>
        $(document).ready(function () {
            $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true });


            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function () {
                $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true });

            });

            $(".st_select1").select2({
                placeholder: function () {
                    $(this).data('placeholder');
                },
            });
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function () {
                $(".st_select1").select2({
                    placeholder: function () {
                        $(this).data('placeholder');
                    },
                });
            });
        });
    </script>
<%--    <link href="../assets/dropdown/select.css" rel="stylesheet" />--%>
<%--    <script src="../assets/dropdown/select.js"></script>--%>
     <style>
     .abc {
        border: 5px solid #333;
        border-radius: 14px;
        padding: 10px;
        height: 200px;
     }
      .col-md-12.Header {
        font-size: 20px;
      }
      .mainhead {
        border: 5px solid #333;
        padding: 10px;
        border-radius: 15px;
        height: 350px;
        margin-top: 60px;
}
      .col-md-12.Main {
        font-size: 20px;
      }
.abd img {
    width: 180px;
/*    margin-left: -34px;
    margin-top: 30px;*/
}
      textarea#ContentPlaceHolder1_TextBox1 {
    
    border-radius: 5px;
    height: 90px;
}
      .col-md-2 {
    margin-top: 25px;
}
      .dc {
    font-size: 15px;
    padding: 3px;
}
      .taskview {
    font-size: 25px;
    padding-bottom: 10px;
}
      .updatedetail {
    border: 2px solid rgba(0,0,0,0.08);
    border-radius: 5px;
    padding: 10px;
    height: 115px;
}
      .def {
    font-size: 22px;
}
      .fgh {
    width: 400px;
}
      .align {
    text-align: left;
}

    </style>
    <style>
         .hidden { display: none; }
      .visible { display: block; }
    </style>
         <%--<script>
             const showImageButton = document.getElementById("show-image-button");
             const myImage = document.getElementById("img");
             showImageButton.addEventListener("click", () => {
                 myImage.classList.toggle("visible");
             });
         </script>--%>
     
         <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">

      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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

        <script>
            $(document).ready(function () {
                //$(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-2:+1" });
                //$(".chosen").chosen();
                $('#<% = FileUpload1.ClientID %>').change(function () {
                uploadExcel();
            });
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function () {
                $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-1:+100" });
                $('#<% = FileUpload1.ClientID %>').change(function () {
                uploadExcel();
            });
        });
        });

            function uploadExcel() {
                var len = $('#<%= FileUpload1.ClientID %>').get(0).files.length;
            if (len > 0) {
                debugger;
                var fileUpload = $('#<% = FileUpload1.ClientID %>').get(0);
            var files = fileUpload.files;
            var test = new FormData();
            for (var i = 0; i < files.length; i++) {
                debugger;
                test.append(files[i].name, files[i]);
                const name = files[i].name;
                const lastDot = name.lastIndexOf('.');

                const ext = name.substring(lastDot + 1);
                $('#<%= hfImageFilePath.ClientID %>').val(ext);
                const fileName = name.substring(0, lastDot);
            }
            $.ajax({
                url: "../fileUpload.ashx",
                type: "POST",
                contentType: false,
                processData: false,
                data: test,
                // dataType: "json",
                success: function (result) {
                    $('#<%= hfImageFilePath.ClientID %>').val(result);
                   $("#ImagefileProgress").hide();
               },
               xhr: function () {
                   var fileXhr = $.ajaxSettings.xhr();
                   if (fileXhr.upload) {
                       $("#ImagefileProgress").show();
                       fileXhr.upload.addEventListener("#ImagefileProgress", function (e) {
                           if (e.lengthComputable) {
                               $("#ImagefileProgress").attr({
                                   value: e.loaded,
                                   max: e.total
                               });
                           }
                       }, false);
                   }
                   return fileXhr;
               },
               error: function (err) {
                   alert(err.statusText);
               }
           });
                }
            }

        </script>

    <script>
        $(document).ready(function () {
            //$(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-2:+1" });
            //$(".chosen").chosen();
            $('#<% = FileUpload2.ClientID %>').change(function () {
                uploadExcel();
            });
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function () {
                $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-1:+100" });
                $('#<% = FileUpload2.ClientID %>').change(function () {
                uploadExcel();
            });
        });
        });

        function uploadExcel() {
            var len = $('#<%= FileUpload2.ClientID %>').get(0).files.length;
            if (len > 0) {
                debugger;
                var fileUpload = $('#<% = FileUpload2.ClientID %>').get(0);
       var files = fileUpload.files;
       var test = new FormData();
       for (var i = 0; i < files.length; i++) {
           debugger;
           test.append(files[i].name, files[i]);
           const name = files[i].name;
           const lastDot = name.lastIndexOf('.');

           const ext = name.substring(lastDot + 1);
           $('#<%= hfIconFilePath.ClientID %>').val(ext);
           const fileName = name.substring(0, lastDot);
       }
       $.ajax({
           url: "../fileUpload.ashx",
           type: "POST",
           contentType: false,
           processData: false,
           data: test,
           // dataType: "json",
           success: function (result) {
               $('#<%= hfIconFilePath.ClientID %>').val(result);
               $("#IconfileProgress").hide();
           },
           xhr: function () {
               var fileXhr = $.ajaxSettings.xhr();
               if (fileXhr.upload) {
                   $("#IconfileProgress").show();
                   fileXhr.upload.addEventListener("#IconfileProgress", function (e) {
                       if (e.lengthComputable) {
                           $("#IconfileProgress").attr({
                               value: e.loaded,
                               max: e.total
                           });
                       }
                   }, false);
               }
               return fileXhr;
           },
           error: function (err) {
               alert(err.statusText);
           }
       });
            }
        }

    </script>

    <script>
        $(document).ready(function () {
            //$(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-2:+1" });
            //$(".chosen").chosen();
            $('#<% = FileUpload3.ClientID %>').change(function () {
            uploadExcel();
        });
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-1:+100" });
            $('#<% = FileUpload3.ClientID %>').change(function () {
            uploadExcel();
        });
    });
    });

        function uploadExcel() {
            var len = $('#<%= FileUpload3.ClientID %>').get(0).files.length;
    if (len > 0) {
        debugger;
        var fileUpload = $('#<% = FileUpload3.ClientID %>').get(0);
       var files = fileUpload.files;
       var test = new FormData();
       for (var i = 0; i < files.length; i++) {
           debugger;
           test.append(files[i].name, files[i]);
           const name = files[i].name;
           const lastDot = name.lastIndexOf('.');

           const ext = name.substring(lastDot + 1);
           $('#<%= hfMemo.ClientID %>').val(ext);
           const fileName = name.substring(0, lastDot);
       }
       $.ajax({
           url: "../fileUpload.ashx",
           type: "POST",
           contentType: false,
           processData: false,
           data: test,
           // dataType: "json",
           success: function (result) {
               $('#<%= hfMemo.ClientID %>').val(result);
               $("#MemorandumFile").hide();
           },
           xhr: function () {
               var fileXhr = $.ajaxSettings.xhr();
               if (fileXhr.upload) {
                   $("#MemorandumFile").show();
                   fileXhr.upload.addEventListener("#MemorandumFile", function (e) {
                       if (e.lengthComputable) {
                           $("#MemorandumFile").attr({
                               value: e.loaded,
                               max: e.total
                           });
                       }
                   }, false);
               }
               return fileXhr;
           },
           error: function (err) {
               alert(err.statusText);
           }
       });
            }
        }

    </script>

</asp:Content>

