CREATE DATABASE Biblioteca;

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

CREATE TABLE
    Estudiante (
        id_estudiante VARCHAR (10) PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50),
        direccion VARCHAR(50) NOT NULL,
        telefono VARCHAR(20) NOT NULL,
        correo VARCHAR (100)
    );

CREATE TABLE
    Autor(
        id_autor INT PRIMARY KEY IDENTITY (1, 1),
        nombre VARCHAR (100) NOT NULL
    );

CREATE TABLE
    Categoria(
        id_categoria INT PRIMARY KEY IDENTITY (1, 1),
        descripcion VARCHAR (100) NOT NULL
    );

CREATE TABLE
    Libro (
        id_libro INT PRIMARY KEY IDENTITY (1, 1),
        nombre VARCHAR (50) NOT NULL,
        editorial VARCHAR (100),
        fecha_edicion DATETIME,
        id_categoria INT NOT NULL,
        FOREIGN KEY (id_categoria) REFERENCES Categoria (id_categoria)
    );

CREATE TABLE
    Prestamo(
        id_prestamo INT PRIMARY KEY IDENTITY (1, 1),
        fecha_prestamo VARCHAR (50) NOT NULL,
        fecha_devolucion VARCHAR (50) NOT NULL,
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

CREATE TABLE
    Autor_libro(
        id_autor INT,
        id_libro INT,
        FOREIGN KEY (id_autor) REFERENCES Autor (id_autor),
        FOREIGN KEY (id_libro) REFERENCES Libro (id_libro)
    );