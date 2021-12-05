<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmEliminarEmpleado.aspx.cs" Inherits="TPC_Caero_Hoffman.frmEliminarEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style >
        .col-9{
            margin-left: 10px;
        }
    </style>
    
    <div>
    <h4>Eliminar Empleado</h4>
    </div>
    <div>
     <div class="col-9">
    <label for="inputEmail4" class="form-label">Ingrese Legajo</label>
        <asp:TextBox type="text" runat="server"  class="form-control" id="txtBuscarEmpleadoxleg" />
        <asp:Button ID="btnBuscarEmpleadoxLegajo" runat="server" OnClick="btnBuscarEmpleadoxLegajo_Click" Text="Buscar" />  
   
        <div class="row" > 
            <asp:GridView ID="dgvEmpleados" CssClass="table table-success table-striped" runat="server"
                AutoGenerateColumns="false"          
                DataKeyNames="Legajo" 
                OnRowDeleting="rowDeletingEvent">
                <Columns>

                    <asp:TemplateField HeaderText="Legajo">
                        <ItemTemplate> 
                            <asp:Label Text=<%# Bind("Legajo")%> runat="server" ID="lblLegajo" />
                        </ItemTemplate>             
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Apellido">
                    <ItemTemplate> 
                            <asp:Label Text=<%# Bind("Apellido")%> runat="server" ID="lblApellido" />
                        </ItemTemplate>              
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate> 
                            <asp:Label Text=<%# Bind("Nombre")%> runat="server" ID="lblNombre" />
                        </ItemTemplate>              
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="DNI">
                    <ItemTemplate> 
                            <asp:Label Text=<%# Bind("DNI")%> runat="server" ID="lblDni" />
                        </ItemTemplate>              
                    </asp:TemplateField>

                       <asp:TemplateField HeaderText="Cargo">
                    <ItemTemplate> 
                            <asp:Label Text=<%# Bind("Cargo.Nombre_Cargo")%> runat="server" ID="lblCargo" />
                        </ItemTemplate>              
                    </asp:TemplateField>
   
                    <asp:CommandField ButtonType="Link" ShowEditButton="false" ShowDeleteButton="true" />


                </Columns>

            </asp:GridView>
            
        </div>
        </div>
       </div>
</asp:Content>
