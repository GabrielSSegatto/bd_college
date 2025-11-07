-- BD2 - 2o Bim -Atividade de SQL - Exercícios de DML - Select - Queries dificuldade média - 3

-- a. Inserir uma prateleira de código 390, descrição 'Prateleira de
-- teste' e número de seções 2.
-- RESOLUÇÃO:
SELECT * FROM PRATELEIRA;

INSERT INTO PRATELEIRA (CODIGO, DESCRICAO, NUMERO_SECOES) 
VALUES(390, 'PRATELEIRA DE TESTE', 2);

COMMIT;

-- b. Listar as prateleiras e os respectivos produtos que podem
-- armazenar. Mostrando a frase 'sem produto' quando não se relaciona
-- com nenhum. Mostrar: Prateleira (CODIGO, DESCRICAO), descrição
-- (PRODUTO) e quantidade distinta de produtos, ordenados pela quantidade
-- de produtos decrescente.
-- RESOLUÇÃO:
SELECT * FROM PRATELEIRA;
SELECT * FROM PRODUTO;
SELECT * FROM ESTOQUE;

SELECT
    PRA.CODIGO AS PRATELEIRA,
    PRA.DESCRICAO,
    NVL(PRO.DESCRICAO, 'sem produto') AS PRODUTO,
    COUNT(DISTINCT PRO.CODIGO) AS QUANTIDADE
FROM PRATELEIRA PRA
LEFT JOIN ESTOQUE EST
    ON EST.CODIGO_PRA = PRA.CODIGO
LEFT JOIN PRODUTO PRO
    ON PRO.CODIGO = EST.CODIGO_PRO
GROUP BY PRA.CODIGO, PRA.DESCRICAO, PRO.DESCRICAO
ORDER BY QUANTIDADE DESC;


-- c. Selecionar todos os clientes da view VIEW_CLIENTE que são PF.
-- Mostrar: CODIGO, NOME e CNPF, ordenado decrescente pelo nome do
-- cliente.
-- RESOLUÇÃO:
CREATE VIEW VIEW_CLIENTE AS
SELECT 
    C.CODIGO,
    C.NOME,
    PF.CNPF AS CNPF,
    NULL AS CNPJ,
    'PF' AS TIPO
FROM CLIENTE C
JOIN PF ON PF.CODIGO_CLI = C.CODIGO
UNION
SELECT 
    C.CODIGO,
    C.NOME,
    NULL AS CNPF,
    PJ.CNPJ AS CNPJ,
    'PJ' AS TIPO
FROM CLIENTE C
JOIN PJ ON PJ.CODIGO_CLI = C.CODIGO;

SELECT 
    CODIGO, 
    NOME, 
    CNPF
FROM VIEW_CLIENTE
WHERE TIPO = 'PF'
ORDER BY NOME DESC;

-- d. Listar os pedidos e seus respectivos produtos. Mostrar: numero do
-- pedido (PEDIDO), DATA do pedido, descrição do produto (PRODUTO) e
-- QUANTIDADE de produtos no pedido. Ordenado pela DATA do pedido
-- crescente e, dentro das datas, pelo produto decrescente.
-- RESOLUÇÃO

SELECT 
    P.NUMERO AS PEDIDO,
    P.DATA,
    PRO.DESCRICAO AS PRODUTO,
    IP.QUANTIDADE
FROM PEDIDO P
JOIN ITEM_PRODUTO IP 
    ON P.NUMERO = IP.NUMERO_PED
JOIN PRODUTO PRO 
    ON IP.CODIGO_PRO = PRO.CODIGO
ORDER BY 
    P.DATA ASC,
    PRO.DESCRICAO DESC;

