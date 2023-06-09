/*ENTENDENDO TRIGGER*/

/*ESTRUTURA DE UMA TRIGGER*/

/*USE SEMPRE O DELIMITER PARA APLICAR/*/

CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

		QUALQUER COMANDO SQL

END -> FIM

/*
FOR EACH ROW (SIGNIFICA PARA CADA LINHA ISSO NÃO MUDA NA SINTAXE)
BEFORE/AFTER ( VOCÊ ESCOLHE UM COMO DESEJA GRAVAR OS DADOS USE BEFORE PARA ANTES OU AFTER PARA DEPOIS)

*/

/* LOCALIZANDO O CAMINHO DAS TRINGGER NO BANCO DE DADOS ONDE TEM TODOS OS DADOS DE QUANDO FOI CRIADO,
MODIFICADO, APAGADO, REGISTRADO ETC*/

/* PESQUISANDO NOS DICIONÁRIO DE DADOS DO BANCO*/

SHOW DADABASES;
USE information_schema;
SHOW TABLES;
TRIGGERS
DESC TRIGGERS;



/*01 - INICIANDO O TREINAMENTO*/

CREATE DATABASE AULA_TRIGGERS;
USE AULA_TRIGGERS;
DROP DATABASE AULA_TRIGGERS;

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(100)


);

/* 02 - CRIANDO A TABELA BECKUP TRIGGERS QUANDO APAGAR UM DADO SERÁ REALIZADO UM BACKUP PARA VOLTA COM O REGISTRO SE NECESSÁRIO MENOS A SENHA POR MOTIVO DE SEGURANÇA
SE NECESSÁRIO FOR PRECISO RESTAURAR O DADO DO USUÁRIO A EMPRESA VAI SOLICITAR QUE ELE CRIE UMA NOVA SENHA*/



CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)

);

/*
CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

		QUALQUER COMANDO SQL

END -> FIM */


/* OBS: TODO INSERT É BEFORE (NEW) PORQUE NÃO EXISTE. TODO DELETE É AFTER(OLD)ANTES DE DELETAR FAZ O BECKUP
UPDATE ATUALIZAÇÃO DE DADOS USAMOS O BEFORE(NEW) PARA PEGAR O VALOR QUE ESTAR ENTRANDO E PARA PEGAR DADOS ANTERIORES DA MUDANÇA PEGA O OLD O AFTER, OU PODE PEGAR OS DOIS*/



/* CRIANDO A TRIGGER PARA REALIZAR BECKUP DO USUÁRIO QUE FOI DELETADO*/

DELIMITER $

CREATE TRIGGER BACKUP_USER
BEFORE DELETE USUARIO
FOR EACH ROW
BEGIN

	INSERT INTO BKP_USUARIO VALUES(NULL,OLD.IDUSUARIO,OLD.NOME,OLD.LOGIN);

END
$

DELIMITER ;




/*03 REALIZANDO O INSERT DO USUÁRIO*/



/*04 - REALIZANDO AGORA O DELETE DO DADO DO USUÁRIO PARA TESTAR SE O BACKUP FOI REALIZADO CORRETAMENTE*/




/*05 DEPOIS DE DELETAR VERIFIQUE A TABELA BACKUP_USER*/


/* EM RESUMO ANTES DE CRIAR UM REGISTRO É UMA BOA PRATICA CRIAR UMA TRIGGER DE DELETE ANTES DE INSERIR OS DADOS*/



CREATE DATABASE DBA_STRIGGER;
USE DBA_STRIGGER;

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(10)

);

-- REALIZANDO O BACKUP APÓS A REALIZAÇÃO DO INSERT.

DELIMITER $

CREATE TRIGGER BACKUP_INSERT_USER
AFTER INSERT ON USUARIO
FOR EACH ROW
BEGIN

END

$

DELIMITER ;




CREATE TABLE BACKUP_USER(
	IDBKPUSER INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)


);







