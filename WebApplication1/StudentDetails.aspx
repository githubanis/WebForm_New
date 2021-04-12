<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDetails.aspx.cs" Inherits="WebApplication1.StudentDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="ml" runat="server" Text="Student Information" ForeColor="#0066FF" Font-Size="X-Large" Font-Bold="True"></asp:Label>
            <br />
            <br />
            <asp:Label ID="a" runat="server" Text="Name         : "></asp:Label> <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="b" runat="server" Text="Department   : "></asp:Label> <asp:Label ID="Label2" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="c" runat="server" Text="Age          : "></asp:Label> <asp:Label ID="Label3" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="d" runat="server" Text="Gender       : "></asp:Label> <asp:Label ID="Label4" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="e" runat="server" Text="Date of Birth: "></asp:Label> <asp:Label ID="Label5" runat="server" Text=""></asp:Label><br />
        </div>
        <br />
        <br />
        <div>
            <asp:Button ID="Button1" runat="server" Text="<< Back" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
