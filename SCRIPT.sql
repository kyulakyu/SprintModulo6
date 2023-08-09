CREATE DATABASE prevencion_riesgos;
USE prevencion_riesgos;

-- Tabla "Usuarios"
CREATE TABLE Usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  tipo ENUM('Cliente', 'Administrativo', 'Profesional') NOT NULL
);

-- Tabla "Capacitaciones"
CREATE TABLE Capacitaciones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  detalle TEXT
);

-- Tabla "Visitas"
CREATE TABLE Visitas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  fecha_visita DATE,
  detalle TEXT,
  profesional_id INT,
  FOREIGN KEY (cliente_id) REFERENCES Usuarios(id),
  FOREIGN KEY (profesional_id) REFERENCES Usuarios(id)
);

-- Tabla "Chequeos"
CREATE TABLE Chequeos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  visita_id INT,
  detalle TEXT,
  estado ENUM('Pendiente', 'Completado'),
  FOREIGN KEY (visita_id) REFERENCES Visitas(id)
);

-- Tabla "Pagos"
CREATE TABLE Pagos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  monto DECIMAL(10,2),
  fecha_pago DATE,
  FOREIGN KEY (cliente_id) REFERENCES Usuarios(id)
);

-- Tabla "Asesorias"
CREATE TABLE Asesorias (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  detalle TEXT,
  profesional_id INT,
  FOREIGN KEY (profesional_id) REFERENCES Usuarios(id)
);

-- Tabla "Accidentes"
CREATE TABLE Accidentes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  fecha_accidente DATE,
  detalle TEXT,
  FOREIGN KEY (cliente_id) REFERENCES Usuarios(id)
);

-- Tabla "Asistentes"
CREATE TABLE Asistentes (
  capacitacion_id INT,
  usuario_id INT,
  FOREIGN KEY (capacitacion_id) REFERENCES Capacitaciones(id),
  FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
  PRIMARY KEY (capacitacion_id, usuario_id)
);

ALTER TABLE capacitaciones
ADD rut int,
ADD dia VARCHAR (10),
ADD hora VARCHAR (6),
ADD lugar VARCHAR (50),
ADD duracion VARCHAR (50),
ADD cantidad INT;
ALTER TABLE usuarios
ADD fechaNacimiento VARCHAR (20),
ADD run int;

ALTER TABLE usuarios
ADD rut int,
ADD nombres VARCHAR (100),
ADD apellidos VARCHAR (100),
ADD telefono int,
ADD afp VARCHAR (50),
ADD sistemaDeSalud VARCHAR (100),
ADD direccion VARCHAR (100),
ADD comuna VARCHAR (100),
ADD edad int;

ALTER TABLE usuarios
ADD area VARCHAR (100),
ADD experienciaPrevia VARCHAR (100);

ALTER TABLE usuarios
ADD titulo VARCHAR (100),
ADD fechaDeIngreso VARCHAR (100);

INSERT INTO usuarios (id, nombre, tipo, fechaNacimiento, run, area, experienciaPrevia)
VALUES 
   (DEFAULT, 'Juan Pérez', 'Administrativo', '10/03/1985', '12345678', 'Ventas', '5 años'),
   (DEFAULT, 'María Rodríguez', 'Administrativo', '25/07/1990', '11223334', 'Atención al Cliente', '5 años'),
   (DEFAULT, 'Carlos Gómez', 'Administrativo', '05/11/1988', '44567890', 'Recursos Humanos', '8 años'),
   (DEFAULT, 'Ana López', 'Administrativo', '15/01/1995', '33210987', 'Atención al Cliente', '3 años'),
   (DEFAULT, 'Roberto Fernández', 'Administrativo', '02/09/1980', '99876543', 'Finanzas', '12 años');
INSERT INTO usuarios (id, nombre, tipo, fechaNacimiento, run, titulo, fechaDeIngreso)
VALUES 
   (DEFAULT, 'Laura Méndez', 'Profesional', '12/06/1992', '74563218', 'Ingeniero de Sistemas', '01/09/2016'),
   (DEFAULT, 'Pedro Soto', 'Profesional', '05/02/1987', '55987432', 'Abogado Corporativo', '15/03/2010'),
   (DEFAULT, 'Carolina Ramírez', 'Profesional', '28/11/1990', '22331144', 'Psicóloga Clínica', '10/07/2014'),
   (DEFAULT, 'Miguel López', 'Profesional', '18/04/1984', '99887766', 'Arquitecto', '22/11/2009'),
   (DEFAULT, 'Patricia Gómez', 'Profesional', '02/09/1988', '33669988', 'Diseñador Gráfico', '05/06/2012');
