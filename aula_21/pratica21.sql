create database pratica21;
use pratica21;

create table alunos(
aluno_id int primary key not null,
nome varchar(50),
cidade varchar(50)
);

create table instrumentos(
instrumento_id int primary key not null,
nome_instrumento varchar(50)
);

create table aulas(
aula_id int primary key not null,
data_aula date,
instrumento_id int,
aluno_id int,
foreign key (instrumento_id) references instrumentos(instrumento_id),
foreign key (aluno_id) references alunos(aluno_id)
);

-- Inserindo dados
insert into alunos(aluno_id, nome, cidade) values
(1, 'Lucas', 'Campinas'),
(2, 'Mariana', 'Bragança'),
(3, 'Rafael', 'São Paulo'),
(4,'Sofia', 'Campinas'),
(5, 'Bruno', 'Bragança');

insert into instrumentos(Instrumento_id, nome_instrumento) values
(10, 'Violão'),
(20, 'Piano'),
(30, 'Bateria'),
(40, 'Saxofone');

insert into aulas(aula_id, aluno_id, Instrumento_id, data_aula) values
(1001, 1, 10, '2025-08-10'),
(1002, 2, 20, '2025-08-11'),
(1003, 5, 30, '2025-08-12'),
(1004, 3, 40, '2025-08-13'),
(1005, 4, 10, '2025-08-14');


select
alunos.nome as Aluno,
aulas.aula_id as Aula_id,
instrumentos.nome_instrumento as Instrumento
from alunos 
inner join aulas on (alunos.aluno_id=aulas.aluno_id)
inner join instrumentos on (instrumentos.instrumento_id=aulas.instrumento_id);

select
alunos.nome as Aluno,
aulas.aula_id as Aula_id,
instrumentos.nome_instrumento as Instrumento
from alunos 
left join aulas on (alunos.aluno_id=aulas.aluno_id)
left join instrumentos on (instrumentos.instrumento_id=aulas.instrumento_id);

select 
aulas.aula_id,
alunos.nome as Aluno,
instrumentos.nome_instrumento as Instrumento
from aulas
left join alunos on (alunos.aluno_id=aulas.aluno_id)
left join instrumentos on (instrumentos. instrumento_id= aulas.instrumento_id);

SELECT 
    alunos.aluno_id,
    alunos.nome AS Aluno,
    aulas.aula_id,
    instrumentos.nome_instrumento
FROM alunos
LEFT JOIN aulas ON alunos.aluno_id = aulas.aluno_id
LEFT JOIN instrumentos ON aulas.instrumento_id = instrumentos.instrumento_id

UNION

SELECT 
    alunos.aluno_id,
    alunos.nome AS Aluno,
    aulas.aula_id,
    instrumentos.nome_instrumento
FROM aulas
LEFT JOIN alunos ON alunos.aluno_id = aulas.aluno_id
LEFT JOIN instrumentos ON aulas.instrumento_id = instrumentos.instrumento_id;

 
SELECT 
    alunos.aluno_id,
    alunos.nome AS Aluno,
    COUNT(aulas.aula_id) AS total_aulas
FROM alunos
LEFT JOIN aulas ON alunos.aluno_id = aulas.aluno_id
GROUP BY alunos.aluno_id, alunos.nome
ORDER BY alunos.aluno_id;

