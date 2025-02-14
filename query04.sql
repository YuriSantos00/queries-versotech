SELECT id_pedido, valor_total, data_emissao,
       CASE 
           WHEN data_cancelamento IS NOT NULL THEN 'CANCELADO'
           WHEN data_faturamento IS NOT NULL THEN 'FATURADO'
           ELSE 'PENDENTE'
       END AS situacao
FROM pedido
ORDER BY id_pedido ASC;