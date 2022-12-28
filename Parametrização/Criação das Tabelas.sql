/*
Este script é utilizado para criar as tabelas utilizadas no projeto.
Foram pensadas inicialmente 5 tabelas, conforme abaixo:
- Tabela de Itens
- Tabela de Categorias
- Tabela de Fornecedores
- Tabela de Notas Fiscais
- tabelas de Itens de Notas Fiscais
*/

USE Recex
-- Criação da Tabela de Itens
CREATE TABLE tab_itens (
		ITEM_COD INT IDENTITY(100000,1) PRIMARY KEY,
		CATEGORIA_ID INT NOT NULL,
		ITEM_DESCRICAO VARCHAR(255) NOT NULL
)
-- Criação da tabela de Categorias
CREATE TABLE tab_categorias (
		CATEGORIA_ID INT IDENTITY(1,1) PRIMARY KEY,
		CATEGORIA_PAI_ID INT NULL,
		CATEGORIA_DESCRICAO VARCHAR(255) NOT NULL,
		CATEGORIA_DESCRICAO_ITEM VARCHAR(255)
)
-- Criação da Tabela de Fornecedores
CREATE TABLE tab_fornecedores (
		FORNECEDOR_CNPJ CHAR(14) PRIMARY KEY, -- Este campo foi inicialmente criado como varchar, mas alterei para char a partir da contribuição da Gabrielly Vieira
		FORNECEDOR_NOME VARCHAR(255)
)
-- Criação da Tabela de Notas Fiscais
CREATE TABLE tab_notas_fiscais (
		NOTA_FISCAL_NUM INT,
		FORNECEDOR_CNPJ CHAR(14),  -- Este campo foi inicialmente criado como varchar, mas alterei para char a partir da contribuição da Gabrielly Vieira
		NOTA_FISCAL_DATA DATE NOT NULL,
		NOTA_FISCAL_VALOR FLOAT NOT NULL,
		NOTA_FISCAL_DATA_RECEBIMENTO DATE NOT NULL,
		PRIMARY KEY (NOTA_FISCAL_NUM, FORNECEDOR_CNPJ)
)
-- Criação da Tabela de Itens de Notas Fiscais
CREATE TABLE tab_Itens_Notas_Fiscais (
		INF_ID INT IDENTITY(1,1) PRIMARY KEY,
		ITEM_COD INT,
		NOTA_FISCAL_NUM INT,
		FORNECEDOR_CNPJ CHAR(14),  -- Este campo foi inicialmente criado como varchar, mas alterei para char a partir da contribuição da Gabrielly Vieira
		ITEM_DESCRICAO VARCHAR(255),
		ITEM_QUANTIDADE INT,
		ITEM_VALOR FLOAT,
		CATAGORIA_ID INT
)

-- Adicionando as chaves esrangeiras
ALTER TABLE tab_itens
	ADD FOREIGN KEY (CATEGORIA_ID)
	REFERENCES tab_categorias (CATEGORIA_ID)

ALTER TABLE tab_notas_fiscais
	ADD FOREIGN KEY (FORNECEDOR_CNPJ)
	REFERENCES tab_fornecedores (FORNECEDOR_CNPJ)

ALTER TABLE tab_itens_notas_fiscais
	ADD FOREIGN KEY (ITEM_COD)
	REFERENCES tab_itens (ITEM_COD)

ALTER TABLE tab_itens_notas_fiscais
	ADD FOREIGN KEY (NOTA_FISCAL_NUM, FORNECEDOR_CNPJ)
	REFERENCES tab_notas_fiscais (NOTA_FISCAL_NUM, FORNECEDOR_CNPJ)