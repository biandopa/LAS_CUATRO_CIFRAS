USE [GD2C2023]
GO

--------------------DROPS PREVENTIVOS ---------------------------
/* PARA NO TENER ERRORES DE DEPENDECIAS NI DATOS DUPLICADOS */

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

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_estado_inmueble')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_estado_inmueble

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_disposicion_inmueble')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_disposicion_inmueble

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_orientacion_inmueble')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_orientacion_inmueble

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_caracteristica')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_caracteristica

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_propietario')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_propietario

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_inmueble')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_inmueble

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_sucursal')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_sucursal

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_agente')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_agente

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_tipo_moneda')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_estado_anuncio')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_estado_anuncio

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_inquilino')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_inquilino

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_importe')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_importe

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_estado_alquiler')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_estado_alquiler

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_medio_pago')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_medio_pago

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_fact_pago_alquiler')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_fact_pago_alquiler

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_comprador')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_comprador

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_pago_venta')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_pago_venta

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_dim_tiempo')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_dim_tiempo


-------------------DROPS DE TABLAS HECHOS------------------------
IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_fact_alquiler')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_fact_alquiler

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_fact_venta')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_fact_venta

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_fact_anuncio')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_fact_anuncio


-------------------DROPS DE TABLAS BRIDGE------------------------
IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_bridge_inmueble_caracteristica')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_bridge_inmueble_caracteristica

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_bridge_importe_alquiler')
    DROP TABLE LAS_CUATRO_CIFRAS.BI_bridge_importe_alquiler



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
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_tiempo(
    id_tiempo numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT id_tiempo_bi_pk PRIMARY KEY,
    año NUMERIC(4,0) NOT NULL,
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
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_ambiente_inmueble(
    id_ambiente numeric(18,0)
        IDENTITY(1,1)
        CONSTRAINT bi_id_ambiente_pk PRIMARY KEY,
    descripcion nvarchar(100) NOT NULL
)

-- Creación de la tabla rango m2
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble(
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
    fecha_registro numeric(18, 0) NOT NULL
    CONSTRAINT bi_fecha_registro_propietario_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
    telefono numeric(18, 0) NOT NULL,
    mail nvarchar (255),
    fecha_nacimiento numeric(18, 0) NOT NULL
        CONSTRAINT bi_fecha_nacimiento_propietario_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
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
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_ambiente_inmueble,
    rango_m2 numeric(18,0) NOT NULL
        CONSTRAINT bi_rango_m2_inmueble_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble,
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
    fecha_registro numeric(18,0) NOT NULL
        CONSTRAINT bi_fecha_registro_agente_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
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
	fecha_registro numeric(18,0) NOT NULL
        CONSTRAINT bi_fecha_registro_inquilino_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
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


-- Creación de la tabla comprador del inmueble
CREATE TABLE LAS_CUATRO_CIFRAS.BI_dim_comprador(
	id numeric(18,0) IDENTITY(1,1)
	    CONSTRAINT bi_id_comprador_pk
		    PRIMARY KEY,
    dni numeric(18,0) NOT NULL,
	nombre nvarchar(100) NOT NULL,
	apellido nvarchar(100) NOT NULL,
	fecha_registro numeric(18,0) NOT NULL
        CONSTRAINT bi_fecha_registro_comprador_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
	telefono nvarchar(100) NOT NULL,
	mail nvarchar(100),
	fecha_nacimiento numeric(18,0) NOT NULL
        CONSTRAINT bi_fecha_nacimiento_comprador_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo
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
    fecha_publicacion numeric(18,0) NOT NULL
        CONSTRAINT bi_fecha_publicacion_anuncio_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
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
    fecha_finalizacion numeric(18,0) NOT NULL
        CONSTRAINT bi_fecha_finalizacion_anuncio_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
    costo_publicacion numeric(18,2) NOT NULL
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
    fecha_fin numeric(18,0) NOT NULL
        CONSTRAINT bi_fecha_fin_alquiler_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
	fecha_inicio numeric(18,0) NOT NULL
        CONSTRAINT bi_fecha_inicio_alquiler_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
	duracion numeric(18,0),
	deposito numeric(18,2) NOT NULL,
	comision numeric(18,2) NOT NULL,
	gasto_averig numeric(18,2) NOT NULL,
    estado numeric(18,0) NOT NULL
        CONSTRAINT bi_estado_alquiler_fk
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_estado_alquiler
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
    fecha_venta numeric(18,0) NOT NULL
        CONSTRAINT bi_fecha_venta_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
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

-- Creación de la tabla pago del alquiler
CREATE TABLE LAS_CUATRO_CIFRAS.BI_fact_pago_alquiler(
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
	fecha_pago numeric(18,0) NOT NULL
	    CONSTRAINT bi_fecha_pago_pago_alquiler_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
	fecha_inicio numeric(18,0) NOT NULL
	    CONSTRAINT bi_fecha_inicio_pago_alquiler_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
	fecha_fin numeric(18,0) NOT NULL
        CONSTRAINT bi_fecha_fin_pago_alquiler_ck
            REFERENCES LAS_CUATRO_CIFRAS.BI_dim_tiempo,
	importe numeric(18,2) NOT NULL
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


-------------------CREACIÓN DE ÍNDICES------------------------

CREATE INDEX BI_dim_ubicacion_index
ON LAS_CUATRO_CIFRAS.BI_dim_ubicacion(provincia, localidad, barrio);

CREATE INDEX BI_propietario_inmueble_index
ON LAS_CUATRO_CIFRAS.BI_dim_propietario(dni);

CREATE INDEX BI_inquilino_inmueble_index
ON LAS_CUATRO_CIFRAS.BI_dim_inquilino(dni);

CREATE INDEX BI_inmueble_direccion_index
ON LAS_CUATRO_CIFRAS.BI_dim_inmueble(id_direccion);

CREATE INDEX BI_inmueble_caracteristica_id_index
ON LAS_CUATRO_CIFRAS.BI_bridge_inmueble_caracteristica(id_inmueble);

CREATE INDEX BI_sucursal_direccion_index
ON LAS_CUATRO_CIFRAS.BI_dim_sucursal(direccion);

CREATE INDEX BI_agente_anuncio_index
ON LAS_CUATRO_CIFRAS.BI_dim_agente(dni);

CREATE INDEX BI_agente_anuncio_index
ON LAS_CUATRO_CIFRAS.BI_dim_comprador(dni);

CREATE INDEX BI_anuncio_agente_index
ON LAS_CUATRO_CIFRAS.BI_fact_anuncio(agente);

CREATE INDEX BI_alquiler_anuncio_index
ON LAS_CUATRO_CIFRAS.BI_fact_alquiler(id_anuncio);

CREATE INDEX BI_pago_alquiler_alquiler_index
ON LAS_CUATRO_CIFRAS.BI_fact_pago_alquiler(id_alquiler);

CREATE INDEX BI_comprador_venta_index
ON LAS_CUATRO_CIFRAS.BI_dim_comprador(dni);

CREATE INDEX BI_venta_anuncio_index
ON LAS_CUATRO_CIFRAS.BI_fact_venta(id_anuncio);

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
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_tiempo(año, cuatrimestre, mes, dia)
        SELECT DISTINCT YEAR(fecha_registro), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_registro)),
                        MONTH(fecha_registro), DAY(fecha_registro)
        FROM LAS_CUATRO_CIFRAS.propietario
        UNION
        SELECT DISTINCT YEAR(fecha_nacimiento), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_nacimiento)),
                        MONTH(fecha_nacimiento), DAY(fecha_nacimiento)
        FROM LAS_CUATRO_CIFRAS.propietario
        UNION
        SELECT DISTINCT YEAR(fecha_pago), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_pago)),
                        MONTH(fecha_pago), DAY(fecha_pago)
        FROM LAS_CUATRO_CIFRAS.pago_alquiler
        UNION
        SELECT DISTINCT YEAR(fecha_inicio), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_inicio)),
                        MONTH(fecha_inicio), DAY(fecha_inicio)
        FROM LAS_CUATRO_CIFRAS.pago_alquiler
        UNION
        SELECT DISTINCT YEAR(fecha_fin), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_fin)),
                        MONTH(fecha_fin), DAY(fecha_fin)
        FROM LAS_CUATRO_CIFRAS.pago_alquiler
        UNION
        SELECT DISTINCT YEAR(fecha_fin), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_fin)),
                        MONTH(fecha_fin), DAY(fecha_fin)
        FROM LAS_CUATRO_CIFRAS.alquiler
        UNION
        SELECT DISTINCT YEAR(fecha_inicio), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_inicio)),
                        MONTH(fecha_inicio), DAY(fecha_inicio)
        FROM LAS_CUATRO_CIFRAS.alquiler
        UNION
        SELECT DISTINCT YEAR(fecha_venta), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_venta)),
                        MONTH(fecha_venta), DAY(fecha_venta)
        FROM LAS_CUATRO_CIFRAS.venta
        UNION
        SELECT DISTINCT YEAR(fecha_registro), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_registro)),
                        MONTH(fecha_registro), DAY(fecha_registro)
        FROM LAS_CUATRO_CIFRAS.comprador
        UNION
        SELECT DISTINCT YEAR(fecha_nacimiento), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_nacimiento)),
                        MONTH(fecha_nacimiento), DAY(fecha_nacimiento)
        FROM LAS_CUATRO_CIFRAS.comprador
        UNION
        SELECT DISTINCT YEAR(fecha_registro), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_registro)),
                        MONTH(fecha_registro), DAY(fecha_registro)
        FROM LAS_CUATRO_CIFRAS.inquilino
        UNION
        SELECT DISTINCT YEAR(fecha_registro), LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(fecha_registro)),
                        MONTH(fecha_registro), DAY(fecha_registro)
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
        ORDER BY id_provincia
    END
