CREATE DATABASE LIBRERIA;
USE LIBRERIA;

-- Tabla CLIENTE
CREATE TABLE Cliente (
  idCliente       INT           NOT NULL AUTO_INCREMENT,  -- Línea 1: Auto‐incremental PK
  Nombre          VARCHAR(100)  NOT NULL,                -- Línea 2: Nombre obligatorio
  Apellido        VARCHAR(100)  NOT NULL,                -- Línea 3: Apellido obligatorio
  FechaNacimiento DATE          NOT NULL,                -- Línea 4: Fecha no nula
  Email           VARCHAR(100)  UNIQUE,                  -- Línea 5: Email único
  Direccion       VARCHAR(255)                  NULL,     -- Línea 6: Dirección opcional
  Telefono        VARCHAR(20)                   NULL,     -- Línea 7: Teléfono opcional
  PRIMARY KEY (idCliente)
) ENGINE=InnoDB;

-- Tabla AUTOR
CREATE TABLE Autor (
  idAutor      INT           NOT NULL AUTO_INCREMENT,
  Nombre       VARCHAR(100)  NOT NULL,
  Apellido     VARCHAR(100)  NOT NULL,
  Nacionalidad VARCHAR(50)           NULL,
  PRIMARY KEY (idAutor)
) ENGINE=InnoDB;

-- Tabla LIBRO
CREATE TABLE Libro (
  idLibro          INT           NOT NULL AUTO_INCREMENT,
  Titulo           VARCHAR(200)  NOT NULL,
  idAutor          INT           NOT NULL,              -- FK a Autor
  FechaPublicacion DATE                 NULL,
  Precio           DECIMAL(10,2)       NULL,
  PRIMARY KEY (idLibro),
  FOREIGN KEY (idAutor)
    REFERENCES Autor(idAutor)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Tabla VENTA
CREATE TABLE Venta (
  idVenta    INT           NOT NULL AUTO_INCREMENT,
  idCliente  INT           NOT NULL,                    -- FK a Cliente
  idLibro    INT           NOT NULL,                    -- FK a Libro
  FechaVenta DATE          NOT NULL,
  Cantidad   INT           NOT NULL,
  Total      DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (idVenta),
  FOREIGN KEY (idCliente)
    REFERENCES Cliente(idCliente)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  FOREIGN KEY (idLibro)
    REFERENCES Libro(idLibro)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Inserto 5 registros por tabla

-- En la tabla CLIENTE
INSERT INTO Cliente (Nombre, Apellido, FechaNacimiento, Email, Direccion, Telefono) VALUES
('Ana',   'García',    '1985-07-12', 'ana.garcia@email.com',   'Av. Siempre Viva 123', '0991234567'),
('Luis',  'Pérez',     '1990-03-05', 'luis.perez@email.com',   'Calle Falsa 456',      '0987654321'),
('María', 'Rodríguez', '1978-11-30', 'maria.rodri@email.com',   'Boulevard 789',        '0971122334'),
('Carlos','Ramírez',   '2000-01-20', 'carlos.ram@mail.com',     NULL,                   '0964455667'),
('Lucía', 'Torres',    '1995-05-15', 'lucia.torres@mail.com',   'Jirón 101',            NULL);

-- En la tabla AUTOR
INSERT INTO Autor (Nombre, Apellido, Nacionalidad) VALUES
('Gabriel', 'García Márquez', 'Colombiana'),
('Isabel',  'Allende',        'Chilena'),
('J.K.',    'Rowling',        'Británica'),
('Mario',   'Vargas Llosa',   'Peruana'),
('Ernest',  'Hemingway',      'Estadounidense');

-- En la tabla LIBRO
INSERT INTO Libro (Titulo, idAutor, FechaPublicacion, Precio) VALUES
('Cien Años de Soledad',  1, '1967-06-05', 25.50),
('La Casa de los Espíritus', 2, '1982-01-01', 22.00),
('Harry Potter y la Piedra Filosofal', 3, '1997-06-26', 30.00),
('La Ciudad y los Perros', 4, '1963-03-02', 18.75),
('El Viejo y el Mar',     5, '1952-09-01', 15.00);

-- En la tabla VENTA
INSERT INTO Venta (idCliente, idLibro, FechaVenta, Cantidad, Total) VALUES
(1, 1, '2025-05-01', 1, 25.50),
(2, 3, '2025-05-02', 2, 60.00),
(3, 2, '2025-05-03', 1, 22.00),
(4, 5, '2025-05-04', 3, 45.00),
(5, 4, '2025-05-05', 1, 18.75);

CREATE DATABASE `libreria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

