USE m02s08;
GO

INSERT INTO Jogador (nome, email, moedas)
VALUES 
    ('John', 'john@email.com', 500),
    ('Jane', 'jane@email.com', 300),
    ('Mike', 'mike@email.com', 800),
    ('Sarah', 'sarah@email.com', 0),
    ('David', 'david@email.com', 1000),
    ('Emily', 'emily@email.com', 400),
    ('Michael', 'michael@email.com', 0),
    ('Olivia', 'olivia@email.com', 250),
    ('Daniel', 'daniel@email.com', 900),
    ('Sophia', 'sophia@email.com', 150),
    ('Matthew', 'matthew@email.com', 1100),
    ('Emma', 'emma@email.com', 450),
    ('Jacob', 'jacob@email.com', 300),
    ('Ava', 'ava@email.com', 0),
    ('William', 'william@email.com', 220),
    ('Isabella', 'isabella@email.com', 1200),
    ('Ethan', 'ethan@gmail.com', 400),
    ('Mia', 'mia@email.com', 550),
    ('Alexander', 'alexander', 300),
    ('Charlotte', 'charlotte', 1000);

INSERT INTO Heroi (nome, jogador_id, nivel, classe, vida, mana, ataque, defesa)
VALUES 
    ('Oswyal', 1, 10, 'Guerreiro', 100, 100, 50, 40),
    ('Cyoasn', 1, 8, 'Mago', 80, 150, 70, 20),
    ('Zaigas', 2, 6, 'Guerreiro', 70, 70, 60, 30),
    ('Kezige', 3, 13, 'Paladino', 120, 100, 60, 50),
    ('Hikefi', 4, 9, 'Ca�ador', 90, 80, 70, 25),
    ('Luiwoy', 5, 11, 'Mago', 120, 200, 40, 35),
    ('Poiben', 6, 7, 'Paladino', 60, 50, 30, 15),
    ('Diekia', 7, 9, 'Shaman', 70, 80, 45, 30),
    ('Duageu', 8, 12, 'Ca�ador', 100, 95, 35, 45),
    ('Asnier', 9, 6, 'Shaman', 60, 60, 50, 20),
    ('Tianue', 10, 4, 'Monge', 50, 30, 55, 15),
    ('Zenual', 11, 15, 'Ca�ador', 130, 120, 65, 55),
    ('Xyuxol', 12, 11, 'Guerreiro', 75, 75, 75, 20),
    ('Teilin', 13, 8, 'Monge', 70, 100, 80, 15),
    ('Weutao', 14, 10, 'Guerreiro', 90, 80, 50, 30),
    ('Knight', 15, 5, 'Paladino', 80, 60, 40, 50),
    ('Ruyfao', 16, 16, 'Mago', 100, 250, 85, 25),
    ('Doucua', 17, 7, 'Ca�ador', 65, 55, 70, 20),
    ('Gesani', 18, 10, 'Mago', 75, 95, 90, 15),
    ('Naoles', 19, 13, 'Guerreiro', 95, 75, 45, 40);

INSERT INTO Item (nome, tipo, valor, nivel_requerido)
VALUES 
    ('Espada', 'Arma', 100, 5),
    ('Cajado', 'Arma', 80, 3),
    ('Po��o', 'Consum�vel', 20, 1),
    ('Machado', 'Arma', 120, 8),
    ('Varinha', 'Arma', 70, 4),
    ('Pergaminho', 'Consum�vel', 10, 1),
    ('Arco', 'Arma', 90, 6),
    ('Adaga', 'Arma', 60, 2),
    ('Anel', 'Acess�rio', 50, 3),
    ('Escudo', 'Armadura', 110, 7),
    ('Capacete', 'Armadura', 80, 5),
    ('Capa', 'Armadura', 60, 3),
    ('Luva', 'Armadura', 40, 2),
    ('Bota', 'Armadura', 50, 3),
    ('Amuleto', 'Acess�rio', 70, 5),
    ('Lan�a', 'Arma', 100, 10),
    ('Ma�a', 'Arma', 130, 12),
    ('Livro', 'Consum�vel', 15, 2),
    ('Crossbow', 'Arma', 95, 8),
    ('Veste', 'Armadura', 75, 6),
    ('Canh�o', 'Arma', 150, 13);

INSERT INTO Heroi_Item (heroi_id, item_id, quantidade)
VALUES 
    (1, 1, 1),
    (1, 3, 5),
    (2, 2, 1),
    (3, 1, 1),
    (3, 3, 3),
    (4, 4, 1),
    (5, 5, 2),
    (6, 6, 10),
    (7, 7, 1),
    (7, 8, 1),
    (8, 9, 2),
    (9, 10, 1),
    (10, 11, 1),
    (11, 12, 1),
    (12, 13, 3),
    (13, 14, 1),
    (14, 15, 1),
    (15, 16, 1),
    (15, 17, 1),
    (16, 18, 5),
    (17, 19, 2),
    (18, 20, 1);

