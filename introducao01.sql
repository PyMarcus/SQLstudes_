/*Com os modelos conceituais e lógicos prontos, deve-se implementá-los em um SGBD.
  Para isso, utiliza-se a linguagem SQL.
  O SQL surgiu na década de 70 com a IBM e foi padronizado pela ANSI.Desse modo, 
  foi criado para padronizar, padrão SEQUEL, as consultas em bancos de dados, bem como a manipulação e segurança deste.
  
  --> VANTAGENS:
  É portável (roda em qualquer sistema).
  Longevidade (devido ter um padrão).
  Fácil de aprender.
  Comunica com outros sistemas.
  
  --> DESVANTAGENS:
  Não é uma linguagem estruturada com condicionais e etc, o que pode dificultar a aplicação de certas lógicas.
  É mais baseadas em obter resultados diretos.
  
  --> Características:
  
  *DDL: definition data language é a linguagem, dentro do sql, que permite estruturar o banco de dados (criar banco, deletá-lo, criar
  tabelas e etc).
  
  *DML: data manipulation language permite a gerência dos dados (consulta, inserção, atualização e etc)
  
  *DCL: data control language: permite a gestão dos usuários e controle de acesso.
  
  Sobre o MySQL:
  é um dos principais sgbd, é de código aberto (licença GPL), criado pela empresa sueca MySQL AB, mas, a Oracle o comprou.
  Assim, há a versão grátis e a paga. O MariaDB é um banco semelhante.
  
  O mysql é um sgbd robusto, com várias propriedades de segurança ,multiacesso e etc.É um dos bancos mais rápidos e 
  pode ser usado para desktop, internet, e armazenamento de logs.
  
  IDE Workbench:
  é uma capa gráfica para a interação com o mysql, não é o sgbd, é apenas uma interface gráfica.
   
  
  */
  
  
  -- Criar banco de dados, se já não existir
  create database if not exists nome; 
  
  -- Deletar um banco
  drop database nome;
  
  -- ver bancos existentes
  show databases;
  
  -- utilizar um banco 
  use nome;
  
  -- criar uma tabela:
  create table nome_tabela(campos tipo restrições);
  
  /* 
	Tipos no banco de dados:
    1) Numérico: RESTRIÇÃO (SIGNED Ou UNSIGNED, ZEROFILL, AUTO_INCREMENT, )
    Inteiro => TinyInt , int, bigint
    Real => Decimal, float, double, real  exemplo Float(8, 4) - precisão de 4  bytes apos a virgula. 8 números ao todo
    Lógico => bit, Boolean  
    OBS: em caso de passar da unidade, out of range é disparado
    
    2) Data
    Date, DateTime, TimeStamp, Time, Year (timestamp mostra o fuso, date so a data, datetime data e hora)
    
    3) Literal (Pode-se usar set ou collate para definir os tipos de valores suportados)
    caractere => char, varchar  (varchar é melhor na memória)
    texto => Text, LongText, TinyText
    Binario => Blob(para imagens, por exemplo), LongBlob
    Coleção => Set, Enum (mostra lista pre-definida de valores)
    Espacial => Geometry, Point
    
    --RESTRIÇÕES (constrainsts)
    
    * limita os tipos de dados inseridos
    * especificadas na criação ou alteração de uma tabela
    
    tipos:
    Null => valor nulo
    Not Null => não permite valores nulos
    Default => define um valor padrão (não aplicado em chaves primárias)
    Unique => similar a primary key, garante unicidade
    
    Primary key => identifica de forma única
    exemplo PrimaryKey(atributo_que_ira_receber)
    
    auto_increment => permite q valores sejam gerados automáticamente
    unsigned => tira sinal do número
    */
-- criar banco com restricoes de texto:
create database teste default character set utf8 default collate utf8_general_ci; 

-- criar tabela com restrições e tipo:
create table Pessoa(
	id int not null auto_increment,
    nome varchar(30) not null, 
    nascimento date,
    sexo enum('M', 'F') not null,
    peso decimal(3, 2),
    altura float(3, 2),
    nacionalidade varchar(20) default 'Brasil',
    primary key(id)
    ) default charset=utf8;
    
    
    
  