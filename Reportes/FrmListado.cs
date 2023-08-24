using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AutomotizApp.Datos;



namespace AutomotizApp.Reportes
{
    public partial class FrmListado : Form
    {
        accesoDatos helper;
        public FrmListado()
        {
            InitializeComponent();
            helper = new accesoDatos();
        }

        private void FrmListado_Load(object sender, EventArgs e)
        {

            this.reportViewer1.RefreshReport();
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {
            this.reportViewer1.RefreshReport();
        }

        private void BtnGenerar_Click(object sender, EventArgs e)
        {
            if(TxtAnio.Text == "")
            {
                MessageBox.Show("Porfavor ingrese el año que desea analizar", "FALTA INFORMACIÓN", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            else
            {
                DataTable tabla = helper.ConsultaParametro("mostrar_total_promedio_por_perido_con_param", TxtAnio.Text);
                this.reportViewer1.LocalReport.DataSources.Clear();
                this.reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DSListado", tabla));
                this.reportViewer1.RefreshReport();
            }
            
        }

        
    }
}
