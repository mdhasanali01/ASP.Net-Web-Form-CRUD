<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AuthorBooks.aspx.cs" Inherits="BookRepository_Project.BookRepository.AuthorBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
      <style>
        .err {
            font-size: 1rem;
        }
        th a {
            text-decoration:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-6">
            <h3 class="col-12 text-center text-white  py-2 bg-secondary ">Select Book</h3>
            <asp:GridView ID="gvBooks" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" DataKeyNames="BookID" DataSourceID="dsBooks" OnRowDataBound="gvBooks_RowDataBound">
                 <SelectedRowStyle CssClass="bg-secondary text-white" />
                <HeaderStyle CssClass="bg-light" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton CssClass="btn btn-primary btn-sm" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text=""><i class="bi bi-check2-circle"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                    <asp:BoundField DataField="TopicName" HeaderText="TopicName" SortExpression="TopicName" />
                    <asp:BoundField DataField="PublisherName" HeaderText="PublisherName" SortExpression="PublisherName" />
                    <asp:BoundField DataField="PublishDateNo" DataFormatString="{0:yyyy-MM-dd}" HeaderText="Publish Date" SortExpression="PublishDateNo" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsBooks" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT Books.BookID, Books.BookName, Books.PublishDateNo, Publishers.PublisherName, Topics.TopicName FROM Publishers INNER JOIN Books ON Publishers.Publisherid = Books.Publisherid CROSS JOIN Topics"></asp:SqlDataSource>
        </div>
        <div class="col-6">
            <h3 class="col-12 text-center text-white  py-2 bg-secondary ">Insert AuthorID</h3>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="AuthorId,BookID" DataSourceID="dsAuthorBooks" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting">

                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="AuthorIdLabel1" runat="server" Text='<%# Eval("AuthorId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel1" runat="server" Text='<%# Eval("BookID") %>' />
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
                            <asp:LinkButton CssClass="btn btn-primary btn-sm" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert"><i class="bi bi-plus-square"></i> Insert</asp:LinkButton>
                            <asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear"><i class="bi bi-x-square"></i> Clear</asp:LinkButton>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="AuthorIdTextBox" runat="server" Text='<%# Bind("AuthorId") %>' />
                        </td>
                        <td>
                            <asp:HiddenField ID="BookIDTextBox" runat="server" Value='<%# Bind("BookID") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </td>
                        <td>
                            <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Eval("AuthorId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table table-bordered">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server" class="text-center">Actions</th>
                                        <th runat="server" class="text-center">AuthorId</th>
                                        <th runat="server" class="text-center">BookID</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:LinkButton CssClass="btn btn-danger btn-sm form-control" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete"><i class="bi bi-trash3-fill"></i> Delete</asp:LinkButton>
                        </td>
                        <td>
                            <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Eval("AuthorId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="dsAuthorBooks" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [AuthorBooks] WHERE [AuthorId] = @AuthorId AND [BookID] = @BookID" InsertCommand="INSERT INTO [AuthorBooks] ([AuthorId], [BookID]) VALUES (@AuthorId, @BookID)" SelectCommand="SELECT * FROM [AuthorBooks] WHERE ([BookID] = @BookID)">
                <DeleteParameters>
                    <asp:Parameter Name="AuthorId" Type="Int32" />
                    <asp:Parameter Name="BookID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AuthorId" Type="Int32" />
                    <asp:Parameter Name="BookID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvBooks" Name="BookID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

