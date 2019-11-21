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
           
            
         }
         .auto-style2 {
             height:8px;
             border-bottom:1px solid black;
         }
   
         .auto-style3 {
        height: 35px;
         font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            
    }
   
         </style>
    
        <div>
         <asp:Label ID="transID" runat="server" Text="T0001" style="display:none;"></asp:Label>
          <div style="margin: 2%; padding: 2%; width: 100%;">
        <h2 style="margin:auto;">Customer Transaction History</h2>
    </div>

         <div class="space1">
       <table class="seller_nav">
            <tr>
                <td onclick="changePage('myProf')" id="myProf" style="cursor:pointer;">My Profile</td>
            </tr>

            <tr>
                <td onclick="changePage('myCart')" id="myCart" style="cursor:pointer;">Cart</td>
            </tr>

           <tr>
                <td onclick="changePage('myWishlist')" id="myWishlist" style="cursor:pointer;">Wishlist</td>
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
             </tr>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Pay_ID], [Pay_Type], [Pay_Date], [Pay_Amount], [Trans_ID] FROM [Payment] WHERE ([Trans_ID] = @Trans_ID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="transID" PropertyName="Text" Name="Trans_ID" Type="String"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="Pay_ID" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                         <tr>
                        <td style="padding:10px;width:40px;" class="auto-style2">1.</td>
                        <td style="padding:10px;width:120px;" class="auto-style2">11/11/2019</td>
                        <td style="padding:10px;width:180px;" class="auto-style2"><%# Eval("Trans_ID") %></td>
                        <td style="padding:10px; width:170px" class="auto-style2"><%# Eval("Pay_ID") %></td>
                       <td style="padding:10px;width:250px" class="auto-style2"><%# Eval("Pay_Type") %></td>
                        <td style="padding:10px;width:180px" class="auto-style2"><%# Eval("Pay_Amount","{0:00}") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:DataList>
       

        </table>
        <br />
        <br />
         <div style="margin-top:25%"></div>
        </div>
         </div>
        </div>

     <script>

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