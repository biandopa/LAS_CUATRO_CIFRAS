USE [GD2C2023]
GO

--------------------DROPS PREVENTIVOS ---------------------------
/* PARA NO TENER ERRORES DE DEPENDECIAS NI DATOS DUPLICADOS */


---------------DROP PREVENTIVO DE FOREIGN KEYS---------------------

IF EXISTS(SELECT [name] FROM sys.foreign_keys WHERE [name] = 'bi_provincia_localidad_fk')
    ALTER TABLE LAS_CUATRO_CIFRAS.BI_dim_localidad DROP CONSTRAINT bi_provincia_localidad_fk

GO

-------------------DROPS DE TABLAS DIMENSIONALES------------------------

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_ubicacion')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_ubicacion

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_rango_etario')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_rango_etario

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_tipo_inmueble')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_ambiente_inmueble')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_ambiente_inmueble

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_rango_m2_inmueble')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_tipo_operacion')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_tipo_moneda')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_provincia')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_provincia

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_localidad')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_localidad

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_barrio')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_barrio

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_sucursal')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_sucursal

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_tipo_moneda')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_estado_anuncio')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_estado_anuncio

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_estado_alquiler')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_estado_alquiler

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_tiempo')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_tiempo


-------------------DROPS DE TABLAS HECHOS------------------------
IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_fact_alquiler')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_fact_alquiler

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_fact_venta')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_fact_venta

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_fact_anuncio')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_fact_anuncio



-------------------DROPS DE FUNCIONES AUXILIARES----------------------------

IF EXISTS(SELECT [name] FROM sys.objects WHERE [name] = 'GetAge')
    DROP FUNCTION LAS_CUATRO_CIFRAS.GetAge

IF EXISTS(SELECT [name] FROM sys.objects WHERE [name] = 'GetAgeRange')
    DROP FUNCTION LAS_CUATRO_CIFRAS.GetAgeRange

IF EXISTS(SELECT [name] FROM sys.objects WHERE [name] = 'GetSupRange')
    DROP FUNCTION LAS_CUATRO_CIFRAS.GetSupRange

IF EXISTS(SELECT [name] FROM sys.objects WHERE [name] = 'GetCuatrimestre')
    DROP FUNCTION LAS_CUATRO_CIFRAS.GetCuatrimestre

GO


---------------DROP PREVENTIVOS DE STORED PROCEDURES------------------------
IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimTiempo')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimTiempo

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimRangoEtario')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimRangoEtario

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimTipoOperacion')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimTipoOperacion

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimProvincia')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimProvincia

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimLocalidad')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimLocalidad

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimBarrio')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimBarrio

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimUbicacion')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimUbicacion

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimTipoInmueble')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimTipoInmueble

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimAmbientesInmueble')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimAmbientesInmueble

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimRangoM2Inmueble')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimRangoM2Inmueble

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimSucursal')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimSucursal

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimEstadoAnuncio')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimEstadoAnuncio

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimEstadoAlquiler')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimEstadoAlquiler

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateDimTipoMoneda')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimTipoMoneda

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateFactAnuncio')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateFactAnuncio

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateFactAlquiler')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateFactAlquiler

IF EXISTS(SELECT [name] FROM sys.procedures WHERE [name] = 'MigrateFactVenta')
DROP PROCEDURE LAS_CUATRO_CIFRAS.MigrateFactVenta

GO


---------------DROP PREVENTIVO DE VISTAS------------------------
IF EXISTS(SELECT [name] FROM sys.views WHERE [name] = 'BI_V_PromAnuncioPublicado')
DROP VIEW LAS_CUATRO_CIFRAS.BI_V_PromAnuncioPublicado

IF EXISTS(SELECT [name] FROM sys.views WHERE [name] = 'BI_V_PromPrecioAnuncio')
DROP VIEW LAS_CUATRO_CIFRAS.BI_V_PromPrecioAnuncio

IF EXISTS(SELECT [name] FROM sys.views WHERE [name] = 'BI_V_Top5BarriosAlquiler')
DROP VIEW LAS_CUATRO_CIFRAS.BI_V_Top5BarriosAlquiler

IF EXISTS(SELECT [name] FROM sys.views WHERE [name] = 'BI_V_PorcentajeIncumplimientoPagos')
DROP VIEW LAS_CUATRO_CIFRAS.BI_V_PorcentajeIncumplimientoPagos

IF EXISTS(SELECT [name] FROM sys.views WHERE [name] = 'BI_V_PromIncrementoAlquiler')
DROP VIEW LAS_CUATRO_CIFRAS.BI_V_PromIncrementoAlquiler

IF EXISTS(SELECT [name] FROM sys.views WHERE [name] = 'BI_V_PromPrecioM2Venta')
DROP VIEW LAS_CUATRO_CIFRAS.BI_V_PromPrecioM2Venta

IF EXISTS(SELECT [name] FROM sys.views WHERE [name] = 'BI_V_PromComision')
DROP VIEW LAS_CUATRO_CIFRAS.BI_V_PromComision

IF EXISTS(SELECT [name] FROM sys.views WHERE [name] = 'BI_V_PorcentOperacionesConcretadas')
DROP VIEW LAS_CUATRO_CIFRAS.BI_V_PorcentOperacionesConcretadas

IF EXISTS(SELECT [name] FROM sys.views WHERE [name] = 'BI_V_MontoTotalCierreContratos')
DROP VIEW LAS_CUATRO_CIFRAS.BI_V_MontoTotalCierreContratos

GO




---------------CREACIÓN DE COMPONENTES--------------------

