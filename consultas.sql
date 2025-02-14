-- QUERY 01 - Consulta de Vendedores

SELECT id_vendedor, nome, salario
FROM vendedores
WHERE inativo = FALSE
ORDER BY nome ASC;

-- QUERY 02 - Funcionários com Salário Acima da Média

SELECT id_vendedor, nome, salario
FROM vendedores
WHERE salario > (SELECT AVG(salario) FROM vendedores)
ORDER BY salario DESC;

-- QUERY 03 - Resumo por cliente

SELECT c.id_cliente, c.razao_social, COALESCE(SUM(p.valor_total), 0) AS total
FROM clientes c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.razao_social
ORDER BY total DESC;

-- QUERY 04 - Situação por pedido

SELECT id_pedido, valor_total, data_emissao,
       CASE 
           WHEN data_cancelamento IS NOT NULL THEN 'CANCELADO'
           WHEN data_faturamento IS NOT NULL THEN 'FATURADO'
           ELSE 'PENDENTE'
       END AS situacao
FROM pedido
ORDER BY id_pedido ASC;

-- QUERY 05 - Produtos mais vendidos

SELECT I.ID_PRODUTO AS id_produto, 
       SUM(I.QUANTIDADE) AS quantidade_vendida,
       SUM(I.PRECO_PRATICADO * I.QUANTIDADE) AS total_vendido,
       COUNT(DISTINCT I.ID_PEDIDO) AS pedidos,
       COUNT(DISTINCT P.ID_CLIENTE) AS clientes
FROM ITENS_PEDIDO I
JOIN PEDIDO P ON I.ID_PEDIDO = P.ID_PEDIDO
GROUP BY I.ID_PRODUTO
ORDER BY quantidade_vendida DESC, total_vendido DESC
LIMIT 1;