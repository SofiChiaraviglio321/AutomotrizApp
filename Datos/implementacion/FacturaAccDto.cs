using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutomotizApp.Datos.interfaz;
using System.Data;

namespace AutomotizApp.Datos.implementacion
{
    internal class FacturaAccDto : IFacturaAccDto
    {
        

        public List<Cliente> listarClientes()
        {
            List<Cliente> clientes = new List<Cliente>();
            DataTable tabla = new DataTable();
            tabla = accesoDatos.ObtenerInstancia().Consulta("SP_ListaClientes");
            foreach(DataRow fila in tabla.Rows)
            {
                TiposClientes tipo = new TiposClientes();
                Cliente c = new Cliente();
                c.IdCliente = Convert.ToInt32(fila["id_cliente"].ToString());
                c.Nombre = fila["nombre"].ToString();
                c.Apellido = fila["apellido"].ToString();
                c.NumeroDocumento = Convert.ToInt32(fila["num_doc"].ToString());
                tipo.IdTipoCliente = Convert.ToInt32(fila["id_tipo_cliente"].ToString());
                c.TipoCliente = tipo;
                clientes.Add(c);
            }
            return clientes;
        }

        public int proximaFactu()
        {
            int proximaFactu;
            proximaFactu = accesoDatos.ObtenerInstancia().facturaNro("SP_ultimaFactura");
            proximaFactu += 1;
            return proximaFactu;
        }

        public DataTable obtenerFormasPagos()
        {
            DataTable tabla = new DataTable();
            tabla = accesoDatos.ObtenerInstancia().Consulta("SP_FormaPago");
            return tabla;
        }

        public DataTable obtenerFormasEnvios()
        {
            DataTable tabla = new DataTable();
            tabla = accesoDatos.ObtenerInstancia().Consulta("SP_FormaEnvio");
            return tabla;
        }

        public DataTable obtenerTiposProductos()
        {
            DataTable tabla = new DataTable();
            tabla = accesoDatos.ObtenerInstancia().Consulta("SP_tipoProducto");
            return tabla;
        }

        public DataTable obtenerProductosAutopartes()
        {
            DataTable tabla = new DataTable();
            tabla = accesoDatos.ObtenerInstancia().Consulta("SP_prodcutosAutopartes");
            return tabla;
        }

        public DataTable obtenerProductosVehiculos()
        {
            DataTable tabla = new DataTable();
            tabla = accesoDatos.ObtenerInstancia().Consulta("SP_prodcutosVehiculos");
            return tabla;
        }

        public DataTable obtenerTiposClientes()
        {
            DataTable tabla = new DataTable();
            tabla = accesoDatos.ObtenerInstancia().Consulta("SP_tipoCliente");
            return tabla;
        }

        public DataTable obtenerProvincia() //ultimo o nuevo, para lo de agos.
        {
            DataTable table = new DataTable();
            table = accesoDatos.ObtenerInstancia().Consulta("SP_comboProvincias");
            return table;

        }

        public DataTable obtenerLocalidad(int id_Provincia) //ultimo o nuevo, para lo de agos.
        {
            DataTable table = new DataTable();
            table = accesoDatos.ObtenerInstancia().ConsultarLocalidades("SP_comboLocalidades", id_Provincia);
            return table;

        }

        public DataTable obtenerBarrios(int id_localidad) //ultimo o nuevo, para lo de agos.
        {
            DataTable table = new DataTable();
            table = accesoDatos.ObtenerInstancia().ConsultarBarrios("SP_comboBarrios", id_localidad);
            return table;

        }

        public DataTable obtenerTipoDocumentos() //ultimo o nuevo, para lo de agos.
        {
            DataTable tabla = new DataTable();
            tabla = accesoDatos.ObtenerInstancia().Consulta("SP_tipoDocumentos");
            return tabla;
        }

        public bool insertarFacturaDetalles(Factura factura) //inserta factura y detalles
        {
            bool aux;
            aux = accesoDatos.ObtenerInstancia().InsertarFacturaConDetalles("SP_Maestro", "SP_DetalleFactura", factura);
            return aux;
        }

        public bool insertarFacturaOrdenes(Factura factura) //inserta factura y ordenes
        {
            bool aux;
            aux = accesoDatos.ObtenerInstancia().InsertarFacturaConOrdenes("SP_Maestro", "SP_DetalleOrdenFactura", factura);
            return aux;
        }

        public bool insertarFacturaDetallesOrdenes(Factura factura) //insertar factura, ordenes y detalles
        {
            bool aux;
            aux = accesoDatos.ObtenerInstancia().InsertarFacturaConDetallesYOrdenes("SP_Maestro", "SP_DetalleOrdenFactura", "SP_DetalleFactura", factura);
            return aux;
        }

        public DataTable obtenerProductosAutopartesSinEstado() //Formulario configuracion y estado de producto
        {
            DataTable tabla = new DataTable();
            tabla = accesoDatos.ObtenerInstancia().Consulta("productosAutopartesSinEstado");
            return tabla;
        }

        public DataTable obtenerProductosVehiculosSinEstado() //Formulario configuracion y estado de producto
        {
            DataTable tabla = new DataTable();
            tabla = accesoDatos.ObtenerInstancia().Consulta("productosVehiculosSinEstado");
            return tabla;
        }

        public DataTable obtenerUsuarios()
        {
            DataTable tabla = new DataTable();
            tabla = accesoDatos.ObtenerInstancia().Consulta("SP_Usuarios");
            return tabla;
        }
    }
}
