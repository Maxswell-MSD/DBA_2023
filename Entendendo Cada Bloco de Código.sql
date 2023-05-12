// TREINAMENTO
Maxswell Teste
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


-- CRIANDO USUÁRIO PARA TESTAR O IFNULL DA AULA 11. SE ESTIVER USANDO CHAVE PRIMÁRIA, DEVE INICIAR COLOCANDO
-- VALOR NULL E SEGUIR COM OS DADOS. O PRIMEIRO CAMPO TEM O VALOR COLOCADO AUTOMATICAMENTE. SE O REGISTRO
-- NÃO TIVER DADOS PARA SEREM PREENCHIDOS, COLOQUE NULL NO LUGAR DA COLUNA.
INSERT INTO CLIENTE VALUES(NULL, 'Felipe Silva', 'M', NULL, '123456789');





-- CRIANDO AGORA A TABELA ENDERECO QUE É OBRIGATÓRIO O CLIENTE TER O ENDEREÇO E ELE NÃO PODE TER MAIS QUE UM ENDEREÇO CADASTRADO.

CREATE TABLE ENDERECO(
IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,

RUA VARCHAR(100) NOT NULL,
BAIRRO VARCHAR(100) NOT NULL,
CIDADE VARCHAR(100) NOT NULL,
ESTADO CHAR(2) NOT NULL,
-- NESSE CASO DEFINIMOS INT UNIQUE QUE CADA CLIENTE SÓ PODE TER UM ENDEREÇO O INVERSO ERA SÓ RETIRAR O UNIQUE, ASSIM A RELAÇÃO SERIA DE VÁRIOS ENDEREÇOS
ID_CLIENTE INT UNIQUE,
--INSERINDO A CHAVE ESTRANGEIRA PARA LIGAR AS TABELAS CLIENTE E PEDIDO.
--ESTA CHAVE ESTRANGEIRA É NECESSÁRIA PARA GARANTIR A INTEGRIDADE REFERENCIAL DOS DADOS,
--ASSEGURANDO QUE UM PEDIDO POSSA ESTAR ASSOCIADO APENAS A UM CLIENTE VÁLIDO CADASTRADO.
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


-- CRIENDO ENDERECO PARA USUARIO fELIPE sILVA  PARA TESTAR O IFNULL DA AULA 11 

+-----------+--------------+------+-------+-----------+
| IDCLIENTE | NOME         | SEXO | EMAIL | CPF       |
+-----------+--------------+------+-------+-----------+
|        13 | Felipe Silva | M    | NULL  | 123456789 |
+-----------+--------------+------+-------+-----------+
INSERT INTO ENDERECO VALUES(NULL, 'Avenida Afonso Pena', 'Centro', 'Belo Horizonte', 'MG', 13);




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
INSERT INTO TELEFONE VALUES(NULL, 'COMERCIAL', '(16) 9593-2588', 13);

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


-- CORRIGINDO O SEXO. USAMOS O COMANDO "IN" PARA SELECIONAR OS REGISTROS QUE DESEJAMOS MODIFICAR COM BASE NOS INTERVALOS DE ID.
-- ISSO GARANTE QUE APENAS OS USUÁRIOS SELECIONADOS SEJAM ALTERADOS. SE HOUVER MAIS DE UM USUÁRIO COM O SEXO ERRADO,
-- DEVEMOS INCLUIR OUTROS INTERVALOS DE ID NA CLÁUSULA "IN".
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

/* AULA 11 PARTE 1 FUNÇÃO IFNULL*/


A função IFNULL é uma função condicional no SQL que retorna um valor alternativo se a expressão especificada for nula.

A sintaxe da função IFNULL é a seguinte:

IFNULL(expressão, valor_alternativo)

Aqui, a "expressão" é a expressão que será avaliada e pode ser qualquer valor ou coluna em uma tabela. Se a expressão for nula, a função IFNULL retornará o "valor_alternativo" especificado em seu lugar.

Por exemplo, suponha que você tenha uma tabela chamada "clientes" com uma coluna chamada "telefone". Se alguns registros não tiverem um número de telefone, você pode usar a função IFNULL para exibir um valor alternativo (como "N/A") para esses registros:

sql
Copy code
SELECT nome, IFNULL(telefone, 'N/A') as telefone FROM clientes;
Nesse caso, a função IFNULL será usada para verificar se a coluna "telefone" é nula. Se for nula, a função retornará "N/A". Caso contrário, ela retornará o valor da coluna "telefone".

/* A FUNÇÃO IFNUL PRECISA DE UMA COLUNA PARA ENCONTRAR VALOR NULO*/
+-----------+-----------------+------+--------------------------+-----------+
| IDCLIENTE | NOME            | SEXO | EMAIL                    | CPF       |
+-----------+-----------------+------+--------------------------+-----------+
|         1 | Max Diniz       | M    | maxdiniz@email.com       | 124564878 |
|         2 | Ana Silva       | F    | anasilva@email.com       | 987654321 |
|         3 | João Pedro      | M    | joaopedro@email.com      | 456789123 |
|         4 | Mariana Lima    | F    | marianalima@email.com    | 789123456 |
|         5 | Lucas Santos    | M    | lucassantos@email.com    | 321654987 |
|         6 | Juliana Almeida | F    | julianaalmeida@email.com | 159753456 |
|         7 | Rodrigo Silva   | M    | rodrigosilva@email.com   | 147258369 |
|         8 | Amanda Costa    | F    | amandacosta@email.com    | 369852147 |
|         9 | Felipe Martins  | M    | felipemartins@email.com  | 258147369 |
|        10 | Camila Souza    | F    | camilasouza@email.com    | 654321789 |
|        11 | Graça           | F    | graça@email.com          | 753951645 |
|        12 | Souza Camila    | F    | souzacamila@email.com    | 576159852 |
|        13 | Felipe Silva    | M    | NULL                     | 123456789 |
+-----------+-----------------+------+--------------------------+-----------+

-- COMANDO FICA IFNULL(), ESCOLHA A COLUNA ENVOLA ENTRE (NOMECOLUNA,'NOME QUE DESEJA COLOCAR EM CAMPO NULO'), 
--IFNULL(C.EMAIL,'NÃO TEM EMAIL' )AS 'EMAIL',


SELECT C.NOME,
	IFNULL(C.EMAIL,'NÃO TEM EMAIL' )AS 'EMAIL',
	E.ESTADO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+-----------------+--------------------------+--------+-----------------+
| NOME            | EMAIL                    | ESTADO | NUMERO          |
+-----------------+--------------------------+--------+-----------------+
| Max Diniz       | maxdiniz@email.com       | SP     | (11) 98765-4321 |
| Max Diniz       | maxdiniz@email.com       | SP     | (21) 2468-1357  |
| Max Diniz       | maxdiniz@email.com       | SP     | (11) 1234-5678  |
| Ana Silva       | anasilva@email.com       | RJ     | (21) 99876-5432 |
| Ana Silva       | anasilva@email.com       | RJ     | (21) 3579-2468  |
| João Pedro      | joaopedro@email.com      | RJ     | (11) 98765-1234 |
| João Pedro      | joaopedro@email.com      | RJ     | (31) 3698-1357  |
| Mariana Lima    | marianalima@email.com    | MG     | (11) 98765-8765 |
| Mariana Lima    | marianalima@email.com    | MG     | (31) 4567-2468  |
| Lucas Santos    | lucassantos@email.com    | SP     | (11) 98765-5678 |
| Lucas Santos    | lucassantos@email.com    | SP     | (41) 3698-1357  |
| Lucas Santos    | lucassantos@email.com    | SP     | (11) 98765-4321 |
| Juliana Almeida | julianaalmeida@email.com | PR     | (11) 99876-5432 |
| Juliana Almeida | julianaalmeida@email.com | PR     | (41) 3579-2468  |
| Rodrigo Silva   | rodrigosilva@email.com   | RS     | (11) 98765-1234 |
| Souza Camila    | souzacamila@email.com    | RJ     | (11) 1345-9465  |
| Souza Camila    | souzacamila@email.com    | RJ     | (11) 1593-9514  |
| Felipe Silva    | NÃO TEM EMAIL            | MG     | (16) 9593-2588  |
+-----------------+--------------------------+--------+-----------------+

-- PARA TRER UMA BOA APRESENTAÇÃO BASTA USA O RECURSO IFNULL PARA TROCAR EM VEZ DE CONSTAR NULL NO RELATÓRIO MODIFIQUE O NOME É COMUM ACHA **** EM LUGARES NULOS EXEMPLO



SELECT C.NOME,
	IFNULL(C.EMAIL,'***********' )AS 'EMAIL',
	E.ESTADO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+-----------------+--------------------------+--------+-----------------+
| NOME            | EMAIL                    | ESTADO | NUMERO          |
+-----------------+--------------------------+--------+-----------------+
| Max Diniz       | maxdiniz@email.com       | SP     | (11) 98765-4321 |
| Max Diniz       | maxdiniz@email.com       | SP     | (21) 2468-1357  |
| Max Diniz       | maxdiniz@email.com       | SP     | (11) 1234-5678  |
| Ana Silva       | anasilva@email.com       | RJ     | (21) 99876-5432 |
| Ana Silva       | anasilva@email.com       | RJ     | (21) 3579-2468  |
| João Pedro      | joaopedro@email.com      | RJ     | (11) 98765-1234 |
| João Pedro      | joaopedro@email.com      | RJ     | (31) 3698-1357  |
| Mariana Lima    | marianalima@email.com    | MG     | (11) 98765-8765 |
| Mariana Lima    | marianalima@email.com    | MG     | (31) 4567-2468  |
| Lucas Santos    | lucassantos@email.com    | SP     | (11) 98765-5678 |
| Lucas Santos    | lucassantos@email.com    | SP     | (41) 3698-1357  |
| Lucas Santos    | lucassantos@email.com    | SP     | (11) 98765-4321 |
| Juliana Almeida | julianaalmeida@email.com | PR     | (11) 99876-5432 |
| Juliana Almeida | julianaalmeida@email.com | PR     | (41) 3579-2468  |
| Rodrigo Silva   | rodrigosilva@email.com   | RS     | (11) 98765-1234 |
| Souza Camila    | souzacamila@email.com    | RJ     | (11) 1345-9465  |
| Souza Camila    | souzacamila@email.com    | RJ     | (11) 1593-9514  |
| Felipe Silva    | ***********              | MG     | (16) 9593-2588  |
+-----------------+--------------------------+--------+-----------------+

/* AULA 11 PARTE 2 ASSUNTO VIEW */

View, ou "visão" em português, é uma funcionalidade do SQL que permite criar uma visualização personalizada de uma ou mais tabelas em um banco de dados. Basicamente, uma view é uma consulta SQL armazenada que pode ser tratada como uma tabela virtual, que pode ser consultada, atualizada ou excluída como se fosse uma tabela real.

As views podem ser úteis por várias razões, incluindo:

Simplificar consultas complexas: ao criar uma view, você pode definir uma consulta complexa que une várias tabelas e aplicar filtros e seleções para limitar os dados exibidos. Isso pode tornar mais fácil para os usuários executar consultas complexas sem precisar entender completamente a estrutura de várias tabelas.
Restringir o acesso a dados: as views podem ser usadas para ocultar certas colunas ou linhas de uma tabela, tornando os dados mais seguros e restritos para determinados usuários ou grupos de usuários.
Resumir dados: as views podem ser usadas para criar resumos e agregações de dados, como médias, totais e contagens.
Simplificar a manutenção: ao criar views para as consultas frequentemente usadas, você pode simplificar a manutenção, atualizando a view em vez de atualizar as consultas em vários locais.
As views são especialmente úteis em bancos de dados com muitas tabelas e relacionamentos complexos, onde podem simplificar a consulta e a exibição de dados para os usuários finais.

-- A VIEW APONTA PARA A QUERY PARA PROJETAR DE FORMA RESUMIDA DADOS DE VÁRIAS COLUNAS EXEMPLO. USE CREATE VIEW SEGUIDO DE UM APELIDO PARA VOCÊ IDENTIFICAR QUAL QUERY DESEJA.
-- CREATE VIEW RELATORIO AS


CREATE VIEW RELATORIO AS
SELECT C.NOME,C.EMAIL,E.ESTADO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

-- REPARE QUE A VIEW GERA COMO SE FOSSE UMA TABELA CASO QUEIRA DELETAR BASTA USA O COMANDO DROP VIEW RELATORIO;

SHOW TABLES;
+--------------------+
| Tables_in_comercio |
+--------------------+
| cliente            |
| endereco           |
| produto            |
| relatorio          |
| telefone           |
+--------------------+

-- PARA VISUALIZAR A VIEW RELATORIO CRIADO DE FORMA SIMPLES. BASTA USAR O COMANDO SELECT * FROM RELATORIO OU O NOME QUE COLOCOU NA VIEW.
-- EM VEZ DE PASSAR BLOCO COMPLETO PARA O DESENVOLVIMENTO BASTA PASSAR A VIEW PARA O SETOR, ASSIM É MAIS SIMPLES.

SELECT * FROM RELATORIO;

+-----------------+--------------------------+--------+-----------------+
| NOME            | EMAIL                    | ESTADO | NUMERO          |
+-----------------+--------------------------+--------+-----------------+
| Max Diniz       | maxdiniz@email.com       | SP     | (11) 98765-4321 |
| Max Diniz       | maxdiniz@email.com       | SP     | (21) 2468-1357  |
| Max Diniz       | maxdiniz@email.com       | SP     | (11) 1234-5678  |
| Ana Silva       | anasilva@email.com       | RJ     | (21) 99876-5432 |
| Ana Silva       | anasilva@email.com       | RJ     | (21) 3579-2468  |
| João Pedro      | joaopedro@email.com      | RJ     | (11) 98765-1234 |
| João Pedro      | joaopedro@email.com      | RJ     | (31) 3698-1357  |
| Mariana Lima    | marianalima@email.com    | MG     | (11) 98765-8765 |
| Mariana Lima    | marianalima@email.com    | MG     | (31) 4567-2468  |
| Lucas Santos    | lucassantos@email.com    | SP     | (11) 98765-5678 |
| Lucas Santos    | lucassantos@email.com    | SP     | (41) 3698-1357  |
| Lucas Santos    | lucassantos@email.com    | SP     | (11) 98765-4321 |
| Juliana Almeida | julianaalmeida@email.com | PR     | (11) 99876-5432 |
| Juliana Almeida | julianaalmeida@email.com | PR     | (41) 3579-2468  |
| Rodrigo Silva   | rodrigosilva@email.com   | RS     | (11) 98765-1234 |
| Souza Camila    | souzacamila@email.com    | RJ     | (11) 1345-9465  |
| Souza Camila    | souzacamila@email.com    | RJ     | (11) 1593-9514  |
| Felipe Silva    | NULL                     | MG     | (16) 9593-2588  |
+-----------------+--------------------------+--------+-----------------+

/*INSERINDO UM PREFIXO V PARA RESUMIR A PALAVRA VIEW E USANDO A UNIÃO DE VIEW COM IFNULL*/

CREATE VIEW V_RELATORIO AS
SELECT C.NOME,C.SEXO,IFNULL(C.EMAIL,'Não tem Email') AS "E-mail",E.ESTADO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


SELECT NOME FROM V_RELATORIO; -- ESSA É A MANEIRA MAIS CORRETA EM VEZ DE COLOCAR * MAS PARA ESTUDO USAMOS SELECT * FROM

SELECT * FROM V_RELATORIO;

DROP VIEW V_RELATORIO;

SELECT * FROM RELATORIO;

-- PARA TER EFEITO PRECISA DROPA A VIEW CRIADA E ATUALIZAR NO BLOCO E CRIAR NOVAMENTE A VIEW PARA SURTIR EFEITO DA BUSCA ABAIXO.
SELECT * FROM V_RELATORIO
WHERE SEXO ='F';

-- COMANDO SHOW TABLES MOSTRA AS VIEWS JUNTO COM AS TABELAS E A FORMA DE APAGAR UMA VIEW É
DROP VIEW RELATORIO;

-- PODEMOS USAR A VIEW PARA GERAR OUTROS RELATÓRIOS SEM PRECISAR CRIAR O BLOCO INTEIRO MAS ISSO AFETA O DESEMPENHO, LEMBRANDO QUE PARA USAR
-- VIEW DEVE EXISTIR O BLOCO PARA A VIEW SETAR PARA ESTRURURA

SELECT NOME,NUMERO,ESTADO
FROM V_RELATORIO;

+-----------------+-----------------+--------+
| NOME            | NUMERO          | ESTADO |
+-----------------+-----------------+--------+
| Max Diniz       | (11) 98765-4321 | SP     |
| Max Diniz       | (21) 2468-1357  | SP     |
| Max Diniz       | (11) 1234-5678  | SP     |
| Ana Silva       | (21) 99876-5432 | RJ     |
| Ana Silva       | (21) 3579-2468  | RJ     |
| João Pedro      | (11) 98765-1234 | RJ     |
| João Pedro      | (31) 3698-1357  | RJ     |
| Mariana Lima    | (11) 98765-8765 | MG     |
| Mariana Lima    | (31) 4567-2468  | MG     |
| Lucas Santos    | (11) 98765-5678 | SP     |
| Lucas Santos    | (41) 3698-1357  | SP     |
| Lucas Santos    | (11) 98765-4321 | SP     |
| Juliana Almeida | (11) 99876-5432 | PR     |
| Juliana Almeida | (41) 3579-2468  | PR     |
| Rodrigo Silva   | (11) 98765-1234 | RS     |
| Souza Camila    | (11) 1345-9465  | RJ     |
| Souza Camila    | (11) 1593-9514  | RJ     |
| Felipe Silva    | (16) 9593-2588  | MG     |
+-----------------+-----------------+--------




-- 11 AULA PARTE 3  OPERAÇÕES DE DML EM VIEW


/* O QUE SE PODE FAZER EM INSERT, UPDATE E DELETE USANDO  VIEW */


-- INSERINDO INSERT USANDO UMA VIEW
INSERT INTO V_RELATORIO VALUES(
'Diniz Max','M','Diniz@email.com','19537652','Centro','Vitoria','ES'
);

-- ESSE RETORNO SIGNIFICA QUE NÃO SE PODE APLICAR INSERT EM TABELAS LIGADAS POR JOIN, OU SEJA COM TABELAS LIGADAS UMAS NAS OUTRAS.
ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list

/*SÓ É POSSÍVEL REALIZAR OS REGISTROS USANDO UMA VIEW EM UMA TABELA SEM LIGAÇÃO DE JOIN. MAS PODEMOS USAR O VIEW SÓ PARA REALIZAR 
UPDATE EM TABELAS LIGADAS POR JOIN.EM RESUMO NÃO É POSSÍVEL REALIZAR DML DE INSERTE E DELETE SÓ UPGRADE
*/

-- CRIANDO ABAIXO UM MODELO SEM LIGAÇÃO DE JOIN PARA TESTARMOS TODOS OS COMANDOS DML INSERT, UPGRADE E TELETE USANDO VIEW

CREATE TABLE JOGADOR(
	IDJOGADOR INT,
	NOME VARCHAR(30),
	ESTADO CHAR(2)

);

INSERT INTO JOGADOR VALUES(1,'Livi','RJ');
INSERT INTO JOGADOR VALUES(2,'T.Kroos','RJ');
INSERT INTO JOGADOR VALUES(3,'Talisca','RJ');
INSERT INTO JOGADOR VALUES(4,'Malcom','RJ');

-- CRIANDO UMA VIEW PARA TENTAR AGORA INSERIR OS DADOS SEM LIGAÇÃO DE JOIN

CREATE VIEW V_JOGADOR AS
SELECT NOME,ESTADO
FROM JOGADOR;

SELECT * FROM V_JOGADOR;

+---------+--------+
| NOME    | ESTADO |
+---------+--------+
| Livi    | RJ     |
| T.Kroos | RJ     |
| Talisca | RJ     |
| Malcom  | RJ     |
+---------+--------+


CREATE VIEW V_TIMES AS
SELECT NOME,ESTADO
FROM JOGADOR;



-- APLICANDO DELETE EM TABELA QUE NÃO POSSUEM JOIN
DELETE FROM V_JOGADOR WHERE NOME = 'Solts';

-- INSERINDO DADOS DE INSERT EM TABELA QUE NÃO POSSUEM JOIN
INSERT INTO V_JOGADOR VALUES('Solts','RJ');

-- REALIZANDO UPGRADE EM TABELA QUE NÃO POSSUEM JOIN

UPDATE V_JOGADOR SET NOME ='Solts'
WHERE NOME = 'Malcom';


-- PRECISA VERIFICAR SEMPRE ANTES SE TEM RESTRIÇÃO DE NOT NULL NESSE CASO O IDJOGADOR NÃO TEM E ISSO NÃO IMPEDE DE REGISTRAR OS DADOS MAS A CHAVE
-- PRIMÁRIA FICARIA COMO NULL EXEMPLO. IDJOGADOR INT, 
SELECT * FROM JOGADOR;
+-----------+---------+--------+
| IDJOGADOR | NOME    | ESTADO |
+-----------+---------+--------+
|         1 | Livi    | RJ     |
|         2 | T.Kroos | RJ     |
|         4 | Solts   | RJ     |
|      NULL | Talisca | RJ     |
+-----------+---------+--------+

ALTER TABLE JOGADOR
MODIFY COLUMN IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT;

-- 11 AULA 4 PARTE FINAL ORDENANDO DADOS COM ORDER BY

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)

);

