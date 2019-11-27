<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Seller_Product.aspx.cs" Inherits="CosplayWeb.Seller_Product" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


    <style>

        .space1 {
            width: 20%;
            float: left;
        }

        .space2 {
            width: 80%;
            float: left;
        }

        .seller_nav {
            width: 80%;
            padding-left: 5%;
            padding-right: 5%;
            margin: 0 0 5% 20%;
            border-collapse: collapse;
            font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            
        }

        .seller_nav td {
            padding: 5%;
            border-top: 1px solid #333;
            border-bottom: 1px solid #333;
        }

        .seller_nav td:hover {
            transition-duration: 0.4s;
            background-color: #333;
            color: white;
        }

        .seller_nav_onclick {
            background-color: #333;
            color: white;

        }

        .table-space {
            width: 80%;
            float: right;
            padding-top: 3%;
            padding-left: 5%;
            padding-right: 5%;
            margin-left: 5%;
            margin-right: 5%;
            margin-bottom: 5%;
            min-width: 950px;
            height: auto; 
            padding-bottom:5%;

            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }

        .seller_table  {
            width: 100%;
            padding-left: 5%;
            padding-right: 5%;
            border-collapse: collapse;
        }
        
        .seller_table_header {
            /*height: 100px;*/
            font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            
        }

        .seller_table th {
            padding: 2% 2% 2% 2%;
            border-bottom: 2px solid black;
            border-top: 2px solid black;
        }

        .seller_table td {
            padding: 2% 2% 2% 2%;
            border-bottom: 1px solid black;
            
        }

        .btn {
            float:right;
            padding: 12px 25px 12px 25px;
            margin-bottom: 4%;
            background-color: white;
        }

        .addBtn:hover {
            transition-duration: 0.4s;
            background-color: #333;
            color: white;
        }

        .left {
            text-align:left;

        }

        .middle {
            text-align:center;
        }



    </style>
    <div style="margin: 2%; padding: 2%; width: 98%;">
        <h2 style="margin:auto; font-family: Bahnschrift; font-weight: 700">My Product</h2>
    </div>
    <div style="min-width: 950px;">
<%--        <div style="width:100%; padding-bottom: 5%;">
            <button type="button" id="btn_addProduct" runat="server" class="btn" data-toggle="modal" data-target="#modal_addProduct">Add Product</button>
        </div>--%>
    <div class="space1">
        <table class="seller_nav">
            <tr>
                <td onclick="changePage('myProf')" id="myProf" style="cursor:pointer;">My Profile</td>
            </tr>

            <tr>
                <td class="seller_nav_onclick">My Product</td>
            </tr>

            <tr>
                <td onclick="changePage('transHis')" id="transHis" style="cursor:pointer;">Transaction History</td>
            </tr>
        </table>
    </div>

    <div class="space2">
        <div class="table-space">

            <button type="button" id="editBtn" runat="server" class="btn addBtn" style="border: 1.5px solid #333; font-weight:500; font-size:15px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">Edit Product</button>
            <button type="button" id="addBtn" runat="server" class="btn addBtn" style="margin-right:5%; border: 1.5px solid #333; font-weight:500; font-size:15px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;" data-toggle="modal" data-target="#modal_addProduct">Add Product</button>

            <table class="seller_table">
                <tr class="seller_table_header">
                    <th class="left" style="width:25%;">
                        <asp:Label ID="lbl_prod" runat="server" Text="Product" Width="140px"></asp:Label>
                    </th>
                    <th class="left" style="width:45%;">
                        <asp:Label ID="lbl_details" runat="server" Text="Details"></asp:Label> 

                    </th>
                    <th class="middle" style="width:15%;">
                        <asp:Label ID="lbl_stockCount" runat="server" Text="Stock Count"></asp:Label>
                    </th>
                    <th class="middle" style="width:15%;">
                        <asp:Label ID="lbl_status" runat="server" Text="Status" Width="100px"></asp:Label>
                    </th>
                </tr>
            </table>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>

            <table class="seller_table">
                <tr>
                    <td style="width:25%;">
                        <asp:Image ID="Image1" runat="server" Height="124px" Width="116px" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image").ToString() %>' />
                    </td>
                    <td style="width:45%;">
                        <%#DataBinder.Eval(Container.DataItem,"Prod_ID") %><br />
                        <%#DataBinder.Eval(Container.DataItem,"Prod_Name") %><br />
                        <%#DataBinder.Eval(Container.DataItem,"Prod_Details") %><br />
                        <%#DataBinder.Eval(Container.DataItem,"Prod_Price") %><br />
                    </td>
                    <td class="middle" style="width:15%;">
                        <%#DataBinder.Eval(Container.DataItem,"Prod_Count") %><br />
                    </td>
                    <td class="middle" style="width:15%;">
                        <%#DataBinder.Eval(Container.DataItem,"Prod_Status") %><br />
                    </td>
                </tr>
            </table>

                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>


    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Prod_ID], [Prod_Name], [Prod_Price], [Prod_Details], [Prod_Count], [Prod_Rate], [Prod_Image], [Prod_Status], [Prod_Tag], [Seller_ID] FROM [Product] WHERE ([Seller_ID] = @Seller_ID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="SE1001" Name="Seller_ID" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>


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
                            <asp:Label ID="Label1" runat="server" Text="Image"></asp:Label>
                        </th>
                        <td>
                            <asp:Image ID="Image2" runat="server" />
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
                            <asp:Label ID="Label3" runat="server" Text="Product Description"></asp:Label>
                        </th>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="Product Price"></asp:Label>
                        </th>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            <asp:Label ID="Label2" runat="server" Text="Stock Count"></asp:Label>
                        </th>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                </table>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
              <button type="submit" class="btn btn-default" data-dismiss="modal">Add</button>
            </div>
          </div>
      
        </div>
      </div>
  
    </div>

    <script>

        function changePage(id) {
            if (id == document.getElementById("myProf").id)
                window.location.href = "Seller_Profile.aspx";

            else if (id == document.getElementById("transHis").id)
                window.location.href = "TransactionHistorySell.aspx";


        }


    </script>
   

</asp:Content>