-------------------CREACIÓN DE TABLAS DIMENSIONALES------------------------

-- Creación de la tabla tiempo
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_tiempo(
    id_tiempo numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT id_tiempo_bi_pk PRIMARY KEY,
    año NUMERIC(4,0) NOT NULL,
    cuatrimestre numeric(1,0) NOT NULL
        CHECK (cuatrimestre BETWEEN 1 AND 4),
    mes numeric(2,0) NOT NULL
        CHECK (mes BETWEEN 1 AND 12)
)

-- Creación de la tabla rango etario
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_rango_etario(
    id_rango_etario numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_id_rango_etario_pk PRIMARY KEY,
    rango nvarchar(10) NOT NULL UNIQUE
)

-- Creación de la tabla tipo operación
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion(
    id_tipo_operacion numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_id_tipo_operacion_pk PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL UNIQUE
)

-- Creación de la tabla provincia
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_provincia
(
    id_provincia numeric(18,0) IDENTITY(1,1)
        CONSTRAINT bi_provincia_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL UNIQUE
)

-- Creación de la tabla localidad
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_localidad
(
    id_localidad numeric(18,0) IDENTITY(1,1)
        CONSTRAINT bi_localidad_pk
            PRIMARY KEY,
    id_provincia numeric(18,0) NOT NULL
        CONSTRAINT bi_provincia_localidad_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_provincia,
    descripcion nvarchar(100) NOT NULL
)

-- Creación de la tabla barrio
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_barrio
(
    id_barrio numeric(18,0) IDENTITY(1,1)
        CONSTRAINT bi_barrio_pk
            PRIMARY KEY,
    id_localidad numeric(18,0) NOT NULL
        CONSTRAINT bi_localidad_barrio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_localidad,
    descripcion nvarchar(100) NOT NULL
)

-- Creación de la tabla ubicación
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_ubicacion(
    id_ubicacion numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_id_ubicacion_pk PRIMARY KEY,
    provincia numeric(18,0) NOT NULL
        CONSTRAINT bi_provincia_ubicacion_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_provincia,
    localidad numeric(18,0) NOT NULL
        CONSTRAINT bi_localidad_ubicacion_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_localidad,
    barrio numeric(18,0)
        CONSTRAINT bi_barrio_ubicacion_fk
            REFERENCES LAS_CUATRO_CIFRAS.Bi_dim_barrio,
    calle nvarchar(100) NOT NULL,
)

-- Creación de la tabla tipo inmueble
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble(
    id_tipo_inmueble numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_id_tipo_inmueble_pk PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL UNIQUE
)

-- Creación de la tabla ambiente
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_ambiente_inmueble(
    id_ambiente numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_id_ambiente_pk PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL UNIQUE
)

-- Creación de la tabla rango m2
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble(
    id_rango_m2 numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_id_rango_m2_pk PRIMARY KEY,
    rango nvarchar(10) NOT NULL UNIQUE
)

-- Creación de la tabla sucursal
CREATE TABLE  LAS_CUATRO_CIFRAS.BI_dim_sucursal(
    id_sucursal numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_id_sucursal_pk PRIMARY KEY,
    nombre nvarchar(100) NOT NULL,
    direccion numeric(18,0) NOT NULL
        CONSTRAINT bi_direccion_sucursal_fk
            FOREIGN KEY REFERENCES LAS_CUATRO_CIFRAS.BI_dim_ubicacion,
    telefono nvarchar(100) NOT NULL
)

-- Creación de la tabla tipo de moneda
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda(
    id_tipo_moneda numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_id_tipo_moneda_pk PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL
)

-- Creación de la tabla estado del anuncio
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_estado_anuncio(
	id_estado numeric(18,0) IDENTITY(1,1)
        CONSTRAINT bi_estado_anuncio_pk
            PRIMARY KEY,
	descripcion nvarchar(100) NOT NULL UNIQUE
)

-- Creación de la tabla estado del alquiler
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_estado_alquiler(
    id_estado numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_estado_alquiler_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL UNIQUE
)

GO


-------------------CREACIÓN DE TABLAS HECHOS------------------------

-- Creación de la tabla anuncio
CREATE TABLE LAS_CUATRO_CIFRAS.BI_fact_anuncio
(
    id_tipo_inmueble numeric(18,0) NOT NULL
        CONSTRAINT bi_tipo_inmueble_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble,
    id_moneda numeric(18,0) NOT NULL
        CONSTRAINT bi_moneda_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda,
    id_sucursal numeric(18,0) NOT NULL
        CONSTRAINT bi_sucursal_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_sucursal,
    id_barrio numeric(18,0) NOT NULL
        CONSTRAINT bi_barrio_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_barrio,
    id_ambientes numeric(18,0) NOT NULL
        CONSTRAINT bi_ambiente_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_ambiente_inmueble,
    id_rango_m2 numeric(18,0) NOT NULL
        CONSTRAINT bi_rango_m2_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble,
    id_tipo_operacion numeric(18,0) NOT NULL
        CONSTRAINT bi_tipo_operacion_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion,
    año numeric(4,0) NOT NULL,
    cuatrimestre numeric(1,0) NOT NULL,
    id_rango_etario numeric(18,0) NOT NULL
        CONSTRAINT bi_rango_etario_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_rango_etario,
    id_estado_anuncio numeric(18,0) NOT NULL
        CONSTRAINT bi_estado_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_estado_anuncio,
    duracion_publicado decimal(10,2) NOT NULL,
)

