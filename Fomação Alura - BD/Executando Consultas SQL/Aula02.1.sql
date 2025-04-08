-- Conhecendo os dados
-- (Este comentário parece ser um título genérico, pode indicar que as consultas a seguir têm o objetivo de explorar os dados da tabela)

-- Limitando Consultas
-- Esta consulta seleciona todos os dados da tabela 'HistoricoEmprego',
-- ordenando os resultados pelo campo 'salario' em ordem decrescente (do maior para o menor),
-- e retorna apenas os 5 primeiros registros.
SELECT * FROM HistoricoEmprego
ORDER BY salario DESC
LIMIT 5;

-- Operadores IS NULL e NOT NULL
-- Esta consulta seleciona todos os registros da tabela 'HistoricoEmprego'
-- onde o campo 'datatermino' está vazio (NULL), ou seja,
-- empregos que ainda estão em andamento ou que não possuem uma data de término registrada.
SELECT * FROM HistoricoEmprego
WHERE datatermino IS NULL;

-- Esta consulta *tenta* selecionar registros onde o campo 'datatermino' **não é nulo**,
-- ou seja, empregos que já terminaram e têm uma data de término registrada.
-- Porém, há um erro de sintaxe aqui.
-- A forma correta de usar o operador é: IS NOT NULL (e não apenas NOT NULL).
-- Correção:
SELECT * FROM HistoricoEmprego
WHERE datatermino IS NOT NULL;
