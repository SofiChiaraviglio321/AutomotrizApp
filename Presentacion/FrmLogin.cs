using AutomotizApp.Servicios;
using AutomotizApp.Servicios.Interfaz;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AutomotizApp.Presentacion
{
    public partial class FrmLogin : Form
    {
        FabricaServicio oFabricaServicio;
        IServicio oServicio;
        FrmInicio frmInicio;

        public FrmLogin()
        {
            oFabricaServicio = new FabricaServicioImp();
            oServicio = oFabricaServicio.CrearServicio();
            InitializeComponent();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            lblLogin.Parent = pictureBox1;
            lblLogin.BackColor = Color.Transparent;
            lblContraseña.Parent = pictureBox1;
            lblContraseña.BackColor = Color.Transparent;
            lblUsuario.Parent = pictureBox1;
            lblUsuario.BackColor = Color.Transparent;
            lblSugerido.Parent = pictureBox1;
            lblSugerido.BackColor = Color.Transparent;
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Seguro desea abandoar la aplicación?", "Sistema", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Close();
            }
        }

        public bool validarLogin()
        {
            bool aux = false;
            DataTable tabla = oServicio.usuariosLogin();
            foreach (DataRow i in tabla.Rows)
            {
                if (txtUsuario.Text == i.ItemArray[0].ToString() && txtContraseña.Text == i.ItemArray[1].ToString())
                {

                    aux = true;
                    break;
                }

            }
            return aux;
        }

        public bool validarDatos()
        {
            bool aux = true;
            if (txtUsuario.Text == String.Empty)
            {
                MessageBox.Show("Debe ingresar un nombre de usuario", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtUsuario.Focus();
                aux = false;
            }
            if (txtContraseña.Text == String.Empty)
            {
                MessageBox.Show("Debe ingresar una contraseña válida", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtContraseña.Focus();
                aux = false;
            }
            else
            {
                try
                {
                    Convert.ToInt32(txtContraseña.Text);
                }
                catch
                {
                    MessageBox.Show("La contraseña solo puede contener números", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtContraseña.Focus();
                    aux = false;
                }
            }

            return aux;
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            if (validarDatos())
            {
                if (validarLogin())
                {
                    frmInicio = new FrmInicio();
                    frmInicio.Show();
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("Usuario y/o contraseña incorrecta", "Sistema", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtUsuario.Focus();
                }
            }

        }
    }
}
