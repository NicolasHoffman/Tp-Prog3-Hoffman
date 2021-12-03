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
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Empleado empleado = new Empleado();
            EmpleadoNegocio negocio = new EmpleadoNegocio();

            try
            {
                empleado.NombreUsuario = txtUser.Text;
                empleado.Contrasena = txtPassword.Text;

                if (negocio.Loguear(empleado) == 1)
                {
                    Session.Add("NombreUsuario", empleado);
                    Response.Redirect("frmMenuAdministrador.aspx", false);
                }
                else
                {
                    if (negocio.Loguear(empleado) == 2)
                    {
                        Session.Add("NombreUsuario", empleado);

                        Response.Redirect("frmMenuSupervisor.aspx", false);
                    }
                    else
                    {
                        if (negocio.Loguear(empleado) == 3)
                        {
                            Session.Add("NombreUsuario", empleado);
                            Response.Redirect("frmMenuTelefonista.aspx", false);
                        }
                        else
                        {
                            Session.Add("Error", "Usuario o Password incorrectos");
                            Response.Redirect("Error.aspx", false);
                        }
                    }
                }

            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
            }
        }
    }
}