SELECT id_vendedor, nome, salario
FROM vendedores
WHERE salario > (SELECT AVG(salario) FROM vendedores)
ORDER BY salario DESC;
