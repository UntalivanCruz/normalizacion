-- Create a new database called 'normalizacion'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'normalizacion'
)
DROP DATABASE normalizacion

CREATE DATABASE normalizacion
GO
use normalizacion
GO

-- Create a new table called 'tecnicos' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.tecnicos', 'U') IS NOT NULL
DROP TABLE dbo.tecnicos
GO
-- Create the table in the specified schema
CREATE TABLE dbo.tecnicos
(
    id INT IDENTITY(1,1) NOT NULL, -- primary key column
    codigo_usuario [INT] NOT NULL,
    nombre [NVARCHAR](250) NOT NULL,
    areas [VARCHAR](250) NULL,
    CONSTRAINT pkTecnico PRIMARY KEY(id)
    -- specify more columns here
);
GO
-- Create a new table called 'casoTicket' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.casoTicket', 'U') IS NOT NULL
DROP TABLE dbo.casoTicket
GO
-- Create the table in the specified schema
CREATE TABLE dbo.casoTicket
(
    id INT IDENTITY(1,1) NOT NULL, -- primary key column
    problema [VARCHAR](250) NOT NULL,
    estado [VARCHAR](50) NOT NULL,
    tecnicoId [INT] NOT NULL, -- foreign key Tecnicos
    CONSTRAINT pkCasoTicket PRIMARY KEY(id),
    CONSTRAINT fkTecnicoCasoTicket FOREIGN KEY(tecnicoId) REFERENCES dbo.tecnicos(id)
    -- specify more columns here
);
GO
-- Create a new table called 'usuario' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.usuario', 'U') IS NOT NULL
DROP TABLE dbo.usuario
GO
-- Create the table in the specified schema
CREATE TABLE dbo.usuario
(
    id INT IDENTITY(1,1) NOT NULL, -- primary key column
    codigo_usuario [INT] NOT NULL,
    usuario_nombre [NVARCHAR](250) NOT NULL,
    CONSTRAINT pkUsuario PRIMARY KEY(id)
    -- specify more columns here
);
GO
-- Create a new table called 'usuarioTicket' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.usuarioTicket', 'U') IS NOT NULL
DROP TABLE dbo.usuarioTicket
GO
-- Create the table in the specified schema
CREATE TABLE dbo.usuarioTicket
(
    casoTicket_Id INT NOT NULL,
    usuario_Id [INT] NOT NULL,
    CONSTRAINT pkUsuarioTicket PRIMARY KEY(casoTicket_Id,usuario_Id),
    CONSTRAINT fkTicketUsuario FOREIGN KEY(casoTicket_Id) REFERENCES casoTicket(id),
    CONSTRAINT fkUsuarioTicket FOREIGN KEY(usuario_Id) REFERENCES usuario(id)
    -- specify more columns here
);
GO

-- Create a new table called 'procedimientos' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.procedimientos', 'U') IS NOT NULL
DROP TABLE dbo.procedimientos
GO
-- Create the table in the specified schema
CREATE TABLE dbo.procedimientos
(
    casoTicket_Id INT NOT NULL, -- primary key column
    descripcion [NVARCHAR](250) NOT NULL, -- primary key column
    CONSTRAINT pkProcedimientos PRIMARY KEY(casoTicket_Id,descripcion),
    CONSTRAINT fkProcedimientosTicket FOREIGN KEY(casoTicket_Id) REFERENCES casoTicket(id)
    -- specify more columns here
);
GO

-- Insert rows into table 'tecnicos'
INSERT INTO tecnicos
( -- columns tcodigo_t data into
 [codigo_usuario], [nombre], [areas]
)
VALUES
( -- first row: values for the columns in the list above
 2211, 'Juan Pablo', 'Informatica'
),
( -- second row: values for the columns in the list above
 2245, 'Luis Flores', 'Administracion'
),
-- add more rows here
(
 3251, 'Maria del Carmen', 'Contabilidad'
),
(
 3150, 'Pedro Antunez', 'Ventas'
),
(
 3111, 'Linda Flores', 'Contabilidad'
)
GO

-- Insert rows into table 'casoTicket'
INSERT INTO casoTicket
( -- columns to insert data into
 [problema],[estado],[tecnicoId]
)
VALUES
( -- first row: values for the columns in the list above
 'Monitor no funciona porque no me muestra ninguna luz e imagen del computador','Por Asignar',1
),
( -- second row: values for the columns in the list above
'El equipo tiene dos pitidos al arrancar y no pasa de pantalla del BIOS','Completo',2
),
-- add more rows here
( 
'No funciona los medios para la videollamada','Sin Recursos',1
),
( 
 'Equipo bloqueado despues de tres intentos de Login','Completo',1
)
GO
-- Insert rows into table 'usuario'
INSERT INTO usuario
( -- columns to insert data into
 [codigo_usuario], [usuario_nombre]
)
VALUES
( -- first row: values for the columns in the list above
 2211, 'Juan Pablo'
),
( -- second row: values for the columns in the list above
 3150, 'Pedro Antunez'
),
-- add more rows here
(
3111, 'Linda Flores'
)
GO

-- Insert rows into table 'usuarioTicket'
INSERT INTO usuarioTicket
( -- columns to insert data into
 [casoTicket_Id], [usuario_Id]
)
VALUES
( -- first row: values for the columns in the list above
 1,1
),
( -- second row: values for the columns in the list above
 2,2
),
-- add more rows here
( 
 3, 3
),
( 
 4, 1
)
GO

-- Insert rows into table 'procedimientos'
INSERT INTO procedimientos
( -- columns to insert data into
 [casoTicket_Id], [descripcion]
)
VALUES
( -- first row: values for the columns in the list above
 1, 'Se reviso el ticket por call center'
),
( -- second row: values for the columns in the list above
 1,'Ticket enviado a tecnico de turno'
),
-- add more rows here
(
2,'Se compartieron instrucciones'
),
(
2,'Se solicito envio de equipo a taller'
),
(
2,'Equipo reparado y entregado'
),
(
3, 'Se compartieron indicaciones basicas'
),
(
3,'En espera de un tecnico libre'
),
(
3,'Tecnicos ocupados'
),
(
4,'Restablecer usuario'
)
GO

-- Select rows from a Table or View 'casoTicket' in schema 'dbo'
SELECT * FROM dbo.casoTicket
--WHERE 	/* add search conditions here */
GO
-- Select rows from a Table or View 'tecnicos' in schema 'dbo'
SELECT * FROM dbo.tecnicos
--WHERE 	/* add search conditions here */
GO
-- Select rows from a Table or View 'usuarioTicket' in schema 'dbo'
SELECT * FROM dbo.usuarioTicket
--WHERE 	/* add search conditions here */
GO
-- Select rows from a Table or View 'procedimienots' in schema 'dbo'
SELECT * FROM dbo.procedimientos
--WHERE 	/* add search conditions here */
GO
-- Select rows from a Table or View 'usuario' in schema 'dbo'
SELECT * FROM dbo.usuario
--WHERE 	/* add search conditions here */
GO