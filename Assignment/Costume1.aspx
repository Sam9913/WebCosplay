<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Costume1.aspx.cs" Inherits="Assignment.Costume1" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td style="text-align:center;" class="auto-style1">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/image/1.jpg" /><br />
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/image/1.jpg" Width="150px" />&ensp;
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/image/1.jpg" Width="150px" />&ensp;
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/image/1.jpg" Width="150px" />
                    </td>
                    <td>Costume 1<br />
                        RM200.00<br /><br />
                        <u><strong>Details</strong></u>
                        <asp:Table ID="Table1" runat="server">
                            <asp:TableRow>
                                <asp:TableHeaderCell BorderStyle="Inset">Size</asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Inset">Length(CM)</asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderStyle="Inset">S</asp:TableCell>
                                <asp:TableCell BorderStyle="Inset">25</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderStyle="Inset">M</asp:TableCell>
                                <asp:TableCell BorderStyle="Inset">30</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderStyle="Inset">L</asp:TableCell>
                                <asp:TableCell BorderStyle="Inset">35</asp:TableCell>
                            </asp:TableRow>
                        </asp:Table><br />
                        Size: <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem>S</asp:ListItem>
                            <asp:ListItem>M</asp:ListItem>
                            <asp:ListItem>L</asp:ListItem>
                        </asp:RadioButtonList><br />
                        <asp:Button ID="cartButton" runat="server" Text="Add to Cart" />
                        <asp:Button ID="wishlistButton" runat="server" Text="Add to Wishlist" CssClass="auto-style2" />
                    </td>
                </tr>
                </table>
        </div>
</asp:Content>