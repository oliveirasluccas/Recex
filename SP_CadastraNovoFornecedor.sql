
CREATE PROCEDURE SP_CadastraNovoFornecedor
	@CNPJ varchar(14),
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