GO


CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimLocalidad
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_localidad(descripcion)
        SELECT descripcion
        FROM LAS_CUATRO_CIFRAS.localidad
        ORDER BY id_localidad
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimBarrio
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_barrio(descripcion)
        SELECT descripcion
        FROM LAS_CUATRO_CIFRAS.barrio
        ORDER BY id_barrio
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimUbicacion
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_ubicacion(provincia, localidad, barrio, calle)
        SELECT
            p2.id_provincia,
            l2.id_localidad,
            b2.id_barrio,
            d.calle
        FROM LAS_CUATRO_CIFRAS.direccion d
        INNER JOIN LAS_CUATRO_CIFRAS.barrio b on d.barrio = b.id_barrio
        INNER JOIN LAS_CUATRO_CIFRAS.provincia p on d.provincia = p.id_provincia
        INNER JOIN LAS_CUATRO_CIFRAS.localidad l on d.localidad = l.id_localidad
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p2 on p.descripcion = p2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l2 on l.descripcion = l2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_barrio b2 on b.descripcion = b2.descripcion

        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_ubicacion(provincia, localidad, barrio, calle)
        SELECT
            p2.id_provincia,
            l2.id_localidad,
            NULL,
            d.calle
        FROM LAS_CUATRO_CIFRAS.direccion d
        INNER JOIN LAS_CUATRO_CIFRAS.provincia p on d.provincia = p.id_provincia
        INNER JOIN LAS_CUATRO_CIFRAS.localidad l on d.localidad = l.id_localidad
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p2 on p.descripcion = p2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l2 on l.descripcion = l2.descripcion
        WHERE d.barrio IS NULL
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimTipoInmueble
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble(descripcion)
        SELECT DISTINCT descripcion
        FROM LAS_CUATRO_CIFRAS.tipo_inmueble
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimDisposicionInmueble
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_disposicion_inmueble(descripcion)
        SELECT DISTINCT descripcion
        FROM LAS_CUATRO_CIFRAS.disposicion_inmueble
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimEstadoInmueble
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_estado_inmueble(descripcion)
        SELECT DISTINCT descripcion
        FROM LAS_CUATRO_CIFRAS.estado_inmueble
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimOrientacionInmueble
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_orientacion_inmueble(descripcion)
        SELECT DISTINCT descripcion
        FROM LAS_CUATRO_CIFRAS.orientacion_inmueble
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

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimCaracteristicas
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_caracteristica(descripcion)
        SELECT DISTINCT descripcion
        FROM LAS_CUATRO_CIFRAS.caracteristica
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimPropietario
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_propietario(nombre, apellido, dni, fecha_registro,
                                                         telefono, mail, fecha_nacimiento)
        SELECT DISTINCT p.nombre, p.apellido, p.dni,
                        (SELECT t.id_tiempo FROM LAS_CUATRO_CIFRAS.BI_dim_tiempo t
                         WHERE t.año = YEAR(p.fecha_registro)
                           AND t.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(p.fecha_registro))
                           AND t.mes = MONTH(p.fecha_registro)
                           AND t.dia = DAY(p.fecha_registro)),
                        p.telefono, p.mail,
                        (SELECT t2.id_tiempo FROM LAS_CUATRO_CIFRAS.BI_dim_tiempo t2
                         WHERE t2.año = YEAR(p.fecha_nacimiento)
                           AND t2.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(p.fecha_nacimiento))
                           AND t2.mes = MONTH(p.fecha_nacimiento)
                           AND t2.dia = DAY(p.fecha_nacimiento))
        FROM LAS_CUATRO_CIFRAS.propietario p
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimInmueble
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_inmueble(id_inmueble, tipo, descripcion, id_propietario,
                                                      id_direccion, ambientes, rango_m2, disposicion,
                                                      orientacion, estado, antiguedad, expensas)
        SELECT
            i.id_inmueble,
            (SELECT id_tipo_inmueble FROM LAS_CUATRO_CIFRAS.BI_dim_tipo_inmueble
                                     WHERE descripcion = t.descripcion),
            i.descripcion,
            (SELECT pr.id FROM LAS_CUATRO_CIFRAS.BI_dim_propietario pr
                            WHERE pr.dni = p.dni AND pr.nombre = p.nombre AND pr.apellido = p.apellido),
            (SELECT u.id_ubicacion FROM LAS_CUATRO_CIFRAS.BI_dim_ubicacion u
                                   INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_barrio b ON u.barrio = b.id_barrio
                                   INNER JOIN LAS_CUATRO_CIFRAS.barrio b2 on b.descripcion = b2.descripcion AND b2.id_barrio = d.barrio
                                   INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l ON u.localidad = l.id_localidad
                                   INNER JOIN LAS_CUATRO_CIFRAS.localidad l2 on l.descripcion = l2.descripcion AND l2.id_localidad = d.localidad
                                   INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p ON u.provincia = p.id_provincia
                                   INNER JOIN LAS_CUATRO_CIFRAS.provincia p2 on p.descripcion = p2.descripcion AND p2.id_provincia = d.provincia
                                   WHERE u.calle = d.calle),
            a.id_ambiente,
            r.id_rango_m2,
            (SELECT d.id_disposicion FROM LAS_CUATRO_CIFRAS.BI_dim_disposicion_inmueble d
                            WHERE disp.descripcion = d.descripcion),
            (SELECT o.id_orientacion FROM LAS_CUATRO_CIFRAS.BI_dim_orientacion_inmueble o
                            WHERE ori.descripcion = o.descripcion),
            (SELECT e.id_estado FROM LAS_CUATRO_CIFRAS.BI_dim_estado_inmueble e
                            WHERE ei.descripcion = e.descripcion),
            i.antiguedad,
            i.expensas
        FROM LAS_CUATRO_CIFRAS.inmueble i
        INNER JOIN LAS_CUATRO_CIFRAS.tipo_inmueble t ON i.tipo = t.id_tipo
        INNER JOIN LAS_CUATRO_CIFRAS.propietario p ON i.id_propietario = p.id
        INNER JOIN LAS_CUATRO_CIFRAS.direccion d ON i.id_direccion = d.id_direccion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_ambiente_inmueble a ON i.ambientes = a.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_rango_m2_inmueble r ON r.rango = LAS_CUATRO_CIFRAS.GetSupRange(i.superficie_total)
        INNER JOIN LAS_CUATRO_CIFRAS.disposicion_inmueble disp ON i.disposicion = disp.id_disposicion
        INNER JOIN LAS_CUATRO_CIFRAS.orientacion_inmueble ori ON i.orientacion = ori.id_orientacion
        INNER JOIN LAS_CUATRO_CIFRAS.estado_inmueble ei ON i.estado = ei.id_estado
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimSucursal
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_sucursal(nombre, direccion, telefono)
        SELECT DISTINCT s.nombre,
                        (SELECT u.id_ubicacion FROM LAS_CUATRO_CIFRAS.BI_dim_ubicacion u
                                   INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l ON u.localidad = l.id_localidad
                                   INNER JOIN LAS_CUATRO_CIFRAS.localidad l2 on l.descripcion = l2.descripcion AND l2.id_localidad = d.localidad
                                   INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p ON u.provincia = p.id_provincia
                                   INNER JOIN LAS_CUATRO_CIFRAS.provincia p2 on p.descripcion = p2.descripcion AND p2.id_provincia = d.provincia
                                   WHERE u.calle = d.calle),
                        s.telefono
        FROM LAS_CUATRO_CIFRAS.sucursal s
            INNER JOIN LAS_CUATRO_CIFRAS.direccion d ON s.direccion = d.id_direccion
        INNER JOIN LAS_CUATRO_CIFRAS.provincia p ON d.provincia = p.id_provincia
        INNER JOIN LAS_CUATRO_CIFRAS.localidad l ON d.localidad = l.id_localidad
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimAgente
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_agente(nombre, apellido, dni, fecha_registro,
                                                     telefono, mail, rango_etario, sucursal)
        SELECT DISTINCT a.nombre,
                        a.apellido,
                        a.dni,
                        (SELECT t.id_tiempo FROM LAS_CUATRO_CIFRAS.BI_dim_tiempo t
                         WHERE t.año = YEAR(a.fecha_registro)
                           AND t.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(a.fecha_registro))
                           AND t.mes = MONTH(a.fecha_registro)
                           AND t.dia = DAY(a.fecha_registro)),
                        a.telefono,
                        a.mail,
                        (SELECT r.id_rango_etario FROM LAS_CUATRO_CIFRAS.BI_dim_rango_etario r
                                                  WHERE r.rango = LAS_CUATRO_CIFRAS.GetAgeRange(LAS_CUATRO_CIFRAS.GetAge(a.fecha_nacimiento))),
                            suc.id_sucursal
        FROM LAS_CUATRO_CIFRAS.agente a
        INNER JOIN LAS_CUATRO_CIFRAS.sucursal s ON a.sucursal = s.id_sucursal
        INNER JOIN LAS_CUATRO_CIFRAS.direccion d ON s.direccion = d.id_direccion
        INNER JOIN LAS_CUATRO_CIFRAS.provincia p ON d.provincia = p.id_provincia
        INNER JOIN LAS_CUATRO_CIFRAS.localidad l ON d.localidad = l.id_localidad
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p2 ON p.descripcion = p2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l2 ON l.descripcion = l2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_ubicacion u ON u.calle = d.calle AND u.provincia = p2.id_provincia AND u.localidad = l2.id_localidad
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_sucursal suc ON suc.direccion = u.id_ubicacion
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

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimInquilino
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_inquilino(nombre, apellido, dni, fecha_registro,
                                                        telefono, mail, rango_etario)
        SELECT DISTINCT i.nombre,
                        i.apellido,
                        i.dni,
                        (SELECT t.id_tiempo FROM LAS_CUATRO_CIFRAS.BI_dim_tiempo t
                         WHERE t.año = YEAR(i.fecha_registro)
                           AND t.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(i.fecha_registro))
                           AND t.mes = MONTH(i.fecha_registro)
                           AND t.dia = DAY(i.fecha_registro)),
                        i.telefono,
                        i.mail,
                        (SELECT r.id_rango_etario FROM LAS_CUATRO_CIFRAS.BI_dim_rango_etario r
                                                  WHERE r.rango = LAS_CUATRO_CIFRAS.GetAgeRange(LAS_CUATRO_CIFRAS.GetAge(i.fecha_nac)))
        FROM LAS_CUATRO_CIFRAS.inquilino i
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimImporte
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_importe(periodo_inicio, periodo_fin, precio)
        SELECT DISTINCT periodo_inicio,
                        periodo_fin,
                        precio
        FROM LAS_CUATRO_CIFRAS.importe
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

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimMedioDePago
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_medio_pago(descripcion)
        SELECT DISTINCT descripcion
        FROM LAS_CUATRO_CIFRAS.medio_pago
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimComprador
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_comprador(nombre, apellido, dni, fecha_registro,
                                                        telefono, mail, fecha_nacimiento)
        SELECT DISTINCT c.nombre,
                        c.apellido,
                        c.dni,
                        (SELECT t.id_tiempo FROM LAS_CUATRO_CIFRAS.BI_dim_tiempo t
                         WHERE t.año = YEAR(c.fecha_registro)
                           AND t.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(c.fecha_registro))
                           AND t.mes = MONTH(c.fecha_registro)
                           AND t.dia = DAY(c.fecha_registro)),
                        c.telefono,
                        c.mail,
                        (SELECT t.id_tiempo FROM LAS_CUATRO_CIFRAS.BI_dim_tiempo t
                         WHERE t.año = YEAR(c.fecha_nacimiento)
                           AND t.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(c.fecha_nacimiento))
                           AND t.mes = MONTH(c.fecha_nacimiento)
                           AND t.dia = DAY(c.fecha_nacimiento))
        FROM LAS_CUATRO_CIFRAS.comprador c
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateDimPagoVenta
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_dim_pago_venta(importe, id_moneda, cotizacion, medio_pago)
        SELECT DISTINCT
                        p.importe,
                        (SELECT m.id_tipo_moneda FROM LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda m
                                                 INNER JOIN LAS_CUATRO_CIFRAS.moneda m2 ON m2.descripcion = m.descripcion
                                                 AND m2.id_moneda = p.id_moneda),
                        p.cotizacion,
                        (SELECT m.id_medio_pago FROM LAS_CUATRO_CIFRAS.BI_dim_medio_pago m
                                                    INNER JOIN LAS_CUATRO_CIFRAS.medio_pago m2 ON m2.descripcion = m.descripcion
                                                AND m2.id_medio_pago = p.medio_pago)
        FROM LAS_CUATRO_CIFRAS.pago_venta p
    END
