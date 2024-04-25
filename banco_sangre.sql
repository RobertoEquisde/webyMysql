-- Crear tabla centroDonacion
CREATE TABLE centroDonacion (
    id_centroDonacion INT(11) NOT NULL AUTO_INCREMENT,
    nombre_hospital TINYTEXT NOT NULL,
    direccion_hospital TINYTEXT NOT NULL,
    PRIMARY KEY (id_centroDonacion)
);

-- Crear tabla donacion
CREATE TABLE donacion (
    id_donacion INT(11) NOT NULL AUTO_INCREMENT,
    id_centroDonacion INT(11) NOT NULL,
    id_almacen INT(11) NOT NULL,
    id_donante INT(11) NOT NULL,
    fecha_envio DATE NOT NULL,
    PRIMARY KEY (id_donacion),
    FOREIGN KEY (id_centroDonacion) REFERENCES centroDonacion(id_centroDonacion),
    FOREIGN KEY (id_donante) REFERENCES infoDonante(id_donante)
);

-- Crear tabla infoDonante
CREATE TABLE infoDonante (
    id_donante INT(11) NOT NULL AUTO_INCREMENT,
    id_usuario INT(11) NOT NULL,
    tipo_sangre TINYTEXT NOT NULL,
    nombre TINYTEXT NOT NULL,
    apellidos TINYTEXT NOT NULL,
    anio_nacimiento DATE NOT NULL,
    donacion_realizada TINYINT(4) DEFAULT '0',
    PRIMARY KEY (id_donante),
    KEY fk_donante_usuario_idx (id_usuario),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Crear tabla usuario
CREATE TABLE usuario (
    id_usuario INT(11) NOT NULL AUTO_INCREMENT,
    curp VARCHAR(18) NOT NULL,
    contrasena TINYTEXT NOT NULL,
    rol TINYTEXT NOT NULL,
    PRIMARY KEY (id_usuario)
);

-- Crear tabla historial_puntos
CREATE TABLE historial_puntos (
    id_usuario INT(11) NOT NULL,
    id_historial INT(11) NOT NULL AUTO_INCREMENT,
    puntos INT(11) NOT NULL,
    fecha_registro DATETIME NOT NULL,
    PRIMARY KEY (id_historial),
    KEY fk_historial_usuario_idx (id_usuario),
    CONSTRAINT fk_historial_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Crear tabla citas
CREATE TABLE citas (
    id_citas INT(11) NOT NULL AUTO_INCREMENT,
    fecha_cita DATETIME NOT NULL,
    lugar_cita TINYTEXT NOT NULL,
    id_donante INT(11) NOT NULL,
    PRIMARY KEY (id_citas),
    KEY fk_citas_donante1_idx (id_donante),
    FOREIGN KEY (id_donante) REFERENCES infoDonante(id_donante)
);
