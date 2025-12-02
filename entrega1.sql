CREATE DATABASE tienda_de_ropa;
USE tienda_de_ropa;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    fecha_nacimiento DATE
);

INSERT INTO usuarios (nombre, apellido, email, password, telefono, direccion, fecha_nacimiento) VALUES
('Carlos', 'Ramírez', 'carlosr@example.com', 'car123', '3516001111', 'Av. Colón 450', '1988-03-12'),
('Lucía', 'Martínez', 'lmartinez@example.com', 'lucia2024', '3517002222', 'B° Nueva Córdoba 1200', '1992-11-05'),
('Mateo', 'Fernández', 'mateof@example.com', 'm1234', '3518003333', 'Belgrano 890', '2000-07-18'),
('Sofía', 'López', 'sofial@example.com', 'sofia456', '3519004444', 'Ruta 20 km 5', '1999-02-25'),
('María', 'Torres', 'mariatorres@example.com', 'mt123', '3519559876', 'San Martín 450', '1985-09-30'),
('Tomás', 'Aguirre', 'taguirre@example.com', 'tomi321', '3517665544', 'Cañada 600', '1997-06-08'),
('Valentina', 'Barrios', 'valeb@example.com', 'valevale', '3517001299', 'Dean Funes 350', '2001-12-14'),
('Joaquín', 'Suárez', 'joaquis@example.com', 'joaquin789', '3514556677', 'B° Alta Córdoba 215', '1994-10-01'),
('Camila', 'Pereyra', 'cami.p@example.com', 'camila22', '3515123498', 'Sarmiento 999', '1998-04-11'),
('Diego', 'Castro', 'diegoc@example.com', 'dieguito', '3513224567', 'Av. Sabattini 1400', '1989-08-22'),
('Florencia', 'Molina', 'florm@example.com', 'flor123', '3519123456', 'Maipú 300', '1993-03-15'),
('Ariel', 'Domínguez', 'adominguez@example.com', 'ariel321', '3516998877', 'B° Centro 456', '1987-09-27'),
('Paula', 'Sánchez', 'paulas@example.com', 'paula001', '3517889955', 'Ituzaingó 780', '1996-12-02'),
('Nahuel', 'Paz', 'nahuelp@example.com', 'npaz55', '3514559900', 'Chacabuco 900', '1991-05-20'),
('Elena', 'Carrizo', 'elenac@example.com', 'elena78', '3516782345', 'Artigas 120', '1984-07-09');

INSERT INTO usuarios (nombre, apellido, email, password, telefono, direccion, fecha_nacimiento)
VALUES ('Nuevo', 'Usuario', 'nuevo@example.com', '123456', '3513000000', 'Calle Nueva 100', '2002-10-10');

SELECT id, nombre, apellido, email
FROM usuarios
WHERE email = 'carlosr@example.com' AND password = 'car123';

SELECT *
FROM usuarios
WHERE id = 1;

UPDATE usuarios
SET telefono = '3517777777',
    direccion = 'Nueva Dirección 890'
WHERE id = 1;

UPDATE usuarios
SET password = 'nuevaPassword123'
WHERE id = 1;

DELETE FROM usuarios
WHERE id = 1;

UPDATE usuarios
SET telefono = NULL,
    direccion = NULL
WHERE id = 2;
