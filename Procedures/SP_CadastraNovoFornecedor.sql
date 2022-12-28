/*
Este script cria a procedure para cadastro de um novo fornecedor.
Os par�metros de entrada s�o o CNPJ e o Nome do fornecedor.
*/

USE Recex

CREATE PROCEDURE SP_CadastraNovoFornecedor
	@CNPJ char(14),  -- Este campo foi inicialmente criado como varchar, mas alterei para char a partir da contribui��o da Gabrielly Vieira
	@NOME varchar(255)
	AS
	BEGIN
		INSERT INTO tab_fornecedores (
			FORNECEDOR_CNPJ,
			FORNECEDOR_NOME)
	VALUES	(
			@CNPJ,
			@NOME)
		
	END
GO
