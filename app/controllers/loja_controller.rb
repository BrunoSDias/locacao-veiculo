class LojaController < UsuariosController
  skip_before_action :verify_authenticity_token, only: :alugar
  before_action :set_veiculo, only: [:aluguel, :alugar]
  def index
  end

  def aluguel
  end

  def alugar
    if params[:cardNumber].present? && 
    params[:cardName].present? && 
    params[:expirationDate].present? && 
    params[:cvv].present?
      
      if params[:dias].present?
        dias = params[:dias].to_i
        @valor_total = dias * @veiculo.valor
        reserva = Reserva.new(reservado_de: Time.now, reservado_ate: Time.now + dias.days, valor_alugado: @valor_total, status: Reserva::STATUS[:aguardando], veiculo_id: @veiculo.id, usuario_id: cookies[:usuario])
        if reserva.save!
          redirect_to "/confirmacao_pagamento/#{reserva.id}"
          return
        end
      end
    end
    redirect_to "/loja/locacao/#{@veiculo.id}", notice: 'Houve um erro ao ir a tela de confirmação'
  end

  def confirmacao_pagamento
    @reserva = Reserva.find(params[:reserva_id])
  end

  private
  def set_veiculo
    @veiculo = Veiculo.find(params[:id])
  end
end
