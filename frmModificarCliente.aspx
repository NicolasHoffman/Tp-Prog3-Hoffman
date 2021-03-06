<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmModificarCliente.aspx.cs" Inherits="TPC_Caero_Hoffman.frmModificarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <style >
        .col-9{
            margin-left: 10px;
        }
    </style>



    <div>
    <h2>Modificar Cliente</h2>
    </div>
    <div>
     <div class="col-9">
    <label for="inputEmail4" class="form-label">Ingrese DNI</label>
        <asp:TextBox type="text" runat="server"  class="form-control" id="txtBuscarClientexDNI" />
        <asp:Button ID="btnBuscarClientexDNI" runat="server" OnClick="btnBuscarClientexDNI_Click" Text="Buscar" />  
   
        <div class="row" > 
            <asp:GridView ID="dgvClientes" CssClass="table table-success table-striped" runat="server"
                AutoGenerateColumns="false" 
                OnRowCancelingEdit="rowCancelEditEvent" 
                OnRowDeleting="rowDeletingEvent" 
                OnRowEditing="rowEditingEvent" 
                OnRowUpdating="rowUpdatingEvent"
                DataKeyNames="IDCliente">

                <Columns>
                    <asp:TemplateField HeaderText="DNI">
                        <ItemTemplate> 
                            <asp:Label Text=<%# Bind("DNI")%> runat="server" ID="lblDNI" />
                        </ItemTemplate>              
                        <EditItemTemplate> 
                            <asp:TextBox runat="server" ID="txtDNI" Text=<%# Bind("DNI")%> />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate> 
                            <asp:Label Text=<%# Bind("Nombre")%> runat="server" ID="lblNombre" />
                        </ItemTemplate>              
                        <EditItemTemplate> 
                            <asp:TextBox runat="server" ID="txtNombre" Text=<%# Bind("Nombre")%> />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Apellido">
                    <ItemTemplate> 
                            <asp:Label Text=<%# Bind("Apellido")%> runat="server" ID="lblApellido" />
                        </ItemTemplate>              
                        <EditItemTemplate> 
                            <asp:TextBox runat="server" ID="txtApellido" Text=<%# Bind("Apellido")%> />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Telefono">
                    <ItemTemplate> 
                            <asp:Label Text=<%# Bind("Telefono")%> runat="server" ID="lblTelefono" />
                        </ItemTemplate>              
                        <EditItemTemplate> 
                            <asp:TextBox runat="server" ID="txtTelefono" Text=<%# Bind("Telefono")%> />
                        </EditItemTemplate>
                    </asp:TemplateField>  

                   
                    <asp:CommandField ButtonType="Link" ShowEditButton="true" />
                </Columns>

            </asp:GridView>
        </div>
        </div>
       </div>



</asp:Content>