-- Creación de la tabla alquiler
CREATE TABLE LAS_CUATRO_CIFRAS.BI_fact_alquiler(
    id_barrio numeric(18,0) NOT NULL
        CONSTRAINT bi_barrio_alquiler_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_barrio,
    id_rango_etario numeric(18,0) NOT NULL
        CONSTRAINT bi_rango_etario_alquiler_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_rango_etario,
	duracion numeric(18,0),
	comision_total numeric(18,2) NOT NULL,
    cuatrimestre numeric(1,0) NOT NULL,
    año numeric(4,0) NOT NULL,
    id_estado numeric(18,0) NOT NULL
        CONSTRAINT bi_estado_alquiler_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_estado_alquiler
)


-- Creación de la tabla venta de inmuebles
CREATE TABLE LAS_CUATRO_CIFRAS.BI_fact_venta(
    id_localidad numeric(18,0) NOT NULL
        CONSTRAINT bi_localidad_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_localidad,
    id_tipo_inmueble numeric(18,0) NOT NULL
        CONSTRAINT bi_tipo_inmueble_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble,
	id_moneda numeric(18,0)
	    NOT NULL
        CONSTRAINT bi_moneda_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda,
	año numeric(4,0) NOT NULL,
    cuatrimestre numeric(1,0) NOT NULL,
    id_rango_m2 numeric(18,0) NOT NULL
        CONSTRAINT bi_rango_m2_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble,
	comision_total numeric(18,0) NOT NULL
)

GO



-------------------CREACIÓN DE ÍNDICES------------------------

CREATE INDEX BI_dim_ubicacion_index
ON LAS_CUATRO_CIFRAS.BI_dim_ubicacion(provincia, localidad, barrio);

GO



--------------CREACIÓN DE FUNCIONES AUXILIARES------------------

/* La función recibe una fecha de nacimiento por parámetro y devuelve la edad actual de la persona*/
CREATE FUNCTION LAS_CUATRO_CIFRAS.GetAge(@birthdate DATETIME)
RETURNS INT
AS
BEGIN
	DECLARE @age INT;

    IF (MONTH(@birthdate)!=MONTH(GETDATE()))
        SET @age = DATEDIFF(MONTH, @birthdate, GETDATE())/12;
    ELSE IF(DAY(@birthdate) > DAY(GETDATE()))
        SET @age = (DATEDIFF(MONTH, @birthdate, GETDATE())/12)-1;
    ELSE
    BEGIN
        SET @age = DATEDIFF(MONTH, @birthdate, GETDATE())/12;
    END
        RETURN @age;
END
GO

/* La función recibe una fecha de nacimiento por parámetro y devuelve el rango etario de la persona*/
CREATE FUNCTION LAS_CUATRO_CIFRAS.GetAgeRange(@age INT)
RETURNS NVARCHAR(10)
AS
BEGIN
	DECLARE @ageRange varchar(10);

    IF (@age < 25)
    BEGIN
        SET @ageRange = '[< 25]';
    END
    ELSE IF @age BETWEEN 25 AND 35
    BEGIN
        SET @ageRange = '[25-35]';
    END
    ELSE IF @age BETWEEN 35 AND 50
    BEGIN
        SET @ageRange = '[35-50]';
    END
    ELSE
    BEGIN
        SET @ageRange = '[> 50]';
    END

	RETURN @ageRange;
END
GO

/* La función recibe la superficie total del inmueble y devuelve el rango en m2*/
CREATE FUNCTION LAS_CUATRO_CIFRAS.GetSupRange(@sup INT)
RETURNS NVARCHAR(10)
AS
BEGIN
	DECLARE @range varchar(10);

    IF (@sup < 25)
    BEGIN
        SET @range = '[< 35]';
    END
    ELSE IF @sup BETWEEN 35 AND 55
    BEGIN
        SET @range = '[35-55]';
    END
    ELSE IF @sup BETWEEN 55 AND 75
    BEGIN
        SET @range = '[55-75]';
    END
    ELSE IF @sup BETWEEN 75 AND 100
    BEGIN
        SET @range = '[75-100]';
    END
    ELSE
    BEGIN
        SET @range = '[> 100]';
    END

	RETURN @range;
END
GO

/* La función recibe el mes y devuelve el cuatrimestre*/
CREATE FUNCTION LAS_CUATRO_CIFRAS.GetCuatrimestre(@month NUMERIC(2,0))
RETURNS NUMERIC(1,0)
AS
BEGIN
    DECLARE @cuatrimestre NUMERIC(1,0);

    IF (@month BETWEEN 1 AND 3)
    BEGIN
        SET @cuatrimestre = 1;
    END
    ELSE IF (@month BETWEEN 4 AND 6)
    BEGIN
        SET @cuatrimestre = 2;
    END
    ELSE IF (@month BETWEEN 7 AND 9)
    BEGIN
        SET @cuatrimestre = 3;
    END
    ELSE
    BEGIN
        SET @cuatrimestre = 4;
    END

    RETURN @cuatrimestre;
END
GO



