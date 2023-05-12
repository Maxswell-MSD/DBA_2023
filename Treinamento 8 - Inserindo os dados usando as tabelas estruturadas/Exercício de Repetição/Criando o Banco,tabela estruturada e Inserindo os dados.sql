/*EXERCÍCIO DE REPETIÇÃO COM INSERT ESTRUTURADO*/

-- 01 CRIE UMA ENTIDADE DE RELACIONAMENTO EM QUE O CLIENTE SÓ PODE TER UM ENDEREÇO MAS O TELEFONE NÃO É OBRIGATÓRIO, SE TIVER MAIS DE UM TELEFONE PODE REGISTRAR NO BANCO DE DADOS.

SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| comercio           |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+

DROP DATABASE COMERCIO;

SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+

-- CRIANDO O BANCO DE DADOS

CREATE DATABASE COMERCIO;

USE COMERCIO;

-- REALIZANDO A CRIAÇÃO DA TABELA CLIENTE

CREATE TABLE CLIENTE(
-- INSERINDO A CHAVE PRIMÁRIA PARA O BANCO GERAR AUTOMÁTICAMENTE.
IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,

NOME VARCHAR(100) NOT NULL,
SEXO ENUM('M','F')NOT NULL,
EMAIL VARCHAR(30) UNIQUE,
CPF VARCHAR(15) UNIQUE


);

-- 02 INSERINDO OS INSERT NA TABELA.

INSERT INTO CLIENTE VALUES(NULL,'Maxswell Diniz','M','maxswell@email.com','123456');
INSERT INTO CLIENTE VALUES(NULL,'Sandra','F','sandra@email.com','78910');
INSERT INTO CLIENTE VALUES(NULL,'Julia','F','Julia@email.com','111213');
INSERT INTO CLIENTE VALUES(NULL,'Camila','F','camila@email.com','141516');

SELECT * FROM CLIENTE;

+-----------+----------------+------+--------------------+--------+
| IDCLIENTE | NOME           | SEXO | EMAIL              | CPF    |
+-----------+----------------+------+--------------------+--------+
|         1 | Maxswell Diniz | M    | maxswell@email.com | 123456 |
|         2 | Sandra         | F    | sandra@email.com   | 78910  |
|         3 | Julia          | F    | Julia@email.com    | 111213 |
|         4 | Camila         | F    | camila@email.com   | 141516 |
+-----------+----------------+------+--------------------+--------+








-- CRIANDO A TABELA ENDEREÇO

CREATE TABLE ENDERECO(
-- INSERINDO A CHAVE PRIMÁRIA PARA O BANCO GERAR AUTOMÁTICAMENTE.
IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,

RUA VARCHAR(100)NOT NULL,
BAIRRO VARCHAR(100) NOT NULL,
CIDADE VARCHAR(50) NOT NULL,
ESTADO CHAR(2) NOT NULL,
-- CRIEANDO A CHAVE ESTRANGEIRA
ID_CLIENTE INT UNIQUE,
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE (IDCLIENTE)


);

-- 02 INSERINDO OS INSERT NA TABELA TESTE COLOCAR MAIS ENDEREÇO A UM CLIENTE PARA TESTAR SE O ID_CLIENTE INT UNIQUE ESTÁ LIMITANDO CORRETAMENTE.

INSERT INTO ENDERECO VALUES(NULL,'Fernando Augsburgo','Jucelino','São Paulo','SP',4);
INSERT INTO ENDERECO VALUES(NULL,'Rua Maldonado','Sobradinho','Minas Gerais','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'Rua do Acre','Centro','Rio de Janeiro','SP',1);
INSERT INTO ENDERECO VALUES(NULL,'Rua Salomé','Centro','São Paulo','SP',2);

SELECT * FROM ENDERECO;

+------------+--------------------+------------+----------------+--------+------------+
| IDENDERECO | RUA                | BAIRRO     | CIDADE         | ESTADO | ID_CLIENTE |
+------------+--------------------+------------+----------------+--------+------------+
|          1 | Fernando Augsburgo | Jucelino   | São Paulo      | SP     |          4 |
|          2 | Rua Maldonado      | Sobradinho | Minas Gerais   | SP     |          3 |
|          3 | Rua do Acre        | Centro     | Rio de Janeiro | SP     |          1 |
|          4 | Rua Salomé         | Centro     | São Paulo      | SP     |          2 |
+------------+--------------------+------------+----------------+--------+------------+

-- TESTANDO A LIMITAÇÃO DE CADASTRO DE SÓ UM ENDEREÇO POR CLIENTE.
INSERT INTO ENDERECO VALUES(NULL,'Rua Barão','Centro','Rio de Janeiro','SP',1);

-- LIMITAÇÃO DE ENDEREÇO POR CLIENTE FUNCIONANDO CORRETAMENTE, LIMITANDO TER MAIS DE UM ENDEREÇO.
/*
 INSERT INTO ENDERECO VALUES(NULL,'Rua Barão','Centro','Rio de Janeiro','SP',1);
ERROR 1062 (23000): Duplicate entry '1' for key 'ID_CLIENTE'*/





-- CRIANDO A TABELA ENDEREÇO

CREATE TABLE TELEFONE(
-- INSERINDO A CHAVE PRIMÁRIA PARA O BANCO GERAR AUTOMÁTICAMENTE.
IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,

TIPO ENUM('COMERCIAL','RESIDENCIAL','CELULAR') NOT NULL,
NUMERO VARCHAR(14) NOT NULL,
-- CRIEANDO A CHAVE ESTRANGEIRA
ID_CLIENTE INT,
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE (IDCLIENTE)



);


+-----------+----------------+------+--------------------+--------+
| IDCLIENTE | NOME           | SEXO | EMAIL              | CPF    |
+-----------+----------------+------+--------------------+--------+
|         1 | Maxswell Diniz | M    | maxswell@email.com | 123456 |
|         2 | Sandra         | F    | sandra@email.com   | 78910  |
|         3 | Julia          | F    | Julia@email.com    | 111213 |
|         4 | Camila         | F    | camila@email.com   | 141516 |
+-----------+----------------+------+--------------------+--------+

-- INSERINDO OS TELEFONES QUE NÃO SÃO OBRIGATÓRIO MAS O CLIENTE PODE CADASTRAR MAIS DE UM SE ASSIM DESEJAR.

INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','123456',3);
INSERT INTO TELEFONE VALUES(NULL,'RESIDENCIAL','78910',3);
INSERT INTO TELEFONE VALUES(NULL,'CELULAR','111213',1);
INSERT INTO TELEFONE VALUES(NULL,NULL,NULL,2);
INSERT INTO TELEFONE VALUES(NULL,'COMERCIAL','141516',1);

-- DADOS REGISTRADO COM SUCESSO, ALÉM DISSO ESTÁ DENTRO DA SOLICITAÇÃO DE SER REGISTRADO VÁRIOS NÚMEROS OU NADA
+------------+-------------+--------+------------+
| IDTELEFONE | TIPO        | NUMERO | ID_CLIENTE |
+------------+-------------+--------+------------+
|          1 | COMERCIAL   | 123456 |          3 |
|          2 | RESIDENCIAL | 78910  |          3 |
|          3 | CELULAR     | 111213 |          1 |
|          4 | COMERCIAL   | 141516 |          1 |
+------------+-------------+--------+------------+


