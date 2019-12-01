<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Costume1.aspx.cs" Inherits="Assignment.Costume1" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <style>
        .changeButton{
            border:1px solid black; 
            background-color:snow; 
            padding:1% 2%;
        }

        .changeButton:hover, .onChangeButton{
            padding:1% 2%;
            color:snow;
            border:1px solid snow; 
            background-color:black; 
        }
    </style>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Product] WHERE ([Prod_ID] = @Prod_ID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="productID" Name="Prod_ID" Type="String"></asp:QueryStringParameter>

        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Size_Details] FROM [Size] WHERE ([Prod_ID] = @Prod_ID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="productID" Name="Prod_ID" Type="String"></asp:QueryStringParameter>

        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DataList ID="DataList1" runat="server" DataKeyField="Prod_ID" DataSourceID="SqlDataSource1" style="width: 100%; margin-top: -12%; margin-left:10%;">
        <ItemTemplate> 
            <td style="width: 160px; float: right; margin-top: 45%;">
                <asp:ImageButton ID="Image2" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image1").ToString()%>' Width="150px" />
                <br /><br />
                <asp:ImageButton ID="Image3" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image1").ToString()%>' Width="150px" />
                <br /><br />
                <asp:ImageButton ID="Image4" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image1").ToString()%>' Width="150px" />
            </td>
            <td style="width: 320px; margin-top: 0;">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image1").ToString()%>' Width="80%"/><br />
            </td>
            <td>
                <br /><br />
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Prod_Name") %>' /><br />
                RM<asp:Label ID="Label2" runat="server" Text='<%# Eval("Prod_Price","{0:0.00}") %>' />
                <br /><br />
                <u><strong>Details</strong></u><br />
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Prod_Details") %>' /><br />
                <b><asp:Label Text='<%# Eval("Prod_Status") %>' runat="server" ID="Prod_StatusLabel" /></b><br />
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Prod_Count") %>' /> item left<br />
                <br />
                <%if (Session["Cat_ID"].Equals("C1001") || Session["Cat_ID"].Equals("C1003") || Session["Cat_ID"].Equals("C1004"))
                    { %>
                <asp:Label ID="sizeLabel" Text="Size :" runat="server"></asp:Label><br />
                <%} %>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Text='<%# Eval("Size_Details") %>' CssClass="changeButton" OnClick="Button1_Click"/>
                    </ItemTemplate>
                </asp:Repeater>
                <br /><br />
                Quantity : <asp:TextBox ID="txtQty" runat="server" Width="3%"></asp:TextBox><br />
                <asp:Button ID="cartButton" runat="server" Text="Add to Cart" OnClick="cartButton_Click"/>
                <asp:ImageButton ID="wishButton" runat="server" ImageUrl="~/image/wish_blank.svg" OnClick="wishButton_Click" />
            </td>
        </ItemTemplate>
    </asp:DataList>

    

    <%--<table style="width: 100%; margin-top: -12%; margin-left:10%;">
        <tr >
            <td style="width: 160px; float: right; margin-top: 45%;">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/image/narutoCostume.jpg" Width="150px" /><br />
                <br />
                <asp:Image ID="Image3" runat="server" ImageUrl="~/image/narutoCostume.jpg" Width="150px" /><br />
                <br />
                <asp:Image ID="Image4" runat="server" ImageUrl="~/image/narutoCostume.jpg" Width="150px" />
            </td>
            <td style="width: 320px; margin-top: 0;">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/image/narutoCostume.jpg" Width="80%"/><br />
            </td>
            <td>
                <br />
                <br />
                Costume 1<br />
                RM200.00<br />
                <br />
                <u><strong>Details</strong></u><br />
                On Stock<br />
                1 item left<br />
                <br />
                Size:<br />
                <asp:Button ID="Button1" runat="server" Text="S" CssClass="changeButton" OnClick="Button1_Click"/>
                <asp:Button ID="Button2" runat="server" Text="M" CssClass="changeButton" OnClick="Button2_Click"/>
                <asp:Button ID="Button3" runat="server" Text="L" CssClass="changeButton" OnClick="Button3_Click"/>
                <br />
                <br />
                Quantity : <asp:TextBox ID="txtQty" runat="server" Width="3%"></asp:TextBox><br />
                <asp:Button ID="cartButton" runat="server" Text="Add to Cart" OnClick="cartButton_Click"/>
                <asp:ImageButton ID="wishButton" runat="server" ImageUrl="~/image/wish_blank.svg" OnClick="wishButton_Click" />
            </td>
        </tr>
    </table>--%>
    <div style="margin-left:10%; margin-right:10%; padding-bottom:10%;">
        <h3>Rating</h3>
        <hr />
        <textarea id="TextArea1" cols="150" rows="5" ></textarea>
        <asp:Button ID="commentButton" runat="server" Text="Comment" style="float:right;"/>
    </div>
</asp:Content>