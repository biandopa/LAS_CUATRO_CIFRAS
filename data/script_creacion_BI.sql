USE [GD2C2023]
GO

--------------------DROPS PREVENTIVOS ---------------------------
/* PARA NO TENER ERRORES DE DEPENDECIAS NI DATOS DUPLICADOS */

-------------------DROPS DE TABLAS DIMENSIONALES------------------------

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_tiempo')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_tiempo

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_ubicacion')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_ubicacion

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_sucursal')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_sucursal

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_rango_etario')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_rango_etario

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_tipo_inmueble')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_ambiente')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_ambiente

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_rango_m2')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_rango_m2

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_tipo_operacion')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_tipo_moneda')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda


-------------------DROPS DE FUNCIONES AUXILIARES----------------------------

IF EXISTS(SELECT [name] FROM sys.objects WHERE [name] = 'GetAge')
    DROP FUNCTION LAS_CUATRO_CIFRAS.GetAge

IF EXISTS(SELECT [name] FROM sys.objects WHERE [name] = 'GetAgeRange')
    DROP FUNCTION LAS_CUATRO_CIFRAS.GetAgeRange

IF EXISTS(SELECT [name] FROM sys.objects WHERE [name] = 'GetSupRange')
    DROP FUNCTION LAS_CUATRO_CIFRAS.GetSupRange

IF EXISTS(SELECT [name] FROM sys.objects WHERE [name] = 'GetCuatrimestre')
    DROP FUNCTION LAS_CUATRO_CIFRAS.GetCuatrimestre






---------------CREACIÓN DE COMPONENTES--------------------

-------------------CREACIÓN DE TABLAS DIMENSIONALES------------------------

-- Creación de la tabla tiempo
CREATE TABLE  LAS_CUATRO_CIFRAS.BI_dim_tiempo(
    id_tiempo numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT id_tiempo_bi_pk PRIMARY KEY,
    año NUMERIC(4,0) NOT NULL ,
    cuatrimestre numeric(1,0) NOT NULL
        CHECK (cuatrimestre BETWEEN 1 AND 4),
    mes numeric(2,0) NOT NULL
        CHECK (mes BETWEEN 1 AND 12),
    dia numeric(2,0) NOT NULL
        CHECK (dia BETWEEN 1 AND 31),
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
    descripcion nvarchar(100) NOT NULL
)

