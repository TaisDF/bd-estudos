/*Para cada autor, exiba o total de livros cadastrados e quantos estão disponíveis atualmente. Mostre apenas os 
autores com mais de 1 livro no sistema*/

select a.nome,
count(l.id) as quantidade_livros,
count(case when l.disponibilidade = true then 1 end) as quantidade_disponivel
from Autor as a
join Livro as l
on a.id = l.autor_id
group by a.nome
having quantidade_livros > 1;

/*Liste o nome dos usuários e a quantidade de livros que cada um já pegou emprestado. 
Mostre apenas os usuários que já realizaram pelo menos 2 empréstimos, ordenando do que mais emprestou para o que menos emprestou. */

select u.nome,
count(e.id) as quantidade_emprestimos
from Usuario as u
join Emprestimo as e
on u.id = e.id_usuario
group by u.nome
having quantidade_emprestimos >= 2;

/*Classifique os usuários como "Alta", "Média" ou "Baixa" atividade com base na quantidade de empréstimos:
10 ou mais: Alta
Entre 5 e 9: Média
Abaixo de 5: Baixa*/

select u.nome,
count(e.id) as quantidade_emprestimos,
case 
when count(e.id) >= 10 then 'Alta'
when count(e.id) >= 5 then 'Média'
else 'Baixa'
end as atividade
from Usuario as u
left join Emprestimo as e
on u.id = e.id_usuario
group by u.nome;

/*Mostre quantos usuários se cadastraram em cada mês. */

select  date_format(u.data_cadastro, '%m') as mes_cadastro,
count(*) as total_usuarios
from Usuario u
group by date_format(u.data_cadastro, '%m')
order by mes_cadastro;

/*Mostre os usuários que mais pegaram livros emprestados, 
juntamente com o total de empréstimos por usuário, ordenados do maior para o menor.*/

select u.nome,
count(e.id) as quantidade_emprestimos
from Usuario as u
join Emprestimo as e
on u.id = e.id_usuario
group by u.nome
order by quantidade_emprestimos desc;
