<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormKlijent.aspx.cs" Inherits="FsreWebService.WebFormKlijent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            WebService - Client<br />
        </div>
        <asp:TextBox ID="inputField" runat="server" OnTextChanged="inputField_TextChanged" Width="174px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="ToEur" runat="server" OnClick="ToEur_Click" Text="ToEur" Width="72px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ToBam" runat="server" OnClick="ToBam_Click" Text="To Bam" Width="75px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="ResultLabel" runat="server"></asp:Label>
    </form>
</body>
</html>
