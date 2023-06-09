-- REALIZANDO TRINGGER DE BACKUP ENTRE DOIS BANCOS DE DADOS 




/* TREINAMENTO 18 TRIGGERS PARA BANCO DE DADOS DIFERENTE EM BACKUP LÓGICO DIFERENTE DO FÍSICO*/

/* REALIZANDO BACKUP EM OUTRO BANCO DE DADOS SEM SER EM UMA TABELA COMO FOI FEITO NO TREINAMENTO ANTERIOR*/
/* COMUNICAÇÃO ENTRE BANCOS USANDO TRINGGER*/


DROP DATABASE LOJA;
DROP DATABASE BACKUP;

CREATE DATABASE LOJA;
USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)

);



CREATE DATABASE BACKUP;
USE BACKUP;

STATUS;




CREATE TABLE BKP_PRODUTO(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)

);

USE LOJA;


INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,1000,'TESTE',0.0);

SELECT * FROM  BACKUP.BKP_PRODUTO;


/* REALIZANDO UMA TRIGGER PARA REALIZAR OS MESMOS REGISTROS DE UM BANCO AO MESMO TEMPO NO OUTRO PARA TER UM BACKUP SEGURO*/

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
BEFORE INSERT ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES
	(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR);


END
$

DELIMITER ;


/* REALIZANDO DROP PARA CORRIGIR OS DADOS DE PRYMARY KEY QUEA A TRINGGER ZERA QUANDO PEGA USANDO BEFORE
TROCAMOS POR AFTER*/

DROP TRIGGER BACKUP_PRODUTO;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES
	(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR);


END
$

DELIMITER ;







/* REALIZANDO UMA TRIGGER DE DELETE*/

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DELETE
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES
	(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR);


END
$

DELIMITER ;






/* REALIZANDO O TESTE*/

INSERT INTO PRODUTO VALUES(NULL,'CSS',23.4);
INSERT INTO PRODUTO VALUES(NULL,'SQL',50);
INSERT INTO PRODUTO VALUES(NULL,'PYTHON',80);

SELECT * FROM PRODUTO;


DELETE FROM PRODUTO WHERE IDPRODUTO =5;

SELECT * FROM  BACKUP.BKP_PRODUTO;

DELETE FROM BACKUP.BKP_PRODUTO WHERE IDBKP IN (4,5,6,7,8,9);




/*	TREINAMENTO DE TRIGGERS DE BACKUP ENTRE DOIS BANCO DE DADOS, TRIGGER DE AFTER INSERTE E BEFORE DELETE	*/

/*CRIANDO O BANCO DE DADOS LOJA*/

CREATE DATABASE LOJA;
USE LOJA;


-- CRIE AGORA A TABELA LOJA COM OS DADOS NOME E VALOR

CREATE TABLE PRODUTO(
	IDLOJA INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)

);



/*REALIZANDO AGORA O INSERT, DEPOIS VERIFIQUE SE FOI INSERIDO O MESMO DADO NO OUTRO BANCO*/

INSERT INTO PRODUTO VALUES(NULL,'CSS',58);
INSERT INTO PRODUTO VALUES(NULL,'SQL',100);
INSERT INTO PRODUTO VALUES(NULL,'PYTHON',78);


DELETE FROM PRODUTO WHERE IDLOJA =3;




-- // REALIZANDO AGORA A TRIGGER DE INSERT DE DADOS PARA REALIZAR O BACKUP DOS DADOS DA TABELA LOJA

DELIMITER $

CREATE TRIGGER BKP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BACKUP_PRODUTO VALUES
	(NULL,NEW.IDLOJA,NEW.NOME,NEW.VALOR);


END
$

DELIMITER ;






/* REALIZANDO AGORA A TRIGGER DE BACKUP DE ARQUIVOS DELETADO*/

DELIMITER $

CREATE TRIGGER BACKUP_DELETE_PRODUTO
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN
	
	INSERT INTO BACKUP.BACKUP_DELETE_PRODUTO VALUES
	(NULL,OLD.IDLOJA,OLD.NOME,OLD.VALOR);


END

$

DELIMITER ;


/*CRIANDO AGORA O SEGUNDO BANCO DE DADOS DE NOME BACKUP*/

CREATE DATABASE BACKUP;
USE BACKUP;

-- CRIANDO AGORA A TABELA COM OS MESMOS DADOS DA TABELA LOJA DO BANCO DE DADOS LOJA

CREATE TABLE BACKUP_PRODUTO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)



);

SELECT * FROM BACKUP_PRODUTO;


/*TABELA PARA BACKUP DE DADOS DELETADO*/

CREATE TABLE BACKUP_DELETE_PRODUTO(
IDDELETE INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)

);