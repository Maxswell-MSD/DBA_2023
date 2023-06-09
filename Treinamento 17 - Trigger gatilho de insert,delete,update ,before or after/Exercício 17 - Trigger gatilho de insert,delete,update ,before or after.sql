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

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(100)


);

/* 02 - CRIANDO A TABELA BECKUP TIGGERS QUANDO APAGAR UM DADO SERÁ REALIZADO UM BACKUP PARA VOLTA COM O REGISTRO SE NECESSÁRIO MENOS A SENHA POR MOTIVO DE SEGURANÇA
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
BEFORE DELETE ON USUARIO
FOR EACH ROW
BEGIN
	
	INSERT INTO BKP_USUARIO VALUES
	(NULL,OLD.IDUSUARIO,OLD.NOME,OLD.LOGIN);


END
$

DELIMITER ;

/*03 REALIZANDO O INSERT DO USUÁRIO*/

INSERT INTO USUARIO VALUES(NULL,'MAXBACKUP','MAX@EMAIL.COM','123456');

SELECT * FROM USUARIO;

/*04 - REALIZANDO AGORA O DELETE DO DADO DO USUÁRIO PARA TESTAR SE O BACKUP FOI REALIZADO CORRETAMENTE*/


DELETE FROM USUARIO WHERE IDUSUARIO =1;

/*05 DEPOIS DE DELETAR VERIFIQUE A TABELA BACKUP_USER*/

SELECT * FROM BKP_USUARIO;

/* EM RESUMO ANTES DE CRIAR UM REGISTRO É UMA BOA PRATICA CRIAR UMA TRIGGER DE DELETE ANTES DE INSERIR OS DADOS*/





/* INICIANDO O TREINAMENTO DE REALIZAÇÃO DE BACKUP DE ARQUIVOS DELETADOS DE UMA TABELA PARA OUTRA*/



CREATE DATABASE AULA_TRIGGERS;
USE AULA_TRIGGERS;





/*01 - INICIANDO O TREINAMENTO, CRIANDO A TABELA PRINCIPAL COM NOME,LOGIN E SENHA*/
/* CRIE TABELA USUARIO*/

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(30)


);
--REALIZANDO O INSERT
INSERT INTO USUARIO VALUES(NULL,'MAXTESTE','MAX@EMAIL.COM','12345');

SELECT * FROM USUARIO;

-- REALIZANDO O DELETE E VERIFIQUE SE O BACKUP FOI FEITO NO BKP_USUARIO

DELETE FROM USUARIO WHERE IDUSUARIO = 1;

--LETANDO OS DADOS E VERIFIQUE SE REALIZOU O BACKUP NO BANCO BKP_USUARIO



/* 02 - CRIANDO A TABELA BECKUP TIGGERS QUANDO APAGAR UM DADO SERÁ REALIZADO UM BACKUP PARA VOLTA COM O REGISTRO SE NECESSÁRIO MENOS A SENHA POR MOTIVO DE SEGURANÇA
SE NECESSÁRIO FOR PRECISO RESTAURAR O DADO DO USUÁRIO A EMPRESA VAI SOLICITAR QUE ELE CRIE UMA NOVA SENHA*/

/*CRIANDO A TABELA QUE RECEBERÁ OS DADOS DEPOIS DE DELETAR DA TABELA PRINCIPAL*/

/*CRIA A TABELA DE BECKUP COM NOME BKP_USUARIO COM OS MESMOS DADOS DA TABELA USUARIO INCLUINDO IDUSUARIO E MENOS A SENHA*/

CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)


);

SELECT * FROM BKP_USUARIO;


/*CRIANDO AGORA A TRIGGER QUE VAI DETERMINAR A CONDIÇÃO PARA REALIZAR O BACKUP ANTES DE DELETAR*/


DELIMITER $

CREATE TRIGGER BACKUP_USER
BEFORE DELETE ON USUARIO
FOR EACH ROW
BEGIN
	
	INSERT INTO BKP_USUARIO VALUES(NULL,OLD.IDUSUARIO,OLD.NOME,OLD.LOGIN);




END

$

DELIMITER ;

-- REALIZANDO A BUSCA NA BIBLIOTECA
SHOW DADABASES;
USE information_schema;
SHOW TABLES;
TRIGGERS
DESC TRIGGERS;



