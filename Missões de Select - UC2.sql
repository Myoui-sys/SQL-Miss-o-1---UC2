USE merenda_exemplo;
 
-- NÍVEL 1
-- M1. Mostre todas as colunas de todos os produtores. (12 linhas)
SELECT id_produtor, nome, tipo, municipio, telefone,
liderado_por_mulher, ativo, data_cadastro
FROM produtores;

-- M2. Mostre só o nome e o município das escolas. (6 linhas)
SELECT nome, municipio
FROM escolas;

-- M3. Mostre o nome e o preço por kg de todos os produtos. (10 linhas)
SELECT nome, preco_kg
FROM produtos;

-- M4. Mostre a lista de municípios dos produtores, sem repetir nenhum. Dica: SELECT DISTINCT .
SELECT distinct municipio
FROM produtores;

-- NÍVEL 2
-- M5. Quais produtores são de Gravatá?
SELECT nome, municipio
FROM produtores
WHERE municipio = 'Gravatá';

-- M6. Quais escolas são da rede estadual? Mostre o nome e a quantidade de alunos.
SELECT nome, qtd_alunos
FROM escolas
WHERE rede = 'estadual';

-- M7. Quais produtos custam mais de R$ 8,00 o kg?
SELECT nome, preco_kg
FROM produtos
WHERE preco_kg > 8;

-- M8. Qual produtor está inativo?
SELECT nome, ativo
FROM produtores
WHERE ativo = 'inativo';

-- NÍVEL 3
-- M9. Quais produtores são do tipo individual e são mulheres (coluna liderado_por_mulher )? Mostre o nome e o município. 
SELECT nome, municipio, tipo, liderado_por_mulher
FROM produtores
WHERE tipo = 'individual' AND liderado_por_mulher;

-- M10. Quais produtos são da categoria fruta ou derivado?
SELECT nome, categoria
FROM produtos
WHERE categoria = 'fruta' OR categoria = 'derivado';

-- M11. Quais entregas tiveram 100 kg ou mais? Mostre o número da entrega e a quantidade.
SELECT id_entrega, quantidade_kg
FROM entregas
WHERE quantidade_kg >= 100;

-- M12. Quais produtores têm um nome que começa com "Cooperativa"?
SELECT nome
FROM produtores
WHERE nome LIKE 'Cooperativa%';

-- NÍVEL 4
-- M13. Quais produtores são de Bezerros ou de Chã Grande? Use IN.
SELECT nome, municipio
FROM produtores
WHERE municipio IN ('Bezerros', 'Chã Grande');

-- M14. Quais entregas aconteceram em setembro de 2026? Use BETWEEN . Mostre o número, a data e o valor.
SELECT id_entrega, data_entrega, valor_total
FROM entregas
WHERE data_entrega BETWEEN '2026-09-01' AND '2026-09-30';

-- M15. Quais produtores não têm telefone cadastrado?
SELECT nome, telefone
FROM produtores
WHERE telefone IS NULL;

-- M16. Liste os produtos do mais caro para o mais barato.
SELECT nome, preco_kg
FROM produtos
ORDER BY preco_kg DESC;

-- NÍVEL 5
-- M17. Quais são as 3 escolas com mais alunos? 
SELECT nome, qtd_alunos
FROM escolas
ORDER BY qtd_alunos DESC
LIMIT 3;

-- M18. Liste o nome e o município dos produtores, em ordem de município e, dentro de cada município, por nome. 
SELECT nome, municipio
FROM produtores 
ORDER BY municipio ASC, nome ASC;

-- M19. Mostre todas as entregas da escola de código 1, da mais antiga para a mais recente: número, data, quantidade e valor. 
SELECT id_escola, id_entrega, data_entrega, valor_total
FROM entregas
WHERE id_escola = 1
ORDER BY data_entrega ASC;

-- M20. Qual foi a entrega de maior valor em outubro de 2026? 
SELECT id_entrega, valor_total, data_entrega
FROM entregas
WHERE data_entrega BETWEEN '2026-10-01' AND '2026-10-31'
ORDER BY valor_total DESC
LIMIT 1;

-- DESAFIOS EXTRAS
-- D1. Mostre o nome, o preço atual e o preço com reajuste de 10% de cada produto, dando o nome preco_reajustado à nova coluna. Dica: preco_kg * 1.10 AS preco_reajustado
SELECT nome, preco_kg , preco_kg * 1.10 AS preco_reajustado
FROM produtos;

-- D2. Quais produtos têm "macaxeira" em qualquer parte do nome? 
SELECT nome
FROM produtos
WHERE nome LIKE '%Macaxeira%';

-- D3. Quais entregas de setembro de 2026 passaram de R$ 1.000,00? Ordene do maior para o menor valor.
SELECT id_entrega, data_entrega, valor_total
FROM entregas
WHERE valor_total > 1000 AND data_entrega BETWEEN '2026-09-01' AND '2026-09-30'
ORDER BY valor_total DESC;

-- D4. Quais grupos (produtores que não são do tipo individual) são liderados por mulheres?
SELECT nome, tipo, liderado_por_mulher
FROM produtores
WHERE tipo <> 'individual' AND liderado_por_mulher = 1;

-- Curiosidade para testar
SELECT nome, municipio FROM produtores WHERE municipio = 'gravata'; 
-- Acontece porque é padrão do MySQL retornar como Case Insesitive, ele está configurado para ignorar maísculas e minúsculas, assim como acentos.