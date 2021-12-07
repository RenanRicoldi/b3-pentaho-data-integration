--
-- exclusão de chaves estrangeiras
--

-- ALTER TABLE IF EXISTS D_Pais
--    DROP CONSTRAINT 
--    IF EXISTS FK_D_GrupoGeografico;

-- ALTER TABLE IF EXISTS D_RegiaoVendas
--    DROP CONSTRAINT 
--    IF EXISTS FK_D_Pais;

-- ALTER TABLE IF EXISTS D_Pais 
-- 	DROP CONSTRAINT 
-- 	IF EXISTS FK_D_Pais_D_GrupoGeografico;


-- ALTER TABLE IF EXISTS D_RegiaoVendas 
-- 	DROP CONSTRAINT 
-- 	IF EXISTS FK_D_RegiaoVendas_D_Pais;


-- ALTER TABLE IF EXISTS F_Venda 
-- 	DROP CONSTRAINT 
-- 	IF EXISTS FK_F_Venda_D_Cliente;


-- ALTER TABLE IF EXISTS F_Venda 
-- 	DROP CONSTRAINT 
-- 	IF EXISTS FK_F_Venda_D_Data;


-- ALTER TABLE IF EXISTS F_Venda 
-- 	DROP CONSTRAINT 
-- 	IF EXISTS FK_F_Venda_D_Funcionario;


-- ALTER TABLE IF EXISTS F_Venda 
-- 	DROP  CONSTRAINT 
-- 	IF EXISTS FK_F_Venda_D_RegiaoVendas;


-- ALTER TABLE IF EXISTS F_VendaDetalhe 
-- 	DROP  CONSTRAINT 
-- 	IF EXISTS FK_F_VendaDetalhe_D_Produto;


-- ALTER TABLE IF EXISTS F_VendaDetalhe 
-- DROP CONSTRAINT 
-- IF EXISTS FK_F_VendaDetalhe_F_Venda;

--
-- exclusão de tabelas
--

DROP TABLE IF EXISTS D_Data;
-- DROP TABLE IF EXISTS D_Cliente;
-- DROP TABLE IF EXISTS D_GrupoGeografico;
-- DROP TABLE IF EXISTS D_Pais;
-- DROP TABLE IF EXISTS D_RegiaoVendas;
-- DROP TABLE IF EXISTS D_Funcionario;
-- DROP TABLE IF EXISTS D_Produto;
-- DROP TABLE IF EXISTS F_Venda;
-- DROP TABLE IF EXISTS F_VendaDetalhe;


--
-- criação de tabelas

--

-- tabela D_Data -----------------

CREATE TABLE D_Data(
	Id_Data int  NOT NULL default 0,
	Data date NOT NULL,
	Dia char(2) NOT NULL,
	Mes char(2) NOT NULL,
	Ano char(4) NOT NULL,
 CONSTRAINT PK_D_Data PRIMARY KEY  
(
	Data 
)
);

-- -- tabela D_BDI -----------------

CREATE TABLE D_BDI(
	id_bdi int not null default 0,
	codigo_bdi varchar(2) not null,
	nome_bdi varchar(55) not null,
	lindata date not null,
	linorig varchar(50) not null,
 CONSTRAINT PK_D_BDI PRIMARY KEY 
(
	id_bdi 
)
); 

-- -- tabela D_ESPECIFICACAO -----------------

CREATE TABLE D_ESPECIFICACAO(
	id_especificacao int not null default 0,
	sigla_especificacao varchar(15) not null,
	nome_especificacao varchar(55) not null,
	lindata date not null,
	linorig varchar(50) not null,
 CONSTRAINT PK_D_ESPECIFICACAO PRIMARY KEY 
(
	id_especificacao 
)
); 

-- -- tabela D_INDOPC -----------------

CREATE TABLE D_INDOPC(
	id_INDOPC int not null default 0,
	Codigo_INDOPC int not null,
	Sigla_INDOPC varchar(5) not null,
	Nome_INDOPC varchar(45) not null,
	lindata date not null,
	linorig varchar(50) not null,
 CONSTRAINT PK_D_INDOPC PRIMARY KEY 
(
	id_INDOPC 
)
); 


-- -- tabela F_Venda -----------------

