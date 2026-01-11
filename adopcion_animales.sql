-- =====================================================
-- PROYECTO: SISTEMA DE ADOPCIÓN DE ANIMALES
-- AUTOR: Giuliana Capua
-- DESCRIPCIÓN: Base de datos para gestionar adopciones
-- =====================================================

CREATE DATABASE adopcion_animales;

USE adopcion_animales;

-- =====================================================
-- TABLA: especies
-- =====================================================
CREATE TABLE especies (
    id_especie INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- =====================================================
-- TABLA: razas
-- Una especie puede tener muchas razas
-- =====================================================
CREATE TABLE razas (
    id_raza INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_especie INT NOT NULL,
    FOREIGN KEY (id_especie) REFERENCES especies(id_especie)
);

-- =====================================================
-- TABLA: refugios
-- =====================================================
CREATE TABLE refugios (
    id_refugio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    capacidad INT NOT NULL
);

-- =====================================================
-- TABLA: voluntarios
-- =====================================================
CREATE TABLE voluntarios (
    id_voluntario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    rol VARCHAR(50),
    id_refugio INT,
    FOREIGN KEY (id_refugio) REFERENCES refugios(id_refugio)
);

-- =====================================================
-- TABLA: animales
-- =====================================================
CREATE TABLE animales (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    sexo CHAR(1),
    tamanio VARCHAR(20),
    descripcion TEXT,
    fecha_rescate DATE NOT NULL,
    estado VARCHAR(30) NOT NULL,
    id_especie INT NOT NULL,
    id_raza INT,
    id_refugio INT NOT NULL,
    FOREIGN KEY (id_especie) REFERENCES especies(id_especie),
    FOREIGN KEY (id_raza) REFERENCES razas(id_raza),
    FOREIGN KEY (id_refugio) REFERENCES refugios(id_refugio)
);

-- =====================================================
-- TABLA: veterinarios
-- =====================================================
CREATE TABLE veterinarios (
    id_veterinario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    matricula VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    especialidad VARCHAR(100)
);

-- =====================================================
-- TABLA: controles_veterinarios
-- Un animal puede tener muchos controles
-- =====================================================
CREATE TABLE controles_veterinarios (
    id_control INT AUTO_INCREMENT PRIMARY KEY,
    id_animal INT NOT NULL,
    id_veterinario INT NOT NULL,
    fecha DATE NOT NULL,
    diagnostico TEXT,
    tratamiento TEXT,
    observaciones TEXT,
    FOREIGN KEY (id_animal) REFERENCES animales(id_animal),
    FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id_veterinario)
);

-- =====================================================
-- TABLA: adoptantes
-- =====================================================
CREATE TABLE adoptantes (
    id_adoptante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(20) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(200),
    fecha_alta DATE NOT NULL
);

-- =====================================================
-- TABLA: solicitudes_adopcion
-- =====================================================
CREATE TABLE solicitudes_adopcion (
    id_solicitud INT AUTO_INCREMENT PRIMARY KEY,
    id_adoptante INT NOT NULL,
    id_animal INT NOT NULL,
    fecha_solicitud DATE NOT NULL,
    estado VARCHAR(30) NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (id_adoptante) REFERENCES adoptantes(id_adoptante),
    FOREIGN KEY (id_animal) REFERENCES animales(id_animal)
);

-- =====================================================
-- TABLA: seguimiento_post_adopcion
-- =====================================================
CREATE TABLE seguimiento_post_adopcion (
    id_seguimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_solicitud INT NOT NULL,
    fecha_visita DATE NOT NULL,
    estado_animal VARCHAR(50),
    observaciones TEXT,
    FOREIGN KEY (id_solicitud) REFERENCES solicitudes_adopcion(id_solicitud)
);

-- =====================================================
-- TABLA: donaciones
-- =====================================================
CREATE TABLE donaciones (
    id_donacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_donante VARCHAR(100),
    monto DECIMAL(10,2) NOT NULL,
    fecha DATE NOT NULL,
    medio_pago VARCHAR(50),
    observaciones TEXT
);

-- ================================
-- DATOS: especies
-- ================================
INSERT INTO especies (nombre) VALUES ('Perro');
INSERT INTO especies (nombre) VALUES ('Gato');
INSERT INTO especies (nombre) VALUES ('Conejo');
INSERT INTO especies (nombre) VALUES ('Ave');

