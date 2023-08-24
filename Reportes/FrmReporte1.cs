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
    public partial class FrmReporte1 : Form
    {

        accesoDatos helper;
        public FrmReporte1()
        {
            InitializeComponent();
            helper = new accesoDatos();
        }

        private void FrmReporte1_Load(object sender, EventArgs e)
        {

            this.reportViewer1.RefreshReport();
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {
            this.reportViewer1.RefreshReport();
        }

        private void BtnGenerar_Click(object sender, EventArgs e)
        {
            DataTable tabla = helper.Consulta("conocer_top_3_marcas");
            this.reportViewer1.LocalReport.DataSources.Clear();
            this.reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DSReportes",tabla));
            this.reportViewer1.RefreshReport();
        }
    }
}
