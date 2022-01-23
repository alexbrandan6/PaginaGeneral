using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebGeneral.modelo;

namespace WebGeneral.repositorio
{
    public class WBOLoginRepositorio
    {
        public string UsuarioLogear(Usuario usuario)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosUsuarioLogear(ref datos, usuario);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_SYS_Usuario_Logear").Tables[0].Rows[0]["msj"].ToString();
            }
            catch (Exception ex)
            {
                return "Error en consulta de sistema, comuniquese con soporte. " + ex.Message;
            }
        }
        private void ArmarParametrosUsuarioLogear(ref SqlCommand datos, Usuario usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@NombreUsuario", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getNombreUsuario();

            SqlParametros = datos.Parameters.Add("@Contra", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getContra();
        }
    }
}