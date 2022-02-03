using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGeneral.repositorio;
using WebGeneral.modelo;
using System.Data;

namespace WebGeneral
{
    public partial class WBOBanner : System.Web.UI.Page
    {
        WBOBannerRepositorio bannerRepo = new WBOBannerRepositorio();
        Banner banner = new Banner();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NombreUsuario"] is null) Response.Redirect("WBOLogin.aspx");

            CargarTablaBanners();
            divAlert.Visible = false;

            if (Request.QueryString["idBanner"] != null)
            {
                if (!IsPostBack) LlenarControles(int.Parse(Request.QueryString["idBanner"].ToString()));
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string msj = "";
            string fileName = "";
            string idBanner = Request.QueryString["idBanner"];
            if (idBanner == null)
            {
                if (txtTitulo.Text == "" || txtDescripcion.Text == "" || txtImagen.HasFile is false)
                {
                    MostrarAlerta("alert alert-warning alert-dismissible", "bi-exclamation-triangle-fill", "* Complete los campos", "Atención!");
                }
                else
                {
                    MostrarAlerta("alert alert-success alert-dismissible", "bi-check-circle-fill", "Guardando...", "Éxito!");
                    FileInfo file = new FileInfo(txtImagen.FileName);
                    string extn = file.Extension;

                    if (extn.ToUpper() == ".JPG" || extn.ToUpper() == ".JPEG" || extn.ToUpper() == ".PNG")
                    {
                        fileName = Path.Combine(Server.MapPath("~/img/banners"), txtImagen.FileName);
                        txtImagen.SaveAs(fileName);

                        msj = Guardar(txtTitulo.Text, txtDescripcion.Text, int.Parse(ddlEstado.SelectedValue), fileName);

                        if (msj.Contains("Error"))
                        {
                            MostrarAlerta("alert alert-danger alert-dismissible", "bi-exclamation-octagon-fill", msj, "Error!");
                        }
                        else
                        {
                            MostrarAlerta("alert alert-success alert-dismissible", "bi-check-circle-fill", msj, "Éxito!");
                        }
                    }
                    else
                    {
                        MostrarAlerta("alert alert-warning alert-dismissible", "bi-exclamation-triangle-fill", "Solo se permiten imagenes con extención JPG, JPEG y PNG", "Atención!");
                    }
                }
            }
            else
            {
                if (txtImagen.HasFile)
                {
                    MostrarAlerta("alert alert-success alert-dismissible", "bi-check-circle-fill", "Guardando...", "Éxito!");
                    FileInfo file = new FileInfo(txtImagen.FileName);
                    string extn = file.Extension;

                    if (extn.ToUpper() == ".JPG" || extn.ToUpper() == ".JPEG" || extn.ToUpper() == ".PNG")
                    {
                        fileName = Path.Combine(Server.MapPath("~/img/banners"), txtImagen.FileName);
                        txtImagen.SaveAs(fileName);

                        msj = Actualizar(idBanner, txtTitulo.Text, txtDescripcion.Text, int.Parse(ddlEstado.SelectedValue), fileName, true);

                        if (msj.Contains("Error"))
                        {
                            MostrarAlerta("alert alert-danger alert-dismissible", "bi-exclamation-octagon-fill", msj, "Error!");
                        }
                        else
                        {
                            MostrarAlerta("alert alert-success alert-dismissible", "bi-check-circle-fill", msj, "Éxito!");
                        }
                    }
                    else
                    {
                        MostrarAlerta("alert alert-warning alert-dismissible", "bi-exclamation-triangle-fill", "Solo se permiten imagenes con extención JPG, JPEG y PNG", "Atención!");
                    }
                }
                else
                {
                    msj = Actualizar(idBanner, txtTitulo.Text, txtDescripcion.Text, int.Parse(ddlEstado.SelectedValue), fileName, false);

                    if (msj.Contains("Error"))
                    {
                        MostrarAlerta("alert alert-danger alert-dismissible", "bi-exclamation-octagon-fill", msj, "Error!");
                    }
                    else
                    {
                        MostrarAlerta("alert alert-success alert-dismissible", "bi-check-circle-fill", msj, "Éxito!");
                    }
                }
            }
        }

        protected void MostrarAlerta(string clase, string icon, string texto, string strong)
        {
            iconAlert.Attributes.Remove("class");
            iconAlert.Attributes.Add("class", icon);

            strongAlert.InnerText = strong;

            divAlert.Attributes.Remove("class");
            divAlert.Attributes.Add("class", clase);
            lblAlert.InnerHtml = texto;

            divAlert.Visible = true;
        }

        protected string Guardar(string titulo, string descripcion, int estado, string fileName)
        {
            banner.setTitulo(titulo);
            banner.setDescripcion(descripcion);
            banner.setImagen(fileName);
            banner.setEstado(estado);

            return bannerRepo.BannerGuardar(banner);
        }

        protected string Actualizar(string idBanner, string titulo, string descripcion, int estado, string fileName, bool withFile)
        {
            banner.setIdBanner(int.Parse(idBanner));
            banner.setTitulo(titulo);
            banner.setDescripcion(descripcion);
            banner.setImagen(fileName);
            banner.setEstado(estado);

            return bannerRepo.BannerActualizar(banner, withFile);
        }

        protected void CargarTablaBanners()
        {
            try
            {
                rptBanners.DataSource = bannerRepo.BannersObtener();
                rptBanners.DataBind();
            }
            catch(Exception ex)
            {
                MostrarAlerta("alert alert-danger alert-dismissible", "bi-exclamation-octagon-fill", ex.Message, "Error!");
            }
        }

        protected void btnInactivarBanner_Click(object sender, CommandEventArgs e)
        {
            try
            {
                string msj = Inactivar(int.Parse(e.CommandArgument.ToString()));

                if (msj.Contains("Error"))
                {
                    MostrarAlerta("alert alert-danger alert-dismissible", "bi-exclamation-octagon-fill", msj, "Error!");
                }
                else
                {
                    MostrarAlerta("alert alert-success alert-dismissible", "bi-check-circle-fill", msj, "Éxito!");
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("alert alert-danger alert-dismissible", "bi-exclamation-octagon-fill", ex.Message, "Error!");
            }
        }

        protected string Inactivar(int idBanner)
        {
            banner.setIdBanner(idBanner);

            return bannerRepo.BannerInactivar(banner);
        }

        protected void LlenarControles(int idBanner)
        {
            try
            {
                banner.setIdBanner(idBanner);
                DataSet ds = bannerRepo.BannerObtenerId(banner);

                if(ds != null)
                {
                    txtTitulo.Text = ds.Tables[0].Rows[0]["Titulo"].ToString();
                    txtDescripcion.Text = ds.Tables[0].Rows[0]["Descripcion"].ToString();
                    ddlEstado.SelectedValue = ds.Tables[0].Rows[0]["Estado"].ToString();
                    imgBanner.Attributes.Add("src", ds.Tables[0].Rows[0]["Imagen"].ToString().Substring(ds.Tables[0].Rows[0]["Imagen"].ToString().IndexOf("img")));
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("alert alert-danger alert-dismissible", "bi-exclamation-octagon-fill", ex.Message, "Error!");
            }
        }
    }
}