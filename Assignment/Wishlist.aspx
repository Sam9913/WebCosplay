<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Wishlist.aspx.cs" Inherits="Assignment.Wishlist" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style type="text/css">

         .table-space {
            width: 80%;
            padding-top: 3%;
            padding-left: 5%;
            padding-right: 5%;
            margin-left: 7%;
            margin-right: 5%;
            margin-bottom: 5%;
            min-width: 950px;
            height: auto; 
            padding-bottom:5%;
            float:right;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }
                
        .tableheader {
             height: 35px;
              font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
           border-bottom:2px solid black;
           padding:10px;
            
         }

        .productDetail {
            width: 200px;
            height: 160px;
            border-bottom:1px solid;
            padding-left: 30px;
        }
        .CartnDel{
            width: 180px;
            height: 160px;
            border-bottom:1px solid;
        }
        .productImg {
            width: 150px;
            height: 160px;
            border-bottom:1px solid;
        }

        .wishlistTable {
            width: 92%;
        }
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
         .link{
            color:black;
        }
        .seller_nav td:hover,.link:hover {
            transition-duration: 0.4s;
            background-color: #333;
            color: white;
        }

        .seller_nav_onclick {
            background-color: #333;
            color: white;

        }
        td{
            padding-left:10px;
        }
</style>
    <div style="margin: 2%; padding: 2%; width: 98%;">
        <h2 style="margin: auto; font-family: Bahnschrift; font-weight: 700">Wishlist</h2>
    </div>

    <div class="space1">
        <table class="seller_nav">
            <tr>
                <td onclick="changePage('myProf')" id="myProf" style="cursor: pointer;">My Profile</td>
            </tr>

            <tr>
                <td onclick="changePage('myCart')" id="myCart" style="cursor: pointer;">My Cart</td>
            </tr>

            <tr>
                <td class="seller_nav_onclick">My Wishlist</td>
            </tr>

            <tr>
                <td onclick="changePage('transCus')" id="transCus" style="cursor: pointer;">Transaction History</td>
            </tr>
        </table>
    </div>

    <div style="width: 80%; float: left;">
        <div class="table-space">
          

            <table style="border-bottom: 2px solid black; border-top: 2px solid black; width: 100%" class="wishlistTable">
                <tr>
                    <td style="text-align: center" class="tableheader">Product</td>
                    <td style="padding-left: 35px; width: 500px" class="tableheader">Detail</td>
                    <td style="padding-left: 30px; width: 50px" class="tableheader"></td>
                </tr>
               
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

                    <ItemTemplate>
                        <asp:Label ID="prodID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_ID")%>' Style="display: none;"></asp:Label>
                        <asp:Label ID="catID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Cat_ID")%>' Style="display: none;"></asp:Label>
                        <tr>
                            <div style="margin-left: 10px">
                                <td class="productImg">
                                    <asp:Image ImageUrl='<%#"~/image/" + Eval("Prod_Image1").ToString() %>' runat="server" ID="Prod_InamgeLabel" Height="124px" Width="116px" Style="margin-left: 20px" /></td>
                                <td class="productDetail" style="font-size: large;">
                                    <h5>Name:
                                       <asp:LinkButton ID="Prod_NameLabel" runat="server" Text='<%# Eval("Prod_Name") %>' style="text-decoration:none; color:black" OnClick="Prod_NameLabel_Click"></asp:LinkButton></h5>
                                    Details:
                                    <asp:Label Text='<%# Eval("Prod_Details") %>' runat="server" ID="Prod_DetailsLabel" /><br />
                                    Price:
                                    <asp:Label Text='<%# Eval("Prod_Price","{0:0.00}") %>' runat="server" ID="Prod_PriceLabel" /><br />
                                     Size: <asp:Label Text='<%# Eval("Size_Details") %>' runat="server" ID="SizeDetails" /><br />
                                </td>
                            </div>

                            <td class="CartnDel" style="border-left: 0.5px solid">
                                <asp:ImageButton ID="AddToCart" runat="server" Style="margin-left: 30px;" ImageUrl="~/image/cart.svg" Height="35px" Width="35px" ToolTip="Add to Cart" OnCommand="AddToCart_Command" CommandArgument='<%#Container.ItemIndex%>' />
                                <asp:ImageButton ID="Delete" runat="server" Style="margin-left: 30px" ImageUrl="~/image/delete .svg" Height="35px" Width="35px" ToolTip="Delete" OnCommand="Delete_Command" CommandArgument='<%#Container.ItemIndex%>' CommandName="delete"/>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT WL.Wish_ID,WL.Prod_ID,P.Prod_Name,P.Cat_ID,P.Prod_Details,P.Prod_Price,P.Prod_Image1,S.Size_Details from Wishlist_list WL join Wishlist W on WL.Wish_ID=W.Wish_ID join Product P on WL.Prod_ID=P.Prod_ID join Size S on WL.Size_ID=S.Size_ID join Customer CU on W.Cust_ID=CU.Cust_ID where CU.Cust_userName=@customerName">
                    <SelectParameters>
                        <asp:CookieParameter CookieName="customerName" Name="customerName"></asp:CookieParameter>
                    </SelectParameters>
                </asp:SqlDataSource>

            </table>
            <br />
            <br />
        </div>
    </div>

       <script>

        function changePage(id) {
            if (id == document.getElementById("myProf").id)
                window.location.href = "Customer_Profile.aspx";

            else if (id == document.getElementById("myCart").id)
                window.location.href = "cartlist.aspx";

            else if (id == document.getElementById("transCus").id)
                window.location.href = "TransactionHistoryCus.aspx";


        }


    </script>
</asp:Content>

