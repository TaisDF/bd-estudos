use clinica;

SELECT * 
FROM medicos 
WHERE IDADE >= 20 AND IDADE <= 40;

SELECT * 
FROM medicos 
WHERE IDADE between 20 AND 40;

-- Exemplo de in

SELECT *
FROM medicos
WHERE cidade = 'Florianopolis'
OR cidade = 'Joinville';

SELECT * 
FROM medicos
WHERE cidade 
IN ('Florianopolis', 'Joinville');

SELECT * 
FROM medicos
WHERE cidade 
NOT IN ('Florianopolis', 'Joinville');

SELECT CPF, nome
FROM medicos
WHERE nome LIKE '_o%';

SELECT *
FROM medicos AS m, consultas AS c
WHERE m.codm = c.codm;

SELECT *
FROM medicos as m
JOIN consultas as c ON m.codm = c.codm
WHERE especialidade IN ('ortopedia', 'pediatria');

SELECT CPF, nome
FROM medicos
UNION
SELECT CPF, nome
FROM funcionarios;

--Exercícios 1

-- 1) Buscar o nome e o CPF dos médicos com menos de 40 anos ou com especialidade diferente de traumatologia
SELECT CPF, nome
FROM medicos 
WHERE idade <= 40 OR especialidade = 'traumatologia';

-- 2) Buscar todos os dados das consultas marcadas no período da tarde após o dia 19/06/2006
SELECT * 
FROM consulta
WHERE (hora between '12:00' and '18:00') and (data > '2006-06-19');

-- 3) Buscar o nome e a idade dos pacientes que não residem em Florianópolis
SELECT nome, idade
FROM pacientes
WHERE cidade 
NOT IN ('Florianopolis');

-- 4) Buscar a hora das consultas marcadas antes do dia 14/06/2024 e depois do dia 20/12/2024
SELECT hora 
FROM consultas
WHERE (data <= '2024-06-14' or  data >= '2024-12-20');

-- 5) Buscar o nome e a idade (em meses) dos pacientes
SELECT nome, idade*12 
as idade_em_meses
FROM pacientes;

-- 6) Em quais cidades residem os funcionários?
SELECT nome, cidade 
FROM funcionarios;

-- 7) Qual o menor e o maior salário dos funcionários da Florianópolis?
SELECT MAX(salario) AS maior_salario, MIN(salario) AS menor_salario 
FROM funcionarios 
WHERE cidade = 'Florianopolis';

-- 8) Qual o horário da última consulta marcada para o dia 13/06/2024?
SELECT max(hora)
FROM consultas 
where data = '2024-03-28';

-- 9) Qual a média de idade dos médicos e o total de ambulatórios atendidos por eles?
SELECT AVG(idade) AS mediaIdade, 
SUM(ambulatorios) AS totalAmbulatorios 
FROM medicos;

-- 10) Buscar o código, o nome e o salário líquido dos funcionários. O salário líquido é obtido pela diferença entre o salário cadastrado menos 20% deste mesmo salário
SELECT codigo, nome, salario - (salario * 0.2) AS salario_liquido 
FROM funcionarios;

-- 11) Buscar o nome dos funcionários que terminam com a letra “a”
SELECT nome 
FROM funcionarios 
WHERE nome LIKE '%a';

-- 13) Buscar o nome e CPF dos funcionários que não possuam a seqüência “00000” em seus CPFs
SELECT nome, CPF 
FROM funcionarios 
WHERE CPF NOT LIKE '%00000%';

-- 14) Buscar o nome e a especialidade dos médicos cuja segunda e a última letra de seus nomes seja a letra “o”
SELECT nome, especialidade 
FROM medicos
WHERE nome LIKE '%o' OR nome LIKE '_%o';

-- 15) Buscar os códigos e nomes dos pacientes com mais de 25 anos que estão com tendinite, fratura, gripe e sarampo
SELECT codigo, nome 
FROM pacientes 
WHERE idade > 25 
AND doenca IN ('tendinite', 'fratura', 'gripe', 'sarampo');