-- ================================
-- DATOS: razas
-- ================================
INSERT INTO razas (nombre, id_especie) VALUES ('Labrador', 1);
INSERT INTO razas (nombre, id_especie) VALUES ('Golden Retriever', 1);
INSERT INTO razas (nombre, id_especie) VALUES ('Caniche', 1);
INSERT INTO razas (nombre, id_especie) VALUES ('Mestizo', 1);

INSERT INTO razas (nombre, id_especie) VALUES ('Siames', 2);
INSERT INTO razas (nombre, id_especie) VALUES ('Persa', 2);
INSERT INTO razas (nombre, id_especie) VALUES ('Mestizo', 2);

INSERT INTO razas (nombre, id_especie) VALUES ('Enano', 3);
INSERT INTO razas (nombre, id_especie) VALUES ('Cabeza de leon', 3);

-- ================================
-- DATOS: refugios
-- ================================
INSERT INTO refugios (nombre, direccion, telefono, email, capacidad)
VALUES ('Huellitas Felices', 'Av. Siempre Viva 123', '1122334455', 'contacto@huellitas.com', 50);

INSERT INTO refugios (nombre, direccion, telefono, email, capacidad)
VALUES ('Patitas al Rescate', 'Calle Falsa 456', '1199887766', 'info@patitas.org', 35);

INSERT INTO refugios (nombre, direccion, telefono, email, capacidad)
VALUES ('Refugio Norte', 'Ruta 8 Km 45', '1144556677', 'norte@refugio.com', 40);

-- ================================
-- DATOS: voluntarios
-- ================================
INSERT INTO voluntarios (nombre, telefono, email, rol, id_refugio)
VALUES ('Ana Lopez', '1133445566', 'ana@gmail.com', 'Cuidadora', 1);

INSERT INTO voluntarios (nombre, telefono, email, rol, id_refugio)
VALUES ('Juan Perez', '1166778899', 'juan@gmail.com', 'Rescatista', 1);

INSERT INTO voluntarios (nombre, telefono, email, rol, id_refugio)
VALUES ('María Gomez', '1144221100', 'maria@gmail.com', 'Administracion', 2);

INSERT INTO voluntarios (nombre, telefono, email, rol, id_refugio)
VALUES ('Lucas Diaz', '1155667788', 'lucas@gmail.com', 'Cuidador', 3);

-- ================================
-- DATOS: animales
-- ================================
INSERT INTO animales
(nombre, edad, sexo, tamanio, descripcion, fecha_rescate, estado, id_especie, id_raza, id_refugio)
VALUES
('Rocky', 3, 'M', 'Grande', 'Muy jugueton y sociable', '2024-01-10', 'Disponible', 1, 1, 1);

INSERT INTO animales
(nombre, edad, sexo, tamanio, descripcion, fecha_rescate, estado, id_especie, id_raza, id_refugio)
VALUES
('Luna', 2, 'H', 'Mediano', 'Tranquila y cariñosa', '2024-02-05', 'Disponible', 1, 4, 1);

INSERT INTO animales
(nombre, edad, sexo, tamanio, descripcion, fecha_rescate, estado, id_especie, id_raza, id_refugio)
VALUES
('Milo', 1, 'M', 'Pequeño', 'Gato curioso', '2024-03-12', 'En tratamiento', 2, 5, 2);

INSERT INTO animales
(nombre, edad, sexo, tamanio, descripcion, fecha_rescate, estado, id_especie, id_raza, id_refugio)
VALUES
('Nina', 4, 'H', 'Mediano', 'Muy dócil', '2023-12-20', 'Adoptado', 1, 2, 3);

INSERT INTO animales
(nombre, edad, sexo, tamanio, descripcion, fecha_rescate, estado, id_especie, id_raza, id_refugio)
VALUES
('Simba', 5, 'M', 'Pequeño', 'Independiente', '2023-11-15', 'Disponible', 2, 7, 2);

-- ================================
-- DATOS: veterinarios
-- ================================
INSERT INTO veterinarios (nombre, matricula, telefono, especialidad)
VALUES ('Dr. Carlos Ruiz', 'MAT-123', '1144558899', 'Clinica General');

