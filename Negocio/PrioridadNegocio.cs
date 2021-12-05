using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio; 

namespace Negocio
{
    public class PrioridadNegocio
    {
        public List<Prioridad> listar()
        {
            List<Prioridad> lista = new List<Prioridad>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select ID, PRIORIDAD From Prioridades");
                datos.ejecturaLectura();

                while (datos.Lector.Read())
                {
                    Prioridad aux = new Prioridad();
                    aux.IDPrioridad = (int)datos.Lector["ID"];
                    aux.Nom_Prioridad = (string)datos.Lector["PRIORIDAD"];


                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
