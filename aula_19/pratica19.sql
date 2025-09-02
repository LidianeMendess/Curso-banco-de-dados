create database joins_2;
use joins_2;

create table clientes(
cliente_id int primary key not null,
nome varchar(30),
email varchar(20)
);

create table pedidos(
pedido_id int primary key not null,
data_pedido date,
total double,
cliente_id int,
foreign key (cliente_id) references clientes(cliente_id)
);

create table produtos(
produto_id int primary key not null,
nome_produto varchar(50),
preco double
);

create table itens_pedido(
id_itens_pedido int primary key not null,
pedido_id int,
produto_id int,
foreign key (pedido_id) references pedidos(pedido_id),
foreign key (produto_id) references produtos(produto_id)
);

-- Inserindo Dados
-- Clientes
insert into clientes (cliente_id, nome, email) values
(1, 'Ana Silva', 'ana@email.com'),
(2, 'Carlos Souza', 'carlos@email.com'),
(3, 'Mariana Lima', 'mariana@email.com'),
(4, 'João Pedro', 'joao@email.com'),
(5, 'Fernanda Reis', 'fernanda@email.com');

insert into clientes (cliente_id, nome, email) values
(6, 'Lidiane Mendes', 'lidy@gmail.com');

-- Produtos
insert into produtos (produto_id, nome_produto, preco) values
(1, 'Ração Premium', 120.50),
(2, 'Coleira Antipulgas', 45.00),
(3, 'Caminha Pet', 180.00),
(4, 'Brinquedo Bola', 25.00),
(5, 'Shampoo Pet', 35.90);

-- Pedidos
insert into pedidos (pedido_id, data_pedido, total, cliente_id) values
(1, '2025-09-01', 165.50, 1),
(2, '2025-09-01', 180.00, 2),
(3, '2025-08-30', 70.90, 3),
(4, '2025-08-29', 120.50, 4),
(5, '2025-08-28', 25.00, 5);

-- Itens Pedido
insert into itens_pedido(id_itens_pedido, pedido_id, produto_id) values
(1, 5, 4),
(2, 2,3),
(3, 1,1),
(4,1,2);

-- Consultas
-- Listar todos os pedidos com informações do cliente que fez cada pedido
select*from pedidos p
inner join clientes c on (p.cliente_id=c.cliente_id);

-- Obter uma lista detalhada com os itens de cada pedido e seu respectivo cliente.
select
    c.nome as cliente,
    p.pedido_id,
    pr.nome_produto,
    pr.preco
from itens_pedido ip
inner join pedidos p on ip.pedido_id = p.pedido_id
inner join clientes c on p.cliente_id = c.cliente_id
inner join produtos pr on ip.produto_id = pr.produto_id;


-- Mostrar todos os clientes e pedidos, inclusive aqueles que ainda não fizeram nenhum pedido.
select*from clientes c
left join pedidos p on (c.cliente_id=p.cliente_id);

-- Listar todos os produtos cadastrados.
select*from produtos;

-- Listar todos os clientes cadastrados.
select*from clientes;

-- Mostrar o total de todos os pedido
select sum(total) as "Total dos pedidos"
from pedidos;





