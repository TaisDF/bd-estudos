--Importando a base de dados

-- Seleciona todas as colunas e registros da tabela de fornecedores
SELECT * FROM tabelafornecedores;

-- Seleciona todos os registros da tabela de fornecedores que têm como país de origem a China
SELECT * FROM tabelafornecedores 
WHERE país_de_origem = 'China';

-- Retorna uma lista distinta (sem repetições) de clientes que fizeram pedidos
SELECT DISTINCT cliente 
FROM tabelapedidos;

-- Retorna os IDs de produtos únicos que aparecem na tabela de vendas
SELECT DISTINCT id_produto 
FROM tabelavendasdesafioaula1;

-- Seleciona o nome e a data de cadastro dos clientes cadastrados até 1º de janeiro de 2020
SELECT nome_do_cliente, data_de_cadastro 
FROM tabelaclientesdesafioaula1 
WHERE data_de_cadastro <= '2020-01-01';

                            
