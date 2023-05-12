// TREINAMENTO

-- CRIANDO BANCO DE DADOS

CREATE DATABASE COMERCIO;

-- USANDO O BANCO 
USE COMERCIO;

-- criando as tabelas

CREATE TABLE CLIENTE(
-- CRIANDO A CHAVE PRIMÁRIA DANDO AO BANCO A LIBERTADE DE GERAR AS CHAVES AUTOMATICAMENTE
IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,

NOME VARCHAR(100) NOT NULL,
SEXO ENUM('F','M') NOT NULL,
EMAIL VARCHAR(100) UNIQUE,
CPF VARCHAR(15) UNIQUE


);

-- CRIANDO OS INSERT DA TABELA CLIENTE

INSERT INTO CLIENTE VALUES(NULL,'Max Diniz','M','maxdiniz@email.com','124564878');
INSERT INTO CLIENTE VALUES(NULL,'Ana Silva','F','anasilva@email.com','987654321');
INSERT INTO CLIENTE VALUES(NULL,'João Pedro','M','joaopedro@email.com','456789123');
INSERT INTO CLIENTE VALUES(NULL,'Mariana Lima','F','marianalima@email.com','789123456');
INSERT INTO CLIENTE VALUES(NULL,'Lucas Santos','M','lucassantos@email.com','321654987');
INSERT INTO CLIENTE VALUES(NULL,'Juliana Almeida','F','julianaalmeida@email.com','159753456');
INSERT INTO CLIENTE VALUES(NULL,'Rodrigo Silva','M','rodrigosilva@email.com','147258369');
INSERT INTO CLIENTE VALUES(NULL,'Amanda Costa','F','amandacosta@email.com','369852147');
INSERT INTO CLIENTE VALUES(NULL,'Felipe Martins','M','felipemartins@email.com','258147369');
INSERT INTO CLIENTE VALUES(NULL,'Camila Souza','F','camilasouza@email.com','654321789');




-- CRIANDO AGORA A TABELA ENDERECO QUE É OBRIGATÓRIO O CLIENTE TER O ENDEREÇO E ELE NÃO PODE TER MAIS QUE UM ENDEREÇO CADASTRADO.

CREATE TABLE ENDERECO(
IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,

RUA VARCHAR(100) NOT NULL,
BAIRRO VARCHAR(100) NOT NULL,
CIDADE VARCHAR(100) NOT NULL,
ESTADO CHAR(2) NOT NULL,
ID_CLIENTE INT UNIQUE,
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE)

);

-- CRIANDO OS INSERT DA TABELA ENDERECO

INSERT INTO ENDERECO VALUES(NULL, 'Rua Oscar Freire', 'Jardins', 'São Paulo', 'SP', 1);
INSERT INTO ENDERECO VALUES(NULL, 'Rua Marquês de Abrantes', 'Flamengo', 'Rio de Janeiro', 'RJ', 2);
INSERT INTO ENDERECO VALUES(NULL, 'Avenida Atlântica', 'Copacabana', 'Rio de Janeiro', 'RJ', 3);
INSERT INTO ENDERECO VALUES(NULL, 'Rua Padre Eustáquio', 'Padre Eustáquio', 'Belo Horizonte', 'MG', 4);
INSERT INTO ENDERECO VALUES(NULL, 'Rua Guaicurus', 'Centro', 'São Paulo', 'SP', 5);
INSERT INTO ENDERECO VALUES(NULL, 'Rua XV de Novembro', 'Centro', 'Curitiba', 'PR', 6);
INSERT INTO ENDERECO VALUES(NULL, 'Rua da Praia', 'Centro Histórico', 'Porto Alegre', 'RS', 7);
INSERT INTO ENDERECO VALUES(NULL, 'Rua 14 de Julho', 'Centro', 'Campo Grande', 'MS', 8);
INSERT INTO ENDERECO VALUES(NULL, 'Avenida Paulista', 'Bela Vista', 'São Paulo', 'SP', 9);
INSERT INTO ENDERECO VALUES(NULL, 'Avenida Afonso Pena', 'Centro', 'Belo Horizonte', 'MG', 10);

