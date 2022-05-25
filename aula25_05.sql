show databases;
use BDMarcus;

/*INICIO DA AULA*  25/05/2022*/

-- criação da tabela
create table Pessoa(
	id integer not null auto_increment,
    nome varchar(30) not null,
    nascimento date,
    sexo enum('M', 'F'),
    peso float(5,2),
    altura decimal(3, 2),
    nascionalidade varchar(20) default 'Brasil',
    primary key(id)) ;
    
    
    describe Pessoa;  -- descreve,detalhadamente, a tabela
    
    
    -- inserção de dados: insert into Table(colunas) values (valores);
    insert into Pessoa(nome, nascimento, sexo, peso, altura, nascionalidade) 
    values ('Marcus', '9999-09-09', 'M', 78.6, 1.78, 'Brasil');
    
    -- obs, inserir valor padrão: insert into Pessoa(campos) value (default);
    -- obs: se seguir a ordem exata insert into Pessoa value ();0
    select * from Pessoa; -- ver o que foi adicionado à tabela
    
    
    
    
    
    
     
    