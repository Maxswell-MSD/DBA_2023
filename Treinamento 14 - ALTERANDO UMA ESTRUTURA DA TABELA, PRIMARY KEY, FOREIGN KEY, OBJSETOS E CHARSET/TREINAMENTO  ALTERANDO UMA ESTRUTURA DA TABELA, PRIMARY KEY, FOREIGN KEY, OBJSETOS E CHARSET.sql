
# FUNÇÃO DE AGREGAÇÃO ( GROUP BY, COUNT, MAX, MIN, AVG E FUNÇÕES DO MYSQL)

/*FUNÇÕES DE AGREGAÇÃO NUMÉRICAS QUE VAI ARMAZENAR TRÊS MESES DE VENDA DOS VENDEDORES*/

DROP DATABASE RELATORIO;
CREATE DATABASE RELATORIO;
USE RELATORIO;
CREATE TABLE VENDEDORES(
	IDVENDEDORES INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO ENUM('F','M'),
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)

);

INSERT INTO VENDEDORES VALUES
(NULL,'Ana', 'F', 2500.00, 3200.00, 2900.00),
(NULL,'Bruno', 'M', 1800.00, 2100.00, 2400.00),
(NULL,'Sandra', 'F', 3500.00, 2800.00, 3100.00),
(NULL,'Daniel', 'M', 3200.00, 3500.00, 4000.00),
(NULL,'Elaine', 'F', 2800.00, 3000.00, 2900.00),
(NULL,'Fernanda', 'F', 2900.00, 3300.00, 3400.00),
(NULL,'Gustavo', 'M', 2000.00, 1900.00, 1800.00),
(NULL,'Hugo', 'M', 3800.00, 3600.00, 3900.00),
(NULL,'Isabela', 'F', 4000.00, 4200.00, 4100.00),
(NULL,'João', 'M', 2500.00, 2700.00, 2800.00),
(NULL,'Karina', 'F', 3200.00, 3100.00, 3300.00),
(NULL,'Lucas', 'M', 2900.00, 3300.00, 3100.00);

/* FUNÇÃO MAX - TRAZ O VALOR MÁXIMO DE UMA COLUNA*/




-- EXEMPLO ABAIXO TRAZ O MAIOR VALOR DE FEVEREIRO. BASTA COLOCAR FUNÇÃO MAX E DENTRO O NOME DA COLUNA AS VOCÊ COLOCA A PALAVRAS QUE DESEJA SER PROJETADA PODE ESTÁ DENTRO DE ASPAS OU NÃO




/* FUNÇÃO MIN - TRAZ O MENOR VALOR DE UMA COLUNA*/





/* FUNÇÃO Avg - TRAZ A MÉDIA DO VALOR DE UMA COLUNA*/



/* MISTURANDO TODAS AS INFORMAÇÕES EM QUERY*/




/* APLICANDO A FUNÇÃO TRUNCATE PARA LIMITAR A QUANTIDADE DE VALORES DECIMAIS QUE SÃO MOSTRADO NA MÉDIA TRUNCATE(AVG(JANEIRO),2)
TRUNCATE pode ser utilizada em qualquer expressão numérica para limitar a quantidade de casas decimais exibidas no resultado. Ela pode ser aplicada em outras funções, como a função SUM e a função COUNT, por exemplo.
 A função TRUNCATE é utilizada para limitar a quantidade de valores decimais exibidos na média das vendas. Nesse caso, o segundo parâmetro da função indica que a média deve ser exibida com apenas duas casas decimais.
*/



/*SEGUNDA PARTE DA FUNÇÃO - AGREGANDO COM SUM() PARA REALIZAR AS SOMAS*/



/* Essa consulta cria uma VIEW chamada V_DADOS que exibe o total de vendas realizadas pelos vendedores em Janeiro, Fevereiro e Março.
 A função SUM é utilizada para somar as vendas de cada mês, agrupando todas as vendas em um único registro. Essa VIEW pode ser utilizada para gerar relatórios completos e consolidados das vendas,
  permitindo uma análise mais eficiente dos dados. */


 /*Esse código SQL retorna a soma total das vendas realizadas por vendedores em março, agrupados por sexo quando é usado função GROUP BY.*/




