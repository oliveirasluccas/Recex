/*
Este scrit simula um processo de lançamento de um recebimento.
*/

USE Recex


-- Caso esteja sendo feita a simulação par aum novo fornecedor, é reciso primeiro realizar o cadastro deste.
-- Procedure para cadasro abaixo.
-- Caso já esteja cadastrado, seguir para a p´roxima etapa.
-- Uma evolução já pensada para o script é avaliar no momento do cadastro de uma nova nota fiscal se o fornecedor informado já existe e exibir uma mensagem pedindo o cadastro em caso negativo
EXEC SP_CadastraNovoFornecedor '11669055000106'


-- Declaração das variáveis que serão utilizadas
DECLARE 
	@data_recebimento date,
	@num_nota_fiscal int,
	@fornecedor_cnpj char(14),
	@valor_nota_fiscal float,
--	@contador int, -- Ainda sem uso
--	@valor_itens_nota_fiscal float, Ainda sem uso
	@data_nota_fiscal date
-- Declaração da variável do tipo tabela que será usada como parâmetro de entrada para a procedure SP_CadastraNovoItemDeNotaFiscal
DECLARE
	@itens_nota_fiscal as EntradaItens
--SET @contador = 1 -- Ainda sem uso

-- Informar abaixo os dados de entrada da nota fiscal
-- Numa aplicação real, estes dados seriam capturados a aprtir de um formulário preenchido pelo usuário
SET @num_nota_fiscal = 12559
SET @fornecedor_cnpj = '11669055000106'
SET @data_nota_fiscal = '20221224'
SET @valor_nota_fiscal = 4342
SET @data_recebimento = '20221226'
-- Informar abaixo os dados de entrada dos itens de nota fiscal.
-- Repetir o trecho 'values' quantas linhas forem necessárias, sendo que cada repetição representa uma linha, ou um item, da nota fiscal
-- Numa aplicação real, estes dados seriam capturados a aprtir de um formulário preenchido pelo usuário. O mesmo formulário citado acima.
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
		14,
		15
		), -- Fim do lançamento da primeira linha
		-----------------------------------------------------
		( -- Lançamento da segunda linha
		@num_nota_fiscal,
		@fornecedor_cnpj,
		'Descrição 2',
		28,
		30
		), -- Fim do lançamento da segunda linha 
		-----------------------------------------------------
		(  -- Lançamento da terceira linha
		@num_nota_fiscal,
		@fornecedor_cnpj,
		'Descrição 3',
		42,
		45
		)  -- Fim do lançamento da terceira e última linha

		SELECT * FROM @itens_nota_fiscal -- Está aqui apenas para fins didáticos, para verificação dos dados da tabela

	-- Execução das procedures que realizam o cadastro das notas ficais e dos itens das noas fiscais.
	EXEC SP_CadastraNovaNotaFiscal -- Cadastra a nota fiscal de acordo com os valores acima
		@NUM_NOTA_FISCAL = @num_nota_fiscal,
		@FORNECEDOR_CNPJ = @fornecedor_cnpj,
		@DATA_NOTA_FISCAL = @data_nota_fiscal,
		@VALOR_NOTA_FISCAL = @valor_nota_fiscal,
		@DATA_RECEBIMENTO = @data_recebimento

		select * from tab_notas_fiscais	-- Está aqui apenas para fins didáticos, para verificação dos dados da tabela
			where NOTA_FISCAL_NUM = @num_nota_fiscal

	EXEC SP_CadastraNovoItemDeNotaFiscal @ITENS = @itens_nota_fiscal

		select * from tab_Itens_Notas_Fiscais -- Está aqui apenas para fins didáticos, para verificação dos dados da tabela
			where NOTA_FISCAL_NUM = @num_nota_fiscal
GO