GO



CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateFactAnuncio
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_fact_anuncio(id_anuncio, fecha_publicacion, agente, tipo_operacion,
                                                      inmueble, precio_inmueble, moneda, tipo_periodo, estado,
                                                      fecha_finalizacion, costo_publicacion)
        SELECT
            a.id_anuncio,
            t.id_tiempo AS fecha_publicacion,
            ag.id AS agente,
            t_op.id_tipo_operacion AS tipo_operacion,
            i.id_inmueble AS inmueble,
            a.precio_inmueble,
            m.id_tipo_moneda AS moneda,
            a.tipo_periodo,
            e.id_estado AS estado,
            t_fin.id_tiempo AS fecha_finalizacion,
            a.costo_publicacion
        FROM LAS_CUATRO_CIFRAS.anuncio a
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON t.año = YEAR(a.fecha_publicacion)
                                                            AND t.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(a.fecha_publicacion))
                                                            AND t.mes = MONTH(a.fecha_publicacion) AND t.dia = DAY(a.fecha_publicacion)
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_agente ag ON ag.id = a.agente
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_operacion t_op ON a.tipo_operacion = t_op.id_tipo_operacion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_inmueble i ON a.inmueble = i.id_inmueble
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda m ON a.moneda = m.id_tipo_moneda
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_estado_anuncio e ON a.estado = e.id_estado
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t_fin ON t_fin.año = YEAR(a.fecha_finalizacion)
                                                                AND t_fin.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(a.fecha_finalizacion))
                                                                AND t_fin.mes = MONTH(a.fecha_finalizacion)
                                                                AND t_fin.dia = DAY(a.fecha_finalizacion)
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateFactAlquiler
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_fact_alquiler(id_alquiler, id_anuncio, id_inquilino,
                                                       fecha_fin, fecha_inicio, duracion,
                                                       deposito, comision, gasto_averig, estado)
        SELECT
            a.id_alquiler,
            an.id_anuncio,
            i.id AS id_inquilino,
            t1.id_tiempo AS fecha_inicio,
            t2.id_tiempo AS fecha_fin,
            a.duracion,
            a.deposito,
            a.comision,
            a.gasto_averig,
            e.id_estado
        FROM LAS_CUATRO_CIFRAS.alquiler a
        INNER JOIN LAS_CUATRO_CIFRAS.anuncio an ON a.id_anuncio = an.id_anuncio
        INNER JOIN LAS_CUATRO_CIFRAS.inquilino i2 ON a.id_inquilino = i2.id
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_inquilino i ON i2.nombre = i.nombre
                                                               AND i2.apellido = i.apellido
                                                               AND i2.dni = i.dni
                                                               AND i2.telefono = i.telefono
                                                               AND i2.mail = i.mail
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t1 ON t1.año = YEAR(a.fecha_inicio)
                                                             AND t1.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(a.fecha_inicio))
                                                             AND t1.mes = MONTH(a.fecha_inicio)
                                                             AND t1.dia = DAY(a.fecha_inicio)
        INNER JOIN
            LAS_CUATRO_CIFRAS.BI_dim_tiempo t2 ON t2.año = YEAR(a.fecha_fin)
                                                      AND t2.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(a.fecha_fin))
                                                      AND t2.mes = MONTH(a.fecha_fin)
                                                      AND t2.dia = DAY(a.fecha_fin)
        INNER JOIN LAS_CUATRO_CIFRAS.estado_alquiler e2 ON a.estado = e2.id_estado
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_estado_alquiler e ON e2.descripcion = e.descripcion
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateFactVenta
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_fact_venta(id_venta, id_anuncio, id_comprador,
                                                    fecha_venta, precio_venta, id_moneda,
                                                    pago, comision_inmob)
        SELECT
            v.id_venta,
            a.id_anuncio,
            c.id AS id_comprador,
            t.id_tiempo AS fecha_venta,
            v.precio_venta,
            m.id_tipo_moneda AS id_moneda,
            v.pago,
            v.comision_inmob
        FROM
            LAS_CUATRO_CIFRAS.venta v
        INNER JOIN
            LAS_CUATRO_CIFRAS.anuncio a ON v.id_anuncio = a.id_anuncio
        INNER JOIN
            LAS_CUATRO_CIFRAS.comprador c2 ON v.id_comprador = c2.id
        INNER JOIN
            LAS_CUATRO_CIFRAS.BI_dim_comprador c ON c2.nombre = c.nombre
                                                        AND c2.apellido = c.apellido
                                                        AND c2.dni = c.dni
                                                        AND c2.telefono = c.telefono
                                                        AND c2.mail = c.mail
        INNER JOIN
            LAS_CUATRO_CIFRAS.BI_dim_tiempo t ON t.año = YEAR(v.fecha_venta)
                                                     AND t.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(v.fecha_venta))
                                                     AND t.mes = MONTH(v.fecha_venta)
                                                     AND t.dia = DAY(v.fecha_venta)
        INNER JOIN
            LAS_CUATRO_CIFRAS.moneda m2 ON v.id_moneda = m2.id_moneda
        INNER JOIN
            LAS_CUATRO_CIFRAS.BI_dim_tipo_moneda m ON m2.descripcion = m.descripcion
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateFactPagoAlquiler
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_fact_pago_alquiler(id_pago_alquiler, id_alquiler, medio_pago,
                                                            num_periodo, descripcion, fecha_pago,
                                                            fecha_inicio, fecha_fin, importe)
        SELECT DISTINCT
            p.id_pago_alquiler,
            pa.id_alquiler,
            m.id_medio_pago,
            p.num_periodo,
            p.descripcion,
            t_pago.id_tiempo AS fecha_pago,
            t_inicio.id_tiempo AS fecha_inicio,
            t_fin.id_tiempo AS fecha_fin,
            p.importe
        FROM LAS_CUATRO_CIFRAS.pago_alquiler p
        INNER JOIN LAS_CUATRO_CIFRAS.BI_fact_alquiler pa on p.id_alquiler = pa.id_alquiler
        INNER JOIN LAS_CUATRO_CIFRAS.medio_pago m2 ON p.medio_pago = m2.id_medio_pago
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_medio_pago m ON m2.descripcion = m.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t_pago ON t_pago.año = YEAR(p.fecha_pago)
            AND t_pago.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(p.fecha_pago))
            AND t_pago.mes = MONTH(p.fecha_pago)
            AND t_pago.dia = DAY(p.fecha_pago)
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t_inicio ON t_inicio.año = YEAR(p.fecha_inicio)
            AND t_inicio.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(p.fecha_inicio))
            AND t_inicio.mes = MONTH(p.fecha_inicio)
            AND t_inicio.dia = DAY(p.fecha_inicio)
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_tiempo t_fin ON t_fin.año = YEAR(p.fecha_fin)
            AND t_fin.cuatrimestre = LAS_CUATRO_CIFRAS.GetCuatrimestre(MONTH(p.fecha_fin))
            AND t_fin.mes = MONTH(p.fecha_fin)
            AND t_fin.dia = DAY(p.fecha_fin)
    END
