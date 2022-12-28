/*
Este script cria a procedure que realiza o cadastro de uma nova nota fiscal.
Os parâmetros de entrada são:
- Número da nota fiscal
- CNPJ do fornecedor
- Data da nota fiscal
- Valor da nota fiscal
- Data de recebimento
*/

USE Recex

CREATE PROCEDURE SP_CadastraNovaNotaFiscal
	@NUM_NOTA_FISCAL int,
	@FORNECEDOR_CNPJ char(14),  -- Este campo foi inicialmente criado como varchar, mas alterei para char a partir da contribuição da Gabrielly Vieira
	@DATA_NOTA_FISCAL DATE,
	@VALOR_NOTA_FISCAL FLOAT,
	@DATA_RECEBIMENTO DATE
	AS
	BEGIN
		INSERT INTO tab_notas_fiscais ( 
			NOTA_FISCAL_NUM, 
			FORNECEDOR_CNPJ, 
			NOTA_FISCAL_DATA, 
			NOTA_FISCAL_VALOR, 
			NOTA_FISCAL_DATA_RECEBIMENTO
			)
		VALUES (
			@NUM_NOTA_FISCAL,
			@FORNECEDOR_CNPJ,
			@DATA_NOTA_FISCAL,
			@VALOR_NOTA_FISCAL,
			@DATA_RECEBIMENTO
			)
	END
GO