-----------------CREACIÓN DE STORED PROCEDURES PARA LA MIGRACIÓN----------------------

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimTiempo
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_tiempo(año, cuatrimestre, mes)
        SELECT DISTINCT YEAR(fecha_registro), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_registro)),
                        MONTH(fecha_registro)
        FROM LAS_CUATRO_CIFRAS.propietario
        UNION
        SELECT DISTINCT YEAR(fecha_nacimiento), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_nacimiento)),
                        MONTH(fecha_nacimiento)
        FROM LAS_CUATRO_CIFRAS.propietario
        UNION
        SELECT DISTINCT YEAR(fecha_pago), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_pago)),
                        MONTH(fecha_pago)
        FROM LAS_CUATRO_CIFRAS.pago_alquiler
        UNION
        SELECT DISTINCT YEAR(fecha_inicio), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_inicio)),
                        MONTH(fecha_inicio)
        FROM LAS_CUATRO_CIFRAS.pago_alquiler
        UNION
        SELECT DISTINCT YEAR(fecha_fin), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_fin)),
                        MONTH(fecha_fin)
        FROM LAS_CUATRO_CIFRAS.pago_alquiler
        UNION
        SELECT DISTINCT YEAR(fecha_fin), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_fin)),
                        MONTH(fecha_fin)
        FROM LAS_CUATRO_CIFRAS.alquiler
        UNION
        SELECT DISTINCT YEAR(fecha_inicio), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_inicio)),
                        MONTH(fecha_inicio)
        FROM LAS_CUATRO_CIFRAS.alquiler
        UNION
        SELECT DISTINCT YEAR(fecha_venta), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_venta)),
                        MONTH(fecha_venta)
        FROM LAS_CUATRO_CIFRAS.venta
        UNION
        SELECT DISTINCT YEAR(fecha_registro), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_registro)),
                        MONTH(fecha_registro)
        FROM LAS_CUATRO_CIFRAS.comprador
        UNION
        SELECT DISTINCT YEAR(fecha_nacimiento), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_nacimiento)),
                        MONTH(fecha_nacimiento)
        FROM LAS_CUATRO_CIFRAS.comprador
        UNION
        SELECT DISTINCT YEAR(fecha_registro), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_registro)),
                        MONTH(fecha_registro)
        FROM LAS_CUATRO_CIFRAS.inquilino
        UNION
        SELECT DISTINCT YEAR(fecha_registro), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_registro)),
                        MONTH(fecha_registro)
        FROM LAS_CUATRO_CIFRAS.agente
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimRangoEtario
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_rango_etario(rango)
        SELECT DISTINCT LAS_CUATRO_CIFRAS.GetAgeRange(LAS_CUATRO_CIFRAS.GetAge(fecha_nac))
        FROM LAS_CUATRO_CIFRAS.inquilino
        UNION
        SELECT DISTINCT LAS_CUATRO_CIFRAS.GetAgeRange(LAS_CUATRO_CIFRAS.GetAge(fecha_nacimiento))
        FROM LAS_CUATRO_CIFRAS.agente
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimTipoOperacion
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion(descripcion)
        SELECT DISTINCT descripcion
        FROM LAS_CUATRO_CIFRAS.tipo_operacion
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimProvincia
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_provincia(descripcion)
        SELECT descripcion
        FROM LAS_CUATRO_CIFRAS.provincia
    END
GO


CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimLocalidad
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_localidad(descripcion, id_provincia)
        SELECT DISTINCT l.descripcion, p2.id_provincia
        FROM LAS_CUATRO_CIFRAS.localidad l
        INNER JOIN LAS_CUATRO_CIFRAS.provincia p on p.id_provincia = l.id_provincia
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p2 on p2.descripcion = p.descripcion
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimBarrio
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_barrio(descripcion, id_localidad)
        SELECT DISTINCT b.descripcion, l2.id_localidad
        FROM LAS_CUATRO_CIFRAS.barrio b
        INNER JOIN LAS_CUATRO_CIFRAS.localidad l on l.id_localidad = b.id_localidad
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l2 on l2.descripcion = l.descripcion
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimUbicacion
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_ubicacion(provincia, localidad, barrio, calle)
        SELECT DISTINCT
            l.id_provincia,
            b2.id_localidad,
            b2.id_barrio,
            d.calle
        FROM LAS_CUATRO_CIFRAS.direccion_inmueble d
        INNER JOIN LAS_CUATRO_CIFRAS.barrio b on d.barrio = b.id_barrio
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_barrio b2 on b.descripcion = b2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l on l.id_localidad = b.id_localidad

        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_ubicacion(provincia, localidad, barrio, calle)
        SELECT
            l2.id_provincia,
            l2.id_localidad,
            NULL,
            d.calle
        FROM LAS_CUATRO_CIFRAS.direccion_sucursal d
        INNER JOIN LAS_CUATRO_CIFRAS.localidad l on l.id_localidad = d.id_localidad
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l2 on l.descripcion = l2.descripcion
    END
GO
//*******
 */
DELETE FROM LAS_CUATRO_CIFRAS.BI_dim_ubicacion

;WITH CTE AS
(
SELECT TOP 20000 *
FROM LAS_CUATRO_CIFRAS.BI_dim_ubicacion
ORDER BY id_ubicacion
)
DELETE FROM CTE

