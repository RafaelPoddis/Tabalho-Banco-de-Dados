create database trabalhobd;
use trabalhobd;

create table categoria (id int, nome varchar(30), descricao varchar(30), primary key (id));

create table estoque (id int, capacidade float, dataAtualizacao date, primary key (id));

create table produto (id int, nome varchar(30), descricao varchar(50), preco float, quantidade int, idCategoria int, idEstoque int, primary key (id),
foreign key (idCategoria) references categoria (id),
foreign key (idEstoque) references estoque (id));

create table promocao (id int not null auto_increment, dataInicio date, dataFim date, primary key (id));

create table promoProduto (idPromocao int, idProduto int, primary key (idPromocao, idProduto),
foreign key (idPromocao) references promocao (id),
foreign key (idProduto) references produto (id));

create table funcionario (id int not null auto_increment, nome varchar(30), dataContrato date, salario float, cargo varchar(30), idFilial int, primary key (id),
foreign key (idFilial) references filial (id));

create table filial (id int not null auto_increment, nome varchar(30), endereco varchar(50), primary key (id));

create table produtoFunc (idProduto int, idFuncionario int, primary key(idProduto, IdFuncionario),
foreign key (idProduto) references produto (id),
foreign key (idFuncionario) references funcionario (id));

create table pedido (id int not null auto_increment, dataPedido date, status varchar(30), primary key (id));

create table fornecedor (id int not null auto_increment, nome varchar(30), endereco  varchar(30), telefone varchar(20), primary key (id));

create table produtoFornecedor (idProduto int, idFornecedor int, idPedido int, primary key (idProduto, idFornecedor, idPedido),
foreign key (idProduto) references produto (id),
foreign key (idFornecedor) references fornecedor (id),
foreign key (idPedido) references pedido (id));

create table venda (id int not null auto_increment, dataVenda date, valorTotal float, primary key (id));

create table vendaProduto (idProduto int, idVenda int, primary key(idProduto, idVenda),
foreign key (idProduto) references produto (id),
foreign key (idVenda) references venda (id));

create table formaPagamento (id int not null auto_increment, descricao varchar(30), primary key (id));

create table cliente (cpf varchar(20) not null, nome varchar(30), endereco varchar(30), telefone varchar(20), email varchar(35), primary key(cpf));

create table clienteVenda (cpf varchar(20), idVenda int, idPagamento int, primary key (cpf, idVenda, idPagamento),
foreign key (cpf) references cliente (cpf),
foreign key (idVenda) references venda (id),
foreign key (idPagamento) references formaPagamento(id));

insert into categoria values (1, 'Eletronics', 'Electronic device and gadget'), (2, 'Books', 'A collection of literary works'), (3, 'Clothing', 'An variety of apparel'), (4, 'Beauty', 'Skincare and makeup products'), (5, 'Toys', 'Toys and games for all ages'), (6, 'Home & Kitchen', 'Household items'), (7, 'Sports', 'Sports equipments'), (8, 'Jewelry', 'Fashion accessories'), (9, 'Health & Wellness', 'Wellness products'), (10, 'Art & Crafts', 'Art supplies');

insert into estoque values (1, 1000, '2022-10-01'), (2, 500, '2022-10-05'), (3, 750, '2022-09-30'), (4, 2000, '2022-10-02'), (5, 1500, '2022-10-04'), (6, 1200, '2022-10-10'), (7, 800, '2022-10-12'), (8, 1600, '2022-10-08'), (9, 300, '2022-10-15'), (10, 2000, '2022-10-05');

insert into produto values (1, 'Smartphone', 'Latest model with great features', 799.99, 100, 1, 1), (2, 'T-shirt', 'Cotton t-shirt for everyday wear', 19.99, 300, 3, 2), (3, 'Laptop', 'High-performance laptop for professionals', 1299.99, 50, 1, 4), (4, 'Perfume', 'Fragrance for men and women', 49.99, 200, 4, 5), (5, "Children's Book", 'Adventure book for kids', 9.99, 150, 2, 3), (6, 'Coffee Maker', 'Automatic coffee maker for home', 49.99, 75, 1, 8), (7, 'Sneakers', 'Running shoes for men and women', 79.99, 200, 7, 9), (8, 'Diamond Necklace', 'Elegant diamond necklace', 999.99, 20, 8, 6), (9, 'Oil Paint Set', 'Professional oil paint set', 39.99, 50, 10, 10), (10, 'Yoga Mat', 'Premium quality yoga mat', 29.99, 100, 9, 7);

