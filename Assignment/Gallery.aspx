<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Gallery.aspx.cs" Inherits="Assignment.Gallery" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td style="text-align:center;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/image/1.jpg" Width="217px" />
                        <br />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Costume1.aspx">Costume 1</asp:HyperLink><br />
                        RM200.00
                    </td>
                    <td style="text-align:center;">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/image/2.jpg" />
                        <br />
                        Costume 2<br />
                        RM200.00
                    </td>
                    <td style="text-align:center;">
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/image/3.jpg" />
                        <br />
                        Costume 3<br />
                        RM200.00
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center;">
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/image/4.jpg" />
                        <br />
                        Costume 4<br />
                        RM200.00
                    </td>
                    <td style="text-align:center;">
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/image/5.jpg"/>
                        <br />
                        Costume 5<br />
                        RM200.00
                    </td>
                    <td style="text-align:center;">To be added&nbsp;</td>
                </tr>
            </table>
        </div>
</asp:Content>
