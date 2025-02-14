SELECT c.id_cliente, c.razao_social, COALESCE(SUM(p.valor_total), 0) AS total
FROM clientes c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.razao_social
ORDER BY total DESC;