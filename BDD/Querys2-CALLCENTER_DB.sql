Use Callcenter_DB

Select * From Clientes
Select * From Incidentes
Select * From Direccion
Select * From Cargos
Select * From Estados
Select ID, CALLE, ALTURA, LOCALIDAD, CODIGOPOSTAL, PROVINCIA From Direccion
Select IDEMPLEADO, From Incidentes I
Select C.ID, C.NOMBRE, C.APELLIDO, C.DNI, C.IDDIRECCION, D.CALLE, D.ALTURA, D.LOCALIDAD, D.CODIGOPOSTAL, D.PROVINCIA, C.EMAIL, C.TELEFONO, C.FECHANACIMIENTO From Clientes C INNER JOIN Direccion D ON C.IDDIRECCION = D.ID
Select C.ID, C.NOMBRE, C.APELLIDO, C.DNI, C.IDDIRECCION, D.CALLE, D.ALTURA, D.LOCALIDAD, D.CODIGOPOSTAL,  D.PROVINCIA , C.EMAIL, C.TELEFONO, C.FECHANACIMIENTO From Clientes C, Direccion D WHERE C.IDDIRECCION = D.ID
Select * From iNCIDENTES
Select E.ID, E.NOMBREUSUARIO, E.CONTRASE�A, E.NOMBRE, E.APELLIDO, E.DNI, E.IDCARGO, C.NOMBRECARGO, E.IDDIRECCION, D.CALLE, D.ALTURA, D.LOCALIDAD, D.CODIGOPOSTAL, D.PROVINCIA, E.EMAIL, E.TELEFONO, E.FECHANACIMIENTO From Empleados E INNER JOIN Direccion D ON E.IDDIRECCION = D.ID INNER JOIN Cargos C ON C.ID = E.IDCARGO



Select I.ID, I.FECHA_INICIO, I.FECHA_CIERRE, I.IDEMPLEADO, E.NOMBRE AS NOMEMPLEADO, E.APELLIDO AS APEEMPLEADO, I.IDCLIENTE, C.NOMBRE AS NOMCLIENTE, C.APELLIDO AS APECLIENTE, I.DETALLES, I.IDESTADO, ES.NOMBREESTADO, I.COMENTARIOFINAL From Incidentes I INNER JOIN Empleados E ON E.ID = I.IDEMPLEADO INNER JOIN Estados ES ON ES.ID = I.IDESTADO INNER JOIN Clientes C ON C.ID = I.IDCLIENTE