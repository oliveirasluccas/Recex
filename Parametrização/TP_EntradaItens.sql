/*
Este script define um tipo tabela para a entradas de dados que serão realizadas durante os lançamentos.
Será usado na procedure SP_CadastraNovoItemDeNotaFiscal
*/
USE Recex

CREATE TYPE EntradaItens AS TABLE (
		numero_nota int,
		cnpj char(14),  -- Este campo foi inicialmente criado como varchar, mas alterei para char a partir da contribuição da Gabrielly Vieira
		descricao varchar(255),
		quantidade int,
		valor float)