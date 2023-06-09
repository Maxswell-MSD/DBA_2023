
/* CRIANDO O BANCO DE DADOS CURSORES*/

CREATE DATABASE CURSORES;
USE CURSORES;

CREATE TABLE VENDEDORES(
	IDVENDEDORES INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT
);

INSERT INTO VENDEDORES VALUES (NULL, 'João', 10000, 20000, 30000);
INSERT INTO VENDEDORES VALUES (NULL, 'Maria', 15000, 25000, 35000);
INSERT INTO VENDEDORES VALUES (NULL, 'Pedro', 12000, 22000, 32000);
INSERT INTO VENDEDORES VALUES (NULL, 'Ana', 18000, 28000, 38000);
INSERT INTO VENDEDORES VALUES (NULL, 'Carlos', 16000, 26000, 36000);
INSERT INTO VENDEDORES VALUES (NULL, 'Sandra', 11000, 21000, 31000);
INSERT INTO VENDEDORES VALUES (NULL, 'Mariana', 13000, 23000, 33000);
INSERT INTO VENDEDORES VALUES (NULL, 'Fernando', 17000, 27000, 37000);
INSERT INTO VENDEDORES VALUES (NULL, 'Isabela', 19000, 29000, 39000);
INSERT INTO VENDEDORES VALUES (NULL, 'Lucas', 14000, 24000, 34000);
INSERT INTO VENDEDORES VALUES (NULL, 'Juliana', 20000, 30000, 40000);
INSERT INTO VENDEDORES VALUES (NULL, 'Ricardo', 21000, 31000, 41000);
INSERT INTO VENDEDORES VALUES (NULL, 'Camila', 22000, 32000, 42000);
INSERT INTO VENDEDORES VALUES (NULL, 'Gustavo', 23000, 33000, 43000);
INSERT INTO VENDEDORES VALUES (NULL, 'Laura', 24000, 34000, 44000);
INSERT INTO VENDEDORES VALUES (NULL, 'Marcos', 25000, 35000, 45000);
INSERT INTO VENDEDORES VALUES (NULL, 'Carolina', 26000, 36000, 46000);
INSERT INTO VENDEDORES VALUES (NULL, 'Rafael', 27000, 37000, 47000);
INSERT INTO VENDEDORES VALUES (NULL, 'Amanda', 28000, 38000, 48000);
INSERT INTO VENDEDORES VALUES (NULL, 'Gabriel', 29000, 39000, 49000);
INSERT INTO VENDEDORES VALUES (NULL, 'Maxswell', 43561, 89125, 35645);

-- SOMA EM LINHA
SELECT NOME,JAN,FEV,MAR,
(JAN+FEV+MAR) AS "TOTAL"
FROM VENDEDORES;

-- MÉDIA EM LINHA
SELECT NOME,JAN,FEV,MAR,
TRUNCATE((JAN+FEV+MAR)/3,2) AS "MÉDIA"
FROM VENDEDORES;

/*CRIANDO A TABELA QUE RECEBERÁ A SOMA E A MÉDIA USANDO PROCEDURE DE CURSORES
ASSIM AJUDARÁ NA OTIMIZAÇÃO DO BANCO*/

CREATE TABLE VENDA_TOTAL(
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT,
	TOTAL INT,
	MEDIA INT
);


-- INICIANDO A PROGRAMAÇÃO DE CURSORES DE TOTAL E MÉDIA

DELIMITER $


CREATE PROCEDURE INSEREDADOS()
BEGIN
		DECLARE FIM INT DEFAULT 0;
		DECLARE VAR1, VAR2, VAR3, VTOTAL, VMEDIA INT;
		DECLARE VNOME VARCHAR(50);

		DECLARE REG CURSOR FOR(
			SELECT NOME, JAN, FEV, MAR FROM VENDEDORES

			);

		DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM =1;

		OPEN REG;

		REPEAT

		FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
		IF NOT FIM THEN

		SET VTOTAL= VAR1 + VAR2 + VAR3;
		SET VMEDIA = VTOTAL /3;

		INSERT INTO VENDA_TOTAL VALUES(VNOME,VAR1,VAR2,VAR3,VTOTAL,VMEDIA);
		END IF;

		UNTIL FIM END REPEAT;

		CLOSE REG;



END

$

DELIMITER ;

CALL INSEREDADOS();

