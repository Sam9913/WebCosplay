<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="TransactionHistoryCus.aspx.cs" Inherits="Assignment.TransactionHistoryCus" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
    
        .table-space {
            width: 70%;
            padding-top: 3%;
            padding-left: 5%;
            padding-right: 5%;
            margin-left: 7%;
            margin-right: 5%;
            margin-bottom: 5%;
            min-width: 950px;
            height: auto; 
            padding-bottom:5%;

            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

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

        .showDetail{
             font-size: 15px;
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
        .seller_nav td:hover ,.link:hover{
            transition-duration: 0.4s;
            background-color: #333;
            color: white;
        }

        .seller_nav_onclick {
            background-color: #333;
            color: white;

        }.auto-style1 {
             height: 35px;
              font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
           border-bottom:2px solid black;
            
         }
         .auto-style2 {
             height:8px;
             border-bottom:1px solid black;
         }
   
         .auto-style3 {
        height: 35px;
         font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            border-bottom:2px solid black;
    }
   .btn-view{
       background: url(image/view1.svg);
          height:25px;
          width:25px;
          border:none;
   }
         </style>
    
        <div>
         <asp:Label ID="transID" runat="server" Text="T0001" style="display:none;"></asp:Label>
          <div style="margin: 2%; padding: 2%; width: 98%;">
        <h2 style="margin:auto; font-family: Bahnschrift; font-weight: 700">Customer Transaction History</h2>
    </div>

         <div class="space1">
       <table class="seller_nav">
            <tr>
                <td onclick="changePage('myProf')" id="myProf" style="cursor:pointer;">My Profile</td>
            </tr>

            <tr>
                <td onclick="changePage('myCart')" id="myCart" style="cursor:pointer;">My Cart</td>
            </tr>

           <tr>
                <td onclick="changePage('myWishlist')" id="myWishlist" style="cursor:pointer;">My Wishlist</td>
            </tr>

            <tr>
                <td class="seller_nav_onclick">Transaction History</td>
            </tr>
        </table>
    </div>
    
     <div style=" width: 80%;float: left;">
    <div class="table-space">
        <table style="width:100%; border-collapse:collapse; border-bottom:2px solid black;border-top:2px solid black;">
            <tr>
                <td style="padding:10px" class="auto-style1">No</td>
                <td style="padding:10px" class="auto-style1">Date</td>
                <td style="padding:10px;" class="auto-style1">Transaction ID</td>
                  <td style="padding:10px" class="auto-style1">Payment ID</td>
                <td style="padding:10px" class="auto-style1">Transaction Type</td>
                <td style="padding:10px;" class="auto-style3">Amount (RM)</td>
                <td style="padding:10px" class="auto-style1"></td>
             </tr>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT T.Trans_ID,P.Pay_Date,P.Pay_ID,P.Pay_Type,P.Pay_Amount,P.Shipping_Adds,P.Shipping_phoneNo from [TRANSACTION] T join Payment P on T.pay_ID=P.Pay_ID join Customer CU on CU.Cust_ID=P.Cust_ID where CU.Cust_UserName=@username 
Order by P.Pay_ID Desc
">
                <SelectParameters>
                    <asp:CookieParameter CookieName="customerName" Name="username"></asp:CookieParameter>

                </SelectParameters>
                </asp:SqlDataSource>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater2_ItemDataBound">
                    <ItemTemplate>
                        <asp:Label ID="payDate" runat="server" Text='<%# Eval("Pay_Date") %>' style="display:none"></asp:Label>
                        <asp:Label ID="payAdds" runat="server" Text='<%# Eval("Shipping_Adds") %>' style="display:none"></asp:Label>
                        <asp:Label ID="payPhone" runat="server" Text='<%# Eval("Shipping_PhoneNo") %>' style="display:none"></asp:Label>
                         <tr>
                        <td style="padding:10px;width:40px;" class="auto-style2" >
                            <asp:Label ID="count" runat="server" ></asp:Label></td>
                        <td style="padding:10px;width:120px;" class="auto-style2">
                            <asp:Label ID="payDate1" runat="server" Text='<%# Eval("Pay_Date","{0:dd/MM/yyyy}") %>'></asp:Label></td>
                             <td style="padding:10px;width:180px;" class="auto-style2">
                                 <asp:Label ID="trans_ID" runat="server" Text='<%# Eval("Trans_ID") %>'></asp:Label></td>
                        <td style="padding:10px; width:170px" class="auto-style2">
                            <asp:Label ID="payID" runat="server" Text='<%# Eval("Pay_ID") %>'></asp:Label></td>
                       <td style="padding:10px;width:250px" class="auto-style2"><%# Eval("Pay_Type") %></td>
                        <td style="padding:10px;width:180px" class="auto-style2">
                            <asp:Label ID="amount" runat="server" Text='<%# Eval("Pay_Amount","{0:0.00}") %>'></asp:Label></td>
                           <td class="auto-style2"><asp:Button ID="ViewButton" runat="server" CssClass="btn-view" style="margin-right:5%;" ToolTip="View" CausesValidation="false" OnCommand="ViewButton_Command" CommandArgument='<%#Container.ItemIndex%>' />
                       </td>
                        </tr>
                    </ItemTemplate>
       </asp:Repeater>

        </table>
        <br />
        <br />
         <div style="margin-top:25%"></div>
        </div>
         </div>
        </div>

     <div class="container">
      <!-- Modal -->
      <div class="modal fade" id="modal_showDetail" role="dialog" data-backdrop="static">
        <div class="modal-dialog" style="width:60%">
    
          <!-- Modal content-->
          <div class="modal-content">

            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Details</h4>
            </div>

            <div class="modal-body" style="padding: 25px; margin-left: 10%;">
                <table>
                    <tr style="height:30px;">
                        <td class="showDetail">Transaction ID:</td>
                        <td><asp:Label ID="trans" runat="server"></asp:Label></td>
                        
                    </tr>

                   <tr style="height:30px;">
                        <td class="showDetail">Date:</td>
                        <td><asp:Label ID="date" runat="server"></asp:Label></td>
                    </tr>

                   <tr style="height:30px;">
                        <td style="width:150px;" class="showDetail"> Shipping Address:</td>
                        <td><asp:Label ID="adds1" runat="server"></asp:Label></td>
                    </tr>

                    <tr style="height:30px;">
                        <td class="showDetail"> Phone Number: </td>
                        <td><asp:Label ID="phone1" runat="server"></asp:Label></td>
                    </tr>
                </table>
              
                <br />


                <asp:Label ID="payID" runat="server" style="display:none"></asp:Label>
                <table class="table_showDetail" style="border-bottom:1px solid">
                    <tr style="border-bottom:1px solid">
                        <td>
                            <asp:Label ID="Label1" runat="server" style="padding-left:10px;" class="showDetail">Product</asp:Label></td>
                        <td>
                            <asp:Label ID="Label2" runat="server" class="showDetail">Size</asp:Label></td>
                        <td>
                            <asp:Label ID="Label3" runat="server" class="showDetail">Qty</asp:Label></td>
                        <td>
                            <asp:Label ID="Label5" runat="server" class="showDetail">U\Price(RM)</asp:Label></td>
                        <td>
                            <asp:Label ID="Label4" runat="server" class="showDetail">Amount(RM)</asp:Label></td>
                    </tr>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                        <tr style="height:20px;">
                         <td style="padding:10px;width:180px;"><%# Eval("Prod_Name") %></td>
                        <td style="padding:10px; width:100px"><%# Eval("Size_Details") %></td>
                       <td style="padding:10px;width:100px"><%# Eval("Qty") %></td>
                            <td style="padding:10px;width:150px"><%# Eval("Prod_Price","{0:0.00}") %></td>
                            <td style="padding:10px;width:100px"><%# Eval("num","{0:0.00}") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT PM.Pay_Date,P.Prod_Name,P.Prod_Price,PMD.Qty,S.Size_Details,(PMD.Qty * P.Prod_Price) AS num from Payment PM join Payment_Detail PMD on PMD.Pay_ID=PM.Pay_ID join Product P on P.Prod_ID=PMD.Prod_ID join Size S on S.Size_ID=PMD.Size_ID where PM.Pay_ID=@payID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="payID" PropertyName="Text" Name="payID"></asp:ControlParameter>

                        </SelectParameters>
                    </asp:SqlDataSource>
                </table>
                <br />
                <table style="margin-left:54%;">
                    <tr style="height:35px;">
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Sub Total " style="width:120px;padding-top:10px;"></asp:Label>
                        </td>
                        <td>
                        <asp:Label ID="subtotal" runat="server" Text=""  style="padding:20px;text-align:left;padding-top:10px;"></asp:Label><br />
                        </td>
                    </tr>
                
                    <tr style="height:35px;">
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Shipping Fee " style="width:120px;padding-top:10px;"></asp:Label>

                        </td>
                        <td>
                                <asp:Label ID="shipping" runat="server" Text="RM 3.80"  style="padding:20px;text-align:left;padding-top:10px;"></asp:Label><br />
                        </td>
                    </tr>
               <tr style="height:35px;">

                   <td>
                       <asp:Label ID="Label8" runat="server" Text="Total Amount " style="width:120px;padding-top:10px;"></asp:Label>
                   </td>
                <td>
                <asp:Label ID="amountT" runat="server" style="padding:20px;text-align:left;padding-top:10px;"></asp:Label>
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



     <script>
         function openModal() {
            $('#modal_showDetail').modal('show');
        }


        function changePage(id) {
            if (id == document.getElementById("myProf").id)
                window.location.href = "Customer_Profile.aspx";

            else if (id == document.getElementById("myCart").id)
                window.location.href = "cartlist.aspx";

            else if (id == document.getElementById("myWishlist").id)
                window.location.href = "Wishlist.aspx";


        }


    </script>
        </asp:Content>