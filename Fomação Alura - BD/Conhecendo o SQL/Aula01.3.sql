-- Inserindo dados na tabela de clientes
INSERT INTO tabelacliente
(id_cliente, 
nome_cliente, 
informações_de_contato,
endereco_cliente)
VALUES
('1','Ana Silva', 'ana.silva@gmail.com', 'Rua das flores, 1');

-- Exibindo todos os registros da tabela de clientes
SELECT * FROM tabelacliente;

-- Inserindo múltiplos clientes de uma vez na tabela 'tabelacliente'
-- OBS: O id '1' já foi usado acima para 'Ana Silva', o que pode causar erro se a chave primária não permitir duplicação.
INSERT INTO tabelacliente (
    id_cliente, 
    nome_cliente, 
    informações_de_contato,
    endereco_cliente
)
VALUES
    ('1', 'João Santos', 'joao.santos@gmail.com', 'Rua dos pinheiros, 25'), -- possível duplicação de ID
    ('3', 'Maria Fernandes', 'maria.fernandes@email.com', 'Rua Santo Antonio, 10'),
    ('4', 'Carlos Pereira', 'carlos.pereira@email.com', 'Avenida rio, 67'),
    ('5', 'Patrícia Lima', 'patricia.lima@email.com', 'Rua das Flores, 123'),
    ('6', 'Rodrigo Almeida', 'rodrigo.almeida@email.com', 'Avenida Central, 456'),
    ('7', 'André Oliveira', 'andre.oliveira@email.com', 'Travessa do Sol, 789'),
    ('8', 'Isabela Rodrigues', 'isabela.rodrigues@email.com', 'Rua da Paz, 321'),
    ('9', 'Ricardo Sousa', 'ricardo.sousa@email.com', 'Alameda dos Sonhos, 654'),
    ('10', 'Luana Gomes', 'luana.gomes@email.com', 'Praceta das Estrelas, 987'),
    ('11', 'Juliano Costa', 'juliano.costa@email.com', 'Av. Principal, 234'),
    ('12', 'Sandra Ferreira', 'sandra.ferreira@email.com', 'Rua da Liberdade, 567'),
    ('13', 'Roberto Barbosa', 'roberto.barbosa@email.com', 'Rua da Esquina, 432'),
    ('14', 'Alice Santos', 'alice.santos@email.com', 'Largo da Amizade, 765'),
    ('15', 'Gustavo Lima', 'gustavo.lima@email.com', 'Avenida das Árvores, 876'),
    ('16', 'Carla Silva', 'carla.silva@email.com', 'Travessa das Aves, 345'),
    ('17', 'Daniel Oliveira', 'daniel.oliveira@email.com', 'Alameda dos Bosques, 678'),
    ('18', 'Luciana Almeida', 'luciana.almeida@email.com', 'Rua das Colinas, 123'),
    ('19', 'Fernando Pereira', 'fernando.pereira@email.com', 'Avenida das Ondas, 987'),
    ('20', 'Marina Lima', 'marina.lima@email.com', 'Praceta dos Girassóis, 456'),
    ('21', 'Lucas Rodrigues', 'lucas.rodrigues@email.com', 'Rua das Montanhas, 321'),
    ('22', 'Adriana Sousa', 'adriana.sousa@email.com', 'Travessa dos Rios, 654'),
    ('23', 'Eduardo Gomes', 'eduardo.gomes@email.com', 'Avenida das Pedras, 789'),
    ('24', 'Marcia Costa', 'marcia.costa@email.com', 'Largo das Praias, 234'),
    ('25', 'José Silva', 'jose.silva@email.com', 'Av. dos Ventos, 432'),
    ('26', 'Beatriz Alves', 'beatriz.alves@email.com', 'Rua dos Coqueiros, 765'),
    ('27', 'André Santos', 'andre.santos@email.com', 'Avenida dos Lagos, 876'),
    ('28', 'Carolina Lima', 'carolina.lima@email.com', 'Travessa das Neves, 345'),
    ('29', 'Fábio Rodrigues', 'fabio.rodrigues@email.com', 'Alameda dos Campos, 678'),
    ('30', 'Larissa Pereira', 'larissa.pereira@email.com', 'Rua dos Bosques, 123');

