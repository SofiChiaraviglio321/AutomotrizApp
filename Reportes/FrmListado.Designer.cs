namespace AutomotizApp.Reportes
{
    partial class FrmListado
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
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource2 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.BtnGenerar = new System.Windows.Forms.Button();
            this.TxtAnio = new System.Windows.Forms.TextBox();
            this.LblIngreso = new System.Windows.Forms.Label();
            this.dSListadoBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dSListado = new AutomotizApp.Reportes.DSListado();
            ((System.ComponentModel.ISupportInitialize)(this.dSListadoBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dSListado)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            reportDataSource2.Name = "DSListado";
            reportDataSource2.Value = this.dSListadoBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource2);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "AutomotizApp.Reportes.ListadoFacturacion.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(1, 46);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(801, 405);
            this.reportViewer1.TabIndex = 0;
            this.reportViewer1.Load += new System.EventHandler(this.reportViewer1_Load);
            // 
            // BtnGenerar
            // 
            this.BtnGenerar.Location = new System.Drawing.Point(641, 5);
            this.BtnGenerar.Name = "BtnGenerar";
            this.BtnGenerar.Size = new System.Drawing.Size(132, 37);
            this.BtnGenerar.TabIndex = 2;
            this.BtnGenerar.Text = "Generar";
            this.BtnGenerar.UseVisualStyleBackColor = true;
            this.BtnGenerar.Click += new System.EventHandler(this.BtnGenerar_Click);
            // 
            // TxtAnio
            // 
            this.TxtAnio.Location = new System.Drawing.Point(321, 14);
            this.TxtAnio.Name = "TxtAnio";
            this.TxtAnio.Size = new System.Drawing.Size(133, 20);
            this.TxtAnio.TabIndex = 3;
            // 
            // LblIngreso
            // 
            this.LblIngreso.AutoSize = true;
            this.LblIngreso.Location = new System.Drawing.Point(143, 17);
            this.LblIngreso.Name = "LblIngreso";
            this.LblIngreso.Size = new System.Drawing.Size(172, 13);
            this.LblIngreso.TabIndex = 4;
            this.LblIngreso.Text = "Ingrese el año que desea analizar: ";
            // 
            // dSListadoBindingSource
            // 
            this.dSListadoBindingSource.DataSource = this.dSListado;
            this.dSListadoBindingSource.Position = 0;
            // 
            // dSListado
            // 
            this.dSListado.DataSetName = "DSListado";
            this.dSListado.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // FrmListado
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.LblIngreso);
            this.Controls.Add(this.TxtAnio);
            this.Controls.Add(this.BtnGenerar);
            this.Controls.Add(this.reportViewer1);
            this.Name = "FrmListado";
            this.Text = "FrmListado";
            this.Load += new System.EventHandler(this.FrmListado_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dSListadoBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dSListado)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource dSListadoBindingSource;
        private DSListado dSListado;
        private System.Windows.Forms.Button BtnGenerar;
        private System.Windows.Forms.TextBox TxtAnio;
        private System.Windows.Forms.Label LblIngreso;
    }
}