SELECT DISTINCT
            l.id_provincia,
            p.descripcion,
            b2.id_localidad,
            l.descripcion,
            b2.id_barrio,
            b2.descripcion,
            d.calle
        FROM LAS_CUATRO_CIFRAS.direccion_inmueble d
        INNER JOIN LAS_CUATRO_CIFRAS.barrio b on d.barrio = b.id_barrio
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_barrio b2 on b.descripcion = b2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l on l.id_localidad = b.id_localidad
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p on p.id_provincia = l.id_provincia

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimTipoInmueble
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble(descripcion)
        SELECT DISTINCT descripcion
        FROM LAS_CUATRO_CIFRAS.tipo_inmueble
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimAmbientesInmueble
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_ambiente_inmueble(descripcion)
        SELECT DISTINCT ambientes
        FROM LAS_CUATRO_CIFRAS.inmueble
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimRangoM2Inmueble
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble(rango)
        SELECT DISTINCT LAS_CUATRO_CIFRAS.GetSupRange(superficie_total)
        FROM LAS_CUATRO_CIFRAS.inmueble
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimSucursal
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_sucursal(nombre, direccion, telefono)
        SELECT DISTINCT s.nombre,
                        (SELECT u.id_ubicacion FROM LAS_CUATRO_CIFRAS.BI_dim_ubicacion u
                                   INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l ON u.localidad = l.id_localidad
                                   INNER JOIN LAS_CUATRO_CIFRAS.localidad l2 on l.descripcion = l2.descripcion AND l2.id_localidad = d.id_localidad
                                   INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p ON u.provincia = p.id_provincia
                                   INNER JOIN LAS_CUATRO_CIFRAS.provincia p2 on p.descripcion = p2.descripcion AND p2.id_provincia = l.id_provincia
                                   WHERE u.calle = d.calle),
                        s.telefono
        FROM LAS_CUATRO_CIFRAS.sucursal s
        INNER JOIN LAS_CUATRO_CIFRAS.direccion_sucursal d ON s.direccion = d.id_direccion
        INNER JOIN LAS_CUATRO_CIFRAS.localidad l ON d.id_localidad = l.id_localidad
        INNER JOIN LAS_CUATRO_CIFRAS.provincia p ON l.id_provincia = p.id_provincia
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimTipoMoneda
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda(descripcion)
        SELECT DISTINCT descripcion
        FROM LAS_CUATRO_CIFRAS.moneda
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimEstadoAnuncio
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_estado_anuncio(descripcion)
        SELECT DISTINCT descripcion
        FROM LAS_CUATRO_CIFRAS.estado_anuncio
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimEstadoAlquiler
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_estado_alquiler(descripcion)
        SELECT DISTINCT descripcion
        FROM LAS_CUATRO_CIFRAS.estado_alquiler
    END
GO



CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateFactAnuncio
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_fact_anuncio(id_tipo_inmueble, id_moneda, id_sucursal, id_barrio,
                                                      id_ambientes, id_rango_m2, id_tipo_operacion, año,
                                                      cuatrimestre, id_rango_etario, id_estado_anuncio, duracion_publicado)
        SELECT
            ti2.id_tipo_inmueble,
            m2.id_tipo_moneda,
            s.id_sucursal,
            b2.id_barrio,
            ai.id_ambiente,
            r.id_rango_m2,
            tope.id_tipo_operacion,
            t.año,
            t.cuatrimestre,
            re.id_rango_etario,
            ea2.id_estado,
            SUM(DATEDIFF(DAY, a.fecha_publicacion, a.fecha_finalizacion)) AS duracion_publicado
        FROM LAS_CUATRO_CIFRAS.anuncio a
        INNER JOIN LAS_CUATRO_CIFRAS.inmueble i ON a.inmueble = i.id_inmueble
        INNER JOIN LAS_CUATRO_CIFRAS.tipo_inmueble ti ON i.tipo = ti.id_tipo
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble ti2 ON ti.descripcion = ti2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.moneda m ON a.moneda = m.id_moneda
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda m2 ON m.descripcion = m2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.agente ag ON ag.id = a.agente
        INNER JOIN LAS_CUATRO_CIFRAS.sucursal s ON ag.sucursal = s.id_sucursal
        INNER JOIN LAS_CUATRO_CIFRAS.direccion_inmueble d ON i.id_direccion = d.id_direccion
        INNER JOIN LAS_CUATRO_CIFRAS.barrio b ON d.barrio = b.id_barrio
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_barrio b2 ON b.descripcion = b2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l ON l.id_localidad = b2.id_localidad
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p ON p.id_provincia = l.id_provincia
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_ubicacion u ON u.calle = d.calle
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_ambiente_inmueble ai ON ai.descripcion = i.ambientes
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble r ON r.rango = LAS_CUATRO_CIFRAS.GetSupRange(i.superficie_total)
        INNER JOIN LAS_CUATRO_CIFRAS.tipo_operacion tope ON a.tipo_operacion = tope.id_tipo_operacion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion tope2 ON tope.descripcion = tope2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_rango_etario re ON re.rango = LAS_CUATRO_CIFRAS.GetAgeRange(GetAge (ag.fecha_nacimiento))
        INNER JOIN LAS_CUATRO_CIFRAS.estado_anuncio ea ON a.estado = ea.id_estado
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_estado_anuncio ea2 ON ea.descripcion = ea2.descripcion
            -- a revisar
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON t.año = YEAR(a.fecha_publicacion) AND t.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(a.fecha_publicacion)
        GROUP BY ti2.id_tipo_inmueble,
                 m2.id_tipo_moneda,
                 s.id_sucursal,
                 b2.id_barrio,
                 ai.id_ambiente,
                 r.id_rango_m2,
                 tope.id_tipo_operacion,
                 t.año,
                 t.cuatrimestre,
                 re.id_rango_etario,
                 ea2.id_estado
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateFactAlquiler
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_fact_alquiler(id_barrio, id_rango_etario, duracion,
                                                       comision_total, cuatrimestre, año, id_estado)
        SELECT
            b2.id_barrio,
            re.id_rango_etario,
            a.duracion,
            SUM(a.comision) AS comision_total,
            t.cuatrimestre,
            t.año,
            ea2.id_estado
        FROM LAS_CUATRO_CIFRAS.alquiler a
        INNER JOIN LAS_CUATRO_CIFRAS.anuncio an ON a.id_anuncio = an.id_anuncio
        INNER JOIN LAS_CUATRO_CIFRAS.inmueble i ON an.inmueble = i.id_inmueble
        INNER JOIN LAS_CUATRO_CIFRAS.direccion_inmueble d ON i.id_direccion = d.id_direccion
        INNER JOIN LAS_CUATRO_CIFRAS.barrio b ON d.barrio = b.id_barrio
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_barrio b2 ON b.descripcion = b2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l ON l.id_localidad = b2.id_localidad
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p ON p.id_provincia = l.id_provincia
        INNER JOIN LAS_CUATRO_CIFRAS.inquilino inq ON inq.id = a.id_inquilino
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_rango_etario re ON re.rango = LAS_CUATRO_CIFRAS.GetAgeRange(GetAge (inq.fecha_nac))
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON t.año = YEAR(a.fecha_inicio) AND t.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(a.fecha_inicio)
        INNER JOIN LAS_CUATRO_CIFRAS.estado_alquiler ea ON a.estado = ea.id_estado
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_estado_alquiler ea2 ON ea.descripcion = ea2.descripcion
        GROUP BY b2.id_barrio,
                 re.id_rango_etario,
                 a.duracion,
                 t.cuatrimestre,
                 t.año,
                 ea2.id_estado
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateFactVenta
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_fact_venta(id_localidad, id_tipo_inmueble, id_moneda,
                                                    año, cuatrimestre, id_rango_m2, comision_total)
        SELECT
            l.id_localidad,
            ti2.id_tipo_inmueble,
            m2.id_tipo_moneda,
            t.año,
            t.cuatrimestre,
            r.id_rango_m2,
            SUM(v.comision_inmob) AS comision_total
        FROM LAS_CUATRO_CIFRAS.venta v
        INNER JOIN LAS_CUATRO_CIFRAS.anuncio a ON v.id_anuncio = a.id_anuncio
        INNER JOIN LAS_CUATRO_CIFRAS.inmueble i ON a.inmueble = i.id_inmueble
        INNER JOIN LAS_CUATRO_CIFRAS.direccion_inmueble d ON i.id_direccion = d.id_direccion
        INNER JOIN LAS_CUATRO_CIFRAS.barrio b ON d.barrio = b.id_barrio
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_barrio b2 ON b.descripcion = b2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l ON l.id_localidad = b2.id_localidad
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p ON p.id_provincia = l.id_provincia
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble ti2 ON ti2.descripcion = i.tipo
        INNER JOIN LAS_CUATRO_CIFRAS.moneda m ON v.id_moneda = m.id_moneda
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda m2 ON m2.descripcion = m.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble r ON r.rango = LAS_CUATRO_CIFRAS.GetSupRange(i.superficie_total)
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON t.año = YEAR(v.fecha_venta) AND t.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(v.fecha_venta)
        GROUP BY ti2.id_tipo_inmueble,
                 m2.id_tipo_moneda,
                 l.id_localidad,
                 t.año,
                 t.cuatrimestre,
                 r.id_rango_m2
    END