INSERT INTO ENDERECO VALUES(NULL,'Rua Marechal Floriano','Centro','Rio de Janeiro','RJ',12);


-- CRIANDO AGORA A TABELA TELEFONE QUE NESSA MODELAGEM DE DADOS NÃO É OBRIGATÓRIO E CASO O CLIENTE DESEJAR COLOCAR ELE PODE TER VÁRIOS TELEFONES.

CREATE TABLE TELEFONE(
IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,

TIPO ENUM('CELULAR','RESIDENCIAL','COMERCIAL') NOT NULL,
NUMERO VARCHAR(15)NOT NULL,
ID_CLIENTE INT,
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE)	

);

-- CRIANDO OS INSERT

INSERT INTO TELEFONE VALUES(NULL, 'CELULAR', '(11) 98765-4321', 1);
INSERT INTO TELEFONE VALUES(NULL, 'RESIDENCIAL', '(21) 2468-1357', 1);
INSERT INTO TELEFONE VALUES(NULL, 'COMERCIAL', '(11) 1234-5678', 1);
INSERT INTO TELEFONE VALUES(NULL, 'CELULAR', '(21) 99876-5432', 2);
INSERT INTO TELEFONE VALUES(NULL, 'RESIDENCIAL', '(21) 3579-2468', 2);
INSERT INTO TELEFONE VALUES(NULL, 'CELULAR', '(11) 98765-1234', 3);
INSERT INTO TELEFONE VALUES(NULL, 'RESIDENCIAL', '(31) 3698-1357', 3);
INSERT INTO TELEFONE VALUES(NULL, 'CELULAR', '(11) 98765-8765', 4);
INSERT INTO TELEFONE VALUES(NULL, 'RESIDENCIAL', '(31) 4567-2468', 4);
INSERT INTO TELEFONE VALUES(NULL, 'CELULAR', '(11) 98765-5678', 5);
INSERT INTO TELEFONE VALUES(NULL, 'RESIDENCIAL', '(41) 3698-1357', 5);
INSERT INTO TELEFONE VALUES(NULL, 'COMERCIAL', '(11) 98765-4321', 5);
INSERT INTO TELEFONE VALUES(NULL, 'CELULAR', '(11) 99876-5432', 6);
INSERT INTO TELEFONE VALUES(NULL, 'RESIDENCIAL', '(41) 3579-2468', 6);
INSERT INTO TELEFONE VALUES(NULL, 'CELULAR', '(11) 98765-1234', 7);

INSERT INTO TELEFONE VALUES(NULL, 'CELULAR', '(11) 1345-9465', 12);
INSERT INTO TELEFONE VALUES(NULL, 'COMERCIAL', '(11) 1593-9514', 12);

-- REALIZANDO A SELEÇÃO, PROJEÇÃO E JUNÇÃO COM INNER JOIN DE DUAS OU MAIS TABELAS

SELECT NOME,SEXO,BAIRRO,RUA
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;

SELECT NOME,SEXO,BAIRRO,RUA
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
WHERE NOME ='Max Diniz';

-- REALIZANDO AGORA A PROJEÇÃO DAS TABELAS CRIADAS

SELECT C.NOME,C.SEXO,E.BAIRRO,E.RUA,T.NUMERO,T.TIPO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT C.NOME,C.SEXO,E.BAIRRO,E.RUA,T.NUMERO,T.TIPO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE NOME = 'Max Diniz';



-- TREINAMENTO DML QUE É A MANIPULAÇÃO DOS DADOS ) DATA MANIPULATION LANGUAGE É A INSERÇÃO, UPGRADE E DELETE
-- INSERT FAZ PARTE DESSA CATEGORIA EXEMPLO

