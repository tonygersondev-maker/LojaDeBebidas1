
----Tabela Fornecedor
create table fornecedor(
    id_fornecedor INTEGER PRIMARY KEY AUTOINCREMENT,
    razao_social TEXT NOT NULL,
    nome_fantasia TEXT(100) NOT NULL,
    cnpj TEXT(20),
    telefone TEXT (15),
    endereco TEXT(100),
    bairro TEXT(50),
    cidade TEXT(50)

);

----Tabela Bebida
create table bebida(
    id_bebida INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(50) NOT NULL,
    marca TEXT(25),
    tipo TEXT(25),
    volume_ml TEXT(10),
    preco_venda TEXT(10),
    estoque_atual INTEGER,
    estoque_minimo INTEGER,
    data_cadastro TEXT(10)
);

----Tabela Compra
create table compra(
    id_compra INTEGER PRIMARY KEY AUTOINCREMENT,
    data_compra TEXT(10),
    valor_total TEXT(10),
    status TEXT TEXT(25),
    forma_pagamento TEXT(10),
    data_entrega TEXT(10),
    numero_nota_fiscal TEXT(10),
    id_fornecedor INTEGER,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

----Tabela ITEM_COMPRA
create table item_compra(
    id_item_compra INTEGER PRIMARY KEY AUTOINCREMENT,
    quantidade INTEGER,
    preco_unitario TEXT(10),
    subtotal TEXT(10),
    id_compra INTEGER,
    id_bebida INTEGER,
    FOREIGN KEY (id_compra) REFERENCES venda(id_compra),
    FOREIGN KEY (id_bebida) REFERENCES bebida(id_bebida)
);

----Tabela Cliente
create table cliente(
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT(100) NOT NULL,
    telefone TEXT(10),
    endereco TEXT(100),
    bairro TEXT(50),
    cidade TEXT(50),
    complemento TEXT(100),
    ponto_referencia TEXT(50),
    data_cadastro TEXT(10)
);

----Tabela Entregador
create table entregador(
id_entregador INTEGER PRIMARY KEY AUTOINCREMENT,
nome TEXT(100),
telefone TEXT(15),
placa_veiculo TEXT(10),
status TEXT(50),
data_cadastro TEXT(10)
);

----Tabela Venda
create table venda(
    id_venda INTEGER PRIMARY KEY AUTOINCREMENT,
    data_venda TEXT(10),
    hora_venda TEXT(10),
    valor_produtos TEXT(10),
    taxa_entrega TEXT(10),
    valor_total TEXT(10),
    tipo_venda TEXT(25),
    forma_pagamento TEXT(25),
    status TEXT(50),
    observacoes TEXT(150),
    id_cliente INTEGER,
    id_entregador INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_entregador) REFERENCES entregador(id_entregador)
);
    
----Tabela ITEM_VENDA
create table item_venda(
    id_item_venda INTEGER PRIMARY KEY AUTOINCREMENT,
    quantidade INTEGER,
    preco_unitario TEXT(10),
    subtotal TEXT(10),
    id_venda INTEGER,
    id_bebida INTEGER,
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (id_bebida) REFERENCES bebida(id_bebida)

);


INSERT INTO fornecedor (razao_social, nome_fantasia, cnpj, telefone, endereco, bairro, cidade) 
VALUES
('AMBEV S.A.', 'Ambev', '02.808.708/0001-07', '(85) 2222-1000', 'Rua Dr. Renato Paes de Barros, 1017','Horto', 'Maranguape'),
('COCA-COLA BRASIL LTDA', 'Coca-Cola', '60.409.075/0001-36', '(85) 3847-5000', 'Av. das Nações Unidas, 12995', 'Centro', 'Pacatuba'),
('HEINEKEN BRASIL LTDA', 'Heineken', '33.064.449/0001-72', '(85) 8888-3000', 'Av. Ibirapuera, 2332', 'Ibirapuera', 'São Paulo'),
('DISTRIBUIDORA AGUA BOA', 'Água Boa', '12.345.678/0001-90', '(85) 9999-7890',  'Rua das Fontes, 450', 'Industrial',  'Fortaleza'),
('RED BULL BRASIL LTDA', 'Red Bull', '04.476.525/0001-11', '(85) 4444-4000',  'Av. Paulista, 1337', 'Centro', 'São Paulo');

