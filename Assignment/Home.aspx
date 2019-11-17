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
    
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/1.jpg" Width="40%" Height="40%" CssClass="newArrival" OnClick="ImageButton1_Click"/>
    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/2.jpg" Width="40%" Height="40%" CssClass="hotSales" OnClick="ImageButton2_Click"/>

</asp:Content>
