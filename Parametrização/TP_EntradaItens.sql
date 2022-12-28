/*
Este script define um tipo tabela para a entradas de dados que ser�o realizadas durante os lan�amentos.
Ser� usado na procedure SP_CadastraNovoItemDeNotaFiscal
*/
USE Recex

CREATE TYPE EntradaItens AS TABLE (
		numero_nota int,
		cnpj char(14),  -- Este campo foi inicialmente criado como varchar, mas alterei para char a partir da contribui��o da Gabrielly Vieira
		descricao varchar(255),
		quantidade int,
		valor float)