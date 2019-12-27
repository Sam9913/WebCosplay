<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="TransactionHistorySell.aspx.cs" Inherits="Assignment.TransactionHistorySell" %>

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
    .seller_table_header td{
            /*height: 100px;*/
            font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            
        }

 .auto-style1 {
             font-weight: bold;
             height: 35px;
              font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
             border-bottom:2px solid black;
                 padding: 2% 2% 2% 2%;
            
         }
         .auto-style2 {
             height:10px;
             border-bottom:1px solid black;
         }

         .ddlMonth{
             margin-right: 5%;
             margin-bottom: 4%;
             padding: 12px 25px 12px 25px;
             border-radius:4px;
             background-color:white;
             border: 1.5px solid #333; 
             font-weight:500; 
             font-size:15px; 
             float:right;
             font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
         }
   
         </style>
     <div style="margin: 2%; padding: 2%; width: 98%;">
        <h2 style="margin:auto; font-family: Bahnschrift; font-weight: 700">Transaction History</h2>
    </div>

        <div>
         <div class="space1">
       <table class="seller_nav">
            <tr>
                <td onclick="changePage('myProf')" id="myProf" style="cursor:pointer;">My Profile</td>
            </tr>

            <tr>
                <td onclick="changePage('myProd')" id="myProd" style="cursor:pointer;">My Product</td>
            </tr>

            <tr>
                <td class="seller_nav_onclick">Transaction History</td>
            </tr>
        </table>
    </div>
    
     <div style=" width: 80%;float: left;">
    <div class="table-space">
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Month(Pay_Date) AS Month ,datename(month, Pay_Date) AS monthN from Payment Order by Month
"></asp:SqlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="ddlMonth" DataSourceID="SqlDataSource2" DataValueField="month" DataTextField="monthN" AutoPostBack="true"></asp:DropDownList></div>
        

        <table style="width:100%; border-collapse:collapse;border-top:2px solid black;">
            <tr class="seller_table_header">
                <td class="auto-style1">No</td>
                <td style="padding:10px;padding-left:50px;" class="auto-style1">Date</td>
                  <td style="padding:10px;width:150px;" class="auto-style1">Product Name</td>
                 <td style="padding:10px" class="auto-style1">Size </td>
                <td style="padding:10px" class="auto-style1">Quantity<br /> &nbsp;(Sell) </td>
                <td style="padding:10px;" class="auto-style1">Amount (RM)</td>
             </tr>

            
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <tr style="height:55px;">
                        <td style="padding: 10px;padding-left:20px;" class="auto-style2">
                            <asp:Label ID="count" runat="server"></asp:Label></td>

                        <td style="padding: 13px; width: 200px; text-align: center;" class="auto-style2">
                            <asp:Label Text='<%# Eval("Pay_Date","{0:dd/MM/yyyy}") %>' runat="server" ID="QtyLabel" />
                        </td>

                        <td style="padding: 13px; width: 200px;" class="auto-style2">
                            <asp:Label Text='<%# Eval("Prod_Name") %>' runat="server" ID="Prod_NameLabel" /></td>

                        <td style="padding: 13px; width: 200px;padding-left:20px;" class="auto-style2">
                            <asp:Label Text='<%# Eval("Size_Details") %>' runat="server" ID="Label2" /></td>

                        <td style="padding: 13px; width: 200px; padding-left:40px;" class="auto-style2">
                            <asp:Label Text='<%# Eval("totalcount") %>' runat="server" ID="Label1" /></td>

                        <td style="padding: 13px; width: 200px;" class="auto-style2">
                            <asp:Label Text='<%# Eval("totalSell","{0:0.00}") %>' runat="server" ID="Prod_PriceLabel" /></td>
                    </tr>

                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT PA.Pay_Date,P.Prod_Name,SI.Size_Details,SUM(PD.Qty) AS totalcount,(P.Prod_Price * SUM(PD.Qty)) AS totalSell from Payment_Detail PD,Product P,Size SI,Seller S,Payment PA where P.Seller_ID=S.Seller_ID  and P.Prod_ID=PD.Prod_ID and SI.Size_ID=PD.Size_ID and PA.Pay_ID=PD.Pay_ID and S.Seller_UserName=@sellername and MONTH(PA.Pay_Date)=@month
group by P.Prod_Name,SI.Size_Details,PA.Pay_Date,P.Prod_Price
">
                <SelectParameters>
                    <asp:CookieParameter CookieName="sellerName" Name="sellername"></asp:CookieParameter>
                    <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="month"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </table>
        <br />
        <br />
         <div style="margin-top:25%"></div>
          </ContentTemplate>  
        </asp:UpdatePanel>
        </div>
                </div>
        </div>

    <script>

        function changePage(id) {
            if (id == document.getElementById("myProf").id)
                window.location.href = "Seller_Profile.aspx";

            else if (id == document.getElementById("myProd").id)
                window.location.href = "Seller_Product.aspx";


        }


    </script>
        </asp:Content>