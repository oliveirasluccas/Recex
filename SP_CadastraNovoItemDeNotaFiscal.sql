CREATE PROCEDURE SP_CadastraNovoItemDeNotaFiscal 
	@ITENS EntradaItens READONLY
	AS
	BEGIN
		
		INSERT INTO tab_itens_notas_fiscais (
			NOTA_FISCAL_NUM,
			FORNECEDOR_CNPJ,
			ITEM_DESCRICAO,
			ITEM_QUANTIDADE,
			ITEM_VALOR
			)
			SELECT	
				numero_nota,
				cnpj,
				descricao,
				quantidade,
				valor
			FROM
				@ITENS
	END
GO

