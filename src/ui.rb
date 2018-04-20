def imprimir_boas_vindas
  puts 'Bem vindo ao jogo da forca'
  puts 'Qual o seu nome?'
  nome = gets.chomp
  puts "Que os joos começem #{nome}!"
  nome
end

def encerrar_jogo?
  puts 'Deseja encerrar o jogo? (S/N)'
  nao_quero_jogar = gets.chomp
  nao_quero_jogar.casecmp('S').zero?
end

def pede_um_chute(palavras_chutadas, qtd_erros)
  puts "Erros até agora: #{qtd_erros}"
  puts "Chutes até agora: #{palavras_chutadas}"
  puts 'Tente uma letra ou palavra'
  chute = gets.chomp
  puts 'Opa! Será que foi uma boa tentativa? Vamos conferir o seu chute!'
  chute
end

def sortear_palavra_secreta
  puts 'Hmmm, estou escolhendo uma palavra você...'
  palavra_secreta = 'teste'
  puts "Escolhi uma palavra com #{palavra_secreta.size} letras, boa sorte :)"
  palavra_secreta
end
