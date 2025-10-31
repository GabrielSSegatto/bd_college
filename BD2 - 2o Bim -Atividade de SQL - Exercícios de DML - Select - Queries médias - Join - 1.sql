-- BD2 - 2o Bim -Atividade de SQL - Exercícios de DML - Select - Queries médias - Join - 1


-- a. Listar os vendedores . Mostrar: Vendedor (MATRICULA e NOME).
-- Ordenados pelo nome decrescente.
-- RESOLUÇÃO:

SELECT NOME, MATRICULA FROM VENDEDOR
ORDER BY NOME DESC;

-- b. Listar distintamente os clientes PJ. Mostrar: Nome do cliente
-- (CLIENTE), CNPJ e CIDADE onde reside. Ordenados pelo nome do cliente
-- ascendente e, dentro deste, pela cidade descendente.
-- RESOLUÇÃO:

SELECT DISTINCT NOME, CNPJ, CIDADE 
FROM CLIENTE C 
JOIN PJ P ON C.CODIGO = P.CODIGO_CLI
ORDER BY CIDADE DESC;

-- c. Listar os vendedores e seus pedidos já realizados com total de
-- fatura entre R$ 1000,00 e R$ 5000,00, inclusive.. Mostrar: Nome do
-- vendedor (VENDEDOR), número do pedido (PEDIDO),data do pedido (DATA)
-- com a formatação 'dd/mm/yyyy'. Ordenados pelo nome do vendedor
-- descendente e, dentro deste, pela data ascendente.
-- RESOLUÇÃO:


SELECT V.NOME, P.NUMERO, TO_CHAR(P.DATA, 'DD/MM/YYYY') AS DATA 
FROM VENDEDOR V 
JOIN PEDIDO P ON V.MATRICULA = P.MATRICULA_VEN
WHERE P.TOTAL_FATURA >= 1000 AND P.TOTAL_FATURA <=5000
ORDER BY V.NOME DESC, P.DATA ASC;