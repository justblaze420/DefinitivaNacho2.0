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

select * from Registros;

select * from departamento;

select * from personal;

SELECT r.idRegistro, r.idPersonal, r.horaEntrada, r.horaSalida, p.nombre, p.apellido, TIME_FORMAT(TIMEDIFF(r.horaSalida, r.horaEntrada), '%H:%i:%s') AS duracion
                            FROM registros r 
                            JOIN personal p ON r.idPersonal = p.idPersonal
INSERT INTO personal (nombre, idDepartamento) VALUES ('Robbie Daniel', 2);

delete from registros where idRegistro = 53;


INSERT INTO registros (idRegistro, idPersonal, horaEntrada, horaSalida)
VALUES (53, 23, '2023-08-14 12:50:41.0', '2023-08-16 12:51:53.0');





ALTER TABLE Registros DROP FOREIGN KEY registros_ibfk_1;
ALTER TABLE Registros ADD CONSTRAINT registros_ibfk_1 FOREIGN KEY (idPersonal) REFERENCES personal(idPersonal) ON DELETE CASCADE;

SHOW CREATE TABLE Registros;


INSERT INTO departamento (nombre) VALUES ('Profesores');
INSERT INTO departamento (nombre) VALUES ('Seguridad');
INSERT INTO departamento (nombre) VALUES ('Limpieza');
INSERT INTO departamento (nombre) VALUES ('Recursos Humanos');
INSERT INTO departamento (nombre) VALUES ('Administracion');
INSERT INTO departamento (nombre) VALUES ('Psiquiatria');
INSERT INTO departamento (nombre) VALUES ('Areas Sociales');

ALTER TABLE personal DROP FOREIGN KEY personal_ibfk_1;
UPDATE personal SET idDepartamento = 1 WHERE idPersonal = 36;

SELECT personal.*, departamento.nombre AS nombreDepartamento FROM personal JOIN departamento ON personal.idDepartamento = departamento.idDepartamento


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


SELECT p.idPersonal, p.nombre, p.apellido, DATE(r.horaEntrada) as fecha, 
       SUM(TIMESTAMPDIFF(HOUR, r.horaEntrada, r.horaSalida)) as totalHoras 
FROM registros r
JOIN personal p ON r.idPersonal = p.idPersonal
WHERE r.horaEntrada BETWEEN '2023-08-01' AND '2023-08-31'
GROUP BY p.idPersonal, DATE(r.horaEntrada);







