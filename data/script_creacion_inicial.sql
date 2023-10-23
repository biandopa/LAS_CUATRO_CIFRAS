USE [GD2C2023]
GO


--------------------DROPS PREVENTIVOS ---------------------------

-------------DROP PREVENTIVO DE SCHEMA----------------------------
IF EXISTS (SELECT name FROM sys.schemas WHERE name = 'LAS_CUATRO_CIFRAS')
DROP SCHEMA LAS_CUATRO_CIFRAS
GO


-----------------DROP PREVENTIVO DE TABLAS---------------------------
IF EXISTS (SELECT name FROM sys.tables WHERE name = 'tipo_operacion')
DROP TABLE LAS_CUATRO_CIFRAS.tipo_operacion

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'provincia')
DROP TABLE LAS_CUATRO_CIFRAS.provincia

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'localidad')
DROP TABLE LAS_CUATRO_CIFRAS.localidad

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'barrio')
DROP TABLE LAS_CUATRO_CIFRAS.barrio

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'direccion')
DROP TABLE LAS_CUATRO_CIFRAS.direccion

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'tipo_inmueble')
DROP TABLE LAS_CUATRO_CIFRAS.tipo_inmueble

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'disposicion_inmueble')
DROP TABLE LAS_CUATRO_CIFRAS.disposicion_inmueble

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'estado_inmueble')
DROP TABLE LAS_CUATRO_CIFRAS.estado_inmueble

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'orientacion_inmueble')
DROP TABLE LAS_CUATRO_CIFRAS.orientacion_inmueble

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'caracteristica')
DROP TABLE LAS_CUATRO_CIFRAS.caracteristica

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'propietario')
DROP TABLE LAS_CUATRO_CIFRAS.propietario

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'inmueble')
DROP TABLE LAS_CUATRO_CIFRAS.inmueble

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'inmueble_caracteristica')
DROP TABLE LAS_CUATRO_CIFRAS.inmueble_caracteristica

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'sucursal')
DROP TABLE LAS_CUATRO_CIFRAS.sucursal

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'agente')
DROP TABLE LAS_CUATRO_CIFRAS.agente

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'moneda')
DROP TABLE LAS_CUATRO_CIFRAS.moneda

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'anuncio')
DROP TABLE LAS_CUATRO_CIFRAS.anuncio

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'inquilino')
DROP TABLE LAS_CUATRO_CIFRAS.inquilino

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'alquiler')
DROP TABLE LAS_CUATRO_CIFRAS.alquiler

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'medio_pago')
DROP TABLE LAS_CUATRO_CIFRAS.medio_pago

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'pago_alquiler')
DROP TABLE LAS_CUATRO_CIFRAS.pago_alquiler

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'importe_alquiler')
DROP TABLE LAS_CUATRO_CIFRAS.importe_alquiler

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'comprador')
DROP TABLE LAS_CUATRO_CIFRAS.comprador

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'venta')
DROP TABLE LAS_CUATRO_CIFRAS.venta
GO


-------------DROP PREVENTIVO DE STORED PROCEDURES---------------------
/*IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'procedure_name')
DROP PROCEDURE procedure_name

...
GO*/






------------CREACIÓN DE COMPONENTES----------------------

------------CREACIÓN DE SCHEMA---------------------------
CREATE SCHEMA [LAS_CUATRO_CIFRAS]
GO

-----------CREACIÓN DE TABLAS-------------------
CREATE TABLE LAS_CUATRO_CIFRAS.tipo_operacion
(
    id_tipo_operacion numeric(18,0)
        CONSTRAINT tipo_operacion_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL
)

CREATE TABLE LAS_CUATRO_CIFRAS.provincia
(
    id_provincia numeric(18,0)
        CONSTRAINT provincia_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL

)

CREATE TABLE LAS_CUATRO_CIFRAS.localidad
(
    id_localidad numeric(18,0)
        CONSTRAINT localidad_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL

)

CREATE TABLE LAS_CUATRO_CIFRAS.barrio
(
    id_barrio numeric(18,0)
        CONSTRAINT barrio_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL

)

