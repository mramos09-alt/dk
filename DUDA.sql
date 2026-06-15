 -- Criar Banco de Dados 
CREATE DATABASE livraria_db;
USE livraria_db;
 
-- 1. Tabela CLIENTE
CREATE TABLE CLIENTE (
    cod_cliente VARCHAR(20) NOT NULL,
    telefone_1 VARCHAR(14) NOT NULL,
    telefone_2 VARCHAR(14),
    rua VARCHAR(50) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    cidade VARCHAR(15) NOT NULL,
    estado VARCHAR(10) NOT NULL,
    CONSTRAINT PK_CLIENTE PRIMARY KEY (cod_cliente));
 
-- 2. Tabela PESSOA_FISICA (Herança de Cliente)
CREATE TABLE PESSOA_FISICA (
    cod_cliente VARCHAR(20) NOT NULL,
    cpf VARCHAR(15) NOT NULL,
    rg VARCHAR(15) NOT NULL,
    CONSTRAINT PK_PESSOA_FISICA PRIMARY KEY (cod_cliente),
    CONSTRAINT FK_PF_CLIENTE FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente));
 
 
-- 3. Tabela PESSOA_JURIDICA (Herança de Cliente)
CREATE TABLE PESSOA_JURIDICA (
    cod_cliente VARCHAR(20) NOT NULL,
    cnpj VARCHAR(20) NOT NULL,
    ie VARCHAR(20) NOT NULL,
    CONSTRAINT PK_PESSOA_JURIDICA PRIMARY KEY (cod_cliente),
    CONSTRAINT FK_PJ_CLIENTE FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente));
 
-- 4. Tabela PEDIDO
CREATE TABLE PEDIDO (
    cod_pedido VARCHAR(10) NOT NULL,
    data DATE NOT NULL,
    valor_pedido DECIMAL(10,2) NOT NULL,
    cod_cliente VARCHAR(20) NOT NULL,
    CONSTRAINT PK_PEDIDO PRIMARY KEY (cod_pedido),
    CONSTRAINT FK_PEDIDO_CLIENTE FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente));
 
-- 5. Tabela EDITORA
CREATE TABLE EDITORA (
    cod_editora VARCHAR(10) NOT NULL,
    telefone_1 VARCHAR(14) NOT NULL,
    telefone_2 VARCHAR(14),
    email VARCHAR(50) NOT NULL,
    nome_contato VARCHAR(50) NOT NULL,
    CONSTRAINT PK_EDITORA PRIMARY KEY (cod_editora));
 
-- 6. Tabela LIVRO
CREATE TABLE LIVRO (
    cod_livro VARCHAR(10) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    ano_publicacao INTEGER NOT NULL,
    categoria VARCHAR(25) NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    nome_livro VARCHAR(50) NOT NULL,
    isbn INTEGER NOT NULL,
    autor VARCHAR(25) NOT NULL,
    cod_editora VARCHAR(10) NOT NULL,
    CONSTRAINT PK_LIVRO PRIMARY KEY (cod_livro),
    CONSTRAINT FK_LIVRO_EDITORA FOREIGN KEY (cod_editora) REFERENCES EDITORA(cod_editora));
 
-- 7. Tabela ESTOQUE
CREATE TABLE ESTOQUE (
    cod_livro VARCHAR(10) NOT NULL,
    qtd_estoque INTEGER NOT NULL,
    CONSTRAINT PK_ESTOQUE PRIMARY KEY (cod_livro),
    CONSTRAINT FK_ESTOQUE_LIVRO FOREIGN KEY (cod_livro) REFERENCES LIVRO(cod_livro));
    
    create table item_peedido(
    cod_pedido varchar(10) not null,
    cod_livro varchar(10) not null,
    qtd_pedido integer not null,
    valor_intem decimal(10,2) not null,
    constraint PK_ITEM_PEDIDO
    primary key (cod_pedido, cod_livro),
    constraint FK_ITEM_PEDIDO foreign key
    (cod_pedido) references PEDIDO (cod_pedido),
    constraint FK_ITEM_PEDIDO foreign key
    (cod_livro) references livro(cod_livro)
    );
 
 -- Registros em CLIENTE
INSERT INTO CLIENTE VALUES ('CLI001', '(43)9999-1111', '(43)3333-1111', 'Av Paulista, 100', 'Centro', 'São Paulo', 'SP');
INSERT INTO CLIENTE VALUES ('CLI002', '(43)9999-2222', NULL, 'Rua Sergipe, 500', 'Centro', 'Londrina', 'PR');
INSERT INTO CLIENTE VALUES ('CLI003', '(11)9888-3333', '(11)3444-2222', 'Rua Augusta, 1500', 'Consolação', 'São Paulo', 'SP');
INSERT INTO CLIENTE VALUES ('CLI004', '(41)9777-4444', NULL, 'Av das Torres, 30', 'Jardim Botânico', 'Curitiba', 'PR');
INSERT INTO CLIENTE VALUES ('CLI005', '(43)9999-5555', '(43)3333-5555', 'Guanabara, 80', 'Guanabara', 'Londrina', 'PR');
 
-- Registros em PESSOA_FISICA
CLI001, 111.111.111-11, 11.111.111-X
CLI002, 222.222.222-22, 22.222.222-Y
CLI004, 444.444.444-44, 44.444.444-Z
 
-- Registros em PESSOA_JURIDICA
CLI003, 33.333.333/0001-33, 333.333.333.333
CLI005, 55.555.555/0001-55, 555.555.555.555
 
-- Registros em PEDIDO
PED01, 2026-05-10, 150.00, CLI001
PED02, 2026-05-15, 340.50, CLI002
PED03, 2026-06-01, 89.90, CLI001
PED04, 2026-06-12, 1200.00, CLI003
PED05, 2026-06-13, 45.00, CLI005
 
-- Registros em EDITORA
ED01, (11)2222-0001, NULL, contato@techbooks.com, Carlos Silva
ED02, (21)3333-0002, (21)4444-0002, vendas@ficticia.com, Ana Oliveira
ED03, (11)5555-0003, NULL, editorial@academicapress.com, Marcos Souza
 
-- Registros em LIVRO
LIV10, 89.90, 2024, Tecnologia, Bancos de Dados Relacionais, BD Relacionais V1 978123, Silva, J., ED01
LIV20, 120.00, 2025, Tecnologia, Dominando JavaScript, JS Master, 978456, Souza, A., ED01
LIV30, 45.00, 2023, Ficção, O Mistério do SQL, Mistério SQL, 978789, Poe, E., ED02
LIV40, 250.00, 2026, Acadêmico, Cálculo Avançado, Cálculo Avançado Vol 2, 978012, Newton, I., ED03
LIV50, 65.00, 2025, Tecnologia, Desenvolvimento Web Moderno, Web Dev, 978345, Silva, J., ED02
 
-- Registros em ESTOQUE
LIV10, 15
LIV20, 8
LIV30, 50
LIV40, 3
LIV50, 22

-- Registros em ITEM_PEDIDO
PED01, LIV10, 1, 89.90
PED01, LIV30, 1, 45.00
PED02, LIV20, 2, 120.00
PED03, LIV10, 1, 89.90
PED04, LIV40, 4, 250.00
PED05, LIV30, 1, 45.00