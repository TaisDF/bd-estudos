-- Trabalhando com funções de agregação 

-- Retorna o mês e o maior valor de faturamento bruto da tabela 'faturamento'.
-- OBS: esta consulta pode não funcionar corretamente se não usar GROUP BY,
-- pois o uso de uma coluna (mes) junto com uma função agregada sem agrupamento pode gerar erro ou resultado inesperado.
SELECT mes, MAX(faturamento_bruto) FROM faturamento;

-- Retorna o mês e o menor valor de faturamento bruto.
-- Também pode precisar de GROUP BY mes, dependendo do SGDB usado.
SELECT mes, MIN(faturamento_bruto) FROM faturamento;

-- Soma o número total de novos clientes registrados na tabela 'faturamento'
-- e dá um apelido para o resultado: 'Novos clientes 2023'.
-- OBS: Faltou o ponto e vírgula no final da linha.
SELECT SUM(numero_novos_clientes) AS 'Novos clientes 2023' FROM faturamento;

-- Soma o número de novos clientes **apenas nos meses que contêm '2023'** no nome.
-- Isso pressupõe que a coluna 'mes' tenha o ano no texto (ex: 'Janeiro 2023').
SELECT SUM(numero_novos_clientes) AS 'Novos clientes 2023' FROM faturamento
WHERE mes LIKE '%2023';

-- Calcula a média das despesas registradas na tabela 'faturamento'.
SELECT AVG(despesas) FROM faturamento;

-- Conta quantos registros na tabela 'HistoricoEmprego' possuem data de término preenchida (ou seja, empregos finalizados).
-- OBS: De novo, o correto é usar IS NOT NULL.
SELECT COUNT(*) FROM HistoricoEmprego
WHERE datatermino IS NOT NULL;

-- Cláusula GROUP BY

-- Agrupa os registros da tabela 'Dependentes' pelo valor do campo 'parentesco'.
-- Apenas retorna os diferentes tipos de parentesco (sem contagem).
SELECT parentesco FROM Dependentes
GROUP BY parentesco;

-- Agrupa os registros por 'parentesco' e conta quantos registros existem em cada grupo.
-- Retorna, por exemplo, quantos filhos, esposas(os), etc., estão registrados.
SELECT parentesco, COUNT(*) FROM Dependentes
GROUP BY parentesco;

-- Agrupa os registros da tabela 'Treinamento' por instituição,
-- e conta quantos cursos estão registrados para cada uma.
SELECT instituicao, COUNT(curso)
FROM Treinamento
GROUP BY instituicao;

-- Cláusula HAVING

-- Esta consulta seleciona as instituições da tabela 'Treinamento'
-- e conta quantos cursos existem associados a cada uma.
-- O resultado é agrupado por instituição (GROUP BY instituicao).
-- Em seguida, a cláusula HAVING filtra apenas os grupos (instituições)
-- que têm mais de 2 cursos cadastrados.
-- A cláusula HAVING é usada para aplicar condições **sobre os dados agrupados**,
-- diferentemente do WHERE, que é usado antes da agregação.
SELECT instituicao, COUNT(curso)
FROM Treinamento
GROUP BY instituicao
HAVING COUNT(curso) > 2;


