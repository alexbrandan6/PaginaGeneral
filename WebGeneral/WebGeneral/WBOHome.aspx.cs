using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebGeneral
{
    public partial class WBOHome1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NombreUsuario"] is null) Response.Redirect("WBOLogin.aspx");

            lblUsuario.InnerText = Session["NombreUsuario"].ToString();
        }
    }
}