CREATE TABLE LAS_CUATRO_CIFRAS.direccion
(
    id_direccion numeric(18,0)
        CONSTRAINT direccion_pk
            PRIMARY KEY,
    provincia numeric(18,0)
        DEFAULT ''
        CONSTRAINT provincia_direccion_fk
            REFERENCES LAS_CUATRO_CIFRAS.provincia,
    localidad numeric(18,0)
        DEFAULT ''
        CONSTRAINT localidad_direccion_fk
            REFERENCES LAS_CUATRO_CIFRAS.localidad,
    barrio numeric(18,0)
        DEFAULT ''
        CONSTRAINT barrio_direccion_fk
            REFERENCES LAS_CUATRO_CIFRAS.barrio,
    calle nvarchar(100) NOT NULL,

)

CREATE TABLE LAS_CUATRO_CIFRAS.tipo_inmueble
(
    id_tipo numeric(18,0)
        CONSTRAINT tipo_inmueble_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL

)

CREATE TABLE LAS_CUATRO_CIFRAS.disposicion_inmueble
(
    id_disposicion numeric(18,0)
        CONSTRAINT disposicion_inmueble_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL
)

CREATE TABLE LAS_CUATRO_CIFRAS.estado_inmueble
(
    id_estado numeric(18,0)
        CONSTRAINT estado_inmueble_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL
)

CREATE TABLE LAS_CUATRO_CIFRAS.orientacion_inmueble
(
    id_orientacion numeric(18,0)
        CONSTRAINT orientacion_inmueble_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL
)

CREATE TABLE LAS_CUATRO_CIFRAS.caracteristica
(
    id_caracteristica numeric(18,0)
        CONSTRAINT caracteristica_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL
)

CREATE TABLE LAS_CUATRO_CIFRAS.propietario
(
    id_dni numeric(18, 0)
        CONSTRAINT dni_propietario_pk
            PRIMARY KEY,
    nombre nvarchar(100) NOT NULL,
    apellido nvarchar(100) NOT NULL,
    fecha_registro numeric(18, 0)
        NOT NULL DEFAULT GETDATE(),
    telefono numeric(18, 0) NOT NULL,
    mail nvarchar (255),
    fecha_nacimiento datetime NOT NULL,
)

CREATE TABLE LAS_CUATRO_CIFRAS.inmueble
(
    id_inmueble numeric(18,0)
        CONSTRAINT inmueble_pk
            PRIMARY KEY,
    tipo numeric(18,0)
        CONSTRAINT tipo_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.tipo_inmueble,
    descripcion nvarchar(100) NOT NULL,
    id_propietario numeric(18,0)
        CONSTRAINT propietario_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.propietario,
    id_direccion numeric(18,0)
        CONSTRAINT direccion_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.direccion,
    ambientes nvarchar(100),
    superficie_total numeric(18,2),
    disposicion numeric(18,0)
        CONSTRAINT disposicion_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.disposicion_inmueble,
    orientacion numeric(18,0)
        CONSTRAINT orientacion_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.orientacion_inmueble,
    estado numeric(18,0)
        CONSTRAINT estado_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.estado_inmueble,
    antiguedad numeric(18,0),
    expensas numeric(18,2),
)

CREATE TABLE LAS_CUATRO_CIFRAS.inmueble_caracteristica
(
    id_inmueble numeric(18,0)
        CONSTRAINT inmueble_caracteristica_fk
           REFERENCES LAS_CUATRO_CIFRAS.inmueble,
    id_caracteristica numeric(18,0)
        CONSTRAINT caracteristica_fk
            REFERENCES LAS_CUATRO_CIFRAS.caracteristica
)

CREATE TABLE LAS_CUATRO_CIFRAS.sucursal
(
     id_sucursal numeric(18,0)
         CONSTRAINT sucursal_pk
            PRIMARY KEY,
    nombre nvarchar(100) NOT NULL,
    direccion numeric(18,0)
        CONSTRAINT direccion_sucursal_fk
            REFERENCES LAS_CUATRO_CIFRAS.direccion,
    telefono numeric(18,0) NOT NULL,
)

