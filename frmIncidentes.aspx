<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmIncidentes.aspx.cs" Inherits="TPC_Caero_Hoffman.frmIncidentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div>
    <h3>Indicentes</h3>
    </div>
        <hr />

    <div>
    <h3>Buscar Incidente por ID </h3>
    </div>
    
     <div class="col-9">
        <asp:TextBox type="text" runat="server"  class="form-control" id="txtBuscarIncidentexID" />
        <asp:Button ID="btnBuscarIncidentexID" runat="server" OnClick="btnBuscarIncidentexID_Click" Text="Buscar" /> 
        </div>

                  <asp:GridView ID="dgvIncidentes" CssClass="table table-success table-striped" runat="server" AutoGenerateColumns="False" 
                      OnRowDataBound="dgvIncidentes_RowDataBound">

                <Columns>
                   
                  <asp:BoundField DataField="ID" HeaderText="N° de Incidente"/>  
                  <asp:BoundField DataField="Cliente.Nombre" HeaderText="Nombre de Cliente"/>
                  <asp:BoundField DataField="Cliente.Apellido" HeaderText="Apellido del Cliente"/>
                  <asp:BoundField DataField="Fecha_inicio" HeaderText="Fecha de Inicio" DataFormatString="{0:d}"  HtmlEncode=false />
                  <asp:BoundField DataField="Estado.Nombre_Estado" HeaderText="Estado"/>
                  <asp:BoundField DataField="Detalles" HeaderText="Detalles"/>      
                  <asp:BoundField DataField="Fecha_cierre" HeaderText="Fecha de Cierre" DataFormatString="{0:d}"  HtmlEncode=false  NullDisplayText="--" />               
                  <asp:BoundField DataField="ComentarioFinal" HeaderText="Comentario Final"  NullDisplayText="--"/>   
                    

                    

                    <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                <asp:LinkButton ID="btnModificar" runat="server" CommandName="Modificar" >Modificar   </asp:LinkButton>            
                                </ItemTemplate>
                    </asp:TemplateField>
                  
                     <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                <asp:LinkButton ID="btnResolver" runat="server" CommandName="Resolver" >Resolver   </asp:LinkButton>            
                                </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                <asp:LinkButton ID="btnReasignar" runat="server" CommandName="Reasignar" >Resignar  </asp:LinkButton>            
                                </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                <asp:LinkButton ID="btnCerrarIncidente" runat="server" CommandName="CerrarIncidente" >Cerrar  </asp:LinkButton>            
                                </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

            
        
  <a href="/frmAgregarIncidente.aspx">Agregar</a>













</asp:Content>
