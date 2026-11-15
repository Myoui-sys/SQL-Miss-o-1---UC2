USE merenda_exemplo;

-- Missões da Aula 2 – Agrupar e Juntar Tabelas
-- Q1. Liste as hortaliças, da mais barata para a mais cara
SELECT *
FROM produtos
WHERE categoria = 'hortaliça'
ORDER BY preco_kg ASC;

-- Q2. Quais escolas têm entre 200 e 400 alunos?
SELECT nome, qtd_alunos
FROM escolas
WHERE qtd_alunos BETWEEN 200 AND 400;

-- Bloco A – Funções de agregação
-- A1. Quantas escolas há no banco? (resultado: 6)
SELECT COUNT(*)
FROM escolas;

-- A2. Quantos produtores estão ativos? (resultado: 11)
SELECT COUNT(*)
FROM produtores
WHERE ativo <> 'ativo';

-- A3. Quantos alunos somam todas as escolas juntas?  (resultado: 2310)
SELECT SUM(qtd_alunos)
FROM escolas;

-- A4. Qual é o preço médio por kg das hortaliças, com 2 casas decimais? (resultado: 7.33)
SELECT ROUND(AVG(preco_kg), 2) AS preco_medio
FROM produtos
WHERE categoria = 'hortalica';

-- A5. Qual foi o maior e o menor valor (R$) de uma entrega? Mostre os dois na mesma consulta. (resultado: 1440.00 e 36.00)
SELECT MAX(valor_total), MIN(valor_total)
FROM entregas;

-- A6. Quanto as escolas compraram, em R$, em outubro de 2026? (resultado: 2385.00)
SELECT SUM(valor_total) AS compras_outubro
FROM entregas
WHERE data_entrega BETWEEN '2026-10-01' AND '2026-10-31';

-- Bloco G – Agrupando com GROUP BY e HAVING
-- G1. Quantos produtores há em cada município? (8 linhas)
SELECT municipio, COUNT(nome) AS quantidade_produtores
FROM produtores
GROUP BY municipio;

-- G2. Quantos kg foram entregues de cada produto? Agrupe por id_produto. (10 linhas)
SELECT id_produto, SUM(quantidade_kg) AS kg_entregues
FROM entregas
GROUP BY id_produto;

-- G3. Quanto cada escola comprou, em R$? Agrupe por id_escola e ordene do maior para o menor. (6 linhas; a primeira é a escola 3)
SELECT *
FROM escolas
GROUP BY id_escola
ORDER BY gasto_total_merenda DESC;

-- G4. Qual é a média de alunos das escolas de cada rede (municipal e estadual)? (2 linhas)
SELECT rede, AVG(qtd_alunos) AS media_alunos
FROM escolas
GROUP BY rede;

-- G5. Quais produtores (pelo id_produtor) fizeram mais de 3 entregas? Use HAVING. (6 linhas)
SELECT COUNT(id_produtor) AS produtores
FROM entregas
GROUP BY id_produtor
HAVING COUNT(*) > 3;

-- G6. Quais municípios têm exatamente 2 produtores? (4 linhas)
SELECT municipio, COUNT(id_produtor) AS num_produtores 
FROM produtores
GROUP BY municipio
HAVING COUNT(id_produtor) = 2;