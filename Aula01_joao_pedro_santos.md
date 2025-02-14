Questão 1-
SELECT nome, salario
FROM funcionarios
WHERE salario > 3000;

Questão 2-
SELECT nome
FROM funcionarios 
ORDER BY nome ASC;

Questão 3-
SELECT COUNT (*) AS total_de_funcionarios,
               AVG(salario) AS media_salarial,
               SUM(salario) AS total_salarios,
FROM funcionarios;

Questão 4-
SELECT departamento, 
AVG(salario) AS media_salarial, 
COUNT(*) AS total_de_funcionarios
FROM funcionarios
GROUP BY departamento HAVING COUNT(*) > 3;

Questão 5-
SELECT nome
FROM funcionarios
WHERE salario > AVG (salario);

Questão 6-
SELECT e.nome AS funcionario, d.nome AS departamento
FROM Employees e
INNER JOIN Departaments d ON e.departament_id = d_id;

Questão 7-
SELECT e.nome AS funcionario, d.nome AS departamento
FROM Employees e
LEFT JOIN Departaments d ON e.departament_id = d_id;

Questão 8-
SELECT *
FROM orders
WHERE data_pedidos BETWEEN ‘2025-01-01’ AND ‘2025-01-31’;

Questão 9-
Select nome AS Nomes, salarios AS Salarios,
FROM funcionarios;

Questão 10-
SELECT e.nome, e.salario, e.departamento_id
FROM funcionarios f
WHERE e.salario > (
    SELECT AVG(e2.salario)
    FROM funcionarios e2
    WHERE e2.departamento_id = f.departamento_id
)
