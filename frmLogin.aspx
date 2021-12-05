<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="TPC_Caero_Hoffman.frmLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    
<div class="d-grid gap-2 col-6 mx-auto">
            <label class="form-label">Usuario</label>
            <asp:TextBox runat="server" id="txtUser" placeholder="user name" CssClass="form-control"/>
        </div>
<div class="d-grid gap-2 col-6 mx-auto">
            <label class="form-label">Contraseña</label>
            <asp:TextBox runat="server" placeholder="*****" id="txtPassword" CssClass="form-control" TextMode="Password"/>
        </div>
    <div class="d-grid gap-2 col-6 mx-auto">
            <hr />
        <div>
       <asp:Button Text="Ingresar" runat="server" ID="btnIngresar" OnClick="btnIngresar_Click" cssclass="btn btn-primary"/>
    </div>

</div>

</asp:Content>