INSERT INTO Missao (nome, recompensa_moedas, nivel_requerido)
VALUES 
    ('Derrote os Goblins', 200, 3),
    ('Recupere o artefato', 500, 8),
    ('Resgate o prisioneiro', 300, 5),
    ('Extermine os zumbis', 250, 6),
    ('Colete ingredientes raros', 150, 4),
    ('Elimine o lider dos ladr�es', 400, 7),
    ('Proteja o vilarejo', 350, 6),
    ('Recupere o tesouro roubado', 450, 9),
    ('Exorcise o templo amaldi�oado', 350, 8),
    ('Encontre o herdeiro perdido', 200, 5),
    ('Descubra o segredo perdido', 600, 10),
    ('Elimine o rei demonio', 1000, 12),
    ('Recupere a coroa real', 800, 11),
    ('Defenda a fortaleza', 700, 9),
    ('Destranque a tumba perdida', 300, 7),
    ('Derrote o drag�o anci�o', 1500, 15),
    ('Resgate a princessa real', 900, 11),
    ('Complete os desafios de vigor', 600, 9),
    ('Procure pelo tesouro lend�rio', 1200, 14),
    ('Recupere a espada perdida', 800, 10),
    ('Derrube a ponte sagrada', 1500, 20);

INSERT INTO Heroi_Missao (heroi_id, missao_id, progresso, data_finalizacao)
VALUES 
    (1, 1, 1, '2023-05-15'),
    (1, 2, 1, '2023-05-17'),
    (2, 2, 0, NULL),
    (3, 1, 1, '2023-05-14'),
    (3, 3, 1, '2023-05-18'),
    (4, 4, 1, '2023-05-16'),
    (4, 5, 0.5, NULL),
    (5, 5, 0.75, NULL),
    (6, 6, 1, '2023-05-19'),
    (6, 7, 1, '2023-05-20'),
    (7, 8, 0.33, NULL),
    (8, 9, 1, '2023-05-18'),
    (8, 10, 1, '2023-05-20'),
    (9, 11, 1, '2023-05-16'),
    (10, 12, 0.66, NULL),
    (11, 13, 1, '2023-05-19'),
    (11, 14, 1, '2023-05-20'),
    (12, 15, 0.5, NULL),
    (13, 16, 1, '2023-05-17'),
    (13, 17, 1, '2023-05-19'),
    (14, 18, 1, '2023-05-18'),
    (15, 19, 0.66, NULL),
    (16, 20, 1, '2023-05-20');

	SELECT * FROM Jogador; 
	SELECT * FROM Heroi WHERE nivel > 10 AND VIDA >= 100; 
	SELECT * FROM Item WHERE tipo = 'Armadura' OR tipo = 'Consum�vel'; 
	SELECT * FROM Missao; 

	SELECT * FROM Heroi;
	SELECT classe FROM Heroi;
	SELECT DISTINCT classe FROM Heroi;
	SELECT classe, nivel FROM Heroi;
	SELECT DISTINCT classe, nivel FROM Heroi;

	SELECT nome FROM Item;
	SELECT nome FROM Item ORDER BY nome ASC;
	SELECT * FROM Item ORDER BY valor DESC;

	SELECT nome FROM Missao;
	SELECT nome AS nome_da_missao FROM Missao;
	SELECT nome AS 'Nome da Miss�o', 
	(nivel_requerido + 2) AS 'Nivel recomendado' FROM Missao;

	SELECT COUNT(*) AS 'Numero de jogadores' FROM Jogador;

	SELECT SUM(recompensa_moedas) AS 'Somat�rio das recompensas' FROM Missao;

	SELECT AVG(NIVEL) AS 'Nivel m�dio dos herois' FROM Heroi;

	SELECT MIN(moedas) AS 'Minimo de moedas' FROM Jogador;
	SELECT MAX(moedas) AS 'M�ximo de moedas' FROM Jogador;
	SELECT MIN(data_finalizacao) AS 'Primeiro miss�o completada' FROM Heroi_Missao;

	SELECT TOP 10 nome, moedas FROM jogador;

	--Exercicios: 

	SELECT * FROM Heroi WHERE nivel >= 10 ORDER BY nivel;

	SELECT * FROM Heroi WHERE classe = 'Mago' AND nome LIKE '_u%';

	SELECT nome, moedas FROM Jogador ORDER BY moedas DESC;

	SELECT nome AS 'Nome do Jogador', (moedas * 0.35) AS 'Dinheiro gasto (R$)' FROM Jogador;

	SELECT COUNT(DISTINCT classe) AS 'Classes totais no jogo' FROM Heroi; 