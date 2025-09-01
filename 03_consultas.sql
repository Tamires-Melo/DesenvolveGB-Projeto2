-- 03_consultas.sql
-- Substitua desenvolvegb_projeto2 por seu dataset se você tiver usado outro nome.

-- Pergunta 1: Quantos clientes, produtos e vendas existem?
SELECT
  (SELECT COUNT(*) FROM `desenvolvegb_projeto2.Clientes`) AS qt_clientes,
  (SELECT COUNT(*) FROM `desenvolvegb_projeto2.Produtos`) AS qt_produtos,
  (SELECT COUNT(*) FROM `desenvolvegb_projeto2.Vendas`)   AS qt_vendas;

-- Pergunta 2: Listar todos os produtos (nome, categoria, preço) ordenados do mais caro para o mais barato.
SELECT nome_produto, categoria, preco
FROM `desenvolvegb_projeto2.Produtos`
ORDER BY preco DESC;

-- Pergunta 3: Listar todas as vendas, mostrando o nome do cliente, o nome do produto e a data da venda.
SELECT
  C.nome_cliente,
  P.nome_produto,
  V.data_venda
FROM `desenvolvegb_projeto2.Vendas` AS V
JOIN `desenvolvegb_projeto2.Clientes` AS C ON V.id_cliente = C.id_cliente
JOIN `desenvolvegb_projeto2.Produtos` AS P ON V.id_produto = P.id_produto
ORDER BY V.data_venda;

-- Pergunta 4: Faturamento total (soma de todas as vendas).
SELECT ROUND(SUM(valor_total), 2) AS faturamento_total
FROM `desenvolvegb_projeto2.Vendas`;

-- Pergunta 5: Faturamento por mês (AAAA-MM), do maior para o menor.
SELECT
  FORMAT_DATE('%Y-%m', data_venda) AS ano_mes,
  ROUND(SUM(valor_total), 2) AS faturamento
FROM `desenvolvegb_projeto2.Vendas`
GROUP BY ano_mes
ORDER BY faturamento DESC;

-- Pergunta 6: Top 3 produtos por quantidade vendida.
WITH vendas_por_produto AS (
  SELECT id_produto, SUM(quantidade) AS qtd
  FROM `desenvolvegb_projeto2.Vendas`
  GROUP BY id_produto
)
SELECT P.nome_produto, vpp.qtd
FROM vendas_por_produto vpp
JOIN `desenvolvegb_projeto2.Produtos` P USING (id_produto)
ORDER BY vpp.qtd DESC
LIMIT 3;

-- Pergunta 7: Clientes que mais gastaram (top 5).
SELECT
  C.nome_cliente,
  ROUND(SUM(V.valor_total), 2) AS total_gasto
FROM `desenvolvegb_projeto2.Vendas` V
JOIN `desenvolvegb_projeto2.Clientes` C USING (id_cliente)
GROUP BY C.nome_cliente
ORDER BY total_gasto DESC
LIMIT 5;

-- Pergunta 8: Ticket médio por venda.
SELECT ROUND(AVG(valor_total), 2) AS ticket_medio
FROM `desenvolvegb_projeto2.Vendas`;

-- Pergunta 9: Produtos sem nenhuma venda.
SELECT P.id_produto, P.nome_produto
FROM `desenvolvegb_projeto2.Produtos` P
LEFT JOIN `desenvolvegb_projeto2.Vendas` V USING (id_produto)
WHERE V.id_venda IS NULL;

-- Pergunta 10: Percentual de faturamento por método de pagamento.
WITH tot AS (
  SELECT SUM(valor_total) AS total FROM `desenvolvegb_projeto2.Vendas`
)
SELECT
  metodo_pagamento,
  ROUND(SUM(valor_total), 2) AS faturamento,
  ROUND(100 * SUM(valor_total) / (SELECT total FROM tot), 2) AS pct
FROM `desenvolvegb_projeto2.Vendas`
GROUP BY metodo_pagamento
ORDER BY faturamento DESC;

-- Pergunta 11: Receita por estado (baseado no estado do cliente).
SELECT
  C.estado,
  ROUND(SUM(V.valor_total), 2) AS receita
FROM `desenvolvegb_projeto2.Vendas` V
JOIN `desenvolvegb_projeto2.Clientes` C USING (id_cliente)
GROUP BY C.estado
ORDER BY receita DESC;

-- Pergunta 12: A venda mais recente e quem comprou o quê.
SELECT
  V.id_venda,
  C.nome_cliente,
  P.nome_produto,
  V.quantidade,
  V.valor_total,
  V.data_venda
FROM `desenvolvegb_projeto2.Vendas` V
JOIN `desenvolvegb_projeto2.Clientes` C USING (id_cliente)
JOIN `desenvolvegb_projeto2.Produtos` P USING (id_produto)
ORDER BY V.data_venda DESC, V.id_venda DESC
LIMIT 1;

-- Pergunta 13: Média de itens por venda.
SELECT ROUND(AVG(quantidade), 2) AS media_itens_por_venda
FROM `desenvolvegb_projeto2.Vendas`;

-- Pergunta 14 (Validação): há alguma venda em que valor_total != quantidade * valor_unitario?
SELECT *
FROM `desenvolvegb_projeto2.Vendas`
WHERE ROUND(valor_total, 2) != ROUND(quantidade * valor_unitario, 2);
