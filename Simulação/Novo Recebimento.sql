/*
Este scrit simula um processo de lan�amento de um recebimento.
*/

USE Recex


-- Caso esteja sendo feita a simula��o par aum novo fornecedor, � reciso primeiro realizar o cadastro deste.
-- Procedure para cadasro abaixo.
-- Caso j� esteja cadastrado, seguir para a p�roxima etapa.
-- Uma evolu��o j� pensada para o script � avaliar no momento do cadastro de uma nova nota fiscal se o fornecedor informado j� existe e exibir uma mensagem pedindo o cadastro em caso negativo
EXEC SP_CadastraNovoFornecedor '11669055000106'


-- Declara��o das vari�veis que ser�o utilizadas
DECLARE 
	@data_recebimento date,
	@num_nota_fiscal int,
	@fornecedor_cnpj char(14),
	@valor_nota_fiscal float,
--	@contador int, -- Ainda sem uso
--	@valor_itens_nota_fiscal float, Ainda sem uso
	@data_nota_fiscal date
-- Declara��o da vari�vel do tipo tabela que ser� usada como par�metro de entrada para a procedure SP_CadastraNovoItemDeNotaFiscal
DECLARE
	@itens_nota_fiscal as EntradaItens
--SET @contador = 1 -- Ainda sem uso

-- Informar abaixo os dados de entrada da nota fiscal
-- Numa aplica��o real, estes dados seriam capturados a aprtir de um formul�rio preenchido pelo usu�rio
SET @num_nota_fiscal = 12559
SET @fornecedor_cnpj = '11669055000106'
SET @data_nota_fiscal = '20221224'
SET @valor_nota_fiscal = 4342
SET @data_recebimento = '20221226'
-- Informar abaixo os dados de entrada dos itens de nota fiscal.
-- Repetir o trecho 'values' quantas linhas forem necess�rias, sendo que cada repeti��o representa uma linha, ou um item, da nota fiscal
-- Numa aplica��o real, estes dados seriam capturados a aprtir de um formul�rio preenchido pelo usu�rio. O mesmo formul�rio citado acima.
INSERT INTO @itens_nota_fiscal (
		numero_nota,
		cnpj,
		descricao,
		quantidade,
		valor)
	VALUES ( -- Lan�amento da primeira linha
		@num_nota_fiscal, 
		@fornecedor_cnpj,
		'Descri��o 1',
		14,
		15
		), -- Fim do lan�amento da primeira linha
		-----------------------------------------------------
		( -- Lan�amento da segunda linha
		@num_nota_fiscal,
		@fornecedor_cnpj,
		'Descri��o 2',
		28,
		30
		), -- Fim do lan�amento da segunda linha 
		-----------------------------------------------------
		(  -- Lan�amento da terceira linha
		@num_nota_fiscal,
		@fornecedor_cnpj,
		'Descri��o 3',
		42,
		45
		)  -- Fim do lan�amento da terceira e �ltima linha

		SELECT * FROM @itens_nota_fiscal -- Est� aqui apenas para fins did�ticos, para verifica��o dos dados da tabela

	-- Execu��o das procedures que realizam o cadastro das notas ficais e dos itens das noas fiscais.
	EXEC SP_CadastraNovaNotaFiscal -- Cadastra a nota fiscal de acordo com os valores acima
		@NUM_NOTA_FISCAL = @num_nota_fiscal,
		@FORNECEDOR_CNPJ = @fornecedor_cnpj,
		@DATA_NOTA_FISCAL = @data_nota_fiscal,
		@VALOR_NOTA_FISCAL = @valor_nota_fiscal,
		@DATA_RECEBIMENTO = @data_recebimento

		select * from tab_notas_fiscais	-- Est� aqui apenas para fins did�ticos, para verifica��o dos dados da tabela
			where NOTA_FISCAL_NUM = @num_nota_fiscal

	EXEC SP_CadastraNovoItemDeNotaFiscal @ITENS = @itens_nota_fiscal

		select * from tab_Itens_Notas_Fiscais -- Est� aqui apenas para fins did�ticos, para verifica��o dos dados da tabela
			where NOTA_FISCAL_NUM = @num_nota_fiscal
GO