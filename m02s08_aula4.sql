--Questões para resolução:

--Escreva uma query que mostra o nome de jogadores que não possuem nenhum herói.
SELECT 
J.nome AS 'Jogador' 
FROM 
Jogador AS J 
FULL OUTER JOIN 
Heroi AS H 
ON J.id = H.jogador_id 
WHERE H.jogador_id IS NULL;

--Escreva uma query que retorna o id do jogador
--e o número de heróis que ele controla.
SELECT 
J.id AS 'id jogador', 
COUNT(H.jogador_id) AS 'Numero de Herois'
FROM 
Jogador AS J 
left JOIN 
Heroi AS H 
ON J.id = H.jogador_id 
GROUP BY J.id;

--Escreva uma query que retorna o nome do herói, 
--o nome dos itens que ele possui, e a quantidade de cada um destes itens.

SELECT 
		H.nome  AS 'Heroi', 
		I.nome  AS 'Item', 
		HI.quantidade
	FROM Heroi AS H 
	INNER JOIN Heroi_Item AS HI 
	ON H.id = HI.heroi_id 
	INNER JOIN Item AS I 
	ON HI.item_id = I.id;

--Escreva uma query que retorna o nome do jogador
--e o número de moedas que ele já recebeu de missões completadas.

SELECT 
J.nome AS 'Jogador',
SUM(M.recompensa_moedas) AS 'Moedas de missões'
FROM 
Jogador AS J 
INNER JOIN 
Heroi AS H 
ON J.id = H.jogador_id
INNER JOIN 
Heroi_Missao AS HM
ON H.id = HM.missao_id
INNER JOIN 
Missao AS M
ON HM.missao_id = M.id
WHERE HM.progresso = 1
GROUP BY J.nome;

--Escreva uma query que retorna, para cada classe do jogo,
--o número total de itens que seus heróis possuem.

SELECT 
	H.classe AS 'Classe do jogo',
	SUM(HI.quantidade) AS 'Itens que o Heroi possue'
FROM 
Heroi AS H 
INNER JOIN 
Heroi_Item AS HI
ON H.id = HI.heroi_id
GROUP BY H.classe;


------------------------------------------------------------------------------------

--AULA!

------------------------------------------------------------------------------------

--UNION: 
--MESMO TIPO DE DADOS UNIDOS EM NOVA TABELA,
--SEM NENHUMA RELAÇÃO ENTRE OS DADOS;

SELECT id, nome FROM Heroi 
UNION 
SELECT id, nome FROM Missao 
UNION 
SELECT id, nome FROM Heroi;

------------------------------------------------------------------------------------

--EXCEPTED: 
--RETORNA A TABELA A ( Heroi ) NOS DADOS QUE NÃO TEM RELAÇÃO COM 
--A TABELA B ( Heroi_Missao )

SELECT id FROM Heroi 
EXCEPT 
SELECT heroi_id FROM Heroi_Missao;

------------------------------------------------------------------------------------

--INTERSECT : INTERSECÇÃO ENTRE AS DUAS TABELAS

SELECT id FROM Heroi 
INTERSECT
SELECT heroi_id FROM Heroi_Missao;

------------------------------------------------------------------------------------
