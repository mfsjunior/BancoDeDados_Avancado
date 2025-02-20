1)	SELECT nome, salario,
FROM funcionario,
WHERE salario > 3000;

2)	SELECT nome,
FROM funcionários,
WHERE order by nome asc;

3)	SELECT
COUNT (id_funcionario) as Total_funcionarios,
AVG (salario) as Media_Salarial,
SUM (salario) as Total_Salarios,
FROM funcionarios;

4)	SELECT id_departamento, 
AVG salario as Media_Salarial,
COUNT id_funcionario as Total_Funcionarios,
FROM funcionários,
GROUB BY id_departamento,
HAVING Total_Funcionarios > 3;

5)	SELECT funcionários,
AVG (salario) as Media_Salarial,
WHERE salario > Media_Salarial,
FROM funcionários;

6)	SELECT e.nome as Nome_Funcionario, d.nome as Nome_Departamento,
FROM employees e,
INNER JOIN departaments d ON e.departaments_id =  d.departaments_id;

7)	SELECT e.nome as Nome_Funcionario, d.nome as Nome_Departamento,
FROM employees e,
LEFTJOIN departaments d  ON e.departaments_id =  d.departaments_id;

8)	SELECT *
FROM orders,
WHERE data_pedidos BETWEEN ‘2025-01-01’ AND ‘2025-01-31’;

9)	SELECT nome as Nome_Funcionario, salario as Salario,
FROM funcionários;

10)	SELECT e.nome as Nome_Funcionario, e.salario, e.departamento_id
FROM employees e 
WHERE e.salario > (
SELECT AVG( e2.salario)
FROM employees e2
WHERE e2. departamento_id = e.departamento_id);
