<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadGrid2">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid2"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div class="demo-container no-bg">
        <h2>Student Information (using the NeedDataSource event):</h2>
        <telerik:RadGrid RenderMode="Lightweight" runat="server" ID="RadGrid2" AllowPaging="True" AllowSorting="true"
            OnNeedDataSource="RadGrid2_NeedDataSource">
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id">
        <Columns>
            <telerik:GridBoundColumn DataField="Id" DataType="System.Int32"
                FilterControlAltText="Filter Id column" HeaderText="Id"
                ReadOnly="True" SortExpression="Id" UniqueName="Id">
            </telerik:GridBoundColumn>
            <telerik:GridNumericColumn DataField="Name" DataType="System.String"
                FilterControlAltText="Filter Name column" HeaderText="Name"
                SortExpression="Name" UniqueName="Name">
            </telerik:GridNumericColumn>
            <telerik:GridNumericColumn DataField="Department" DataType="System.String"
                FilterControlAltText="Filter Department column" HeaderText="Department"
                SortExpression="Department" UniqueName="Department">
            </telerik:GridNumericColumn>
            <telerik:GridBoundColumn DataField="Age" DataType="System.Int32"
                FilterControlAltText="Filter Age column" HeaderText="Age"
                SortExpression="Age" UniqueName="Age">
            </telerik:GridBoundColumn>
            <telerik:GridNumericColumn DataField="Gender" DataType="System.String"
                FilterControlAltText="Filter Gender column" HeaderText="Gender"
                SortExpression="Gender" UniqueName="Gender">
            </telerik:GridNumericColumn>
            <telerik:GridDateTimeColumn DataField="DateOfBirth" DataType="System.DateTime"
                FilterControlAltText="Filter DateOfBirth column" HeaderText="DateOfBirth"
                SortExpression="DateOfBirth" UniqueName="DateOfBirth">
            </telerik:GridDateTimeColumn>
        </Columns>
    </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
