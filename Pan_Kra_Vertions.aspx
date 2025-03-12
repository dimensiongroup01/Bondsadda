<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Pan_Kra_Vertions.aspx.cs" Inherits="Pan_Kra_Verifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" EnableCdn="true" runat="server"></asp:ScriptManager>
 <asp:UpdatePanel ID ="uPanel" runat="server">
     <ContentTemplate>

         
         <asp:Panel ID ="pnlView" runat="server">
             <div class="section kyc-box py-md-5 py-4">
         <div class="container">
             <div class="row">
                 <div class="col-12 ">
                     
                     <div class="info-box py-md-5 py-5 ">
                         <div class="row">
                             
                                     <div class="col-md-6" runat="server">
                                 <div class="p-md-5">
                                     <div class="form-group">
                                       <label class="font_1" runat="server" for="exampleFormControlInput1 ">PAN Number </label>
                  <asp:TextBox ID="txtPanNumber" runat="server"  style="text-transform:uppercase" class="form-control">                       
                  </asp:TextBox>
                                      </div>


             <asp:LinkButton ID ="SubmitButton" runat="server" class="btn btn1" OnClick="SubmitButton_Click">Submit</asp:LinkButton>
                             </div>
                         </div>
                             
                             <div class="col-md-6 p-md-5 align-items-center d-flex">
                            
                                  <h3 class="font-weight-normal"><asp:Label ID="lbl" runat="server"></asp:Label></h3>                        
                                  <h3 class="font-weight-normal"><asp:Label ID="lblPanNumber" runat="server"></asp:Label></h3>                        
                                  <h3 class="font-weight-normal"><asp:Label ID="lblpankrastatus" runat="server"></asp:Label></h3>                        
                                  <h3 class="font-weight-normal"><asp:Label ID="lblkrastatus" runat="server"></asp:Label></h3>                        
                                  <h3 class="font-weight-normal"><asp:Label ID="lblkradescription" runat="server"></asp:Label></h3>                        
                                  <h3 class="font-weight-normal"><asp:Label ID="lblkraagency" runat="server"></asp:Label></h3>                        
                        </div>
                             
                             
                             
                     </div>
                 </div>
             </div>
         </div>
     </div>
             </div>
         </asp:Panel>
         
     </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