INSERT INTO ALUNOS VALUES (1, 'João');
INSERT INTO ALUNOS VALUES (2, 'Maria');
INSERT INTO ALUNOS VALUES (3, 'Pedro');
INSERT INTO ALUNOS VALUES (4, 'Ana');
INSERT INTO ALUNOS VALUES (5, 'Lucas');
INSERT INTO ALUNOS VALUES (6, 'Julia');
INSERT INTO ALUNOS VALUES (7, 'Marcos');
INSERT INTO ALUNOS VALUES (8, 'Camila');
INSERT INTO ALUNOS VALUES (9, 'Felipe');
INSERT INTO ALUNOS VALUES (10, 'Mariana');

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | João    |
|      2 | Maria   |
|      3 | Pedro   |
|      4 | Ana     |
|      5 | Lucas   |
|      6 | Julia   |
|      7 | Marcos  |
|      8 | Camila  |
|      9 | Felipe  |
|     10 | Mariana |
+--------+---------+

-- ORDENANDO OS DADOS COM ORDER BY NOME , DESSA FORMA ORGANIZAMOS POR LETRAS

SELECT * FROM ALUNOS
ORDER BY NOME;

-- ORDENANDO OS DADOS COM ORDER BY NUMERO , DESSA FORMA ORGANIZAMOS POR NUMERO DO MENOR PARA O MAIOR

