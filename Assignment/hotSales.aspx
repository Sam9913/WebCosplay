<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="hotSales.aspx.cs" Inherits="Assignment.hotSales" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <table style="width: 100%; padding-top:2.5%; padding-left:10%; padding-right:10%; padding-bottom:2.5%;">
        <tr>
            <td style="width: 200px; padding-bottom:2.5%; padding-top:2.5%"><u><b>Hot Sales</b></u></td>
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
            <td style="text-align:center; width: 200px;">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Costume1.aspx" ><img src="image/3.jpg" alt="" style="width:150px; height:150px;"/></asp:HyperLink>
                <br />
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Costume1.aspx">Costume 3</asp:HyperLink>
            </td>
            <td style="text-align:center; width: 200px;">
                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Costume1.aspx"><img src="image/narutoFigure.jpg" alt="" style="width:150px; height:150px;"/></asp:HyperLink>
                <br />
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Costume1.aspx">Naruto Figure</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align:center; width: 200px; height:200px;">To be added</td>
            <td style="text-align:center; width: 200px; height:200px;">To be added</td>
        </tr>
    </table>
</asp:Content>

