/* <- Esse é um comentário que não é lido pelo banco de dados
# <- Agora no Mysql o único comentário é esse que é o único diferente


/* Processos de modelagem*/

/* Conceitual 01 e Lógica 02 normalmente é feita pelo AD ADM de Dados */

MODELAGEM CONCEITUAL - É ESCRITO EM RASCUNHO, PAPEL A MODELAGEM BÁSICA QUE É NOME DA TABELA E DADOS A SER REGISTRADO.
MODELAGEM LÓGICA - É QUANDO PEGAMOS A MODELAGEM CONCEITUAL E COLOCAMOS NO BRMODELO OU QUALQUER PROGRAMA DE MODELAGEM.

/* Modelagem 03 Física é feita pelo DBA e também pode ser feita pelo AD*/

MODELAGEM FÍSICA - Tudo que é feito nas outras fazes é trasformada em Script de Banco

/* 1 - Parte  Modelagem Básica - ENTIDADE=TABELA NO BRMODELO */

/*Cliente e tipagem com quantidade Depois de criar Abra o BrModelo para criar esse Escopo*/

CLIENTE

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO- CARACTER(100)
SEXO- CARACTER(1)

/* Modelagem lógica - Depois de criar a tabela no BRModelo crie os Campos no BrModelo Clicando em Atributos*/

/* INICIANDO A MODELAGEM FÍSICA USANDO O MYSQL UNICODE PROMPT */

MODELAGEM FÍSICA - Tudo que é feito nas outras fazes é trasformada em Script de Banco

/* CRIANDO O BANCO DE DADOS E COLOQUE O NOME DO BANCO QUE DESEJA E FINALIZA SEMPRE COM;*/

CREATE DATABASE PROJETO;

/* CONECTANDO-SE AO BANCO QUE FOI CRIADO*/

USE PROJETO;

/*Tipagem de tabelas de banco de dados*/

/* 
entendendo a lógica tuning de recursos de otimização de processamento das query- Varchar, Int e Char

Para caracteres literais árvore, joão, matemática temos o Char e Varchar;



Para números temos o Int e o float;

Para Fotos e documentos temos o Blob;

Para os textos extenso temos o text;



	*/
	
	/* CRIANDO A TABELA DE CLIENTES*/
	
/*Agora copie e cole no terminal do mysql*/
CREATE TABLE CLIENTE(
NOME VARCHAR(30),
CPF  INT(11),
EMAIL  VARCHAR(30),
TELEFONE  VARCHAR(30),
ENDERECO VARCHAR(100),
SEXO CHAR(1)


);

/*Como Ver As Tabelas Criadas No Banco de Dados*/

Show TABLES;

/*Como conhecer a estrutura de uma tabela como ver os campos ou tipos */

DESC cliente;


















