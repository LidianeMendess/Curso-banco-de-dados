create database aula_18;
use aula_18;

create table produtos_padaria(
nome varchar(20),
preco double
);
insert into produtos_padaria(nome, preco)
values 						('Sonho', 2.00),
							('pão de frios', 3.00),
                            ('baguete', 7.00),
							('Bolo de Cenoura', 15.63),
							('Leite Integral', 7.55),
                            ('Pudim', 13.99);
                            
select* from produtos_padaria;

-- Mostrar Nome dos produtos em maiúscula.
select nome, upper(nome) as NomeMaiusculo from produtos_padaria;

-- Mostrar Nome dos produtos em minúsculas.
select nome, lower(nome) as NomeMinúsculo from produtos_padaria;

-- Contar quantas letras tem o nome.
select nome, length(nome) as QuantCaracteresNome from produtos_padaria;

-- Exibir as 3 primeiras letras do nome.
select nome, left(nome, 3) as TrêsPrimeirasLetras from produtos_padaria;

-- Arredondar o preço.
select nome Nome,round(preco, 0) as PreçoArredondado from produtos_padaria;

-- Mostrar a data atual com os produtos.
select nome Nome, preco Preço, current_date() as DataAtual from produtos_padaria;

-- Mostrar a data atual formatada, com os produtos.
select nome Nome, preco Preço, DATE_FORMAT(current_date(),'%d/%m/%Y') "Data atual" from produtos_padaria;
 
