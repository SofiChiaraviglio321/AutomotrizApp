using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutomotizApp.Servicios.Interfaz;
using AutomotizApp.Servicios.Implementacion;

namespace AutomotizApp.Servicios
{
    internal class FabricaServicioImp : FabricaServicio
    {
        public override IServicio CrearServicio()
        {
            return new Servicio();
        }
    }
}