SELECT * FROM ALUNOS
ORDER BY NUMERO;

-- VOCÊ PODE ORDENAR PELOS VALORES TAMBÉM OU MAIS DE UMA COLUNA SE DESEJAR MAS OS DADOS NÃO SERÁ ORDENADO DE FORMA CORRETA.
SELECT * FROM ALUNOS
ORDER BY 1,2;

-- VOCÊ PODE ORDENAR COM NOME DAS COLUNAS, ASSIM AS COLUNAS SE TORNA ORGANIZADA DO MENOR PARA O MAIOR NÚMERO E NA ORDEM ALGABÉTICA
SELECT * FROM ALUNOS
ORDER BY NOME, NUMERO;

-- MESCLANDO ORDER BY COM PROJECAO MANEIRA MAIS CORRETA

SELECT NOME FROM ALUNOS
ORDER BY NOME, NUMERO;


-- COMANDO ORDER BY DESC / ASC ONDE DESC REPRESENTA ORDENAR DO MAIOR PARA O MENOR NUMERO OU LETRAS E O ASC PODE SER USADO OU NÃO PORQUE É PADRÃO

-- ESSE FATO ORDENA POR PALAVRAS
SELECT * FROM ALUNOS
ORDER BY NOME DESC;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      3 | Pedro   |
|     10 | Mariana |
|      2 | Maria   |
|      7 | Marcos  |
|      5 | Lucas   |
|      6 | Julia   |
|      1 | João    |
|      9 | Felipe  |
|      8 | Camila  |
|      4 | Ana     |
+--------+---------+
-- ESSE FATO ORDENA POR NUMEROS DO MAIOR PARA O MENOR
SELECT * FROM ALUNOS
ORDER BY NUMERO DESC;

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|     10 | Mariana |
|      9 | Felipe  |
|      8 | Camila  |
|      7 | Marcos  |
|      6 | Julia   |
|      5 | Lucas   |
|      4 | Ana     |
|      3 | Pedro   |
|      2 | Maria   |
|      1 | João    |
+--------+---------+

