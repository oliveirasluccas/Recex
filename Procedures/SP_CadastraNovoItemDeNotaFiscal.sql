/*
Este script cria a procedure que faz o cadastro dos itens da nota fiscal.
O parâmetro de entrada é uma tabela que contém as seguintes colunas:
- Número da nota fiscal
- CNPJ do fornecedor
- Descrição do item
- Quantidade do item
- Valor unitário do item
*/


USE Recex

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

