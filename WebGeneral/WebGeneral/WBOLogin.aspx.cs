using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGeneral.repositorio;
using WebGeneral.modelo;

namespace WebGeneral
{
    public partial class WBOLogin : System.Web.UI.Page
    {
        repositorio.WBOLoginRepositorio loginRepo = new WBOLoginRepositorio();
        modelo.Usuario usuarioModelo = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["NombreUsuario"] = null;
            divAlert.Visible = false;
        }

        protected void btnLogear_Click(object sender, EventArgs e)
        {
            if(txtUsuario.Text == "" || txtContra.Text == "")
            {
                MostrarAlerta("alert alert-warning alert-dismissible", "bi-exclamation-triangle-fill", "* Complete los campos", "Atención!");
            }
            else
            {
                MostrarAlerta("alert alert-success alert-dismissible", "bi-check-circle-fill", "Logeando...", "Éxito!");

                string msj = Logear(txtUsuario.Text.Trim(), txtContra.Text.Trim());

                if (msj == "OK")
                {
                    GuardarSession();
                    Response.Redirect("WBOHome.aspx");
                }
                else
                {
                    MostrarAlerta("alert alert-danger alert-dismissible", "bi-exclamation-octagon-fill", msj, "Error!");
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

        protected string Logear(string usuario, string contra)
        {
            try
            {
                usuarioModelo.setNombreUsuario(usuario);
                usuarioModelo.setContra(contra);
                return loginRepo.UsuarioLogear(usuarioModelo);
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }

        protected void GuardarSession()
        {
            Session["NombreUsuario"] = usuarioModelo.getNombreUsuario();
        }
    }
}