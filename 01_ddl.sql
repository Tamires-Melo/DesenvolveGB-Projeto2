-- 01_ddl.sql
-- Crie um dataset no BigQuery chamado desenvolvegb_projeto2 antes de rodar.

CREATE OR REPLACE TABLE `desenvolvegb_projeto2.Clientes` (
  id_cliente INT64,
  nome_cliente STRING,
  email STRING,
  cidade STRING,
  estado STRING,
  data_cadastro DATE
);

CREATE OR REPLACE TABLE `desenvolvegb_projeto2.Produtos` (
  id_produto INT64,
  nome_produto STRING,
  categoria STRING,
  preco NUMERIC,
  ativo BOOL
);

CREATE OR REPLACE TABLE `desenvolvegb_projeto2.Vendas` (
  id_venda INT64,
  id_cliente INT64,
  id_produto INT64,
  quantidade INT64,
  valor_unitario NUMERIC,
  valor_total NUMERIC,
  data_venda DATE,
  metodo_pagamento STRING
);