-- Creación de la tabla barrio
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_barrio
(
    id_barrio numeric(18,0) IDENTITY(1,1)
        CONSTRAINT bi_barrio_pk
            PRIMARY KEY,
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

-- Creación de la tabla disposición del inmueble
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_disposicion_inmueble
(
    id_disposicion numeric(18,0) IDENTITY(1,1)
        CONSTRAINT bi_disposicion_inmueble_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL UNIQUE
)

-- Creación de la tabla estado del inmueble
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_estado_inmueble
(
    id_estado numeric(18,0) IDENTITY(1,1)
        CONSTRAINT bi_estado_inmueble_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL UNIQUE
)

-- Creación de la tabla orientación del inmueble
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_orientacion_inmueble
(
    id_orientacion numeric(18,0) IDENTITY(1,1)
        CONSTRAINT bi_orientacion_inmueble_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL UNIQUE
)

-- Creación de la tabla ambiente
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_ambiente(
    id_ambiente numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_id_ambiente_pk PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL
)

-- Creación de la tabla rango m2
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_rango_m2(
    id_rango_m2 numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_id_rango_m2_pk PRIMARY KEY,
    rango nvarchar(10) NOT NULL
)

-- Creación de la tabla característica del inmueble
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_caracteristica
(
    id_caracteristica numeric(18,0) IDENTITY(1,1)
        CONSTRAINT bi_caracteristica_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL UNIQUE
)

-- Creación de la tabla propietario del inmueble
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_propietario
(
    id numeric(18, 0) IDENTITY(1,1)
        CONSTRAINT bi_id_propietario_pk
            PRIMARY KEY,
    dni numeric(18, 0) NOT NULL,
    nombre nvarchar(100) NOT NULL,
    apellido nvarchar(100) NOT NULL,
    fecha_registro datetime DEFAULT GETDATE(),
    telefono numeric(18, 0) NOT NULL,
    mail nvarchar (255),
    fecha_nacimiento datetime NOT NULL,
)

-- Creación de la tabla inmueble
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_inmueble
(
    id_inmueble numeric(18,0)
        CONSTRAINT bi_inmueble_pk
            PRIMARY KEY,
    tipo numeric(18,0) NOT NULL
        CONSTRAINT bi_tipo_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble,
    descripcion nvarchar(100) NOT NULL,
    id_propietario numeric(18,0) NOT NULL
        CONSTRAINT bi_propietario_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_propietario,
    id_direccion numeric(18,0) NOT NULL
        CONSTRAINT bi_direccion_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_ubicacion,
    ambientes numeric(18,0) NOT NULL
        CONSTRAINT bi_ambiente_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_ambiente,
    rango_m2 numeric(18,2) NOT NULL
        CONSTRAINT bi_rango_m2_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_rango_m2,
    disposicion numeric(18,0)
        CONSTRAINT bi_disposicion_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_disposicion_inmueble,
    orientacion numeric(18,0) NOT NULL
        CONSTRAINT bi_orientacion_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_orientacion_inmueble,
    estado numeric(18,0) NOT NULL
        CONSTRAINT bi_estado_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_estado_inmueble,
    antiguedad numeric(18,0),
    expensas numeric(18,2) NOT NULL,
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



-- Creación de la tabla agente
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_agente
(
    id numeric(18,0) IDENTITY(1,1)
        CONSTRAINT bi_id_agente_pk
            PRIMARY KEY,
    dni numeric(18,0) NOT NULL,
    nombre nvarchar(100) NOT NULL,
    apellido nvarchar(100) NOT NULL,
    fecha_registro datetime DEFAULT GETDATE(),
    telefono numeric(18,0) NOT NULL,
    mail nvarchar(100) NOT NULL,
    rango_etario numeric(18,0) NOT NULL
        CONSTRAINT bi_rango_etario_agente_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_rango_etario,
    sucursal numeric(18,0) NOT NULL
        CONSTRAINT bi_sucursal_agente_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_sucursal
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


-- Creación de la tabla inquilino del inmueble
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_inquilino(
	id numeric(18,0) IDENTITY(1,1)
		CONSTRAINT bi_id_inquilino_pk
		    PRIMARY KEY,
    dni numeric(18,0) NOT NULL,
	nombre nvarchar(100) NOT NULL,
	apellido nvarchar(100) NOT NULL,
	fecha_registro datetime DEFAULT GETDATE(),
	telefono numeric(18,0) NOT NULL,
	mail nvarchar(100),
	rango_etario numeric(18,0) NOT NULL
	    CONSTRAINT bi_rango_etario_inquilino_fk
	        REFERENCES LAS_CUATRO_CIFRAS.BI_dim_rango_etario
)


-- Creación de la tabla importe del alquiler
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_importe(
	id_importe numeric(18,0)
	    IDENTITY(1,1)
		CONSTRAINT bi_importe_alquiler_pk
			PRIMARY KEY,
	periodo_inicio numeric(18,0) NOT NULL,
	periodo_fin numeric(18,0) NOT NULL,
	precio numeric(18,2) NOT NULL,
    CONSTRAINT CHK_Importe_Alquiler_Date_BI CHECK (periodo_fin > periodo_inicio)
)


-- Creación de la tabla estado del alquiler
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_estado_alquiler(
    id_estado numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_estado_alquiler_pk
            PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL UNIQUE
)


-- Creación de la tabla medio de pago
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_medio_pago(
	id_medio_pago numeric(18,0)
	    IDENTITY(1,1)
        CONSTRAINT bi_medio_pago_pk
            PRIMARY KEY,
	descripcion nvarchar(100) NOT NULL UNIQUE
)


-- Creación de la tabla pago del alquiler
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_pago_alquiler(
	id_pago_alquiler numeric(18,0)
		CONSTRAINT bi_pago_alquiler_pk
		    PRIMARY KEY,
	id_alquiler numeric(18,0)
	 NOT NULL
		CONSTRAINT bi_alquiler_pago_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.BI_fact_alquiler,
	medio_pago numeric(18,0)
	    NOT NULL
	    CONSTRAINT bi_medio_pago_pago_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.BI_dim_medio_pago,
	num_periodo numeric(18,0) NOT NULL,
	descripcion varchar(100) NOT NULL,
	fecha_pago datetime DEFAULT GETDATE(),
	fecha_inicio datetime NOT NULL,
	fecha_fin datetime NOT NULL,
	importe numeric(18,2) NOT NULL,
    CONSTRAINT CHK_Pago_Alquiler_Fin_Date_BI CHECK (fecha_fin > fecha_inicio),
    CONSTRAINT CHK_Pago_Alquiler_Date_BI CHECK (fecha_pago >= fecha_inicio)
)


-- Creación de la tabla comprador del inmueble
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_comprador(
	id numeric(18,0) IDENTITY(1,1)
	    CONSTRAINT bi_id_comprador_pk
		    PRIMARY KEY,
    dni numeric(18,0) NOT NULL,
	nombre nvarchar(100) NOT NULL,
	apellido nvarchar(100) NOT NULL,
	fecha_registro datetime DEFAULT GETDATE(),
	telefono nvarchar(100) NOT NULL,
	mail nvarchar(100),
	fecha_nacimiento datetime NOT NULL
)


-- Creación de la tabla pago de la venta
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_pago_venta(
    id_pago numeric(18,0) IDENTITY(1,1)
        CONSTRAINT bi_pago_venta_pk
            PRIMARY KEY,
    importe numeric(18,2) NOT NULL,
    id_moneda numeric(18,0) NOT NULL
        CONSTRAINT bi_moneda_pago_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda,
    cotizacion numeric(18,2) NOT NULL,
    medio_pago numeric(18,0) NOT NULL
        CONSTRAINT bi_medio_pago_pago_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_medio_pago
)

GO


-------------------CREACIÓN DE TABLAS HECHOS------------------------

-- Creación de la tabla anuncio
CREATE TABLE LAS_CUATRO_CIFRAS.BI_fact_anuncio
(
    id_anuncio numeric(18,0)
        CONSTRAINT bi_anuncio_pk
            PRIMARY KEY,
    fecha_publicacion datetime DEFAULT GETDATE(),
    agente numeric(18,0) NOT NULL
        CONSTRAINT bi_agente_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_agente,
    tipo_operacion numeric(18,0) NOT NULL
        CONSTRAINT bi_tipo_operacion_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion,
    inmueble numeric(18,0) NOT NULL
        CONSTRAINT bi_inmueble_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_inmueble,
    precio_inmueble numeric(18,2) NOT NULL,
    moneda numeric(18,0) NOT NULL
        CONSTRAINT bi_moneda_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda,
    tipo_periodo nvarchar(100) NOT NULL,
    estado numeric(18,0) NOT NULL
        CONSTRAINT bi_estado_anuncio_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_estado_anuncio,
    fecha_finalizacion datetime NOT NULL,
    costo_publicacion numeric(18,2) NOT NULL,
    CONSTRAINT CHK_Anuncio_Date_BI CHECK (fecha_finalizacion > fecha_publicacion)
)

-- Creación de la tabla alquiler
CREATE TABLE LAS_CUATRO_CIFRAS.BI_fact_alquiler(
	id_alquiler numeric(18,0)
		CONSTRAINT bi_alquiler_pk
		    PRIMARY KEY,
	id_anuncio numeric(18,0)
	    NOT NULL
		CONSTRAINT bi_anuncio_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.BI_fact_anuncio,
	id_inquilino numeric(18,0) NOT NULL
		CONSTRAINT bi_inquilino_alquiler_fk
			REFERENCES LAS_CUATRO_CIFRAS.BI_dim_inquilino,
    fecha_fin datetime NOT NULL,
	fecha_inicio datetime DEFAULT GETDATE(),
	duracion numeric(18,0),
	deposito numeric(18,2) NOT NULL,
	comision numeric(18,2) NOT NULL,
	gasto_averig numeric(18,2) NOT NULL,
    estado numeric(18,0) NOT NULL
        CONSTRAINT bi_estado_alquiler_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_estado_alquiler,
    CONSTRAINT CHK_Alquiler_Date_BI CHECK (fecha_fin > fecha_inicio)
)


-- Creación de la tabla venta de inmuebles
CREATE TABLE LAS_CUATRO_CIFRAS.BI_fact_venta(
	id_venta numeric(18,0)
        CONSTRAINT bi_venta_pk
            PRIMARY KEY,
	id_anuncio numeric(18,0)
	    NOT NULL
	    CONSTRAINT bi_anuncio_venta_fk
		    REFERENCES LAS_CUATRO_CIFRAS.BI_fact_anuncio,
	id_comprador numeric(18,0)
	    NOT NULL
        CONSTRAINT bi_comprador_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_comprador,
    fecha_venta datetime DEFAULT GETDATE(),
	precio_venta numeric(18,0) NOT NULL,
	id_moneda numeric(18,0)
	    NOT NULL
        CONSTRAINT bi_moneda_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda,
	pago numeric(18,0) NOT NULL
        CONSTRAINT bi_pago_venta_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_pago_venta,
	comision_inmob numeric(18,0) NOT NULL,
)

GO


-------------------CREACIÓN DE TABLAS PUENTE------------------------

-- Creación de la tabla inmueble_caracteristica
CREATE TABLE LAS_CUATRO_CIFRAS.BI_bridge_inmueble_caracteristica
(
    id_inmueble numeric(18,0) NOT NULL
        CONSTRAINT bi_inmueble_caracteristica_fk
           REFERENCES LAS_CUATRO_CIFRAS.BI_dim_inmueble,
    id_caracteristica numeric(18,0) NOT NULL
        CONSTRAINT bi_caracteristica_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_caracteristica
)

-- Creación de la tabla importe del alquiler
CREATE TABLE LAS_CUATRO_CIFRAS.BI_bridge_importe_alquiler(
	id_importe numeric(18,0) NOT NULL
	    CONSTRAINT bi_importe_alquiler_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_importe,
	id_alquiler numeric(18,0) NOT NULL
        CONSTRAINT bi_alquiler_importe_alquiler_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_fact_alquiler,
)

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
        SET @ageRange = '< 25';
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
        SET @ageRange = '> 50';
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
        SET @range = '< 35';
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
        SET @range = '> 100';
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


