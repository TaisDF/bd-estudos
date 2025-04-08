-- Consultando Dados

-- Filtro para selecionar pedidos com total maior ou igual a 200
SELECT * FROM tabelapedidos 
WHERE total_do_pedido >= 200;

-- Filtro para selecionar pedidos com total menor ou igual a 200
SELECT * FROM tabelapedidos 
WHERE total_do_pedido <= 200;

-- Filtro para selecionar pedidos com total diferente de 200
SELECT * FROM tabelapedidos 
WHERE total_do_pedido <> 200;

-- Filtro para selecionar clientes cujo nome seja lexicograficamente maior que 'C'
-- (ex: nomes começando com D, E, F, etc.)
SELECT * FROM tabelaclientes 
WHERE nome_cliente > 'C';

-- Seleciona todos os clientes (sem filtro)
SELECT * FROM tabelaclientes;

-- Filtro para selecionar pedidos feitos após 19 de setembro de 2023
SELECT * FROM tabelapedidos 
WHERE data_do_pedido > '2023-09-19';

-- Filtro para buscar produtos cujo nome seja exatamente 'computador'
-- Obs: para buscar partes do nome, seria necessário usar LIKE com '%' (ex: LIKE '%computador%')
SELECT * FROM produtos 
WHERE nome LIKE 'computador';


-- Filtros Compostos - uso de operadores lógicos

-- Seleciona pedidos com total >= 200 **e** status igual a 'Pendente'
SELECT * FROM tabelapedidos 
WHERE total_do_pedido >= 200 AND status = 'Pendente';

-- Seleciona pedidos com status 'Pendente' **ou** 'Processando'
SELECT * FROM tabelapedidos 
WHERE status = 'Pendente' OR status = 'Processando';

-- Seleciona pedidos cujo status **não** seja 'Pendente'
SELECT * FROM tabelapedidos 
WHERE NOT status = 'Pendente';

-- Seleciona pedidos com data de envio estimada entre 1 de agosto e 1 de setembro de 2023 (inclusive)
SELECT * FROM tabelapedidos 
WHERE data_de_envio_estimada 
BETWEEN '2023-08-01' AND '2023-09-01';


-- Ordenando dados - ORDER BY

-- Seleciona produtos com preço de compra entre 200 e 600, ordenados pelo nome do produto (A-Z)
SELECT * FROM tabelaprodutos 
WHERE preco_de_compra 
BETWEEN 200 AND 600 ORDER BY nome_do_produto;

-- Seleciona produtos com preço de compra entre 200 e 600, ordenados pela data de inclusão (mais antiga para mais recente)
SELECT * FROM tabelaprodutos 
WHERE preco_de_compra 
BETWEEN 200 AND 600 ORDER BY data_de_inclusao;

-- Seleciona produtos com preço de compra entre 200 e 600, ordenados pelo fornecedor em ordem decrescente (Z-A)
SELECT * FROM tabelaprodutos 
WHERE preco_de_compra 
BETWEEN 200 AND 600 ORDER BY fornecedor DESC;

-- Seleciona produtos com preço de compra entre 200 e 600, ordenados pelo fornecedor em ordem crescente (A-Z)
SELECT * FROM tabelaprodutos 
WHERE preco_de_compra 
BETWEEN 200 AND 600 ORDER BY fornecedor ASC;

--Utilizando o ALIAS (apelido)

SELECT informacoes_de_contato AS email_cliente 
FROM clientes;

SELECT P.ID AS IDPedido, C.ID AS IDCliente
FROM Pedidos AS P
JOIN Clientes AS C ON P.ClienteID = C.ID;
