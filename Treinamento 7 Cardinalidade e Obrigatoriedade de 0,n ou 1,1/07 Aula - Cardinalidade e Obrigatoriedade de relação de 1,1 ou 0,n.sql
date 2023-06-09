/*
CARDINALIEDADE E OBRIGATÓRIEDADE DE CHAVES ESTRANGUEIRAS DE 0,N E 1,1

0 SIGNINICA QUE NÃO É OBRIGATÓRIO A COLOCAÇÃO DOS DADOS
N SIGNIFICA QUE PODE TER VÁRIOS DADOS SEM LIMITES
1 SIGNIFICA QUE SÓ PODE CONTER UM REGISTRO IGUAL E SEMPRE COMPARAMOS DA SEGUNDO OBJETO APÓS A VÍRGULA PARA DEFINIRMOS A RELAÇÃO DE 
UMA TABELA PARA OUTRA

o primeiro número antes da vírgula se trata de obrigatoriedade de 0 para não e 1 para sim
p segundo número pós a vírgula se trata de cardinalidade que define o máximo 1 ou mais de um representado por n

*/

-- REALIZE SEMPRE O MODELO CONCEITUAL E LÓGICO NO BRMODELO ANTES DE TRANFORMAR PARA FÍSICO.

/*exemplo prático de entendimento


-- ENDERECO = OBRITATORIO O CADASTRO DE UM ENDERECO NO MÁXIMO 1 = ISSO SE TRATA DE OBRIGATORIEDADE QUE REPRESENTAMOS POR 1,1


TELEFONE = O CLIENTE NÃO É OBRIGADO A INFORMAR TELEFONE POREM, CASO QUEIRA, ELE PODE INFORMAR MAIS DE UM ISSO É REPRESENTADO POR
0,N


A MELHOR MANEIRA DE LER ISSO É SEMPRE USANDO PARA COMPARAR O NÚMERO APÓS A VÍRGULA.

*/

-- INICIANDO O PROJETO DE MODELAGEM CORRETA 

-- 01 CRIANDO BANCO DE DADOS

CREATE DATABASE COMERCIO;

USE COMERCIO;


CREATE TABLE CLIENTE(

-- Linha abaixo serve para indicar que na coluna tem que ser única essa chave não pode se repetir O AUTO_INCREMENT O PRÓPRIO BANCO
-- Se responsabiliza em gerar essa chave única para cada usuário cadastrado O NOT NULL SIGNIFICA QUE É OBRIGATÓRIO O PREENCHIMENTO DOS DADOS.
-- COMANDO ( ENUM NA COLUNA SEXO -> ISSO SE CHAMA DOMÍNIO QUE TEM INFORMAÇÕES FIXA NO CASO SEXO F OU M. ESSE COMANDO É SÓ NO SQL.
-- COMANDO ( UNIQUE) -> ISSO DEMONSTRA QUE O VALOR É ÚNICO NÃO SE REPETE MAS PODE SER DEIXADO EM BRANCO
-- INT PRIMARY KEY AUTO_INCREMENT -> ISSO CHAMAMOS DE CHAVE PRIMÁRIA.
/*CHAVE ESTRANGEIRA FK É A CHAVE PRIMARIA DE UMA TABELA QUE VAI ATÉ OUTRA TABELA FAZER REFERÊNCIA ENTRE OS REGISTROS.*/

/*EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGUEIRA FICA NA TABELA MAIS FRACA DE ACORDO COM CADA NEGÓCIO. EXEMPLO UM CARRO MUITOS PODEM DIRIGIR DO QUE O CLIENTE ENTÃO ELE É MAIS FORTE*/

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA CARDINALIDADE N*/
--

IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,

NOME VARCHAR(30) NOT NULL,
SEXO ENUM ('M','F') NOT NULL,
EMAIL VARCHAR(100) UNIQUE,
CPF VARCHAR(15) UNIQUE



);

-- CRIANDO A TABELA ENDEREÇO SEGUINDO A REGRA

CREATE TABLE ENDERECO(

IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,

RUA VARCHAR(100)NOT NULL,
BAIRRO VARCHAR(100) NOT NULL,
CIDADE VARCHAR(100) NOT NULL,
ESTADO CHAR(2) NOT NULL,

ID_CLIENTE INT UNIQUE, -- ESSA LINHA QUANDO O RELACIONAMENTO É 1 X 1 COLOCAMOS INT UNIQUE.
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE)



);

CREATE TABLE TELEFONE(

IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,

TIPO ENUM('RESIDENCIAL','COMERCIAL','CELULAR')NOT NULL,
NUMERO VARCHAR(20),

ID_CLIENTE INT, -- COMO O RELACIONAMENTO DO CLIENTE É 1 X N O CLIENTE PODE TER VÁRIOS NÃO PRECISAMOS COLOCAR O UNIQUE.
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE (IDCLIENTE)


);



