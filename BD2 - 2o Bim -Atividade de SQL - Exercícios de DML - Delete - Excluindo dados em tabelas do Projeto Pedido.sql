 -- BD2 - 2o Bim -Atividade de SQL - Exercícios de DML - Delete - Excluindo dados em tabelas do Projeto Pedido

-- a. Excluir os registros de PEDIDO em que o número seja ímpar, a
-- matrícula do vendedor 102 e o endereço de entrega não seja nulo.
-- Observação: Realizar a exclusão e verificar que os registros foram
-- excluídos apenas na transação.
-- RESOLUÇÃO:

-- APAGAR DEPENDENTES 
DELETE FROM ITEM_PRODUTO
WHERE NUMERO_PED IN (
    SELECT NUMERO
    FROM PEDIDO
    WHERE MATRICULA_VEN = 102
      AND NR IS NOT NULL
      AND MOD(NUMERO, 2) != 0
);

DELETE FROM PEDIDO 
WHERE MATRICULA_VEN = 102
AND NR IS NOT NULL
AND MOD(NUMERO,2) != 0;

SELECT * FROM PEDIDO 
WHERE MATRICULA_VEN = 102
AND NR IS NOT NULL
AND MOD(NUMERO,2) != 0;


-- b. Excluir os itens de produtos do menor número de pedido na última data
-- de inclusão de pedido (a data mais recente).
-- Observação: Realizar a exclusão e verificar que os registros foram
-- excluídos apenas na transação.
-- RESOLUÇÃO:
SELECT *
FROM ITEM_PRODUTO
WHERE NUMERO_PED = (
  SELECT MIN(NUMERO)
  FROM PEDIDO
  WHERE DATA = (SELECT MAX(DATA) FROM PEDIDO)
);

DELETE FROM ITEM_PRODUTO
WHERE NUMERO_PED = (
  SELECT MIN(NUMERO)
  FROM PEDIDO
  WHERE DATA = (SELECT MAX(DATA) FROM PEDIDO)
);

-- c. Desfazer as exclusões dos itens a. e b. da questão 4) acima.
-- Observação: Verificar que os registros estão nas respectivas tabelas.
-- RESOLUÇÃO:
ROLLBACK;