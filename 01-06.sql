-- Aula do dia 01/06

-- INSERIR COLUNA NA TABELA
alter table nome_tabela add column nome_coluna int8; -- add column nome da coluna e tipo da coluna
-- exemplo
alter table Pessoa add column profissao varchar(40);

-- REMOVER COLUNA DA TABELA
alter table nome_tabela drop column nome_coluna;
-- exemplo
alter table Pessoa drop column profissao;

-- adicionar coluna na primeira posicao (BASTA USAR UM FIRST)
alter table Pessoa add column profissao varchar(40) first;

-- adicionar coluna após coluna qualquer:
alter table nome_tabela add column profissao varchar(30) after nome_coluna_desejda;

-- MODIFICAR TIPO E ESTRUTURA DA TABELA:
alter table Pessoa modify column profissao int8; -- alteraria o tipo para inteiro

-- MODIFICAR NOME , RESTRIÇÔES E DEFINIÇÕES DE UMA COLUNA:
alter table Pessoa change column nomeAntigo nomeNovo varchar(30) ;

-- RENOMEAR TABELA:
alter table Pessoa rename to Marcus;


-- criar tabela, definir chave primaria e trocar nome da tabela e tambem, inserir uma coluna depois da segunda e trocar o nome da terceira;
create database TesteDriver;
use TesteDriver;

-- criação da tabela
create table if not exists Pessoa(
id bigint auto_increment not null unique, nome varchar(30), idade int8 unsigned, peso float(2, 2) unsigned, sexo enum('M', 'F'), nascionalidade varchar(30) default 'brasileiro'
) charset=utf8; 
create table if not exists PessoaTeste(
id bigint auto_increment not null unique primary key, nome varchar(30), idade int8 unsigned, peso float(2, 2) unsigned, sexo enum('M', 'F'), nascionalidade varchar(30) default 'brasileiro'
) charset=utf8  ; 

-- visualização:
select * from Pessoa;

-- preechendo:
insert into Pessoa(nome, idade, peso, sexo, nascionalidade) values ( 'Marcus', 23, .12, 'M', default);
-- definindo chave primaria
alter table Pessoa add primary key (id);

select * from Pessoa;

-- renomeando
alter table PessoaTeste rename to Teste;
-- criando coluna dps da segunda
alter table Pessoa add column profissao varchar(30) after nome;
insert into Pessoa(profissao) value ('programador');

-- trocar nome da terceira coluna:
alter table Pessoa change column peso  quantidade_massa float(2.2) ;
select * from Pessoa;

delete from Pessoa where id = 2; -- remove inserção errada acima

insert into Pessoa  values ( default, 'Marcus', 'programador', 23, .12, 'M', default);
update Pessoa set id = 2 where id = 3;

-- limitando numero de linhas no update

update Pessoa set nome = 'jose' where nome = 'maria' limit 2;

-- deletando linhas:
delete from Pessoa where id = 2;

-- remover toda a linha:
truncate table Pessoa;






