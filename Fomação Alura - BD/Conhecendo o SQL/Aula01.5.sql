-- Atualizando e excluindo dados

-- Alterando os dados - UPDATE

-- Atualiza o campo 'status' para 'Enviado' em todos os registros da tabela 'tabelapedidos'
-- onde o status atual for igual a 'Processando'
UPDATE tabelapedidos 
SET status = 'Enviado' 
WHERE status = 'Processando';

-- Atualiza as informações de contato e o endereço do cliente com ID igual a 2
-- O campo 'informacoes_de_contato' receberá um novo e-mail
-- O campo 'endereço_cliente' será atualizado com um novo endereço
UPDATE tabelaclientes 
SET informacoes_de_contato = 'j.santos@email.com', 
    endereço_cliente = 'Rua dos paralelepipedos, 30 '
WHERE id_cliente = 2;

--Deletando Dados - DELETE

DELETE FROM tabelafornecedores 
WHERE pais_de_origem = 'Turquia';

