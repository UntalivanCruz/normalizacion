-- Create a new database called 'consultorioMedico'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'consultorioMedico'
)
DROP DATABASE consultorioMedico
GO
CREATE DATABASE consultorioMedico
GO
USE consultorioMedico
GO
-- Create a new table called 'visitaMedica' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.visitaMedica', 'U') IS NOT NULL
DROP TABLE dbo.visitaMedica
GO
-- Create the table in the specified schema
CREATE TABLE dbo.visitaMedica
(
    id [INT] IDENTITY(1,1) NOT NULL, -- primary key column
    doctor [NVARCHAR](250) NOT NULL,
    especialidad [NVARCHAR](50) NOT NULL,
    paciente [NVARCHAR](50) NOT NULL,
    fecha [DATE] NOT NULL,
    diagnostico [NVARCHAR](250) NULL,
    tratamiento [NVARCHAR](250) NULL,
    costo [FLOAT] NULL,
    -- specify more columns here
    CONSTRAINT pkVisitaMedica PRIMARY KEY(id)
);
GO
-- Insert rows into table 'visitaMedica'
INSERT INTO visitaMedica
( -- columns to insert data into
 [doctor], [especialidad], [paciente],[fecha],[diagnostico],[tratamiento],[costo]
)
VALUES
( -- first row: values for the columns in the list above
 'Jose','Medico General','Pedro',GETDATE(),'Gripe','Analgesico',500
),
( -- first row: values for the columns in the list above
 'Maria','Pediatra','Marcos','20201001','Tos','Analgesico, Panadol, Desinflamatorio',900
),
( -- first row: values for the columns in the list above
 'Jose','Medico General','Linda','20201005','Calentura','Paracetamol, Analgesico',500
),
( -- first row: values for the columns in the list above
 'Luis','Odontologo','Pedro',GETDATE(),'Dolor','Analgesico, Desinflamatorio',1500
),
( -- first row: values for the columns in the list above
 'Jose','Medico General','Daniel','20200401','Gripe','Analgesico',500
)
-- add more rows here
GO

-- Select rows from a Table or View 'visitaMedica' in schema 'SchemaName'
SELECT * FROM dbo.visitaMedica
--WHERE 	/* add search conditions here */
GO