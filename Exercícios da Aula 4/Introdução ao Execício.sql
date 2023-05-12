/*
EXERCÍCIO DE FIXAR AS MATÉRIAS ANTERIORES DAS AULAS 01,02,03 E 04

*/

/*01 CRIANDO O BANCO DE DADOS LIVRARIA*/

CREATE DATABASE LIVRARIA;
USE LIVRARIA;
DESC LIVROS;

CREATE TABLE LIVROS(
NOMELIVRO VARCHAR(100),
NOMEAUTOR VARCHAR(100),
SEXOAUTOR CHAR(1),
NUMEROPAGINA INT(7),
NOMEDIRETORIA VARCHAR(100),
VALORLIVRO INT(5),
UF VARCHAR(100),
ENDERECO VARCHAR(100),
TELEFONE VARCHAR(12), 
ANOPUBLICACAO INT(7)



);

INSERT INTO LIVROS(NOMELIVRO,NOMEAUTOR,SEXOAUTOR,NUMEROPAGINA,NOMEDIRETORIA,VALORLIVRO,UF,ENDERECO,TELEFONE,ANOPUBLICACAO) VALUES ('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49,9,'RJ','RUA TRÊS COQUEIROS - NITEROI - RIO DE JANEIRO','2196778564',2009),
('SQL para Leigos','João Nunes','M',450,'Addison',98,'SP','RUA ANDRADA - CENTRO SÃO PAULO','0119878545',2018),('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ','RUA DOS INVÁLIDOS 15 - CENTRO - RIO DE JANEIRO','0216852254',2008),('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,99,'RJ','MARECHAL FLORIANO - CENTRO - RIO DE JANEIRO','0219878545',2018),
('Habitos Saudáveis','Eduardo Santos ','M',630,'Beta',150,98,'RJ','MARECHAL FLORIANO - CENTRO - RIO DE JANEIRO','0219878545',2019),('Copas Inesqueciveis','Marco Alcantara ','M',200,'Larson',130,98,'RS','RUA ALPINO MORAES - CENTRO - RIO GRANDE DO SUL','0179878545',2018),('O poder da Mente','Clara Maria','F',120,'Continental',56,58,'SP','AVENIDA PAULISTA - CENTRO - SÃO PAULO','0119878545',2017);


/* Trazer todos os dados.*/
SELECT * FROM LIVROS;

/*Trazer o nome do livro e o nome da editora*/
SELECT NOMELIVRO, NOMEDIRETORIA FROM LIVROS;

/*Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.*/
SELECT NOMELIVRO, UF FROM LIVROS WHERE SEXOAUTOR = 'M';

/*Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.*/
SELECT NOMELIVRO, NUMEROPAGINA FROM LIVROS WHERE SEXOAUTOR = 'F';

/*Trazer os valores dos livros das editoras de São Paulo.*/
SELECT VALORLIVRO, NOMEDIRETORIA FROM LIVROS WHERE UF = 'SP';

/* Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio).*/

/* CRIAÇÃO DA SINTAXE CORRETA DESSE EXERCÍCIO QUE ESTÁ CERTO MAS PODE SER MELHORADO EM ALGUNS OUTROS DETALHES*/

CREATE TABLE LIVROS(

NOME VARCHAR(100),
AUTOR VARCHAR(100),
SEXO CHAR(1),
PAGINAS INT(5),
EDITORA VARCHAR(20),
VALOR FLOAT(10,2),
UF CHAR(2),
ENDERECO VARCHAR(100),
TELEFONE VARCHAR(20),
ANO INT(4)



);

INSERT INTO LIVROS(NOME,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ENDERECO,TELEFONE,ANO) VALUES ('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ','RUA TRÊS COQUEIROS - NITEROI - RIO DE JANEIRO','2196778564',2009),
('SQL para Leigos','João Nunes','M',450,'Addison',98,'SP','RUA ANDRADA - CENTRO SÃO PAULO','0119878545',2018),('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ','RUA DOS INVÁLIDOS 15 - CENTRO - RIO DE JANEIRO','0216852254',2008),('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78.99,'RJ','MARECHAL FLORIANO - CENTRO - RIO DE JANEIRO','0219878545',2018),
('Habitos Saudáveis','Eduardo Santos ','M',630,'Beta',150.98,'RJ','MARECHAL FLORIANO - CENTRO - RIO DE JANEIRO','0219878545',2019),('Copas Inesqueciveis','Marco Alcantara ','M',200,'Larson',130.98,'RS','RUA ALPINO MORAES - CENTRO - RIO GRANDE DO SUL','0179878545',2018),('O poder da Mente','Clara Maria','F',120,'Continental',56.58,'SP','AVENIDA PAULISTA - CENTRO - SÃO PAULO','0119878545',2017);


/* Trazer todos os dados.*/
SELECT * FROM LIVROS;

/*Trazer o nome do livro e o nome da editora ESSES DADOS ESTÃO CORRETAS NA TENTATIVA ANTERIOR*/
SELECT NOME, EDITORA FROM LIVROS;

/*Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino ESSES DADOS ESTÃO CORRETAS NA TENTATIVA ANTERIOR.*/
SELECT NOME, UF FROM LIVROS WHERE SEXO = 'M';

/*Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino ESSES DADOS ESTÃO CORRETAS NA TENTATIVA ANTERIOR.*/
SELECT NOME, PAGINAS FROM LIVROS WHERE SEXO = 'F';

/*Trazer os valores dos livros das editoras de São Paulo.*/
SELECT VALOR, EDITORA FROM LIVROS WHERE UF = 'SP';

/* Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio).*/


SELECT AUTOR, SEXO FROM LIVROS WHERE UF = 'SP' AND UF ='SP' OR UF ='RJ';






