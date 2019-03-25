require_relative "jogador"
require_relative "jogo"

LIMITE_DE_TENTATIVAS = 3 

def pede_nome
  puts 'Qual e o seu nome?'
  nome = gets
end

def pede_dificuldade
  puts 'Qual o nivel de dificuldade que deseja? (1 facil, 5 dificil)?'
  dificuldade = gets.to_i
end 

def pede_um_numero(jogo)
  puts "\n\n\n"
  puts "Tentativa #{jogo.tentativa} de #{jogo.tentativas}"
  puts "Chutes ate agora #{jogo.chutes}"
  puts "Entre com o numero entre 1 e #{jogo.maximo}"
  chute = gets.strip.to_i
  puts "Sera que acertou? Voce chutou #{chute}"
  chute
end

def nao_quer_jogar?
  puts 'Deseja jogar novamente? (S/N)'
  quero_jogar = gets.strip.upcase
  quero_jogar.casecmp('N').zero?
end

nome = pede_nome
dificuldade = pede_dificuldade
jogador = Jogador.new(nome)

loop do
  jogo = Jogo.new(jogador, dificuldade, LIMITE_DE_TENTATIVAS)
  jogo.da_boas_vindas
  loop do
    chute = pede_um_numero jogo
    begin
      jogo.chuta chute
      break if jogo.chute_certo?
      puts jogo.feedback_do_chute
    rescue NumeroChutadoException => e
      puts e.message
    end 
    break if jogo.esgotou_tentativas?
  end
  puts "\n\n\n"
  puts "O numero sorteado foi #{jogo.secreto}"
  puts "\n\n\n"

  break if nao_quer_jogar?
end
