<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMenuAdministrador.aspx.cs" Inherits="TPC_Caero_Hoffman.frmMenuAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="d-grid gap-2 col-6 mx-auto">
    <h1>Clientes</h1>
    <asp:Button Text="Ingresar Cliente" ID="btnIngresarCliente" CssClass="btn btn-dark" runat="server" OnClick="btnIngresarCliente_Click" />
     <asp:Button Text="Modificar Cliente" ID="btnModificarCliente" OnClick="btnModificarCliente_Click" CssClass="btn btn-dark" runat="server" />
    <asp:Button Text="Eliminar Cliente" ID="brnEliminarCliente" OnClick="btnEliminarCliente_Click"   CssClass="btn btn-dark" runat="server" />
    </div>

    <div class="d-grid gap-2 col-6 mx-auto">
    <h1>Incidentes</h1>
    <asp:Button Text="Ver incidentes" ID="btnVerIndicente" OnClick="btnVerIncidente_Click"  CssClass="btn btn-dark" runat="server" />
    </div>

    <div class="d-grid gap-2 col-6 mx-auto">
    <h1>Empleados</h1>
    <asp:Button Text="Registrar Empleado" ID="btnRegistrarEmpleado" CssClass="btn btn-dark" runat="server" OnClick="btnRegistrarEmpleado_Click" />
   <asp:Button Text="Modificar Empleado" ID="btnModificarEmpleado"  CssClass="btn btn-dark" runat="server" OnClick="btnModificarEmpleado_Click" />
    <asp:Button Text="Eliminar Empleado" ID="btnEliminarEmpleado" CssClass="btn btn-dark" runat="server" OnClick="btnEliminarEmpleado_Click" />
    </div>
</asp:Content>
