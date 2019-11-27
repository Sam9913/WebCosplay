<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Seller_Gallery.aspx.cs" Inherits="CosplayWeb.Seller_Gallery" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


    <style>

        .space {
            width: 80%;
            margin-left: 10%;
            margin-right: 10%;
            position:center;
        }

        .gallery {
            padding: 0.4%;
            padding-right: 0;
            margin-bottom: 2%;
        }





    </style>
    <div style="margin: 2%; padding: 2%; width: 98%;">
        <h2 style="margin:auto; font-family: Bahnschrift; font-weight: 700">Gallery</h2>
    </div>

    <div style="min-width: 950px;">

        <div class="space">

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <asp:Image ID="Image1" CssClass="gallery" Height="300px" Width="260px" ImageUrl='<%#"~/image/" + Eval("Gallery_Image").ToString() %>' runat="server" />
                </ItemTemplate>
            </asp:Repeater>

<%--            <div class="gallery">
                <asp:Image ID="Image2" ImageUrl="~/image/2.jpg" runat="server" />
            </div>
            <div class="gallery">
                <asp:Image ID="Image3" ImageUrl="~/image/3.jpg" runat="server" />
            </div>
            <div class="gallery">
                <asp:Image ID="Image4" ImageUrl="~/image/1.jpg" runat="server" />
            </div>--%>
        </div>

    </div>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Gallery] ORDER BY [Gallery_Date] DESC"></asp:SqlDataSource>



    <div class="container">
      <!-- Modal -->
      <div class="modal fade" id="modal_addProduct" role="dialog" >
        <div class="modal-dialog" style="width:60%">
    
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Add Product</h4>
            </div>

            <div class="modal-body">
                <table class="table_addProd">
                    <tr>
                        <th>
                            <asp:Label ID="lbl_addProd_id" runat="server" Text="Product ID"></asp:Label>
                        </th>
                        <td>
                            <asp:Label ID="res_addProd_id" runat="server" Text="Auto-generate prod ID"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <asp:Label ID="Label1" runat="server" Text="Product ID"></asp:Label>
                        </th>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Auto-generate prod ID"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <asp:Label ID="lbl_addProd_name" runat="server" Text="Name"></asp:Label>
                        </th>
                        <td>
                            <asp:TextBox ID="tbx_addProd_name" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <asp:Label ID="Label3" runat="server" Text="Product ID"></asp:Label>
                        </th>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Auto-generate prod ID"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="Product ID"></asp:Label>
                        </th>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Auto-generate prod ID"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
      
        </div>
      </div>
  
    </div>


</asp:Content>







