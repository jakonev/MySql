/*Clientes que fizeram mais de 5 pedidos nos últimos 3 meses:*/
use fast_shop;
select
cat.nome,
sum(pd.quantidade * pd.preço_unitário) as 'total',
sum(pd.quantidade) as 'qtde'
from pedidos as item
inner join itens_pedido as pd on item.id_pedido = pd.id_pedido
inner join produtos as prod on pd.id_produto = prod.id_produto
inner join categorias as cat on prod.categoria = cat.id_categoria
where item.data_pedido >= (DATE_FORMAT(NOW() - INTERVAL 3 MONTH, '%Y-%m-01') )
group by
cat.nome
having sum(pd.quantidade) >=5;

/*Escreva uma consulta para identificar os clientes que fizeram mais de 5 pedidos nos últimos 3 meses.
Produtos mais vendidos em cada categoria nos últimos 6 meses:*/
select
cli.nome,
cat.nome,
count(item.id_pedido) as 'qtde_categoria',
sum(pd.quantidade * pd.preço_unitário) as 'total',
sum(pd.quantidade) as 'qtde'
from pedidos as item
inner join itens_pedido as pd on item.id_pedido = pd.id_pedido
inner join produtos as prod on pd.id_produto = prod.id_produto
inner join categorias as cat on prod.categoria = cat.id_categoria
inner join clientes as cli on item.id_cliente = cli.id_cliente
where item.data_pedido >= (DATE_FORMAT(NOW() - INTERVAL 6 MONTH, '%Y-%m-01') )
group by
cat.nome
having sum(pd.quantidade) >=5 and count(item.id_pedido)>=5
order by
cli.nome asc;

/*
Escreva uma consulta para determinar os produtos mais vendidos em cada categoria nos últimos 6 meses.
Clientes que nunca fizeram pedidos de uma categoria específica:
*/
select
prod.nome,
count(cat.id_categoria) as 'qtde_categoria'
from clientes as cli
left join pedidos as item on cli.id_cliente = item.id_cliente
left join itens_pedido as pd on item.id_pedido = pd.id_pedido
left join produtos as prod on pd.id_produto = prod.id_produto
left join categorias as cat on prod.categoria = cat.id_categoria
where item.data_pedido >= (DATE_FORMAT(NOW() - INTERVAL 6 MONTH, '%Y-%m-01') )
group by
prod.nome
limit 10
;
/*Clientes que nunca fizeram pedidos de uma categoria específica:*/
select
*
from clientes as cli
left join pedidos as item on cli.id_cliente = item.id_cliente
left join itens_pedido as pd on item.id_pedido = pd.id_pedido
left join produtos as prod on pd.id_produto = prod.id_produto
left join categorias as cat on prod.categoria = cat.id_categoria
where item.id_pedido is null;

/*Escreva uma consulta para calcular o total de pedidos por dia da semana.
Clientes que gastaram mais de R$ 1000 em um único pedido:*/
select
cli.nome,
item.data_pedido as 'Data_Pedido',
DAYOFWEEK(item.data_pedido) as 'dia_da_semana',
count(distinct(item.id_pedido)) as 'Qtde_pedidos',
sum(pd.quantidade * pd.preço_unitário) as 'total'
from clientes as cli
inner join pedidos as item on cli.id_cliente = item.id_cliente
inner join itens_pedido as pd on item.id_pedido = pd.id_pedido
group by
cli.nome,
item.data_pedido
having sum(pd.quantidade * pd.preço_unitário) > 1000
order by 
DAYOFWEEK(item.data_pedido) desc;

/*Escreva uma consulta para identificar os clientes que gastaram mais de R$ 1000 em um único pedido.

*/
select
cli.nome,
sum(pd.quantidade * pd.preço_unitário) as 'total'
from pedidos as item
inner join itens_pedido as pd on item.id_pedido = pd.id_pedido
inner join produtos as prod on pd.id_produto = prod.id_produto
inner join categorias as cat on prod.categoria = cat.id_categoria
inner join clientes as cli on item.id_cliente = cli.id_cliente
where item.data_pedido >= (DATE_FORMAT(NOW() - INTERVAL 12 MONTH, '%Y-%m-01') )
group by
item.id_pedido
having sum(pd.quantidade * pd.preço_unitário) > 1000
order by
cli.nome asc;

