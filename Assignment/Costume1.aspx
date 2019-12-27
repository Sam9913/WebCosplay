<%@ Page Language="C#" AutoEventWireup="true" ClassName="AutoID" MasterPageFile="~/Site1.Master" CodeBehind="Costume1.aspx.cs" Inherits="Assignment.Costume1" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <style>
        .changeButton, .btnMinus, .btnAdd{
            border:1px solid black; 
            background-color:snow; 
        }

        .changeButton, .changeButton:hover, .onChangeButton{
            padding:1% 2%;
        }

        .changeButton:hover, .onChangeButton, .onMinusButton, .onAddButton , .btnAdd:hover, .btnMinus:hover{
            color:snow;
            border:1px solid snow; 
            background-color:black; 
        }

        .customerImage {
            border-radius: 50%;
            border: 2px solid white;
        }

        .star1:hover ~ .star2, .star1:hover ~ .star3,.star1:hover ~ .star4,
        .star1:hover ~.star5, .star2:hover ~ .star3, .star2:hover ~ .star4,
        .star2:hover ~ .star5, .star3:hover ~ .star4, .star3:hover ~ .star5,
        .star3:hover ~ .star4, .star3:hover ~ .star5, .star4:hover ~ .star5{
            -webkit-text-stroke-width: 1px;
            -webkit-text-stroke-color: #FAE842;
            -webkit-text-fill-color: white;
        }

        .fa-star, .checked{
            -webkit-text-stroke-color: #F7DC10;
            -webkit-text-fill-color: #F7DC10;
        }

        .not-checked{
            -webkit-text-stroke-width: 1px;
            -webkit-text-stroke-color: #FAE842;
            -webkit-text-fill-color: white;
        }

    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT  SUM([SizeDetails].[Prod_Count]) AS Total_Prod, [Prod_Image1], [Prod_Image2], [Prod_Image3], [Prod_Name], [Prod_Price], [Prod_Details], [Product].[Prod_ID], [Prod_Status]
FROM [Product] 
JOIN [SizeDetails] 
ON [Product].[Prod_ID] = [SizeDetails].[Prod_ID] 
JOIN [Size]
ON [Size].[Size_ID] = [SizeDetails].[Size_ID] 
WHERE ([Product].[Prod_ID] = @Prod_ID)
GROUP BY [Prod_Image1], [Prod_Image2], [Prod_Image3], [Prod_Name], [Prod_Price], [Prod_Details] , [Product].[Prod_ID], [Prod_Status]">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="productID" Name="Prod_ID" Type="String"></asp:QueryStringParameter>

        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT S.Size_Details from Size S join SizeDetails SD on SD.Size_ID=S.Size_ID where SD.Prod_ID=@productID
