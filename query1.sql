-- Create a new database called 'normalizacion'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'normalizacion'
)
CREATE DATABASE normalizacion
GO
use normalizacion
GO

-- Create a new table called 'ClienteTelefonos' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.ClienteTelefonos', 'U') IS NOT NULL
DROP TABLE dbo.ClienteTelefonos
GO
-- Create the table in the specified schema
CREATE TABLE dbo.ClienteTelefonos
(
    C_Cliente [INT] NOT NULL, -- primary key column
    Telefono [NVARCHAR](50) NOT NULL, -- primary key column
    CONSTRAINT pk_TelefonosClientes PRIMARY KEY(C_Cliente,Telefono),
    CONSTRAINT fk_ClientesTelefonos FOREIGN KEY(C_Cliente) REFERENCES dbo.Cliente(C_Cliente)

    -- specify more columns here
);
GO

-- Create a new table called 'Cliente' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Cliente', 'U') IS NOT NULL
DROP TABLE dbo.Cliente
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Cliente
(
    C_Cliente INT NOT NULL IDENTITY(1,1), -- primary key column
    N_Cliente [NVARCHAR](50) NOT NULL,
    N_Apellido [NVARCHAR](50) NOT NULL,
    Constraint pk_Cliente PRIMARY key(C_Cliente)
    -- specify more columns here
);
GO


-- Insert rows into table 'Cliente'
INSERT INTO Cliente
( -- columns to insert data into
 [N_Cliente], [N_Apellido]
)
VALUES
( -- first row: values for the columns in the list above
 'Juan', 'Perez'
),
( -- second row: values for the columns in the list above
 'Pedro','Moreno'
)
,
(
 'Jose','Quispe'
)
-- add more rows here
GO

-- Select rows from a Tabldbo.cliente' in schema 'SchemaName'
SELECT * FROM dbo.cliente
--WHERE 	/* add search conditions here */
GO

-- Insert rows into table 'TableName'
INSERT INTO dbo.ClienteTelefonos
( -- columns to insert data into
 [C_Cliente], [Telefono]
)
VALUES
( -- first row: values for the columns in the list above
 1, '959584'
),
( -- second row: values for the columns in the list above
 2,'5885848'
)
-- add more rows here
,
( 
 2,'6858584'
)
GO

-- Select rows from a Tabldbo.Clientes' in schema 'SchemaName'
SELECT * FROM dbo.Cliente
--WHERE 	/* add search conditions here */
select * from dbo.ClienteTelefonos
GO

select * from dbo.Cliente as c
inner join ClienteTelefonos as ct on c.C_Cliente=ct.C_Cliente