/*Total de vendas por cidade nos últimos 12 meses:*/

select
uf.estado,
uf.nome,
sum(pd.quantidade * pd.preço_unitário) as 'Total_UF' 
from clientes as cli
inner join cidades as uf on cli.cidade = uf.estado
inner join pedidos as item on item.id_cliente = cli.id_cliente
inner join itens_pedido as pd on item.id_pedido = pd.id_pedido
inner join produtos as prod on pd.id_produto = prod.id_produto
where item.data_pedido >= (DATE_FORMAT(NOW() - INTERVAL 12 MONTH, '%Y-%m-01'))
group by
uf.nome;

/*
Escreva uma consulta para calcular o total de vendas por cidade nos últimos 12 meses.
Categorias com menos de 10 produtos disponíveis em estoque:
*/
select
uf.estado,
uf.nome,
cat.nome,
sum(pd.quantidade * pd.preço_unitário) as 'Total_UF',
count(cat.nome) as 'Qtde_Categoria'
from clientes as cli
inner join cidades as uf on cli.cidade = uf.estado
inner join pedidos as item on item.id_cliente = cli.id_cliente
inner join itens_pedido as pd on item.id_pedido = pd.id_pedido
inner join produtos as prod on pd.id_produto = prod.id_produto
inner join categorias as cat on prod.categoria = cat.id_categoria
where item.data_pedido >= (DATE_FORMAT(NOW() - INTERVAL 12 MONTH, '%Y-%m-01'))
group by
uf.estado,
uf.nome,
cat.nome
having count(cat.nome) <= 10
;

/*Escreva uma consulta para listar as categorias que têm menos de 10 produtos disponíveis em estoque.
Clientes que compraram produtos de todas as categorias:
*/
select
cat.nome,
sum(pd.quantidade) as 'Qtde_Categoria'
from pedidos as item
inner join itens_pedido as pd on item.id_pedido = pd.id_pedido
inner join produtos as prod on pd.id_produto = prod.id_produto
inner join categorias as cat on prod.categoria = cat.id_categoria
inner join clientes as cli on item.id_cliente = cli.id_cliente
group by
cat.nome
having sum(pd.quantidade) <= 10
;
/*Escreva uma consulta para encontrar os clientes que compraram produtos de todas as categorias disponíveis na loja.
Total de vendas por mês no último ano:*/
select
monthname(item.data_pedido) as 'mes',
cat.nome,
count(cli.id_cliente) as 'Clientes_categoria',
sum(item.total_pedido) as 'Qtde_total'
from pedidos as item
inner join itens_pedido as pd on item.id_pedido = pd.id_pedido
inner join produtos as prod on pd.id_produto = prod.id_produto
inner join categorias as cat on prod.categoria = cat.id_categoria
inner join clientes as cli on item.id_cliente = cli.id_cliente
where item.data_pedido >= (DATE_FORMAT(NOW() - INTERVAL 12 MONTH, '%Y-%m-01') )
group by
cat.nome,
year(item.data_pedido),
monthname(item.data_pedido)
order by monthname(item.data_pedido) asc;

/*Escreva uma consulta para calcular o total de vendas por mês no último ano.
*/
select
year(item.data_pedido),
monthname(item.data_pedido) as 'mes',
sum(pd.quantidade * pd.preço_unitário) as 'total'
from pedidos as item
inner join itens_pedido as pd on item.id_pedido = pd.id_pedido
inner join produtos as prod on pd.id_produto = prod.id_produto
inner join categorias as cat on prod.categoria = cat.id_categoria
inner join clientes as cli on item.id_cliente = cli.id_cliente
where item.data_pedido >= (DATE_FORMAT(NOW() - INTERVAL 12 MONTH, '%Y-%m-01') )
group by
year(item.data_pedido),
monthname(item.data_pedido)
order by year(item.data_pedido) desc;