--
-- exclusão de tabelas
--
DROP TABLE IF EXISTS D_vendas;
DROP TABLE IF EXISTS D_BDI;
DROP TABLE IF EXISTS D_ESPECIFICACAO CASCADE;
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
	nome_bdi varchar(90) not null,
	lindata date not null,
	linorig varchar(50) not null
);

-- tabela D_ESPECIFICACAO -----------------

create table D_ESPECIFICACAO(
	Sigla_especificacao varchar(15) primary key not null,
	Nome_especificacao varchar(90) not null,
	lindata date not null,
	linorig varchar(50) not null
);


-- tabela D_INDOPC ------------------
create table D_INDOPC(
	Codigo_INDOPC varchar(5) primary key not null,
	Sigla_INDOPC varchar(5) not null,
	Nome_INDOPC varchar(90) not null,
	lindata date not null,
	linorig varchar(50) not null
);

-- tabela D_TPMERC ------------------

create table D_TPMERC(
	Codigo_TPMERC varchar(5) primary key not null,
	Nome_TPMERC varchar(90) not null,
	lindata date not null,
	linorig varchar(50) not null
);

-- tabela D_NOMEACAO ------------------

create table D_NOME_ACAO(
	Codigo_ACAO varchar(12) primary key not null,
	Nome_ACAO varchar(90) not null,
	Sigla_especificacao varchar(15) not null,
	lindata date not null,
	linorig varchar(50) not null,
	
	constraint fk_d_nome_acao_especificacao foreign key (Sigla_especificacao)
	references D_ESPECIFICACAO
	on delete cascade
);

create table F_B3(
	Data date not null,
	Codigo_TPMERC varchar(5) not null,
	Codigo_INDOPC varchar(5) not null,
	Codigo_ACAO varchar(12) not null,
	codigo_bdi varchar(2) not null,
	lindata date not null,
	linorig varchar(50) not null,

	constraint pk_f_b3 primary key (
		Data,
		Codigo_TPMERC,
		Codigo_INDOPC,
		Codigo_ACAO,
		codigo_bdi
	)
);