GO




---------------------------CREACIÓN DE VISTAS---------------------------

CREATE VIEW LAS_CUATRO_CIFRAS.BI_V_PromAnuncioPublicado AS
SELECT
    op.descripcion AS tipo_operacion,
    b.descripcion AS barrio,
    am.descripcion AS ambientes,
    t2.año,
    t2.cuatrimestre,
    AVG(DATEDIFF(DAY, DATEFROMPARTS(t1.año, t2.mes, t1.dia), DATEFROMPARTS(t2.año, t2.mes, t2.dia))) AS duracion_promedio
FROM LAS_CUATRO_CIFRAS.BI_fact_anuncio a
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion op ON a.tipo_operacion = op.id_tipo_operacion
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_inmueble i ON a.inmueble = i.id_inmueble
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_ubicacion u ON i.id_direccion = u.id_ubicacion
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_barrio b ON u.barrio = b.id_barrio
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_ambiente_inmueble am ON i.ambientes = am.id_ambiente
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t1 ON a.fecha_publicacion = t1.id_tiempo
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t2 ON a.fecha_finalizacion = t2.id_tiempo
                                                     AND t2.año = t1.año
                                                     AND t2.cuatrimestre = t1.cuatrimestre
                                                     AND t2.mes = t1.mes
GROUP BY
    op.descripcion,
    b.descripcion,
    am.descripcion,
    t2.año,
    t2.cuatrimestre
GO


CREATE VIEW LAS_CUATRO_CIFRAS.BI_V_PromPrecioAnuncio AS
SELECT
    op.descripcion AS tipo_operacion,
    ti.descripcion AS tipo_inmueble,
    r.rango AS rango_m2,
    t.año,
    t.cuatrimestre,
    m.descripcion AS moneda,
    CAST(AVG(a.precio_inmueble) AS DECIMAL(10,2)) AS precio_promedio
FROM LAS_CUATRO_CIFRAS.BI_fact_anuncio a
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion op ON a.tipo_operacion = op.id_tipo_operacion
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_inmueble i ON a.inmueble = i.id_inmueble
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble ti ON i.tipo = ti.id_tipo_inmueble
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble r ON i.rango_m2 = r.id_rango_m2
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON a.fecha_publicacion = t.id_tiempo
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda m ON a.moneda = m.id_tipo_moneda
GROUP BY
    op.descripcion,
    ti.descripcion,
    r.rango,
    t.año,
    t.cuatrimestre,
    m.descripcion
GO


CREATE VIEW LAS_CUATRO_CIFRAS.BI_V_Top5BarriosAlquiler AS
SELECT TOP 5 WITH TIES
    b.descripcion AS barrio,
    re.rango AS rango_etario,
    t.año,
    t.cuatrimestre,
    COUNT(*) AS cantidad_alquileres
