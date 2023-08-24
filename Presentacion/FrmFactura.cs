using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AutomotizApp.Presentacion;
using AutomotizApp.Servicios;
using AutomotizApp.Servicios.Interfaz;
//using AutomotizApp.Servicios.Implementacion;

namespace AutomotizApp.Presentacion
{

    //_El interés solo se caluclará para los clientes "consumidorFinal", que hayan chequeado el checkbox Autoplan y solo podra cargar vehículos bajo esta condición
    //_El descuento se calculará para los clientes "VendedorasDeAutopartes" , dicho cálculo sólo será realizado sobre los tipo de prodcutos llamados AutoPartes! De este modo
    //el tipo de cliente "VendedorasDeAutopartes" podrá adquirir Autopartes y percibir descuentos por ellos (monto >= 250K -> dcto 3% | monto >= 400K -> dcto 8% | monto >= 600k -> dcto 21%)
    //pero además podrá añadir libremente vehículos, donde los descuentos NO SE APLICARAN.

    //if(FrmFactura.)
    public partial class FrmFactura : Form
    {
        private FabricaServicio oFabrica;
        private IServicio oServicio;
        private List<Cliente> clientes;
        private Cliente cliente;
        private Factura factura;
        private decimal totalFacturado;
        private decimal interes;
        private decimal descuento;
        private decimal totalFianl;

        public FrmFactura()
        {
            InitializeComponent();
            clientes = new List<Cliente>();
            oFabrica = new FabricaServicioImp();
            oServicio = oFabrica.CrearServicio();
            cliente = new Cliente();
            factura = new Factura();
            totalFacturado = 0;
            interes = 0;
            descuento = 0;
            totalFianl = 0;
        }

        private void FrmFactura_Load(object sender, EventArgs e)
        {
            dtpFecha.Enabled = false;
            dtpFecha.Value = DateTime.Now;
            txtClienteApellido.Enabled = false;
            txtClienteNombre.Enabled = false;
            grpFactura.Enabled = false;
            grpboxProductos.Enabled = false;
            btnAceptar.Enabled = false;
            txtPrecio.Enabled = false;
            txtStock.Enabled = false;
            txtStockMinimo.Enabled = false;
            actualizarLista();
            facturaNro();
            comboFormasPagos();
            comboFormasEnvios();
            comboTipoProductos();
            comboTipoClientes();
        }
        public void comboTipoClientes()
        {
            cboTipo.DataSource = oServicio.tiposClientes();
            cboTipo.ValueMember = "id_tipo_cliente";
            cboTipo.DisplayMember = "descripcion";
        }

        public void comboFormasPagos()
        {
            cboFormaPago.DataSource = oServicio.formasPagos();
            cboFormaPago.DisplayMember = "forma_pago";
            cboFormaPago.ValueMember = "id_forma_pago";
        }

        public void comboFormasEnvios()
        {
            cboFormaEnvio.DataSource = oServicio.formasEnvios();
            cboFormaEnvio.DisplayMember = "forma_envio";
            cboFormaEnvio.ValueMember = "id_forma_envio";
        }

        public void comboTipoProductos()
        {
            cboTipoProducto.DataSource = oServicio.tiposProductos();
            cboTipoProducto.DisplayMember = "descripcion";
            cboTipoProducto.ValueMember = "id_tipo_producto";
        }
        public void facturaNro()
        {
            int proxFactu = oServicio.proximaFactura();
            if (proxFactu > 0)
                lblFacturaNro.Text = "Factura #: " + proxFactu;
            else
                lblFacturaNro.Text = "Factura #: " + 1;
        }

        public void actualizarLista()
        {
            clientes.Clear();
            lstClientes.Items.Clear();
            clientes = oServicio.ListaClientes();
            lstClientes.Items.AddRange(clientes.ToArray());

        }
        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void grpboxCLiente_Enter(object sender, EventArgs e)
        {

        }

