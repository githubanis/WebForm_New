<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%--<telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
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
            OnNeedDataSource="RadGrid2_NeedDataSource" OnItemCommand="RadGrid2_ItemCommand">
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id" EditMode="InPlace">
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
                <telerik:GridTemplateColumn Display="True">
                    <ItemTemplate>
                        <asp:LinkButton ID="stdLinkBtn" runat="server" Text="Details" HeaderText="Links" CommandName="date" ToolTip="See Details" ForeColor="Blue"></asp:LinkButton>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <br />
        
    <div>
        <asp:Button ID="addBtn" runat="server" OnClick="addBtn_Click" Text="Add Student" ToolTip="Add" />
        <br />
        <br />
        
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Department"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Age"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Gender"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                <DayStyle BackColor="#CCCCCC" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                <TodayDayStyle BackColor="#999999" ForeColor="White" />
            </asp:Calendar>
            <br />            
            <asp:Label ID="Label6" runat="server" Text="Date Of Birth"></asp:Label>&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/images.png" OnClick="imageBtn_Click" Height="37px" Width="46px" />
            <br />            
            <br />
            <asp:Button ID="btnAdd" runat="server" Text="Submit" OnClick="btnAdd_Click" />
            <br />
            <br />
            
        </asp:Panel>
    </div>--%>

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
            OnDeleteCommand="RadGrid1_DeleteCommand"
            OnItemCommand="RadGrid1_ItemCommand" >
            <MasterTableView DataKeyNames="Id" 
                CommandItemDisplay="Top" 
                InsertItemPageIndexAction="ShowItemOnCurrentPage" 
                EditMode="InPlace">
                <Columns>
                    <telerik:GridEditCommandColumn HeaderText="Edit" />                    
                    <telerik:GridBoundColumn DataField="Id" HeaderText="ID" ReadOnly="true"
                        ForceExtractValue="Always" Display="false" />
                    <telerik:GridBoundColumn DataField="Name" HeaderText="Name" />
                    <telerik:GridBoundColumn DataField="Department" HeaderText="Department" />
                    <telerik:GridBoundColumn DataField="Age" HeaderText="Age"/>
                    <telerik:GridBoundColumn DataField="Gender" HeaderText="Gender"/>
                    <telerik:GridBoundColumn DataField="DateOfBirth" HeaderText="Date Of Birth"/>
                    <telerik:GridTemplateColumn Display="True">
                        <ItemTemplate>
                            <asp:LinkButton ID="stdLinkBtn" runat="server" Text="Details" HeaderText="Links" CommandName="date" ToolTip="See Details" ForeColor="Blue"></asp:LinkButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridButtonColumn HeaderText="Delete" ConfirmText="Delete this Student?" ConfirmDialogType="Classic"
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
