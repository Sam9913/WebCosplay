<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductControl.ascx.cs" Inherits="Assignment.ProductControl" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

        <div style="margin: 2%; padding: 2%; width: 98%;">
            <h2 style="margin:auto; font-size:30px; font-family: Bahnschrift; font-weight: 700""><asp:SiteMapPath ID="SiteMapPath1" runat="server" ></asp:SiteMapPath></h2>
        </div>

    <div style="text-align:center; margin:2.5% 5% 2.5% 5%;">
        | <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <asp:HiddenField ID="sortIDHidden" runat="server" Value='<%# Eval("Sort_ID") %>'/>
                <asp:LinkButton ID="sortButton" runat="server" OnClick="sortButton_Click" Text='<%#DataBinder.Eval(Container.DataItem,"Sort_Type") %>' ></asp:LinkButton>&ensp;|&ensp;
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Sort]"></asp:SqlDataSource>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" RepeatColumns="4" RepeatDirection="Horizontal">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775"></AlternatingItemStyle>

        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333"></ItemStyle>
        <ItemTemplate>
            <asp:Label ID="hiddenID" runat="server" Text='<%# Eval("Cat_ID") %>' Visible="false" />
            <div style="text-align:center; margin:5%;">
                <asp:HiddenField ID="hidden" runat="server" Value='<%# Eval("Prod_ID") %>' />
                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image1").ToString()%>' Width="50%"/><br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_Name") %>'>
                </asp:LinkButton><br /> 
                RM 
                <asp:Label Text='<%# Eval("Prod_Price","{0:0.00}") %>' runat="server" ID="Prod_PriceLabel" /><br />
                <br />
            </div>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Prod_Name], [Prod_Price], [Prod_Image1], [Prod_ID], [Cat_ID] FROM [Product]"></asp:SqlDataSource>