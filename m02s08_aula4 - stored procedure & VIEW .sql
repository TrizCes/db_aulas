
--STORE PROCEDURES

CREATE PROCEDURE BuscaTodosHerois 
AS 
	SELECT * FROM Heroi;

EXEC BuscaTodosHerois;
go


CREATE PROCEDURE BuscaHeroiPorNivel 
	@NivelDesejado INT
AS 
SELECT * FROM Heroi
WHERE nivel = @NivelDesejado;

EXEC BuscaHeroiPorNivel @NivelDesejado = 10;
GO

CREATE PROCEDURE ProcuraUserPorNomeEMoedas
	@NomeUser VARCHAR(100),
	@MinMoedas INT
AS
	SELECT * FROM Jogador
	WHERE nome LIKE '%' + @NomeUser + '%'
	AND
	moedas >= @MinMoedas;

	GO

EXEC ProcuraUserPorNomeEMoedas @NomeUser = 'an', @MinMoedas = 60;
go

CREATE VIEW vwHeroiMaisExperiente
AS
	SELECT TOP 1 
	J.nome AS 'Nome do Jogador',
	H.nome AS 'Nome do Heroi',
	H.classe,
	H.nivel
	FROM 
	Jogador AS J
	JOIN Heroi AS H
	ON J.id = H.jogador_id
	ORDER BY H.nivel DESC;

	GO

	SELECT * FROM vwHeroiMaisExperiente;

	SELECT * FROM Heroi
	WHERE classe = (SELECT classe FROM vwHeroiMaisExperiente);

	SELECT * FROM Heroi WHERE nivel > 10;

	GO

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

	--EXERCICIOS

------------------------------------------------------------------------------------

--Crie um stored procedure que aceita o ID de um jogador
--e retorna o total de moedas que ele possui.

CREATE PROCEDURE RetornaMoedasDoJogador
	@IdUser INT
AS
	SELECT moedas AS 'Total de moedas' FROM Jogador
	WHERE id = @IdUser;

	GO

EXEC RetornaMoedasDoJogador @IdUser = 1;

GO

------------------------------------------------------------------------------------

--Crie uma view que mostra o nome do jogador, 
--nome do heroi e nível do heroi para todos os herois acima do nível 10.

CREATE VIEW vwJogadoresEHeroisDeNivelMaiorQueDez
AS
	SELECT 
	J.nome AS 'Nome do Jogador',
	H.nome AS 'Nome do Heroi',
	H.nivel
	FROM 
	Jogador AS J
	JOIN Heroi AS H
	ON J.id = H.jogador_id
	WHERE H.nivel > 10;

	GO

	SELECT * FROM vwJogadoresEHeroisDeNivelMaiorQueDez;

	GO

------------------------------------------------------------------------------------

--Crie uma view que mostra o nome do heroi,
--o nome do item e a quantidade que ele possui.

CREATE VIEW vwItensDeCadaHeroi
AS
	SELECT 
	H.nome AS 'Nome do Heroi',
	I.nome AS 'Item',
	HI.quantidade 
	FROM 
	Heroi AS H
	JOIN
	Heroi_Item AS HI
	ON H.id = HI.heroi_id
	JOIN 
	Item AS I
	ON HI.item_id = I.id;

	GO

	SELECT * FROM vwItensDeCadaHeroi;

	GO

------------------------------------------------------------------------------------

--Crie um stored procedure que aceita o ID
--de uma missão como input e retorna o número
--de herois que já completaram ela.

CREATE PROCEDURE HeroisQueCompletaramAMissao
	@IdMissao INT
AS
	SELECT 
	 COUNT(heroi_id) AS 'Total de Herois que finalizaram a missão:' 
	FROM 
	Heroi_Missao
	WHERE missao_id = @IdMissao 
	AND
	progresso = 1;

	GO

EXEC HeroisQueCompletaramAMissao @IdMissao = 1;

EXEC HeroisQueCompletaramAMissao @IdMissao = 2;

EXEC HeroisQueCompletaramAMissao @IdMissao = 3;

EXEC HeroisQueCompletaramAMissao @IdMissao = 4;

EXEC HeroisQueCompletaramAMissao @IdMissao = 5;

EXEC HeroisQueCompletaramAMissao @IdMissao = 6;

EXEC HeroisQueCompletaramAMissao @IdMissao = 7;

GO

select * from Heroi_Missao ; 
go
------------------------------------------------------------------------------------

--Crie um stored procedure que aceita o ID de um heroi
--como input e eleva o nível dele em 1.

CREATE PROCEDURE ElevarNivelHeroi 
	@IdHeroi INT
AS 
	UPDATE Heroi 
	SET nivel = nivel + 1 
	WHERE id = @IdHeroi;

	GO

SELECT * FROM Heroi WHERE id = 2; 

EXEC ElevarNivelHeroi @IdHeroi = 2;

SELECT * FROM Heroi WHERE id = 2; 

GO

------------------------------------------------------------------------------------