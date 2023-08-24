namespace AutomotizApp.Presentacion
{
    partial class FrmFactura
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnBuscar = new System.Windows.Forms.Button();
            this.txtDocumento = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.lstClientes = new System.Windows.Forms.ListBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnSiguiente = new System.Windows.Forms.Button();
            this.grpboxCliente = new System.Windows.Forms.GroupBox();
            this.btnAtras = new System.Windows.Forms.Button();
            this.grpFactura = new System.Windows.Forms.GroupBox();
            this.cboTipo = new System.Windows.Forms.ComboBox();
            this.cboCuotas = new System.Windows.Forms.ComboBox();
            this.label13 = new System.Windows.Forms.Label();
            this.chkAutoPlan = new System.Windows.Forms.CheckBox();
            this.label18 = new System.Windows.Forms.Label();
            this.txtInteres = new System.Windows.Forms.TextBox();
            this.txtDescuento = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.cboFormaEnvio = new System.Windows.Forms.ComboBox();
            this.cboFormaPago = new System.Windows.Forms.ComboBox();
            this.dtpFecha = new System.Windows.Forms.DateTimePicker();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.txtClienteNombre = new System.Windows.Forms.TextBox();
            this.txtClienteApellido = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.lblFacturaNro = new System.Windows.Forms.Label();
            this.grpboxProductos = new System.Windows.Forms.GroupBox();
            this.lblTotal = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.dgvDetalles = new System.Windows.Forms.DataGridView();
            this.Producto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Precio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cantidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Accion = new System.Windows.Forms.DataGridViewButtonColumn();
            this.grpOrdenes = new System.Windows.Forms.GroupBox();
            this.btnAgregarOrden = new System.Windows.Forms.Button();
            this.label17 = new System.Windows.Forms.Label();
            this.dtpFechaEntrega = new System.Windows.Forms.DateTimePicker();
            this.dgvOrdenes = new System.Windows.Forms.DataGridView();
            this.ProductoOrden = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PrecioOrden = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CantidadOrden = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FechaEntrega = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.AccionOrden = new System.Windows.Forms.DataGridViewButtonColumn();
            this.txtStockMinimo = new System.Windows.Forms.TextBox();
            this.txtStock = new System.Windows.Forms.TextBox();
            this.lblSubTotal = new System.Windows.Forms.Label();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.label19 = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.cboTipoProducto = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.lblInteres = new System.Windows.Forms.Label();
            this.lblDescuento = new System.Windows.Forms.Label();
            this.numCantidad = new System.Windows.Forms.NumericUpDown();
            this.label12 = new System.Windows.Forms.Label();
            this.txtPrecio = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.cboProducto = new System.Windows.Forms.ComboBox();
            this.label10 = new System.Windows.Forms.Label();
            this.btnAceptar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.grpboxCliente.SuspendLayout();
            this.grpFactura.SuspendLayout();
            this.grpboxProductos.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDetalles)).BeginInit();
            this.grpOrdenes.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOrdenes)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numCantidad)).BeginInit();
            this.SuspendLayout();
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(338, 89);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(75, 32);
            this.btnBuscar.TabIndex = 3;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.UseVisualStyleBackColor = true;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // txtDocumento
            // 
            this.txtDocumento.Location = new System.Drawing.Point(123, 97);
            this.txtDocumento.Name = "txtDocumento";
            this.txtDocumento.Size = new System.Drawing.Size(210, 20);
            this.txtDocumento.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(32, 98);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(85, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Documento Nro:";
            // 
            // lstClientes
            // 
            this.lstClientes.FormattingEnabled = true;
            this.lstClientes.Location = new System.Drawing.Point(34, 130);
            this.lstClientes.Name = "lstClientes";
            this.lstClientes.Size = new System.Drawing.Size(300, 524);
            this.lstClientes.TabIndex = 4;
            this.lstClientes.SelectedIndexChanged += new System.EventHandler(this.lstClientes_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(31, 28);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(234, 17);
            this.label2.TabIndex = 0;
            this.label2.Text = "Busque o seleccione un cliente";
            // 
            // btnSiguiente
            // 
            this.btnSiguiente.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSiguiente.Location = new System.Drawing.Point(338, 684);
            this.btnSiguiente.Name = "btnSiguiente";
            this.btnSiguiente.Size = new System.Drawing.Size(75, 29);
            this.btnSiguiente.TabIndex = 7;
            this.btnSiguiente.Text = "Siguiente";
            this.btnSiguiente.UseVisualStyleBackColor = true;
            this.btnSiguiente.Click += new System.EventHandler(this.btnSiguiente_Click);
            // 
            // grpboxCliente
            // 
            this.grpboxCliente.Controls.Add(this.btnAtras);
            this.grpboxCliente.Controls.Add(this.lstClientes);
            this.grpboxCliente.Controls.Add(this.btnSiguiente);
            this.grpboxCliente.Controls.Add(this.label1);
            this.grpboxCliente.Controls.Add(this.txtDocumento);
            this.grpboxCliente.Controls.Add(this.label2);
            this.grpboxCliente.Controls.Add(this.btnBuscar);
            this.grpboxCliente.Location = new System.Drawing.Point(12, 12);
            this.grpboxCliente.Name = "grpboxCliente";
            this.grpboxCliente.Size = new System.Drawing.Size(419, 728);
            this.grpboxCliente.TabIndex = 0;
            this.grpboxCliente.TabStop = false;
            this.grpboxCliente.Text = "Cliente";
            this.grpboxCliente.Enter += new System.EventHandler(this.grpboxCLiente_Enter);
            // 
            // btnAtras
            // 
            this.btnAtras.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAtras.Location = new System.Drawing.Point(259, 684);
            this.btnAtras.Name = "btnAtras";
            this.btnAtras.Size = new System.Drawing.Size(75, 29);
            this.btnAtras.TabIndex = 6;
            this.btnAtras.Text = "Atrás";
            this.btnAtras.UseVisualStyleBackColor = true;
            this.btnAtras.Click += new System.EventHandler(this.btnAtras_Click);
            // 
            // grpFactura
            // 
            this.grpFactura.Controls.Add(this.cboTipo);
            this.grpFactura.Controls.Add(this.cboCuotas);
            this.grpFactura.Controls.Add(this.label13);
            this.grpFactura.Controls.Add(this.chkAutoPlan);
            this.grpFactura.Controls.Add(this.label18);
            this.grpFactura.Controls.Add(this.txtInteres);
            this.grpFactura.Controls.Add(this.txtDescuento);
            this.grpFactura.Controls.Add(this.label8);
            this.grpFactura.Controls.Add(this.label9);
            this.grpFactura.Controls.Add(this.cboFormaEnvio);
            this.grpFactura.Controls.Add(this.cboFormaPago);
            this.grpFactura.Controls.Add(this.dtpFecha);
            this.grpFactura.Controls.Add(this.label7);
            this.grpFactura.Controls.Add(this.label6);
            this.grpFactura.Controls.Add(this.label5);
            this.grpFactura.Controls.Add(this.txtClienteNombre);
            this.grpFactura.Controls.Add(this.txtClienteApellido);
            this.grpFactura.Controls.Add(this.label4);
            this.grpFactura.Controls.Add(this.lblFacturaNro);
            this.grpFactura.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpFactura.Location = new System.Drawing.Point(437, 12);
            this.grpFactura.Name = "grpFactura";
            this.grpFactura.Size = new System.Drawing.Size(796, 271);
            this.grpFactura.TabIndex = 1;
            this.grpFactura.TabStop = false;
            this.grpFactura.Text = "Factura";
            this.grpFactura.Enter += new System.EventHandler(this.grpFactura_Enter);
            // 
            // cboTipo
            // 
            this.cboTipo.FormattingEnabled = true;
            this.cboTipo.Location = new System.Drawing.Point(517, 75);
            this.cboTipo.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cboTipo.Name = "cboTipo";
            this.cboTipo.Size = new System.Drawing.Size(170, 21);
            this.cboTipo.TabIndex = 19;
            this.cboTipo.SelectedIndexChanged += new System.EventHandler(this.cboTipo_SelectedIndexChanged);
            // 
            // cboCuotas
            // 
            this.cboCuotas.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboCuotas.FormattingEnabled = true;
            this.cboCuotas.Items.AddRange(new object[] {
            "3",
            "6",
            "12",
            "18",
            "24"});
            this.cboCuotas.Location = new System.Drawing.Point(304, 111);
            this.cboCuotas.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cboCuotas.Name = "cboCuotas";
            this.cboCuotas.Size = new System.Drawing.Size(127, 21);
            this.cboCuotas.TabIndex = 18;
            this.cboCuotas.SelectedIndexChanged += new System.EventHandler(this.cboCuotas_SelectedIndexChanged);
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(260, 114);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(43, 13);
            this.label13.TabIndex = 17;
            this.label13.Text = "Cuotas:";
            // 
            // chkAutoPlan
            // 
            this.chkAutoPlan.AutoSize = true;
            this.chkAutoPlan.Location = new System.Drawing.Point(182, 113);
            this.chkAutoPlan.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.chkAutoPlan.Name = "chkAutoPlan";
            this.chkAutoPlan.Size = new System.Drawing.Size(68, 17);
            this.chkAutoPlan.TabIndex = 16;
            this.chkAutoPlan.Text = "Autoplan";
            this.chkAutoPlan.UseVisualStyleBackColor = true;
            this.chkAutoPlan.CheckedChanged += new System.EventHandler(this.chkAutoPlan_CheckedChanged);
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label18.Location = new System.Drawing.Point(438, 79);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(80, 13);
            this.label18.TabIndex = 14;
            this.label18.Text = "Tipo de cliente:";
            // 
            // txtInteres
            // 
            this.txtInteres.Location = new System.Drawing.Point(517, 111);
            this.txtInteres.Name = "txtInteres";
            this.txtInteres.Size = new System.Drawing.Size(171, 19);
            this.txtInteres.TabIndex = 13;
            this.txtInteres.Text = "0";
            this.txtInteres.Click += new System.EventHandler(this.txtInteres_Click);
            // 
            // txtDescuento
            // 
            this.txtDescuento.AccessibleDescription = "";
            this.txtDescuento.AccessibleName = "";
            this.txtDescuento.Location = new System.Drawing.Point(182, 154);
            this.txtDescuento.Name = "txtDescuento";
            this.txtDescuento.Size = new System.Drawing.Size(505, 19);
            this.txtDescuento.TabIndex = 11;
            this.txtDescuento.Tag = "";
            this.txtDescuento.Text = "0";
            this.txtDescuento.WordWrap = false;
            this.txtDescuento.Click += new System.EventHandler(this.txtDescuento_Click);
            this.txtDescuento.TextChanged += new System.EventHandler(this.txtDescuento_TextChanged);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(72, 156);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(62, 13);
            this.label8.TabIndex = 10;
            this.label8.Text = "Descuento:";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(473, 114);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(42, 13);
            this.label9.TabIndex = 12;
            this.label9.Text = "Interés:";
            // 
            // cboFormaEnvio
            // 
            this.cboFormaEnvio.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboFormaEnvio.FormattingEnabled = true;
            this.cboFormaEnvio.Location = new System.Drawing.Point(182, 219);
            this.cboFormaEnvio.Name = "cboFormaEnvio";
            this.cboFormaEnvio.Size = new System.Drawing.Size(505, 21);
            this.cboFormaEnvio.TabIndex = 9;
            // 
            // cboFormaPago
            // 
            this.cboFormaPago.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboFormaPago.FormattingEnabled = true;
            this.cboFormaPago.Location = new System.Drawing.Point(182, 185);
            this.cboFormaPago.Name = "cboFormaPago";
            this.cboFormaPago.Size = new System.Drawing.Size(505, 21);
            this.cboFormaPago.TabIndex = 7;
            // 
            // dtpFecha
            // 
            this.dtpFecha.Location = new System.Drawing.Point(182, 43);
            this.dtpFecha.Name = "dtpFecha";
            this.dtpFecha.Size = new System.Drawing.Size(505, 19);
            this.dtpFecha.TabIndex = 5;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(72, 222);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(83, 13);
            this.label7.TabIndex = 8;
            this.label7.Text = "Forma de envio:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(73, 185);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(81, 13);
            this.label6.TabIndex = 6;
            this.label6.Text = "Forma de pago:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(72, 47);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(40, 13);
            this.label5.TabIndex = 4;
            this.label5.Text = "Fecha:";
            // 
            // txtClienteNombre
            // 
            this.txtClienteNombre.Location = new System.Drawing.Point(182, 76);
            this.txtClienteNombre.Name = "txtClienteNombre";
            this.txtClienteNombre.Size = new System.Drawing.Size(119, 19);
            this.txtClienteNombre.TabIndex = 3;
            this.txtClienteNombre.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // txtClienteApellido
            // 
            this.txtClienteApellido.Location = new System.Drawing.Point(304, 76);
            this.txtClienteApellido.Name = "txtClienteApellido";
            this.txtClienteApellido.Size = new System.Drawing.Size(127, 19);
            this.txtClienteApellido.TabIndex = 2;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(72, 79);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(42, 13);
            this.label4.TabIndex = 1;
            this.label4.Text = "Cliente:";
            // 
            // lblFacturaNro
            // 
            this.lblFacturaNro.AutoSize = true;
            this.lblFacturaNro.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFacturaNro.Location = new System.Drawing.Point(62, 15);
            this.lblFacturaNro.Name = "lblFacturaNro";
            this.lblFacturaNro.Size = new System.Drawing.Size(87, 17);
            this.lblFacturaNro.TabIndex = 0;
            this.lblFacturaNro.Text = "Factura #: ";
            // 
            // grpboxProductos
            // 
            this.grpboxProductos.Controls.Add(this.lblTotal);
            this.grpboxProductos.Controls.Add(this.groupBox2);
            this.grpboxProductos.Controls.Add(this.grpOrdenes);
            this.grpboxProductos.Controls.Add(this.txtStockMinimo);
            this.grpboxProductos.Controls.Add(this.txtStock);
            this.grpboxProductos.Controls.Add(this.lblSubTotal);
            this.grpboxProductos.Controls.Add(this.btnAgregar);
            this.grpboxProductos.Controls.Add(this.label19);
            this.grpboxProductos.Controls.Add(this.label16);
            this.grpboxProductos.Controls.Add(this.cboTipoProducto);
            this.grpboxProductos.Controls.Add(this.label3);
            this.grpboxProductos.Controls.Add(this.lblInteres);
            this.grpboxProductos.Controls.Add(this.lblDescuento);
            this.grpboxProductos.Controls.Add(this.numCantidad);
            this.grpboxProductos.Controls.Add(this.label12);
            this.grpboxProductos.Controls.Add(this.txtPrecio);
            this.grpboxProductos.Controls.Add(this.label11);
            this.grpboxProductos.Controls.Add(this.cboProducto);
            this.grpboxProductos.Controls.Add(this.label10);
            this.grpboxProductos.Location = new System.Drawing.Point(437, 290);
            this.grpboxProductos.Name = "grpboxProductos";
            this.grpboxProductos.Size = new System.Drawing.Size(796, 450);
            this.grpboxProductos.TabIndex = 2;
            this.grpboxProductos.TabStop = false;
            this.grpboxProductos.Text = "Productos";
            // 
            // lblTotal
            // 
            this.lblTotal.AutoSize = true;
            this.lblTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotal.Location = new System.Drawing.Point(611, 434);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(40, 13);
            this.lblTotal.TabIndex = 18;
            this.lblTotal.Text = "Total:";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.dgvDetalles);
            this.groupBox2.Location = new System.Drawing.Point(9, 113);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(774, 138);
            this.groupBox2.TabIndex = 13;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Detalles";
            // 
            // dgvDetalles
            // 
            this.dgvDetalles.AllowUserToAddRows = false;
            this.dgvDetalles.AllowUserToDeleteRows = false;
            this.dgvDetalles.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDetalles.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Producto,
            this.Precio,
            this.Cantidad,
            this.Accion});
            this.dgvDetalles.Location = new System.Drawing.Point(56, 11);
            this.dgvDetalles.Name = "dgvDetalles";
            this.dgvDetalles.ReadOnly = true;
            this.dgvDetalles.RowHeadersWidth = 51;
            this.dgvDetalles.Size = new System.Drawing.Size(698, 121);
            this.dgvDetalles.TabIndex = 0;
            this.dgvDetalles.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvDetalles_CellContentClick);
            // 
            // Producto
            // 
            this.Producto.HeaderText = "Producto";
            this.Producto.MinimumWidth = 6;
            this.Producto.Name = "Producto";
            this.Producto.ReadOnly = true;
            this.Producto.Width = 125;
            // 
            // Precio
            // 
            this.Precio.HeaderText = "Precio";
            this.Precio.MinimumWidth = 6;
            this.Precio.Name = "Precio";
            this.Precio.ReadOnly = true;
            this.Precio.Width = 125;
            // 
            // Cantidad
            // 
            this.Cantidad.HeaderText = "Cantidad";
            this.Cantidad.MinimumWidth = 6;
            this.Cantidad.Name = "Cantidad";
            this.Cantidad.ReadOnly = true;
            this.Cantidad.Width = 125;
            // 
            // Accion
            // 
            this.Accion.HeaderText = "Accion";
            this.Accion.MinimumWidth = 6;
            this.Accion.Name = "Accion";
            this.Accion.ReadOnly = true;
            this.Accion.Text = "Quitar";
            this.Accion.UseColumnTextForButtonValue = true;
            this.Accion.Width = 125;
            // 
            // grpOrdenes
            // 
            this.grpOrdenes.Controls.Add(this.btnAgregarOrden);
            this.grpOrdenes.Controls.Add(this.label17);
            this.grpOrdenes.Controls.Add(this.dtpFechaEntrega);
            this.grpOrdenes.Controls.Add(this.dgvOrdenes);
            this.grpOrdenes.Location = new System.Drawing.Point(9, 251);
            this.grpOrdenes.Name = "grpOrdenes";
            this.grpOrdenes.Size = new System.Drawing.Size(774, 155);
            this.grpOrdenes.TabIndex = 14;
            this.grpOrdenes.TabStop = false;
            this.grpOrdenes.Text = "Ordenes";
            // 
            // btnAgregarOrden
            // 
            this.btnAgregarOrden.Location = new System.Drawing.Point(684, 11);
            this.btnAgregarOrden.Name = "btnAgregarOrden";
            this.btnAgregarOrden.Size = new System.Drawing.Size(70, 21);
            this.btnAgregarOrden.TabIndex = 2;
            this.btnAgregarOrden.Text = "Agregar";
            this.btnAgregarOrden.UseVisualStyleBackColor = true;
            this.btnAgregarOrden.Click += new System.EventHandler(this.btnAgregarOrden_Click);
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Location = new System.Drawing.Point(395, 13);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(94, 13);
            this.label17.TabIndex = 0;
            this.label17.Text = "Fecha de entrega:";
            // 
            // dtpFechaEntrega
            // 
            this.dtpFechaEntrega.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFechaEntrega.Location = new System.Drawing.Point(508, 12);
            this.dtpFechaEntrega.Name = "dtpFechaEntrega";
            this.dtpFechaEntrega.Size = new System.Drawing.Size(171, 20);
            this.dtpFechaEntrega.TabIndex = 1;
            this.dtpFechaEntrega.ValueChanged += new System.EventHandler(this.dateTimePicker1_ValueChanged);
            // 
            // dgvOrdenes
            // 
            this.dgvOrdenes.AllowUserToAddRows = false;
            this.dgvOrdenes.AllowUserToDeleteRows = false;
            this.dgvOrdenes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvOrdenes.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ProductoOrden,
            this.PrecioOrden,
            this.CantidadOrden,
            this.FechaEntrega,
            this.AccionOrden});
            this.dgvOrdenes.Location = new System.Drawing.Point(56, 38);
            this.dgvOrdenes.Name = "dgvOrdenes";
            this.dgvOrdenes.ReadOnly = true;
            this.dgvOrdenes.RowHeadersWidth = 51;
            this.dgvOrdenes.Size = new System.Drawing.Size(698, 111);
            this.dgvOrdenes.TabIndex = 3;
            this.dgvOrdenes.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvOrdenes_CellContentClick);
            // 
            // ProductoOrden
            // 
            this.ProductoOrden.HeaderText = "Producto";
            this.ProductoOrden.MinimumWidth = 6;
            this.ProductoOrden.Name = "ProductoOrden";
            this.ProductoOrden.ReadOnly = true;
            this.ProductoOrden.Width = 125;
            // 
            // PrecioOrden
            // 
            this.PrecioOrden.HeaderText = "Precio";
            this.PrecioOrden.MinimumWidth = 6;
            this.PrecioOrden.Name = "PrecioOrden";
            this.PrecioOrden.ReadOnly = true;
            this.PrecioOrden.Width = 125;
            // 
            // CantidadOrden
            // 
            this.CantidadOrden.HeaderText = "Cantidad";
            this.CantidadOrden.MinimumWidth = 6;
            this.CantidadOrden.Name = "CantidadOrden";
            this.CantidadOrden.ReadOnly = true;
            this.CantidadOrden.Width = 125;
            // 
            // FechaEntrega
            // 
            this.FechaEntrega.HeaderText = "FechaEntrega";
            this.FechaEntrega.MinimumWidth = 6;
            this.FechaEntrega.Name = "FechaEntrega";
            this.FechaEntrega.ReadOnly = true;
            this.FechaEntrega.Width = 125;
            // 
            // AccionOrden
            // 
            this.AccionOrden.HeaderText = "Accion";
            this.AccionOrden.MinimumWidth = 6;
            this.AccionOrden.Name = "AccionOrden";
            this.AccionOrden.ReadOnly = true;
            this.AccionOrden.Text = "Quitar";
            this.AccionOrden.UseColumnTextForButtonValue = true;
            this.AccionOrden.Width = 125;
            // 
            // txtStockMinimo
            // 
            this.txtStockMinimo.Location = new System.Drawing.Point(621, 57);
            this.txtStockMinimo.Name = "txtStockMinimo";
            this.txtStockMinimo.Size = new System.Drawing.Size(66, 20);
            this.txtStockMinimo.TabIndex = 7;
            // 
            // txtStock
            // 
            this.txtStock.Location = new System.Drawing.Point(466, 57);
            this.txtStock.Name = "txtStock";
            this.txtStock.Size = new System.Drawing.Size(66, 20);
            this.txtStock.TabIndex = 5;
            // 
            // lblSubTotal
            // 
            this.lblSubTotal.AutoSize = true;
            this.lblSubTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSubTotal.Location = new System.Drawing.Point(591, 410);
            this.lblSubTotal.Name = "lblSubTotal";
            this.lblSubTotal.Size = new System.Drawing.Size(62, 13);
            this.lblSubTotal.TabIndex = 17;
            this.lblSubTotal.Text = "SubTotal:";
            // 
            // btnAgregar
            // 
            this.btnAgregar.Location = new System.Drawing.Point(693, 86);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(70, 21);
            this.btnAgregar.TabIndex = 12;
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.UseVisualStyleBackColor = true;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Location = new System.Drawing.Point(404, 60);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(38, 13);
            this.label19.TabIndex = 4;
            this.label19.Text = "Stock:";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(537, 59);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(74, 13);
            this.label16.TabIndex = 6;
            this.label16.Text = "Stock Minimo:";
            // 
            // cboTipoProducto
            // 
            this.cboTipoProducto.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboTipoProducto.FormattingEnabled = true;
            this.cboTipoProducto.Location = new System.Drawing.Point(182, 23);
            this.cboTipoProducto.Name = "cboTipoProducto";
            this.cboTipoProducto.Size = new System.Drawing.Size(505, 21);
            this.cboTipoProducto.TabIndex = 1;
            this.cboTipoProducto.SelectedIndexChanged += new System.EventHandler(this.cboTipoProducto_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(72, 25);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(91, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "Tipo de producto:";
            // 
            // lblInteres
            // 
            this.lblInteres.AutoSize = true;
            this.lblInteres.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblInteres.Location = new System.Drawing.Point(404, 410);
            this.lblInteres.Name = "lblInteres";
            this.lblInteres.Size = new System.Drawing.Size(79, 13);
            this.lblInteres.TabIndex = 15;
            this.lblInteres.Text = "Interés total;";
            // 
            // lblDescuento
            // 
            this.lblDescuento.AutoSize = true;
            this.lblDescuento.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDescuento.Location = new System.Drawing.Point(384, 434);
            this.lblDescuento.Name = "lblDescuento";
            this.lblDescuento.Size = new System.Drawing.Size(101, 13);
            this.lblDescuento.TabIndex = 16;
            this.lblDescuento.Text = "Descuento total:";
            // 
            // numCantidad
            // 
            this.numCantidad.Location = new System.Drawing.Point(466, 88);
            this.numCantidad.Name = "numCantidad";
            this.numCantidad.Size = new System.Drawing.Size(221, 20);
            this.numCantidad.TabIndex = 11;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(404, 90);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(52, 13);
            this.label12.TabIndex = 10;
            this.label12.Text = "Cantidad:";
            // 
            // txtPrecio
            // 
            this.txtPrecio.Location = new System.Drawing.Point(182, 87);
            this.txtPrecio.Name = "txtPrecio";
            this.txtPrecio.Size = new System.Drawing.Size(211, 20);
            this.txtPrecio.TabIndex = 9;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(72, 89);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(40, 13);
            this.label11.TabIndex = 8;
            this.label11.Text = "Precio:";
            // 
            // cboProducto
            // 
            this.cboProducto.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboProducto.FormattingEnabled = true;
            this.cboProducto.Location = new System.Drawing.Point(182, 57);
            this.cboProducto.Name = "cboProducto";
            this.cboProducto.Size = new System.Drawing.Size(211, 21);
            this.cboProducto.TabIndex = 3;
            this.cboProducto.SelectedIndexChanged += new System.EventHandler(this.cboProducto_SelectedIndexChanged);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(72, 57);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(53, 13);
            this.label10.TabIndex = 2;
            this.label10.Text = "Producto:";
            // 
            // btnAceptar
            // 
            this.btnAceptar.Location = new System.Drawing.Point(663, 746);
            this.btnAceptar.Name = "btnAceptar";
            this.btnAceptar.Size = new System.Drawing.Size(167, 39);
            this.btnAceptar.TabIndex = 3;
            this.btnAceptar.Text = "Aceptar";
            this.btnAceptar.UseVisualStyleBackColor = true;
            this.btnAceptar.Click += new System.EventHandler(this.btnAceptar_Click);
            // 
            // btnCancelar
            // 
            this.btnCancelar.Location = new System.Drawing.Point(844, 746);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(167, 39);
            this.btnCancelar.TabIndex = 4;
            this.btnCancelar.Text = "Caneclar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // FrmFactura
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1240, 789);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnAceptar);
            this.Controls.Add(this.grpboxProductos);
            this.Controls.Add(this.grpFactura);
            this.Controls.Add(this.grpboxCliente);
            this.MaximizeBox = false;
            this.Name = "FrmFactura";
            this.Text = "Factura";
            this.Load += new System.EventHandler(this.FrmFactura_Load);
            this.grpboxCliente.ResumeLayout(false);
            this.grpboxCliente.PerformLayout();
            this.grpFactura.ResumeLayout(false);
            this.grpFactura.PerformLayout();
            this.grpboxProductos.ResumeLayout(false);
            this.grpboxProductos.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDetalles)).EndInit();
            this.grpOrdenes.ResumeLayout(false);
            this.grpOrdenes.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOrdenes)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numCantidad)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.TextBox txtDocumento;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ListBox lstClientes;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnSiguiente;
        private System.Windows.Forms.GroupBox grpboxCliente;
        private System.Windows.Forms.GroupBox grpFactura;
        private System.Windows.Forms.Label lblFacturaNro;
        private System.Windows.Forms.DateTimePicker dtpFecha;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtClienteNombre;
        private System.Windows.Forms.TextBox txtClienteApellido;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtInteres;
        private System.Windows.Forms.TextBox txtDescuento;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.ComboBox cboFormaEnvio;
        private System.Windows.Forms.ComboBox cboFormaPago;
        private System.Windows.Forms.GroupBox grpboxProductos;
        private System.Windows.Forms.Label lblSubTotal;
        private System.Windows.Forms.Label lblInteres;
        private System.Windows.Forms.Label lblDescuento;
        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.DataGridView dgvOrdenes;
        private System.Windows.Forms.DataGridView dgvDetalles;
        private System.Windows.Forms.NumericUpDown numCantidad;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox txtPrecio;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.ComboBox cboProducto;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Button btnAceptar;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnAtras;
        private System.Windows.Forms.ComboBox cboTipoProducto;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtStockMinimo;
        private System.Windows.Forms.TextBox txtStock;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox grpOrdenes;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.DateTimePicker dtpFechaEntrega;
        private System.Windows.Forms.Button btnAgregarOrden;
        private System.Windows.Forms.DataGridViewTextBoxColumn Producto;
        private System.Windows.Forms.DataGridViewTextBoxColumn Precio;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cantidad;
        private System.Windows.Forms.DataGridViewButtonColumn Accion;
        private System.Windows.Forms.DataGridViewTextBoxColumn ProductoOrden;
        private System.Windows.Forms.DataGridViewTextBoxColumn PrecioOrden;
        private System.Windows.Forms.DataGridViewTextBoxColumn CantidadOrden;
        private System.Windows.Forms.DataGridViewTextBoxColumn FechaEntrega;
        private System.Windows.Forms.DataGridViewButtonColumn AccionOrden;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.ComboBox cboCuotas;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.CheckBox chkAutoPlan;
        private System.Windows.Forms.ComboBox cboTipo;
        private System.Windows.Forms.Label lblTotal;
    }
}