-- ESSE FATO ORDENA POR NUMEROS DO MAIOR PARA O MENOR NAS DUAS COLUNAS
SELECT * FROM ALUNOS
ORDER BY 1 DESC, 2 DESC;

-- ORDENANDO COM JOINS O ORDER BAY (1) REPRESENTA A PRIMEIRA COLUNA CONFORME O SELECT NESSE CASO C.NOME 

SELECT C.NOME,
	IFNULL(C.EMAIL,'***********' )AS 'EMAIL',
	E.ESTADO,T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
ORDER BY 1;



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#########################################################################################
#	12 PROGRAMANDO EM sql																#
#																						#
#ASSUNTO DELIMITER AULA 1 - delimiter												    #
#																						#
#########################################################################################

/* 12 AULA TROCANDO O LIMITADOR DE COMANDO DE ; PARA $*/
-- MUDANDO O DELIMITER DE ; PARA $ OU QUALQUER OUTRO 
DELIMITER ;
STATUS -- PARA VERIFICAR A CONFIGURAÇÃO

C:\Program Files (x86)\MySQL\MySQL Server 5.7\bin\mysql.exe  Ver 14.14 Distrib 5.7.20, for Win32 (AMD64)

Connection id:          3
Current database:       comercio
Current user:           root@localhost
SSL:                    Not in use
Using delimiter:        $
Server version:         5.7.20-log MySQL Community Server (GPL)
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8
Db     characterset:    utf8
Client characterset:    utf8
Conn.  characterset:    utf8
TCP port:               3306
Uptime:                 43 min 35 sec

