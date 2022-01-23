<%@ Page Title="" Language="C#" MasterPageFile="~/WBOMaster.Master" AutoEventWireup="true" CodeBehind="WBOHome.aspx.cs" Inherits="WebGeneral.WBOHome1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .divider:after,
        .divider:before {
            content: "";
            flex: 1;
            height: 1px;
            background: #eee;
        }

        .h-custom {
            height: calc(100% - 73px);
        }

        @media (max-width: 450px) {
            .h-custom {
                height: 100%;
            }
        }

        h1{
            font-size: 67px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="vh-100">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="img/WBO/logoLogin.png" class="img-fluid"
                        alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <div class="form-outline mb-4">
                        <h1>Bienvenido/a</h1>
                        <h4 id="lblUsuario" runat="server">Usuario test</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
