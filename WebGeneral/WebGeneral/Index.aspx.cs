using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGeneral.repositorio;

namespace WebGeneral
{
    public partial class Index : System.Web.UI.Page
    {
        WBOBannerRepositorio bannerRepo = new WBOBannerRepositorio();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarContenido();
        }

        protected void CargarContenido()
        {
            CargarBanner();
        }

        protected void CargarBanner()
        {
            DataSet ds = bannerRepo.BannerObtenerActivo();

            if (ds.Tables[0].Rows.Count > 0)
            {
                hBanner.InnerText = ds.Tables[0].Rows[0]["Titulo"].ToString();
                pBanner.InnerText = ds.Tables[0].Rows[0]["Descripcion"].ToString();
                imgBanner.Attributes.Add("src", ds.Tables[0].Rows[0]["Imagen"].ToString().Substring(ds.Tables[0].Rows[0]["Imagen"].ToString().IndexOf("img")));
            }
            else
            {
                imgBanner.Attributes.Add("src", "img/banner.png");
                hBanner.InnerText = "Sin título";
                pBanner.InnerText = "Sin descripcion";
            }
        }
    }
}