-- REALIZANDO O TESTE OBSERVER QUE O COMANDO DELIMITER COM ; NÃO FUNCIONA PORQUE FOI TROCADO POR $ 

SELECT * FROM CLIENTE;

mysql> SELECT * FROM CLIENTE;
    ->

-- REALIZANDO O TESTE
STATUS
SELECT * FROM CLIENTE$

> SELECT * FROM CLIENTE$
+-----------+-----------------+------+--------------------------+-----------+
| IDCLIENTE | NOME            | SEXO | EMAIL                    | CPF       |
+-----------+-----------------+------+--------------------------+-----------+
|         1 | Max Diniz       | M    | maxdiniz@email.com       | 124564878 |
|         2 | Ana Silva       | F    | anasilva@email.com       | 987654321 |
|         3 | João Pedro      | M    | joaopedro@email.com      | 456789123 |
|         4 | Mariana Lima    | F    | marianalima@email.com    | 789123456 |
|         5 | Lucas Santos    | M    | lucassantos@email.com    | 321654987 |
|         6 | Juliana Almeida | F    | julianaalmeida@email.com | 159753456 |
|         7 | Rodrigo Silva   | M    | rodrigosilva@email.com   | 147258369 |
|         8 | Amanda Costa    | F    | amandacosta@email.com    | 369852147 |
|         9 | Felipe Martins  | M    | felipemartins@email.com  | 258147369 |
|        10 | Camila Souza    | F    | camilasouza@email.com    | 654321789 |
|        11 | Graça           | F    | graça@email.com          | 753951645 |
|        12 | Souza Camila    | F    | souzacamila@email.com    | 576159852 |
|        13 | Felipe Silva    | M    | NULL                     | 123456789 |



