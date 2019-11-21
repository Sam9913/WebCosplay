<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Wishlist.aspx.cs" Inherits="Assignment.Wishlist" %>

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
                
 .tableheader {
             height: 35px;
              font-size: 18px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
           border-bottom:2px solid black;
           padding:10px;
            
         }

        .auto-style1 {
            width: 175px;
            height: 160px;
            border-bottom:1px solid;
        }
        .auto-style2 {
            width: 166px;
            height: 160px;
            border-bottom:1px solid;
        }
        .auto-style4 {
            width: 150px;
            height: 160px;
            border-bottom:1px solid;
        }

        .auto-style5 {
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
</style>
    <div style="margin: 2%; padding: 2%; width: 100%;">
        <h2 style="margin:auto;">Wishlist</h2>
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
                <td class="seller_nav_onclick">Wishlist</td>
            </tr>

            <tr>
                <td onclick="changePage('transCus')" id="transCus" style="cursor:pointer;">Transaction History</td>
            </tr>
        </table>
    </div>

    <div style=" width: 80%;float: left;">
    <div class="table-space">
        <%--<div style="float:left; width:70%;margin-left:5%;">--%>
            <asp:Label ID="wishID" runat="server" Text="W1001" style="display:none;"></asp:Label>
        <table style="border-bottom:2px solid black; border-top:2px solid black;width:100%" class="auto-style5">
            <tr>
                <td style="text-align:center" class="tableheader">Product</td>
                <td style="padding-left:20px;width:500px" class="tableheader">Detail</td>
                <td style="padding-left:30px;width:50px" class="tableheader"></td>
               </tr>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <tr>
                          <div style="margin-left: 10px">
                                 <asp:Label ID="prodID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_ID")%>' style="display:none;"></asp:Label>
                                 
                              <td class="auto-style1">
                               <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                                   
                                    <ItemTemplate>
                                              <td class="auto-style4"><asp:Image ImageUrl='<%#"~/image/" + Eval("Prod_Image").ToString() %>' runat="server" ID="Prod_InamgeLabel" Height="150px" Width="150px" style="margin-left:20px"/></td>
                                    <br />
                                    </ItemTemplate>
                                </asp:DataList>
                                  </td>
                              <td class="auto-style1">
                                 <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                                   
                                    <ItemTemplate>
                                <td style="font-size:large;"><h3>Name: <asp:Label Text='<%# Eval("Prod_Name") %>' runat="server" ID="Prod_NameLabel" /></h3>
                                    Details: <asp:Label Text='<%# Eval("Prod_Details") %>' runat="server" ID="Prod_DetailsLabel" /><br />
                                    Price: <asp:Label Text='<%# Eval("Prod_Price") %>' runat="server" ID="Prod_PriceLabel" /><br /></td>

                                         </ItemTemplate>
                                </asp:DataList>
                                  </td>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Prod_Name], [Prod_Price], [Prod_Details], [Prod_Image] FROM [Product] WHERE ([Prod_ID] = @Prod_ID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="prodID" PropertyName="Text" Name="Prod_ID" Type="String"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        

                        <td class="auto-style2" style="border-left: 0.5px dashed">
                            <asp:ImageButton ID="ImageButton2" runat="server" Style="margin-left: 40px;" ImageUrl="~/image/cart.svg" Height="35px" Width="35px" ToolTip="Add to Cart" />
                            <asp:ImageButton ID="ImageButton1" runat="server" Style="margin-left: 30px" ImageUrl="~/image/delete .svg" Height="35px" Width="35px" ToolTip="Delete" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Wish_ID], [Prod_ID] FROM [Wishlist_list] WHERE ([Wish_ID] = @Wish_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="wishID" PropertyName="Text" Name="Wish_ID" Type="String"></asp:ControlParameter>
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

