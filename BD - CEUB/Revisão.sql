--Exercícios de Revisão:
--  Contar o número total de clientes
SELECT COUNT(*) 
as total_clientes 
FROM clientes;

-- Contar o número total de pedidos
SELECT COUNT (*)
AS total_pedidos
FROM pedidos;

--  Calcular o valor total de todos os pedidos
SELECT SUM(p.preco * pe.quantidade) 
AS valor_total_pedidos
FROM pedidos AS pe
JOIN produtos AS p ON pe.produto_id = p.id;

--  Calcular a média de preço dos produtos
SELECT AVG(preco) 
AS media_preco
FROM produtos;

--  Listar todos os clientes e seus pedidos
SELECT c.nome AS cliente, pr.nome AS produto
FROM pedidos AS p
JOIN clientes AS c ON p.cliente_id = c.id
JOIN produtos AS pr ON p.produto_id = pr.id;

--  Listar todos os pedidos e seus produtos, incluindo pedidos sem produtos
SELECT 
    p.id AS pedido_id,
    p.data_pedido,
    p.quantidade,
    pr.nome AS nome_produto
FROM pedidos AS p
LEFT JOIN produtos AS pr ON p.produto_id = pr.id;

--  Listar os produtos mais caros primeiro
SELECT * FROM produtos
ORDER BY preco DESC;

--  Listar os produtos com menor estoque
SELECT * FROM produtos
ORDER BY estoque ASC;

--  Contar quantos pedidos foram feitos por cliente
SELECT c.nome, COUNT(pe.id) AS total_pedidos
FROM clientes AS c
LEFT JOIN pedidos AS pe ON c.id = pe.cliente_id
GROUP BY c.id, c.nome;

--  Contar quantos produtos diferentes foram vendidos
SELECT COUNT(DISTINCT pe.produto_id) 
AS total_produtos_vendidos
FROM pedidos AS pe;

--  Mostrar os clientes que não realizaram pedidos
SELECT c.nome
FROM clientes AS c
LEFT JOIN pedidos AS pe ON c.id = pe.cliente_id
WHERE pe.id IS NULL;

/* - LEFT JOIN → traz todos os clientes, mesmo sem pedidos.
 - WHERE pe.cliente_id IS NULL → filtra apenas os clientes sem correspondência na tabela de 
pedidos, ou seja, nunca compraram nada.*/

--  Mostrar os produtos que nunca foram vendidos
SELECT pr.nome
FROM produtos AS pr
LEFT JOIN pedidos AS pe ON pr.id = pe.produto_id
WHERE pe.id IS NULL;

--  Contar o número de pedidos feitos por dia

SELECT data_pedido, COUNT(*) AS total_pedidos 
FROM pedidos
GROUP BY data_pedido
ORDER BY data_pedido;

/* - data_pedido: agrupa os pedidos por data.
- COUNT(*): conta quantos pedidos foram feitos em cada dia.
- ORDER BY data_pedido: organiza o resultado pela ordem das datas.*/

--  Listar os produtos mais vendidos
SELECT pr.nome, SUM(pe.quantidade) AS total_vendido
FROM produtos AS pr
JOIN pedidos AS pe ON pr.id = pe.produto_id
GROUP BY pr.nome
ORDER BY total_vendido DESC;

--  Encontrar o cliente que mais fez pedidos
SELECT c.nome, SUM(pe.quantidade) AS mais_pedidos
FROM clientes AS c
JOIN pedidos AS pe ON c.id = pe.cliente_id
GROUP BY c.nome
ORDER BY mais_pedidos DESC
LIMIT 1;

--  Listar os pedidos e os clientes que os fizeram, incluindo pedidos sem clientes
SELECT c.nome, pe.id
FROM pedidos as pe 
LEFT JOIN clientes As c ON c.id = pe.cliente_id;

--  Listar os produtos e o total de vendas por produto
SELECT pr.nome, SUM(pe.quantidade) as total_vendas
FROM produtos AS pr
JOIN pedidos AS pe ON pr.id = pe.produto_id
GROUP BY pr.nome;

--  Calcular a média de quantidade de produtos por pedido
SELECT AVG(pe.quantidade) as media_produtos
FROM pedidos AS pe;

--  Listar os pedidos ordenados por data (mais recentes primeiro)
SELECT * 
FROM pedidos
ORDER BY data_pedido DESC;

--  Contar quantos clientes possuem telefone cadastrado
SELECT COUNT(*) AS total_com_telefone
FROM clientes
WHERE telefone IS NOT NULL;

--  Encontrar o cliente que gastou mais dinheiro em pedidos.
SELECT c.nome, SUM(pe.quantidade * pr.preco) as valor
FROM pedidos as pe
JOIN clientes as c on c.id = pe.cliente_id
JOIN produtos as pr on pr.id = pe.produto_id
ORDER BY valor DESC 
LIMIT 1;

-- Listar os 5 produtos mais vendidos.
SELECT pr.nome, SUM(pe.quantidade) AS total_vendido
FROM pedidos AS pe
JOIN produtos AS pr ON pr.id = pe.produto_id
GROUP BY pr.nome
ORDER BY total_vendido DESC
LIMIT 5;

-- Listar os clientes que já fizeram pedidos e o número de pedidos de cada um.
SELECT c.nome, COUNT(pe.id) AS num_pedidos
FROM clientes AS c
JOIN pedidos AS pe ON c.id = pe.cliente_id
GROUP BY c.nome;

-- Encontrar a data com mais pedidos realizados
SELECT data_pedido, COUNT(*) AS num_pedidos
FROM pedidos
GROUP BY data_pedido
ORDER BY num_pedidos DESC
LIMIT 1;

-- Calcular a média de valor gasto por pedido
SELECT AVG(pe.quantidade * pr.preco) AS media_valor_pedido
FROM pedidos AS pe 
JOIN produtos AS pr ON pr.id = pe.produto_id;