insert into promocao values (1, '2022-10-01', '2022-10-15'), (2, '2022-09-20', '2022-10-05'), (3, '2022-10-10', '2022-10-25'), (4, '2022-09-15', '2022-09-30'), (5, '2022-10-05', '2022-10-20'), (6, '2022-10-12', '2022-10-27'), (7, '2022-10-05', '2022-10-20'), (8, '2022-10-15', '2022-10-30'), (9, '2022-10-01', '2022-10-16'), (10, '2022-10-20', '2022-11-04');

insert into promoProduto values (1, 1), (1, 2), (2, 3), (2, 4), (3, 5), (4, 6), (5, 7), (6, 8), (7, 9), (8, 10);

insert into filial values (1, 'Main Street Store', '123 Main St, City, Country'), (2, 'Downtown Store', '456 Center Ave, City, Country'), (3, 'Westside Store', '789 West Blvd, City, Country'), (4, 'East End Store', '101 East Rd, City, Country'), (5, 'Northside Store', '202 North Ave, City, Country'), (6, 'Southside Store', '303 South Ave, City, Country'), (7, 'Uptown Store', '505 High St, City, Country'), (8, 'Midtown Store', '707 Center Rd, City, Country'), (9, 'West End Store', '909 West Ave, City, Country'), (10, 'Eastside Store', '111 East Blvd, City, Country');

insert into funcionario values (1, 'John Doe', '2021-05-15', 2500, 'Sales Associate', 1), (2, 'Jane Smith', '2021-02-20', 2800, 'Store Manager', 2), (3, 'Michael Johnson', '2021-08-10', 2200, 'Warehouse Supervisor', 3), (4, 'Emily Brown', '2021-11-30', 2700, 'Cashier', 1), (5, 'Chris Lee', '2021-06-25', 2600, 'Visual Merchandiser', 2), (6, 'Sarah Brown', '2021-04-20', 2600, 'Marketing Specialist', 4), (7, 'Andrew Wilson', '2021-03-15', 2900, 'Accountant', 5), (8, 'Olivia Garcia', '2021-09-10', 2300, 'HR Manager', 3), (9, 'Daniel Lee', '2021-12-30', 2800, 'IT Specialist', 2), (10, 'Sophia Martinez', '2021-07-25', 2700, 'Customer Service Rep', 1);

insert into produtoFunc values (1, 3), (2, 5), (3, 4), (4, 1), (5, 10), (6, 7), (7, 2), (8, 8), (9, 9), (10, 6);

insert into pedido values (1, '2022-10-01', 'In Process'), (2, '2022-09-25', 'Shipped'), (3, '2022-10-05', 'Delivered'), (4, '2022-09-15', 'Pending'), (5, '2022-10-10', 'In Process'), (6, '2022-10-15', 'In Process'), (7, '2022-10-10', 'Shipped'), (8, '2022-10-20', 'Delivered'), (9, '2022-10-05', 'Pending'), (10, '2022-10-25', 'In Process');

insert into fornecedor values (1, 'ABC Electronics', 'Supplier St', '1234-5678'), (2, 'XYZ Clothing', 'Fashion Ave', '1111-2222'), (3, 'Fresh Beauty', 'Beauty Blvd', '5555-5555'), (4, 'Kids Toys Co.', 'Playtime Rd', '9999-7777'), (5, 'Book Haven', 'Reading St', '4433-2211'), (6, 'Tech Gadgets Inc.', 'Tech Way', '1010-1010'), (7, 'Fashion Trends Co.', 'Fashion Plaza', '2020-2020'), (8, 'Beauty Essentials Ltd.', 'Beauty Park', '9999-9999'), (9, 'Sports Gear Supplies', 'Sports Blvd', '8888-7777'), (10, 'Artistic Creations', 'Art St', '3030-3030');

insert into produtofornecedor values (6, 6, 1), (1, 1, 2), (2, 2, 10), (9, 10, 9), (10, 9, 5), (5, 5, 3), (8, 7, 8), (4, 8, 6), (7, 2, 7), (3, 1, 4);

insert into venda values (1, '2022-10-02', 1500), (2, '2022-09-28', 3000), (3, '2022-10-07', 500), (4, '2022-09-20', 1000), (5, '2022-10-12', 200), (6, '2022-10-17', 800), (7, '2022-10-11', 1200), (8, '2022-10-22', 300), (9, '2022-10-08', 600), (10, '2022-10-27', 400);

insert into vendaproduto values (1, 5), (2, 6), (3, 9), (4, 10), (5, 1), (6, 3), (7, 7), (8,4), (9, 2), (10, 8);

insert into formapagamento values (1, 'Credit Card'), (2, 'Cash'), (3, 'Debit Card'), (4, 'PayPal'), (5, 'Mobile Payment'), (6, 'Gift Card'), (7, 'Bank Transfer'), (8, 'Cryptocurrency'), (9, 'Installment Plan'), (10, 'Venmo');

