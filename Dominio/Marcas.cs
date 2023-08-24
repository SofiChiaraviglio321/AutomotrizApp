using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutomotizApp
{
    internal class Marcas
    {
        private int idMarca;
        private string marca;

        public Marcas()
        {
            idMarca = 0;
            marca = String.Empty;
        }

        public int IdMarca
        {
            get { return idMarca; }
            set { idMarca = value; }
        }

        public string Marca
        {
            get { return marca; }
            set { marca = value; }
        }


        public override string ToString()
        {
            return Marca;
        }
    }
}
