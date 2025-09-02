create database pratica20;
use pratica20;

create table Fornecedores (
id int auto_increment primary key,
nome varchar(100)
);

insert into fornecedores(nome) values
('Casa do Pão'),
('Laticínios Vera Cruz'),
('Fábrica de farinha'),
('Açúcar União');
 
create table Produtos (
id int auto_increment primary key,
nome varchar(100) not null,
preco double,
estoque int,
fornecedorID int,
foreign key (fornecedorID) references fornecedores (id)
);

insert into Produtos (nome, preco, estoque, fornecedorID) values
('Pão de Queijo',15.00, 100, 3),
('Bolo de Milho',10.00, 25, 4),
('Leite integral',5.35, 20, 1);
 
create table Vendas(
id int auto_increment primary key,
produtoid int,
quantidade int,
datavenda date,
foreign key (produtoid) references produtos(id)
);

insert into Vendas (produtoid, quantidade, datavenda) values
(1,20,'2025-08-25'),
(2,5,curdate()),
(3,10,curdate());
 
-- 1: Exibir o nome dos produtos e o nome do fornecedor de cada um
SELECT P.Nome AS Produto,
F.Nome AS Fornecedor
FROM Produtos P
INNER JOIN Fornecedores F ON P.FornecedorID = F.ID;
 
-- 2: Listar os produtos vendidos com suas quantidades e data da venda
SELECT V.DataVenda, P.Nome AS Produto, V.Quantidade
FROM Vendas V
INNER JOIN Produtos P ON V.ProdutoID = P.ID;
 
-- 3: Ver o nome do produto, valor total da venda e nome do fornecedor 
SELECT P.Nome AS Produto, 
(V.Quantidade * P.Preco) AS ValorTotalVenda, 
F.Nome AS Fornecedor
FROM Vendas V
INNER JOIN Produtos P ON V.ProdutoID = P.ID
INNER JOIN Fornecedores F ON P.FornecedorID = F.ID;
 
-- 4: Exibir produtos com estoque abaixo de 30 unidades e seus fornecedores
SELECT P.Nome AS Produto, P.Estoque, F.Nome AS Fornecedor
FROM Produtos P
INNER JOIN Fornecedores F ON P.FornecedorID = F.ID
WHERE P.Estoque < 30;