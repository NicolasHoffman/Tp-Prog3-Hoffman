<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMenuSupervisor.aspx.cs" Inherits="TPC_Caero_Hoffman.frmMenuSupervisor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="d-grid gap-2 col-6 mx-auto">
    <h1>Incidentes</h1>
    <asp:Button Text="Ver incidentes" ID="btnVerIncidente" OnClick="btnVerIncidente_Click"  CssClass="btn btn-dark" runat="server" />
    </div>

    <div class="d-grid gap-2 col-6 mx-auto">
    <h1>Clientes</h1>
    <asp:Button Text="Ver Clientes" ID="btnVerCliente" OnClick="btnVerCliente_Click"   CssClass="btn btn-dark" runat="server" />
    </div>

    <div class="d-grid gap-2 col-6 mx-auto">
    <h1>Empleados</h1>
    <asp:Button Text="Ver Empleados" ID="btnVerEmpleados" CssClass="btn btn-dark" runat="server" OnClick="btnVerEmpleados_Click" />
    </div>



</asp:Content>
