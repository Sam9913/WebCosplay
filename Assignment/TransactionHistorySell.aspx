<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="TransactionHistorySell.aspx.cs" Inherits="Assignment.TransactionHistorySell" %>

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

        .seller_nav td:hover {
            transition-duration: 0.4s;
            background-color: #333;
            color: white;
        }

    .seller_nav_onclick {
        background-color: #333;
        color: white;
    }

 .auto-style1 {
             height: 35px;
              font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
           border-bottom:2px solid black;
            
         }
         .auto-style2 {
             height:10px;
             border-bottom:1px solid black;
         }
   
         </style>
     <div style="margin: 2%; padding: 2%; width: 100%;">
        <h2 style="margin:auto;">Transaction History</h2>
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
        <table style="width:100%; border-collapse:collapse;border-top:2px solid black;">
            
            <tr>
                <td style="padding:10px" class="auto-style1">No</td>
                <td style="padding:10px" class="auto-style1">Date</td>
                <td style="padding:10px" class="auto-style1">Transaction ID</td>
                  <td style="padding:10px;width:150px;" class="auto-style1">Product Name</td>
                <td style="padding:10px" class="auto-style1">Quantity (Sell) </td>
                <td style="padding:10px;" class="auto-style1">Amount (RM)</td>
             </tr>

            
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <%int i=0;%>
                    <asp:Label ID="payID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Pay_ID")%>' style="display:none;"></asp:Label>
                    <asp:Label ID="ProdID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_ID")%>' style="display:none;"></asp:Label>
                          
                    <tr>
                     <td style="padding: 10px" class="auto-style2"><%=i%></td>
                        <td style="padding: 10px" class="auto-style2">11/11/19</td>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Pay_ID], [Trans_ID] FROM [Payment] WHERE ([Pay_ID] = @Pay_ID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="payID" PropertyName="Text" Name="Pay_ID" Type="String"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <td style="padding: 10px;width:200px;" class="auto-style2">
                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3" DataKeyField="Pay_ID">
                           <ItemTemplate>
                             <td><asp:Label Text='<%# Eval("Trans_ID") %>' runat="server" ID="Trans_IDLabel"/></td>
                             </ItemTemplate>
                        </asp:DataList>
                        </td>

                        <td style="padding: 10px;width:200px;" class="auto-style2">
                            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                               <td><asp:Label Text='<%# Eval("Prod_Name") %>' runat="server" ID="Prod_NameLabel" /></td>
                               </ItemTemplate>
                        </asp:DataList>
                        </td>

                        <td style="padding:10px;width:200px;text-align:center;" class="auto-style2">
                            <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("Qty") %>' runat="server" ID="QtyLabel"/>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Qty] FROM [Payment_detail] WHERE ([Prod_ID] = @Prod_ID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ProdID" PropertyName="Text" Name="Prod_ID" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="padding: 10px;width:200px;" class="auto-style2"><asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                        <td><asp:Label Text='<%# Eval("Prod_Price","{0:00}") %>' runat="server" ID="Prod_PriceLabel" /></td>
                             </ItemTemplate>
                        </asp:DataList>
                        </td>    

                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Prod_Name], [Prod_Price] FROM [Product] WHERE ([Prod_ID] = @Prod_ID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="prodID" PropertyName="Text" Name="Prod_ID" Type="String"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </tr>
                   
                </ItemTemplate>
            </asp:Repeater>



            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Payment_detail]">
            </asp:SqlDataSource>
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
                window.location.href = "Seller_Profile.aspx";

            else if (id == document.getElementById("myProd").id)
                window.location.href = "Seller_Product.aspx";


        }


    </script>
        </asp:Content>