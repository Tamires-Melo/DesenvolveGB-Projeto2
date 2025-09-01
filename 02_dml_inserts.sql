-- 02_dml_inserts.sql
-- Popula as tabelas com dados de exemplo

INSERT INTO `desenvolvegb_projeto2.Clientes` (id_cliente, nome_cliente, email, cidade, estado, data_cadastro) VALUES
(1, 'Ana Luiza', 'ana.luiza@example.com', 'Belo Horizonte', 'MG', '2025-01-15'),
(2, 'Tamires Melo', 'tamires.melo@example.com', 'Belo Horizonte', 'MG', '2025-02-10'),
(3, 'Carlos Rocha', 'carlos.rocha@example.com', 'São Paulo', 'SP', '2025-01-20'),
(4, 'Marina Dias', 'marina.dias@example.com', 'Rio de Janeiro', 'RJ', '2025-03-02'),
(5, 'João Pedro', 'joao.pedro@example.com', 'Curitiba', 'PR', '2025-02-24'),
(6, 'Beatriz Nunes', 'beatriz.nunes@example.com', 'Porto Alegre', 'RS', '2025-02-01');

INSERT INTO `desenvolvegb_projeto2.Produtos` (id_produto, nome_produto, categoria, preco, ativo) VALUES
(1, 'Lenço Siena', 'Acessórios', 49.90, TRUE),
(2, 'Lenço Verona', 'Acessórios', 59.90, TRUE),
(3, 'Tule Amélie', 'Tecidos', 39.00, TRUE),
(4, 'Tule Capri', 'Tecidos', 45.00, TRUE),
(5, 'Camiseta Básica', 'Vestuário', 79.90, TRUE),
(6, 'Jaqueta Quebra Vento', 'Vestuário', 299.90, TRUE),
(7, 'Vestido Midi', 'Vestuário', 199.00, TRUE),
(8, 'Saia Plissada', 'Vestuário', 159.00, TRUE);

INSERT INTO `desenvolvegb_projeto2.Vendas`
(id_venda, id_cliente, id_produto, quantidade, valor_unitario, valor_total, data_venda, metodo_pagamento) VALUES
(1,  2, 1, 2, 49.90,  99.80, '2025-03-05', 'Cartão de crédito'),
(2,  1, 2, 1, 59.90,  59.90, '2025-03-06', 'Pix'),
(3,  3, 3, 5, 39.00, 195.00, '2025-03-10', 'Pix'),
(4,  4, 5, 3, 79.90, 239.70, '2025-03-12', 'Boleto'),
(5,  5, 6, 1, 299.90, 299.90, '2025-03-15', 'Cartão de crédito'),
(6,  6, 4, 2, 45.00,  90.00, '2025-03-18', 'Pix'),
(7,  2, 7, 1, 199.00, 199.00, '2025-04-01', 'Cartão de crédito'),
(8,  1, 3, 3, 39.00, 117.00, '2025-04-02', 'Pix'),
(9,  3, 8, 1, 159.00, 159.00, '2025-04-05', 'Boleto'),
(10, 4, 1, 2, 49.90,  99.80, '2025-04-08', 'Pix'),
(11, 5, 5, 4, 79.90, 319.60, '2025-04-09', 'Cartão de crédito'),
(12, 6, 2, 1, 59.90,  59.90, '2025-04-12', 'Pix'),
(13, 2, 3, 6, 39.00, 234.00, '2025-05-03', 'Pix'),
(14, 1, 6, 1, 299.90, 299.90, '2025-05-04', 'Cartão de crédito'),
(15, 3, 5, 2, 79.90, 159.80, '2025-05-10', 'Pix'),
(16, 4, 8, 2, 159.00, 318.00, '2025-05-12', 'Boleto'),
(17, 5, 3, 5, 39.00, 195.00, '2025-05-20', 'Pix'),
(18, 6, 7, 1, 199.00, 199.00, '2025-05-22', 'Cartão de crédito'),
(19, 2, 5, 1, 79.90,  79.90, '2025-06-01', 'Cartão de crédito'),
(20, 1, 8, 2, 159.00, 318.00, '2025-06-02', 'Pix'),
(21, 3, 1, 2, 49.90,  99.80, '2025-06-04', 'Pix'),
(22, 4, 4, 3, 45.00, 135.00, '2025-06-10', 'Boleto'),
(23, 5, 2, 1, 59.90,  59.90, '2025-06-14', 'Pix'),
(24, 6, 6, 1, 299.90, 299.90, '2025-06-18', 'Cartão de crédito'),
(25, 2, 3, 8, 39.00, 312.00, '2025-07-01', 'Pix'),
(26, 1, 7, 1, 199.00, 199.00, '2025-07-03', 'Pix'),
(27, 3, 8, 3, 159.00, 477.00, '2025-07-08', 'Cartão de crédito'),
(28, 4, 5, 4, 79.90, 319.60, '2025-07-11', 'Pix'),
(29, 5, 1, 1, 49.90,  49.90, '2025-07-15', 'Boleto'),
(30, 6, 2, 2, 59.90, 119.80, '2025-07-19', 'Pix');
