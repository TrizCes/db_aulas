use m02s08;
go

select * from Heroi; 

--erro: forma errada 
SELECT classe, COUNT(id) FROM Heroi; 

--Forma correta com agrupamento:
SELECT classe, COUNT(id) AS 'Numero de herois na classe' 
FROM Heroi 
GROUP BY classe 
ORDER BY COUNT(id) DESC; 

SELECT classe,
COUNT(id) AS 'Numero de herois na classe',
AVG(nivel) AS 'M�dia de nivel na classe'
FROM Heroi 
GROUP BY classe 
ORDER BY COUNT(id) DESC; 

SELECT 
	SUM(recompensa_moedas) AS 'Recompensa total por nivel', 
	nivel_requerido
	FROM Missao
	GROUP BY nivel_requerido
	ORDER BY nivel_requerido ASC;

	SELECT 
	SUM(recompensa_moedas) AS 'Recompensa total por nivel', 
	nivel_requerido
	FROM Missao
	GROUP BY nivel_requerido
	HAVING SUM(recompensa_moedas) > 500
	ORDER BY nivel_requerido ASC;

	SELECT 
	recompensa_moedas, 
	nivel_requerido
	FROM Missao
	WHERE recompensa_moedas < 600
	GROUP BY 
	recompensa_moedas, 
	nivel_requerido
	ORDER BY nivel_requerido ASC;

	--Exercicios 

	--Monte uma query que retorne o nome da classe e o n�vel m�nimo dos her�is dela.

	SELECT classe, MIN(nivel) AS 'N�vel minimo' FROM Heroi
	GROUP BY classe
	ORDER BY [N�vel minimo];

	--Monte uma query que retorne a m�dia de pre�o e o tipo para cada item. 
	--Inclua apenas tipos com no m�nimo 3 itens

	select * from item;

	SELECT tipo AS 'Tipos com mais de 3 itens', AVG(valor) AS 'M�dia pre�o' FROM Item
	GROUP BY tipo
	HAVING COUNT(tipo) > 3;

	--Monte uma query que retorne o n�mero total de moedas por n�vel requerido de miss�es, 
	--mas apenas para miss�es que terminem com a letra o.

	SELECT SUM(recompensa_moedas) AS 'Total de moedas', nivel_requerido FROM Missao
	WHERE nome LIKE'%o'
	GROUP BY nivel_requerido;

	--Monte uma query que retorne o n�mero de miss�es finalizadas no jogo.

	SELECT COUNT(id) FROM Heroi_Missao
	WHERE progresso = 1;

	--Monte uma query que retorne a classe com o maior n�mero de her�is.

	SELECT TOP 1 classe AS 'Classe com maior numero de Herois:' FROM Heroi 
	GROUP BY classe
	ORDER BY classe ASC;

	--Retorno a aula: JOIN 

	--INNER JOIN

	SELECT B.nome AS 'Nome do Jogador', A.nome AS 'Nome do Heroi' 
	FROM Heroi AS A INNER JOIN Jogador AS B 
	ON A.jogador_id = B.id;

	SELECT 
		H.nome AS 'Heroi',
		M.nome AS 'Miss�o'
	FROM Heroi AS H INNER JOIN Heroi_Missao AS HM 
	ON H.id = HM.heroi_id INNER JOIN Missao AS M ON HM.missao_id = M.id;

	SELECT 
		H.nome  AS 'Heroi', 
		I.nome  AS 'Item', 
		I.valor
	FROM Heroi AS H 
	INNER JOIN Heroi_Item AS HI 
	ON H.id = HI.heroi_id 
	INNER JOIN Item AS I 
	ON HI.item_id = I.id
	WHERE I.valor >= 100;

	SELECT 
		H.nome AS 'Heroi',
		COUNT(M.id) AS 'Numero de Miss�es'
	FROM Heroi AS H INNER JOIN Heroi_Missao AS HM 
	ON H.id = HM.heroi_id INNER JOIN Missao AS M ON HM.missao_id = M.id
	GROUP BY H.nome
	ORDER BY [Numero de Miss�es];

	--LEFT JOIN:

	SELECT A.nome AS 'Nome do Jogador', B.nome AS 'Nome do Heroi' 
	FROM Jogador AS A LEFT JOIN Heroi AS B 
	ON A.id = B.jogador_id;

	SELECT 
		H.nome AS 'Heroi',
		M.nome AS 'Miss�o'
	FROM Heroi AS H LEFT JOIN Heroi_Missao AS HM 
	ON H.id = HM.heroi_id LEFT JOIN Missao AS M ON HM.missao_id = M.id;

	SELECT 
		H.nome AS 'Heroi',
		COUNT(M.id) AS 'Numero de Miss�es'
	FROM Heroi AS H LEFT JOIN Heroi_Missao AS HM 
	ON H.id = HM.heroi_id LEFT JOIN Missao AS M ON HM.missao_id = M.id
	GROUP BY H.nome
	ORDER BY [Numero de Miss�es] DESC;

	SELECT 
		H.nome  AS 'Heroi', 
		I.nome  AS 'Item', 
		I.valor
	FROM Heroi AS H 
	LEFT JOIN Heroi_Item AS HI 
	ON H.id = HI.heroi_id 
	LEFT JOIN Item AS I 
	ON HI.item_id = I.id;

	--RIGHT JOIN:

	SELECT 
		H.nome AS 'Heroi',
		COUNT(M.id) AS 'Numero de Miss�es'
	FROM Heroi AS H RIGHT JOIN Heroi_Missao AS HM 
	ON H.id = HM.heroi_id RIGHT JOIN Missao AS M ON HM.missao_id = M.id
	GROUP BY H.nome
	ORDER BY [Numero de Miss�es] DESC;

	SELECT 
		H.nome AS 'Heroi',
		M.nome AS 'Miss�o'
	FROM Heroi AS H RIGHT JOIN Heroi_Missao AS HM 
	ON H.id = HM.heroi_id RIGHT JOIN Missao AS M ON HM.missao_id = M.id;

	SELECT 
		H.nome  AS 'Heroi', 
		I.nome  AS 'Item', 
		I.valor
	FROM Heroi AS H 
	RIGHT JOIN Heroi_Item AS HI 
	ON H.id = HI.heroi_id 
	RIGHT JOIN Item AS I 
	ON HI.item_id = I.id;

	-- WHERE IS NULL:

				--HEROI SEM MISS�O
	SELECT 
		H.nome AS 'Heroi',
		COUNT(M.id) AS 'Numero de Miss�es'
	FROM Heroi AS H LEFT JOIN Heroi_Missao AS HM 
	ON H.id = HM.heroi_id LEFT JOIN Missao AS M ON HM.missao_id = M.id
	WHERE M.id IS NULL
	GROUP BY H.nome; 
	
				--HEROI SEM ITEM :
	SELECT 
		H.nome  AS 'Heroi', 
		I.nome  AS 'Item', 
		I.valor
	FROM Heroi AS H 
	LEFT JOIN Heroi_Item AS HI 
	ON H.id = HI.heroi_id 
	LEFT JOIN Item AS I 
	ON HI.item_id = I.id
	WHERE I.id IS NULL;

	--FULL OUTER JOIN: OBTENDO TODOS OS ITENS 
	--ITENS COM OU SEM RELA��O

	SELECT 
		H.nome  AS 'Heroi', 
		I.nome  AS 'Item', 
		I.valor
	FROM Heroi AS H 
	FULL OUTER JOIN Heroi_Item AS HI 
	ON H.id = HI.heroi_id 
	FULL OUTER JOIN Item AS I 
	ON HI.item_id = I.id;

	-- FULL OUTER JOIN : SELECIONANDO ITENS EM DIFERENTES TABELAS SEM RELA��O :

	SELECT 
		H.nome  AS 'Heroi', 
		I.nome  AS 'Item', 
		I.valor
	FROM Heroi AS H 
	FULL OUTER JOIN Heroi_Item AS HI 
	ON H.id = HI.heroi_id 
	FULL OUTER JOIN Item AS I 
	ON HI.item_id = I.id
	WHERE H.id IS NULL OR I.id IS NULL;
