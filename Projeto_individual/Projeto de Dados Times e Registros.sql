


CREATE DATABASE BRASIL;
USE BRASIL;

CREATE TABLE TIME_BR(
	IDTIMEBR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(20)UNIQUE,
	ESTADO CHAR(2) NOT NULL,
	REPUTACAO ENUM("NENHUM","NASCIONAL","INTERNACIONAL")

);

-- INSERT

INSERT INTO TIME_BR VALUES(NULL,'VASCO DA GAMA','RJ','INTERNACIONAL');
INSERT INTO TIME_BR VALUES(NULL,'BOTAFOGO','RJ','INTERNACIONAL');
INSERT INTO TIME_BR VALUES(NULL,'FLUMINENSE','RJ','INTERNACIONAL');
INSERT INTO TIME_BR VALUES(NULL,'FLAMENGO','RJ','INTERNACIONAL');



CREATE TABLE SERIE_A(
	IDBRASILEIRAO INT PRIMARY KEY AUTO_INCREMENT,
	POSICAO ENUM("PRIMEIRO","SEGUNDO","TERCEIRO","QUARTO")NOT NULL,
	ANO VARCHAR(4),
	ID_BRASILEIRAO INT

);

ALTER TABLE SERIE_A
ADD CONSTRAINT FK_SERIE_A
FOREIGN KEY (ID_BRASILEIRAO)
REFERENCES TIME_BR (IDTIMEBR);

-- INSERT


INSERT INTO SERIE_A VALUES(NULL,'SEGUNDO','2003',1);
INSERT INTO SERIE_A VALUES(NULL,'QUARTO','2008',1);
INSERT INTO SERIE_A VALUES(NULL,'PRIMEIRO','2003',2);
INSERT INTO SERIE_A VALUES(NULL,'TERCEIRO','2003',3);




SELECT ANO,TOTAL,ID_BRASILEIRAO FROM SERIE_A;


SELECT T.NOME,T.ESTADO,S.POSICAO,S.ANO
FROM TIME_BR T
INNER JOIN SERIE_A S
ON T.IDTIMEBR = S.ID_BRASILEIRAO;