/*DELIMITER NO BANCO DE DADOS A CADA FINAL DE BLOCO SE FINALIZA COM ; FUTURAMENTE DEVEMOS MODIFICAR ESSE LIMITADOR MAS COM COMANDO STATUS
CONSEGUIMOS TER INFORMAÇÕES SE TEM CRIPTOGRAFIA SSL , QUAL É O DELIMITER  E O UPTIME CASO O SISTEMA CAIU VOCÊ CONSEGUE IDENTIFICAR SE ELE FOI A CAUSA.
*/

status

C:\Program Files (x86)\MySQL\MySQL Server 5.7\bin\mysql.exe  Ver 14.14 Distrib 5.7.20, for Win32 (AMD64)

Connection id:          3
Current database:       comercio
Current user:           root@localhost
SSL:                    Not in use
Using delimiter:        ;
Server version:         5.7.20-log MySQL Community Server (GPL)
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8
Db     characterset:    utf8
Client characterset:    utf8
Conn.  characterset:    utf8
TCP port:               3306
Uptime:                 38 min 34 sec


#########################################################################################
#	12 PROGRAMANDO EM SQL																#
#																						#
# 2 - STORED PROCEDURES INICIANDO COM PROGRAMAÇÃO EM BANCOS DE DADOS					#
#																						#
#########################################################################################

 /* STORED PROCEDURES*/

 -- OBS : A PRIMEIRA COISA A FAZER É TROCAR O DELIMITER PARA NÃO INTERFERIR NA PROGRAMAÇÃO

