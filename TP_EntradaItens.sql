

CREATE TYPE EntradaItens AS TABLE (
		numero_nota int,
		cnpj varchar(14),
		descricao varchar(255),
		quantidade int,
		valor float)