SELECT * FROM fornecedor;

INSERT INTO bebida (nome, marca, tipo, volume_ml, preco_venda, estoque_atual, estoque_minimo, data_cadastro) 
VALUES
('Skol Lata', 'Skol', 'Cerveja', 350,  3.50, 240, 100, '05/10/2025'),
('Brahma Lata', 'Brahma', 'Cerveja', 350, 3.50, 180, 100, '08/10/2025'),
('Coca-Cola 2L', 'Coca-Cola', 'Refrigerante', 2000, 8.00, 150, 50, '22/10/2025'),
('Coca-Cola Lata', 'Coca-Cola', 'Refrigerante', 350, 4.00, 200, 80, '31/10/2025'),
('Água Mineral Crystal 500ml', 'Crystal', 'Água', 500, 2.00, 300, 100, '10/11/2025');

select * from bebida;

INSERT INTO cliente (nome, telefone, endereco, bairro, cidade, complemento, ponto_referencia) 
VALUES
('Juliana Fernandes', '(85) 95555-4444', 'Rua Barão de Studart, 555', 'Aldeota', 'Fortaleza', 'Apto 1005', 'Esquina com Av. Dom Luís'),
('Roberto Alves Pereira', '(85) 94444-3333', 'Rua Nogueira Acioly, 234', 'Joaquim Távora', 'Fortaleza', 'Casa 2', 'Perto do Ideal Clube'),
('Fernanda Martins', '(85) 93333-2222','Av. Beira Mar, 1500', 'Meireles', 'Fortaleza','Cobertura', 'Vista para o mar');
    
select * from cliente;

INSERT INTO venda ( data_venda, hora_venda, valor_produtos, taxa_entrega, valor_total, tipo_venda, status, forma_pagamento, observacoes, id_cliente, id_entregador) 
VALUES
('03/11/2025', '18:30:00', 95.00, 5.00, 100.00, 'Delivery', 'Entregue', 'Dinheiro', 'Nenhuma', 1, 1),
('14/11/2025', '19:45:00', 68.00, 5.00, 73.00, 'Delivery', 'Entregue', 'PIX', 'Chamar no portao', 2, 2),
('17/12/2025', '20:15:00', 142.50, 7.00, 149.50, 'Delivery', 'Entregue', 'Cartão Crédito', 'Portaria', 3, 1),
('24/12/2025', '21:00:00', 55.00, 5.00, 60.00, 'Delivery', 'Entregue', 'Dinheiro', 'Buzinar', 1, 3);

SELECT * FROM venda;

INSERT INTO compra(data_compra, valor_total, status, forma_pagamento, data_entrega, numero_nota_fiscal, id_fornecedor)
values
('10/11/2011','R$ 1000,00','ENTREGUE','A VISTA','20/11/2011','35','2'),
('25/11/2011','R$ 5000,00','PENDENTE','30 DIAS','','47','1'),
('30/112011','3500','ENTREGUE','15 DIAS','05/12/2011','57','3');

select * from compra;

INSERT INTO entregador(nome, telefone, placa_veiculo, status, data_cadastro)
VALUES 
('TONY', '859999', 'PMF8001', 'ENTREGUE', '20/11/2011'),
('GERSON', '999999', 'PWG5741', 'ENTREGUE', '20/11/2011'),
('ALVES', '888888', 'QWE7894', 'ENTREGUE', '20/11/2011');

select * from entregador;

INSERT INTO item_compra ( quantidade, preco_unitario, subtotal, id_bebida, id_compra) 
VALUES
(300, 2.50, 750.00, 1, 2),
(240, 2.50, 600.00, 2, 3),
(200, 2.50, 500.00, 3 , 1);

select * from item_compra;

INSERT INTO item_venda (quantidade, preco_unitario, subtotal, id_venda, id_bebida) 
VALUES
(12, 3.50, 42.00, 1, 1),    
(2, 8.00, 16.00, 1, 3),     
(6, 5.50, 33.00, 1, 2),     
(2, 2.00, 4.00, 1, 1 );

select * from item_compra;
