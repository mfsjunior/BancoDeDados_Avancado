select * from funcionarios 
where salario > 3000;

select * from funcionarios
order by nome asc;

select count(id) as Total_funcionarios, avg(salario) as media_salarial,
 	   sum(salario) as soma_salarios from funcionarios;
       
select departamento_id, avg(salario) as medial_salarial, count(*) as total_funcionarios
from funcionarios
group by departamento_id
having  total_funcionarios > 3
order by total_funcionarios desc;

select nome, salario from funcionarios
where salario > (select avg(salario) from funcionarios);

select f.nome as funcionario, d.nome as departamento 
from funcionarios f
inner join departament d on f.departamento_id = d.id;

select
    f.id as funcionario_id, 
    f.nome as funcionario_nome, 
    f.salario, 
    d.nome as departamento_nome
from funcionarios f
left join departament d on f.departamento_id = d.id;

select * from Orders
where year(data_pedido) = 2025
and month(data_pedido) = 1;

select nome as Nome, salario as Salário from funcionarios;

select f.nome, f.salario, f.departamento_id
from funcionarios f
join (
    select departamento_id, avg(salario) as media_salarial
    from funcionarios
    group by departamento_id
) as dep_avg
on f.departamento_id = dep_avg.departamento_id
where f.salario > dep_avg.media_salarial;