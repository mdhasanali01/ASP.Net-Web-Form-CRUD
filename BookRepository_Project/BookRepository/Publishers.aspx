<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Publishers.aspx.cs" Inherits="BookRepository_Project.BookRepository.Publishers" %>

<%@ Register Src="~/BookRepository/PublisherUserControl.ascx" TagPrefix="uc1" TagName="PublisherUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
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
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
             <div class="d-flex align-items-center text-primary">
              <span>Loading...</span>
              <div class="spinner-border spinner-border-sm ms-auto" role="status" aria-hidden="true"></div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
              <div class="row px-2 bg-light">
           <div class="col-12 border-bottom mb-3">
            <h1 class="col-12 text-center text-white  py-2 bg-secondary">Publishers</h1>
               <uc1:PublisherUserControl runat="server" id="PublisherUserControl" />
        </div>      
      </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
