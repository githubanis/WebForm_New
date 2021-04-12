<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="WebApplication1.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                function rowDblClick(sender, eventArgs) {
                    sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                }
            </script>
        </telerik:RadCodeBlock>
        <telerik:RadGrid runat="server" ID="RadGrid1" 
            AutoGenerateColumns="false" 
            AllowPaging="true"
            OnItemCreated="RadGrid1_ItemCreated"
            OnInsertCommand="RadGrid1_InsertCommand"
            OnNeedDataSource="RadGrid1_NeedDataSource"
            OnUpdateCommand="RadGrid1_UpdateCommand"
            OnDeleteCommand="RadGrid1_DeleteCommand">
            <MasterTableView DataKeyNames="PersonId" 
                CommandItemDisplay="Top" 
                InsertItemPageIndexAction="ShowItemOnCurrentPage" 
                EditMode="InPlace">
                <Columns>
                    <telerik:GridEditCommandColumn HeaderText="Edit" />
                    <telerik:GridBoundColumn DataField="PersonId" HeaderText="Person ID" ReadOnly="true"
                        ForceExtractValue="Always" Display="false" />
                    <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name" />
                    <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" />
                    <telerik:GridBoundColumn DataField="FullName" HeaderText="Full Name" ReadOnly="true" />
                    <telerik:GridButtonColumn HeaderText="Delete" ConfirmText="Delete this Person?" ConfirmDialogType="Classic"
                        ConfirmTitle="Delete" ButtonType="FontIconButton" CommandName="Delete" />
                </Columns>
            </MasterTableView>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <ClientSettings>
                <ClientEvents OnRowDblClick="rowDblClick" />
            </ClientSettings>
        </telerik:RadGrid>
    </form>
</body>
</html>
