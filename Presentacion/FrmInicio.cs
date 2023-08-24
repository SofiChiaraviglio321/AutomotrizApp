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
using AutomotizApp.Reportes;

namespace AutomotizApp
{
    //Una particularidad del Frm inicial es que al seleccionar Archivo>Salir se cerrarán TODOS los formularios

    public partial class FrmInicio : Form
    {
        public FrmInicio()
        {
            InitializeComponent();
        }

        private void FrmInicio_Load(object sender, EventArgs e)
        {
            
        }

        private void crearToolStripMenuItem_Click(object sender, EventArgs e)  //Crear una nueva factura
        { 
            FrmFactura frmFactura = new FrmFactura(); 
            frmFactura.Show();
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
            Application.Exit();
        }

        private void configuracionDeEstadoToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void reporte1ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmReporte1 frmReporte1 = new FrmReporte1();
            frmReporte1.Show();
        }

        private void reportesToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void reporte2ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmListado frmListado1 = new FrmListado();
            frmListado1.Show();
        }
    }
}
