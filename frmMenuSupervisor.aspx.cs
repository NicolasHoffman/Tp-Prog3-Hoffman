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
    public partial class frmMenuSupervisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NombreUsuario"] == null)
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("Error.aspx", false);
            }
        }


        protected void btnVerCliente_Click(object sender, EventArgs e)
        {

        }

        protected void btnVerIncidente_Click(object sender, EventArgs e)
        {
           Response.Redirect("frmIncidentes.aspx");
        }
        protected void btnVerEmpleados_Click(object sender, EventArgs e)
        {

        }

    }
}