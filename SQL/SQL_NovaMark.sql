-- Creación de Base de Datos
CREATE DATABASE CadenaRetail;
USE CadenaRetail;

-- Tabla Sucursal
CREATE TABLE Sucursal (
    ID_Sucursal INT PRIMARY KEY IDENTITY(1,1),
    Direccion VARCHAR(255),
    Correo VARCHAR(100),
    Telefono VARCHAR(20),
    Horario_Apertura TIME,
    Horario_Cierre TIME
);

-- Tabla Horario_Empleado
CREATE TABLE Horario_Empleado (
    ID_Horario INT PRIMARY KEY IDENTITY(1,1),
    Descripcion VARCHAR(100),
    Hora_Entrada TIME,
    Hora_Salida TIME
);

-- Tabla Cargo
CREATE TABLE Cargo (
	ID_Cargo INT PRIMARY KEY IDENTITY(1,1),
	Descripcion VARCHAR(255),
	);

-- Tabla Empleados
CREATE TABLE Empleados (
    ID_Empleado INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Apellidos VARCHAR(100),
    Telefono VARCHAR(50),
    Correo VARCHAR(100),
    Direccion VARCHAR(255),
    Cargo VARCHAR(50),
	ID_Cargo INT,
    ID_Horario INT,
    ID_Sucursal INT,
	FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo),
    FOREIGN KEY (ID_Horario) REFERENCES Horario_Empleado(ID_Horario),
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal)
);

-- Tabla Modulo
CREATE TABLE Modulo (
    ID_Modulo INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Modulo VARCHAR(50)
);

-- Tabla Acceso
CREATE TABLE Acceso (
    Activo BIT,
    ID_Empleado INT,
    ID_Modulo INT,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado),
    FOREIGN KEY (ID_Modulo) REFERENCES Modulo(ID_Modulo)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Apellidos VARCHAR(100),
    Telefono VARCHAR(20),
    Correo VARCHAR(100),
	Genero VARCHAR(100),
    Direccion VARCHAR(255),
    Puntos_Disponibles INT,
    Miembro VARCHAR(50)
);

-- Tabla Producto
CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(500),
    Descripcion TEXT,
	Marca VARCHAR(255),
    Subcategoria VARCHAR(255),
	Etiquetas VARCHAR(255),
    Precio_Unitario INT
);


-- Tabla Facturacion
CREATE TABLE Facturacion (
    ID_Factura INT PRIMARY KEY IDENTITY(1,1),
	Precio_Total INT,
    ID_Empleado INT,
    ID_Cliente INT,
    Fecha_Facturacion DATETIME,
    Metodo_Pago VARCHAR(50),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Tabla Detalle_Venta
CREATE TABLE Detalle_Venta (
    ID_Detalle_Venta INT PRIMARY KEY IDENTITY(1,1),
    ID_Factura INT,
    ID_Producto INT,
    Cantidad_Vendida INT,
    Precio_Unitario DECIMAL(10,2),
    FOREIGN KEY (ID_Factura) REFERENCES Facturacion(ID_Factura),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Tipo_Movimiento
CREATE TABLE Tipo_Movimiento (
    ID_Tipo_Movimiento INT PRIMARY KEY IDENTITY(1,1),
    Descripcion VARCHAR(100)
);

-- Tabla Movimiento_Inventario
CREATE TABLE Movimiento_Inventario (
    ID_Inventario INT PRIMARY KEY IDENTITY(1,1),
    Cantidad_Producto INT,
    ID_Tipo_Movimiento INT,
    Fecha_Hora DATETIME,
    ID_Sucursal INT,
    ID_Producto INT,
    FOREIGN KEY (ID_Tipo_Movimiento) REFERENCES Tipo_Movimiento(ID_Tipo_Movimiento),
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

