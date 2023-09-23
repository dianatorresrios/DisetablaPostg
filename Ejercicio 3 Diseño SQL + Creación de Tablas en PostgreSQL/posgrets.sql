-- Crear la tabla Proveedor
CREATE TABLE Proveedor (
    CódigoProveedor SERIAL PRIMARY KEY,
    Nombre VARCHAR(255),
    Dirección VARCHAR(255),
    Ciudad VARCHAR(255),
    Provincia VARCHAR(255)
);

-- Crear la tabla Categoría
CREATE TABLE Categoría (
    CódigoCategoría SERIAL PRIMARY KEY,
    NombreCategoría VARCHAR(255)
);

-- Crear la tabla Pieza
CREATE TABLE Pieza (
    CódigoPieza SERIAL PRIMARY KEY,
    Nombre VARCHAR(255),
    Color VARCHAR(255),
    Precio DECIMAL(10, 2),
    CódigoCategoría INT REFERENCES Categoría(CódigoCategoría)
);

-- Crear la tabla Suministro
CREATE TABLE Suministro (
    CódigoSuministro SERIAL PRIMARY KEY,
    CódigoPieza INT REFERENCES Pieza(CódigoPieza),
    CódigoProveedor INT REFERENCES Proveedor(CódigoProveedor),
    Cantidad INT,
    Fecha DATE
);

-- Crear la tabla Marca
CREATE TABLE Marca (
    CódigoMarca SERIAL PRIMARY KEY,
    NombreMarca VARCHAR(255)
);

-- Crear la tabla Modelo
CREATE TABLE Modelo (
    CódigoModelo SERIAL PRIMARY KEY,
    CódigoMarca INT REFERENCES Marca(CódigoMarca),
    NombreModelo VARCHAR(255),
    Precio DECIMAL(10, 2),
    Descuento DECIMAL(10, 2)
);

-- Crear la tabla Equipamiento
CREATE TABLE Equipamiento (
    CódigoEquipamiento SERIAL PRIMARY KEY,
    NombreEquipamiento VARCHAR(255)
);

-- Crear la tabla Extra
CREATE TABLE Extra (
    CódigoExtra SERIAL PRIMARY KEY,
    NombreExtra VARCHAR(255),
    PrecioExtra DECIMAL(10, 2),
    CódigoModelo INT REFERENCES Modelo(CódigoModelo)
);

-- Crear la tabla Automóvil
CREATE TABLE Automóvil (
    NúmeroBastidor VARCHAR(255) PRIMARY KEY,
    CódigoModelo INT REFERENCES Modelo(CódigoModelo)
);

-- Crear la tabla Concesionario
CREATE TABLE Concesionario (
    INEConcesionario VARCHAR(255) PRIMARY KEY,
    NombreConcesionario VARCHAR(255),
    DomicilioConcesionario VARCHAR(255)
);

-- Crear la tabla ServicioOficial
CREATE TABLE ServicioOficial (
    INEServicioOficial VARCHAR(255) PRIMARY KEY,
    NombreServicioOficial VARCHAR(255),
    DomicilioServicioOficial VARCHAR(255),
    CódigoConcesionario INT REFERENCES Concesionario(INEConcesionario)
);

-- Crear la tabla Vendedor
CREATE TABLE Vendedor (
    INEVendedor VARCHAR(255) PRIMARY KEY,
    NombreVendedor VARCHAR(255),
    DomicilioVendedor VARCHAR(255)
);

-- Crear la tabla Venta
CREATE TABLE Venta (
    NúmeroVenta SERIAL PRIMARY KEY,
    NúmeroBastidor VARCHAR(255) REFERENCES Automóvil(NúmeroBastidor),
    INEVendedor VARCHAR(255) REFERENCES Vendedor(INEVendedor),
    PrecioVenta DECIMAL(10, 2),
    ModoPago VARCHAR(255),
    FechaVenta DATE,
    Matrícula VARCHAR(255),
    EsDeStock BOOLEAN
);

-- Crear la tabla Venta_Extra
CREATE TABLE Venta_Extra (
    NúmeroVenta INT REFERENCES Venta(NúmeroVenta),
    CódigoExtra INT REFERENCES Extra(CódigoExtra)
);
