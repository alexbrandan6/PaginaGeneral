using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebGeneral.modelo;

namespace WebGeneral.repositorio
{
    public class WBOBannerRepositorio
    {
        public string BannerGuardar(Banner banner)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosBannerGuardar(ref datos, banner);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Banner_Guardar").Tables[0].Rows[0]["msj"].ToString();
            }
            catch (Exception ex)
            {
                return "Error en consulta de sistema, comuniquese con soporte. " + ex.Message;
            }
        }
        private void ArmarParametrosBannerGuardar(ref SqlCommand datos, Banner banner)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@Titulo", SqlDbType.VarChar, 50);
            SqlParametros.Value = banner.getTitulo();

            SqlParametros = datos.Parameters.Add("@Descripcion", SqlDbType.VarChar, 300);
            SqlParametros.Value = banner.getDescripcion();

            SqlParametros = datos.Parameters.Add("@Imagen", SqlDbType.VarChar, 300);
            SqlParametros.Value = banner.getImagen();

            SqlParametros = datos.Parameters.Add("@Estado", SqlDbType.TinyInt);
            SqlParametros.Value = banner.getEstado();
        }

        public string BannerActualizar(Banner banner, bool withFile)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosBannerActualizar(ref datos, banner, withFile);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Banner_Actualizar").Tables[0].Rows[0]["msj"].ToString();
            }
            catch (Exception ex)
            {
                return "Error en consulta de sistema, comuniquese con soporte. " + ex.Message;
            }
        }
        private void ArmarParametrosBannerActualizar(ref SqlCommand datos, Banner banner, bool withFile)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@idBanner", SqlDbType.Int);
            SqlParametros.Value = banner.getIdBanner();

            SqlParametros = datos.Parameters.Add("@Titulo", SqlDbType.VarChar, 50);
            SqlParametros.Value = banner.getTitulo();

            SqlParametros = datos.Parameters.Add("@Descripcion", SqlDbType.VarChar, 300);
            SqlParametros.Value = banner.getDescripcion();

            SqlParametros = datos.Parameters.Add("@Imagen", SqlDbType.VarChar, 300);
            SqlParametros.Value = banner.getImagen();

            SqlParametros = datos.Parameters.Add("@Estado", SqlDbType.TinyInt);
            SqlParametros.Value = banner.getEstado();

            if(withFile)
            {
                SqlParametros = datos.Parameters.Add("@withFile", SqlDbType.TinyInt);
                SqlParametros.Value = "1";
            }
            else
            {
                SqlParametros = datos.Parameters.Add("@withFile", SqlDbType.TinyInt);
                SqlParametros.Value = "0";
            }
        }

        public string BannerInactivar(Banner banner)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosBannerInactivar(ref datos, banner);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Banner_Inactivar").Tables[0].Rows[0]["msj"].ToString();
            }
            catch (Exception ex)
            {
                return "Error en consulta de sistema, comuniquese con soporte. " + ex.Message;
            }
        }

        private void ArmarParametrosBannerInactivar(ref SqlCommand datos, Banner banner)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@idBanner", SqlDbType.Int);
            SqlParametros.Value = banner.getIdBanner();
        }

        public DataSet BannersObtener()
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Banner_Obtener_Todos");
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet BannerObtenerId(Banner banner)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosBannerObtenerId(ref datos, banner);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Banner_Obtener_Id");
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private void ArmarParametrosBannerObtenerId(ref SqlCommand datos, Banner banner)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@idBanner", SqlDbType.Int);
            SqlParametros.Value = banner.getIdBanner();
        }

        public DataSet BannerObtenerActivo()
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Banner_Obtener_Activo");
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}