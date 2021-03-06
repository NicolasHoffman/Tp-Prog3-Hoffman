Create Database CALLCENTER_DB
go
Use CALLCENTER_DB
go

Create Table Direccion(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
CALLE VARCHAR(150) NOT NULL,
ALTURA INT NOT NULL,
LOCALIDAD VARCHAR(100) NOT NULL,
CODIGOPOSTAL VARCHAR(10) NOT NULL,
PROVINCIA VARCHAR(100) NOT NULL
)

Create Table Clientes(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
NOMBRE VARCHAR(150) NOT NULL,
APELLIDO VARCHAR(150) NOT NULL,
DNI VARCHAR(15) NOT NULL,
IDDIRECCION INT NOT NULL FOREIGN KEY REFERENCES Direccion(ID),
EMAIL VARCHAR(250) NOT NULL,
TELEFONO VARCHAR(30) NOT NULL,
FECHANACIMIENTO DATE NOT NULL CHECK(YEAR(FECHANACIMIENTO) > 1900)
)

ALTER TABLE Clientes  
ADD FECHAALTA DATE NULL CHECK(YEAR(FECHAALTA) > 1900)







Create Table Cargos(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
NOMBRECARGO VARCHAR(150) NOT NULL
)

Create Table Empleados(
ID INT NOT NULL PRIMARY KEY,
NOMBREUSUARIO VARCHAR(150) NOT NULL UNIQUE,
CONTRASE?A VARCHAR(150) NOT NULL,
NOMBRE VARCHAR(150) NOT NULL,
IDCARGO INT NOT NULL FOREIGN KEY REFERENCES Cargos(ID),
APELLIDO VARCHAR(150) NOT NULL,
DNI VARCHAR(15) NOT NULL,
IDDIRECCION INT NOT NULL FOREIGN KEY REFERENCES Direccion(ID),
EMAIL VARCHAR(250) NOT NULL,
TELEFONO VARCHAR(30) NOT NULL,
FECHANACIMIENTO DATE NOT NULL CHECK(YEAR(FECHANACIMIENTO) > 1900)
)





Create Table Estados(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
NOMBREESTADO VARCHAR(100) NOT NULL UNIQUE
)

Create Table Incidentes(
ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
IDEMPLEADO INT NOT NULL FOREIGN KEY REFERENCES Empleados(ID),
IDCLIENTE INT NOT NULL FOREIGN KEY REFERENCES Clientes(ID),
FECHA_INICIO DATE NOT NULL,
FECHA_CIERRE DATE NULL,
DETALLES VARCHAR(2000) NOT NULL,
IDESTADO INT NOT NULL FOREIGN KEY REFERENCES Estados(ID),
CHECK(FECHA_INICIO <= FECHA_CIERRE)
)

ALTER TABLE Incidentes  
ADD COMENTARIOFINAL VARCHAR(2000) NULL


Insert Into Cargos(NOMBRECARGO) 
VALUES('Administrador'),
	  ('Supervisor'),
	  ('Telefonista');

Insert Into Estados(NOMBREESTADO) 
VALUES('Abierto'),
	  ('En An?lisis'),
	  ('Cerrado'),
	  ('Reabierto'),
	  ('Asignado'),
	  ('Resuelto');

Insert Into Direccion(CALLE, ALTURA, LOCALIDAD, CODIGOPOSTAL, PROVINCIA) 
VALUES('Tomas Iriarte', 1576, 'Benavidez', 'CP1621', 'Buenos Aires'),
	  ('Bartolom? Mitre', 1786, 'Capital Federal', 'CP A1741', 'Buenos Aires'),
	  ('Tejeringo Heloyo', 2054, 'Lugones', 'CP 9741', 'Buenos Aires'),
	  ('Mir?com Semuev', 3786, 'Tortuguitas', 'CP 2741', 'Buenos Aires');

Insert Into Clientes(NOMBRE, APELLIDO, DNI, IDDIRECCION, EMAIL, TELEFONO, FECHANACIMIENTO)
VALUES('Nicolas', 'Hoffman', '37327693', 1, 'nhoffman@alumnos.frgp.edu.ar', '+54 1163088646', '1994-08-05'),
	  ('Pablo', 'Caero', '38327693', 2, 'pcaero@alumnos.frgp.edu.ar', '+54 3327413030', '1995-09-25');

Insert Into Empleados(ID, NOMBREUSUARIO, CONTRASE?A, NOMBRE, APELLIDO, IDCARGO, DNI, IDDIRECCION, EMAIL, TELEFONO, FECHANACIMIENTO)
VALUES(17982, 'nhoffman', 'voyaentrar1234', 'Nicole', 'Hoffman', 2,  '32327693', 3, 'nicolehoffman@alumnos.frgp.edu.ar', '+54 1163088642', '1994-08-05'),
	  (20156, 'paucaero', 'ahientro234', 'Paula', 'Caero',3, '31327693', 4, 'paulacaero@alumnos.frgp.edu.ar', '+54 3327413031', '1995-09-25');

Insert Into Incidentes(IDEMPLEADO, IDCLIENTE, FECHA_INICIO, FECHA_CIERRE, DETALLES, IDESTADO, COMENTARIOFINAL)
VALUES(17982, 1, getDate(), NULL, 'Se solicita un n?mero telef?nico del embajador de Rusia', 2, NULL),
	  (20156, 2, getDate(), NULL, 'Se solicita un n?mero telef?nico del embajador de China', 3, NULL);


Select * From Cargos
Select * From Clientes
Select * From Incidentes
Select * From Empleados
Select * From Estados
Select * From Direccion

SELECT ID, FECHA_INICIO, FECHA_CIERRE, IDEMPLEADO, NOMEMPLEADO, APEEMPLEADO, IDCLIENTE, NOMCLIENTE, APECLIENTE, DETALLES, IDESTADO, NOMBREESTADO, COMENTARIOFINAL FROM VW_INCIDENTES
SELECT ID, FECHA_INICIO, FECHA_CIERRE, IDEMPLEADO, NOMEMPLEADO, APEEMPLEADO, IDCLIENTE, NOMCLIENTE, APECLIENTE, DETALLES, IDESTADO, NOMBREESTADO, COMENTARIOFINAL FROM VW_INCIDENTES

--Use CALLCENTER_DB
--Insert Into Clientes(NOMBRE, APELLIDO, DNI, IDDIRECCION, EMAIL, TELEFONO, FECHANACIMIENTO)
--VALUES('Prueba', 'Prueba', '37327693', (Select max(ID) From Direccion), 'nhoffman@alumnos.frgp.edu.ar', '+54 1163088646', '1994-08-05')
--Select max(ID) From Direccion
--Delete From Clientes Where ID = 3

Use CALLCENTER_DB
Create Procedure SP_ListarCargos AS
BEGIN
Select ID, NOMBRECARGO From Cargos
END