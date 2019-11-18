<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Collection.aspx.cs" Inherits="Assignment.Collection" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 674px;
            height: 200px;
        }
        .auto-style2 {
            width: 166px;
            height: 200px;
        }
        .auto-style4 {
            width: 200px;
            height: 200px;
        }

        .auto-style5 {
            width: 92%;
        }

        .trprofile{
    background:#FFFFFF;
}
.trprofile:hover /*Highlight Current Row*/
{
    background:#EEEEEE;
}

 </style>
         <div style="float:left ; width:15%;margin-top:60px">
           <table>
               <tr class="trprofile">
                   <td style="padding:15px;border:solid; border-width:1px;">
                      Profile</td>
               </tr>
               <tr class="trprofile">
                   <td style="padding:15px;border:solid; border-width:1px;" >Wishlist</td>
               </tr>

               <tr class="trprofile"><td style="padding:15px;border:solid; border-width:1px;">Collection Photo</td></tr>
           </table>
                 
       </div>

    <asp:Image ID="Image1" runat="server" ImageUrl="~/image/1.jpg" style="float:left; margin-left:5%; margin-top:5%;"/>
    <asp:Image ID="Image2" runat="server" ImageUrl="~/image/2.jpg" style="float:left; margin-left:5%; margin-top:7%; "/>
    <asp:Image ID="Image3" runat="server" ImageUrl="~/image/narutoFigure.jpg" Width="16%" style="float:left; margin-left:5%; margin-top:6%;"/>
    <asp:Image ID="Image4" runat="server" ImageUrl="~/image/sasuke.jpg" style="float:left; margin-left:5%; margin-top:5%;"/>
    <br />
    <asp:Image ID="Image5" runat="server" ImageUrl="~/image/3.jpg" style="float:left; margin-left:5%; margin-top:5%;" />
    <asp:Image ID="Image6" runat="server" ImageUrl="~/image/4.jpg" style="float:left; margin-left:5%; margin-top:5%;"/>
</asp:Content>
