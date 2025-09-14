create database pratica22;
use pratica22;

create table produtos(
produto_id int primary key not null,
nome varchar(100),
preco double,
estoque int(20)
);
create table vendas(
vendas_id int primary key not null,
quantidade int(20),
data_venda date,
produto_id int,
foreign key (produto_id) references produtos(produto_id)
);

create table faixa_preco(
faixa_preco_id int not null,
preco_min double,
preco_max double,
categoria enum('BARATO', 'INTERMEDIÁRIO', 'CARO')
);

insert into produtos (produto_id, nome, preco, estoque) values
(1, 'Sonho', '3.50', 10),
(2, 'Bolo de milho', '10.00', 3),
(3, 'Pingado', '3.99', 20),
(4, 'Bolo de festa', '50.00', 5),
(5, 'Rocambole', '29.50',7);

insert into vendas (vendas_id, quantidade, data_venda, produto_id) values
(100, 5, '2025-09-04', 1),
(101, 3, '2025-09-03',5),
(102, 1, '2025-09-02', 4);

insert into faixa_preco (faixa_preco_id, preco_min, preco_max, categoria)values
(1, 1.00, 9.99,'BARATO'),
(2, 10.00, 29.99,'INTERMEDIÁRIO'),
(3, 30.00, 50.00, 'CARO');

-- 1: : Listar todos os produtos disponíveis, mostrando quantas vezes cada um foi vendido — mesmo que nunca tenha sido vendido.
select 
p.nome as Produto,
sum(v.quantidade) as"Total vendido"
from produtos p
left join vendas v
on p.produto_id=v.produto_id
group by v.quantidade;

-- 2 - Classificar os produtos em categorias de preço
select
p.nome,
fp.categoria
from produtos p
join faixa_preco fp
on categoria between preco_min and preco_max

