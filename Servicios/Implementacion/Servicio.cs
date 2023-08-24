using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutomotizApp.Servicios.Interfaz;
using AutomotizApp.Datos.interfaz;
using AutomotizApp.Datos.implementacion;
using System.Data;

namespace AutomotizApp.Servicios.Implementacion
{
    internal class Servicio : IServicio
    {
        private IFacturaAccDto oAccDto;

        public Servicio()
        {
            oAccDto = new FacturaAccDto();
        }

        public List<Cliente> ListaClientes()
        {
            List<Cliente> clientes = new List<Cliente>();
            clientes = oAccDto.listarClientes();
            return clientes;
        }

        public int proximaFactura()
        {
            return oAccDto.proximaFactu();
        }

        public DataTable formasPagos()
        {
            return oAccDto.obtenerFormasPagos();
        }

        public DataTable formasEnvios()
        {
            return oAccDto.obtenerFormasEnvios();
        }

        public DataTable tiposProductos()
        {
            return oAccDto.obtenerTiposProductos();
        }

        public DataTable productosAutopartes()
        {
            return oAccDto.obtenerProductosAutopartes();
        }

        public DataTable productosVehiculos()
        {
            return oAccDto.obtenerProductosVehiculos();
        }

        public DataTable tiposClientes()
        {
            return oAccDto.obtenerTiposClientes();
        }

        public DataTable comboProvincias()
        {
            return oAccDto.obtenerProvincia();
        }

        public DataTable comboLocalidades(int id_Provincia)
        {
            return oAccDto.obtenerLocalidad(id_Provincia);
        }

        public DataTable comboBarrios(int id_localidad)
        {
            return oAccDto.obtenerBarrios(id_localidad);
        }

        public DataTable comboTipoDocumentos()
        {
            return oAccDto.obtenerTipoDocumentos();
        }

        public bool insertarFacturaConDetalles(Factura factura) //inserta factura y detalles
        {
            return oAccDto.insertarFacturaDetalles(factura);
        }

        public bool insertarFacturaConOrdenes(Factura factura) //inserta factura y ordenes
        {
            return oAccDto.insertarFacturaOrdenes(factura);
        }

        public bool insertarFacturaConOrdenesYDetalles(Factura factura) //insertar factura, ordenes y detalles
        {
            return oAccDto.insertarFacturaDetallesOrdenes(factura);
        }

        public DataTable comboAutopartesSinEstado()
        {
            return oAccDto.obtenerProductosAutopartesSinEstado();
        }

        public DataTable comboVehiculosSinEstado()
        {
            return oAccDto.obtenerProductosVehiculosSinEstado();
        }

        public DataTable usuariosLogin()
        {
            return oAccDto.obtenerUsuarios();
        }
    }
}