CREATE TABLE LAS_CUATRO_CIFRAS.agente
(
    dni numeric(18,0)
        CONSTRAINT dni_agente_pk
            PRIMARY KEY,
    nombre nvarchar(100) NOT NULL,
    apellido nvarchar(100) NOT NULL,
    fecha_registro datetime
        NOT NULL DEFAULT GETDATE(),
    telefono numeric(18,0) NOT NULL,
    mail nvarchar(100),
    fecha_nacimiento datetime NOT NULL,
    sucursal numeric(18,0)
        CONSTRAINT sucursal_agente_fk
            REFERENCES LAS_CUATRO_CIFRAS.sucursal
)

CREATE TABLE LAS_CUATRO_CIFRAS.moneda(
	id_moneda numeric(18,0)
        CONSTRAINT moneda_pk
            PRIMARY KEY,
	descripcion nvarchar(100) NOT NULL
)

CREATE TABLE LAS_CUATRO_CIFRAS.anuncio
(
    id_anuncio numeric(18,0)
        CONSTRAINT anuncio_pk
            PRIMARY KEY,
    fecha_publicacion datetime
        NOT NULL DEFAULT GETDATE(),
    agente numeric(18,0)
        CONSTRAINT agente_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.agente,
    tipo_operacion numeric(18,0)
        CONSTRAINT tipo_operacion_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.tipo_operacion,
    inmueble numeric(18,0)
        CONSTRAINT inmueble_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.inmueble,
    precio_inmueble numeric(18,2) NOT NULL,
    moneda numeric(18,0)
        CONSTRAINT moneda_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.moneda,
    tipo_periodo nvarchar(100) NOT NULL,
    estado numeric(18,0)
        CONSTRAINT estado_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.estado_inmueble,
    fecha_finalizacion datetime NOT NULL,
    costo_publicacion numeric(18,2),
    CONSTRAINT CHK_Date CHECK (fecha_finalizacion > fecha_publicacion)
)


CREATE TABLE LAS_CUATRO_CIFRAS.inquilino(
	dni numeric(18,0)
		CONSTRAINT dni_inquilino_pk
		    PRIMARY KEY,
	nombre nvarchar(100) NOT NULL,
	apellido nvarchar(100) NOT NULL,
	fecha_registro datetime
        NOT NULL DEFAULT GETDATE(),
	telefono numeric(18,0) NOT NULL,
	mail nvarchar(100),
	fecha_nac datetime NOT NULL,
)

CREATE TABLE LAS_CUATRO_CIFRAS.alquiler(
	id_alquiler numeric(18,0)
		CONSTRAINT alquiler_pk
		    PRIMARY KEY,
	id_anuncio numeric(18,0)
		CONSTRAINT anuncio_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.anuncio,
	id_inquilino numeric(18,0)
		CONSTRAINT inquilino_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.inquilino,
    fecha_fin datetime NOT NULL,
	fecha_inicio datetime
        NOT NULL DEFAULT GETDATE(),
	duracion numeric(18,0),
	importe numeric(18,0),
	deposito numeric(18,2),
	comision numeric(18,2),
	gasto_averig numeric(18,2)
    CONSTRAINT CHK_Alquiler_Date CHECK (fecha_fin > fecha_inicio)
)

CREATE TABLE LAS_CUATRO_CIFRAS.medio_pago(
	id_medio_pago numeric(18,0)
        CONSTRAINT medio_pago_pk
            PRIMARY KEY,
	descripcion nvarchar(100) NOT NULL
)

CREATE TABLE LAS_CUATRO_CIFRAS.pago_alquiler(
	id_pago_alquiler numeric(18,0)
		CONSTRAINT pago_alquiler_pk
		    PRIMARY KEY,
	id_alquiler numeric(18,0)
		CONSTRAINT alquiler_pago_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.alquiler,
	id_medio_pago numeric(18,0)
		CONSTRAINT medio_pago_pago_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.medio_pago,
	num_periodo numeric(18,0),
	descripcion varchar(100) NOT NULL,
	fecha_pago datetime NOT NULL DEFAULT GETDATE(),
	fecha_inicio datetime NOT NULL,
	fecha_fin datetime NOT NULL,
	importe numeric(18,2) NOT NULL,
    CONSTRAINT CHK_Pago_Alquiler_Date CHECK (fecha_fin > fecha_inicio)
)

