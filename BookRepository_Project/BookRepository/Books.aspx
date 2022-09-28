<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="BookRepository_Project.BookRepository.Books" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <script src="/Scripts/jquery-3.6.0.js"></script>
    <link href="/Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
    <link href="/Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
       <style>
        .err {
            font-size: 1rem;
        }
        th a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12  border-bottom mb-3">
            <h1 class="col-12 text-center text-white  py-2 bg-secondary">Books</h1>
            <asp:ListView  runat="server" DataKeyNames="BookID" DataSourceID="dsBooks" InsertItemPosition="LastItem" ID="ListView1" OnItemInserting="ListView1_ItemInserting" OnItemUpdating="ListView1_ItemUpdating" OnItemDataBound="ListView1_ItemDataBound">
              
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:LinkButton ValidationGroup="be" CssClass="btn btn-success btn-sm mb-1" ID="UpdateButton" runat="server" CommandName="Update" Text="Update"><i class="bi bi-save2-fill"></i> Update</asp:LinkButton>
                            <asp:LinkButton ValidationGroup="be" CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel"><i class="bi bi-x-square-fill"></i> Cancel</asp:LinkButton>
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel1" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                         <td class="px-2">
                            <asp:TextBox ValidationGroup="be" CssClass="form-control" ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="be" ControlToValidate="BookNameTextBox" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Book Name Required" CssClass="text-danger err"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <img src=' <%# Eval("Picture" , "/Uploads/{0}") %>' class="img-thumbnail" style="width:50px" />
                            <asp:FileUpload CssClass="form-control" ValidationGroup="be" ID="fu" runat="server" />
                            <asp:HiddenField ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                            
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="be"  CssClass="form-control date" ID="PublishDateNoTextBox" runat="server" Text='<%# Bind("PublishDateNo") %>' />
                             <asp:RequiredFieldValidator ValidationGroup="be" ControlToValidate="PublishDateNoTextBox" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Date Required" CssClass="text-danger err"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:CheckBox CssClass="px-5" ID="AvailableCheckBox" runat="server" Checked='<%# Bind("Available") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="PublisheridTextBox" DataSourceID="SqlDataSource1" DataValueField="Publisherid" DataTextField="PublisherName" AppendDataBoundItems="true" runat="server" Text='<%# Bind("Publisherid") %>'>
                                <asp:ListItem Value="" Selected="True" Text="Select One" Enabled="true"></asp:ListItem>
                            </asp:DropDownList>
                            

                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:LinkButton ValidationGroup="bi" CssClass="btn btn-success btn-sm mb-1" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert"><i class="bi bi-plus-square"></i> Insert</asp:LinkButton>
                            <asp:LinkButton ValidationGroup="bi" CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear"><i class="bi bi-x-square"></i> Clear</asp:LinkButton>
                        </td>
                        <td>[Auto]</td>
                        <td class="px-2">
                            <asp:TextBox ValidationGroup="bi" CssClass="form-control" ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="bi" ControlToValidate="BookNameTextBox" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Book Name Required" CssClass="text-danger err"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:FileUpload CssClass="form-control" ValidationGroup="bi" ID="fu" runat="server" />
                            <asp:HiddenField ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="bi" ControlToValidate="fu" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Picture Required" CssClass="text-danger err"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="bi" CssClass="form-control date" ID="PublishDateNoTextBox" runat="server" Text='<%# Bind("PublishDateNo") %>' />
                             <asp:RequiredFieldValidator ValidationGroup="bi" ControlToValidate="PublishDateNoTextBox" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Date Required" CssClass="text-danger err"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:CheckBox CssClass="px-5" ID="AvailableCheckBox" runat="server" Checked='<%# Bind("Available") %>' />
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="PublisheridTextBox" DataSourceID="SqlDataSource1" DataValueField="Publisherid" DataTextField="PublisherName" AppendDataBoundItems="true" runat="server" Text='<%# Bind("Publisherid") %>'>
                                <asp:ListItem Value="" Selected="True" Text="Select One" Enabled="true"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ValidationGroup="bi" ControlToValidate="PublisheridTextBox" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Plese Select One" CssClass="text-danger err"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:LinkButton CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete"><i class="bi bi-trash3-fill"></i></asp:LinkButton>
                            <asp:LinkButton CssClass="btn btn-primary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit"><i class="bi bi-pen-fill"></i></asp:LinkButton>
                        </td>
                        <td>
                            <asp:Label  ID="BookIDLabel" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                        </td>
                        <td>
                            <img src=' <%# Eval("Picture" , "/Uploads/{0}") %>' class="img-thumbnail" style="width:50px " />
                        </td>
                        <td>
                            <asp:Label ID="PublishDateNoLabel" runat="server" Text='<%# Eval("PublishDateNo","{0:yyyy-MM-dd}") %>' />
                        </td>
                        <td>
                            <asp:CheckBox CssClass="px-5" ID="AvailableCheckBox" runat="server" Checked='<%# Eval("Available") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:Label ID="PublisheridLabel" runat="server" Text='<%# Eval("Publisherid") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table table-bordered">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server" class="text-center"> BookID </th>
                                        <th runat="server" class="text-center"> BookName </th>
                                        <th runat="server" class="text-center">Picture </th>
                                        <th runat="server" class="text-center"> PublishDateNo</th>
                                        <th runat="server" class="text-center"> Available</th>
                                        <th runat="server" class="text-center"> Publisher Name</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager  ID="DataPager1"  PageSize="5" runat="server" >
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button"  ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                        </td>
                        <td>
                             <img src=' <%# Eval("Picture" , "/Uploads/{0}") %>' class="img-thumbnail" style="width:50px" />
                        </td>
                        <td>
                            <asp:Label ID="PublishDateNoLabel" runat="server" Text='<%# Eval("PublishDateNo") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="AvailableCheckBox" runat="server" Checked='<%# Eval("Available") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:Label ID="PublisheridLabel" runat="server" Text='<%# Eval("Publisherid") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="dsBooks" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Books] WHERE [BookID] = @BookID" InsertCommand="INSERT INTO [Books] ([BookName], [Picture], [PublishDateNo], [Available], [Publisherid]) VALUES (@BookName, @Picture, @PublishDateNo, @Available, @Publisherid)" SelectCommand="SELECT * FROM [Books]" UpdateCommand="UPDATE [Books] SET [BookName] = @BookName, [Picture] = @Picture, [PublishDateNo] = @PublishDateNo, [Available] = @Available, [Publisherid] = @Publisherid WHERE [BookID] = @BookID">
                <DeleteParameters>
                    <asp:Parameter Name="BookID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="BookName" Type="String" />
                    <asp:Parameter Name="Picture" Type="String" />
                    <asp:Parameter DbType="Date" Name="PublishDateNo" />
                    <asp:Parameter Name="Available" Type="Boolean" />
                    <asp:Parameter Name="Publisherid" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BookName" Type="String" />
                    <asp:Parameter Name="Picture" Type="String" />
                    <asp:Parameter DbType="Date" Name="PublishDateNo" />
                    <asp:Parameter Name="Available" Type="Boolean" />
                    <asp:Parameter Name="Publisherid" Type="Int32" />
                    <asp:Parameter Name="BookID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Publishers]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="footer" runat="server">
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script>
        $(() => {
            $(".date").datepicker({
                format: "yyyy-mm-dd"
            });
        })
    </script>

</asp:Content>
