--
-- exclusão de tabelas
--

DROP TABLE IF EXISTS D_Data;
DROP TABLE IF EXISTS D_BDI;
DROP TABLE IF EXISTS D_ESPECIFICACAO;
DROP TABLE IF EXISTS D_INDOPC;
DROP TABLE IF EXISTS D_TPMERC;
DROP TABLE IF EXISTS D_NOME_ACAO;
DROP TABLE IF EXISTS F_B3;

--
-- criação de tabelas

--

-- tabela D_Data -----------------

CREATE TABLE D_Data(
	Id_Data int NOT NULL default 0,
	Data date NOT NULL,
	Dia char(2) NOT NULL,
	Mes char(2) NOT NULL,
	Ano char(4) NOT NULL,
 CONSTRAINT PK_D_Data PRIMARY KEY (Data)
);

-- -- tabela D_BDI -----------------

CREATE TABLE D_BDI(
	id_bdi int not null default 0,
	codigo_bdi varchar(2) not null,
	nome_bdi varchar(90) not null,
	lindata date not null,
	linorig varchar(50) not null,
 	
	CONSTRAINT PK_D_BDI PRIMARY KEY (id_bdi)
); 

-- -- tabela D_ESPECIFICACAO -----------------

CREATE TABLE D_ESPECIFICACAO(
	id_especificacao int not null default 0,
	sigla_especificacao varchar(15) not null,
	nome_especificacao varchar(90) not null,
	lindata date not null,
	linorig varchar(50) not null,
 	
	CONSTRAINT PK_D_ESPECIFICACAO PRIMARY KEY (id_especificacao)
); 

-- -- tabela D_INDOPC -----------------

CREATE TABLE D_INDOPC(
	id_INDOPC int not null default 0,
	Codigo_INDOPC varchar(5) not null,
	Sigla_INDOPC varchar(5) not null,
	Nome_INDOPC varchar(90) not null,
	lindata date not null,
	linorig varchar(50) not null,
 
 	CONSTRAINT PK_D_INDOPC PRIMARY KEY (id_INDOPC)
); 

-- -- tabela D_TPMERC ----------------

create table D_TPMERC(
	id_TPMERC int not null default 0,
	Codigo_TPMERC varchar(5) not null,
	Nome_TPMERC varchar(90) not null,
	lindata date not null,
	linorig varchar(50) not null,

 	CONSTRAINT PK_D_TPMERC PRIMARY KEY (id_TPMERC)
);


-- -- tabela D_NOMEACAO ------------------

create table D_NOME_ACAO(
	id_NOME_ACAO int not null default 0,
	Codigo_ACAO varchar(12) not null,
	Nome_ACAO varchar(90) not null,
	Sigla_especificacao varchar(15) not null,
	lindata date not null,
	linorig varchar(50) not null,
	
 	CONSTRAINT PK_NOME_ACAO PRIMARY KEY (id_NOME_ACAO),
	
	constraint fk_d_nome_acao_especificacao foreign key (Sigla_especificacao)
	references D_ESPECIFICACAO
	on delete cascade
);

-- -- tabela F_B3 ------------------

create table F_B3(
	Id_Fato int not null,
	Id_Data int not null,
	Id_TPMERC int not null,
	Id_INDOPC int not null,
	Id_ACAO int not null,
	Id_bdi int not null,
	lindata date not null,
	linorig varchar(50) not null,

	constraint pk_f_b3 primary key (
		Id_Data,
		Id_TPMERC,
		Id_INDOPC,
		Id_ACAO,
		Id_bdi
	),

	constraint fk_f_b3_d_data
		foreign key (Id_Data)
		references D_Data
		on delete cascade,
	
	constraint fk_f_b3_d_TPMERC
		foreign key (Id_TPMERC)
		references D_TPMERC
		on delete cascade,
	
	constraint fk_f_b3_d_INDOPC
		foreign key (Id_INDOPC)
		references D_INDOPC
		on delete cascade,
	
	constraint fk_f_b3_d_ACAO
		foreign key (Id_ACAO)
		references D_NOME_ACAO
		on delete cascade,
	
	constraint fk_f_b3_d_BDI
		foreign key (Id_bdi)
		references D_BDI
		on delete cascade
);
