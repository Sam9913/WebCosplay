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
                <u><strong>Details</strong></u><br />
                On Stock<br />
                1 item left<br />
                <br />
                Size:<br />
                <asp:Button ID="Button1" runat="server" Text="S" CssClass="changeButton" OnClick="Button1_Click"/>
                <asp:Button ID="Button2" runat="server" Text="M" CssClass="changeButton" OnClick="Button2_Click"/>
                <asp:Button ID="Button3" runat="server" Text="L" CssClass="changeButton" OnClick="Button3_Click"/>
                <br />
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