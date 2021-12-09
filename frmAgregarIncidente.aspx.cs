using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;


namespace TPC_Caero_Hoffman
{
    public partial class frmAgregarIncidente : System.Web.UI.Page
    {
        private List<Empleado> buscaEmpleado;
        private List<Cliente> buscaCliente;
        protected void Page_Load(object sender, EventArgs e)
        {
            EspecialidadNegocio especialidadnegocio = new EspecialidadNegocio();
            PrioridadNegocio prioridadnegocio = new PrioridadNegocio();
            try
            {
                if (!IsPostBack)
                {
                    List<Especialidad> listEspecialidad = especialidadnegocio.listar();

                    ddlEspecialidad.DataSource = listEspecialidad;
                    ddlEspecialidad.DataTextField = "Nom_Especialidad";
                    ddlEspecialidad.DataValueField = "IDEspecialidad";
                    ddlEspecialidad.DataBind();
                }

                if (!IsPostBack)
                {
                    List<Prioridad> listPrioridad = prioridadnegocio.listar();

                    ddlPrioridad.DataSource = listPrioridad;
                    ddlPrioridad.DataTextField = "Nom_Prioridad";
                    ddlPrioridad.DataValueField = "IDPrioridad";
                    ddlPrioridad.DataBind();
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);

            }
        }

        protected void btnBuscarEmpleadoxLegajo_Click(object sender, EventArgs e)
        {
            Empleado empleado = new Empleado();
            EmpleadoNegocio empleadonegocio = new EmpleadoNegocio();

            try
            {
                empleado.Legajo = int.Parse(txtBuscarEmpleadoxID.Text);
                buscaEmpleado = empleadonegocio.buscarLegajo(empleado);
                dgvEmpleados.DataSource = buscaEmpleado;
                dgvEmpleados.DataBind();

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
        protected void btnBuscarClientexDNI_Click(object sender, EventArgs e)
        {
            Cliente cliente = new Cliente();
            ClienteNegocio clientenegocio = new ClienteNegocio();

            try
            {
                cliente.Dni = txtBuscarClientexDNI.Text;
                buscaCliente = clientenegocio.buscarDNI(cliente);
                dgvClientes.DataSource = buscaCliente;
                dgvClientes.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
        protected void dgvClientes_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = dgvClientes.Rows[e.NewSelectedIndex];
            lblIDCliente.Text = row.Cells[0].Text;
            lblEmail.Text = row.Cells[4].Text;

        }

        protected void dgvEmpleados_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = dgvEmpleados.Rows[e.NewSelectedIndex];
            lblLegajoEmpleado.Text = row.Cells[0].Text;

        }

        protected void btnCrearIncidente_Click(object sender, EventArgs e)
        {
            try
            {

                IncidenteNegocio negocioIncidente = new IncidenteNegocio();
                Incidente nuevo = new Incidente();

                nuevo.Cliente = new Cliente();
                nuevo.Cliente.IDCliente = int.Parse(lblIDCliente.Text);
                nuevo.Cliente.Email = lblEmail.Text;

                nuevo.Empleado = new Empleado();
                nuevo.Empleado.Legajo = int.Parse(lblLegajoEmpleado.Text);

                nuevo.Especialidad = new Especialidad();
                nuevo.Especialidad.IDEspecialidad = int.Parse(ddlEspecialidad.SelectedValue);

                nuevo.Prioridad = new Prioridad();
                nuevo.Prioridad.IDPrioridad = int.Parse(ddlPrioridad.SelectedValue);

                nuevo.Detalles = txtDetalles.Text;
                negocioIncidente.agregar(nuevo);


                EmailService emailService = new EmailService();

                emailService.correo(txtDetalles.Text, nuevo.Cliente.Email);

                try
                {
                    emailService.enviarEmail();
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex);
                }

            }

            catch (Exception ex)
            {
                Session.Add("error", ex);
            }

        }

    }
}