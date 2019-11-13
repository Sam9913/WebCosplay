<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Home.aspx.cs" Inherits="Assignment.Home" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:ImageButton ID="buttonRight" runat="server" ImageUrl="~/image/arrow.jpg" style="margin-top:10%; width:3%; height:5%; position: absolute;
            margin-left: 95.5%;" OnClick="buttonRight_Click" />
    <asp:Image ID="Image1" runat="server" style="width:100%; height:25%;" ImageUrl="~/image/h1.jpg" />
    <asp:HiddenField ID="HiddenField1" runat="server" Value="1"/>

    <table style="width: 100%; padding-top:50px; padding-left:100px; padding-right:100px;">
        <tr>
            <td style="width: 200px;"><u><b>Hot Sales</b></u></td>
        </tr>
        <tr>
            <td style="text-align:center; width: 200px;">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Costume1.aspx" ><img src="image/4.jpg" alt="" style="width:150px; height:150px;"/></asp:HyperLink>
                <br />
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Costume1.aspx">Costume 4</asp:HyperLink>
            </td>
            <td style="text-align:center; width: 200px;">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Costume1.aspx"><img src="image/5.jpg" alt="" style="width:150px; height:150px;"/></asp:HyperLink>
                <br />
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Costume1.aspx">Costume 5</asp:HyperLink>
            </td>
            <td style="text-align:center; width: 200px;">To be added</td>
            <td style="width:200px"></td>
        </tr>
    </table>

    <hr />

    <table style="width: 100%; padding-top:50px; padding-left:100px; padding-right:100px;">
        <tr>
            <td style="width: 200px">New Arrival</td>
        </tr>
        <tr>
            <td style="text-align:center; width: 200px;">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Costume1.aspx"><img src="image/1.jpg" alt="" style="width:150px; height:150px;"/></asp:HyperLink>
                <br />
                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Costume1.aspx">Costume 1</asp:HyperLink>
            </td>
            <td style="text-align:center; width: 200px;">
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Costume1.aspx"><img src="image/2.jpg" alt="" style="width:150px; height:150px;"/></asp:HyperLink>
                <br />
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Costume1.aspx">Costume 2</asp:HyperLink>
            </td>
            <td style="text-align:center; width:200px;">To be added</td>
            <td style="width:200px"></td>
        </tr>
    </table>
</asp:Content>
