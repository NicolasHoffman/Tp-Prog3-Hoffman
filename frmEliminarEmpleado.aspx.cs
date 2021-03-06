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
    public partial class frmEliminarEmpleado : System.Web.UI.Page
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
                empleado.Legajo = int.Parse(txtBuscarEmpleadoxleg.Text);
                buscaEmpleado = empleadonegocio.buscarLegajo(empleado);
                dgvEmpleados.DataSource = buscaEmpleado;
                dgvEmpleados.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void rowDeletingEvent(object sender, GridViewDeleteEventArgs e)
        {

            try
            {
                EmpleadoNegocio negocioEmpleado = new EmpleadoNegocio();
                Empleado empleado = new Empleado();
                empleado.Legajo = Convert.ToInt32(dgvEmpleados.DataKeys[e.RowIndex].Values[0]);
                negocioEmpleado.eliminar(empleado);
            }
            catch (Exception ex)
            {

            }
            Response.Redirect("frmMenuAdministrador.aspx");

        }
    }
}