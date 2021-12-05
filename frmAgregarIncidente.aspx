<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAgregarIncidente.aspx.cs" Inherits="TPC_Caero_Hoffman.frmAgregarIncidente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <hr />
    <div>
    <h4>Agregar Incidente</h4>
    </div>
                                            
    <hr />
    <div>
     <div class="d-grid gap-2 col-6 mx-auto">
    <label for="inputEmail4" class="form-label"> Ingrese Legajo del Empleado : </label>
        <asp:TextBox type="text" runat="server"  class="form-control" id="txtBuscarEmpleadoxID" />
        <asp:Button ID="btnBuscarEmpleadoxLegajo" runat="server" OnClick="btnBuscarEmpleadoxLegajo_Click" Text="Buscar" />  
   
        <div class="row" > 
            <asp:GridView ID="dgvEmpleados" CssClass="table table-success table-striped" runat="server"
                AutoGenerateColumns="false"          
                DataKeyNames="Legajo" OnSelectedIndexChanging="dgvEmpleados_SelectedIndexChanging" >
                <Columns>
                    <asp:BoundField DataField="Legajo" HeaderText="ID" />
                    <asp:BoundField DataField="Cargo.Nombre_Cargo" HeaderText="Cargo" />    
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre"/>
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido"/>

                    <asp:CommandField ButtonType="Link" ShowSelectButton="true"  />
                </Columns>

            </asp:GridView>

            
            <asp:Label ID="lblLegajoEmpleado" runat="server" Visible="false"  />
            <asp:Label ID="lblSeleccionEmpleado" Font-Bold="true" runat="server" />
        </div>
        </div>
       </div>


                                       
    <hr />

     <div>
     <div class="d-grid gap-2 col-6 mx-auto">
    <label for="inputEmail4" class="form-label">Ingrese DNI de Cliente: </label>
        <asp:TextBox type="text" runat="server"  class="form-control" id="txtBuscarClientexDNI" />
        <asp:Button ID="btnBuscarClientexDNI" runat="server" OnClick="btnBuscarClientexDNI_Click" Text="Buscar" />  
   
        <div class="row" > 
            <asp:GridView ID="dgvClientes" CssClass="table table-success table-striped" runat="server"
                AutoGenerateColumns="false"        
                DataKeyNames="IDCliente" OnSelectedIndexChanging="dgvClientes_SelectedIndexChanging">
                <Columns>
                    <asp:BoundField DataField="IDCliente" HeaderText="ID" />
                    <asp:BoundField DataField="DNI" HeaderText="DNI"/>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre"/>
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido"/>
                    <asp:CommandField ButtonType="Link" ShowSelectButton="true"  ShowEditButton="false" ShowDeleteButton="false" />
                </Columns>

            </asp:GridView>

            
            <asp:Label ID="lblIDCliente" runat="server" Visible="false" />
            <asp:Label ID="lblSeleccionCliente" Font-Bold="true" runat="server" />

        </div>
        </div>
       </div>

                                
    <hr />
    <div class="d-grid gap-2 col-6 mx-auto">
    <label for="inputEmail4" class="form-label">Detalle incidente: </label>
        <asp:TextBox type="text" runat="server"  class="form-control" id="txtDetalles" Height="50px" />
        
     </div>

    <asp:Label ID="lblConfirmacion" Font-Bold="true" runat="server" />

                                         
    <hr />
    <div class="d-grid gap-2 col-6 mx-auto">
         <label for="inputEmail4" class="form-label">Prioridad</label>
         <asp:DropDownList runat="server" ID="ddlPrioridad" CssClass="btn btn-outline-dark dropdown-toggle" AutoPostBack="true" >
         </asp:DropDownList>
             </div>

           <hr />                          
    <div class="d-grid gap-2 col-6 mx-auto">
         <label for="inputEmail4" class="form-label">Especialidad</label>
         <asp:DropDownList runat="server" ID="ddlEspecialidad" CssClass="btn btn-outline-dark dropdown-toggle" AutoPostBack="true" >
         </asp:DropDownList>
             </div>
                        
    <hr />
    <div class="d-grid gap-2 col-6 mx-auto">
     <asp:Button ID="btnCrearIncidente" runat="server" OnClick="btnCrearIncidente_Click" Text="Crear Incidente" /> 
    </div>

</asp:Content>
