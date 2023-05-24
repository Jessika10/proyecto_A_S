--Ejecutar primero salo una vez
--CREATE DATABASE Biblioteca;

USE Biblioteca;

CREATE TABLE
    Bibliotecario (
        id_bibliotecario VARCHAR (10) PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50),
        direccion VARCHAR(50) NOT NULL,
        telefono VARCHAR(20) NOT NULL,
        correo VARCHAR (100)
    );

INSERT INTO dbo.Bibliotecario (id_bibliotecario ,nombre,apellido,direccion,telefono,correo) VALUES ('1000','Melany','Perez','Padre hurtado','654654654','melany@gmail.com');
INSERT INTO dbo.Bibliotecario (id_bibliotecario ,nombre,apellido,direccion,telefono,correo) VALUES ('1001','Daniel','Bargas','Providencia','5458787','daniel@gmail.com');
INSERT INTO dbo.Bibliotecario (id_bibliotecario ,nombre,apellido,direccion,telefono,correo) VALUES ('1002','Jhordan','Sousa','Santiago','7657656','jhordan@gmail.com');


CREATE TABLE
    Estudiante (
        id_estudiante VARCHAR (10) PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50),
        direccion VARCHAR(50) NOT NULL,
        telefono VARCHAR(20) NOT NULL,
        correo VARCHAR (100)
    );

INSERT INTO dbo.Estudiante (id_estudiante ,nombre,apellido,direccion,telefono,correo) VALUES ('2000','Maria','Sanches','Lampa','456456456','maria@gmail.com');
INSERT INTO dbo.Estudiante (id_estudiante ,nombre,apellido,direccion,telefono,correo) VALUES ('2001','Daniela','Perez','Santa Isabel','65745646','daniela@gmail.com');
INSERT INTO dbo.Estudiante (id_estudiante ,nombre,apellido,direccion,telefono,correo) VALUES ('2002','Carlos','Solos','Quilicura','456456','carlos@gmail.com');
INSERT INTO dbo.Estudiante (id_estudiante ,nombre,apellido,direccion,telefono,correo) VALUES ('2003','Daniel','Baron','Valle grande','456543543','daniel@gmail.com');


CREATE TABLE
    Autor(
        id_autor INT PRIMARY KEY IDENTITY (1, 1),
        nombre VARCHAR (100) NOT NULL
    );

INSERT INTO dbo.Autor (nombre) VALUES ('Alejandro Valdiviezo');
INSERT INTO dbo.Autor (nombre) VALUES ('Damilet Ossa');
INSERT INTO dbo.Autor (nombre) VALUES ('Raul Villega');
INSERT INTO dbo.Autor (nombre) VALUES ('Valentino Segobia');
INSERT INTO dbo.Autor (nombre) VALUES ('Carmen Becerra');


CREATE TABLE
    Categoria(
        id_categoria INT PRIMARY KEY IDENTITY (1, 1),
        descripcion VARCHAR (100) NOT NULL
    );

INSERT INTO dbo.Categoria (descripcion) VALUES ('Matematica');
INSERT INTO dbo.Categoria (descripcion) VALUES ('Literatura');
INSERT INTO dbo.Categoria (descripcion) VALUES ('Ciencia');
INSERT INTO dbo.Categoria (descripcion) VALUES ('Historia');
INSERT INTO dbo.Categoria (descripcion) VALUES ('Programacion');

CREATE TABLE
    Libro (
        id_libro INT PRIMARY KEY IDENTITY (1, 1),
        nombre VARCHAR (50) NOT NULL,
        editorial VARCHAR (100),
        fecha_edicion DATETIME,
        id_categoria INT NOT NULL,
        FOREIGN KEY (id_categoria) REFERENCES Categoria (id_categoria)
    );

INSERT INTO dbo.Libro (nombre,editorial,fecha_edicion,id_categoria) VALUES ('Calculo','Chacanca.sa','1985/02/27',1);
INSERT INTO dbo.Libro (nombre,editorial,fecha_edicion,id_categoria) VALUES ('Ortografia','Clic ediciones.sa','2000/04/10',2);
INSERT INTO dbo.Libro (nombre,editorial,fecha_edicion,id_categoria) VALUES ('Geo planeta','Geoplaneta.sa','2010/12/05',3);
INSERT INTO dbo.Libro (nombre,editorial,fecha_edicion,id_categoria) VALUES ('Programacion c#','Cupulas.sa','2020/03/07',5);

CREATE TABLE
    Prestamo(
        id_prestamo INT PRIMARY KEY IDENTITY (1, 1),
        fecha_prestamo VARCHAR (50) NOT NULL,
        fecha_devolucion VARCHAR (50),
        estado VARCHAR (100) NOT NULL,
        id_bibliotecario VARCHAR (10) NOT NULL,
        id_estudiante VARCHAR (10) NOT NULL,
        id_libro_1 INT NOT NULL,
        id_libro_2 INT,
        id_libro_3 INT,
        FOREIGN KEY (id_bibliotecario) REFERENCES Bibliotecario (id_bibliotecario),
        FOREIGN KEY (id_estudiante) REFERENCES Estudiante (id_estudiante),
        FOREIGN KEY (id_libro_1) REFERENCES Libro (id_libro),
        FOREIGN KEY (id_libro_2) REFERENCES Libro (id_libro),
        FOREIGN KEY (id_libro_3) REFERENCES Libro (id_libro)
    );

INSERT INTO dbo.Prestamo (fecha_prestamo,fecha_devolucion,estado,id_bibliotecario,id_estudiante,id_libro_1,id_libro_2,id_libro_3) VALUES ('2023/03/07','2023/03/10','Nuevo','1000','2000',1,2,3);
INSERT INTO dbo.Prestamo (fecha_prestamo,fecha_devolucion,estado,id_bibliotecario,id_estudiante,id_libro_1) VALUES ('2023/03/08','2023/03/09','Un poco deteriorado','1001','2001',4);
INSERT INTO dbo.Prestamo (fecha_prestamo,fecha_devolucion,estado,id_bibliotecario,id_estudiante,id_libro_1,id_libro_2) VALUES ('2023/03/10','2023/03/12','Nuevo','1000','2003',4,2);
INSERT INTO dbo.Prestamo (fecha_prestamo,estado,id_bibliotecario,id_estudiante,id_libro_1) VALUES ('2023/03/15','Nuevo','1002','2002',3);

CREATE TABLE
    Autor_libro(
        id_autor INT,
        id_libro INT,
        FOREIGN KEY (id_autor) REFERENCES Autor (id_autor),
        FOREIGN KEY (id_libro) REFERENCES Libro (id_libro)
    );

INSERT INTO dbo.Autor_libro (id_autor,id_libro) VALUES (1,1);
INSERT INTO dbo.Autor_libro (id_autor,id_libro) VALUES (2,1);
INSERT INTO dbo.Autor_libro (id_autor,id_libro) VALUES (3,2);

SELECT * FROM Bibliotecario;
SELECT * FROM Estudiante;
SELECT * FROM Autor;
SELECT * FROM Categoria;
SELECT * FROM Libro;
SELECT * FROM Prestamo;
SELECT * FROM Autor_Libro;