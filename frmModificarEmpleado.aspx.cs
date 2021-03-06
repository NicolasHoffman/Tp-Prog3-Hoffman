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
    public partial class frmModificarEmpleado : System.Web.UI.Page
    {
        private List<Empleado> buscaEmpleado;
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void rowCancelEditEvent(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void rowEditingEvent(object sender, GridViewEditEventArgs e)
        {

        }

        protected void rowUpdatingEvent(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Empleado empleado = new Empleado();
                EmpleadoNegocio negocioEmpleado = new EmpleadoNegocio();
                GridViewRow fila = dgvEmpleados.Rows[e.RowIndex];

                CargoNegocio cargonegocio = new CargoNegocio();


                //PASOS PARA EDITAR EMPLEADO
                empleado.Legajo = Convert.ToInt32(dgvEmpleados.DataKeys[e.RowIndex].Values[0]);
                empleado.Dni = ((fila.FindControl("txtDNI")) as TextBox).Text.ToUpper();
                empleado.Nombre = ((fila.FindControl("txtNombre")) as TextBox).Text.ToUpper();
                empleado.Apellido = ((fila.FindControl("txtApellido")) as TextBox).Text.ToUpper();
                empleado.Email = ((fila.FindControl("txtEmail")) as TextBox).Text.ToUpper();
                empleado.Telefono = ((fila.FindControl("txtTelefono")) as TextBox).Text.ToUpper();


                negocioEmpleado.modificar(empleado);
                lblConfirmacion.Text = "Empleado Modificado correctmente ";

            }
            catch (Exception ex)
            {
                
            }

        }
    }
}