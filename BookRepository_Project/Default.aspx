<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BookRepository_Project.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <style>
        .container {
            display: block;
            width: 97.5vw;
            margin: 0 auto;
        }

        .banner {
            width: 80vw;
            margin: 15px auto;
            padding: 15px 30px;
            border-radius: 3px;
            background-color: #e3f2fd;
            color: #000000;
            display: flex;
            gap: .5em;
            flex-direction: column;
            justify-content: flex-start;
            align-items: stretch;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <section class="container">
        <div class="banner">
            <h3>Realational DataBase Create Update Delete ASP.NET Web Forms Application</h3>
            <h5>Using ASP.NET WEb Froms</h5>
            <h6>Features</h6>
            <ul class="col-4">
                
                <li>Parent Tables</li>
                <li>Realtional Tables</li>
                <li>Realtional Tables With Dropdown Control</li>
                <li>Friendly URL & User Control</li>
                <li>Object DataSource & Repository Pattern</li>
                <li>Login/Register With ASP.NET Identity feature</li>
                <li>Multiple Crystal Reports</li>
                <li>Security</li>
            </ul>
            <h5>
                <asp:LinkButton CssClass="btn btn-primary btn-sm" ID="LinkButton1" runat="server" PostBackUrl="register.aspx" CausesValidation="false" Text="Register here"></asp:LinkButton>
            </h5>
            <hr />
            
        </div>
    </section>
</asp:Content>
