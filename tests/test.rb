require "minitest/autorun"
require_relative "../jogador"
require_relative "../jogo"

class JogoiTest < Minitest::Test
def test_secreto_deve_estar_entre_1_e_30_para_dificuldade_1
pedro = Jogador.new("Pedro")
advinha = Jogo.new(pedro, 1, 30)
assert advinha.secreto >= 0 and advinha.secreto <= 30
end
end


class JogoiTest < Minitest::Test
def test_secreto_deve_estar_entre_1_e_60_para_dificuldade_1
pedro = Jogador.new("Pedro")
advinha = Jogo.new(pedro, 2, 30)
assert advinha.secreto >= 0 and advinha.secreto <= 60
end
end
