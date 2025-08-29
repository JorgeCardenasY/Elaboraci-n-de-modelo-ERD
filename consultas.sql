/*
Desarrollado por: Catalina Villegas
Gerald Carrillo
Jorge Cárdenas 
Fecha: 26-AGO-2025
*/

DROP DATABASE if exists otec;

CREATE DATABASE otec;

USE otec;

CREATE TABLE Curso
(
  curso_id          INT          NOT NULL AUTO_INCREMENT,
  nombre_curso      VARCHAR(50)  NOT NULL,
  descripcion_curso VARCHAR(250) NOT NULL,
  horario           TIME         NOT NULL,
  dia_semana        VARCHAR(50)  NOT NULL,
  duracion_curso    INT          NOT NULL,
  estudiante_id     INT          NOT NULL,
  PRIMARY KEY (curso_id)
);

ALTER TABLE Curso
  ADD CONSTRAINT UQ_curso_id UNIQUE (curso_id);

CREATE TABLE Estudiantes
(
  estudiante_id INT          NOT NULL AUTO_INCREMENT,
  nombre        VARCHAR(50)  NOT NULL,
  contacto      VARCHAR(250) NOT NULL,
  PRIMARY KEY (estudiante_id)
);

ALTER TABLE Estudiantes
  ADD CONSTRAINT UQ_estudiante_id UNIQUE (estudiante_id);

CREATE TABLE Profesores
(
  profesor_id    INT          NOT NULL AUTO_INCREMENT,
  nombre         VARCHAR(50)  NOT NULL,
  contacto       VARCHAR(250) NOT NULL,
  especialidad   VARCHAR(250) NOT NULL,
  curso_asignado VARCHAR(250) NOT NULL,
  PRIMARY KEY (profesor_id)
);

ALTER TABLE Profesores
  ADD CONSTRAINT UQ_profesor_id UNIQUE (profesor_id);

CREATE TABLE Seccion
(
  profesor_id INT NOT NULL,
  curso_id    INT NOT NULL
) COMMENT 'xD';

ALTER TABLE Curso
  ADD CONSTRAINT FK_Estudiantes_TO_Curso
    FOREIGN KEY (estudiante_id)
    REFERENCES Estudiantes (estudiante_id);

ALTER TABLE Seccion
  ADD CONSTRAINT FK_Profesores_TO_Seccion
    FOREIGN KEY (profesor_id)
    REFERENCES Profesores (profesor_id);

ALTER TABLE Seccion
  ADD CONSTRAINT FK_Curso_TO_Seccion
    FOREIGN KEY (curso_id)
    REFERENCES Curso (curso_id);
