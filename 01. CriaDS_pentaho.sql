--
-- exclusão de tabelas
--
DROP TABLE IF EXISTS D_vendas;
DROP TABLE IF EXISTS D_BDI;
DROP TABLE IF EXISTS D_ESPECIFICACAO;
DROP TABLE IF EXISTS D_INDOPC;
DROP TABLE IF EXISTS D_NOMEACAO;

drop schema public cascade;
create schema public;

--
-- criação de tabelas

--

-- tabela D_Vendas -------

CREATE TABLE D_vendas(
	TIPREG int not null,
	Data_pregao int not null,
	CODBDI  varchar(2) not null,
  CODNEG varchar(12) not null,
	TPMERC int not null,
	NOMRES varchar(12) not null,
	ESPECI varchar(10) not null,
	PRAZOT varchar(3),
	MODREF varchar(4) not null,
	PREABE real	not null,
	PREMAX real	not null, 
	PREMIN real	not null,
	PREMED real	not null,
	PREULT real	not null,
	PREOFC real	not null,
	PREOFV real	not null,
	TOTNEG int not null,
	QUATOT bigint not null,
	VOLTOT real not null,
  PREEXE real not null,
  INDOPC int not null,
  DATVEN int not null,
  FATCOT int not null,
  PTOEXE real not null,
  CODISI varchar(12) not null,
  DISMES varchar(3) not null
);

-- tabela D_Data -----------------

CREATE TABLE D_Data(
	Data date  PRIMARY KEY NOT NULL,
	Dia char(2) NOT NULL,
	Mes char(2) NOT NULL,
	Ano char(4) NOT NULL
);

-- tabela D_BDI -----------------

create table D_BDI(
	codigo_bdi varchar(2) primary key not null,
	nome_bdi varchar(55) not null
);

create index IX_Codigo_BDI on D_BDI (codigo_bdi);

-- tabela D_ESPECIFICACAO -----------------

create table D_ESPECIFICACAO(
	Sigla_especificacao varchar(15) primary key not null,
	Nome_especificacao varchar(55) not null
);

create index IX_Sigla_Especificacao on D_ESPECIFICACAO (sigla_especificacao);

-- tabela D_INDOPC ------------------
create table D_INDOPC(
	Codigo_INDOPC int primary key not null,
	Sigla_INDOPC varchar(5) not null,
	Nome_INDOPC varchar(45) not null
);

create index IX_Codigo_INDOPC on D_INDOPC (Codigo_INDOPC);

-- tabela D_NOMEACAO ------------------

create table D_NOMEACAO(
	Codigo_TPMERC int primary key not null,
	Nome_TPMERC varchar(45) not null
);

create index IX_Codigo_TPMERC on D_NOMEACAO (Codigo_TPMERC);