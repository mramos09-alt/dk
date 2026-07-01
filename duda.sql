USE livraria_db;

-- =====================================================================
-- CONSULTAS BÁSICAS
-- =====================================================================

-- Questão 1: Imagine que você acabou de entrar na biblioteca e quer ver a lista completa de livros cadastrados, com todas as informações possíveis.
select * from LIVRO;
-- Questão 2: A lista anterior ficou muito grande. Vamos selecionar apenas a coluna que mostra os títulos dos livros.
select titulo from LIVRO;
-- Questão 3: Para fazer um cartaz para a parede da biblioteca, precisamos apenas do título do livro e de quem o escreveu.
select titulo, autor from LIVRO;
-- Questão 4: O setor financeiro pediu uma lista contendo o título do livro e o seu respectivo preço.
select titulo, preço from LIVRO;
-- Questão 5: A escola quer mandar um aviso para todos os clientes do banco de dados. Recupere apenas a lista de e-mails deles.
select email from CLIENTE;
-- Questão 6: Vamos listar o nome de todos os alunos/clientes humanos (Pessoa Física) que se cadastraram.
select nome from PESSOA_FISICA;


-- =====================================================================
-- APRENDENDO A FILTRAR COM O WHERE
-- =====================================================================

-- Questão 7: Um aluno chegou na biblioteca e disse: "Quero ver apenas os livros do autor Robert C. Martin". Como fazemos?
select * from LIVRO
WHERE autor = 'ROBERT C. MARTIN';
-- Questão 8: Descubra todas as informações do livro que se chama exatamente 'Código Limpo'.
select * from LIVRO 
where titulo = 'Código limpo';
-- Questão 9: O sistema precisa checar os dados do cliente dono do CPF '111.222.333-44'.
select * from  PESSOA_FISICA 
where cpf = '111.222.333-44';
-- Questão 10: Mostre os dados cadastrais da editora chamada 'Novatec'.
select * from EDITORA
where nome = 'novatec';

-- =====================================================

-- =====================================================================
-- FILTROS DE COMPARAÇÃO (NÚMEROS E VALORES)
-- =====================================================================

-- Questão 11: Um aluno está com o dinheiro contado. Mostre os livros que custam menos de R$ 50,00.
select titulo, preco from livro 
where preco < 50.00;

-- Questão 12: O gerente quer saber quais livros da livraria são considerados "premium" (custam mais de R$ 90,00).
select titulo , preco from livro 
where preco > 90.00;
-- Questão 13: Ache os livros que têm o preço na etiqueta de exatamente R$ 35,00.
select titulo, preco from livro
where preco = 35.00;
-- Questão 14: Mostre os títulos dos livros que foram publicados do ano 2015 em diante (maior ou igual a 2015).
select titulo, ano_publicação from LIVRO 
where ano_publicação >= 2015;

-- =====================================================================
-- PARTE 4: ORGANIZANDO A BAGUNÇA COM O ORDER BY
-- =====================================================================

-- Questão 15: Fica muito mais fácil achar um livro se a lista estiver em ordem alfabética (A-Z). Vamos ordenar pelos títulos.
select titulo,autor from LIVRO 
order by titulo asc;
-- Questão 16: Mostre os livros ordenados pelo preço, começando do menor valor para o maior.
select titulo, preco from LIVRO
order by preco asc;
-- Questão 17: Agora faça o inverso: mostre a lista de livros começando pelo mais caro (Ordem Decrescente).
select titulo , preco from livro
order by preco desc;
-- Questão 18: Liste o nome de todas as pessoas físicas de forma organizada de A a Z.
select nome from PESSOA_FISICA
order by nome asc;


-- =====================================================================
-- FILTROS INTELIGENTES COM TEXTO (LIKE)
-- =====================================================================

-- Questão 19: O aluno não lembra o nome do livro, mas sabe que a primeira palavra do título é "Código".

-- Questão 20: Busque livros cujo título termine com a palavra "Limpa".

-- Questão 21: O aluno quer qualquer livro que tenha "SQL" no meio do título, não importa se está no começo, meio ou fim.



-- =====================================================================
-- JUNTANDO DUAS CONDIÇÕES (AND E OR)
-- =====================================================================

-- Questão 22: Quero um livro do autor 'Robert C. Martin' QUE TAMBÉM custe menos de R$ 90,00. As duas coisas precisam ser verdades.

-- Questão 23: O aluno aceita livros feitos pelo 'Robert C. Martin' OU feitos pelo 'Joe Celko'. Se for de qualquer um dos dois, serve.

-- =====================================================================
-- CONTANDO E SOMANDO COISAS (FUNÇÕES DE AGREGAÇÃO)
-- =====================================================================

-- Questão 24: O diretor quer saber o total de títulos de livros que a nossa livraria possui no sistema.

-- Questão 25: Conte quantos clientes do tipo "Pessoa Física" estão registrados.

-- Questão 26: Descubra qual é o maior preço cobrado por um livro na nossa tabela usando a função MAX.

-- Questão 27: Descubra o menor preço de livro na nossa tabela usando a função MIN.

-- =====================================================================
-- JUNTAR TABELAS (INNER JOIN)
-- =====================================================================

-- Questão 28: Queremos ver o título do livro e a sua localização na prateleira. O título está na tabela LIVRO e a localização na tabela ESTOQUE. Vamos juntar as duas usando o id_livro.


-- Questão 29: Além do título, queremos ver a quantidade que sobrou desse livro no estoque.


-- Questão 30: Para terminar nossa jornada, vamos descobrir o nome da editora de cada livro. O título está na tabela LIVRO e o nome da editora está na tabela EDITORA. Eles se ligam pelo id_editora.