/* 14 - Subqueries são usadas para filtrar dados com precisão, permitindo que uma consulta seja executada dentro de outra.
No exemplo apresentado, a subconsulta interna (INNERQUERY) é resolvida primeiro e retorna o menor valor da coluna "MARCO" da tabela "VENDEDORES".
Isso permite que a consulta externa utilize esse valor de maneira eficiente para obter os resultados desejados. O treinamento em subqueries é fundamental para aprimorar as habilidades 
em SQL e criar consultas mais precisas e eficientes. */

 ----------------------------- PEQUENO EXERCÍDIO QUE TRABALHA EM COLUNAS -----------------------------------------------

 /* VENDEDOR QUE VENDEU QUE TEVE A MENOR VENDA EM MARCO E O SEU NOME*/



 /* VENDEDOR QUE TEVE A MELHOR VENDA EM JANEIRO E O SEU NOME*/


-- VOCÊ PODE TIRAR SUA DÚVIDA COM ORGANIZAÇÃO ORDER BY
 
  /*QUEM VENDEU MAIS QUE O VALOR MEDIO DE MARCO É SÓ TROCAR = PELO SINAL DE MAIOR >*/


  /*QUEM VENDEU MENOS QUE O VALOR MEDIO DE MARCO É SÓ TROCAR = PELO SINAL DE MAIOR <*/
 
 
 
   





-- 14 - ALTERANDO UMA ESTRUTURA DA TABELA, PRIMARY KEY, FOREIGN KEY, OBJSETOS E CHARSET

DROP TABLE TABELA;

CREATE TABLE TABELA(

COLUNA1 VARCHAR(30),
COLUNA2 VARCHAR(30),
COLUNA3 VARCHAR(30)

);

-- ADICIONANDO UMA CHAVE PRIMÁRIA POR FORA DA TABELA QUE É O MAIS INDICADO PK
-- QUANDO É COLOCADO A PRIMARY KEY POR FORA NÃO TEM COMO USAR O AUTO_INCREMENT


-- ADICIONANDO UMA COLUNA SEM POSIÇÃO, POR PADRÃO ELA SEMPRE SERÁ A ÚLTIMA COLUNA

-- ADICIONANDO UMA COLUNA POR POSIÇÃO


-- MODIFICANDO A POSIÇÃO DE UMA COLUNA

-- MODIFICANDO O TIPO DE UMA COLUNA, LEMBRANDO SE TIVER VALOR NA COLUNA DE CHAR DA PARA MUDAR PARA VARCHAR, NÃO 
-- É POSSÍVEL MODIFICAR O TIPO QUE TENHA NOMES COMO CHAR OU VARCHAR NÃO TEM COMO MODIFICAR PARA INT PORQUE OS DADOS
-- NÃO TEM NÚMERO, SE A COLUNA CHAR E VARCHAR TIVER NÚMEROS PODE MODIFICAR PARA INT OU COLUNA VAZIA


-- RENOMEANDO O NOME DA TABELA


--////////////////////////////////// 2 PARTE /////////////////////////////////////////////////////





-- REALIZANDO ALTERAÇÕES DE CHAVE ESTRANGEIRA FOREIGN KEY  POR FORA DA TABELA PARA ATRIBUIR NOMES A CONSTRAINT
-- É UMA BOA PRÁTICA CRIAR DEPOIS DA TABELA AS CHAVES POR QUESTÃO DE DICIONÁRIO DE DADOS

CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(50),
	ID_PESSOA VARCHAR(30)

);

-- FOREIGN KEY




-- VERIFICANDO AS CHAVES CRIADA NA TABELA



SHOW DATABASES;
-- EXEMPLO DOS DICIONÁRIOS DE DADOS PARA VER OUTROS ELEMENTOS DO BANCO E ACHAR AS CHAVES
+--------------------+
| Database           |
+--------------------+
| comercio           |
| information_schema |-- DICIONÁRIO DE DADOS
| innobayte          |
| mysql              |-- DICIONÁRIO DE DADOS
| performance_schema |-- DICIONÁRIO DE DADOS
| relatorio          |
| sakila             |
| sys                |
| world              |
+--------------------


 ---------------------OPERAÇÕES EM LINHAS QUE NÃO EXISTE FUNÇÃO SÓ COM OPERAÇÕES ARITIMÉTICAS-----------------------------------------------

/*VALOR TOTAL EM LINHAS DE CADA VENDEDOR POR MES*/



/*DESCONTO .25*/




/*VALOR MÉDIA DAS VENDAS EM TRIMESTRE EM LINHAS DE CADA VENDEDOR*/

