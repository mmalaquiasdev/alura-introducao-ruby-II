QTD_PONTOS_AO_ACERTAR = 100
QTD_PONTOS_AO_ERRAR = 30

def jogador_chutou_uma_letra?(letra_ou_palavra)
  letra_ou_palavra.size == 1
end

def jogador_acertou_palavra_secreta?(chute, palavra_secreta)
  chute == palavra_secreta
end

def quantas_letras_jogador_acertou?(chute, palavra_secreta)
  qtd_palavras_encontradas = palavra_secreta.count(chute[0])
  if qtd_palavras_encontradas.zero?
    puts 'Não foi dessa vez! Letra não encontrada! :('
  elsif puts "Opa! Acertou uma letra!! Ela foi encontrada #{qtd_palavras_encontradas} vezes!"
  end
  qtd_palavras_encontradas
end

def incrementar_qtd_erros(qtd_erros_atual)
  qtd_erros_atual + 1
end

def aumentar_pontos_do_jogador(pontos_atual, qtd_pontos)
  pontos_atual + qtd_pontos
end

def diminuir_pontos_dojogador(pontos_atual, qtd_pontos)
  pontos_atual - qtd_pontos
end

def jogar
  qtd_erros = 0
  palavras_chutadas = []
  pontos_do_jogador = 0
  palavra_secreta = sortear_palavra_secreta

  while qtd_erros < 5
    chute = pede_um_chute(palavras_chutadas, qtd_erros)
    if palavras_chutadas.include? chute
      puts "Você já chutou a palavra #{chute}, tente algo diferente dessa vez :)"
      next
    end

    palavras_chutadas << chute

    if jogador_chutou_uma_letra?(chute)
      qtd_palavras_encontradas = quantas_letras_jogador_acertou?(chute, palavra_secreta)
      qtd_erros = incrementar_qtd_erros(qtd_erros) if qtd_palavras_encontradas.zero?
    elsif jogador_acertou_palavra_secreta?(chute, palavra_secreta)
      puts 'Parabéns! Você ganhou :)'
      pontos_do_jogador = aumentar_pontos_do_jogador(pontos_do_jogador, QTD_PONTOS_AO_ACERTAR)
      break
    else
      puts 'Vixi! Que pena... você errou :('
      pontos_do_jogador = diminuir_pontos_dojogador(pontos_do_jogador, QTD_PONTOS_AO_ERRAR)
      incrementar_qtd_erros(qtd_erros)
    end
  end

  puts "Seu record foi de #{pontos_do_jogador} pontos"
end

imprimir_boas_vindas

loop do
  jogar
  break if encerrar_jogo?
end
