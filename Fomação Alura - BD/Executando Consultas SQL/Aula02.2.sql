-- Utilizando Operadores

-- Comando LIKE
-- Seleciona todos os registros da tabela 'Treinamento' onde o nome do curso
-- começa com "O poder". O símbolo % representa qualquer sequência de caracteres após isso.
SELECT * FROM Treinamento
WHERE curso LIKE 'O poder%';

-- Seleciona todos os registros onde o nome do curso contém a palavra "realizar" em qualquer parte do texto.
-- O % antes e depois da palavra permite localizar a palavra em qualquer posição da string.
SELECT * FROM Treinamento
WHERE curso LIKE '%realizar%';

-- Operadores Lógicos

-- Seleciona os registros da tabela 'HistoricoEmprego' onde o cargo é 'Professor'
-- E a data de término **não é nula** (ou seja, o emprego já foi encerrado).
-- OBS: Há um erro aqui. O correto é usar `IS NOT NULL`:
SELECT * FROM HistoricoEmprego
WHERE cargo = 'Professor' AND
datatermino IS NOT NULL;

-- Seleciona todos os registros onde o cargo é 'Oftalmologista' **ou** 'Dermatologista'.
-- Usa o operador lógico OR para incluir registros que satisfaçam **qualquer** uma das condições.
SELECT * FROM HistoricoEmprego
WHERE cargo = 'Oftalmologista' OR
cargo = 'Dermatologista';

-- Seleciona todos os registros onde o cargo é **um dos** listados entre parênteses.
-- O operador IN é uma forma mais compacta e elegante de escrever múltiplos ORs.
SELECT * FROM HistoricoEmprego
WHERE cargo IN ('Oftalmologista', 'Dermatologista', 'Professor');

-- Seleciona os registros onde o cargo **não está** entre os valores especificados.
-- NOT IN funciona como o oposto de IN.
SELECT * FROM HistoricoEmprego
WHERE cargo NOT IN ('Oftalmologista', 'Dermatologista', 'Professor');

-- Utilizando diversos operadores

-- Seleciona os registros da tabela 'Treinamento' onde o curso começa com "O direito"
-- **e** a instituição é 'da Rocha'.
SELECT * FROM Treinamento
WHERE (curso LIKE 'O direito%' AND instituicao = 'da Rocha');

-- Seleciona os registros onde:
-- o curso começa com "O direito" **e** a instituição é 'da Rocha'
-- **OU** o curso começa com "O conforto" **e** a instituição é 'das Neves'.
-- O uso de parênteses ajuda a controlar a ordem lógica das condições.
SELECT * FROM Treinamento
WHERE (curso LIKE 'O direito%' AND instituicao = 'da Rocha')
OR (curso LIKE 'O conforto%' AND instituicao = 'das Neves');
