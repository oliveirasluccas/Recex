
USE Recex

DECLARE
	@data_recebimento date,
	@num_nota_fiscal int,
	@fornecedor_cnpj varchar(14),
	@valor_nota_fiscal float,
	@contador int,
	@valor_itens_nota_fiscal float,
	@data_nota_fiscal date
DECLARE
	@itens_nota_fiscal as EntradaItens
SET @contador = 1

-- Informar abaixo os dados de entrada da nota fiscal
SET @num_nota_fiscal = 12558
SET @fornecedor_cnpj = '11669055000105'
SET @data_nota_fiscal = '20221223'
SET @valor_nota_fiscal = 4341.22
SET @data_recebimento = '20221226'
-- Informar abaixo os dados de entrada dos itens de nota fiscal.
-- Repetir quantas linhas forem necessárias
INSERT INTO @itens_nota_fiscal (
		numero_nota,
		cnpj,
		descricao,
		quantidade,
		valor)
	VALUES ( -- Lançamento da primeira linha
		@num_nota_fiscal, 
		@fornecedor_cnpj,
		'Descrição 1',
		4,
		3.55
		), -- Fim do lançamento da primeira linha
		-----------------------------------------------------
		( -- Lançamento da segunda linha
		@num_nota_fiscal,
		@fornecedor_cnpj,
		'Descrição 2',
		1,
		4.32
		), -- Fim do lançamento da segunda linha 
		-----------------------------------------------------
		( -- Lançamento da terceira linha
		@num_nota_fiscal,
		@fornecedor_cnpj,
		'Descrição 3',
		1,
		10.00
		), -- Fim do lançamento da terceira linha
		-----------------------------------------------------
		(  -- Lançamento da quarta linha
		@num_nota_fiscal,
		@fornecedor_cnpj,
		'Descrição 4',
		3,
		1.99
		)  -- Fim do lançamento da quarta e última linha

		SELECT * FROM @itens_nota_fiscal

--BEGIN TRANSACTION
	EXEC SP_CadastraNovaNotaFiscal -- Cadastra a nota fiscal de acordo com os valores acima
		@NUM_NOTA_FISCAL = @num_nota_fiscal,
		@FORNECEDOR_CNPJ = @fornecedor_cnpj,
		@DATA_NOTA_FISCAL = @data_nota_fiscal,
		@VALOR_NOTA_FISCAL = @valor_nota_fiscal,
		@DATA_RECEBIMENTO = @data_recebimento

		select * from tab_notas_fiscais	
			where NOTA_FISCAL_NUM = @num_nota_fiscal

	EXEC SP_CadastraNovoItemDeNotaFiscal @ITENS = @itens_nota_fiscal

		select * from tab_Itens_Notas_Fiscais
			where NOTA_FISCAL_NUM = @num_nota_fiscal

--COMMIT