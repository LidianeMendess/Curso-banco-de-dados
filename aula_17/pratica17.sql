create database aula_17;
use aula_17;

create table matricula(
cod_matricula varchar(9) not null primary key,
dt_mat date
);

create table aluno(
ra varchar(9) not null primary key,
nome_alu varchar(30),
dt_nasc date,
cod_matricula varchar(9),
foreign key (cod_matricula) references matricula(cod_matricula)
);

create table curso(
cod_curso varchar(9) not null primary key,
nome_curso varchar(30),
carga_hor varchar(20),
cod_matricula varchar(9),
foreign key (cod_matricula) references matricula(cod_matricula)
);
                 
create table professor(
reg_prof varchar(9) not null primary key,
nome_prof varchar(30),
genero varchar(15),
dt_nasc_prof date,
titul varchar(20)
);

create table disciplina(
cod_disc varchar(9),
nome_disc varchar(30),
carga_horaria varchar (20),
cod_curso varchar(9),
reg_prof varchar(9),
foreign key (cod_curso) references curso(cod_curso),
foreign key (reg_prof) references professor(reg_prof)
);

-- Inserindo dados:
insert into matricula(cod_matricula, dt_mat)
values				 ('4545A', '2025-03-24' ),
					 ('4343A', '2025-02-17' ),
                     ('1212A', '2024-06-23' );
                     
insert into aluno(ra,nome_alu,dt_nasc, cod_matricula)
values			  ('12345', 'Vitória Francisca', '1996-05-15', '4545A'),
				  ('54321', 'Roberta de Oliveira', '2000-08-06', '4343A'),
				  ('67891', 'Yanka dos Santos', '1999-01-22','1212A');

insert into curso(cod_curso, nome_curso, carga_hor, cod_matricula)
values			 ('111', 'Ciências contábeis', '300hrs', '4545A'),
				 ('222', 'Farmácia', '200hrs', '4343A'),
				 ('333', 'Biologia', '400hrs', '1212A');

insert into professor(reg_prof, nome_prof, genero, dt_nasc_prof, titul)
values				('P001', 'Maria Silva', 'Feminino', '1980-05-12', 'Mestre'),
					('P002', 'João Souza', 'Masculino', '1975-09-23', 'Doutor'),
					('P003', 'Ana Oliveira', 'Feminino', '1990-02-10', 'Especialista');

insert into disciplina(cod_disc, nome_disc, carga_horaria, cod_curso, reg_prof)
values                ('D001', 'Matemática', '60h', '111', 'P001'),
					  ('D002', 'Física', '45h', '222', 'P002'),
					  ('D003', 'Português', '80h', '333', 'P003');
   
   

select 
upper (aluno.nome_alu) 'Nome do aluno',
curso.nome_curso'Curso',
professor.nome_prof'Nome do professor',
disciplina.nome_disc'Disciplina'
from aluno
join curso on aluno.cod_matricula=curso.cod_matricula
join disciplina on curso.cod_curso=disciplina.cod_curso
join professor on disciplina.reg_prof=professor.reg_prof;

  select
  upper(aluno.nome_alu) "Nome do Aluno",
  DATE_FORMAT(matricula.dt_mat, '%d/%m/%Y') "Data Matrícula"
  from aluno  inner join matricula matricula on (aluno.cod_matricula=matricula.cod_matricula);