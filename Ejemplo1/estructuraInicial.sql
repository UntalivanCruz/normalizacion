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
    codigo_usuario [INT] NOT NULL,
    usuario_nombre [NVARCHAR](50) NOT NULL,
    problema [VARCHAR](250) NOT NULL,
    procedimento1 [VARCHAR](250) NULL,
    procedimento2 [VARCHAR](250) NULL,
    procedimento3 [VARCHAR](250) NULL,
    estado [VARCHAR](50) NOT NULL,
    tecnicoId [INT] NOT NULL, -- foreign key Tecnicos
    CONSTRAINT pkCasoTicket PRIMARY KEY(id),
    CONSTRAINT fkTecnicoCasoTicket FOREIGN KEY(tecnicoId) REFERENCES dbo.tecnicos(id)
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
 [codigo_usuario], [usuario_nombre], [problema],[procedimento1],[procedimento2],[procedimento3],[estado],[tecnicoId]
)
VALUES
( -- first row: values for the columns in the list above
 2211, 'Juan Pablo', 'Monitor no funciona porque no me muestra ninguna luz e imagen del computador','Se reviso el ticket por call center','Ticket enviado a tecnico de turno',NULL,'Por Asignar',1
),
( -- second row: values for the columns in the list above
 3150, 'Pedro Antunez', 'El equipo tiene dos pitidos al arrancar y no pasa de pantalla del BIOS','Se compartieron instrucciones','Se solicito envio de equipo a taller','Equipo reparado y entregado','Completo',2
),
-- add more rows here
( 
 3111, 'Linda Flores', 'No funciona los medios para la videollamada','Se compartieron indicaciones basicas','En espera de un tecnico libre','Tecnicos ocupados','Sin Recursos',1
),
( 
 2211, 'Juan Pablo', 'Equipo bloqueado despues de tres intentos de Login','Restablecer usuario',NULL,NULL,'Completo',1
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