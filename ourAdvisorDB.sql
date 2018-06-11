CREATE DATABASE ourAdvisorDB;

CREATE TABLE localidade (
    idlocalidade            INT(6) UNSIGNED AUTO_INCREMENT,
    localidade              VARCHAR(50) NOT NULL,
    PRIMARY KEY (idlocalidade)
);

CREATE TABLE tipoCliente (
    idTipoCliente           INT(6) UNSIGNED AUTO_INCREMENT,
    tipo                    VARCHAR(50) NOT NULL,
    PRIMARY KEY (idTipoCliente)
);

CREATE TABLE utilizador (
    idUtilizador            INT(6) UNSIGNED AUTO_INCREMENT,
    nome                    VARCHAR(50) NOT NULL,
    email                   VARCHAR(50) NOT NULL,
    morada                  VARCHAR(200) NOT NULL,
    codPostal               VARCHAR(8) NOT NULL,
    telemovel               INT(9) NOT NULL,
    idLocalidade            INT(6) NOT NULL,
    idTipoCliente           INT(6) NOT NULL,
    PRIMARY KEY (idUtilizador)
    FOREIGN KEY (idLocalidade) REFERENCES localidade(idLocalidade),
    FOREIGN KEY (idTipoCliente) REFERENCES tipoCliente(idTipoCliente) 
);


CREATE TABLE tipoEstabelecimento (
    idTipoEstabelecimento   INT(6) UNSIGNED AUTO_INCREMENT,
    tipo                    VARCHAR(50) NOT NULL,
    PRIMARY KEY (idTipoEstabelecimento)
);

CREATE TABLE estabelecimento (
    idEstabelecimento       INT(6) UNSIGNED AUTO_INCREMENT,
    nome                    VARCHAR(50) NOT NULL,
    preco                   FLOAT(3,2) NOT NULL,
    morada                  VARCHAR(200) NOT NULL,
    codPostal               VARCHAR(8) NOT NULL,
    idLocalidade            INT(6) NOT NULL,
    idTipoEstabelecimento   INT(6) NOT NULL,
    PRIMARY KEY (idEstabelecimento),
    FOREIGN KEY (idLocalidade) REFERENCES localidade(idLocalidade) 
    FOREIGN KEY (idTipoEstabelecimento) REFERENCES tipoEstabelecimento(idTipoEstabelecimento) 
);

CREATE TABLE fotos (
    idFoto                  INT(6) UNSIGNED AUTO_INCREMENT,
    idEstabelecimento       INT(6) NOT NULL,
    descricao               VARCHAR(200),
    fotos                   BLOB,
    PRIMARY KEY (idFoto),
    FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento(idEstabelecimento) 
);

CREATE TABLE avaliacao (
    idAvaliacao             INT(6) UNSIGNED AUTO_INCREMENT,
    idEstabelecimento       INT(6) NOT NULL,
    idUtilizador            INT(6) NOT NULL,
    classificacao           INT(1) NOT NULL,
    comentario              VARCHAR(400) NOT NULL,
    dataAvaliacao           TIMESTAMP,
    PRIMARY KEY (idAvaliacao),
    FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento(idEstabelecimento) 
    FOREIGN KEY (idUtilizador) REFERENCES utilizador(idUtilizador) 
);

CREATE TABLE reserva (
    idReserva               INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    idEstabelecimento       INT(6) NOT NULL,
    idUtilizador            INT(6) NOT NULL,
    dataEntrada             DATE,
    dataSaida               DATE,
    dataHora                TIMESTAMP,
    estado                  VARCHAR(10) NOT NULL,
    precoTotal              FLOAT(3,2) NOT NULL,
    dataReserva             DATE,
    PRIMARY KEY (idReserva),
    FOREIGN KEY (idEstabelecimento) REFERENCES estabelecimento(idEstabelecimento) 
    FOREIGN KEY (idUtilizador) REFERENCES utilizador(idUtilizador) 
);




