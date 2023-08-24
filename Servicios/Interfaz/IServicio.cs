using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace AutomotizApp.Servicios.Interfaz
{
    internal interface IServicio
    {
        List<Cliente> ListaClientes();

        int proximaFactura();

        DataTable formasPagos();

        DataTable formasEnvios();

        DataTable tiposProductos();

        DataTable tiposClientes();

        DataTable productosAutopartes();

        DataTable productosVehiculos();

        DataTable comboProvincias(); //ultimo o nuevo, para lo de agos.

        DataTable comboLocalidades(int id_Provincia); //ultimo o nuevo, para lo de agos.

        DataTable comboBarrios(int id_localidad); //ultimo o nuevo, para lo de agos.

        DataTable comboTipoDocumentos();

        bool insertarFacturaConDetalles(Factura factura); //inserta factura y detalles

        bool insertarFacturaConOrdenes(Factura factura); //inserta factura y ordenes

        bool insertarFacturaConOrdenesYDetalles(Factura factura); //insertar factura, ordenes y detalles

        DataTable comboAutopartesSinEstado(); //--Desechado

        DataTable comboVehiculosSinEstado();  //--Desechado

        DataTable usuariosLogin();
    }


}