INSERT INTO CLIENTE VALUES(NULL,'Graça','F','graça@email.com','753951645');
INSERT INTO ENDERECO VALUES(NULL, 'Rua 10 de Janeiro', 'Centro', 'Rio de Janeiro', 'RJ', 11);

SELECT * FROM CLIENTE WHERE NOME ='Graça';

/*filtros*/

SELECT * FROM CLIENTE
WHERE SEXO = 'F';

/*REALIZANDO O UPDATE DE FORMA CORRETA USANDO AS CHAVES */

INSERT INTO CLIENTE VALUES(NULL,'XXXX','M','XXXX','XXXXXXX');
INSERT INTO ENDERECO VALUES(NULL, 'RXXXXXXX', 'XXXXX', 'XXXXX', 'XX', 12);

-- SEMPRE USE SELECT * FROM PARA FILTRAR UM NOME
SELECT * FROM CLIENTE WHERE NOME = 'XXXX';

-- UPDATE SEMPRE VISUALIZE SE É O USUÁRIO QUE DESEJA MODIFICAR
SELECT * FROM CLIENTE WHERE IDCLIENTE = 12;

UPDATE CLIENTE
SET NOME = 'Samya Diniz'
WHERE IDCLIENTE = 12;

SELECT * FROM CLIENTE WHERE IDCLIENTE = 12;

+-----------+-------------+------+-------+---------+
| IDCLIENTE | NOME        | SEXO | EMAIL | CPF     |
+-----------+-------------+------+-------+---------+
|        12 | Samya Diniz | M    | XXXX  | XXXXXXX |
+-----------+-------------+------+-------+---------+

-- 11 AULA, ACRESCENTANDO NOVAS COLUNAS NAS TABELAS, MODIFICANDO O TIPO DA COLUNA, NOME E POSIÇÃO DE ORDEM NAS COLUNAS.

----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| PESO           | float(10,2) | NO   |     | NULL    |                |
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


CREATE TABLE PRODUTO(
IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
NOME_PRODUTO VARCHAR(100) NOT NULL,
VALOR FLOAT(10,2),
FRETE FLOAT(20,2) NOT NULL
);

/*MODIFICANDO O NOME DA COLUNA*/

ALTER TABLE PRODUTO
CHANGE COLUMN VALOR VALOR_UNITARIO FLOAT(10,2) NOT NULL;

/*CRIANDO UMA NOVA COLUNA*/

ALTER TABLE PRODUTO
ADD PESO VARCHAR(20) NOT NULL;

/*MODIFICANDO O TIPO DDL*/

ALTER TABLE PRODUTO
MODIFY COLUMN VALOR_UNITARIO VARCHAR(20) NOT NULL;

/*COLOCANDO A COLUNA PESO ENTRE A COLUNA NOME_PRODUTO E VALOR_UNITARIO*/
ALTER TABLE PRODUTO
 AFTER COLUMN PESO  varchar(20)NOT NULL, AFTER NOME_PRODUTO;


 /*-------------------------------------------------------------*/

 -- EXERCÍCIOS PARA COMPLETAR A AULA E DOMINAR O ASSUNTO



/* RELATORIO GERAL DE TODOS OS CLIENTES*/ --DML

DESC CLIENTE;
DESC ENDERECO;
DESC TELEFONE;

SELECT C.IDCLIENTE,C.NOME,C.SEXO,C.EMAIL,C.CPF,
		E.RUA,E.CIDADE,E.ESTADO,
		T.TIPO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


