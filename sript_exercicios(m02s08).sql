create database ecommerce;
GO

USE ecommerce;

--Ex 2 - CREATE

CREATE TABLE Cliente 
( 
 id INT PRIMARY KEY IDENTITY(1,1),  
 Nome VARCHAR(255) NOT NULL,  
 Data_de_nascimento DATE NOT NULL,  
 email VARCHAR(80) NOT NULL,  
 cpf VARCHAR(11) NOT NULL,  
 senha VARCHAR(14) NOT NULL,  
); 

CREATE TABLE Produtos 
( 
 id INT PRIMARY KEY IDENTITY(1,1),  
 Nome VARCHAR(80) NOT NULL,  
 Preco NUMERIC(10, 2) NOT NULL,  
 Nota NUMERIC(3, 2) NOT NULL,  
 Unidades INT NOT NULL,  
 Un_vendidas INT NOT NULL,  
); 

CREATE TABLE Pedidos 
( 
 id INT PRIMARY KEY IDENTITY(1,1),  
 Valor_total NUMERIC(10, 2) NOT NULL,  
 Status VARCHAR(50) NOT NULL,  
 Entregue BIT NOT NULL,  
); 

CREATE TABLE Metodo_de_pagamento 
( 
 id INT PRIMARY KEY IDENTITY(1,1),  
 Numero_cartao VARCHAR(16) NOT NULL,  
 Validade DATE NOT NULL,  
 Cod_seguranca VARCHAR(3) NOT NULL,  
 Cliente_id INT NOT NULL,
); 

CREATE TABLE Avaliacao_produto 
( 
 id INT PRIMARY KEY IDENTITY(1,1),  
 Comentario VARCHAR(500),  
 Estrelas NUMERIC(1, 0) NOT NULL,  
 Data_criacao DATE NOT NULL,  
); 

CREATE TABLE Avaliacao_cliente_produto 
( 
 id INT PRIMARY KEY IDENTITY(1,1),  
 Avaliacao_id INT NOT NULL,  
 Cliente_id INT NOT NULL,  
 Pedido_id INT NOT NULL,  
 Produto_id INT NOT NULL,  
); 

CREATE TABLE Processamentos_de_pedidos 
( 
 id INT PRIMARY KEY IDENTITY(1,1),  
 cliente_id INT NOT NULL,  
 pedido_id INT NOT NULL,  
 metodo_pag_id INT NOT NULL, 
 produto_id INT NOT NULL,  
); 

ALTER TABLE Metodo_de_pagamento
ADD FOREIGN KEY(Cliente_id) 
REFERENCES Cliente (id);
ALTER TABLE Avaliacao_cliente_produto 
ADD FOREIGN KEY(Avaliacao_id) 
REFERENCES Avaliacao_produto (id)
ALTER TABLE Avaliacao_cliente_produto 
ADD FOREIGN KEY(Cliente_id) 
REFERENCES Cliente (id)
ALTER TABLE Avaliacao_cliente_produto 
ADD FOREIGN KEY(Pedido_id) 
REFERENCES Pedidos (id)
ALTER TABLE Avaliacao_cliente_produto 
ADD FOREIGN KEY(Produto_id) 
REFERENCES Produtos (id)
ALTER TABLE Processamentos_de_pedidos 
ADD FOREIGN KEY(metodo_pag_id) 
REFERENCES Metodo_de_pagamento (id)
ALTER TABLE Processamentos_de_pedidos 
ADD FOREIGN KEY(cliente_id) 
REFERENCES Cliente (id)
ALTER TABLE Processamentos_de_pedidos 
ADD FOREIGN KEY(pedido_id) 
REFERENCES Pedidos (id)
ALTER TABLE Processamentos_de_pedidos
ADD FOREIGN KEY(produto_id) 
REFERENCES Produtos (id);

GO


--Ex 3 - INSERT

INSERT INTO Cliente VALUES (
'Francisca Isabel Rosângela Mendes',
'1973-04-19',
'francisca-mendes80@aiesec.net',
'26670941234' ,
'KaXdqLLfcb'
);

INSERT INTO Cliente VALUES (
'Diego Anderson Giovanni Rocha',
'1966-01-02',
'diego-rocha78@lynce.com.br',
'25771227803' ,
'mq82h4te3U'
);

INSERT INTO Cliente VALUES (
'Jaqueline Elza Olivia Nunes',
'1946-04-08',
'jaqueline_elza_nunes@kascher.com.br',
'23525797753' ,
'5UlON2FuzS'
);

INSERT INTO Cliente VALUES (
'Francisco Lucas Souza',
'2001-01-27',
'francisco-souza85@azulcargo.com.br',
'80311636004' ,
'dGujyKp0Yc'
);
GO
--

INSERT INTO Metodo_de_pagamento VALUES 
('5576488955959028','26/12/2023','645',1),
('4532315936669572','26/12/2023','958',1),
('346197634539065','26/09/2024','783',2),
('6062829396917092','26/01/2024','522',2),
('4485839356690211','26/03/2025','536',3),
('5524783600208182','26/02/2025','890',3),
('201451928715590','26/11/2023','904',4),
('5229461281698611','26/01/2025','303', 4);
GO
--

INSERT INTO Produtos VALUES (
'Blusa',
50.66, 
5,
200,
50
);