-- Exercício 2

-- 1) nome e CPF dos médicos que também são pacientes do hospital
SELECT m.nome, m.CPF
FROM medicos m
JOIN pacientes p ON m.CPF = p.CPF;

-- 2) pares (código, nome) de funcionários e de médicos que residem na mesma cidade
SELECT f.codigo AS cod_funcionario, f.nome AS nome_funcionario, 
m.codigo AS cod_medico, m.nome AS nome_medico
FROM funcionarios f
JOIN medicos m ON f.cidade = m.cidade;

-- 3) código e nome dos pacientes com consulta marcada para horários após às 14 horas 
SELECT p.codigo, p.nome
FROM pacientes p
JOIN consultas c ON p.codigo = c.codigo_paciente
WHERE c.horario > '14:00:00';

-- 4) número e andar dos ambulatórios utilizados por médicos ortopedistas
SELECT a.numero, a.andar
FROM ambulatorios a
JOIN consultas c ON a.numero = c.numero_ambulatorio
JOIN medicos m ON c.codigo_medico = m.codigo
WHERE m.especialidade = 'Ortopedia';

-- 5) nome e CPF dos pacientes que têm consultas marcadas entre os dias 14 e 16 de junho de 2006
SELECT p.nome, p.CPF
FROM pacientes p
JOIN consultas c ON p.codigo = c.codigo_paciente
WHERE c.data BETWEEN '2006-06-14' AND '2006-06-16';

-- 6) nome e idade dos médicos que têm consulta com a paciente Ana
SELECT m.nome, m.idade
FROM medicos m
JOIN consultas c ON m.codigo = c.codigo_medico
JOIN pacientes p ON c.codigo_paciente = p.codigo
WHERE p.nome = 'Ana';

-- 7) código e nome dos médicos que atendem no mesmo ambulatório do médico Pedro e que possuem consultas marcadas para dia 14/06/2024
SELECT DISTINCT m2.codigo, m2.nome
FROM medicos m1
JOIN consultas c1 ON m1.codigo = c1.codigo_medico
JOIN consultas c2 ON c1.numero_ambulatorio = c2.numero_ambulatorio
JOIN medicos m2 ON c2.codigo_medico = m2.codigo
WHERE m1.nome = 'Pedro' 
AND c2.data = '2024-06-14'
AND m1.codigo != m2.codigo;

-- 8) nome, CPF e idade dos pacientes que têm consultas marcadas com ortopedistas para dias anteriores ao dia 16
SELECT p.nome, p.CPF, p.idade
FROM pacientes p
JOIN consultas c ON p.codigo = c.codigo_paciente
JOIN medicos m ON c.codigo_medico = m.codigo
WHERE m.especialidade = 'Ortopedia' 
AND c.data < '2024-06-16';

-- 9) nome e salário dos funcionários que moram na mesma cidade do funcionário Carlos e possuem salário superior ao dele
SELECT f2.nome, f2.salario
FROM funcionarios f1
JOIN funcionarios f2 ON f1.cidade = f2.cidade
WHERE f1.nome = 'Carlos' 
AND f2.salario > f1.salario;

-- 10) dados de todos os ambulatórios e, para aqueles ambulatórios onde médicos dão atendimento, exibir também os seus códigos e nomes
SELECT a.numero, a.andar, m.codigo AS codigo_medico, m.nome AS nome_medico
FROM ambulatorios a
LEFT JOIN consultas c ON a.numero = c.numero_ambulatorio
LEFT JOIN medicos m ON c.codigo_medico = m.codigo;

-- 11) CPF e nome de todos os médicos e, para aqueles médicos com consultas marcadas, exibir os CPFs e nomes dos seus pacientes e as datas das consultas
SELECT m.CPF AS CPF_medico, m.nome AS nome_medico, 
p.CPF AS CPF_paciente, p.nome AS nome_paciente, c.data
FROM medicos m
LEFT JOIN consultas c ON m.codigo = c.codigo_medico
LEFT JOIN pacientes p ON c.codigo_paciente = p.codigo;
