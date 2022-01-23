using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebGeneral.modelo
{
    public class Usuario
    {
        private string nombreUsuario;
        private string contra;

        public Usuario() { }

        public Usuario(string nombreUsuario, string contra)
        {
            this.nombreUsuario = nombreUsuario;
            this.contra = contra;
        }

        public void setNombreUsuario(string nombreUsuario)
        {
            this.nombreUsuario = nombreUsuario;
        }
        public void setContra(string contra)
        {
            this.contra = contra;
        }
        public string getNombreUsuario()
        {
            return this.nombreUsuario;
        }
        public string getContra()
        {
            return this.contra;
        }
    }
    
}