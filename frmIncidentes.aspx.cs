using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace TPC_Caero_Hoffman
{
    public partial class frmIncidentes : System.Web.UI.Page
    {
        private List<Incidente> buscaIncidente;
        protected void Page_Load(object sender, EventArgs e)
        {
            IncidenteNegocio incidentenegocio = new IncidenteNegocio();
            dgvIncidentes.DataSource = incidentenegocio.listar();
            dgvIncidentes.DataBind();
        }
        protected void btnBuscarIncidentexID_Click(object sender, EventArgs e)
        {
            Incidente incidente = new Incidente();
            IncidenteNegocio incidentenegocio = new IncidenteNegocio();


            if (txtBuscarIncidentexID.Text != "")
            {
                incidente.ID = int.Parse(txtBuscarIncidentexID.Text);
                buscaIncidente = incidentenegocio.buscarID(incidente);
                dgvIncidentes.DataSource = buscaIncidente;
                dgvIncidentes.DataBind();
            }
            else
            {

                dgvIncidentes.DataSource = incidentenegocio.listar();
                dgvIncidentes.DataBind();

            }

        }
        protected void dgvIncidentes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[6].Text == "1/1/0001")
                {
                    e.Row.Cells[6].Text = "En proceso";
                }
            }

        }
    }
}