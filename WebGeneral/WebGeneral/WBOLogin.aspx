<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WBOLogin.aspx.cs" Inherits="WebGeneral.WBOLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="icon" href="img/WBO/logoLoginIcon.png">

    <title>WBO Login</title>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="img/WBO/logoLogin.png" class="img-fluid"
                            alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <div class="form-outline mb-4">
                            <label class="form-label" for="txtUsuario">Usuario*</label>
                            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                        </div>

                        <div class="form-outline mb-3">
                            <label class="form-label" for="txtContra">Contraseña*</label>
                            <asp:TextBox ID="txtContra" runat="server" CssClass="form-control form-control-lg" TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <asp:Button ID="btnLogear" runat="server" CssClass="btn btn-primary btn-lg"  style="padding-left: 2.5rem; padding-right: 2.5rem;" Text="Logear" OnClick="btnLogear_Click"/>
                            
                            <p class="small fw-bold mt-2 pt-1 mb-0">
                                ¿Olvidaste tus datos?
                                <a href="#!" class="link-danger">Click para recuperar</a>
                            </p>
                        </div>

                        <div class="d-flex align-items-center fade show mt-4" style="position: absolute">
                            <div id="divAlert" runat="server">
                                <i id="iconAlert" runat="server"></i>
                                <strong id="strongAlert" runat="server" class="mx-2"></strong>
                                <label id="lblAlert" runat="server"></label>
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
