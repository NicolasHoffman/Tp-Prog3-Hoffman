using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio; 

namespace Negocio
{
    public class EspecialidadNegocio
        {
        public List<Especialidad> listar()
        {
            List<Especialidad> lista = new List<Especialidad>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select ID, Especialidad From Especialidades");
                datos.ejecturaLectura();

                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
                    aux.IDEspecialidad = (int)datos.Lector["ID"];
                    aux.Nom_Especialidad = (string)datos.Lector["Especialidad"];


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
