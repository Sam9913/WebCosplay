<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="cartlist.aspx.cs" Inherits="Assignment.cartlist" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style type="text/css">

        .table-space {
            width: 65%;
            padding-top: 3%;
            padding-right: 5%;
            margin-left: 5%;
            margin-right: 4%;
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

        .auto-style1 {
            width: 592px;
            height: 160px;
            border-bottom:1px solid;
        }
        .auto-style2 {
            width: 166px;
            height: 160px;
            border-bottom:1px solid;
        }
        .auto-style4 {
            width: 200px;
            height: 160px;
        }

        .auto-style5 {
            margin-left:5%;
            width: 80%;
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
            border-collapse:collapse;
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

        .seller_nav td:hover,.link:hover{
            transition-duration: 0.4s;
            background-color: #333;
            color: white;
        }

        .seller_nav_onclick {
            background-color: #333;
            color: white;

        }

        .btn {
            float:right;
            padding: 12px 25px 12px 25px;
            margin-right: 7%;
            margin-bottom: 2%;
        }

        .auto-style6 {
            width: 175px;
        }

        .auto-style7 {
            width: 187px;
            border-bottom:1px solid;
        }


        


 </style>
    <div style="margin: 2%; padding: 2%; width: 100%;">
        <h2 style="margin:auto;">Cart</h2>
    </div>
         <div class="space1">
        <table class="seller_nav">
             <tr>
                <td onclick="changePage('myProf')" id="myProf" style="cursor:pointer;">My Profile</td>
            </tr>

            <tr>
                <td class="seller_nav_onclick">Cart</td>
            </tr>

           <tr>
                <td onclick="changePage('myWishlist')" id="myWishlist" style="cursor:pointer;">Wishlist</td>
            </tr>

            <tr>
                <td onclick="changePage('transCus')" id="transCus" style="cursor:pointer;">Transaction History</td>
            </tr>
        </table>
    </div>

    <asp:Label ID="Label3" runat="server" Text="CA1001" style="display:none;"></asp:Label>
    
    <div class="table-space">
        <div style="float:left; width:75%">
            <table style="border-bottom:2px solid black; border-top:2px solid black" class="auto-style5">
                <tr>
                <td style="text-align:center;width:100px;" class="tableheader">Product</td>
                <td style="padding-left:20px;width:350px" class="tableheader">Detail</td>
                <td style="padding-left:30px;width:50px" class="tableheader">Quantity</td>
                <td style="padding-left:20px" class="tableheader">Delete</td>
             </tr>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <tr>
                            <asp:Label ID="prodID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_ID")%>' style="display:none;"></asp:Label>

                                   <%--retrieve from product--%>
                                 
                                <div style="margin-left: 10px">
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Prod_Name], [Prod_Details], [Prod_Price], [Prod_Image] FROM [Product] WHERE ([Prod_ID] = @Prod_ID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="prodID" PropertyName="Text" Name="Prod_ID" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <td class="auto-style1">
                                     <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                                        <ItemTemplate>
                                           <td class="auto-style4"><asp:Image ImageUrl='<%#"~/image/" + Eval("Prod_Image").ToString() %>' runat="server" ID="Prod_InamgeLabel" Height="150px" Width="150px" style="margin-left:20px"/></td>
                                    <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                
                            </td>

                            <td class="auto-style1">
                                     <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource2">
                                        <ItemTemplate> <td style="font-size:large;"><h3>Name: <asp:Label Text='<%# Eval("Prod_Name") %>' runat="server" ID="Prod_NameLabel" /></h3>
                                    Details: <asp:Label Text='<%# Eval("Prod_Details") %>' runat="server" ID="Prod_DetailsLabel" /><br />
                                    Price: <asp:Label Text='<%# Eval("Prod_Price","{0:00}") %>' runat="server" ID="Prod_PriceLabel" /><br /></td>
                                     </ItemTemplate>
                                    </asp:DataList>
                                
                            </td>

                            <td class="auto-style7">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/arrows_minus.svg" Height="28px" Width="25px" Style="margin-top: 10px; margin-left: 40px;" /></td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Qty")%>' Style="margin-left: 10px; margin-top: 10px;"></asp:Label></td>
                                        <td>
                                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/image/arrows_plus.svg" Height="28px" Width="25px" Style="margin-top: 10px; margin-left: 10px;" /></td>
                                    </tr>
                                </table>
                            </td>

                            <td class="auto-style2" style="border-left: 0.5px dashed">
                                <asp:ImageButton ID="ImageButton1" runat="server" Style="margin-left: 30px" ImageUrl="~/image/delete .svg" Height="35px" Width="35px" ToolTip="Delete" />
                                <br />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Cart_ID], [Prod_ID], [Qty] FROM [Cartlist] WHERE ([Cart_ID] = @Cart_ID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" PropertyName="Text" Name="Cart_ID" Type="String"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </table>
            <br />
            <br />
            </div>
       

    <div style="float:left;border:1px solid;margin-left:-5%;">
       <table>
           <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Cart_Total] FROM [Cart] WHERE ([Cart_ID] = @Cart_ID)">
               <SelectParameters>
                   <asp:ControlParameter ControlID="Label3" PropertyName="Text" Name="Cart_ID" Type="String"></asp:ControlParameter>
               </SelectParameters>
           </asp:SqlDataSource>
           <tr><td style="padding:10px;" class="auto-style6"><h3 style="font-size:20px;">Order Summary</h3></td></tr>
           <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3">
               <ItemTemplate>
                    
           <tr>
               <td style="padding:10px;" class="auto-style6">Subtotal </td>
               <td style="padding:10px; text-align:left">RM <asp:Label Text='<%# Eval("Cart_Total") %>' runat="server" ID="Cart_TotalLabel" /></td>
           </tr>

           <tr>
               <td style="padding:10px;" class="auto-style6">Shipping Fee</td>
            <td style="padding:10px;text-align:left">RM 3.80</td> 
           </tr>

           <tr>
               <td style="padding:10px;" class="auto-style6">Total</td>
               <td style="padding:10px;text-align:left">RM 803.80</td>
           </tr>

               </ItemTemplate>
           </asp:DataList>
   </table> 
        <%--<asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/image/checkout.jfif" style="height:50px;width:100px;float:right;"/>--%>
           <button type="button" id="btn_addProduct" runat="server" class="btn" data-toggle="checkout" data-target="#modal_checkout">Checkout</button>
        </div>
        </div>
        </div>
        <br />
      
          <br />
   
    <br /> 

     <script>

        function changePage(id) {
            if (id == document.getElementById("myProf").id)
                window.location.href = "Customer_Profile.aspx";

            else if (id == document.getElementById("transCus").id)
                window.location.href = "TransactionHistoryCus.aspx";

            else if (id == document.getElementById("myWishlist").id)
                window.location.href = "Wishlist.aspx";


        }


    </script>
  
      </asp:Content> 

