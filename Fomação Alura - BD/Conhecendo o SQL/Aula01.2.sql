--Criando Tabelas

CREATE TABLE tabelacliente (
id_cliente INT PRIMARY KEY, --Garante que não haja valores duplicados e nulos
nome_cliente VARCHAR (250),
informações_de_contato VARCHAR (250)
);

--Alterar Tabelas
ALTER TABLE tabelacliente ADD endereco_cliente VARCHAR (250);

--Apagar Tabelas
DROP TABLE tabelacliente;

-- Apagando o banco de dados inteiro  
DROP DATABASE Colégio_São_Paulo;

-- Apagando um esquema específico do banco  
DROP SCHEMA Turno_da_manhã;

/*Uma chave estrangeira (FOREIGN KEY) é uma restrição que cria um vínculo entre duas tabelas, 
garantindo referencialidade dos dados.*/

CREATE TABLE tabelaprodutos (
id_produto INT PRIMARY KEY,
nome_do_produto VARCHAR(250),
descricao TEXT,
categoria INT,
preco_da_compra DECIMAL(10,2),
unidade VACHAR (50),
fornecedor INT,
data_de_inclusao DATE,
FOREIGN KEY (categoria) REFERENCES tabelacategorias (id_categoria),
FOREIGN KEY (fornecedor) REFERENCES tabelafornecedores (id)
);

