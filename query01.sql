SELECT id_vendedor, nome, salario
FROM vendedores
WHERE inativo = FALSE
ORDER BY nome ASC;