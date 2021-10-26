-- Cadastrando cardápio
insert into lanchonete.cardapio (`nome`) values ("Eve Burguers");

-- Listando cardápio
select * from lanchonete.cardapio;

-- Cadastrando sanduíches
insert into lanchonete.sanduiche (`nome`, `preco`, `codigo_cardapio`) values ("Burguer Blumenau", 18.0, 1);
insert into lanchonete.sanduiche (`nome`, `preco`, `codigo_cardapio`) values ("Burguer Bacon & Cheddar", 22.0, 1);
insert into lanchonete.sanduiche (`nome`, `preco`, `codigo_cardapio`) values ("Burguer Calabresa & Cheddar", 21.0, 1);
insert into lanchonete.sanduiche (`nome`, `preco`, `codigo_cardapio`) values ("Burguer Frango & Cream Cheese", 22.0, 1);
insert into lanchonete.sanduiche (`nome`, `preco`, `codigo_cardapio`) values ("Burguer Fit", 17.0, 1);

-- Listando sanduíches
select * from lanchonete.sanduiche;

-- Cadastrando clientes
insert into lanchonete.cliente
(`cpf`, `nome`, `telefone`, `endereco_cep`, `endereco_logradouro`, `endereco_numero`, `endereco_complemento`)
values
("487.582.410-60", "Euclides", "(41) 98888-2028", "81.000-200", "Rua Pedro dos Santos", 128, "Casa 2");
insert into lanchonete.cliente
(`cpf`, `nome`, `telefone`, `endereco_cep`, `endereco_logradouro`, `endereco_numero`)
values
("123.456.789-20", "Catarina", "(41) 99825-7845", "81.230-140", "Rua Sonia Braga", 628);

-- Listando clientes
select * from lanchonete.cliente;

-- Cadastrar entregador
insert into lanchonete.entregador (`nome`, `telefone_celular`) values ("Rita", "(41) 99227-4545");
insert into lanchonete.entregador (`nome`, `telefone_celular`) values ("Gabriel", "(42) 98887-0129");

-- Listando entregadores
select * from lanchonete.entregador;

-- Cadastrar pedido
insert into lanchonete.pedido (`status`, `data_emissao`, `codigo_cliente`) values (0, "2021-08-28", 1);

-- Listando pedidos
select * from lanchonete.pedido;

-- Inserindo itens do pedido
insert into lanchonete.itens_pedido (`codigo_pedido`, `codigo_sanduiche`) values (1, 3);
insert into lanchonete.itens_pedido (`codigo_pedido`, `codigo_sanduiche`) values (1, 1);

-- Listando itens do pedido
select * from lanchonete.itens_pedido;

-- Enviando pedido para entrega
insert into lanchonete.entregas (`codigo_entregador`, `codigo_pedido_entrega`) values (1, 1);
update lanchonete.pedido set status = 1 where codigo = 1;

-- Listando entregas
select * from lanchonete.entregas;

-- Concluindo a entrega
update lanchonete.pedido set status = 2 where codigo = 1;

-- Confirmando pedidos entregues
select * from lanchonete.pedido;