        public bool validarDocumento()
        {
            bool aux;
            aux = true;
            if (txtDocumento.Text == String.Empty)
            {
                MessageBox.Show("Debe ingresar un Nro de Documento", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                txtDocumento.Focus();
                return false;

            }
            else
            {
                try
                {
                    Convert.ToInt32(txtDocumento.Text);
                }
                catch
                {
                    MessageBox.Show("Debe ingresar un Nro de Documento válido", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtDocumento.Focus();
                    return false;
                }
            }
            return aux;
        }

        private bool existeCliente()
        {
            bool aux = false;
            for (int i = 0; i < clientes.Count; i++)
            {
                if (clientes[i].NumeroDocumento.Equals(Convert.ToInt32(txtDocumento.Text)))
                {
                    cliente = clientes[i];
                    txtClienteApellido.Text = cliente.Apellido;
                    txtClienteNombre.Text = cliente.Nombre;
                    cboTipo.SelectedValue = cliente.TipoCliente.IdTipoCliente;

                    aux = true;
                    break;
                }
            }
            return aux;
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (validarDocumento())
            {
                if (existeCliente())
                {
                    if (cliente.IdCliente > 0)
                    {
                        habilitarCliente(false);
                        grpFactura.Enabled = true;
                        grpboxProductos.Enabled = true;
                        btnAtras.Enabled = true;
                        btnAceptar.Enabled = true;
                        txtDocumento.Text = String.Empty;
                        lstClientes.SelectedIndex = -1;
                        cboTipo.Enabled = false;
                        txtInteres.Enabled = false;
                        txtDescuento.Enabled = false;
                        cboTipoProducto.Focus();
                    }
                }
                else
                {
                    MessageBox.Show("El documento ingresado no se encuentra. Intentelo nuevamente", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

            }
        }

        private void lstClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            int posicion = lstClientes.SelectedIndex;
            if (posicion > -1)
            {
                cliente = clientes[posicion];
                txtClienteApellido.Text = cliente.Apellido;
                txtClienteNombre.Text = cliente.Nombre;
                cboTipo.SelectedValue = cliente.TipoCliente.IdTipoCliente;

            }
        }

        public void habilitarCliente(bool x)
        {
            txtDocumento.Enabled = x;
            btnBuscar.Enabled = x;
            lstClientes.Enabled = x;
            btnSiguiente.Enabled = x;
        }
        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            if (cliente.IdCliente > 0)
            {
                habilitarCliente(false);
                grpFactura.Enabled = true;
                grpboxProductos.Enabled = true;
                btnAtras.Enabled = true;
                btnAceptar.Enabled = true;
                txtDocumento.Text = String.Empty;
                cboTipo.Enabled = false;
                txtInteres.Enabled = false;
                txtDescuento.Enabled = false;
                cboTipoProducto.Focus();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un Cliente", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnAtras_Click(object sender, EventArgs e)
        {
            habilitarCliente(true);
            grpFactura.Enabled = false;
            grpboxProductos.Enabled = false;
            btnAceptar.Enabled = false;
            chkAutoPlan.Checked = false;
            cboCuotas.SelectedIndex = -1;
            limpiarFactura();
            
        }

        private void limpiarFactura()
        {
            totalFacturado = 0;
            interes = 0;
            descuento = 0;
            totalFianl = 0;
            lblDescuento.Text = "Descuento total: ";
            lblInteres.Text = "Interés total: ";
            lblSubTotal.Text = "Sub total: ";
            lblTotal.Text = "Total: ";
            dgvDetalles.Rows.Clear();
            dgvOrdenes.Rows.Clear();
            factura.LimpiarDetalle();
            factura.LimpiarDetalleOrden();
            txtInteres.Text = "0";
            txtDescuento.Text = "0";
            dtpFechaEntrega.Value = DateTime.Now;
            numCantidad.Value = 0;
            chkAutoPlan.Checked = false;
        }
        private void cboTipoProducto_SelectedIndexChanged(object sender, EventArgs e) //------------------
        {
            DataTable tabla = new DataTable();
            if (cboTipoProducto.Text == "AutoPartes")
            {

                tabla = oServicio.productosAutopartes();   //El estado de los productos listado es activo, es decir, que su atributo estado es = a 1
                cboProducto.DataSource = tabla;
                cboProducto.ValueMember = "id_producto";
                cboProducto.DisplayMember = "nombre";
            }
            else
            {

                tabla = oServicio.productosVehiculos();    //El estado de los productos listado es activo, es decir, que su atributo estado es = a 1
                cboProducto.DataSource = tabla;
                cboProducto.ValueMember = "id_producto";
                cboProducto.DisplayMember = "nombre";
            }
            int posicion = cboProducto.SelectedIndex;
            txtPrecio.Text = tabla.Rows[posicion].ItemArray[5].ToString();
            txtStock.Text = tabla.Rows[posicion].ItemArray[3].ToString();
            txtStockMinimo.Text = tabla.Rows[posicion].ItemArray[4].ToString();
        }

        private void cboProducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable tabla = new DataTable();
            if (cboTipoProducto.Text == "AutoPartes")
            {
                int i = cboProducto.SelectedIndex;
                tabla = oServicio.productosAutopartes();   //El estado de los productos listado es activo, es decir, que su atributo estado es = a 1
                txtPrecio.Text = Convert.ToString(tabla.Rows[i].ItemArray[5].ToString());
                txtStock.Text = tabla.Rows[i].ItemArray[3].ToString();
                txtStockMinimo.Text = tabla.Rows[i].ItemArray[4].ToString();
            }
            else
            {
                int i = cboProducto.SelectedIndex;
                tabla = oServicio.productosVehiculos();    //El estado de los productos listado es activo, es decir, que su atributo estado es = a 1
                txtPrecio.Text = tabla.Rows[i].ItemArray[5].ToString();
                txtStock.Text = tabla.Rows[i].ItemArray[3].ToString();
                txtStockMinimo.Text = tabla.Rows[i].ItemArray[4].ToString();
            }
        }

        public bool validarProducto()
        {

            if (cboTipoProducto.SelectedIndex < 0)
            {
                MessageBox.Show("Debe seleccionar tipo de producto", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cboTipoProducto.Focus();
                return false;
            }
            if (cboProducto.SelectedIndex < 0)
            {
                MessageBox.Show("Debe seleccionar un producto", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cboProducto.Focus();
                return false;
            }
            if (numCantidad.Value < 1)
            {
                MessageBox.Show("La cantidad seleccionada debe ser mayor o igual que 1", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                numCantidad.Focus();
                return false;
            }
            return true;
        }

        public bool existeProducto(int c)
        {
            bool aux = false;
            foreach (DataGridViewRow item in dgvDetalles.Rows)
            {
                if (item.Cells["Producto"].Value.ToString().Equals(cboProducto.Text))
                {
                    int cantidad;
                    int cantidadASumar;
                    decimal precio;
                    cantidad = Convert.ToInt32(item.Cells["Cantidad"].Value.ToString()); //Cantidad que ya había
                    cantidadASumar = Convert.ToInt32(numCantidad.Value);                                          //Cantidad que vamos a sumar
                    precio = Convert.ToDecimal(item.Cells["Precio"].Value.ToString());

                    if ((cantidad + cantidadASumar) > c)
                    {
                        MessageBox.Show("La cantidad total que se intenta ingresar de este producto supera el stock disponible. Puede generar una orden de pedido para el excedente", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        aux = true;
                        dtpFechaEntrega.Focus();
                        break;
                    }
                    else
                    {
                        item.Cells["Cantidad"].Value = (cantidad + cantidadASumar);
                        int posicion = Convert.ToInt32(item.Index);
                        factura.ModificarListaDetalles(posicion, cantidadASumar);
                        decimal o = Convert.ToDecimal(cantidadASumar) * precio;
                        totalFacturado += o;
                        lblSubTotal.Text = "Sub Total: " + totalFacturado;
                        aux = true;
                        calcularDescuento();
                        calcularTotalFinal();
                        break;

                    }
                }
            }
            return aux;

        }

        public bool existeProductoEnOrdenes()
        {
            bool aux = false;
            foreach (DataGridViewRow item in dgvOrdenes.Rows)
            {
                if (item.Cells["ProductoOrden"].Value.ToString().Equals(cboProducto.Text) && item.Cells["FechaEntrega"].Value.Equals(dtpFechaEntrega.Value))
                {
                    int cantidad;
                    int cantidadASumar;
                    cantidad = Convert.ToInt32(item.Cells["CantidadOrden"].Value.ToString());         //Cantidad que ya había
                    cantidadASumar = Convert.ToInt32(numCantidad.Value);                              //Cantidad que vamos a sumar
                    decimal precio = Convert.ToDecimal(item.Cells["PrecioOrden"].Value.ToString());

                    item.Cells["CantidadOrden"].Value = (cantidad + cantidadASumar);
                    int posicion = Convert.ToInt32(item.Index);
                    factura.ModificarListaDetallesOrdenes(posicion, cantidadASumar);      //debe modificar la orden
                    aux = true;
                    //Aca hay que actualizar Totales, interes y descuento
                    //decimal o = Convert.ToDecimal(cantidadASumar) * precio;
                    //totalFacturado += o;
                    calcularIntereses();
                    calcularTotalesAgregados(cantidadASumar, precio);
                    calcularDescuento();
                    calcularTotalFinal();
                    //lblTotal.Text = "Total: " + totalFacturado;

                    break;

                }
            }
            return aux;

        }

        private void btnAgregar_Click(object sender, EventArgs e) //Botón agregar fila a Detalles
        {
            if (validarProducto())
            {
                if (cboTipoProducto.Text == "vehículos")
                {
                    MessageBox.Show("La venta de vehículos deben cargarse como orden de pedido indicando su fecha de entrega", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    dtpFechaEntrega.Focus();
                }
                else
                {
                    int a = Convert.ToInt32(txtStock.Text);
                    int b = Convert.ToInt32(txtStockMinimo.Text);
                    int c = a - b;
                    if (c < Convert.ToInt32(numCantidad.Value))
                    {
                        MessageBox.Show("La cantidad ingresada no se encuentra en stock para este producto. Puede generar una orden de pedido para el mismo", "Sistema", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation);

                    }
                    else
                    {
                        if (!existeProducto(c))
                        {
                            Producto producto = new Producto();
                            producto.IdProducto = Convert.ToInt32(cboProducto.SelectedValue);
                            producto.Nombre = cboProducto.Text;
                            DetalleFactura detalle = new DetalleFactura();
                            detalle.Producto = producto;
                            detalle.Cantidad = Convert.ToInt32(numCantidad.Value);
                            detalle.PrecioUnitario = Convert.ToDecimal(txtPrecio.Text);

                            dgvDetalles.Rows.Add(new object[] { detalle.Producto.Nombre, detalle.PrecioUnitario, detalle.Cantidad });
                            factura.AgregarListaDetalle(detalle);
                            //Aca hay que actualizar Totales, interes y descuento

                            calcularTotalesAgregados(detalle.Cantidad, detalle.PrecioUnitario);
                            calcularDescuento();
                            calcularTotalFinal();

                        }
                    }
                }
            }
        }

        private void calcularTotalesAgregados(int cantidad, decimal precio)
        {
            decimal item = (cantidad * precio);
            totalFacturado = totalFacturado + item;
            //totalFacturado += interes;
            lblSubTotal.Text = "Sub Total: " + totalFacturado;


        }

        private void calcularDescuento()
        {
            if (cboTipo.Text == "VendedoraDeAutopartes")
            {
                descuento = 0;
                DataTable tabla = oServicio.productosAutopartes();

                decimal total = 0;
                decimal totalOrden = 0;
                decimal totalDetalle = 0;
                foreach (DataGridViewRow item in dgvOrdenes.Rows)
                {

                    foreach (DataRow fila in tabla.Rows)
                    {
                        string nombreProdu = fila.ItemArray[1].ToString();
                        if (item.Cells["ProductoOrden"].Value.ToString().Equals(nombreProdu))
                        {
                            decimal precio = Convert.ToDecimal(item.Cells["PrecioOrden"].Value.ToString());
                            int cantidad = Convert.ToInt32(item.Cells["CantidadOrden"].Value.ToString());

                            decimal subTotal = (precio * cantidad);


                            totalOrden += subTotal;
                            //decimal interesAplicado = 3;
                            //decimal interesRow = total * (interesAplicado / 100);

                            //subtotal += interesRow;
                            //interes += interesRow;
                            break;
                        }
                    }
                }

                foreach (DataGridViewRow item in dgvDetalles.Rows)
                {

                    foreach (DataRow fila in tabla.Rows)
                    {
                        string nombreProducto = fila.ItemArray[1].ToString();
                        if (item.Cells["Producto"].Value.ToString().Equals(nombreProducto))
                        {
                            decimal precio2 = Convert.ToDecimal(item.Cells["Precio"].Value.ToString());
                            int cantidad2 = Convert.ToInt32(item.Cells["Cantidad"].Value.ToString());

                            decimal subTotal2 = (precio2 * cantidad2);


                            totalDetalle += subTotal2;
                            //decimal interesAplicado = 3;
                            //decimal interesRow = total * (interesAplicado / 100);

                            //subtotal += interesRow;
                            //interes += interesRow;
                            break;
                        }
                    }
                }
                total = totalDetalle + totalOrden;
                if (total >= 600000)
                {
                    descuento = (total * 21) / 100;  // Autopartista que compra más de 600K en autopartes = descuento del 21%
                    txtDescuento.Text = "21";
                    lblDescuento.Text = "Descuento total: " + descuento;
                }
                else
                {
                    if (total >= 400000)
                    {
                        descuento = (total * 8) / 100;
                        txtDescuento.Text = "8";
                        lblDescuento.Text = "Descuento total: " + descuento;
                    }
                    else
                    {
                        if (total >= 250000)
                        {
                            descuento = (total * 3) / 100;
                            txtDescuento.Text = "3";
                            lblDescuento.Text = "Descuento total: " + descuento;
                        }
                        else
                        {
                            descuento = 0;
                            txtDescuento.Text = "0";
                            lblDescuento.Text = "Descuento total: " + descuento;
                        }
                    }
                }
                //descuento = totalOrden;
                //lblDescuento.Text = "Descuento total: " + descuento;
            }
        }

        private void calcularTotalesQuitados(int cantidad, decimal precio)
        {
            decimal item = cantidad * precio;
            totalFacturado = totalFacturado - item;
            lblSubTotal.Text = "Sub Total: " + totalFacturado;
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btnAgregarOrden_Click(object sender, EventArgs e)  //Botón agregar fila a Ordenes
        {
            if (validarProducto())
            {
                if (dtpFechaEntrega.Value > DateTime.Now)
                {
                    if (!existeProductoEnOrdenes())
                    {
                        Producto producto = new Producto();
                        producto.IdProducto = Convert.ToInt32(cboProducto.SelectedValue);
                        producto.Nombre = cboProducto.Text;
                        DetalleOrdenPedido detalle = new DetalleOrdenPedido();
                        detalle.Producto = producto;
                        detalle.Cantidad = Convert.ToInt32(numCantidad.Value);
                        detalle.PrecioUnitario = Convert.ToDecimal(txtPrecio.Text);
                        detalle.FechaEntrega = dtpFechaEntrega.Value;

                        dgvOrdenes.Rows.Add(new object[] { detalle.Producto.Nombre, detalle.PrecioUnitario, detalle.Cantidad, detalle.FechaEntrega });
                        factura.AgregarListaDetalleOrden(detalle);

                        calcularTotalesAgregados(detalle.Cantidad, detalle.PrecioUnitario); //Aca hay que actualizar Totales, interes y descuento
                        calcularIntereses();
                        calcularDescuento();
                        calcularTotalFinal();
                    }

                }
                else
                {
                    MessageBox.Show("Debe indicar una fecha de entrega, superior a la fecha actual", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    dtpFechaEntrega.Focus();

                }
            }
        }

        private void dgvDetalles_CellContentClick(object sender, DataGridViewCellEventArgs e) // Elimina una fila en Detalles
        {
            if (dgvDetalles.CurrentRow != null)
            {

                int posicion = Convert.ToInt32(dgvDetalles.CurrentRow.Index);


                int cantidad = Convert.ToInt32(dgvDetalles.Rows[posicion].Cells["Cantidad"].Value.ToString());
                decimal precio = Convert.ToDecimal(dgvDetalles.Rows[posicion].Cells["Precio"].Value.ToString());
                calcularTotalesQuitados(cantidad, precio); //Aca hay que actualizar Totales, interes y descuento

                dgvDetalles.Rows.RemoveAt(posicion);
                factura.EliminarDetalle(posicion);
                calcularDescuento();
                calcularTotalFinal();
            }

        }

        private void dgvOrdenes_CellContentClick(object sender, DataGridViewCellEventArgs e) // Elimina una fila en Ordenes
        {
            if (dgvOrdenes.CurrentRow != null)
            {
                int posicion = Convert.ToInt32(dgvOrdenes.CurrentRow.Index);


                int cantidad = Convert.ToInt32(dgvOrdenes.Rows[posicion].Cells["CantidadOrden"].Value.ToString());
                decimal precio = Convert.ToDecimal(dgvOrdenes.Rows[posicion].Cells["PrecioOrden"].Value.ToString());
                calcularTotalesQuitados(cantidad, precio); //Aca hay que actualizar Totales, interes y descuento

                dgvOrdenes.Rows.RemoveAt(posicion);
                factura.EliminarDetalleOrden(posicion);
                //totalFacturado -= interes;
                calcularIntereses();
                calcularDescuento();
                calcularTotalFinal();

            }
        }

        private void grpFactura_Enter(object sender, EventArgs e) //            IGNORAR.     Se abrió este evento sin querer
        {

        }

        private void txtDescuento_Click(object sender, EventArgs e)  //         IGNORAR.     Se descarto la utilidad de este método
        {
        }

        private void txtDescuento_TextChanged(object sender, EventArgs e) //    IGNORAR.     Se abrió este evento sin querer
        {
        }

        private void txtInteres_Click(object sender, EventArgs e)  //           IGNORAR.     Se descarto la utilidad de este método
        {
        }

        private void textBox1_TextChanged(object sender, EventArgs e) //        IGNORAR.     Se abrió este evento sin querer
        {

        }

        private void cboTipo_SelectedIndexChanged(object sender, EventArgs e)  //cboTipo (cliente), desencadena checkbox si está seleccionado consumidor final, quien puede optar por un plan de pagos en cuotas o no.
        {
            if (cboTipo.Text == "consumidorFinal")
            {
                chkAutoPlan.Enabled = true;
            }
            else
            {
                chkAutoPlan.Enabled = false;
                cboCuotas.Enabled = false;
            }

            //if(cboTipo.Text == "VendedoraDeAutopartes")
            //{
            //    cboFormaPago.SelectedValue = 3;
            //    cboFormaPago.Enabled = false;
            //}
            //else
            //{
            //    cboFormaPago.Enabled = true;
            //}
        }

        private void chkAutoPlan_CheckedChanged(object sender, EventArgs e) //Desencadenado el check por el cboTipo cuando esta seleccionado "consumidorFinal", si este es seleccionado habilita el cboCuotas
        {
            if (chkAutoPlan.Checked)
            {
                int estado = 0;
                DataTable tabla = oServicio.productosAutopartes();
                int totalprductosAutoPArtes = tabla.Rows.Count;
                foreach (DataGridViewRow item in dgvOrdenes.Rows)
                {
                    for (int i = 0; i < totalprductosAutoPArtes; i++)
                    {


                        if (item.Cells["ProductoOrden"].Value.ToString().Equals(tabla.Rows[i].ItemArray[1].ToString()))
                        {
                            MessageBox.Show("Solamente puede añadir vehículos para utilizar el Autoplan. Revise la carga de datos", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            estado = 1;
                            chkAutoPlan.Checked = false;
                            break;

                        }
                    }
                    if (estado == 1)
                    {
                        break;
                    }
                }
                foreach (DataGridViewRow item2 in dgvDetalles.Rows)
                {
                    for (int i = 0; i < totalprductosAutoPArtes; i++)
                    {

                        if (estado == 0) //Si el estado del foreach anterior cambia la variable estado a 1, entonces ya no tiene sentido revisar el Detalle porque hay una autoparte cargada, la cual debe restringirse
                        {
                            if (item2.Cells["Producto"].Value.ToString().Equals(tabla.Rows[i].ItemArray[1].ToString()))
                            {
                                MessageBox.Show("Solamente puede añadir vehículos para utilizar el Autoplan. Revise la carga de datos", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                estado = 1;
                                chkAutoPlan.Checked = false;
                                break;

                            }
                        }
                        else
                        {
                            break;
                        }
                    }
                    if (estado == 1)
                    {
                        break;
                    }
                }
                if (estado == 0)
                {
                    cboCuotas.Enabled = true;
                    cboCuotas.SelectedIndex = 0;        //valor x defecto del cboCuotas al seleccionar el chkbox
                    cboTipoProducto.SelectedValue = 2;
                    cboTipoProducto.Enabled = false;

                    cboFormaPago.Enabled = false;
                    cboFormaPago.Text = "Crédito";

                    calcularTotalFinal();
                }
                else
                {
                    if (dgvDetalles.Rows.Count < 1)
                    {
                        dgvOrdenes.Focus();
                    }
                    else
                    {
                        dgvDetalles.Focus();
                    }
                }
            }
            else
            {
                cboCuotas.Enabled = false;
                cboCuotas.SelectedIndex = -1;
                txtInteres.Text = "0";
                cboTipoProducto.Enabled = true;

                cboFormaPago.Enabled = true;

                interes = 0;
                lblInteres.Text = "Interés total: " + interes;
                calcularTotalFinal();
            }
        }

        private void cboCuotas_SelectedIndexChanged(object sender, EventArgs e) //Una vez seleccionada la cantidad de cuotas, se cargara el txtInteres con el % de recargo
        {
            if (cboCuotas.Text == "3")
            {
                txtInteres.Text = "3";
            }
            else
            {
                if (cboCuotas.Text == "6")
                {
                    txtInteres.Text = "7";
                }
                else
                {
                    if (cboCuotas.Text == "12")
                    {
                        txtInteres.Text = "15";
                    }
                    else
                    {
                        if (cboCuotas.Text == "18")
                        {
                            txtInteres.Text = "21";
                        }
                        else
                        {
                            if (cboCuotas.Text == "24")
                            {
                                txtInteres.Text = "30";
                            }
                        }
                    }
                }
            }

            calcularIntereses();
            calcularTotalFinal();
        }

        private void calcularIntereses() //Calcula intereses para los tipos de cliente "consumidorFinal" que tílden el checkbox Autoplan
        {
            if (cboCuotas.SelectedIndex == 0) // para 3 cuotas, el interés es de 3%
            {
                interes = 0;
                DataTable tabla = oServicio.productosVehiculos();
                decimal subtotal = 0;
                foreach (DataGridViewRow item in dgvOrdenes.Rows)
                {

                    foreach (DataRow fila in tabla.Rows)
                    {
                        string nombreProdu = fila.ItemArray[1].ToString();
                        if (item.Cells["ProductoOrden"].Value.ToString().Equals(nombreProdu))
                        {
                            decimal precio = Convert.ToDecimal(item.Cells["PrecioOrden"].Value.ToString());
                            int cantidad = Convert.ToInt32(item.Cells["Cantidadorden"].Value.ToString());

                            decimal total = (precio * cantidad);
                            decimal interesAplicado = 3;
                            decimal interesRow = total * (interesAplicado / 100);

                            subtotal += interesRow;
                            //interes += interesRow;
                            break;

                        }
                    }
                }
                interes = subtotal;
                lblInteres.Text = "Interés total: " + interes;
            }
            else
            {
                if (cboCuotas.SelectedIndex == 1) // para 6 cuotas, el interés es de 7%
                {
                    interes = 0;
                    DataTable tabla = oServicio.productosVehiculos();
                    decimal subtotal = 0;
                    foreach (DataGridViewRow item in dgvOrdenes.Rows)
                    {

                        foreach (DataRow fila in tabla.Rows)
                        {
                            string nombreProdu = fila.ItemArray[1].ToString();
                            if (item.Cells["ProductoOrden"].Value.ToString().Equals(nombreProdu))
                            {
                                decimal precio = Convert.ToDecimal(item.Cells["PrecioOrden"].Value.ToString());
                                int cantidad = Convert.ToInt32(item.Cells["Cantidadorden"].Value.ToString());

                                decimal total = (precio * cantidad);
                                decimal interesAplicado = 7;
                                decimal interesRow = total * (interesAplicado / 100);

                                subtotal += interesRow;
                                //interes += interesRow;
                                break;

                            }
                        }
                    }
                    interes = subtotal;
                    lblInteres.Text = "Interés total: " + interes;
                }
                else
                {
                    if (cboCuotas.SelectedIndex == 2) // para 12 cuotas, el interés es de 15%
                    {
                        interes = 0;
                        DataTable tabla = oServicio.productosVehiculos();
                        decimal subtotal = 0;
                        foreach (DataGridViewRow item in dgvOrdenes.Rows)
                        {

                            foreach (DataRow fila in tabla.Rows)
                            {
                                string nombreProdu = fila.ItemArray[1].ToString();
                                if (item.Cells["ProductoOrden"].Value.ToString().Equals(nombreProdu))
                                {
                                    decimal precio = Convert.ToDecimal(item.Cells["PrecioOrden"].Value.ToString());
                                    int cantidad = Convert.ToInt32(item.Cells["Cantidadorden"].Value.ToString());

                                    decimal total = (precio * cantidad);
                                    decimal interesAplicado = 15;
                                    decimal interesRow = total * (interesAplicado / 100);

                                    subtotal += interesRow;
                                    //interes += interesRow;
                                    break;

                                }
                            }
                        }
                        interes = subtotal;
                        lblInteres.Text = "Interés total: " + interes;

                    }
                    else
                    {
                        if (cboCuotas.SelectedIndex == 3) // para 18 cuotas, el interés es de 21%
                        {
                            interes = 0;
                            DataTable tabla = oServicio.productosVehiculos();
                            decimal subtotal = 0;
                            foreach (DataGridViewRow item in dgvOrdenes.Rows)
                            {

                                foreach (DataRow fila in tabla.Rows)
                                {
                                    string nombreProdu = fila.ItemArray[1].ToString();
                                    if (item.Cells["ProductoOrden"].Value.ToString().Equals(nombreProdu))
                                    {
                                        decimal precio = Convert.ToDecimal(item.Cells["PrecioOrden"].Value.ToString());
                                        int cantidad = Convert.ToInt32(item.Cells["Cantidadorden"].Value.ToString());

                                        decimal total = (precio * cantidad);
                                        decimal interesAplicado = 21;
                                        decimal interesRow = total * (interesAplicado / 100);

                                        subtotal += interesRow;
                                        //interes += interesRow;
                                        break;

                                    }
                                }
                            }
                            interes = subtotal;
                            lblInteres.Text = "Interés total: " + interes;
                        }
                        else
                        {
                            if (cboCuotas.SelectedIndex == 4) // para 24 cuotas, el interés es de 30%
                            {
                                interes = 0;
                                DataTable tabla = oServicio.productosVehiculos();
                                decimal subtotal = 0;
                                foreach (DataGridViewRow item in dgvOrdenes.Rows)
                                {

                                    foreach (DataRow fila in tabla.Rows)
                                    {
                                        string nombreProdu = fila.ItemArray[1].ToString();
                                        if (item.Cells["ProductoOrden"].Value.ToString().Equals(nombreProdu))
                                        {
                                            decimal precio = Convert.ToDecimal(item.Cells["PrecioOrden"].Value.ToString());
                                            int cantidad = Convert.ToInt32(item.Cells["Cantidadorden"].Value.ToString());

                                            decimal total = (precio * cantidad);
                                            decimal interesAplicado = 30;
                                            decimal interesRow = total * (interesAplicado / 100);

                                            subtotal += interesRow;
                                            //interes += interesRow;
                                            break;

                                        }
                                    }
                                }
                                interes = subtotal;
                                lblInteres.Text = "Interés total: " + interes;
                            }
                        }
                    }
                }
            }
        }

        private void calcularTotalFinal()
        {
            totalFianl = totalFacturado + interes - descuento;
            lblTotal.Text = "Total: " + totalFianl;
        }

        public bool validarFactura()
        {
            if (cboFormaPago.SelectedIndex < 0)
            {
                MessageBox.Show("Debe seleccionar una Forma de pago antes de continuar", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cboFormaPago.Focus();
                return false;
            }
            if (cboFormaEnvio.SelectedIndex < 0)
            {
                MessageBox.Show("Debe seleccionar una Forma de envío antes de continuar", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                cboFormaEnvio.Focus();
                return false;
            }
            return true;
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            if (validarFactura())
            {
                if (dgvDetalles.Rows.Count < 1 && dgvOrdenes.Rows.Count < 1) //si no hay ninguno
                {
                    MessageBox.Show("Debe cargar al menos un producto en el detalle o en las ordenes de pedido de la factura", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    cboProducto.Focus();
                }
                else
                {
                    if (dgvDetalles.Rows.Count >= 1 && dgvOrdenes.Rows.Count >= 1) //si estan los 2
                    {
                        FormasPago fp = new FormasPago();
                        fp.IdFormaPago = Convert.ToInt32(cboFormaPago.SelectedValue);
                        FormasEnvio fe = new FormasEnvio();
                        fe.IdFormaEnvio = Convert.ToInt32(cboFormaEnvio.SelectedValue);
                        factura.FormasEnvio = fe;
                        factura.FormasPago = fp;
                        factura.Cliente = cliente;
                        factura.Interes = interes;
                        factura.Descuento = descuento;
                        factura.Fecha = dtpFecha.Value;

                        if (oServicio.insertarFacturaConOrdenesYDetalles(factura))
                        {
                            MessageBox.Show("La factura se ha cargado correctamente", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            limpiarFactura();
                            facturaNro();
                            comboTipoProductos();//-------------------------------------------------------
                            factura.LimpiarDetalle();
                            factura.LimpiarDetalleOrden();
                            factura.FormasEnvio = null;
                            factura.FormasPago = null;
                            factura.Cliente = null;
                            factura.Interes = 0;
                            factura.Descuento = 0;
                        }
                        else
                        {
                            MessageBox.Show("Error", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                    else
                    {
                        if (dgvDetalles.Rows.Count < 1 && dgvOrdenes.Rows.Count >= 1) //si solo hay ordenes
                        {
                            FormasPago fp = new FormasPago();
                            fp.IdFormaPago = Convert.ToInt32(cboFormaPago.SelectedValue);
                            FormasEnvio fe = new FormasEnvio();
                            fe.IdFormaEnvio = Convert.ToInt32(cboFormaEnvio.SelectedValue);
                            factura.FormasEnvio = fe;
                            factura.FormasPago = fp;
                            factura.Cliente = cliente;
                            factura.Interes = interes;
                            factura.Descuento = descuento;
                            factura.Fecha = dtpFecha.Value;

                            if (oServicio.insertarFacturaConOrdenes(factura))
                            {
                                MessageBox.Show("La factura se ha cargado correctamente", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                limpiarFactura();
                                facturaNro();
                                comboTipoProductos();//-------------------------------------------------------
                                factura.LimpiarDetalleOrden();
                                factura.FormasEnvio = null;
                                factura.FormasPago = null;
                                factura.Cliente = null;
                                factura.Interes = 0;
                                factura.Descuento = 0;
                                
                            }
                            else
                            {
                                MessageBox.Show("Error", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            }
                        }
                        else
                        {
                            if (dgvDetalles.Rows.Count >= 1 && dgvOrdenes.Rows.Count < 1) //si solo hay detalle
                            {
                                FormasPago fp = new FormasPago();
                                fp.IdFormaPago = Convert.ToInt32(cboFormaPago.SelectedValue);
                                FormasEnvio fe = new FormasEnvio();
                                fe.IdFormaEnvio = Convert.ToInt32(cboFormaEnvio.SelectedValue);
                                factura.FormasEnvio = fe;
                                factura.FormasPago = fp;
                                factura.Cliente = cliente;
                                factura.Interes = interes;
                                factura.Descuento = descuento;
                                factura.Fecha = dtpFecha.Value;
                                if (oServicio.insertarFacturaConDetalles(factura))
                                {
                                    MessageBox.Show("La factura se ha cargado correctamente", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    limpiarFactura();
                                    facturaNro();
                                    comboTipoProductos();//---------------------------------------------------------------
                                    factura.LimpiarDetalle();
                                    factura.FormasEnvio = null;
                                    factura.FormasPago = null;
                                    factura.Cliente = null;
                                    factura.Interes = 0;
                                    factura.Descuento = 0;

                                }
                                else
                                {
                                    MessageBox.Show("Error", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}