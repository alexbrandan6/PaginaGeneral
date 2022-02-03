<%@ Page Title="" Language="C#" MasterPageFile="~/WBOMaster.Master" AutoEventWireup="true" CodeBehind="WBOBanner.aspx.cs" Inherits="WebGeneral.WBOBanner" %>
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

        td, th{
            text-align: center;
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid p-5">
        <div class="row mt-3 ml-3 mr-3">
            <div class="col-md-6 col-lg-6 col-12 pt-2">
                <label class="form-label" for="txtTitulo">Titulo*</label>
                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
            </div>

            <div class="col-md-6 col-lg-6 col-12 pt-2">
                <label class="form-label" for="txtDescripcion">Descripción*</label>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control form-control-lg" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>

        <div class="row mt-3 ml-3 mr-3">
            <div class="col-md-6 col-lg-6 col-12 pt-2">
                <label class="form-label" for="txtDescripcion">Estado</label>
                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-select form-control-lg">
                    <asp:ListItem Value="1">Activo</asp:ListItem>
                    <asp:ListItem Value="2">Inactivo</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-6 col-lg-6 col-12 pt-2">
                <label for="txtImagen" class="form-label">Imagen*</label>
                <asp:FileUpload CssClass="form-control" type="file" ID="txtImagen" runat="server" />
            </div>
        </div>

        <div class="row mt-3 ml-3 mr-3">
            <div class="col-12 w-25">
                <img ID="imgBanner" runat="server" class="img-fluid img-thumbnail"/>
            </div>
        </div>

        <div class="row mt-3 ml-3 mr-3 d-flex justify-content-center">
            <div class="col-md-6 col-lg-6 col-12 pt-2 d-flex justify-content-center">
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-success" Text="Guardar" OnClick="btnGuardar_Click"/>
            </div>
        </div>

        <div class="row mt-3 ml-3 mr-3 d-flex justify-content-center">
            <div class="col-auto">
                <div id="divAlert" class="alert alert-danger" runat="server">
                    <i id="iconAlert" runat="server"></i>
                    <strong id="strongAlert" runat="server" class="mx-2"></strong>
                    <label id="lblAlert" runat="server">Test de alerta</label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </div>
    </div>

    <div class="container p-5">
        <div class="row mt-3 ml-3 mr-3">
            <div class="col-12">
                <div class="table-responsive">
                    <table id="tblBanners" class="table table-striped table-bordered" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Acciones</th>
                                <th>Nro. Banner</th>
                                <th>Titulo</th>
                                <th>Descripcion</th>
                                <th>Imagen</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptBanners" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <a href="WBOBanner.aspx?idBanner=<%# Eval("idBanner") %>" class="btn btn-warning m-1">Editar</a>
                                            <asp:LinkButton ID="btnInactivarBanner" runat="server" CssClass="btn btn-danger m-1" Text="Inactivar" CommandArgument='<%# Eval("idBanner") %>' OnCommand="btnInactivarBanner_Click"/>
                                        </td>
                                        <td>
                                            <%# Eval("idBanner") %>
                                        </td>
                                        <td>
                                            <%# Eval("Titulo") %>
                                        </td>
                                        <td>
                                            <%# Eval("Descripcion") %>
                                        </td>
                                        <td class="w-25">
                                            <asp:Image ID="imgBanner" runat="server" class="img-fluid img-thumbnail" ImageUrl='<%# Eval("Imagen").ToString().Substring(Eval("Imagen").ToString().IndexOf("img")) %>'/>
                                        </td>
                                        <td>
                                            <%# Eval("Estado") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>