-- ABAIXO ESTÁ O RESULTADO DO PRIMEIRO EXERCÍCIO.
+-----------+-----------------+------+--------------------------+-----------+--------------------------+----------------+--------+-------------+-----------------+
| IDCLIENTE | NOME            | SEXO | EMAIL                    | CPF       | RUA                      | CIDADE         | ESTADO | TIPO        | NUMERO          |
+-----------+-----------------+------+--------------------------+-----------+--------------------------+----------------+--------+-------------+-----------------+
|         1 | Max Diniz       | M    | maxdiniz@email.com       | 124564878 | Rua Oscar Freire         | São Paulo      | SP     | CELULAR     | (11) 98765-4321 |
|         1 | Max Diniz       | M    | maxdiniz@email.com       | 124564878 | Rua Oscar Freire         | São Paulo      | SP     | RESIDENCIAL | (21) 2468-1357  |
|         1 | Max Diniz       | M    | maxdiniz@email.com       | 124564878 | Rua Oscar Freire         | São Paulo      | SP     | COMERCIAL   | (11) 1234-5678  |
|         2 | Ana Silva       | F    | anasilva@email.com       | 987654321 | Rua Marquês de Abrantes  | Rio de Janeiro | RJ     | CELULAR     | (21) 99876-5432 |
|         2 | Ana Silva       | F    | anasilva@email.com       | 987654321 | Rua Marquês de Abrantes  | Rio de Janeiro | RJ     | RESIDENCIAL | (21) 3579-2468  |
|         3 | João Pedro      | M    | joaopedro@email.com      | 456789123 | Avenida Atlântica        | Rio de Janeiro | RJ     | CELULAR     | (11) 98765-1234 |
|         3 | João Pedro      | M    | joaopedro@email.com      | 456789123 | Avenida Atlântica        | Rio de Janeiro | RJ     | RESIDENCIAL | (31) 3698-1357  |
|         4 | Mariana Lima    | F    | marianalima@email.com    | 789123456 | Rua Padre Eustáquio      | Belo Horizonte | MG     | CELULAR     | (11) 98765-8765 |
|         4 | Mariana Lima    | F    | marianalima@email.com    | 789123456 | Rua Padre Eustáquio      | Belo Horizonte | MG     | RESIDENCIAL | (31) 4567-2468  |
|         5 | Lucas Santos    | M    | lucassantos@email.com    | 321654987 | Rua Guaicurus            | São Paulo      | SP     | CELULAR     | (11) 98765-5678 |
|         5 | Lucas Santos    | M    | lucassantos@email.com    | 321654987 | Rua Guaicurus            | São Paulo      | SP     | RESIDENCIAL | (41) 3698-1357  |
|         5 | Lucas Santos    | M    | lucassantos@email.com    | 321654987 | Rua Guaicurus            | São Paulo      | SP     | COMERCIAL   | (11) 98765-4321 |
|         6 | Juliana Almeida | F    | julianaalmeida@email.com | 159753456 | Rua XV de Novembro       | Curitiba       | PR     | CELULAR     | (11) 99876-5432 |
|         6 | Juliana Almeida | F    | julianaalmeida@email.com | 159753456 | Rua XV de Novembro       | Curitiba       | PR     | RESIDENCIAL | (41) 3579-2468  |
|         7 | Rodrigo Silva   | M    | rodrigosilva@email.com   | 147258369 | Rua da Praia             | Porto Alegre   | RS     | CELULAR     | (11) 98765-1234 |
|        12 | Souza Camila    | F    | souzacamila@email.com    | 576159852 | Rua Marechal Floriano    | Rio de Janeiro | RJ     | CELULAR     | (11) 1345-9465  |
|        12 | Souza Camila    | F    | souzacamila@email.com    | 576159852 | Rua Marechal Floriano    | Rio de Janeiro | RJ     | COMERCIAL   | (11) 1593-9514  |
+-----------+-----------------+------+--------------------------+-----------+--------------------------+----------------+--------+-------------+-----------------+

/* RELATORIO DE HOMENS*/

SELECT C.IDCLIENTE,C.NOME,C.SEXO,C.EMAIL,C.CPF,
		E.RUA,E.CIDADE,E.ESTADO,
		T.TIPO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO ='M';


-- RESULTADO DO EXERCÍCIO