CREATE TABLE LAS_CUATRO_CIFRAS.importe_alquiler(
	id_importe numeric(18,0)
		CONSTRAINT importe_alquiler_pk
			PRIMARY KEY,
	periodo_inicio numeric(18,0) NOT NULL,
	periodo_fin numeric(18,0) NOT NULL,
	precio numeric(18,2) NOT NULL,
    CONSTRAINT CHK_Importe_Alquiler_Date CHECK (periodo_fin > periodo_inicio)
)

CREATE TABLE LAS_CUATRO_CIFRAS.comprador(
	dni numeric(18,0)
	    CONSTRAINT dni_comprador_pk
		    PRIMARY KEY,
	nombre nvarchar(100) NOT NULL,
	apellido nvarchar(100) NOT NULL,
	fecha_registro datetime NOT NULL DEFAULT GETDATE(),
	telefono nvarchar(100) NOT NULL,
	mail nvarchar(100),
	fecha_nacimiento datetime NOT NULL
)

CREATE TABLE LAS_CUATRO_CIFRAS.venta(
	id_venta numeric(18,0)
        CONSTRAINT venta_pk
            PRIMARY KEY,
	id_anuncio numeric(18,0)
	    CONSTRAINT anuncio_venta_fk
		    REFERENCES LAS_CUATRO_CIFRAS.anuncio,
	id_comprador numeric(18,0)
        CONSTRAINT comprador_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.comprador,
    fecha_venta datetime
        NOT NULL DEFAULT GETDATE(),
	precio_venta numeric(18,0)
        NOT NULL DEFAULT 0,
	id_moneda numeric(18,0)
        CONSTRAINT moneda_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.moneda,
	pago numeric(18,0)
        NOT NULL DEFAULT 0,
	comision_inmob numeric(18,0) NOT NULL,
)
GO


----------------CREACIÓN DE INDICES-------------------

CREATE INDEX direc_provincia_index
ON LAS_CUATRO_CIFRAS.direccion(id_direccion,provincia);

CREATE INDEX direc_localidad_index
ON LAS_CUATRO_CIFRAS.direccion(id_direccion,localidad);

CREATE INDEX direc_barrio_index
ON LAS_CUATRO_CIFRAS.direccion(id_direccion,barrio);

CREATE INDEX inmueble_tipo_index
ON LAS_CUATRO_CIFRAS.inmueble(id_inmueble,tipo);

CREATE INDEX inmueble_propietario_index
ON LAS_CUATRO_CIFRAS.inmueble(id_inmueble,id_propietario);

CREATE INDEX inmueble_direccion_index
ON LAS_CUATRO_CIFRAS.inmueble(id_inmueble,id_direccion);

CREATE INDEX anuncio_agente_index
ON LAS_CUATRO_CIFRAS.anuncio(id_anuncio,agente);

CREATE INDEX anuncio_tipo_operacion_index
ON LAS_CUATRO_CIFRAS.anuncio(id_anuncio,tipo_operacion);

CREATE INDEX anuncio_inmueble_index
ON LAS_CUATRO_CIFRAS.anuncio(id_anuncio,inmueble);

CREATE INDEX anuncio_moneda_index
ON LAS_CUATRO_CIFRAS.anuncio(id_anuncio,moneda);



-----------CREACIÓN DE STORED PROCEDURES PARA LA MIGRACIÓN------------------
/*CREATE PROCEDURE procedure_name
 AS
  BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.table_name (column1, column2, column3, ...)
	SELECT DISTINCT column1, column2, column3, ...
	FROM gd_esquema.Maestra
	WHERE column1 IS NOT NULL
  END
GO*/




---------------MIGRACIÓN-----------------------------

/* BEGIN TRANSACTION
 BEGIN TRY
	EXECUTE procedure_name
	EXECUTE ...
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
	THROW 50001, 'Error al migrar las tablas, verifique que las nuevas tablas se encuentren vacías o bien ejecute un DROP de todas las nuevas tablas y vuelva a intentarlo.',1;
END CATCH*/
/*
   IF (EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.table_name)
   AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.table_name2)
   ...

   BEGIN
	PRINT 'Tablas migradas correctamente.';
	COMMIT TRANSACTION;
   END
	 ELSE
   BEGIN
    ROLLBACK TRANSACTION;
	THROW 50002, 'Hubo un error al migrar una o más tablas. Todos los cambios fueron deshechos, ninguna tabla fue cargada en la base :').',1;
   END

GO*/