FROM LAS_CUATRO_CIFRAS.BI_fact_alquiler a
INNER JOIN LAS_CUATRO_CIFRAS.BI_fact_anuncio an ON a.id_anuncio = an.id_anuncio
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_inmueble inm ON an.inmueble = inm.id_inmueble
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_ubicacion u ON inm.id_direccion = u.id_ubicacion
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_barrio b ON u.barrio = b.id_barrio
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_inquilino i ON a.id_inquilino = i.id
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_rango_etario re ON i.rango_etario = re.id_rango_etario
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON a.fecha_inicio = t.id_tiempo
GROUP BY
    b.descripcion,
    re.rango,
    t.año,
    t.cuatrimestre
ORDER BY
    5 DESC
GO


CREATE VIEW LAS_CUATRO_CIFRAS.BI_V_PorcentajeIncumplimientoPagos AS
SELECT
    t.año,
    t.mes,
    CAST(CAST(SUM(CASE
        WHEN p.fecha_pago > p.fecha_fin
            THEN 1
        ELSE 0
        END) AS FLOAT) / COUNT(*) * 100 AS DECIMAL(10,2)) AS porcentaje_incumplimiento
FROM LAS_CUATRO_CIFRAS.BI_fact_pago_alquiler p
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON p.fecha_pago = t.id_tiempo
GROUP BY
    t.año,
    t.mes
GO


CREATE VIEW LAS_CUATRO_CIFRAS.BI_V_PromIncrementoAlquiler AS
WITH Incrementos AS (
    SELECT
        a.id_alquiler,
        pa.fecha_pago AS fecha_pago_actual,
        pa.importe AS importe_actual,
        pa2.fecha_pago AS fecha_pago_anterior,
        pa2.importe AS importe_anterior,
        ea.descripcion AS estado_alquiler
    FROM LAS_CUATRO_CIFRAS.BI_fact_alquiler a
    INNER JOIN LAS_CUATRO_CIFRAS.BI_fact_pago_alquiler pa ON a.id_alquiler = pa.id_alquiler
    INNER JOIN LAS_CUATRO_CIFRAS.BI_fact_pago_alquiler pa2 ON a.id_alquiler = pa2.id_alquiler
    INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON pa.fecha_pago = t.id_tiempo
    INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t2 ON pa2.fecha_pago = t2.id_tiempo
    INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_estado_alquiler ea ON ea.id_estado = a.estado
                                                                  AND ea.descripcion = 'Activo'
    WHERE pa.importe > pa2.importe
        AND DATEFROMPARTS(t.año, t.mes, t.dia) > DATEFROMPARTS(t2.año, t2.mes, t2.dia)
)
SELECT
    t.año,
    t.mes,
    CAST(AVG((i.importe_actual - i.importe_anterior) / i.importe_anterior * 100) AS DECIMAL(10,2)) AS porcentaje_promedio_incremento
FROM Incrementos i
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON i.fecha_pago_actual = t.id_tiempo
GROUP BY
    t.año,
    t.mes
GO


CREATE VIEW LAS_CUATRO_CIFRAS.BI_V_PromPrecioM2Venta AS
SELECT
    ti.descripcion AS tipo_inmueble,
    l.descripcion AS localidad,
    t.año,
    t.cuatrimestre,
    r.rango AS rango_m2,
    CAST(AVG(v.precio_venta) AS DECIMAL(15,2)) AS precio_promedio
FROM LAS_CUATRO_CIFRAS.BI_fact_venta v
INNER JOIN LAS_CUATRO_CIFRAS.BI_fact_anuncio a on v.id_anuncio = a.id_anuncio
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_inmueble i ON a.inmueble = i.id_inmueble
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble ti ON i.tipo = ti.id_tipo_inmueble
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_ubicacion u ON i.id_direccion = u.id_ubicacion
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l ON u.localidad = l.id_localidad
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON v.fecha_venta = t.id_tiempo
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble r ON i.rango_m2 = r.id_rango_m2
GROUP BY
    ti.descripcion,
    l.descripcion,
    t.año,
    t.cuatrimestre,
    r.rango
GO


CREATE VIEW LAS_CUATRO_CIFRAS.BI_V_PromComision AS
SELECT
    op.descripcion AS tipo_operacion,
    s.nombre AS sucursal,
    t.año,
    t.cuatrimestre,
    CAST(AVG(tr.comision) AS DECIMAL(10,2)) AS comision_promedio
FROM
    (SELECT fa.id_alquiler AS id, fa.comision AS comision, fa.fecha_inicio AS fecha, fa.id_anuncio AS anuncio
     FROM LAS_CUATRO_CIFRAS.BI_fact_alquiler fa
     UNION ALL
     SELECT fv.id_venta AS id, fv.comision_inmob AS comision, fv.fecha_venta AS fecha, fv.id_anuncio AS anuncio
     FROM LAS_CUATRO_CIFRAS.BI_fact_venta fv
    ) AS tr
INNER JOIN LAS_CUATRO_CIFRAS.BI_fact_anuncio an ON tr.anuncio = an.id_anuncio
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion op ON an.tipo_operacion = op.id_tipo_operacion
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_agente ag ON an.agente = ag.id
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_sucursal s ON ag.sucursal = s.id_sucursal
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON tr.fecha = t.id_tiempo
GROUP BY
    op.descripcion,
    s.nombre,
    t.año,
    t.cuatrimestre