+-----------+---------------+------+------------------------+-----------+--------------------+----------------+--------+-------------+-----------------+
| IDCLIENTE | NOME          | SEXO | EMAIL                  | CPF       | RUA                | CIDADE         | ESTADO | TIPO        | NUMERO          |
+-----------+---------------+------+------------------------+-----------+--------------------+----------------+--------+-------------+-----------------+
|         1 | Max Diniz     | M    | maxdiniz@email.com     | 124564878 | Rua Oscar Freire   | São Paulo      | SP     | CELULAR     | (11) 98765-4321 |
|         1 | Max Diniz     | M    | maxdiniz@email.com     | 124564878 | Rua Oscar Freire   | São Paulo      | SP     | RESIDENCIAL | (21) 2468-1357  |
|         1 | Max Diniz     | M    | maxdiniz@email.com     | 124564878 | Rua Oscar Freire   | São Paulo      | SP     | COMERCIAL   | (11) 1234-5678  |
|         3 | João Pedro    | M    | joaopedro@email.com    | 456789123 | Avenida Atlântica  | Rio de Janeiro | RJ     | CELULAR     | (11) 98765-1234 |
|         3 | João Pedro    | M    | joaopedro@email.com    | 456789123 | Avenida Atlântica  | Rio de Janeiro | RJ     | RESIDENCIAL | (31) 3698-1357  |
|         5 | Lucas Santos  | M    | lucassantos@email.com  | 321654987 | Rua Guaicurus      | São Paulo      | SP     | CELULAR     | (11) 98765-5678 |
|         5 | Lucas Santos  | M    | lucassantos@email.com  | 321654987 | Rua Guaicurus      | São Paulo      | SP     | RESIDENCIAL | (41) 3698-1357  |
|         5 | Lucas Santos  | M    | lucassantos@email.com  | 321654987 | Rua Guaicurus      | São Paulo      | SP     | COMERCIAL   | (11) 98765-4321 |
|         7 | Rodrigo Silva | M    | rodrigosilva@email.com | 147258369 | Rua da Praia       | Porto Alegre   | RS     | CELULAR     | (11) 98765-1234 |
+-----------+---------------+------+------------------------+-----------+--------------------+----------------+--------+-------------+-----------------+

/* RELATORIO DE MULHERES*/
SELECT C.IDCLIENTE,C.NOME,C.SEXO,C.EMAIL,C.CPF,
		E.RUA,E.CIDADE,E.ESTADO,
		T.TIPO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO ='F';

-- RESULTADO REALIZADO COM SUCESSO
+-----------+-----------------+------+--------------------------+-----------+--------------------------+----------------+--------+-------------+-----------------+
| IDCLIENTE | NOME            | SEXO | EMAIL                    | CPF       | RUA                      | CIDADE         | ESTADO | TIPO        | NUMERO          |
+-----------+-----------------+------+--------------------------+-----------+--------------------------+----------------+--------+-------------+-----------------+
|         2 | Ana Silva       | F    | anasilva@email.com       | 987654321 | Rua Marquês de Abrantes  | Rio de Janeiro | RJ     | CELULAR     | (21) 99876-5432 |
|         2 | Ana Silva       | F    | anasilva@email.com       | 987654321 | Rua Marquês de Abrantes  | Rio de Janeiro | RJ     | RESIDENCIAL | (21) 3579-2468  |
|         4 | Mariana Lima    | F    | marianalima@email.com    | 789123456 | Rua Padre Eustáquio      | Belo Horizonte | MG     | CELULAR     | (11) 98765-8765 |
|         4 | Mariana Lima    | F    | marianalima@email.com    | 789123456 | Rua Padre Eustáquio      | Belo Horizonte | MG     | RESIDENCIAL | (31) 4567-2468  |
|         6 | Juliana Almeida | F    | julianaalmeida@email.com | 159753456 | Rua XV de Novembro       | Curitiba       | PR     | CELULAR     | (11) 99876-5432 |
|         6 | Juliana Almeida | F    | julianaalmeida@email.com | 159753456 | Rua XV de Novembro       | Curitiba       | PR     | RESIDENCIAL | (41) 3579-2468  |
|        12 | Souza Camila    | F    | souzacamila@email.com    | 576159852 | Rua Marechal Floriano    | Rio de Janeiro | RJ     | CELULAR     | (11) 1345-9465  |
|        12 | Souza Camila    | F    | souzacamila@email.com    | 576159852 | Rua Marechal Floriano    | Rio de Janeiro | RJ     | COMERCIAL   | (11) 1593-9514  |
+-----------+-----------------+------+--------------------------+-----------+--------------------------+----------------+--------+-------------+-----------------+
/* QUANTIDADE DE HOMENS E MULHERES*/

