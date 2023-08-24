using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutomotizApp.Servicios.Interfaz;

namespace AutomotizApp.Servicios
{
    internal abstract class FabricaServicio
    {
        public abstract IServicio CrearServicio();
    }
}