-- Inserindo dados na tabela de produtos com diversas informações, incluindo:
-- id do produto, nome, descrição, categoria (assumidamente um id), preço de compra, unidade, fornecedor (assumidamente um id) e data
INSERT INTO tabelaprodutos(
 id_produto, 
 nome_do_produto, 
 descricao, 
 categoria, 
 preco_da_compra, 
 unidade, 
 fornecedor, 
 data_de_inclusao
) 
VALUES
('1', 'Smartphone X', 'Smartphone de última geração', 1, 699.99, 'Unidade', 1, '2023-08-01'),
('2', 'Notebook Pro', 'Notebook poderoso com tela HD', 2, 1199.99, 'Unidade', 2, '2023-08-02'),
('3', 'Tablet Lite', 'Tablet compacto e leve', 3, 299.99, 'Unidade', 3, '2023-08-03'),
('4', 'TV LED 55"', 'TV LED Full HD de 55 polegadas', 4, 599.99, 'Unidade', 4, '2023-08-04'),
('5', 'Câmera DSLR', 'Câmera digital DSLR com lente intercambiável', 5, 699.99, 'Unidade', 5, '2023-08-05'),
('6', 'Impressora Laser', 'Impressora laser de alta qualidade', 6, 349.99, 'Unidade', 6, '2023-08-06'),
('7', 'Mouse Óptico', 'Mouse óptico sem fio', 7, 19.99, 'Unidade', 7, '2023-08-07'),
('8', 'Teclado sem Fio', 'Teclado sem fio ergonômico', 8, 39.99, 'Unidade', 8, '2023-08-08'),
('9', 'Headphones Estéreo', 'Headphones estéreo com cancelamento de ruído', 9, 149.99, 'Unidade', 9, '2023-08-09'),
('10', 'Smartwatch', 'Smartwatch com monitor de frequência cardíaca', 10, 199.99, 'Unidade', 10, '2023-08-10'),
('11', 'Monitor 24"', 'Monitor LED Full HD de 24 polegadas', 11, 149.99, 'Unidade', 11, '2023-08-11'),
('12', 'HD Externo 1TB', 'HD Externo portátil de 1TB', 12, 79.99, 'Unidade', 12, '2023-08-12'),
('13', 'Drone DJI', 'Drone DJI com câmera 4K', 13, 799.99, 'Unidade', 13, '2023-08-13'),
('14', 'Console de Jogos', 'Console de jogos de última geração', 14, 299.99, 'Unidade', 14, '2023-08-14'),
('15', 'Fones de Ouvido Bluetooth', 'Fones de ouvido Bluetooth com estojo de carregamento', 15, 59.99, 'Unidade', 15, '2023-08-15'),
('16', 'Projetor HD', 'Projetor HD de alta definição', 16, 499.99, 'Unidade', 16, '2023-08-16'),
('17', 'Impressora Multifuncional', 'Impressora multifuncional com scanner', 6, 249.99, 'Unidade', 6, '2023-08-17'),
('18', 'Notebook Ultrafino', 'Notebook ultrafino com SSD rápido', 2, 999.99, 'Unidade', 2, '2023-08-18'),
('19', 'Mouse Gamer', 'Mouse gamer com iluminação RGB', 7, 49.99, 'Unidade', 7, '2023-08-19'),
('20', 'Câmera de Ação', 'Câmera de ação à prova d''água', 5, 129.99, 'Unidade', 5, '2023-08-20');

-- Criando tabela para pedidos com valor alto (clientes "gold")
CREATE TABLE tabelapedidosgold (
 ID_pedido_gold INT PRIMARY KEY,
 Data_Do_Pedido_gold DATE,
 Status_gold VARCHAR(50),
 Total_Do_Pedido_gold DECIMAL(10, 2),
 Cliente_gold INT,
 Data_De_Envio_Estimada_gold DATE,
 FOREIGN KEY (cliente_gold) REFERENCES tabelaclientes(id_cliente) -- garantindo integridade referencial com tabela de clientes
);

-- Inserindo na tabela de pedidos "gold" todos os pedidos da tabela original 
-- onde o total do pedido é maior ou igual a 400
INSERT INTO tabelapedidosgold
    (ID_pedido_gold, 
     Data_Do_Pedido_gold, 
     Status_gold, 
     Total_Do_Pedido_gold, 
     Cliente_gold, 
     Data_De_Envio_Estimada_gold)
SELECT
    id,
    data_do_pedido,
    status,
    total_do_pedido,
    cliente,
    data_de_envio_estimada
FROM tabelapedidos
WHERE total_do_pedido >= 400;

-- Exibindo todos os pedidos considerados "gold"
SELECT * FROM tabelapedidosgold;
