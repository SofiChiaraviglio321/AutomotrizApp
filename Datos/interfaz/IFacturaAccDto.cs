using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace AutomotizApp.Datos.interfaz
{
    internal interface IFacturaAccDto
    {
        List<Cliente> listarClientes();

        int proximaFactu();

        DataTable obtenerFormasPagos();

        DataTable obtenerFormasEnvios();

        DataTable obtenerTiposProductos();

        DataTable obtenerTiposClientes();

        DataTable obtenerProductosAutopartes();

        DataTable obtenerProductosVehiculos();

        DataTable obtenerProvincia(); //ultimo o nuevo, para lo de agos.

        DataTable obtenerLocalidad(int id_Provincia); //ultimo o nuevo, para lo de agos.

        DataTable obtenerBarrios(int id_localidad); //ultimo o nuevo, para lo de agos.

        DataTable obtenerTipoDocumentos(); //ultimo o nuevo, para lo de agos.

        bool insertarFacturaDetalles(Factura factura); //inserta factura y detalles

        bool insertarFacturaOrdenes(Factura factura); //inserta factura y ordenes

        bool insertarFacturaDetallesOrdenes(Factura factura); //insertar factura, ordenes y detalles

        DataTable obtenerProductosAutopartesSinEstado(); //Formulario configuracion y estado de producto -- desechado

        DataTable obtenerProductosVehiculosSinEstado(); //Formulario configuracion y estado de producto -- desechado

        DataTable obtenerUsuarios();
    }
}