-- CREATE TABLE F_Venda(
-- 	Id_Fato int  NOT NULL,
-- 	Data date NOT NULL,
-- 	Nr_NF varchar (10) NOT NULL,
-- 	Id_Cliente int NOT NULL,
-- 	Id_Funcionario int NOT NULL,
-- 	Id_RegiaoVendas int NOT NULL,
-- 	Vlr_Imposto decimal(18, 2) NOT NULL,
-- 	Vlr_Frete decimal(18, 2) NOT NULL,
-- 	LinData date NOT NULL,
-- 	LinOrig varchar(50) NOT NULL,
--  CONSTRAINT PK_F_Venda PRIMARY KEY  
-- (
-- 	Data ,
-- 	Nr_NF ,
-- 	Id_Cliente ,
-- 	Id_Funcionario ,
-- 	Id_RegiaoVendas 
-- )
-- );


-- -- tabela F_VendaDetalhe -----------------

-- CREATE TABLE F_VendaDetalhe(
-- 	Id_FatoDetalhe int  NOT NULL,
-- 	Data date NOT NULL,
-- 	Nr_NF varchar (10) NOT NULL,
-- 	Id_Cliente int NOT NULL,
-- 	Id_Funcionario int NOT NULL,
-- 	Id_RegiaoVendas int NOT NULL,
-- 	Id_Produto int NOT NULL,
-- 	Vlr_Unitario decimal(18, 2) NOT NULL,
-- 	Qtd_Vendida int NOT NULL,
-- 	LinData date NOT NULL,
-- 	LinOrig varchar(50) NOT NULL,
--  CONSTRAINT PK_F_VendaDetalhe PRIMARY KEY  
-- (
-- 	Data ,
-- 	Nr_NF ,
-- 	Id_Cliente ,
-- 	Id_Funcionario ,
-- 	Id_RegiaoVendas ,
-- 	Id_Produto 
-- )
-- );


-- ALTER TABLE D_Pais ADD CONSTRAINT FK_D_Pais_D_GrupoGeografico 
-- 	FOREIGN KEY(Id_GrupoGeo)
-- 	REFERENCES D_GrupoGeografico (Id_GrupoGeo)
-- 	ON DELETE CASCADE;


-- ALTER TABLE D_RegiaoVendas ADD CONSTRAINT FK_D_RegiaoVendas_D_Pais 
-- 	FOREIGN KEY(Id_Pais)
-- 	REFERENCES D_Pais (Id_Pais)
-- 	ON DELETE CASCADE;


-- ALTER TABLE F_Venda ADD  CONSTRAINT FK_F_Venda_D_Cliente 
-- 	FOREIGN KEY(Id_Cliente)
-- 	REFERENCES D_Cliente (Id_Cliente)
-- 	ON DELETE CASCADE;


-- ALTER TABLE F_Venda ADD  CONSTRAINT FK_F_Venda_D_Data 
-- 	FOREIGN KEY(Data)
-- 	REFERENCES D_Data (Data)
-- 	ON DELETE CASCADE;


-- ALTER TABLE F_Venda ADD CONSTRAINT FK_F_Venda_D_Funcionario 
-- 	FOREIGN KEY(Id_Funcionario)
-- 	REFERENCES D_Funcionario (Id_Funcionario)
-- 	ON DELETE CASCADE;


-- ALTER TABLE F_Venda ADD  CONSTRAINT FK_F_Venda_D_RegiaoVendas 
-- 	FOREIGN KEY(Id_RegiaoVendas)
-- 	REFERENCES D_RegiaoVendas (Id_RegiaoVendas)
-- 	ON DELETE CASCADE;


-- ALTER TABLE F_VendaDetalhe ADD  CONSTRAINT FK_F_VendaDetalhe_D_Produto 
-- 	FOREIGN KEY(Id_Produto)
-- 	REFERENCES D_Produto (Id_Produto)
-- 	ON DELETE CASCADE;


-- ALTER TABLE F_VendaDetalhe ADD CONSTRAINT FK_F_VendaDetalhe_F_Venda 
-- 	FOREIGN KEY(Data, Nr_NF,Id_Cliente, Id_Funcionario, Id_RegiaoVendas)
-- 	REFERENCES F_Venda (Data, Nr_NF,Id_Cliente, Id_Funcionario, Id_RegiaoVendas)
-- 	ON DELETE CASCADE;