GO


CREATE VIEW LAS_CUATRO_CIFRAS.BI_V_PorcentOperacionesConcretadas AS
SELECT
    s.nombre AS sucursal,
    re.rango AS rango_etario,
    t.año,
    CAST(
        CAST(
            SUM(
                CASE
                WHEN a.id_alquiler IS NOT NULL
                    OR v.id_venta IS NOT NULL
                    THEN 1
                ELSE 0 END) AS FLOAT)
            /
        COUNT(an.id_anuncio) * 100
        AS DECIMAL(10,2)) AS porcentaje_operaciones_concretadas
FROM LAS_CUATRO_CIFRAS.BI_fact_anuncio an
LEFT JOIN LAS_CUATRO_CIFRAS.BI_fact_alquiler a ON an.id_anuncio = a.id_anuncio
LEFT JOIN LAS_CUATRO_CIFRAS.BI_fact_venta v ON an.id_anuncio = v.id_anuncio
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_agente ag ON an.agente = ag.id
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_sucursal s ON ag.sucursal = s.id_sucursal
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_rango_etario re ON ag.rango_etario = re.id_rango_etario
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON an.fecha_publicacion = t.id_tiempo
GROUP BY
    s.nombre,
    re.rango,
    t.año
GO


CREATE VIEW LAS_CUATRO_CIFRAS.BI_V_MontoTotalCierreContratos AS
SELECT
    op.descripcion AS tipo_operacion,
    s.nombre AS sucursal,
    t.año,
    t.cuatrimestre,
    m.descripcion AS moneda,
    SUM(tr.comision) AS monto_total
FROM
    (SELECT fa.id_alquiler AS id, fa.comision AS comision, fa.fecha_inicio AS fecha, fa.id_anuncio AS anuncio
     FROM LAS_CUATRO_CIFRAS.BI_fact_alquiler fa
     UNION ALL
     SELECT fv.id_venta AS id, fv.comision_inmob, fv.fecha_venta AS fecha, fv.id_anuncio AS anuncio
     FROM LAS_CUATRO_CIFRAS.BI_fact_venta fv
    ) AS tr
INNER JOIN LAS_CUATRO_CIFRAS.BI_fact_anuncio an ON tr.anuncio = an.id_anuncio
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion op ON an.tipo_operacion = op.id_tipo_operacion
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_agente ag ON an.agente = ag.id
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_sucursal s ON ag.sucursal = s.id_sucursal
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON tr.fecha = t.id_tiempo
INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda m ON an.moneda = m.id_tipo_moneda
GROUP BY
    op.descripcion,
    s.nombre,
    t.año,
    t.cuatrimestre,
    m.descripcion
GO



---------------MIGRACIÓN-----------------------------

BEGIN TRANSACTION
--- Se ejecutan los procedimientos de migración de datos y si falla alguno se hace rollback y se muestra un error
BEGIN TRY
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimTiempo
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimRangoEtario
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimTipoOperacion
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimProvincia
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimLocalidad
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimBarrio
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimUbicacion
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimTipoInmueble
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimAmbientesInmueble
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimRangoM2Inmueble
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimSucursal
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimTipoMoneda
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimEstadoAnuncio
    EXECUTE LAS_CUATRO_CIFRAS.MigrateDimEstadoAlquiler
    EXECUTE LAS_CUATRO_CIFRAS.MigrateFactAnuncio
    EXECUTE LAS_CUATRO_CIFRAS.MigrateFactAlquiler
    EXECUTE LAS_CUATRO_CIFRAS.MigrateFactVenta
    END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
	THROW 50001, N'Error al migrar las tablas al modelo BI. Verifique que éstas tablas se encuentren vacías o bien ejecute un DROP de todas las nuevas tablas y vuelva a intentarlo.',1;
END CATCH

BEGIN
DECLARE @table_name nvarchar(128)
DECLARE @count int
DECLARE @error_message nvarchar(255)
DECLARE @sql nvarchar(max)

DECLARE table_cursor CURSOR FOR
SELECT name
FROM sys.tables
WHERE name IN ('BI_dim_tiempo', 'BI_dim_rango_etario', 'BI_dim_tipo_operacion', 'BI_dim_provincia',
               'BI_dim_localidad', 'BI_dim_barrio', 'BI_dim_ubicacion', 'BI_dim_tipo_inmueble',
               'BI_dim_ambientes_inmueble', 'BI_dim_rango_m2_inmueble', 'BI_dim_sucursal',
               'BI_dim_tipo_moneda', 'BI_dim_estado_anuncio', 'BI_dim_estado_alquiler',
               'BI_fact_anuncio', 'BI_fact_alquiler', 'BI_fact_venta')

OPEN table_cursor
FETCH NEXT FROM table_cursor INTO @table_name
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = N'SELECT @count = COUNT(*) FROM LAS_CUATRO_CIFRAS.' + QUOTENAME(@table_name)
    EXEC sp_executesql @sql, N'@count int OUTPUT', @count=@count OUTPUT

    IF @count = 0
    BEGIN
    SET @error_message =
                N'Error al migrar la tabla' + QUOTENAME(@table_name) +
                '. Todos los cambios fueron revertidos y ninguna tabla del schema LAS_CUATRO_CIFRAS fue cargada en la base.'
        ROLLBACK TRANSACTION;
        THROW 50002, @error_message,1;
    END

    FETCH NEXT FROM table_cursor INTO @table_name
END

CLOSE table_cursor
DEALLOCATE table_cursor

PRINT N'Tablas migradas correctamente.'
COMMIT TRANSACTION
END
GO