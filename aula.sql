create database suport;
use suport;

create table servico(
servico_id int primary key,
descricao varchar(100) not null, 
valorUNIT float not null check (valorUNIT > 0), 
tempo datetime not null
);

create table cliente(
cod_cliente int auto_increment primary key,
nome varchar(45) not null,
telefone varchar(45),
endereco varchar(45),
email varchar(45) not null
);


create table pedido(
cod_pedido int primary key,
data_pedido datetime not null,
atendido boolean default false,
cod_cliente int,
FOREIGN key (cod_cliente) references cliente(cod_cliente)
);

create table itemServico(
cod_item int primary key,
quantidade int not null,
servico_id int,
cod_pedido int,
foreign key (servico_id) references servico (servico_id) ON delete cascade,
foreign key (cod_pedido) references pedido (cod_pedido) On delete cascade
);

insert into cliente (nome, telefone, endereco, email ) values
('Ana Clara Souza', '61991234567', 'Rua das Flores, 123', 'ana.souza@email.com'),
('Bruno Henrique Lima', '61999887766', 'Av. Central, 456', 'bruno.hlima@email.com'),
('Carlos Eduardo Batista', '61988776655', 'QNL 5 Conj. B', 'carlos.eb@email.com'),
('Daniela Ferreira', '61991112233', 'SHN Quadra 2, Bloco E', 'dani.ferreira@email.com'),
('Eduarda Martins', '61995554433', 'CLS 202 Bloco C', 'edu.martins@email.com'),
('Fábio Silva', '61990011223', 'QI 18 Conjunto F', 'fabio.silva@email.com'),
('Gabriel Soares Segatto', '61997000000', 'Taguatinga Norte, DF', 'gabriel.segatto@email.com'),
('Helena Castro', '61993332211', 'Rua do Bosque, 90', 'helena.castro@email.com');

INSERT INTO servico (servico_id, descricao, valorUNIT, tempo) VALUES
(1, 'Formatação de computador', 150.00, '2025-01-01 01:30:00'),
(2, 'Instalação de software', 80.00, '2025-01-01 00:45:00'),
(3, 'Limpeza interna de notebook', 100.00, '2025-01-01 01:00:00'),
(4, 'Montagem de computador', 200.00, '2025-01-01 02:00:00'),
(5, 'Atualização de sistema operacional', 120.00, '2025-01-01 01:15:00'),
(6, 'Troca de HD para SSD', 180.00, '2025-01-01 01:20:00'),
(7, 'Backup de dados', 90.00, '2025-01-01 00:50:00'),
(8, 'Diagnóstico técnico', 60.00, '2025-01-01 00:30:00');

INSERT INTO pedido (cod_pedido, data_pedido, atendido, cod_cliente) VALUES
(1, '2025-05-01 09:30:00', true, 1),
(2, '2025-05-02 14:15:00', false, 3),
(3, '2025-05-03 10:00:00', true, 2),
(4, '2025-05-04 11:45:00', false, 5),
(5, '2025-05-05 16:20:00', true, 4),
(6, '2025-05-06 13:10:00', false, 6),
(7, '2025-05-07 08:55:00', true, 7),
(8, '2025-05-08 15:30:00', false, 8);

INSERT INTO itemServico (cod_item, quantidade, servico_id, cod_pedido) VALUES
(1, 1, 1, 1),  
(2, 2, 2, 1),  

(3, 1, 3, 2), 
(4, 1, 4, 3),  
(5, 1, 5, 3),  

(6, 2, 6, 4),  

(7, 1, 7, 5),  

(8, 1, 8, 6), 
(9, 1, 2, 6),  

(10, 3, 1, 7), 

(11, 1, 5, 8); 

select * from cliente;
select * from servico;
select * from pedido;
select * from itemServico;

insert into cliente (nome, telefone, endereco, email ) values
('Adalva Sousa Souza', '61991242567', 'Rua das mortes, 223', 'adalva.souza@email.com');

select nome
from cliente
where cod_cliente > 1;

select nome
from cliente
where cod_cliente > 1
order by nome asc;

select distinct servico_id
from itemServico
where quantidade < 3;

select *
from pedido
where atendido = false;












































