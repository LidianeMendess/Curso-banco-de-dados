create database pratica18;
use pratica18;

create table alunos(
id int(5) not null primary key,
nome varchar (50),
email varchar(50),
fone varchar(20)
);

create table assuntos(
id int(3) not null primary key,
nome varchar (30)
);

create table livros(
id int(6)not null primary key,
titulo varchar(50),
autor varchar(50),
assunto_id int(3),
datalan date,
copias int(3),
foreign key (assunto_id) references assuntos (id)
);

create table emprestimos(
id int(8) not null primary key,
aluno_id int(5),
livro_id int(6),
dataret date,
dataprev date,
datadev date,
multa float(6,2),
foreign key (aluno_id) references alunos(id),
foreign key (livro_id) references livros(id)
);

-- Inserir alunos
INSERT INTO alunos (id, nome, email, fone) VALUES
(1, 'Ana Silva', 'ana.silva@email.com', '11988887777'),
(2, 'Bruno Costa', 'bruno.costa@email.com', '11977776666'),
(3, 'Carla Mendes', 'carla.mendes@email.com', '11966665555');

-- Inserir assuntos
INSERT INTO assuntos (id, nome) VALUES
(1, 'Matemática'),
(2, 'História'),
(3, 'Física');

-- Inserir livros
INSERT INTO livros (id, titulo, autor, assunto_id, datalan, copias) VALUES
(1, 'Álgebra Linear', 'Gilbert Strang', 1, '2020-03-10', 5),
(2, 'História do Brasil', 'Boris Fausto', 2, '2019-08-15', 3),
(3, 'Física Clássica', 'Resnick & Halliday', 3, '2021-01-20', 4);

-- Inserir emprestimos
INSERT INTO emprestimos (id, aluno_id, livro_id, dataret, dataprev, datadev, multa) VALUES
(1, 1, 1, '2025-08-01', '2025-08-15', '2025-08-14', 0.00),
(2, 2, 2, '2025-08-05', '2025-08-20', '2025-08-22', 2.50),
(3, 3, 3, '2025-08-10', '2025-08-25', NULL, 0.00);


-- selects: 
  -- 1: Título, autor e data de lançamento e ordenar por título
  select titulo Título, autor Autor, datalan 'Data Lançamento'
  from livros order by titulo;
  -- 2:livros lançados em 2011 ou 2012:
  select * from livros 
  where year(datalan)=2019 or year(datalan)=2020;
  -- 3: palavra "Redes" no livro:
  select * from livros 
  where titulo like '%Física%';
  -- 4: título, nome do assunto e número de cópias do livro:
  select l.titulo Título, a.nome Assunto, l.copias 'Número de cópias'
  from livros l inner join assuntos a on (a.id=l.assunto_id);
  -- 5: título, autor dos livros que tenha Redes no assunto.
  select titulo Título, autor Autor 
  from livros join assuntos on(assuntos.id=livros.assunto_id)
  where assuntos.nome like'%Física%';
  -- 6: nome do assunto e número de livros agrupado por assunto:
  select a.nome Assunto, sum(l.copias) 'Qtde por assunto' 
  from assuntos a inner join livros l on (a.id=l.assunto_id)
  group by a.nome;
  -- 7: Alterar o número de cópias aumentando 2 dos números de cópias inferiores a 10
  select * from livros;
  select * from livros where copias < 10;
  update livros set copias = copias+2 
  where copias<10;
  -- 8: título do livro, nome do aluno e data retirada:
  select * from emprestimos;
  select l.titulo Título, a.nome Aluno, e.dataret Retirada 
  from livros l join emprestimos e on (l.id=e.livro_id)
  join alunos a on (a.id=e.aluno_id);
  select * from emprestimos;
  update emprestimos set multa=5.50 where id=5 or id=6;
  -- 9: somar as multas dos livros retirados em 2013
  select sum(multa) 'Soma das multas'
  from emprestimos
  where year(dataret)=2022;
  -- 10: inserir um novo aluno:
   insert into alunos (id, nome, email, fone) values
  (4, 'Novo Aluno', 'novo@email.com', '19 123456');