INSERT INTO veterinarios (nombre, matricula, telefono, especialidad)
VALUES ('Dra. Laura Martinez', 'MAT-456', '1166772211', 'Dermatologia');

INSERT INTO veterinarios (nombre, matricula, telefono, especialidad)
VALUES ('Dr. Pablo Sanchez', 'MAT-789', '1133998844', 'Cirugia');

-- ================================
-- DATOS: controles_veterinarios
-- ================================
INSERT INTO controles_veterinarios
(id_animal, id_veterinario, fecha, diagnostico, tratamiento, observaciones)
VALUES
(1, 1, '2024-01-15', 'Buen estado general', 'Control de rutina', 'Sin observaciones');

INSERT INTO controles_veterinarios
(id_animal, id_veterinario, fecha, diagnostico, tratamiento, observaciones)
VALUES
(3, 2, '2024-03-15', 'Alergia en piel', 'Medicacion oral', 'Requiere seguimiento');

INSERT INTO controles_veterinarios
(id_animal, id_veterinario, fecha, diagnostico, tratamiento, observaciones)
VALUES
(3, 3, '2024-03-25', 'Evolucion favorable', 'Continuar tratamiento', 'Mejora visible');

-- ================================
-- DATOS: adoptantes
-- ================================
INSERT INTO adoptantes
(nombre, dni, telefono, email, direccion, fecha_alta)
VALUES
('Sofia Alvarez', '30111222', '1133449988', 'sofia@gmail.com', 'Av. Rivadavia 1000', '2024-02-01');

INSERT INTO adoptantes
(nombre, dni, telefono, email, direccion, fecha_alta)
VALUES
('Martin Lopez', '28999888', '1144667799', 'martin@gmail.com', 'Calle San Martin 455', '2024-02-10');

INSERT INTO adoptantes
(nombre, dni, telefono, email, direccion, fecha_alta)
VALUES
('Lucia Fernandez', '33444555', '1155889911', 'lucia@gmail.com', 'Belgrano 789', '2024-03-05');

-- ================================
-- DATOS: solicitudes_adopcion
-- ================================
INSERT INTO solicitudes_adopcion
(id_adoptante, id_animal, fecha_solicitud, estado, observaciones)
VALUES
(1, 1, '2024-02-15', 'Pendiente', 'Primera solicitud');

INSERT INTO solicitudes_adopcion
(id_adoptante, id_animal, fecha_solicitud, estado, observaciones)
VALUES
(2, 4, '2024-01-05', 'Aprobada', 'Cumple con todos los requisitos');

INSERT INTO solicitudes_adopcion
(id_adoptante, id_animal, fecha_solicitud, estado, observaciones)
VALUES
(3, 3, '2024-03-20', 'Rechazada', 'No cumple condiciones');

-- ================================
-- DATOS: seguimiento_post_adopcion
-- ================================
INSERT INTO seguimiento_post_adopcion
(id_solicitud, fecha_visita, estado_animal, observaciones)
VALUES
(2, '2024-02-01', 'Buen estado', 'Animal bien adaptado');

INSERT INTO seguimiento_post_adopcion
(id_solicitud, fecha_visita, estado_animal, observaciones)
VALUES
(2, '2024-03-01', 'Excelente', 'Sin problemas');

-- ================================
-- DATOS: donaciones
-- ================================
INSERT INTO donaciones
(nombre_donante, monto, fecha, medio_pago, observaciones)
VALUES
('Carlos Gomez', 5000.00, '2024-01-20', 'Transferencia', 'Donacion mensual');

INSERT INTO donaciones
(nombre_donante, monto, fecha, medio_pago, observaciones)
VALUES
('Empresa XYZ', 20000.00, '2024-02-10', 'Cheque', 'Ayuda solidaria');

INSERT INTO donaciones
(nombre_donante, monto, fecha, medio_pago, observaciones)
VALUES
('Anonimo', 3000.00, '2024-03-05', 'Efectivo', NULL);

-- Buscar un animal por ID
SELECT * FROM animales WHERE id_animal = 1;

-- Buscar adoptante por nombre exacto
SELECT *FROM adoptantes WHERE nombre = 'Sofia Alvarez';

-- Buscar animales por nombre
SELECT * FROM animales WHERE nombre LIKE '%na%';

