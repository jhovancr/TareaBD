CREATE database Tarea;
USE Tarea;

--CREACION DE TABLAS
CREATE TABLE idiomas (
id INT NOT NULL PRIMARY KEY,
nombre NVARCHAR(100)
);

CREATE TABLE estudiantes(
id INT NOT NULL PRIMARY KEY,
identificacion NVARCHAR(30),
nombre NVARCHAR(100)
);

CREATE TABLE idiomas_estudiantes(
id_estudiante INT,
id_idioma INT,
FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
FOREIGN KEY (id_idioma) REFERENCES idiomas(id)
);

CREATE TABLE cursos(
id INT NOT NULL PRIMARY KEY,
nombre NVARCHAR(100),
fecha_inicio DATE,
fecha_finalizacion DATE
);

CREATE TABLE idiomas_cursos(
id_curso INT,
id_idioma INT,
FOREIGN KEY (id_curso) REFERENCES cursos(id),
FOREIGN KEY (id_idioma) REFERENCES idiomas(id)
);

CREATE TABLE matricula(
id INT NOT NULL PRIMARY KEY,
id_estudiante INT,
id_curso INT,
FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
FOREIGN KEY (id_curso) REFERENCES cursos(id),
);

--CONSULTAS

INSERT INTO idiomas (id, nombre) VALUES (1, 'Español');
INSERT INTO idiomas (id, nombre) VALUES (2, 'Inglés');
INSERT INTO idiomas (id, nombre) VALUES (3, 'Ruso');
INSERT INTO idiomas (id, nombre) VALUES (4, 'Alemán');

INSERT INTO estudiantes(id, identificacion, nombre) VALUES (1, '123', 'Juan Mora');
INSERT INTO estudiantes(id, identificacion, nombre) VALUES (2, '124', 'Luis Navarro');
INSERT INTO estudiantes(id, identificacion, nombre) VALUES (3, '125', 'Pedro Castro');

INSERT INTO idiomas_estudiantes (id_estudiante, id_idioma) VALUES (1,1);
INSERT INTO idiomas_estudiantes (id_estudiante, id_idioma) VALUES (2,1);
INSERT INTO idiomas_estudiantes (id_estudiante, id_idioma) VALUES (2,2);
INSERT INTO idiomas_estudiantes (id_estudiante, id_idioma) VALUES (3,1);
INSERT INTO idiomas_estudiantes (id_estudiante, id_idioma) VALUES (3,4);

INSERT INTO cursos (id, nombre, fecha_inicio, fecha_finalizacion) VALUES (1, 'Español', '2021-08-01', '2021-08-30');
INSERT INTO cursos (id, nombre, fecha_inicio, fecha_finalizacion) VALUES (2, 'Inglés', '2021-09-01', '2021-09-30');
INSERT INTO cursos (id, nombre, fecha_inicio, fecha_finalizacion) VALUES (3, 'Ruso', '2021-07-01', '2021-07-30');
INSERT INTO cursos (id, nombre, fecha_inicio, fecha_finalizacion) VALUES (4, 'Alemán', '2021-08-01', '2021-08-30');

INSERT INTO idiomas_cursos(id_curso, id_idioma) VALUES (1,1);
INSERT INTO idiomas_cursos(id_curso, id_idioma) VALUES (2,2);
INSERT INTO idiomas_cursos(id_curso, id_idioma) VALUES (3,3);
INSERT INTO idiomas_cursos(id_curso, id_idioma) VALUES (4,4);

INSERT INTO matricula (id, id_estudiante, id_curso) VALUES (1, 1, 1);
INSERT INTO matricula (id, id_estudiante, id_curso) VALUES (2, 2, 2);
INSERT INTO matricula (id, id_estudiante, id_curso) VALUES (3, 3, 4);


--CONSULTAS
SELECT estudiantes.nombre, idiomas.nombre
FROM idiomas
INNER JOIN idiomas_estudiantes ON idiomas_estudiantes.id_idioma = idiomas.id
INNER JOIN estudiantes ON estudiantes.id = idiomas_estudiantes.id_estudiante
WHERE estudiantes.identificacion = '125';

SELECT estudiantes.nombre, cursos.nombre,cursos.fecha_inicio, cursos.fecha_finalizacion, idiomas.nombre
FROM idiomas
INNER JOIN idiomas_estudiantes ON idiomas_estudiantes.id_idioma = idiomas.id
INNER JOIN estudiantes ON estudiantes.id = idiomas_estudiantes.id_estudiante
INNER JOIN matricula ON matricula.id_estudiante = estudiantes.id
INNER JOIN cursos ON cursos.id = matricula.id_curso
WHERE estudiantes.identificacion = '125';
