require_relative "numero_chutado_exception.rb"

class Jogo
  attr_reader :chutes,  :tentativas,  :tentativa
  attr_reader :maximo,  :secreto

  def initialize(jogador, dificuldade, tentativas)
    @jogador      = jogador
    @dificuldade  = dificuldade
    @tentativas   = tentativas
    @chutes       = []
    @tentativa    = 1
    @acertou      = false
    @secreto      = sorteia_numero
  end

  def da_boas_vindas
    puts 'Bem-vindo ao jogo da adivinhacao'
    puts "\n\n\n\n"
    puts "Comecaremos o jogo para voce, #{@jogador.nome}"
  end

  def chuta(chute)
    mensagem = "Atencao, voce ja jogou o numero #{chute}!"
    raise NumeroChutadoException, mensagem if @chutes.include? chute

    @acertou = @secreto == chute
    @chutes << chute
    @tentativa += 1
  end

  def chute_certo?
    @acertou
  end

  def detalhe_do_chute
    if self.chute_certo?
      'Voce acertou o numero secreto'
    else
      chute = @chutes.last
      maior = @secreto > chute
      if maior
        "O numero secreto e maior do que #{@chute}!"
      else
        "O numero secreto e menor do que #{chute}!"
      end
    end
  end

  def esgotou_tentativas?
    @tentativa > @tentativas
  end

private
  def sorteia_numero
    case @dificuldade
    when 1
      maximo = 30
    when 2
      maximo = 60
    when 3
      maximo = 100
    when 4
      maximo = 150
    else
      maximo = 200
    end
    @maximo = maximo

    rand(@maximo) + 1
  end
end