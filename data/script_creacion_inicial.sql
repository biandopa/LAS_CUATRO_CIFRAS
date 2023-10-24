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
IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'tipo_operacion_migration')
DROP PROCEDURE tipo_operacion_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'provincia_migration')
DROP PROCEDURE provincia_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'localidad_migration')
DROP PROCEDURE localidad_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'barrio_migration')
DROP PROCEDURE barrio_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'direccion_migration')
DROP PROCEDURE direccion_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'tipo_inmueble_migration')
DROP PROCEDURE tipo_inmueble_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'disposicion_inmueble_migration')
DROP PROCEDURE disposicion_inmueble_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'estado_inmueble_migration')
DROP PROCEDURE estado_inmueble_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'orientacion_inmueble_migration')
DROP PROCEDURE orientacion_inmueble_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'caracteristica_migration')
DROP PROCEDURE caracteristica_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'propietario_migration')
DROP PROCEDURE propietario_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'inmueble_migration')
DROP PROCEDURE inmueble_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'inmueble_caracteristica_migration')
DROP PROCEDURE inmueble_caracteristica_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'sucursal_migration')
DROP PROCEDURE sucursal_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'agente_migration')
DROP PROCEDURE agente_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'moneda_migration')
DROP PROCEDURE moneda_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'anuncio_migration')
DROP PROCEDURE anuncio_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'inquilino_migration')
DROP PROCEDURE inquilino_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'importe_alquiler_migration')
DROP PROCEDURE importe_alquiler_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'alquiler_migration')
DROP PROCEDURE alquiler_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'medio_pago_migration')
DROP PROCEDURE medio_pago_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'pago_alquiler_migration')
DROP PROCEDURE pago_alquiler_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'comprador_migration')
DROP PROCEDURE comprador_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'pago_venta_migration')
DROP PROCEDURE pago_venta_migration
GO

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'venta_migration')
DROP PROCEDURE venta_migration
GO





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
        NOT NULL
        CONSTRAINT provincia_direccion_fk
            REFERENCES LAS_CUATRO_CIFRAS.provincia,
    localidad numeric(18,0)
        NOT NULL
        CONSTRAINT localidad_direccion_fk
            REFERENCES LAS_CUATRO_CIFRAS.localidad,
    barrio numeric(18,0)
        NOT NULL
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
    dni numeric(18, 0)
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
        NOT NULL
        CONSTRAINT tipo_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.tipo_inmueble,
    descripcion nvarchar(100) NOT NULL,
    id_propietario numeric(18,0)
        NOT NULL
        CONSTRAINT propietario_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.propietario,
    id_direccion numeric(18,0)
        NOT NULL
        CONSTRAINT direccion_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.direccion,
    ambientes nvarchar(100) NOT NULL,
    superficie_total numeric(18,2) NOT NULL,
    disposicion numeric(18,0)
        NOT NULL
        CONSTRAINT disposicion_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.disposicion_inmueble,
    orientacion numeric(18,0)
        NOT NULL
        CONSTRAINT orientacion_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.orientacion_inmueble,
    estado numeric(18,0)
        NOT NULL
        CONSTRAINT estado_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.estado_inmueble,
    antiguedad numeric(18,0),
    expensas numeric(18,2) NOT NULL,
)

CREATE TABLE LAS_CUATRO_CIFRAS.inmueble_caracteristica
(
    id_inmueble numeric(18,0)
        NOT NULL
        CONSTRAINT inmueble_caracteristica_fk
           REFERENCES LAS_CUATRO_CIFRAS.inmueble,
    id_caracteristica numeric(18,0)
        NOT NULL
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
        NOT NULL
        CONSTRAINT direccion_sucursal_fk
            REFERENCES LAS_CUATRO_CIFRAS.direccion,
    telefono numeric(18,0),
)

