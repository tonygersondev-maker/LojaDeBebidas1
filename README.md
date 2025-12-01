# LojaDeBebidas1

Sistema completo de banco de dados para gerenciamento de uma loja de bebidas com suporte a vendas presenciais e delivery.

Sistema desenvolvido para controlar:
Estoque de bebidas
Compras de fornecedores
Vendas (balcão e delivery)
Cadastro de clientes
Gestão de entregadores

Tabela Descrição
BEBIDA Cadastro de produtos (cervejas, refrigerantes, águas, etc)
FORNECEDOR Dados dos fornecedores (Ambev, Coca-Cola, etc)
COMPRA Registro de compras realizadas
ITEM_COMPRA Detalhamento dos produtos comprados
VENDA Registro de vendas (balcão e delivery)
ITEM_VENDA Detalhamento dos produtos vendidos
CLIENTE Cadastro de clientes para delivery
ENTREGADOR Cadastro de entregadores

Relacionamentos
Um FORNECEDOR pode ter várias COMPRAS (1:N)
Uma COMPRA contém vários ITEM_COMPRA (1:N)
Uma BEBIDA pode estar em várias compras e vendas (1:N)
Um CLIENTE pode realizar várias VENDAS (1:N)
Um ENTREGADOR pode fazer várias entregas (1:N)
Uma VENDA contém vários ITEM_VENDA (1:N)
