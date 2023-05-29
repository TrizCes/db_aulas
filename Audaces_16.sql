--comando para criação de instancia de banco de dados

--CREATE DATABASE Audaces;

--USE Audaces GO; 

--CREATE TABLE Pessoa
--( Id int PRIMARY KEY IDENTITY(1,1) NOT NULL, 
--	Nome VARCHAR(200) NOT NULL,
--	Endereco VARCHAR(200) NOT NULL,
--	Cidade VARCHAR(200) NOT NULL
--);


USE Audaces;

CREATE TABLE Alunos 
( 
 id INT PRIMARY KEY,  
 Nome VARCHAR(255) NOT NULL,  
 Matricula VARCHAR(40) UNIQUE NOT NULL,
);

CREATE TABLE Disciplinas 
( 
 id INT PRIMARY KEY IDENTITY(1,1),
 Nome VARCHAR (100),
);

CREATE TABLE Alunos_Disciplina 
( 
 id INT PRIMARY KEY,  
 alunos_id INT NOT NULL,  
 disciplina_id INT,  
);

ALTER TABLE Alunos_Disciplina ADD FOREIGN KEY(alunos_id) REFERENCES Alunos (id);
ALTER TABLE Alunos_Disciplina ADD FOREIGN KEY(disciplina_id) REFERENCES Disciplinas (id);



CREATE TABLE Categoria 
( 
 id INT PRIMARY KEY IDENTITY (1,1), 
 Nome VARCHAR(255) not null,
); 

CREATE TABLE Filmes 
( 
 id INT PRIMARY KEY IDENTITY (1,1),
 Titulo VARCHAR(255) not null, 
 categoria_id INT NOT NULL,
); 

CREATE TABLE Atores 
( 
 id INT PRIMARY KEY IDENTITY (1,1), 
 Nome VARCHAR (200) NOT NULL,
 Endereço VARCHAR(200)not null, 
 Telefone VARCHAR(200) not null,
); 

CREATE TABLE Filmes_Atores 
( 
 id INT PRIMARY KEY IDENTITY (1,1),
 filme_id INT NOT NULL,
 ator_id INT NOT NULL,
); 

CREATE TABLE Locadora 
( 
 id INT PRIMARY KEY IDENTITY (1,1),
 filme_id INT NOT NULL,
 cliente_id INT NOT NULL, 
); 

CREATE TABLE Clientes 
( 
 id INT PRIMARY KEY IDENTITY (1,1),
 Nome VARCHAR(200) NOT NULL,
 Telefone VARCHAR(200) NOT NULL,
 Endereço VARCHAR(200) NOT NULL,
); 

ALTER TABLE Filmes ADD FOREIGN KEY(categoria_id) REFERENCES Categoria (id);
ALTER TABLE Filmes_Atores ADD FOREIGN KEY(filme_id) REFERENCES Filmes (id);
ALTER TABLE Filmes_Atores ADD FOREIGN KEY(ator_id) REFERENCES Atores (id);
ALTER TABLE Locadora ADD FOREIGN KEY(filme_id) REFERENCES Filmes (id);
ALTER TABLE Locadora ADD FOREIGN KEY(cliente_id) REFERENCES Clientes (id);

CREATE TABLE Enderecos(
id INT PRIMARY KEY IDENTITY(1,1),
rua VARCHAR(255) NOT NULL,
numero INT,
complemento VARCHAR (40) NOT NULL,
Bairro VARCHAR (80),
Cidade VARCHAR (80),
UF CHAR (2) NOT NULL,
);

CREATE TABLE Pessoa(
ID INT PRIMARY KEY IDENTITY(1,1),
Nome varchar (100) not null,
Sobrenome varchar (60) not null,
endereco_id int
);

 CREATE TABLE LOJA 
 (
 id INT PRIMARY KEY IDENTITY(1,1),
 nome varchar(80),
 descricao varchar (255) not null,
 endereco_id int, foreign key (endereco_id) references Enderecos (id)
 );

 SELECT * FROM Alunos ALTER TABLE ALUNOS ALTER COLUMN Matricula varchar(50);

 ALTER TABLE ALUNOS ADD Idade INT NULL CONSTRAINT idade_default_value DEFAULT 0 WITH VALUES; 

 alter table alunos drop CONSTRAINT idade_default_value;

 alter table alunos drop column Idade;


 alter table alunos add Idade int null;
 -----------------------------------------------------
 if EXISTS(SELECT * FROM ALUNOS WHERE Idade is not null)
	alter table alunos drop column Idade;

	------------------------------------
	--CONSTRAINT
	CREATE TABLE Pessoa_002(
    Id int PRIMARY KEY IDENTITY(1,1),
    Nome varchar(255) NOT NULL,
    Idade int,
    Cidade varchar(255) NOT NULL,
    CONSTRAINT CHK_Person CHECK (Idade >=18 AND Cidade='São Paulo')
);

INSERT INTO Pessoa_002 (Nome, Idade, Cidade) values('Ale', 18, 'SÃO PAULO');

INSERT INTO Pessoa_002 (Nome, Idade, Cidade) values('AleX', 25, 'SÃO PAULO');

INSERT INTO Pessoa_002 (Nome, Idade, Cidade) values('ale', 18, 'Minas Gerais');

SELECT * FROM Pessoa_002;

DROP TABLE Pessoa_002;

CREATE TABLE Pai (
 ID INT PRIMARY KEY IDENTITY(1,1),
 Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Filho (
 ID SMALLINT PRIMARY KEY IDENTITY(1,1),
 Nome  VARCHAR(50)  NOT NULL,
 ID_Pai INT NOT NULL,

 CONSTRAINT fk_id_pai FOREIGN KEY (ID_Pai)
 REFERENCES Pai(Id)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);

INSERT INTO Pai VALUES ('João'), ('Mário'), ('Renato'), ('Emerson'), ('André');

INSERT INTO Filho (Nome, ID_Pai) VALUES ('João',1), ('Mário',1), ('Renato',3), ('Emerson',4), ('André',3);

INSERT INTO Enderecos (complemento, RUA, UF, Bairro, Cidade) VALUES ('CASA AZUL', 'RUA 3', 'SC', 'CENTRO', 'PARAISO');

INSERT INTO Enderecos VALUES ('RUA 3', NULL, 'CASA AZUL', 'CENTRO', 'PARAISO', 'SC');

SELECT * FROM Enderecos;

SELECT P.ID as Pai_Id, P.Nome as Nome_Pai, F.ID as Filho_Id, F.Nome as Nome_Filho
FROM Filho F
INNER JOIN Pai P
ON F.ID_Pai = P.ID;