-- Listar todos los animales
SELECT * FROM animales;

-- Listar animales ordenados por fecha de rescate
SELECT * FROM animales ORDER BY fecha_rescate DESC;

-- Animales con su especie y raza
SELECT a.nombre AS animal,
       e.nombre AS especie,
       r.nombre AS raza
FROM animales a
JOIN especies e ON a.id_especie = e.id_especie
LEFT JOIN razas r ON a.id_raza = r.id_raza;

-- Animales por refugio
SELECT r.nombre AS refugio,
       a.nombre AS animal,
       a.estado
FROM animales a
JOIN refugios r ON a.id_refugio = r.id_refugio
ORDER BY r.nombre;

-- Solicitudes con datos del adoptante y animal
SELECT s.id_solicitud,
       ad.nombre AS adoptante,
       an.nombre AS animal,
       s.estado,
       s.fecha_solicitud
FROM solicitudes_adopcion s
JOIN adoptantes ad ON s.id_adoptante = ad.id_adoptante
JOIN animales an ON s.id_animal = an.id_animal;

-- Controles veterinarios de un animal
SELECT a.nombre AS animal,
       v.nombre AS veterinario,
       c.fecha,
       c.diagnostico
FROM controles_veterinarios c
JOIN animales a ON c.id_animal = a.id_animal
JOIN veterinarios v ON c.id_veterinario = v.id_veterinario
WHERE a.id_animal = 3;

-- Donaciones ordenadas por monto
SELECT * FROM donaciones ORDER BY monto DESC;

-- Animales disponibles para adopción
SELECT * FROM animales WHERE estado = 'Disponible';

-- Animales adoptados
SELECT * FROM animales WHERE estado = 'Adoptado';

-- Solicitudes por estado
SELECT estado, COUNT(*) AS cantidad FROM solicitudes_adopcion GROUP BY estado;

-- Adoptantes con más de una solicitud
SELECT ad.nombre,
       COUNT(s.id_solicitud) AS total_solicitudes
FROM adoptantes ad
JOIN solicitudes_adopcion s ON ad.id_adoptante = s.id_adoptante
GROUP BY ad.nombre
HAVING COUNT(s.id_solicitud) > 1;

-- Refugio con mayor cantidad de animales
SELECT r.nombre, COUNT(a.id_animal) AS total_animales FROM refugios r JOIN animales a ON r.id_refugio = a.id_refugio 
GROUP BY r.nombre ORDER BY total_animales DESC;

-- Veterinario con más controles realizados
SELECT v.nombre, COUNT(c.id_control) AS total_controles FROM veterinarios v
JOIN controles_veterinarios c ON v.id_veterinario = c.id_veterinario GROUP BY v.nombre ORDER BY total_controles DESC;

-- Donaciones en un rango de fechas
SELECT * FROM donaciones WHERE fecha BETWEEN '2024-01-01' AND '2024-02-28';

-- Animales sin controles veterinarios
SELECT a.* FROM animales a 
LEFT JOIN controles_veterinarios c ON a.id_animal = c.id_animal 
WHERE c.id_control IS NULL;

-- Solicitudes aprobadas sin seguimiento
SELECT s.* FROM solicitudes_adopcion s 
LEFT JOIN seguimiento_post_adopcion sp ON s.id_solicitud = sp.id_solicitud 
WHERE s.estado = 'Aprobada' AND sp.id_seguimiento IS NULL;

-- Animales adoptados sin solicitud aprobada
SELECT a.* fROM animales a LEFT JOIN solicitudes_adopcion s  ON a.id_animal = s.id_animal AND s.estado = 'Aprobada' 
WHERE a.estado = 'Adoptado' AND s.id_solicitud IS NULL;

-- Adoptantes sin solicitudes
SELECT ad.* FROM adoptantes ad 
LEFT JOIN solicitudes_adopcion s ON ad.id_adoptante = s.id_adoptante WHERE s.id_solicitud IS NULL;

-- Animales con estado inconsistente
SELECT a.id_animal,
       a.nombre,
       a.estado,
       s.estado AS estado_solicitud
FROM animales a
JOIN solicitudes_adopcion s ON a.id_animal = s.id_animal
WHERE a.estado = 'Disponible'
  AND s.estado = 'Aprobada';