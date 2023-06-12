SELECT * FROM sakila.actor;

/*-----------FLUXO DE 6 PERIODOS -----------*/

set @ini = 100000;
set @tx = 1.10;
set @pto = 20000;
select @pto / @tx as Fluxo1,
@pto / power(@tx, 2) as Fluxo2,
@pto / power(@tx, 3) as Fluxo3,
@pto / power(@tx, 4) as Fluxo4,
@pto / power(@tx, 5) as Fluxo5,
@pto / power(@tx, 6) as fluxo6,
(@pto/@tx) + @pto/power(@tx, 2) + @pto/power(@tx, 3) + @pto/power(@tx, 4) + @pto/power(@tx, 5) + @pto/power(@tx, 6) AS TOTAL,
(@pto/@tx) + @pto/power(@tx, 2) + @pto/power(@tx, 3) + @pto/power(@tx, 4) + @pto/power(@tx, 5) + @pto/power(@tx, 6) - @ini AS INVESTIMENTO;

/*----- FLUXO DE 5 PERIODOS ------*/

set @ini = 170000;
set @tx = 1.13;
set @pto = 60000;
select @pto / @tx as Fluxo1,
@pto / power(@tx, 2) as Fluxo2,
@pto / power(@tx, 3) as Fluxo3,
@pto / power(@tx, 4) as Fluxo4,
@pto / power(@tx, 5) as Fluxo5,
(@pto/@tx) + @pto/power(@tx, 2) + @pto/power(@tx, 3) + @pto/power(@tx, 4) + @pto/power(@tx, 5) AS TOTAL,
(@pto/@tx) + @pto/power(@tx, 2) + @pto/power(@tx, 3) + @pto/power(@tx, 4) + @pto/power(@tx, 5) - @ini AS INVESTIMENTO;



/*----- UMA INDUSTRIA FLUXO DE 5 PERIODOS ------*/
/* Uma indústria pretende adquirir equipamentos no valor de US$55000,00, 
que deverão proporcionar receitas líquidas a partir de 2005 conforme tabela a seguir
Sabendo-se que o valor de revenda dos equipamentos no ano 2010 é estimado em US$9000,00 e que a taxa de retorno
 esperada é igual a 21% a. a. ,
 pede-se analisar se o investimento planejado é rentável */

set @ini = 55000;
set @tx = 1.21;
set @pto = 17200;
select 
15500 / @tx 			as Fluxo1,
18800 / power(@tx, 2) 	as Fluxo2,
@pto / power(@tx, 3) 	as Fluxo3,
@pto / power(@tx, 4) 	as Fluxo4,
@pto / power(@tx, 5) 	as Fluxo5,
22500 / power(@tx, 5) 	as Fluxo6,
(15500/@tx) + 18800/power(@tx, 2) + @pto/power(@tx, 3) + @pto/power(@tx, 4) + @pto/power(@tx, 5) + 22500/power(@tx, 6) AS TOTAL,
(15500/@tx) + 18800/power(@tx, 2) + @pto/power(@tx, 3) + @pto/power(@tx, 4) + @pto/power(@tx, 5) + 22500/power(@tx, 6) - @ini AS INVESTIMENTO;

SET @MSG = 'TESTE TESTE';

use sakila;

set @transa = 100;
set @mdr = 0.0289;
set @maq = 0.30;
set @ant = 0.0189;
set @parc= 12;
/*nao mexer e ou cadastrar nada nesse codigo*/
set @VlrVenda = @transa - (@transa * @mdr + @maq);
set @parc = @VlrVenda / @parc;

/* antecipacao de parcelas da venda*/

select 
@parc,
Format((@parc /(1 + @ant))		,2) as Um,
format((@parc/power((1+@ant),2)),2) as Dois,
format((@parc/power((1+@ant),3)),2) as tres,
format((@parc/power((1+@ant),4)),2) as qtro,
format((@parc/power((1+@ant),5)),2) as cinco,
format((@parc/power((1+@ant),6)),2) as seis,
format((@parc/power((1+@ant),7)),2) as sete,
format((@parc/power((1+@ant),8)),2) as oito,
format((@parc/power((1+@ant),9)),2) as nove,
format((@parc/power((1+@ant),10)),2) as dez,
format((@parc/power((1+@ant),11)),2) as onze,
format((@parc/power((1+@ant),12)),2) as doze,
format((@parc /(1 + @ant)) +
(@parc/power((1+@ant),2))+
(@parc/power((1+@ant),3))+
(@parc/power((1+@ant),4))+
(@parc/power((1+@ant),5))+
(@parc/power((1+@ant),6))+
(@parc/power((1+@ant),7))+
(@parc/power((1+@ant),8))+
(@parc/power((1+@ant),9))+
(@parc/power((1+@ant),10))+
(@parc/power((1+@ant),11))+
(@parc/power((1+@ant),12)),4) as VlrAntec
;








