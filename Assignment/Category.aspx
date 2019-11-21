<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Category.aspx.cs" Inherits="Assignment.Category" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>

    <div style="text-align:center; margin:5% 5% 0 5%;">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <asp:LinkButton ID="hyperlinkButton" runat="server"><%#DataBinder.Eval(Container.DataItem,"Sort_Type") %></asp:LinkButton>&ensp;|&ensp;
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Sort]"></asp:SqlDataSource>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" RepeatColumns="2" RepeatDirection="Horizontal" DataKeyField="Prod_ID">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775"></AlternatingItemStyle>

        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333"></ItemStyle>
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image").ToString()%>' Width="25%"/><br />
            <asp:Label Text='<%# Eval("Prod_Name") %>' runat="server" ID="Prod_NameLabel" /><br />
            RM 
            <asp:Label Text='<%# Eval("Prod_Price","{0:0.00}") %>' runat="server" ID="Prod_PriceLabel" /><br />
            <br />

        </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Prod_Name], [Prod_Price], [Prod_Image], [Prod_ID] FROM [Product] WHERE ([Cat_ID] = @Cat_ID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="C1000" Name="Cat_ID" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    
        
</asp:Content>