INSERT INTO usuarios (id, nombre, tipo, fechaNacimiento, run, rut, nombres, apellidos, telefono, afp, sistemaDeSalud, direccion, comuna, edad) 
VALUES 
   (DEFAULT, 'Marcela Vargas', 'Cliente', '15/09/1990', '12345678', '11223344', 'Marcela Antonia', 'Vargas Pérez', 98765432, 'AFP Provida','fonasa', 'Av. Libertador Bernardo O\'Higgins 123', 'Santiago', 32),
   (DEFAULT, 'Andrés Rojas', 'Cliente', '28/07/1985', '98765432', '66554433', 'Andrés Felipe', 'Rojas Soto', 56987653, 'AFP Habitat', 'fonasa', 'Calle Los Alamos 456', 'Viña del Mar', 37),
   (DEFAULT, 'Carolina Valenzuela', 'Cliente', '02/03/1982', '11223344', '77665544', 'Carolina Alejandra', 'Valenzuela Torres', 91234567, 'AFP Modelo', 'isapre', 'Pasaje Los Pinos 789', 'Concepción', 41),
   (DEFAULT, 'Juan Torres', 'Cliente', '10/12/1995', '17894532', '88332211', 'Juan Alberto', 'Torres Gómez', 66677788, 'AFP Cuprum', 'isapre', 'Calle Los Laureles 1001', 'La Serena', 28),
   (DEFAULT, 'Eduardo Díaz', 'Cliente', '20/04/1988', '15465789', '99887744', 'Eduardo Antonio', 'Díaz Ramírez', 55544433, 'AFP PlanVital', 'fonasa', 'Av. Los Cerezos 4321', 'Antofagasta', 35);

INSERT INTO capacitaciones (id, nombre, detalle, rut, dia, hora, lugar, duracion, cantidad)
VALUES
   (DEFAULT, 'Taller de Comunicación Efectiva', 'Aprende a comunicarte de manera clara y asertiva.', '11223344', '20/07/2023', '10:00', 'Sala de conferencias A', '2 horas', 30),
   (DEFAULT, 'Curso de Gestión del Tiempo', 'Optimiza tu productividad y aprende a administrar tu tiempo.', '99887766', '05/08/2023', '14:30', 'Aula 203', '3 horas', 25),
   (DEFAULT, 'Seminario de Liderazgo', 'Descubre habilidades para ser un líder eficiente.', '22331144', '12/09/2023', '09:00', 'Salón de eventos principal', '4 horas', 50),
   (DEFAULT, 'Taller de Resolución de Conflictos', 'Aprende estrategias para resolver conflictos laborales.', '77665544', '18/10/2023', '16:00', 'Sala de reuniones 3B', '2 horas', 20),
   (DEFAULT, 'Curso de Primeros Auxilios', 'Conoce técnicas básicas de primeros auxilios.', '99887744', '07/11/2023', '11:00', 'Centro de capacitación médica', '6 horas', 40);

CREATE USER 'modulo5'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON prevencion_riesgos.* TO 'modulo5'@'localhost';
SELECT User FROM mysql.user;

CREATE TABLE prevencion_riesgos.login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email  VARCHAR(100),
    rol   VARCHAR(255)
);

insert into login (user, password, email, rol)
values ('administrativo', '$2a$10$DUhPTVFdJV.bRmxjQFUabe7A5bQT4ETb0j8BMKd5oBPonT4RBjhoa', '', 'ROLE_administrativo'),
('cliente', '$2a$10$qiy/hp5tlOv5/.ku.5byY.hcC8rHs0M907wirqRinbjSmgzIUlm8q', '', 'ROLE_cliente');


CREATE TABLE Clientes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  tipo ENUM('Cliente', 'Administrativo', 'Profesional') NOT NULL,
  fechaNacimiento VARCHAR(20),
  run INT,
  rut INT,
  nombres VARCHAR(100),
  apellidos VARCHAR(100),
  telefono INT,
  afp VARCHAR(50),
  sistemaDeSalud VARCHAR(100),
  direccion VARCHAR(200),
  comuna VARCHAR(100),
  edad INT,
  FOREIGN KEY (id) REFERENCES Usuarios(id)
);

CREATE TABLE Administrativos (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  tipo ENUM('Cliente', 'Administrativo', 'Profesional') NOT NULL,
  fechaNacimiento VARCHAR(20),
  run INT,
  area VARCHAR(100),
  experienciaPrevia VARCHAR(100),
  FOREIGN KEY (id) REFERENCES Usuarios(id)
);

CREATE TABLE Profesionales (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  tipo ENUM('Cliente', 'Administrativo', 'Profesional') NOT NULL,
  fechaNacimiento VARCHAR(20),
  run INT,
  titulo VARCHAR(100),
  fechaDeIngreso VARCHAR(100),
  FOREIGN KEY (id) REFERENCES Usuarios(id)
);

-- Insertar datos en las nuevas tablas

-- Clientes
INSERT INTO Clientes (id, nombre, tipo, fechaNacimiento, run, rut, nombres, apellidos, telefono, afp, sistemaDeSalud, direccion, comuna, edad)
SELECT id, nombre, tipo, fechaNacimiento, run, rut, nombres, apellidos, telefono, afp, sistemaDeSalud, direccion, comuna, edad
FROM Usuarios
WHERE tipo = 'Cliente';