-- VERIFIQUE A CONFIGURAÇÃO DO DELIMITER E DEPOIS MUDE O DELIMITER
 STATUS

 C:\Program Files (x86)\MySQL\MySQL Server 5.7\bin\mysql.exe  Ver 14.14 Distrib 5.7.20, for Win32 (AMD64)

Connection id:          4
Current database:       comercio
Current user:           root@localhost
SSL:                    Not in use
Using delimiter:        ;
Server version:         5.7.20-log MySQL Community Server (GPL)
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8
Db     characterset:    utf8
Client characterset:    utf8
Conn.  characterset:    utf8
TCP port:               3306
Uptime:                 12 min 47 sec

Threads: 1  Questions: 8  Slow queries: 0  Opens: 108  Flush tables: 1  Open tables: 101  Queries per second avg: 0.010

-- MUDANDO O DELIMITER PORQUE DENTRO DA PROGRAMAÇÃO VAMOS FINALIZAR SEMPRE COM ; POR ISSO PRECISAMOS ALTERAR O DELIMITER PARA NÃO SURGIR CONFLITO
DELIMITER $

-- PARA CRIAR UM PROCEDIMENTO USANDO O PROCEDURE E BEGIN ABAIXO UM EXEMPLO:

CREATE PROCEDURE NOME()
BEGIN
	
	QUALQUER PROGRAMACAO