INSERT INTO Produtos VALUES (
'Calça',
250.75, 
5,
100,
50
);

INSERT INTO Produtos VALUES (
'Jaqueta',
450.00, 
5,
80,
50
);

INSERT INTO Produtos VALUES (
'Casaco',
349.99, 
2,
75,
13
);

INSERT INTO Produtos VALUES (
'Pantalona',
320.10, 
4,
150,
35
);

INSERT INTO Produtos VALUES (
'Saia',
310.00, 
5,
80,
10
);

INSERT INTO Produtos VALUES (
'Vestido',
550.00, 
3,
40,
8
);

INSERT INTO Produtos VALUES (
'Vestido- RENDA',
750.45, 
5,
10,
5
);

INSERT INTO Produtos VALUES (
'Vestido - Bordado',
500.68, 
4,
40,
15
);

INSERT INTO Produtos VALUES (
'Jaqueta Bomber',
299.99, 
1,
46,
13
);

INSERT INTO Produtos VALUES (
'Casaco Teddy',
449.99, 
4,
105,
53
);

INSERT INTO Produtos VALUES (
'Saia mid',
150.00, 
2,
85,
59
);

select * FROM Produtos;

GO
--

INSERT INTO Pedidos (Valor_total, Status, Entregue) VALUES 
(320.10, 'Em andamento', 0),
(550.00, 'Concluído', 1),
(299.99, 'Em andamento', 0),
(750.45, 'Concluído', 1),
(449.99, 'Em andamento', 0);
GO

--
INSERT INTO Processamentos_de_pedidos (cliente_id, pedido_id, metodo_pag_id, produto_id) VALUES 
(1, 1, 1, 1),
(2, 2, 3, 3),
(3, 3, 6, 5),
(4, 4, 8, 6),
(1, 5, 2, 8);
GO

--
INSERT INTO Avaliacao_produto (Comentario, Estrelas, Data_criacao) VALUES 
('Ótimo produto!', 5, '2023-05-25'),
('Amei o vestido!', 4, '2023-05-25'),
('Jaqueta de excelente qualidade.', 5, '2023-05-26'),
('Produto conforme descrição.', 3, '2023-05-26'),
('Blusa com tecido confortável.', 4, '2023-05-27'),
('Calça elegante e bem ajustada.', 4, '2023-05-27');
GO

--

INSERT INTO Avaliacao_cliente_produto (Avaliacao_id, Cliente_id, Pedido_id, Produto_id) VALUES 
(1, 1, 1, 1),
(2, 2, 2, 3),
(3, 3, 3, 5),
(4, 4, 4, 6),
(5, 1, 5, 8);
GO 
--

SELECT * FROM Cliente;
SELECT * FROM Metodo_de_pagamento;
SELECT * FROM Produtos;
SELECT * FROM Pedidos;
SELECT * FROM Processamentos_de_pedidos;
SELECT * FROM Avaliacao_produto;
SELECT * FROM Avaliacao_cliente_produto;

--EX:04
SELECT TOP 2
P.nome AS 'Nome do produto', 
COUNT(PP.produto_id) AS Quantidade
FROM Produtos AS P
JOIN Processamentos_de_pedidos AS PP
ON P.id = PP.produto_id
GROUP BY P.Nome
ORDER BY Quantidade DESC; 

GO

--EX:05
SELECT 
id AS 'Pedido ID', 
Valor_total AS 'Valor total do pedido', 
Status 
FROM Pedidos 
WHERE Entregue = 1 
AND Valor_total > 100;

GO

--EX:06
SELECT 
C.Nome,
COUNT(ACV.Cliente_id) AS 'Numero de avaliações'
FROM Cliente AS C
LEFT JOIN Avaliacao_cliente_produto AS ACV
ON C.id = ACV.Cliente_id
GROUP BY C.Nome
ORDER BY 'Numero de avaliações' DESC;

--EX:07
SELECT 
C.Nome AS 'Nome do cliente', 
PP.produto_id AS 'Item ID',
P.Valor_total AS 'Valor da compra'
FROM Cliente AS C
JOIN Processamentos_de_pedidos AS PP
ON C.id = PP.cliente_id
JOIN Pedidos AS P
ON PP.pedido_id = P.id
WHERE P.Valor_total > 150; 
GO

--EX:08
CREATE PROCEDURE AtualizarEstoque 
	@idDoProduto INT, 
	@qntVendida INT
AS
UPDATE Produtos
SET Unidades = Unidades - @qntVendida,
Un_vendidas = Un_vendidas + @qntVendida
WHERE id = @idDoProduto;

GO

EXEC AtualizarEstoque 1, 10; 
GO

SELECT * FROM Produtos;
GO

--EX:09
CREATE VIEW vwDetalhesPedidosClientes AS
	SELECT
	P.id AS 'Id do pedido',
	C.Nome AS 'Nome do cliente',
	C.email AS 'email',
	P.Valor_total AS 'Valor do pedido', 
	P.Status
	FROM 
	Cliente AS C
	JOIN 
	Processamentos_de_pedidos AS PP
	ON C.id = PP.cliente_id
	JOIN 
	Pedidos AS P
	ON PP.pedido_id = P.id;
GO
select * from vwDetalhesPedidosClientes;
