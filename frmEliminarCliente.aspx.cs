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
    public partial class frmEliminarCliente : System.Web.UI.Page
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

        protected void rowDeletingEvent(object sender, GridViewDeleteEventArgs e)
        {
            //PASOS PARA ELIMINAR CLIENTE
            try
            {
                ClienteNegocio negocioCliente = new ClienteNegocio();
                Cliente cliente = new Cliente();
                cliente.IDCliente = Convert.ToInt32(dgvClientes.DataKeys[e.RowIndex].Values[0]);
                negocioCliente.eliminar(cliente);


            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }

        }
    }
}