-- Administrativos
INSERT INTO Administrativos (id, nombre, tipo, fechaNacimiento, run, area, experienciaPrevia)
SELECT id, nombre, tipo, fechaNacimiento, run, area, experienciaPrevia
FROM Usuarios
WHERE tipo = 'Administrativo';

-- Profesionales
INSERT INTO Profesionales (id, nombre, tipo, fechaNacimiento, run, titulo, fechaDeIngreso)
SELECT id, nombre, tipo, fechaNacimiento, run, titulo, fechaDeIngreso
FROM Usuarios
WHERE tipo = 'Profesional';


DELIMITER //
-- Trigger para insertar en la tabla Clientes
CREATE TRIGGER after_insert_usuario_clientes
AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
  IF NEW.tipo = 'Cliente' THEN
    INSERT INTO Clientes (id, nombre, tipo, fechaNacimiento, run, rut, nombres, apellidos, telefono, afp, sistemaDeSalud, direccion, comuna, edad)
    VALUES (NEW.id, NEW.nombre, NEW.tipo, NEW.fechaNacimiento, NEW.run, NEW.rut, NEW.nombres, NEW.apellidos, NEW.telefono, NEW.afp, NEW.sistemaDeSalud, NEW.direccion, NEW.comuna, NEW.edad);
  END IF;
END;
//

-- Trigger para insertar en la tabla Administrativos
CREATE TRIGGER after_insert_usuario_administrativos
AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
  IF NEW.tipo = 'Administrativo' THEN
    INSERT INTO Administrativos (id, nombre, tipo, fechaNacimiento, run, area, experienciaPrevia)
    VALUES (NEW.id, NEW.nombre, NEW.tipo, NEW.fechaNacimiento, NEW.run, NEW.area, NEW.experienciaPrevia);
  END IF;
END;
//

-- Trigger para insertar en la tabla Profesionales
CREATE TRIGGER after_insert_usuario_profesionales
AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
  IF NEW.tipo = 'Profesional' THEN
    INSERT INTO Profesionales (id, nombre, tipo, fechaNacimiento, run, titulo, fechaDeIngreso)
    VALUES (NEW.id, NEW.nombre, NEW.tipo, NEW.fechaNacimiento, NEW.run, NEW.titulo, NEW.fechaDeIngreso);
  END IF;
END;
//

-- Restaurar el delimitador predeterminado
DELIMITER ;

ALTER TABLE Usuarios ADD COLUMN DTYPE VARCHAR(50) NOT NULL DEFAULT 'Cliente';
ALTER TABLE Clientes MODIFY COLUMN edad INT NULL;

-- Seba
UPDATE Usuarios SET DTYPE = tipo;

ALTER TABLE prevencion_riesgos.visitas
MODIFY fecha_visita VARCHAR(10);

ALTER TABLE prevencion_riesgos.visitas
ADD visitaRealizada BOOLEAN;

insert into prevencion_riesgos.login (user, password, email, rol)
values ('profesional', '$2a$10$z5hjUJNJK4wXQlDPuS24Ouo9.GX189BE1lTXx2l1.awto/9PQb3lu', '', 'ROLE_profesional');

INSERT INTO visitas (cliente_id, fecha_visita, detalle, profesional_id, visitaRealizada)
VALUES
    (11, '01/08/2023', 'Visita de seguimiento', 6, True),
    (12, '15/07/2023', 'Consulta médica', 7, True),
    (13, '10/06/2023', 'Sesión de terapia', 8, True),
    (14, '05/08/2023', 'Evaluación nutricional', 9, True),
    (15, '27/09/2023', 'Revisión dental', 10, False);
    
-- Cami Contacto
CREATE TABLE Contacto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    comentario VARCHAR (50) NOT NULL
);

-- Sabi pagos
ALTER TABLE pagos
ADD detalle VARCHAR(100);

INSERT INTO pagos (id, cliente_id, monto, fecha_pago, detalle) 
VALUES
   (DEFAULT, '11', '400000', STR_TO_DATE('05/04/2023', '%d/%m/%Y'), 'Curso de Primeros Auxilios'),
   (DEFAULT, '12', '200000', STR_TO_DATE('21/03/2023', '%d/%m/%Y'), 'Taller de Comunicación Efectiva'),
   (DEFAULT, '13', '250000', STR_TO_DATE('15/06/2023', '%d/%m/%Y'), 'Taller de Resolución de Conflictos'),
   (DEFAULT, '14', '370000', STR_TO_DATE('09/07/2023', '%d/%m/%Y'), 'Curso de Gestión del Tiempo'),
   (DEFAULT, '15', '390000', STR_TO_DATE('12/07/2023', '%d/%m/%Y'), 'Seminario de Liderazgo');

ALTER TABLE prevencion_riesgos.pagos
Modify fecha_pago VARCHAR(10);
ALTER TABLE prevencion_riesgos.pagos
Modify monto int;