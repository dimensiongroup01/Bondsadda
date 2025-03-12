<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ImportStaggeredProduct.aspx.cs" Inherits="Admin_ImportStaggeredProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        a#ContentPlaceHolder1_lnkAdd {
    margin-top: 25px;
}
        .btn-info {
    background-color: #3ea412;
    border-color: #3ea412;
    color: #fff;
    cursor: pointer;
    -webkit-transition: all ease-in 0.3s;
    transition: all ease-in 0.3s;
}

    .btn-info:hover {
        background-color: #7053a4;
        border-color: #7053a4;
    }

    .btn-info:active {
        background-color: #008697 !important;
        border-color: #008697;
        -webkit-box-shadow: none;
        box-shadow: none;
        color: #fff;
    }

    .btn-info:focus {
        -webkit-box-shadow: none;
        box-shadow: none;
        color: #fff;
        background-color: #08e3ff;
    }

    .btn-info.disabled {
        background-color: rgba(0, 188, 212, 0.5);
        border-color: rgba(0, 188, 212, 0.5);
    }
    input#ContentPlaceHolder1_btnImport {
    margin-top: 10px;
}
    .card.a {
    width: 75%;
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
                                <h4 class="mb-sm-0">STAGGERED PRODUCT IMPORT</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">STAGGERED PRODUCT IMPORT</a></li>
                                        <li class="breadcrumb-item active">STAGGERED PRODUCT IMPORT</li>
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
                              
                                <a style="margin-left: 90%" href="Book1.xlsx" runat="server" target="_blank" alt="Semple xsl Sheet">
                                   
                                    <i class="material-icons" style="margin-top:10px">sim_card_download_outlined</i>
                                </a>
                              
                              
                            </div>
                                <div class="card-body">
                                    <div class="live-preview">
                                        <div action="javascript:void(0);">
                                            <div class="row">
                                                <div class="card a">
                                                   
                                                <div class="col-md-12">
                                                    <div class="mb-3">
<div class="btn btn-file">
                                            <asp:Label ID="lblExcelStatus" runat="server" CssClass="form-label" Style="font-size:15px" Text="Select Excel"></asp:Label>
                                            <asp:FileUpload ID="fileExcel" runat="server" CssClass="form-control btn-info" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" />
                                            <progress id="excelProgress" style="display: none"></progress>
                                            <asp:HiddenField ID="hfExcelPath" runat="server" />
                                            <asp:HiddenField ID="hfExtension" runat="server" />

                                        </div>
                                                    </div>
                                                </div>

                                              </div>

                                                <!--end col-->
                                                <div class="col-md-2">
                                                    <div class="mb-3">
                                                            <label for="firstNameinput" class="form-label"></label>
                                                <asp:Button runat="server" CssClass="btn btn-primary bth1" ID="btnImport" OnClientClick="DisableButton(this)" OnClick="btnImport_Click" Text="Import" />

                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                            <!--end row-->
                                                   <div  id="alertMsg" runat="server"></div>
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
    <script>
         $(document).ready(function () {
             //$(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-2:+1" });
             //$(".chosen").chosen();
             $('#<% = fileExcel.ClientID %>').change(function () {
                uploadExcel();
            });
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function () {
                $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-1:+100" });
                $('#<% = fileExcel.ClientID %>').change(function () {
                    uploadExcel();
                });
            });
        });

         function uploadExcel() {
             var len = $('#<%= fileExcel.ClientID %>').get(0).files.length;
            if (len > 0) {
                debugger;
                var fileUpload = $('#<% = fileExcel.ClientID %>').get(0);
                var files = fileUpload.files;
                var test = new FormData();
                for (var i = 0; i < files.length; i++) {
                    debugger;
                    test.append(files[i].name, files[i]);
                    const name = files[i].name;
                    const lastDot = name.lastIndexOf('.');

                    const ext = name.substring(lastDot + 1);
                    $('#<%= hfExtension.ClientID %>').val(ext);
                    const fileName = name.substring(0, lastDot);
                }
                $.ajax({
                    url: "../FileUploadDocument.ashx",
                    type: "POST",
                    contentType: false,
                    processData: false,
                    data: test,
                    // dataType: "json",
                    success: function (result) {
                        $('#<%= hfExcelPath.ClientID %>').val(result);
                        $('#<%= lblExcelStatus.ClientID %>').text("Excel file uploaded.");
                        $("#excelProgress").hide();
                    },
                    xhr: function () {
                        var fileXhr = $.ajaxSettings.xhr();
                        if (fileXhr.upload) {
                            $("#excelProgress").show();
                            fileXhr.upload.addEventListener("#excelProgress", function (e) {
                                if (e.lengthComputable) {
                                    $("#excelProgress").attr({
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
       <script type = "text/javascript">
           function DisableButton(btn) {
               $(btn).hide();

           }
       </script>
</asp:Content>

