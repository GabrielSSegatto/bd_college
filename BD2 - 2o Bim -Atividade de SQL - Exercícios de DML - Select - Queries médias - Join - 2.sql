--BD2 - 2o Bim -Atividade de SQL - Exercícios de DML - Select - Queries médias - Join - 2

-- a. Query de consulta no dicionário de dados (catálogo). Selecionar
-- todas as tabelas do seu usuário (projeto). Mostrar: nome da tabela
-- (TABELA) ordenado crescente.
-- RESOLUÇÃO:
SELECT * FROM USER_TABLES 
ORDER BY TABLE_NAME ASC;

-- b. Fazer uma query para recuperar todos os pedidos cujo total da fatura
-- seja maior do que R$ 2000,00. Mostrar: numero do pedido (PEDIDO),
-- DATA, total da fatura (TOTAL), ordenado decrescente pela data do
-- pedido.
-- RESOLUÇÃO:
SELECT NUMERO AS PEDIDO, DATA, TOTAL_FATURA AS TOTAL FROM PEDIDO
WHERE TOTAL_FATURA > 2000
ORDER BY DATA DESC;


-- c. Fazer uma query para recuperar todos os pedidos cujo total da fatura
-- seja maior do que R$ 2000,00. Mostrar: nome cliente (CLIENTE), numero
-- do pedido (PEDIDO),DATA, total da fatura (TOTAL), ordenado crescente
-- pelo nome do cliente.
-- RESOLUÇÃO:
SELECT
    C.NOME AS CLENTE,
    P.NUMERO AS NUMERO,
    P.DATA,
    P.TOTAL_FATURA AS TOTAL
FROM PEDIDO P
INNER JOIN CLIENTE C
    ON P.CODIGO_CLI = C.CODIGO
WHERE P.TOTAL_FATURA > 2000
ORDER BY C.NOME ASC;