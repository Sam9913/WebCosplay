<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Costume1.aspx.cs" Inherits="Assignment.Costume1" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">

    <table style="width: 100%; margin-top: -12%; margin-left: -10%;">
        <tr>
            <td style="width: 160px; float: right; margin-top: 38%;">
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
                <u><strong>Details</strong></u>
                <asp:Table ID="Table1" runat="server" Style="border-collapse: collapse;">
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
                </asp:Table>
                <br />
                Size:
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem>S</asp:ListItem>
                    <asp:ListItem>M</asp:ListItem>
                    <asp:ListItem>L</asp:ListItem>
                </asp:RadioButtonList><br />
                <asp:Button ID="cartButton" runat="server" Text="Add to Cart" />
                <asp:ImageButton ID="wishButton" runat="server" ImageUrl="~/image/wish_blank.svg" OnClick="wishButton_Click" />
            </td>
        </tr>
    </table>
    <div style="margin-left:10%; margin-right:10%; padding-bottom:10%;">
        <h3>Rating</h3>
        <hr />
        <textarea id="TextArea1" cols="150" rows="5" ></textarea>
        <asp:Button ID="commentButton" runat="server" Text="Comment" style="float:right;"/>
    </div>
</asp:Content>