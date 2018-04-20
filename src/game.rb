require_relative 'ui'

QTD_PONTOS_INICIAL = 100
QTD_ERROS_INICIAL = 0

def incrementar_qtd_erros(qtd_erros_atual)
  qtd_erros_atual + 1
end

def aumentar_qtd_pontos(qtd_pontos_atual)
  qtd_pontos_atual + 100
end

def diminuir_qtd_pontos(qtd_pontos_atual)
  qtd_pontos_atual - 30
end

def obter_palavra_mascarada(chutes, palavra_secreta)
  mascara = ''
  for letra in palavra_secreta.chars
		if chutes.include?(letra)
			mascara += letra
		else
			mascara += "_"
		end
	end
	mascara
end

def pedir_chute_valido(chutes, erros, mascara)
  cabecalho_de_tentativa(chutes, erros, mascara)
  chute = ''
  loop do
    chute = pede_um_chute
    break if !chutes.include?(chute)
    avisar_chute_repetido(chute)
  end
  chute
end

def jogador_chutou_uma_letra?(chute)
  chute == 1
end

def chute_igual_palavra_screta?(chute, palavra_secreta)
  chute == palavra_secreta
end

def acertou_letra?(chute, palavra_secreta)
  if jogador_chutou_uma_letra?(chute)
    qtd_letras_encontradas = palavra_secreta.count(chute[0])
    if qtd_letras_encontradas.zero?
      avisar_letra_nao_encontrada
      false
    else
      avisar_letra_encontrada(qtd_letras_encontradas)
      true
    end
  end
end

def acertou_palavra?(chute, palavra_secreta)
  unless jogador_chutou_uma_letra?(chute)
    avisar_errou_palavra
    false
  end
  if chute_igual_palavra_screta?(chute, palavra_secreta)
    avisar_acertou_palavra
    true
  end
end

def jogar
  palavra_secreta = sortear_palavra_secreta
  palavras_chutadas = []
  qtd_erros = QTD_ERROS_INICIAL
  pontos_do_jogador = QTD_PONTOS_INICIAL

  while qtd_erros < 5
    palavra_com_mascara = obter_palavra_mascarada(palavras_chutadas, palavra_secreta)
    chute = pedir_chute_valido(palavras_chutadas, qtd_erros, palavra_com_mascara)
    palavras_chutadas << chute

    unless acertou_letra?(chute, palavra_secreta)
      qtd_erros = incrementar_qtd_erros(qtd_erros)
    end

    unless jogador_chutou_uma_letra?(chute)
      if !acertou_palavra?(chute, palavra_secreta)
        pontos_do_jogador = diminuir_qtd_pontos(pontos_do_jogador)
        qtd_erros = incrementar_qtd_erros(qtd_erros)
      else
        pontos_do_jogador = aumentar_qtd_pontos(pontos_do_jogador)
      end
    end
  end
  imprimir_qtd_pontos(pontos_do_jogador)
end

def iniciar_jogo
  boas_vindas

  loop do
    jogar
    break if encerrar_jogo?
  end
end
