def boas_vindas
  puts 'Bem vindo ao jogo da forca'
  puts 'Qual o seu nome?'
  nome = gets.chomp
  puts "Que os jogos começem #{nome}!"
end

def encerrar_jogo?
  puts ''
  puts 'Deseja encerrar o jogo? (S/N)'
  nao_quero_jogar = gets.chomp
  nao_quero_jogar.casecmp('S').zero?
end

def sortear_palavra_secreta
  puts ''
  puts 'Hmmm, estou escolhendo uma palavra você...'
  palavra_secreta = 'teste'
  puts "Escolhi uma palavra com #{palavra_secreta.size} letras, boa sorte :)"
  palavra_secreta
end

def cabecalho_de_tentativa(chutes, erros, mascara)
  puts ''
  puts "Palavra secreta: #{mascara}"
  puts "Erros até agora: #{erros}"
  puts "Chutes até agora: #{chutes}"
end

def pede_um_chute
  puts ''
  puts 'Entre com a letra ou palavra'
  chute = gets.chomp
  puts "Será que acertou? Você chutou #{chute}"
  chute
end

def avisar_chute_repetido(chute)
  puts ''
  puts "Você já chutou #{chute}"
end

def avisar_letra_nao_encontrada
  puts 'Letra não encontrada!'
end

def avisar_letra_encontrada(total_encontrado)
  puts "Letra encontrada #{total_encontrado} vezes!"
end

def avisar_acertou_palavra
  puts 'Parabéns! Acertou!'
end

def avisar_errou_palavra
  puts 'Que pena... errou!'
end

def imprimir_qtd_pontos(pontos_ate_agora)
	puts "Você ganhou #{pontos_ate_agora} pontos."
end
