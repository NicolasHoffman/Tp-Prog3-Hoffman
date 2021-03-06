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
    public partial class frmModificarCliente : System.Web.UI.Page
    {
        private List<Cliente> buscaCliente;
        protected void Page_Load(object sender, EventArgs e)
        {
           
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

        protected void rowCancelEditEvent(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect("frmModificarCliente.aspx");
        }

        protected void rowDeletingEvent(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void rowEditingEvent(object sender, GridViewEditEventArgs e)
        {

        }

        protected void rowUpdatingEvent(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Cliente cliente = new Cliente();
                ClienteNegocio negocioCliente = new ClienteNegocio();
                GridViewRow fila = dgvClientes.Rows[e.RowIndex];

                //PASOS PARA EDITAR CLIENTE
                cliente.IDCliente = Convert.ToInt32(dgvClientes.DataKeys[e.RowIndex].Values[0]);
                cliente.Dni = ((fila.FindControl("txtDNI")) as TextBox).Text.ToUpper();
                cliente.Nombre = ((fila.FindControl("txtNombre")) as TextBox).Text.ToUpper();
                cliente.Apellido = ((fila.FindControl("txtApellido")) as TextBox).Text.ToUpper();
                cliente.Telefono = ((fila.FindControl("txtTelefono")) as TextBox).Text.ToUpper();

                negocioCliente.modificar(cliente);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);

            }

        }
    }
}