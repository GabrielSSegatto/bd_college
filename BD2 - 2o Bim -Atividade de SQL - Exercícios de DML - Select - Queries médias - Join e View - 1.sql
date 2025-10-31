-- BD2 - 2o Bim -Atividade de SQL - Exercícios de DML - Select - Queries médias - Join e View - 1

-- a. Selecionar as constraints criadas da tabela ITEM_PRODUTO. Mostrar:
-- constraint_name (CONSTRAINT), constraint_type (TIPO) e
-- search_condition (CONDICAO). Ordenado pelo nome da constraint.
-- RESOLUÇÃO:

SELECT 
    CONSTRAINT_NAME AS CONSTRAINT,
    CONSTRAINT_TYPE AS TIPO,
    SEARCH_CONDITION AS CONDICAO
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'ITEM_PRODUTO'
ORDER BY CONSTRAINT_NAME;

-- b. Criar a view de clientes constante do BD Pedidos (VIEW_CLIENTE)
-- contendo os dados das tabelas CLIENTE, PF e PJ. Em conformidade com a
-- estrutura disponível no MER físico do projeto BD de Pedido.
-- RESOLUÇÃO:

SELECT 
    P.NOME, P.CODIGO, PF.CNPF AS CNPF, NULL AS CNPJ, 'PF' AS TIPO
FROM CLIENTE P
JOIN PF PF ON PF.CODIGO_CLI = P.CODIGO
UNION
SELECT 
    P.NOME, P.CODIGO, NULL AS CNPF, PJ.CNPJ AS CNPJ, 'PJ' AS TIPO
FROM CLIENTE P 
JOIN PJ PJ ON PJ.CODIGO_CLI = P.CODIGO;