CREATE TABLE LAS_CUATRO_CIFRAS.agente
(
    dni numeric(18,0)
        CONSTRAINT dni_agente_pk
            PRIMARY KEY,
    nombre nvarchar(100) NOT NULL,
    apellido nvarchar(100) NOT NULL,
    fecha_registro datetime
        DEFAULT GETDATE(),
    telefono numeric(18,0) NOT NULL,
    mail nvarchar(100),
    fecha_nacimiento datetime NOT NULL,
    sucursal numeric(18,0)
        NOT NULL
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
        DEFAULT GETDATE(),
    agente numeric(18,0)
        NOT NULL
        CONSTRAINT agente_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.agente,
    tipo_operacion numeric(18,0)
        NOT NULL
        CONSTRAINT tipo_operacion_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.tipo_operacion,
    inmueble numeric(18,0)
        NOT NULL
        CONSTRAINT inmueble_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.inmueble,
    precio_inmueble numeric(18,2) NOT NULL,
    moneda numeric(18,0)
        NOT NULL
        CONSTRAINT moneda_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.moneda,
    tipo_periodo nvarchar(100) NOT NULL,
    estado numeric(18,0)
        NOT NULL
        CONSTRAINT estado_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.estado_inmueble,
    fecha_finalizacion datetime NOT NULL,
    costo_publicacion numeric(18,2) NOT NULL,
    CONSTRAINT CHK_Date CHECK (fecha_finalizacion > fecha_publicacion)
)


