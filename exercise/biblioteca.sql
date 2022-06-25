-- DDL
create database Biblioteca;

show databases;

use Biblioteca;

-- -----------------------Table definitions:------------------------

-- obra
create table obra(
	NR_Obra integer not null auto_increment unique,
    ID_Genero char(3),
    Titulo Varchar(50),
    primary key(NR_Obra),
    foreign key(ID_Genero) references genero (ID_Genero)
    ) default charset=utf8;
    
describe obra;

-- genero
create table genero(
	ID_Genero char(3) unique,
    Descricao varchar(25),
    primary key(ID_Genero)
    )default charset=utf8;

describe genero;

-- Livro

create table livro(
	NR_Livro integer unique auto_increment,
    Data_Aquisicao Date not null,
    Edicao integer not null,
    NR_Obra integer,
    ID_Editora char(5),
    primary key(NR_Livro),
    foreign key(NR_Obra)references obra(NR_Obra),
    foreign key(ID_Editora)references editora(ID_Editora)
	)default charset=utf8;

describe livro;

-- Editora
create table editora(
	ID_Editora char(5) unique,
    NomeFantasia varchar(60),
    primary key(ID_Editora)
    )default charset=utf8;

describe editora;
    
-- Movimentação

create table movimentacao(
	Matricula integer,
    NR_Livro integer,
    Data_Emprestimo date unique not null, 
    Data_Prevista date not null,
    Data_Devolucao date not null, 
    Multa Decimal(5,2),
    primary key (Data_Emprestimo),
    foreign key(Matricula)references usuario(Matricula),
    foreign key(NR_Livro)references livro(NR_Livro)
    )default charset=utf8;

describe movimentacao;

-- Usuario

create table usuario(
	Matricula integer not null unique,
    Nome varchar(50) not null,
    Sexo Enum('M', 'F'),
    Data_Nascimento Date not null,
    Endereco varchar(60) not null,
    primary key(Matricula)
    )default charset=utf8;

describe usuario;


-- Autoria

create table autoria(
	NR_Obra integer,
    ID_Autor integer
    )default charset=utf8;
    
describe autoria;

-- Autor

create table autor(
	ID_Autor integer not null unique,
    Nome varchar(40),
    primary key(ID_Autor)
    )default charset=utf8;
    
describe autor;

