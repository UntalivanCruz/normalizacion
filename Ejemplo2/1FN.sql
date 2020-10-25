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
    paciente [NVARCHAR](250) NOT NULL,
    fecha [DATE] NOT NULL
    -- specify more columns here
    CONSTRAINT pkVisitaMedica PRIMARY KEY(id)
);
GO

-- Create a new table called 'visitaDoctor' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.visitaDoctor', 'U') IS NOT NULL
DROP TABLE dbo.visitaDoctor
GO
-- Create the table in the specified schema
CREATE TABLE dbo.visitaDoctor
(
    visitaMedica_Id INT NOT NULL, -- primary key column
    doctor [NVARCHAR](50) NOT NULL,
    especialidad [NVARCHAR](50) NOT NULL,
    costo [FLOAT] NOT NULL,
    CONSTRAINT fkDoctorVisitaMedica FOREIGN KEY(visitaMedica_Id) REFERENCES visitaMedica(id),
    CONSTRAINT chCostoPermitidos CHECK(costo > 0)
    -- specify more columns here
);
GO

-- Create a new table called 'diagnostico' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.diagnostico', 'U') IS NOT NULL
DROP TABLE dbo.diagnostico
GO
-- Create the table in the specified schema
CREATE TABLE dbo.diagnostico
(
    visitaMedica_Id INT NOT NULL, -- primary key column
    diagnostico [NVARCHAR](250) NOT NULL,
    tratamiento [NVARCHAR](250) NOT NULL,
    CONSTRAINT fkDiagnosticoVisitaMedica FOREIGN KEY(visitaMedica_Id) REFERENCES visitaMedica(id)
    -- specify more columns here
);
GO
-- Insert rows into table 'visitaMedica'
INSERT INTO visitaMedica
( -- columns to insert data into
 [paciente],[fecha]
)
VALUES
( -- first row: values for the columns in the list above
 'Pedro',GETDATE()
),
( -- first row: values for the columns in the list above
 'Marcos','20201001'
),
( -- first row: values for the columns in the list above
 'Linda','20201005'
),
( -- first row: values for the columns in the list above
 'Pedro',GETDATE()
),
( -- first row: values for the columns in the list above
 'Daniel','20200401'
)
-- add more rows here
GO

-- Insert rows into table 'visitaDoctor'
INSERT INTO visitaDoctor
( -- columns to insert data into
[visitaMedica_Id], [doctor], [especialidad], [costo]
)
VALUES
( -- first row: values for the columns in the list above
 1,'Jose','Medico General',500
),
( -- second row: values for the columns in the list above
 2,'Maria','Pediatra',900
),
-- add more rows here
(
3,'Jose','Medico General',500
),
(
4,'Luis','Odontologo',1500
),
(
5,'Jose','Medico General',500
)
GO

-- Insert rows into table 'diagnostico'
INSERT INTO diagnostico
( -- columns to insert data into
 [visitaMedica_Id],[diagnostico],[tratamiento]
)
VALUES
( -- first row: values for the columns in the list above
 1,'Gripe','Analgesico'
),
( -- second row: values for the columns in the list above
 2,'Tos','Analgesico, Panadol, Desinflamatorio'
),
(
3,'Calentura','Paracetamol, Analgesico'
),
(
4,'Dolor','Analgesico, Desinflamatorio'
),
(
5,'Gripe','Analgesico'
)
-- add more rows here
GO
-- Select rows from a Table or View 'visitaMedica' in schema 'dbo'
SELECT * FROM dbo.visitaMedica
--WHERE 	/* add search conditions here */
GO
-- Select rows from a Table or View 'visitaDoctor' in schema 'dbo'
SELECT * FROM dbo.visitaDoctor
--WHERE 	/* add search conditions here */
GO
-- Select rows from a Table or View 'diagnostico' in schema 'dbo'
SELECT * FROM dbo.diagnostico
--WHERE 	/* add search conditions here */
GO