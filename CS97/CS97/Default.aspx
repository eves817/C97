<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CS97._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Button ID="Button1" runat="server" Text="顯示學生" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="顯示成績" OnClick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="合併統計" OnClick="Button3_Click" />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox1" runat="server" Height="200px" TextMode="MultiLine" Width="600px"></asp:TextBox>

</asp:Content>
