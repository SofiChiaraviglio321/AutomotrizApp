﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutomotizApp
{
    internal class FormasPago
    {
        private int idFormaPago;
        private string nombre;

        public FormasPago()
        {
            idFormaPago = 0;
            nombre = String.Empty;
        }

        public int IdFormaPago
        {
            get { return idFormaPago; }
            set { idFormaPago = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public override string ToString()
        {
            return Nombre;
        }
    }
}
