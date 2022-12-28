/*
Este script cria a procedure que faz o cadastro dos itens da nota fiscal.
O par�metro de entrada � uma tabela que cont�m as seguintes colunas:
- N�mero da nota fiscal
- CNPJ do fornecedor
- Descri��o do item
- Quantidade do item
- Valor unit�rio do item
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