">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="productID" Name="productID"></asp:QueryStringParameter>

        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DataList ID="DataList1" runat="server" DataKeyField="Prod_ID" DataSourceID="SqlDataSource1" style="width: 85%; margin-top: -12%; margin-left:15%;">
        <ItemTemplate> 
            <td style="width: 160px; float: right; margin-top: 60%;">
                <asp:ImageButton ID="Image2" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image1").ToString()%>' Width="150px" OnClick="Image_Click"/>
                <br /><br />
                <asp:ImageButton ID="Image3" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image2").ToString()%>' Width="150px" OnClick="Image_Click"/>
                <br /><br />
                <asp:ImageButton ID="Image4" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image3").ToString()%>' Width="150px" OnClick="Image_Click"/>
            </td>
            <td style="width: 320px; margin-top: 0;">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image1").ToString()%>' Width="80%"/><br />
            </td>
            <td >
                <br /><br />
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Prod_Name") %>' /><br />
                RM<asp:Label ID="Label2" runat="server" Text='<%# Eval("Prod_Price","{0:0.00}") %>' />
                <br /><br />
                <u><strong>Details</strong></u><br />
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Prod_Details") %>' /><br />
                <b><asp:Label Text='<%# Eval("Prod_Status") %>' runat="server" ID="Prod_StatusLabel" /></b><br />
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Total_Prod") %>' /> item left<br />
                <br />
                <%if (Session["Cat_ID"].Equals("C1001") || Session["Cat_ID"].Equals("C1003") || Session["Cat_ID"].Equals("C1004"))
                    { %>
                <asp:Label ID="sizeLabel" Text="Size :" runat="server"></asp:Label><br />
                
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <asp:Button ID="ButtonSize" runat="server" Text='<%# Eval("Size_Details") %>' CssClass="changeButton" OnCommand="ButtonSize_Command" CommandArgument='<%#Container.ItemIndex%>'/>
                    </ItemTemplate>
                </asp:Repeater>
                <%} %>
                <br /><br />
                <asp:Label ID="prodCount" runat="server"></asp:Label><br />
                Quantity : 
                <div style="display:inline;">
                    <asp:ImageButton CssClass="btnMinus" ID="minus" runat="server" ImageUrl="~/image/minus_black.png" OnClick="minus_Click" onmouseover="this.src='/image/minus_white.png'" onmouseout="this.src='/image/minus_black.png'"/>
                </div>
                <asp:TextBox ID="txtQty" runat="server" Width="3%" style="padding-top:1%; padding-left:1%; padding-right:1%; " Text="0"></asp:TextBox>
                <div style="display:inline;">
                    <asp:ImageButton CssClass="btnAdd" ID="add" runat="server" ImageUrl="~/image/add_black.png" OnClick="add_Click" onmouseover="this.src='/image/add_white.png'" onmouseout="this.src='/image/add_black.png'"/>
                </div><br />
                <asp:Button ID="cartButton" runat="server" Text="Add to Cart" OnClick="cartButton_Click"/>
                <asp:ImageButton ID="wishButton" runat="server" ImageUrl="~/image/wish_blank.svg" OnClick="wishButton_Click" style="padding-top:1%;"/>
            </td>
        </ItemTemplate>
    </asp:DataList>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <div style="margin-left:10%; margin-right:10%; padding-bottom:2.5%;">
        <h3>Rating</h3>
        <hr />
        <div class="star-rating">
            <asp:HiddenField ID="hiddenStar" runat="server" Value="5" />
              <asp:LinkButton ID="starButton1" CssClass="star1 fa fa-star checked" runat="server" style="text-decoration:none;" OnClick="LinkButton1_Click"></asp:LinkButton>
              <asp:LinkButton ID="starButton2" CssClass="star2 fa fa-star checked" runat="server" style="text-decoration:none;" OnClick="LinkButton2_Click"></asp:LinkButton>
              <asp:LinkButton ID="starButton3" CssClass="star3 fa fa-star checked" runat="server" style="text-decoration:none;" OnClick="LinkButton3_Click"></asp:LinkButton>
              <asp:LinkButton ID="starButton4" CssClass="star4 fa fa-star checked" runat="server" style="text-decoration:none;" OnClick="LinkButton4_Click"></asp:LinkButton>
              <asp:LinkButton ID="starButton5" CssClass="star5 fa fa-star checked" runat="server" style="text-decoration:none;" ></asp:LinkButton>
        </div>
        <textarea id="TextArea1" name="TextArea1" cols="150" rows="5" ></textarea>
        <asp:Button ID="commentButton" runat="server" Text="Comment" style="float:right;" OnClick="commentButton_Click"/>
    </div>


    <div style="margin-left:10%; margin-right:10%;">
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3" OnItemDataBound="Repeater2_ItemDataBound">
            <ItemTemplate>
                <asp:Image ID="imageCust" CssClass="customerImage" runat="server" ImageUrl='<%# "~/image/" + DataBinder.Eval(Container.DataItem,"Cust_Image") %>' style="float:left;" Width="10%"/>
                <div style="padding-left:15%; padding-top:4%; padding-bottom:5%;">
                    Rated Star : <asp:Label ID="starLabel" runat="server" Text='<%# Eval("Rate_Star") %>'></asp:Label>&emsp;
                    <asp:Label CssClass="fa fa-star" ID="star1" runat="server"></asp:Label>
                    <asp:Label CssClass="fa fa-star" ID="star2" runat="server"></asp:Label>
                    <asp:Label CssClass="fa fa-star" ID="star3" runat="server"></asp:Label>
                    <asp:Label CssClass="fa fa-star" ID="star4" runat="server"></asp:Label>
                    <asp:Label CssClass="fa fa-star" ID="star5" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="commentLabel" runat="server" Text='<%# Eval("Rate_Comment") %>'></asp:Label>
                </div>
                <hr />
            </ItemTemplate>
        </asp:Repeater>
    </div>
</ContentTemplate>
        </asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Rating] JOIN [Customer] ON [Customer].[Cust_ID] = [Rating].[Cust_ID] WHERE ([Prod_ID] = @Prod_ID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="productID" Name="Prod_ID" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>