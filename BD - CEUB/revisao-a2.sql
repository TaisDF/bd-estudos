--  Revisão:

/* 1- Liste o nome de cada projeto. Para cada projeto, conte quantas tarefas existem 
para cada nível de `prioridade` ('Baixa', 'Normal', 'Alta', 'Urgente'). 
O resultado deve mostrar o nome do projeto e colunas separadas para a 
contagem de cada prioridade. Projetos sem tarefas de uma certa prioridade devem mostrar 0.*/

SELECT
    P.nome AS nome_projeto,  -- Seleciona o nome do projeto
    COUNT(CASE WHEN T.prioridade = 'Baixa' THEN 1 ELSE NULL END) AS prioridade_baixa,  -- Conta quantas tarefas com prioridade "Baixa"
    COUNT(CASE WHEN T.prioridade = 'Normal' THEN 1 ELSE NULL END) AS prioridade_normal, -- Conta quantas tarefas com prioridade "Normal"
    COUNT(CASE WHEN T.prioridade = 'Alta' THEN 1 ELSE NULL END) AS prioridade_alta,     -- Conta quantas tarefas com prioridade "Alta"
    COUNT(CASE WHEN T.prioridade = 'Urgente' THEN 1 ELSE NULL END) AS prioridade_urgente -- Conta quantas tarefas com prioridade "Urgente"
FROM
    Projetos AS P  -- A tabela principal é Projetos, com alias P
LEFT JOIN
    Tarefas AS T ON P.id = T.id_projeto  -- Junta com a tabela Tarefas, relacionando pela chave estrangeira do projeto
GROUP BY
    P.nome  -- Agrupa os resultados por nome do projeto
ORDER BY
    P.nome;  -- Ordena os resultados por nome do projeto em ordem alfabética
    
/* 2- Mostre o nome dos responsáveis e a quantidade de tarefas pelas quais eles são 
responsáveis (id_responsavel_tarefa). Liste apenas os responsáveis 
que têm 3 ou mais tarefas atribuídas. Ordene do mais atarefado para o menos atarefado.*/ 

SELECT
    R.nome,  -- Seleciona o nome do responsável
    COUNT(T.id_tarefa) AS quantidade_tarefas  -- Conta quantas tarefas estão atribuídas a esse responsável
FROM
    Responsaveis AS R  -- A tabela principal é Responsaveis, com alias R
LEFT JOIN
    Tarefas AS T ON R.id = T.id_responsavel_tarefa  -- Junta com a tabela Tarefas pela chave de responsável
GROUP BY
    R.nome  -- Agrupa os dados por nome do responsável
HAVING
    COUNT(T.id_tarefa) >= 3  -- Filtra para mostrar apenas responsáveis com 3 ou mais tarefas
ORDER BY
    quantidade_tarefas DESC;  -- Ordena do mais atarefado para o menos atarefado
    
/* 3- Calcule a "duração percebida" média das tarefas (em dias) para projetos, 
agrupados pelo status do projeto ('Pendente', 'Em Andamento', 'Concluído', 'Cancelado'). 
Para este exercício, considere a "duração percebida" de uma tarefa como a diferença em 
dias entre a data_prevista_entrega da tarefa e a data_inicio do projeto ao qual ela pertence. 
Exiba o status do projeto e a respectiva duração percebida média das tarefas. Arredonde a média 
para duas casas decimais. Ignore tarefas ou projetos onde as datas necessárias sejam nulas.*/

SELECT
    p.status AS "Status do Projeto",  -- Exibe o status de cada projeto (Pendente, Em Andamento, etc.)

    -- Calcula a média da "duração percebida" das tarefas para cada projeto:
    -- ou seja, a diferença em dias entre a data prevista de entrega da tarefa e a data de início do projeto
    -- ROUND é usado para arredondar a média para 2 casas decimais
    ROUND(AVG(DATEDIFF(t.data_prevista_entrega, p.data_inicio)), 2) AS "Média de Dias"
FROM
    Projetos p  -- Tabela de projetos (apelidada como 'p')
JOIN
    Tarefas t ON p.id = t.id_projeto  -- Junta com a tabela de tarefas, associando cada tarefa ao seu projeto
WHERE
    t.data_prevista_entrega IS NOT NULL  -- Ignora tarefas sem data prevista de entrega
    AND p.data_inicio IS NOT NULL        -- Ignora projetos sem data de início
GROUP BY
    p.status  -- Agrupa os resultados pelo status do projeto
ORDER BY
    p.status;  -- Ordena os resultados em ordem alfabética do status do projeto


/* 4- Para cada projeto que esteja atualmente com o status 'Em Andamento', liste o nome do projeto. 
Dentro de cada um desses projetos, mostre cada cargo (da tabela Responsaveis) dos responsáveis que possuem 
tarefas atribuídas nesse projeto específico, e o número de tarefas que responsáveis com aquele cargo têm nesse projeto. 
Ordene os resultados pelo nome do projeto e, em seguida, pelo nome do cargo. 
Só inclua cargos que efetivamente tenham tarefas no respectivo projeto.*/
SELECT
    P.nome AS "Nome do Projeto",  -- Nome de cada projeto com status 'Em Andamento'
    R.cargo AS "Cargo do Responsável",  -- Cargo do responsável que possui tarefas no projeto
    COUNT(T.id) AS "Número de Tarefas Atribuídas"  -- Conta quantas tarefas estão atribuídas a esse cargo no projeto