CREATE TABLE LAS_CUATRO_CIFRAS.inquilino(
	dni numeric(18,0)
		CONSTRAINT dni_inquilino_pk
		    PRIMARY KEY,
	nombre nvarchar(100) NOT NULL,
	apellido nvarchar(100) NOT NULL,
	fecha_registro datetime DEFAULT GETDATE(),
	telefono numeric(18,0) NOT NULL,
	mail nvarchar(100),
	fecha_nac datetime NOT NULL,
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

CREATE TABLE LAS_CUATRO_CIFRAS.alquiler(
	id_alquiler numeric(18,0)
		CONSTRAINT alquiler_pk
		    PRIMARY KEY,
	id_anuncio numeric(18,0)
	    NOT NULL
		CONSTRAINT anuncio_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.anuncio,
	id_inquilino numeric(18,0)
        NOT NULL
		CONSTRAINT inquilino_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.inquilino,
    fecha_fin datetime NOT NULL,
	fecha_inicio datetime
        DEFAULT GETDATE(),
	duracion numeric(18,0),
	importe numeric(18,0) NOT NULL
        CONSTRAINT importe_alquiler_fk
            REFERENCES LAS_CUATRO_CIFRAS.importe_alquiler,
	deposito numeric(18,2) NOT NULL,
	comision numeric(18,2) NOT NULL,
	gasto_averig numeric(18,2) NOT NULL,
    estado numeric(18,0)
        NOT NULL
        CONSTRAINT estado_alquiler_fk
            REFERENCES LAS_CUATRO_CIFRAS.estado_inmueble,
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
	            NOT NULL
		CONSTRAINT alquiler_pago_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.alquiler,
	medio_pago numeric(18,0)
	    NOT NULL
	    CONSTRAINT medio_pago_pago_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.medio_pago,
	num_periodo numeric(18,0) NOT NULL,
	descripcion varchar(100) NOT NULL,
	fecha_pago datetime DEFAULT GETDATE(),
	fecha_inicio datetime NOT NULL,
	fecha_fin datetime NOT NULL,
	importe numeric(18,2) NOT NULL,
    CONSTRAINT CHK_Pago_Alquiler_Fin_Date CHECK (fecha_fin > fecha_inicio),
    CONSTRAINT CHK_Pago_Alquiler_Date CHECK (fecha_pago > fecha_inicio)
)

CREATE TABLE LAS_CUATRO_CIFRAS.comprador(
	dni numeric(18,0)
	    CONSTRAINT dni_comprador_pk
		    PRIMARY KEY,
	nombre nvarchar(100) NOT NULL,
	apellido nvarchar(100) NOT NULL,
	fecha_registro datetime DEFAULT GETDATE(),
	telefono nvarchar(100) NOT NULL,
	mail nvarchar(100),
	fecha_nacimiento datetime NOT NULL
)

CREATE TABLE LAS_CUATRO_CIFRAS.pago_venta(
    id_pago numeric(18,0)
        CONSTRAINT pago_venta_pk
            PRIMARY KEY,
    importe numeric(18,2) NOT NULL,
    id_moneda numeric(18,0)
        NOT NULL
        CONSTRAINT moneda_pago_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.moneda,
    cotizacion numeric(18,2) NOT NULL,
    medio_pago numeric(18,0)
        NOT NULL
        CONSTRAINT medio_pago_pago_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.medio_pago
)

CREATE TABLE LAS_CUATRO_CIFRAS.venta(
	id_venta numeric(18,0)
        CONSTRAINT venta_pk
            PRIMARY KEY,
	id_anuncio numeric(18,0)
	    NOT NULL
	    CONSTRAINT anuncio_venta_fk
		    REFERENCES LAS_CUATRO_CIFRAS.anuncio,
	id_comprador numeric(18,0)
	    NOT NULL
        CONSTRAINT comprador_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.comprador,
    fecha_venta datetime DEFAULT GETDATE(),
	precio_venta numeric(18,0) NOT NULL,
	id_moneda numeric(18,0)
	    NOT NULL
        CONSTRAINT moneda_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.moneda,
	pago numeric(18,0) NOT NULL,
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



----------------CREACIÓN DE TRIGGERS----------------------
/*
CREATE TRIGGER insertar_direccion
ON LAS_CUATRO_CIFRAS.direccion
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO gd_esquema.Direccion (id_direccion, calle, numero, piso, departamento, provincia, localidad, barrio)
    SELECT id_direccion, calle, numero, piso, departamento, provincia, localidad, barrio
    FROM inserted
END*/


-----------CREACIÓN DE STORED PROCEDURES PARA LA MIGRACIÓN------------------
CREATE PROCEDURE tipo_operacion_migration
 AS
  BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.tipo_operacion(descripcion)
	SELECT DISTINCT ANUNCIO_TIPO_OPERACION
	FROM gd_esquema.Maestra
	WHERE ANUNCIO_TIPO_OPERACION IS NOT NULL
  END
GO

CREATE PROCEDURE provincia_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.provincia(descripcion)
    SELECT DISTINCT INMUEBLE_PROVINCIA
    FROM gd_esquema.Maestra
    WHERE INMUEBLE_PROVINCIA IS NOT NULL
    UNION
    SELECT DISTINCT SUCURSAL_PROVINCIA
    FROM gd_esquema.Maestra
    WHERE SUCURSAL_PROVINCIA IS NOT NULL
END
GO

CREATE PROCEDURE localidad_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.localidad(descripcion)
    SELECT DISTINCT INMUEBLE_LOCALIDAD
    FROM gd_esquema.Maestra
    WHERE INMUEBLE_LOCALIDAD IS NOT NULL
    UNION
    SELECT DISTINCT SUCURSAL_LOCALIDAD
    FROM gd_esquema.Maestra
    WHERE SUCURSAL_LOCALIDAD IS NOT NULL
END
GO

CREATE PROCEDURE barrio_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.barrio(descripcion)
    SELECT DISTINCT INMUEBLE_BARRIO
    FROM gd_esquema.Maestra
    WHERE INMUEBLE_BARRIO IS NOT NULL
END
GO

CREATE PROCEDURE direccion_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.direccion(calle,provincia,localidad,barrio)
    SELECT DISTINCT m.INMUEBLE_DIRECCION, p.id_provincia, l.id_localidad, b.id_barrio
    FROM gd_esquema.Maestra m
    INNER JOIN LAS_CUATRO_CIFRAS.provincia p ON m.INMUEBLE_PROVINCIA = p.descripcion or m.SUCURSAL_PROVINCIA = p.descripcion
    INNER JOIN LAS_CUATRO_CIFRAS.localidad l ON m.INMUEBLE_LOCALIDAD = l.descripcion or m.SUCURSAL_LOCALIDAD = l.descripcion
    INNER JOIN LAS_CUATRO_CIFRAS.barrio b ON m.INMUEBLE_BARRIO = b.descripcion
    WHERE m.INMUEBLE_DIRECCION IS NOT NULL
END
GO

CREATE PROCEDURE tipo_inmueble_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.tipo_inmueble(descripcion)
    SELECT DISTINCT INMUEBLE_TIPO_INMUEBLE
    FROM gd_esquema.Maestra
    WHERE INMUEBLE_TIPO_INMUEBLE IS NOT NULL
END
GO

CREATE PROCEDURE disposicion_inmueble_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.disposicion_inmueble(descripcion)
    SELECT DISTINCT INMUEBLE_DISPOSICION
    FROM gd_esquema.Maestra
    WHERE INMUEBLE_DISPOSICION IS NOT NULL
END
GO

CREATE PROCEDURE estado_inmueble_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.estado_inmueble(descripcion)
    SELECT DISTINCT INMUEBLE_ESTADO
    FROM gd_esquema.Maestra
    WHERE INMUEBLE_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE orientacion_inmueble_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.orientacion_inmueble(descripcion)
    SELECT DISTINCT INMUEBLE_ORIENTACION
    FROM gd_esquema.Maestra
    WHERE INMUEBLE_ORIENTACION IS NOT NULL
END
GO

CREATE PROCEDURE caracteristica_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.caracteristica(descripcion)
    VALUES ('Wifi'), ('Cable'), ('Calefaccion'), ('Gas')
END
GO

CREATE PROCEDURE propietario_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.propietario(dni,nombre,apellido,fecha_registro,telefono,mail,fecha_nacimiento)
    SELECT DISTINCT PROPIETARIO_DNI, PROPIETARIO_NOMBRE, PROPIETARIO_APELLIDO, PROPIETARIO_FECHA_REGISTRO, PROPIETARIO_TELEFONO, PROPIETARIO_MAIL, PROPIETARIO_FECHA_NAC
    FROM gd_esquema.Maestra
    WHERE PROPIETARIO_DNI IS NOT NULL
END
GO

CREATE PROCEDURE inmueble_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.inmueble(id_inmueble,tipo,descripcion,id_propietario,id_direccion,ambientes,superficie_total,disposicion,orientacion,estado,antiguedad,expensas)
    SELECT DISTINCT m.INMUEBLE_CODIGO, t.id_tipo, m.INMUEBLE_DESCRIPCION, p.dni, d.id_direccion, m.INMUEBLE_CANT_AMBIENTES, m.INMUEBLE_SUPERFICIETOTAL, di.id_disposicion, o.id_orientacion, e.id_estado, m.INMUEBLE_ANTIGUEDAD, m.INMUEBLE_EXPESAS
    FROM gd_esquema.Maestra m
    INNER JOIN LAS_CUATRO_CIFRAS.tipo_inmueble t ON m.INMUEBLE_TIPO_INMUEBLE = t.descripcion
    INNER JOIN LAS_CUATRO_CIFRAS.propietario p ON m.PROPIETARIO_DNI = p.dni
    INNER JOIN LAS_CUATRO_CIFRAS.direccion d ON m.INMUEBLE_DIRECCION = d.calle
    INNER JOIN LAS_CUATRO_CIFRAS.disposicion_inmueble di ON m.INMUEBLE_DISPOSICION = di.descripcion
    INNER JOIN LAS_CUATRO_CIFRAS.orientacion_inmueble o ON m.INMUEBLE_ORIENTACION = o.descripcion
    INNER JOIN LAS_CUATRO_CIFRAS.estado_inmueble e ON m.INMUEBLE_ESTADO = e.descripcion
    WHERE m.INMUEBLE_DESCRIPCION IS NOT NULL
END
GO

CREATE PROCEDURE inmueble_caracteristica_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.inmueble_caracteristica(id_inmueble,id_caracteristica)
    SELECT DISTINCT i.id_inmueble, c.id_caracteristica
    FROM gd_esquema.Maestra m
    INNER JOIN LAS_CUATRO_CIFRAS.inmueble i ON m.INMUEBLE_CODIGO = i.id_inmueble
    INNER JOIN LAS_CUATRO_CIFRAS.caracteristica c ON m.INMUEBLE_CARACTERISTICA_WIFI = '1' or
                                                     m.INMUEBLE_CARACTERISTICA_CABLE = '1' or
                                                     m.INMUEBLE_CARACTERISTICA_CALEFACCION = '1' or
                                                     m.INMUEBLE_CARACTERISTICA_GAS = '1'
END
GO

CREATE PROCEDURE sucursal_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.sucursal(id_sucursal,nombre,direccion,telefono)
    SELECT DISTINCT SUCURSAL_CODIGO, SUCURSAL_NOMBRE, SUCURSAL_DIRECCION, SUCURSAL_TELEFONO
    FROM gd_esquema.Maestra
    WHERE SUCURSAL_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE agente_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.agente(dni,nombre,apellido,fecha_nacimiento,fecha_registro,telefono,mail,sucursal)
    SELECT DISTINCT AGENTE_DNI, AGENTE_NOMBRE, AGENTE_APELLIDO, AGENTE_FECHA_NAC, AGENTE_FECHA_REGISTRO, AGENTE_TELEFONO, AGENTE_MAIL, SUCURSAL_CODIGO
    FROM gd_esquema.Maestra
    WHERE AGENTE_DNI IS NOT NULL
END
GO

CREATE PROCEDURE moneda_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.moneda(descripcion)
    SELECT DISTINCT ANUNCIO_MONEDA
    FROM gd_esquema.Maestra
    WHERE ANUNCIO_MONEDA IS NOT NULL
END
GO

CREATE PROCEDURE anuncio_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.anuncio(id_anuncio,fecha_publicacion,agente,tipo_operacion,inmueble,precio_inmueble,moneda,tipo_periodo,estado,fecha_finalizacion,costo_publicacion)
    SELECT DISTINCT ANUNCIO_CODIGO, ANUNCIO_FECHA_PUBLICACION, AGENTE_DNI, t.id_tipo_operacion, INMUEBLE_CODIGO, ANUNCIO_PRECIO_PUBLICADO, m.id_moneda, ANUNCIO_TIPO_PERIODO, e.id_estado, ANUNCIO_FECHA_FINALIZACION, ANUNCIO_COSTO_ANUNCIO
    FROM gd_esquema.Maestra
    INNER JOIN LAS_CUATRO_CIFRAS.tipo_operacion t ON MAESTRA.ANUNCIO_TIPO_OPERACION = t.descripcion
    INNER JOIN LAS_CUATRO_CIFRAS.moneda m ON MAESTRA.ANUNCIO_MONEDA = m.descripcion
    INNER JOIN LAS_CUATRO_CIFRAS.estado_inmueble e ON MAESTRA.ANUNCIO_ESTADO = e.descripcion
    WHERE ANUNCIO_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE inquilino_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.inquilino(dni,nombre,apellido,fecha_registro,telefono,mail,fecha_nac)
    SELECT DISTINCT INQUILINO_DNI, INQUILINO_NOMBRE, INQUILINO_APELLIDO, INQUILINO_FECHA_REGISTRO, INQUILINO_TELEFONO, INQUILINO_MAIL, INQUILINO_FECHA_NAC
    FROM gd_esquema.Maestra
    WHERE INQUILINO_DNI IS NOT NULL
END
GO

CREATE PROCEDURE importe_alquiler_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.importe_alquiler(periodo_inicio,periodo_fin,precio)
    SELECT DISTINCT DETALLE_ALQ_NRO_PERIODO_INI, DETALLE_ALQ_NRO_PERIODO_FIN, DETALLE_ALQ_PRECIO
    FROM gd_esquema.Maestra
    WHERE DETALLE_ALQ_PRECIO IS NOT NULL
    --MUCHAS DUDAS
END
GO


CREATE PROCEDURE alquiler_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.alquiler(id_alquiler,fecha_inicio,fecha_fin,id_inquilino,id_anuncio,duracion,importe,deposito,comision,gasto_averig)
    SELECT DISTINCT ALQUILER_CODIGO, ALQUILER_FECHA_INICIO, ALQUILER_FECHA_FIN, INQUILINO_DNI, ANUNCIO_CODIGO, ALQUILER_CANT_PERIODOS, i.id_importe, ALQUILER_DEPOSITO, ALQUILER_COMISION, ALQUILER_GASTOS_AVERIGUA
    FROM gd_esquema.Maestra
    INNER JOIN LAS_CUATRO_CIFRAS.importe_alquiler i ON DETALLE_ALQ_NRO_PERIODO_INI = i.periodo_inicio AND DETALLE_ALQ_NRO_PERIODO_FIN = i.periodo_fin AND DETALLE_ALQ_PRECIO = i.precio
    WHERE ALQUILER_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE medio_pago_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.medio_pago(descripcion)
    SELECT DISTINCT PAGO_ALQUILER_MEDIO_PAGO
    FROM gd_esquema.Maestra
    WHERE PAGO_ALQUILER_MEDIO_PAGO IS NOT NULL
    UNION
    SELECT DISTINCT PAGO_VENTA_MEDIO_PAGO
    FROM gd_esquema.Maestra
    WHERE PAGO_VENTA_MEDIO_PAGO IS NOT NULL
END
GO

CREATE PROCEDURE pago_alquiler_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.pago_alquiler(id_pago_alquiler,fecha_pago,importe,id_alquiler,medio_pago,num_periodo,descripcion,fecha_inicio,fecha_fin)
    SELECT DISTINCT PAGO_ALQUILER_CODIGO, PAGO_ALQUILER_FECHA, PAGO_ALQUILER_IMPORTE, ALQUILER_CODIGO, m.id_medio_pago, PAGO_ALQUILER_NRO_PERIODO, PAGO_ALQUILER_DESC, DETALLE_ALQ_NRO_PERIODO_INI, DETALLE_ALQ_NRO_PERIODO_FIN
    FROM gd_esquema.Maestra
    INNER JOIN LAS_CUATRO_CIFRAS.medio_pago m ON PAGO_ALQUILER_MEDIO_PAGO = m.descripcion
    WHERE PAGO_ALQUILER_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE comprador_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.comprador(dni,nombre,apellido,fecha_registro,telefono,mail,fecha_nacimiento)
    SELECT DISTINCT COMPRADOR_DNI, COMPRADOR_NOMBRE, COMPRADOR_APELLIDO, COMPRADOR_FECHA_REGISTRO, COMPRADOR_TELEFONO, COMPRADOR_MAIL, COMPRADOR_FECHA_NAC
    FROM gd_esquema.Maestra
    WHERE COMPRADOR_DNI IS NOT NULL
END
GO

CREATE PROCEDURE pago_venta_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.pago_venta(importe,id_moneda,cotizacion,medio_pago)
    SELECT DISTINCT PAGO_VENTA_IMPORTE, d.id_moneda, PAGO_VENTA_COTIZACION, m.id_medio_pago
    FROM gd_esquema.Maestra
    INNER JOIN LAS_CUATRO_CIFRAS.medio_pago m ON PAGO_VENTA_MEDIO_PAGO = m.descripcion
    INNER JOIN LAS_CUATRO_CIFRAS.moneda d ON PAGO_VENTA_MONEDA = d.descripcion
    WHERE Maestra.PAGO_VENTA_IMPORTE IS NOT NULL
END
GO

CREATE PROCEDURE venta_migration
AS
BEGIN
    INSERT INTO LAS_CUATRO_CIFRAS.venta(id_venta,id_anuncio,id_comprador,fecha_venta,precio_venta,id_moneda,pago,comision_inmob)
    SELECT DISTINCT VENTA_CODIGO, ANUNCIO_CODIGO, COMPRADOR_DNI, VENTA_FECHA, VENTA_MONEDA, d.id_moneda, p.id_pago, VENTA_COMISION
    FROM gd_esquema.Maestra
    INNER JOIN LAS_CUATRO_CIFRAS.pago_venta p ON PAGO_VENTA_IMPORTE = p.importe AND PAGO_VENTA_COTIZACION = p.cotizacion AND PAGO_VENTA_MEDIO_PAGO = p.medio_pago
    INNER JOIN LAS_CUATRO_CIFRAS.moneda d ON VENTA_MONEDA = d.descripcion
    WHERE VENTA_CODIGO IS NOT NULL
END
GO




---------------MIGRACIÓN-----------------------------

BEGIN TRANSACTION
BEGIN TRY
    EXECUTE tipo_operacion_migration
    EXECUTE provincia_migration
    EXECUTE localidad_migration
    EXECUTE barrio_migration
    EXECUTE direccion_migration
    EXECUTE tipo_inmueble_migration
    EXECUTE disposicion_inmueble_migration
    EXECUTE estado_inmueble_migration
    EXECUTE orientacion_inmueble_migration
    EXECUTE caracteristica_migration
    EXECUTE propietario_migration
    EXECUTE inmueble_migration
    EXECUTE inmueble_caracteristica_migration
    EXECUTE sucursal_migration
    EXECUTE agente_migration
    EXECUTE moneda_migration
    EXECUTE anuncio_migration
    EXECUTE inquilino_migration
    EXECUTE importe_alquiler_migration
    EXECUTE alquiler_migration
    EXECUTE medio_pago_migration
    EXECUTE pago_alquiler_migration
    EXECUTE comprador_migration
    EXECUTE pago_venta_migration
    EXECUTE venta_migration
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
	THROW 50001, N'Error al migrar las tablas, verifique que éstas tablas se encuentren vacías o bien ejecute un DROP de todas las nuevas tablas y vuelva a intentarlo.',1;
END CATCH

   IF (EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.tipo_operacion)
   AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.provincia)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.localidad)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.barrio)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.direccion)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.tipo_inmueble)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.disposicion_inmueble)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.estado_inmueble)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.orientacion_inmueble)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.caracteristica)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.propietario)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.inmueble)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.inmueble_caracteristica)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.sucursal)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.agente)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.moneda)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.anuncio)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.inquilino)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.importe_alquiler)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.alquiler)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.medio_pago)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.pago_alquiler)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.comprador)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.pago_venta)
    AND EXISTS (SELECT 1 FROM LAS_CUATRO_CIFRAS.venta))

   BEGIN
	PRINT N'Tablas migradas correctamente.';
	COMMIT TRANSACTION;
   END
	 ELSE
   BEGIN
    ROLLBACK TRANSACTION;
	THROW 50002, N'Error al migrar una o más tablas. Todos los cambios fueron revertidos y ninguna tabla del schema LAS_CUATRO_CIFRAS fue cargada en la base.',1;
   END

GO