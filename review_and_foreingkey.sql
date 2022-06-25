
/* ---------------------- Basics content ------------------------ */


-- list databases
show databases;


-- create a database:
create database if not exists cadastro;

-- choice a database
use cadastro;

-- list tables
show tables from cadastro;

-- create table
create table pessoa(	
	id integer auto_increment not null,
    nome varchar(35) not null,
    profissao varchar(20) not null default 'estudante',
    nascimento date not null,
    sexo enum('M', 'F') not null,
    peso decimal(5, 2),
    primary key(id)
    )default charset=utf8;

-- list table
show tables from cadastro;

-- show items in the table
select * from pessoa;

-- describe the table (show data in detail from table choised)
describe pessoa;

-- insert data into table
insert into pessoa values (0, 'Marcus', default, '1980-01-01', 'M', 078.35);

insert into pessoa(id, nome, profissao, nascimento, sexo, peso) values (0, 'Marcus2', 'programador', '1980-01-01', 'M', 078.35);

insert into pessoa(id, nome, profissao, nascimento, sexo, peso) values
	(default, 'Marcus10', 'programador2', '1981-09-09', 'M', 888.23);

insert into pessoa values(default, 'Marcus4', 'programador3', '1981-09-09', 'M', 888.23), 
	(default, 'Marcus5', 'programador4', '1981-09-09', 'M', 888.23),
    (default, 'Marcus6', 'programador5', '1981-09-09', 'M', 888.23);
    
    
/*-------------------- alter table structure ---------------------*/

-- add column
alter table pessoa add column nascionalidade varchar(30) default 'brasileiro';

-- remove column
alter table pessoa drop column nascionalidade;

-- add column in a specific position
alter table pessoa add column nascionalidade varchar(30) default 'brasileiro' first;
alter table pessoa add column nascionalidade varchar(30) default 'brasileiro' after id;

-- modify column
alter table pessoa modify column profissao varchar(35) default 'developer';

-- change column name
alter table pessoa change column profissao  prof varchar(35);

-- rename table
alter table pessoa rename to people;

select * from people;


-- ----------------- create new table ----------------------
/*
CURSO:
nome: caracter(30) não nulo único,
descricao: texto,
carga: inteiro não admite sinal negativo,
totalAula: inteiro não admite sinal negativo,
ano: data (setar default ‘2016’)
*/

-- resolução:
create table Curso(
	nome varchar(30) not null unique,
    carga integer unsigned,
    totalAula integer unsigned,
    ano date default '2016-01-01')default charset=utf8;
    
describe curso;

-- delet table
drop table Curso;

alter table Curso rename to curso;

alter table curso add column id integer not null primary key unique first;

/* -------------------- update ------------------------*/

select * from people;
update people set prof = 'programador6' where id = 7;

update people set prof = 'programador32', nome = 'MARCUS' where id = 7 limit 2;

/* ------------------- delete ------------------------*/
delete from people where id = 7;

-- after a deletion, ids are not sequential
-- delete all lines
truncate table cursos;


/* ------------------ Foreing key --------------------*/

-- on table with max cardinale = 1
alter table people add column id_curso integer;
alter table people add foreign key(id_curso) references curso (id) on delete restrict; -- on delete restrict impede de apagar a linha se existir em curso
-- to del in the both tables, use on delete cascate

select * from people; -- now, this table respect referencial integrity


