drop schema Revisao;
create schema if not exists Revisao default character set utf8;
Use Revisao;

Create table FUNCIONARIOS (
id int primary key auto_increment,
Nome varchar (45),
Salario decimal (10,2),
Departamento varchar (45)
);

Insert into FUNCIONARIOS (Nome, Salario, Departamento) values ('João Silva', '1420.00', 'RH');
Insert into FUNCIONARIOS (Nome, Salario, Departamento) values ('Jenyfer Brito', '1500.00', 'FINANCEIRO');
Insert into FUNCIONARIOS (Nome, Salario, Departamento) values ('José Souza', '3420.00','ATENDIMENTO');
Insert into FUNCIONARIOS (Nome, Salario, Departamento) values ('Maria Mongo', '2345.00', 'VENDAS');
Insert into FUNCIONARIOS (Nome, Salario, Departamento) values ('Nel Carla', '5000.00', 'FINANCEIRO');
Insert into FUNCIONARIOS (Nome, Salario, Departamento) values ('Paulo João', '7000.00', 'FINANCEIRO');
Insert into FUNCIONARIOS (Nome, Salario, Departamento) values ('Claúdia Raia', '2343.00', 'FINANCEIRO');

Create table DEPARTAMENTO (
id int primary key auto_increment,
Nome varchar(45) not null
);

Insert into DEPARTAMENTO (Nome) 
values ('RH'),('FINANCEIRO'),('ATENDIMENTO'),('VENDAS');
 
Create table Produtos (
    id int primary key auto_increment,
    Nome_Produto varchar(100),
    Preco Decimal(10,2)
);

 -- Tabela Orders que será a responsável por registrar todos os pedidos feito
Create table Orders (
    id int primary key auto_increment,
    id_produto int,
    quantidade int,
    Data_Pedido date,
    foreign key (id_produto) references Produtos(id)
);

-- Inserindo alguns produtos 
Insert into Produtos (Nome_Produto, Preco) 
values ('Produto Bac', 150.00), ('Produto Mac', 234.00),('Produto Calm', 323.00);

-- Inserindo pedidos
Insert into Orders (id_produto, quantidade, Data_Pedido)
values 
(1, 6, '2025-02-15'),
(2, 1, '2025-04-20'),
(3, 9, '2025-09-11');

-- ex:  Recupere os nomes e salários dos funcionários cujo salário seja superior a 3000.
select * from funcionarios where salario > 3000;

-- ex: Liste todos os funcionários ordenados pelo nome em ordem alfabética.
select * from funcionarios order by nome;

-- ex: Calcule o total de funcionários, a média salarial e a soma dos salários existentes na tabela.
select count(id) from funcionarios;
select avg(salario) from funcionarios;
select sum(salario) from funcionarios;

-- ex:  exibindo somente os departamentos que possuem mais de 3 funcionários.
select Departamento, avg (Salario) as Media_Salarial, COUNT(id) as Quantidade_Funcionarios
from FUNCIONARIOS
group by Departamento
having COUNT(id) > 3;

-- ex: Selecione os funcionários que ganham acima da média salarial geral.
select * from funcionarios where salario > (select avg(Salario) from FUNCIONARIOS); 

-- ex: Liste os nomes dos funcionários junto com o nome do departamento correspondente
select F.Nome as Funcionario, D.Nome as Departamento
from FUNCIONARIOS F inner join DEPARTAMENTO D on F.Departamento = D.Nome;

-- ex: o nome do departamento a que pertencem, garantindo que mesmo os funcionários sem departamento sejam retornados.
select F.Nome as Funcionario, D.Nome as Departamento
from FUNCIONARIOS F left join DEPARTAMENTO D on F.Departamento = D.Nome;

-- ex: Recupere os pedidos realizados no mês de janeiro de 2025 a partir da tabela Orders.
select * from Orders where year (Data_Pedido) = 2025 and month(Data_Pedido) = 1;

-- ex: Dando apelido as colunas
select Nome as Nome, Salario as Salario from FUNCIONARIOS;

-- ex: Salário seja superior à média salarial do departamento ao qual pertencem.
select F.Nome, F.Salario from FUNCIONARIOS F where F.Salario > (select avg (Salario) from FUNCIONARIOS where Departamento = F.Departamento);


