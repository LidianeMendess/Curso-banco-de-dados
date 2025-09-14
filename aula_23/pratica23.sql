create database pratica23;
use pratica23;

create table vendas(
id int primary key not null,
valor double
);

create table faixas_comissao(
id int primary key not null,
valor_min double, 
valor_max double, 
percentual double
);

-- Inserindo 5 vendas de exemplo
insert into vendas (id, valor) values
(1, 150.00),
(2, 500.00),
(3, 1200.00),
(4, 2500.00),
(5, 8000.00);

-- Inserindo 5 faixas de comissão
insert into faixas_comissao (id, valor_min, valor_max, percentual) values
(1, 0.00,    499.99,  2.0),   -- até 499,99 → 2%
(2, 500.00,  999.99,  3.5),   -- entre 500 e 999,99 → 3,5%
(3, 1000.00, 2999.99, 5.0),   -- entre 1000 e 2999,99 → 5%
(4, 3000.00, 5999.99, 7.5),   -- entre 3000 e 5999,99 → 7,5%
(5, 6000.00, 999999.99, 10.0);

select 
v.id as"Id venda",
v.valor as "Valor da venda",
f.percentual as "Percentual da Comissão",
v.valor*f.percentual/100 as "Valor da Comissão calculado"
from vendas v
join faixas_comissao f
on v.valor between valor_min and valor_max