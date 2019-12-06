<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Home.aspx.cs" Inherits="Assignment.Home" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger controlid="Timer1" eventname="Tick" />
        </Triggers>
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
    
            <asp:ImageButton ID="buttonRight"  runat="server" CssClass="buttonR" ImageUrl="image/arrowR.png" OnClick="buttonRight_Click" />
            <asp:ImageButton ID="buttonLeft" CssClass="buttonL" runat="server" ImageUrl="image/arrowL.png" OnClick="buttonLeft_Click" />
            <asp:Image ID="Image1" runat="server" CssClass="slideshow" ImageUrl="~/image/header_1.jpg" />
            <asp:HiddenField ID="hiddenField" runat="server" Value="1"/>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <table style="width: 100%; padding-top:2.5%; padding-left:10%; padding-right:10%; padding-bottom:2.5%;">
        <tr>
            <td style="width: 200px; padding-left: 7.5%; padding-bottom:2.5%; padding-top:2.5%; font-size: 30px;"><u><b>Hot Sales</b></u></td>
        </tr>
        <tr>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <td style="text-align: center; width: 200px;">
                        <asp:HiddenField ID="hidden" runat="server" Value='<%# Eval("Prod_ID") %>' />
                        <asp:Label ID="hiddenID" runat="server" Text='<%# Eval("Cat_ID") %>' Visible="false" />
                        <asp:Image ID="Image2" runat="server" style="width:150px; height:150px;" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image1").ToString()%>'/>
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_Name") %>'></asp:LinkButton><br /> 
                    </td>
                </ItemTemplate>
            </asp:Repeater>
        </tr>
    </table>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT TOP 4 * FROM PRODUCT ORDER BY Sales_Count DESC"></asp:SqlDataSource>

    <table style="width: 100%; padding-top:2.5%; padding-left:10%; padding-right:10%; padding-bottom:2.5%;">
        <tr>
            <td style="width: 200px; padding-left: 7.5%; padding-bottom:2.5%; font-size: 30px; padding-top:2.5%;"><u><b>New Arrival</b></u></td>
        </tr>
        <tr>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    <td style="text-align: center; width: 200px;">
                        <asp:HiddenField ID="hidden" runat="server" Value='<%# Eval("Prod_ID") %>' />
                        <asp:Label ID="hiddenID" runat="server" Text='<%# Eval("Cat_ID") %>' Visible="false" />
                        <asp:Image ID="Image2" runat="server" style="width:150px; height:150px;" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image1").ToString()%>'/>
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%#DataBinder.Eval(Container.DataItem,"Prod_Name") %>'></asp:LinkButton><br />                     
                    </td>
                </ItemTemplate>
            </asp:Repeater>
        </tr>
    </table>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT TOP 4 * FROM PRODUCT ORDER BY Add_Date DESC"></asp:SqlDataSource>
</asp:Content>
