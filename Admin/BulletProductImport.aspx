<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="BulletProductImport.aspx.cs" Inherits="Admin_BulletProductImport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        a#ContentPlaceHolder1_lnkImport {
    margin-top: 25px;
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
                                <h4 class="mb-sm-0">ADD TAGS</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">TAGS</a></li>
                                        <li class="breadcrumb-item active">ADD TAGS</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end page title -->
                    <asp:Panel ID ="pnlAdd" runat="server">
                        <div class="row">
                        <div class="col-xxl-6">
                            <div class="card">
                                <div class="header">
                                <h2>LEAD IMPORT
                                </h2>
                                <a style="margin-left: 95%" href="sample.xlsx" runat="server" target="_blank" alt="Semple xsl Sheet" id="vpexel">
                                    <i class="material-icons">sim_card_download_outlined</i>
                                </a>
                                 <a style="margin-left: 95%" href="SampleExcelSheet.xlsx" runat="server" target="_blank" alt="Semple xsl Sheet" id="vfexel">
                                    <i class="material-icons">sim_card_download_outlined</i>
                                </a>

                            </div>

                                <div class="card-body">
                                    <div class="live-preview">
                                        <div action="javascript:void(0);">
                                            <div class="row">

                                                

                                                

                                                

                                                <div class="col-md-6">
                                                    <div class="mb-3">

                                                      <div class="col-md-12 col-sm-12 col-xs-12" runat="server" id="vproduct">
                                        <div class="btn btn-file">
                                            <asp:Label ID="lblExcelStatus" runat="server" CssClass="fileinput-new" Text="Select Excel"></asp:Label>
                                            <asp:FileUpload ID="fileExcel" runat="server" CssClass="form-control btn-info"
                                                accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" />
                                            <progress id="excelProgress" style="display: none"></progress>
                                            <asp:HiddenField ID="hfExcelPath" runat="server" />
                                            <asp:HiddenField ID="hfExtension" runat="server" />

                                        </div>
                                        <br />
                                    </div>
                                                    </div>
                                                </div>

                                              

                                                <!--end col-->
                                                <div class="col-md-3">
                                                    <div class="mb-3">
                                                            <label for="firstNameinput" class="form-label"></label>
            <asp:LinkButton ID="lnkImport" runat="server" CssClass="btn btn-primary" OnClick="lnkImport_Click" >Import</asp:LinkButton>
                                                        <br />
                                                                                                        <span>
                                                    <asp:Label ID="lblsubmt" runat="server" Text=""></asp:Label><asp:Label ID="lblaborted" runat="server" Text=""></asp:Label></span>
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
                    
                    

                </div> <!-- container-fluid -->
            </div>
            <!-- End Page-content -->


            
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

