<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Home.aspx.cs" Inherits="Assignment.Home" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger controlid="Timer1" eventname="Tick" />
        </Triggers>
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
    
            <asp:ImageButton ID="buttonRight" CssClass="buttonR" runat="server" ImageUrl="~/image/arrowR.svg" OnClick="buttonRight_Click" />
            <asp:ImageButton ID="buttonLeft" CssClass="buttonL" runat="server" ImageUrl="~/image/arrowL.svg" OnClick="buttonLeft_Click" />
            <asp:Image ID="Image1" runat="server" CssClass="slideshow" ImageUrl="~/image/header_1.jpg" />
            <asp:HiddenField ID="hiddenField" runat="server" Value="1"/>
        </ContentTemplate>
    </asp:UpdatePanel>

    

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
            <td style="text-align:center; width: 200px;">To be added</td>
            <td style="text-align:center; width: 200px;">To be added</td>
        </tr>
    </table>

    <hr />

    <table style="width: 100%; padding-top:2.5%; padding-left:10%; padding-right:10%; padding-bottom:2.5%;">
        <tr>
            <td style="width: 200px; padding-bottom:2.5%;"><u><b>New Arrival</b></u></td>
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
            <td style="text-align:center; width: 200px;">To be added</td>
        </tr>
    </table>
</asp:Content>