GO



CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateBridgeCaracteristicaInmueble
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_bridge_inmueble_caracteristica(id_inmueble, id_caracteristica)
        SELECT DISTINCT
            i.id_inmueble,
            c.id_caracteristica
        FROM LAS_CUATRO_CIFRAS.BI_dim_inmueble i
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_ubicacion u ON i.id_direccion = u.id_ubicacion
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_provincia p ON u.provincia = p.id_provincia
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_localidad l ON u.localidad = l.id_localidad
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_barrio b ON u.barrio = b.id_barrio
        INNER JOIN LAS_CUATRO_CIFRAS.provincia p2 ON p.descripcion = p2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.localidad l2 ON l.descripcion = l2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.barrio b2 ON b.descripcion = b2.descripcion
        INNER JOIN LAS_CUATRO_CIFRAS.direccion d ON d.provincia = p2.id_provincia
            AND d.localidad = l2.id_localidad
            AND d.barrio = b2.id_barrio
            AND d.calle = u.calle
        INNER JOIN LAS_CUATRO_CIFRAS.inmueble i2 ON i2.descripcion = i.descripcion
                                                        AND i2.id_direccion = d.id_direccion
        INNER JOIN LAS_CUATRO_CIFRAS.caracteristica c2 ON C2.id_caracteristica IN
            (SELECT DISTINCT ic.id_caracteristica
            FROM LAS_CUATRO_CIFRAS.inmueble_caracteristica ic
            INNER JOIN LAS_CUATRO_CIFRAS.caracteristica c3 ON ic.id_caracteristica = c3.id_caracteristica
            WHERE ic.id_inmueble = i2.id_inmueble)
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_caracteristica c ON c2.descripcion = c.descripcion
    END
GO

CREATE PROCEDURE LAS_CUATRO_CIFRAS.MigrateBridgeImporteAlquiler
AS
    BEGIN
        INSERT INTO LAS_CUATRO_CIFRAS.BI_bridge_importe_alquiler(id_alquiler, id_importe)
        SELECT DISTINCT
            ia.id_alquiler,
            i2.id_importe
        FROM LAS_CUATRO_CIFRAS.importe_alquiler ia
        INNER JOIN LAS_CUATRO_CIFRAS.BI_fact_alquiler a ON ia.id_alquiler = a.id_alquiler
        INNER JOIN LAS_CUATRO_CIFRAS.importe i ON ia.id_importe = i.id_importe
        INNER JOIN LAS_CUATRO_CIFRAS.BI_dim_importe i2 ON i2.precio = i.precio
                                                              AND i2.periodo_inicio = i.periodo_inicio
                                                              AND i2.periodo_fin = i.periodo_fin
    END
GO

