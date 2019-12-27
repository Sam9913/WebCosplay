<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile="~/Site1.Master" CodeBehind="cartlist.aspx.cs" Inherits="Assignment.cartlist" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style type="text/css">

        .table-space {
            width: 71%;
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

        .productDetail {
            /*width: 50px;*/
            padding-left:15px;
            height: 160px;
            border-bottom:1px solid;
        }
        .auto-style2 {
            width: 166px;
            height: 160px;
            border-bottom:1px solid;
        }
        .productImg {
            /*width: 150px;*/
            height: 160px;
            border-bottom:1px solid;
        }

        .auto-style5 {
            margin-left:5%;
            width: 90%;
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
             background-color:white;
        }

         .addBtn:hover {
            transition-duration: 0.4s;
            background-color: #333;
            color: white;
        }

        .auto-style6 {
            /*width: 175px;*/
        }

        .auto-style7 {
            width: 3px;
            border-bottom:1px solid;
        }

        .auto-style8 {
            height: 35px;
            font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            border-bottom: 2px solid black;
            padding: 10px;
            width: 223px;
        }
        .auto-style9 {
            /*width: 150px;*/
            height: 160px;
            width: 223px;
            border-bottom-style: solid;
            border-bottom-color: inherit;
            border-bottom-width: 1px;
        }
        .auto-style10 {
            width: 223px;
        }


        


 </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <div style="margin: 2%; padding: 2%; width: 98%;">
        <h2 style="margin:auto; font-family: Bahnschrift; font-weight: 700">Cart</h2>
    </div>
         <div class="space1">
        <table class="seller_nav">
             <tr>
                <td onclick="changePage('myProf')" id="myProf" style="cursor:pointer;">My Profile</td>
            </tr>

            <tr>
                <td class="seller_nav_onclick">My Cart</td>
            </tr>

           <tr>
                <td onclick="changePage('myWishlist')" id="myWishlist" style="cursor:pointer;">My Wishlist</td>
            </tr>

            <tr>
                <td onclick="changePage('transCus')" id="transCus" style="cursor:pointer;">Transaction History</td>
            </tr>
        </table>
    </div>
    
    <div class="table-space">
        <div><asp:Button ID="updateCart" runat="server" class="btn addBtn" style="margin-right:-3%;margin-top:-2%; border: 1.5px solid #333; font-weight:500; font-size:15px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;" Text="Update Cart" OnClick="updateCart_Click"/>
       </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
          <div style="float:left; width:78%;margin-top:5.7%">
            <table style="border-bottom:2px solid black; border-top:2px solid black" class="auto-style5">
                <tr>
                <td style="text-align:center;" class="tableheader">Product</td>
                <td style="padding-right:150px;" class="tableheader">Detail</td>
                <td style="padding-left:10px;width:40px;text-align:center;" class="tableheader">Quantity</td>
                <td style="padding-right:22px;" class="tableheader">Price(RM)</td>
                <td style="padding-left:5px;text-align:center;" class="tableheader">Delete</td>
             </tr>
               
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                    <ItemTemplate>
                        <asp:Label ID="prodID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_ID")%>' style="display:none;"></asp:Label>
                        <asp:Label ID="catID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Cat_ID")%>' style="display:none;"></asp:Label>
                        <tr>
                            <div style="margin-left: 10px">
                                    <td class="productDetail" style="width:15%;">
                                     <asp:Image ImageUrl='<%#"~/image/" + Eval("Prod_Image1").ToString() %>' runat="server" ID="Prod_InamgeLabel" Height="150px" Width="150px" style="margin-left:20px" /><%--</td>--%>
                                    <br />
                                </td>

                            <td class="productDetail">
                                <asp:Label Text='<%# Eval("Prod_Price","{0:0.00}") %>' runat="server" ID="Prod_PriceLabel" style="display:none"/><br />
                                <h5>Name: <asp:LinkButton ID="Prod_NameLabel" runat="server" Text='<%# Eval("Prod_Name") %>' OnClick="Prod_NameLabel_Click" style="text-decoration:none; color:black" /></h5>
                                    Details: <asp:Label Text='<%# Eval("Prod_Details") %>' runat="server" ID="Prod_DetailsLabel" /><br />
                                    Size: <asp:Label Text='<%# Eval("Size_Details") %>' runat="server" ID="SizeDetails"/><br />
                                   </td>

                            <td class="auto-style7" style="width:20%;">
                                <table>
                                     <tr>
                                        <td>
                                          <asp:ImageButton ID="ImageButtonMinus" runat="server" ImageUrl="~/image/arrows_minus.svg" Height="28px" Width="25px" Style="margin-top: 10px; margin-left: 20px;" CommandArgument='<%#Container.ItemIndex%>' OnCommand="ImageButtonMinus_Command" /></td>
                                        <td>
                                            <td><asp:Label ID="LabelQty" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Qty")%>' style="margin-left: 5px; margin-top: 10px;"></asp:Label></td>
                                        <td>
                                            <asp:ImageButton ID="ImageButtonPlus" runat="server" ImageUrl="~/image/arrows_plus.svg" Height="28px" Width="25px" Style="margin-top: 10px; margin-left: 5px;" CommandArgument='<%#Container.ItemIndex%>' OnCommand="ImageButtonPlus_Command" /></td>
                                    
                                    </tr>
                                </table>
                                
                            </td>
                            <td style="border-bottom:1px solid;text-align:center">
                               <asp:Label ID="totalPerItem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_Price","{0:0.00}") %>' ></asp:Label></td>
                            <td class="auto-style2" style="border-left: 0.5px solid;width:20%;">
                                <asp:ImageButton ID="deleteProduct" runat="server" Style="margin-left: 30px" ImageUrl="~/image/delete .svg" Height="35px" Width="35px" ToolTip="Delete" OnCommand="deleteProduct_Command" CommandArgument='<%#Container.ItemIndex%>' />
                                <br />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                  
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT CL.Cart_ID,CL.Prod_ID,CL.Qty,P.Prod_Price,P.Prod_Name,P.Prod_Details,P.Prod_Image1,P.Cat_ID,S.Size_Details from Cartlist CL join Cart C on CL.Cart_ID=C.Cart_ID 
                    join Customer CU on C.Cust_ID=CU.Cust_ID join Product P on CL.Prod_ID=P.Prod_ID join Size S on CL.Size_ID=S.Size_ID where CU.Cust_userName=@customerName">
                    <SelectParameters>
                        <asp:CookieParameter CookieName="customerName" Name="customerName"></asp:CookieParameter>

                    </SelectParameters>
                </asp:SqlDataSource>
                   
                
            </table>
            <br />
            <br />
              </ContentTemplate>
        </asp:UpdatePanel>
            </div>

    <div style="float:right;border:1px solid;margin-right:-6%;margin-top:1%;">
       <table>
          
           <tr><td style="padding:10px;" class="auto-style6"><h3 style="font-size:20px;">Order Summary</h3></td></tr>
          <tr>
               <td style="padding:10px;" class="auto-style6">Subtotal </td>
               <td style="padding:10px; text-align:left">RM <asp:Label  runat="server" ID="subTotalPrice" Text=""/></td>
           </tr>

           <tr>
               <td style="padding:10px;" class="auto-style6">Shipping Fee</td>
            <td style="padding:10px;text-align:left">RM<asp:Label ID="shippingfee" runat="server" Text="3.80"></asp:Label></td> 
           </tr>

           <tr>
               <td style="padding:10px;" class="auto-style6">Total</td>
               <td style="padding:10px;text-align:left">RM<asp:Label ID="totalAmount" runat="server" Text=""></asp:Label></td>
           </tr>

         
   </table> 
        <asp:Button ID="ButtonCheckout" runat="server" Text="Checkout" style="border: 1.5px solid #333;font-size:15px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;" class="btn addBtn" OnClick="ButtonCheckout_Click"/>
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