insert into cliente values ('555.123.789-00', 'Liam Brown', '789 Pine St, City, Country', '5555-3333', 'liam@email.com'), ('321.987.654-01', 'Emma Wilson', '456 Cedar Ave, City, Country', '9910-2222', 'emma@email.com'), ('444.555.666-02', 'Noah Garcia', '321 Elm Rd, City, Country', '3310-5555', 'noah@email.com'), ('777.888.999-03', 'Olivia Lee', '555 Maple Blvd, City, Country', '6610-8888', 'olivia@email.com'), ('222.333.444-04', 'Ava Martinez', '999 Oak St, City, Country', '2210-4444', 'ava@email.com'), ('123.456.789-05', 'Alice Johnson', '789 Maple St, City, Country', '1110-3333', 'alice@email.com'), ('987.654.321-06', 'Bob Smith', '456 Oak Ave, City, Country', '4410-6666', 'bob@email.com'), ('111.222.333-07', 'Eva Davis', '321 Pine Rd, City, Country', '7710-9999', 'eva@email.com'), ('444.555.666-08', 'David Wilson', '555 Cedar Blvd, City, Country', '0010-8888', 'david@email.com'), ('777.888.999-09', 'Sophia Martinez', '999 Elm St, City, Country', '2210-0000', 'sophia@email.com');

insert into clientevenda values ('123.456.789-05', 1, 1), ('987.654.321-06', 2, 2), ('111.222.333-07', 3, 3), ('444.555.666-08', 4, 4), ('777.888.999-09', 5, 5), ('555.123.789-00', 6, 6), ('321.987.654-01', 7, 7), ('444.555.666-02', 8, 8), ('777.888.999-03', 9, 9), ('222.333.444-04', 10, 10);

insert into produto values (11, 'Produto Teste', 'Teste de Left Join', 9.99, 3, 1, 1), (12, 'Outro Produto', 'Outro teste join', 0.99, 10, 2, 3), (13, 'RTX 4090', 'Video Card', 15000.0, 5, 1, 10);


-- Listar produtos que tem preço maior que a média
SELECT p.nome as NomeProduto, p.preco as Preco
FROM produto p
GROUP by p.nome
HAVING MAX(p.preco) > (SELECT AVG(p2.preco) from produto p2);

-- Liste todos os produtos e seus respectivos fornecedores
select p.nome as NomeProduto, f.nome as NomeFornecedor
from produto p join produtofornecedor pf
on p.id = pf.idProduto join fornecedor f
on f.id = pf.idFornecedor; 

-- Obtenha os detalhes de contato dos clientes e suas vendas associadas.
select c.nome as NomeCliente, c.email as EmailCliente, v.valorTotal as ValorCompra
from cliente c join clientevenda cv
on c.cpf = cv.cpf join venda v 
on v.id = cv.idVenda;

-- Mostre todos os funcionários e os produtos que eles venderam.
select f.nome as NomeFuncionario, p.nome as NomeProduto
from funcionario f join produtofunc pf
on f.id = pf.idFuncionario join produto p
on p.id = pf.idProduto;

-- Determine o valor médio das vendas por cliente
SELECT c.nome, AVG(v.valorTotal) AS Valor_Medio_Venda
FROM cliente c JOIN clientevenda cv
ON c.cpf = cv.cpf JOIN venda v
ON v.id = cv.idVenda
GROUP BY c.nome;

-- Encontre o total de vendas para cada forma de pagamento, mostrando apenas aquelas formas com um total superior a 2000.
SELECT fp.descricao, SUM(v.valorTotal) AS Total_Vendas
FROM formapagamento fp
JOIN clientevenda cv ON fp.id = cv.idPagamento
JOIN venda v ON cv.idVenda = v.id
GROUP BY fp.descricao
HAVING Total_Vendas > 2000;

--  Identifique os funcionários com vendas totais acima da média.
SELECT f.nome as NomeFuncionario, SUM(v.valorTotal) AS Total_Vendas 
FROM funcionario f 
JOIN produtofunc pf ON f.id = pf.idFuncionario 
JOIN vendaproduto vp ON pf.idProduto = vp.idProduto 
JOIN venda v ON vp.idVenda = v.id
GROUP BY f.nome HAVING Total_Vendas > (SELECT AVG(valorTotal) FROM Venda);

-- Calcule a despesa salarial total para cada filial e exiba os resultados em ordem decrescente da despesa salarial total.
SELECT f.idFilial as ID_Filial, SUM(f.salario) AS Total_Salarios
FROM funcionario f
GROUP BY f.idFilial
ORDER BY total_salarios DESC;