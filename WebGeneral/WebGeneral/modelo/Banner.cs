using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebGeneral.modelo
{
    public class Banner
    {
        private int idBanner;
        private string titulo;
        private string descripcion;
        private string imagen;
        private int estado;

        public Banner() { }

        public Banner(int idBanner, string titulo, string descripcion, string imagen, int estado)
        {
            this.idBanner = idBanner;
            this.titulo = titulo;
            this.descripcion = descripcion;
            this.imagen = imagen;
            this.estado = estado;
        }

        public void setIdBanner(int idBanner)
        {
            this.idBanner = idBanner;
        }
        public void setTitulo(string titulo)
        {
            this.titulo = titulo;
        }
        public void setDescripcion(string descripcion)
        {
            this.descripcion = descripcion;
        }
        public void setImagen(string imagen)
        {
            this.imagen = imagen;
        }
        public void setEstado(int estado)
        {
            this.estado = estado;
        }
        public int getIdBanner()
        {
            return this.idBanner;
        }
        public string getTitulo()
        {
            return this.titulo;
        }
        public string getDescripcion()
        {
            return this.descripcion;
        }
        public string getImagen()
        {
            return this.imagen;
        }
        public int getEstado()
        {
            return this.estado;
        }
    }
    
}