-- Crear la base de datos y seleccionarla
CREATE DATABASE IF NOT EXISTS computadores_db;
USE computadores_db;

-- Crear la tabla de computadores
CREATE TABLE IF NOT EXISTS computadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    procesador VARCHAR(100) NOT NULL,
    ram INT NOT NULL, -- En GB
    almacenamiento VARCHAR(50) NOT NULL -- HDD o SSD con capacidad
);

-- Crear la tabla de periféricos
CREATE TABLE IF NOT EXISTS perifericos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL, -- Ejemplo: Teclado, Ratón, Monitor
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    conexion VARCHAR(50) NOT NULL -- USB, Bluetooth, etc.
);

-- Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Crear la tabla de asignaciones
CREATE TABLE IF NOT EXISTS asignaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    computador_id INT,
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (computador_id) REFERENCES computadores(id) ON DELETE CASCADE
);

-- Crear la tabla de reparaciones
CREATE TABLE IF NOT EXISTS reparaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    computador_id INT,
    fecha_reparacion DATE NOT NULL,
    descripcion TEXT NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (computador_id) REFERENCES computadores(id) ON DELETE CASCADE
);

-- Insertar datos en la tabla de computadores
INSERT INTO computadores (marca, modelo, procesador, ram, almacenamiento) VALUES
('Dell', 'Inspiron 15', 'Intel Core i5', 8, 'SSD 512GB'),
('HP', 'Pavilion', 'AMD Ryzen 7', 16, 'HDD 1TB'),
('Lenovo', 'ThinkPad', 'Intel Core i7', 32, 'SSD 1TB');

-- Insertar datos en la tabla de periféricos
INSERT INTO perifericos (tipo, marca, modelo, conexion) VALUES
('Teclado', 'Logitech', 'K380', 'Bluetooth'),
('Ratón', 'Razer', 'DeathAdder', 'USB'),
('Monitor', 'Samsung', 'Curved 27"', 'HDMI');

-- Insertar datos en la tabla de usuarios
INSERT INTO usuarios (nombre, email) VALUES
('Juan Pérez', 'juan@example.com'),
('Ana Gómez', 'ana@example.com');

-- Insertar datos en la tabla de asignaciones
INSERT INTO asignaciones (usuario_id, computador_id, fecha_asignacion) VALUES
(1, 1, '2025-03-18'),
(2, 2, '2025-03-18');

-- Insertar datos en la tabla de reparaciones
INSERT INTO reparaciones (computador_id, fecha_reparacion, descripcion, costo) VALUES
(1, '2025-03-10', 'Cambio de disco duro', 120.50);
