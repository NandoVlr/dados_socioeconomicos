CREATE DATABASE socioeconomico;
USE socioeconomico;

CREATE TABLE populacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idade INT,
    genero VARCHAR(20),
    estado_civil VARCHAR(20),
    escolaridade VARCHAR(30),
    renda_mensal VARCHAR(20),
    ocupacao VARCHAR(50),
    estado CHAR(2),
    cidade VARCHAR(50)
);