SELECT SEXO, COUNT(*) AS 'TOTAL DE HOMENS E MULHERES'
FROM CLIENTE GROUP BY SEXO;

+------+----------------------------+
| SEXO | TOTAL DE HOMENS E MULHERES |
+------+----------------------------+
| F    |                          7 |
| M    |                          5 |
+------+----------------------------+


-- CORIGINDO O SEXO USAMOS O COMANDO IN PARA COLOCAR DENTRO DA SELEÇÃO OS INTERVALOS DO ID QUE DESEJAMOS MODIFICAR CASO TIVER MAIS USUARIOS ERRADO

UPDATE CLIENTE
SET SEXO = 'M'
WHERE IDCLIENTE IN (6,12);

SELECT * FROM CLIENTE WHERE IDCLIENTE IN (6,12);

+-----------+-----------------+------+--------------------------+-----------+
| IDCLIENTE | NOME            | SEXO | EMAIL                    | CPF       |
+-----------+-----------------+------+--------------------------+-----------+
|         6 | Juliana Almeida | M    | julianaalmeida@email.com | 159753456 |
|        12 | Souza Camila    | M    | souzacamila@email.com    | 576159852 |
+-----------+-----------------+------+--------------------------+-----------+

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE IN (6,12);

+-----------+-----------------+------+--------------------------+-----------+
| IDCLIENTE | NOME            | SEXO | EMAIL                    | CPF       |
+-----------+-----------------+------+--------------------------+-----------+
|         6 | Juliana Almeida | F    | julianaalmeida@email.com | 159753456 |
|        12 | Souza Camila    | F    | souzacamila@email.com    | 576159852 |
+-----------+-----------------+------+--------------------------+-----------+


/* IDS E EMAIL DAS MULHERES QUE MOREM NO CNETRO DO RIO DE JANEIRO QUE NÃO POSSUI CELULAR  ESSE EXERCÍCIO CONTINUARÁ*/




/*PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR DOS CLIENTES QUE MORAM NO ESTADO DO
RIO DE JANEIRO VOC~E TERÁ QUE PASSAR A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR*/

SELECT C.NOME,C.EMAIL,E.ESTADO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE TIPO ='CELULAR' AND ESTADO ='RJ';

+--------------+-----------------------+--------+-----------------+
| NOME         | EMAIL                 | ESTADO | NUMERO          |
+--------------+-----------------------+--------+-----------------+
| Ana Silva    | anasilva@email.com    | RJ     | (21) 99876-5432 |
| João Pedro   | joaopedro@email.com   | RJ     | (11) 98765-1234 |
| Souza Camila | souzacamila@email.com | RJ     | (11) 1345-9465  |
+--------------+-----------------------+--------+-----------------+


/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR DOS HOMENS
QUE MORAM NO ESTADO DE SÃO PAULO*/

SELECT C.NOME,C.EMAIL,E.ESTADO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO ='M' AND TIPO ='CELULAR' AND ESTADO = 'SP';

+--------------+-----------------------+--------+-----------------+
| NOME         | EMAIL                 | ESTADO | NUMERO          |
+--------------+-----------------------+--------+-----------------+
| Max Diniz    | maxdiniz@email.com    | SP     | (11) 98765-4321 |
| Lucas Santos | lucassantos@email.com | SP     | (11) 98765-5678 |
+--------------+-----------------------+--------+-----------------+