FROM
    Projetos AS P  -- Tabela de projetos (apelidada como P)
JOIN
    Tarefas AS T ON P.id = T.id_projeto  -- Junta com a tabela Tarefas, relacionando cada tarefa ao seu projeto
JOIN
    Responsaveis AS R ON T.id_responsavel = R.id  -- Junta com a tabela Responsáveis, associando quem executa cada tarefa
WHERE
    P.status = 'Em Andamento'  -- Filtra apenas os projetos cujo status é 'Em Andamento'
GROUP BY
    P.nome, R.cargo  -- Agrupa os resultados por projeto e por cargo do responsável
ORDER BY
    P.nome, R.cargo;  -- Ordena os resultados alfabeticamente por nome do projeto e depois por cargo
    
    
/* 5- Gere um ranking com os Top 5 projetos com mais tarefas em atraso.*/
SELECT
    P.nome AS nome_projeto,  -- Nome do projeto
    COUNT(CASE
              -- Verifica se a data prevista de entrega da tarefa é anterior à data atual
              WHEN T.data_prevista_entrega < CURRENT_DATE()
              
              -- E se a tarefa ainda não foi concluída
              AND T.status <> 'Concluído' 
              
              -- Se ambas as condições forem verdadeiras, retorna 1 (conta como tarefa atrasada)
              THEN 1
              
              -- Caso contrário, retorna NULL (não será contado pelo COUNT)
              ELSE NULL
          END) AS tarefas_atrasadas  -- Total de tarefas atrasadas por projeto

FROM
    Projetos AS P  -- Tabela principal: Projetos
LEFT JOIN
    Tarefas AS T ON P.id = T.id_projeto  -- Junta com a tabela Tarefas, associando pelo id do projeto
GROUP BY
    P.nome  -- Agrupa os resultados por projeto
HAVING
    COUNT(CASE
              WHEN T.data_prevista_entrega < CURRENT_DATE() AND T.status <> 'Concluído' THEN 1
              ELSE NULL
          END) > 0  -- Filtra para mostrar apenas projetos com pelo menos uma tarefa atrasada
ORDER BY
    tarefas_atrasadas DESC  -- Ordena do projeto com mais tarefas atrasadas para o que tem menos
LIMIT 5;  -- Limita o resultado aos 5 primeiros projeto

/* 6- Verifique quais as Tarefas são urgentes/altas e não concluídas*/

SELECT titulo
FROM Tarefas
WHERE prioridade IN ('Urgente', 'Alta') AND status <> 'Concluído';


/* 7- Listar projetos com uma ou mais tarefas com status 'Pendente'*/

SELECT
    P.nome,
    COUNT(CASE WHEN T.status = 'Pendente' THEN 1 ELSE NULL) AS tarefas_pendentes
FROM
    Projetos AS P
LEFT JOIN
    Tarefas AS T ON P.id = T.id_projeto
GROUP BY
    P.nome
HAVING
    tarefas_pendentes > 0
ORDER BY
    tarefas_pendentes DESC;

-- Revisão 2

/* 1- Liste o nome de cada responsável e, para cada um, a contagem de tarefas 
O resultado deve mostrar o nome do responsável e a contagem de tarefas concluídas. 
Inclua apenas os responsáveis que concluíram pelo menos uma tarefa. Ordene os resultados por nome do responsável.*/

SELECT R.nome as nome_responsavel
COUNT(CASE WHEN T.status = 'Concluído' THEN 1 ELSE NULL END) as tarefas_concluidas
FROM Responsaveis as R
JOIN Tarefas as T 
on R.id = T.id_responsavel_tarefa
GROUP By R.nome
HAVING tarefas_concluidas > 0
ORDER By R.nome;


/* 2- Identifique e liste os nomes de todos os projetos que não tiveram nenhuma tarefa concluída nos últimos 30 dias a partir da data atual.*/

/* 3- Calcule a média de dias que leva para uma tarefa ser concluída, agrupando pelo nível de prioridade ('Baixa', 'Normal', 'Alta', 'Urgente'). 
Considere a diferença entre data_conclusao e data_inicio_real. Exiba a prioridade e a média de dias, arredondando para duas casas decimais. 
Ignore tarefas onde data_conclusao ou data_inicio_real sejam nulas.*/

/* 4- Para cada cargo da tabela Responsaveis, mostre o nome do responsável com o maior número de tarefas atribuídas em projetos que já foram concluídos. 
Se houver um empate no número de tarefas, liste todos os responsáveis empatados. 
O resultado deve mostrar o cargo, o nome do responsável e o número de tarefas.*/

/* 5- Para cada combinação de status de projeto e o número de responsáveis distintos envolvidos nesse projeto, conte quantos projetos existem. 
O resultado deve mostrar o status do projeto, a contagem de responsáveis distintos e o número de projetos que se encaixam nessa combinação.*/
