create database integradoraNacho;
use integradoraNacho;

create table departamento(
idDepartamento int auto_increment,
nombre varchar (50),
primary key (idDepartamento)
);

create table personal(
idPersonal int auto_increment primary key,
nombre varchar (50),
apellido varchar (50),
usuario varchar (50),
rol varchar (50),
contrasena varchar (224),
registro  datetime,
idDepartamento int,
foreign key (idDepartamento) references departamento(idDepartamento)
);

CREATE TABLE Registros(
    idRegistro INT AUTO_INCREMENT PRIMARY KEY,
    idPersonal INT,
    horaEntrada DATETIME,
    horaSalida DATETIME,
    FOREIGN KEY (idPersonal) REFERENCES personal(idPersonal)
);





ALTER TABLE Registros DROP FOREIGN KEY registros_ibfk_1;
ALTER TABLE Registros ADD CONSTRAINT registros_ibfk_1 FOREIGN KEY (idPersonal) REFERENCES personal(idPersonal) ON DELETE CASCADE;


INSERT INTO departamento (nombre) VALUES ('Profesores');
INSERT INTO departamento (nombre) VALUES ('Seguridad');
INSERT INTO departamento (nombre) VALUES ('Limpieza');
INSERT INTO departamento (nombre) VALUES ('Recursos Humanos');
INSERT INTO departamento (nombre) VALUES ('Administracion');
INSERT INTO departamento (nombre) VALUES ('Psiquiatria');
INSERT INTO departamento (nombre) VALUES ('Areas Sociales');



SELECT 
    DATE(r.horaEntrada) as fecha,
    r.idRegistro, 
    r.idPersonal, 
    r.horaEntrada, 
    r.horaSalida, 
    p.nombre, 
    p.apellido, 
    d.nombre AS nombreDepartamento, 
    TIME_FORMAT(TIMEDIFF(r.horaSalida, r.horaEntrada), '%H:%i:%s') AS duracion
FROM 
    registros r 
JOIN 
    personal p ON r.idPersonal = p.idPersonal
JOIN 
    departamento d ON p.idDepartamento = d.idDepartamento
ORDER BY fecha