END
$

-- REALIZANDO UMA PROCEDURE SEM PARAMETRO TRAZENDO O NOME DA EMPRESA

CREATE PROCEDURE NOME_EMPRESA()
BEGIN

	SELECT 'AULA DE PROGRAMAÇÃO EM MYSQL' AS EMPRESA;

END

$

/* CHAMANDO UMA PROCEDURE COM CALL*/

CALL NOME_EMPRESA$

mysql> CALL NOME_EMPRESA$
+--------------------------------+
| EMPRESA                        |
+--------------------------------+
| AULA DE PROGRAMAÇÃO EM MYSQL   |
+--------------------------------+

-- SE NÃO FOR PROGRAMAR MAIS NADA, TROQUE SEMPRE O DELIMITADOR USE SÓ QUANDO FOR PROGRAMAR VOCÊ CONSEGUE CHAMAR USANDO QUALQUER DELIMITADOR DE MOMENTO

DELIMITER ;
DELIMITER $

/* PROCEDURE COM PARÂMETRO EXEMPLO ABAIXO*/

SELECT 10 + 10 AS CONTA$

+-------+
| CONTA |
+-------+
|    20 |
+-------+

-- CRIANDO O BLOCO DE CÁLCULO DE ADIÇÃO

CREATE PROCEDURE CONTA(NUMERO1 INT,NUMERO2 INT)
BEGIN

	SELECT NUMERO1 + NUMERO2 AS CONTA ;

END
$

-- CHAMANDO O PROCEDURE DE CONTA COM CALL COM OS DADOS REFERENTE, ASSIM O RESULTADO SERÁ MOSTRADO 100 REPRESENTA NUMERO 1 E 50 NUMERO 2

CALL CONTA(100,50)$
CALL CONTA(5,50)$
CALL CONTA(25,12)$

+-------+
| CONTA |
+-------+
|   150 |
+-------+




-- APAGANDO UMA PROCEDURE

DROP PROCEDURE CONTA$



#########################################################################################
#	12 PROGRAMANDO EM SQL																#
#																						#
# 3 - PROCEDURES COM QUERY - PARÂMETROS INICIANDO COM PROGRAMAÇÃO EM BANCOS DE DADOS	#
#																						#
#########################################################################################
Procedures são um tipo de objeto no SQL que permitem armazenar uma sequência de comandos para execução posterior, como um script. Elas são úteis em situações onde você precisa executar uma série de comandos SQL repetidamente, ou quando você precisa fazer várias alterações em um banco de dados de uma só vez.

Os pontos fortes das procedures são a capacidade de modularizar e encapsular a lógica de negócios em um banco de dados, além de aumentar a segurança do banco de dados, uma vez que as permissões de execução podem ser concedidas apenas às pessoas autorizadas. Outra vantagem é que as procedures podem ser reutilizadas em diferentes partes do código e, se bem projetadas, podem melhorar significativamente a performance do banco de dados.

Os pontos fracos incluem a possibilidade de sobrecarregar o banco de dados com procedures complexas e mal projetadas, além de tornar o gerenciamento do banco de dados mais difícil, uma vez que as procedures podem ser difíceis de manter e documentar. Outra desvantagem é que as procedures podem se tornar dependentes do banco de dados em que foram escritas e podem não funcionar corretamente em outros bancos de dados.

Em resumo, as procedures são um recurso útil em muitas situações no SQL, mas devem ser usadas com cuidado e de maneira planejada para evitar problemas de manutenção e desempenho.
 
 /* PROCEDURES COM QUERY - PARÂMETROS*/