

CREATE TYPE TP_ItensNotasFiscais as table (
	NUM_NOTA_FISCAL int,
	FORNECEDOR_CNPJ varchar(14),
	DESCRICAO_ITEM_NOTA varchar(255),
	QUANTIDADE_ITEM int,
	VALOR_ITEM float
	)
GO