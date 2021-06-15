class LojaController < UsuariosController
  before_action :set_veiculo, only: [:aluguel, :alugar, :alugar_guest]
  before_action :set_token_pagamento, only: :aluguel
  skip_before_action :authenticate_user!, only: :alugar

  def index
    @veiculos = Veiculo.all
  end

  def aluguel
    @usuario_id = cookies[:usuario]
  end

  def alugar
    if params[:dias].present? && params[:token].present? && params[:senderHash].present?
      dias = params[:dias].to_i
      token_pagamento = params[:token]
      hash_comprador = params[:senderHash]
      @valor_total = dias * @veiculo.valor
      if request.format.json?
        if user_authorized?

          token = request.headers[:UsuarioToken]
          usuario_id = JsonWebToken.decode(token)["id"]

          reserva = Reserva.new(reservado_de: Time.now, reservado_ate: Time.now + dias.days, valor_alugado: @valor_total, status: Reserva::STATUS[:aguardando], veiculo_id: @veiculo.id, usuario_id: usuario_id)
          if reserva.save!
            render json: reserva, status: :ok
            return
          end
        else
          render json: {}, status: :unauthorized
          return
        end
      else
        if cookies[:usuario].present?
          reserva = Reserva.new(reservado_de: Time.now, reservado_ate: Time.now + dias.days, valor_alugado: @valor_total, status: Reserva::STATUS[:aguardando], veiculo_id: @veiculo.id, usuario_id: cookies[:usuario])
          if reserva.save!
            redirect_to "/confirmacao_pagamento/#{reserva.id}?token_pagamento=#{token_pagamento}&hash_comprador=#{hash_comprador}"
            return
          end
        else
          redirect_to "/login"
          return
        end
      end
      
    end
    redirect_to "/loja/locacao/#{@veiculo.id}", notice: 'Houve um erro ao ir a tela de confirmação'
  end

  def alugar_guest
    usuario = Usuario.find_by_login(params[:login])
    if usuario.present?
      if usuario.senha == params[:senha]
        cookies[:usuario] = usuario.id
        if params[:dias].present? && params[:token].present? && params[:senderHash].present?
          dias = params[:dias].to_i
          token_pagamento = params[:token]
          hash_comprador = params[:senderHash]
          @valor_total = dias * @veiculo.valor
          reserva = Reserva.new(reservado_de: Time.now, reservado_ate: Time.now + dias.days, valor_alugado: @valor_total, status: Reserva::STATUS[:aguardando], veiculo_id: @veiculo.id, usuario_id: usuario.id)
          if reserva.save!
            redirect_to "/confirmacao_pagamento/#{reserva.id}?token_pagamento=#{token_pagamento}&hash_comprador=#{hash_comprador}"
            return
          end
        end
        redirect_to "/loja/locacao/#{@veiculo.id}", notice: 'Houve um erro ao ir a tela de confirmação'
      end
    end
  end

  def confirmacao_pagamento
    if params[:token_pagamento].present? && params[:hash_comprador].present?
      @token = params[:token_pagamento]
      @reserva = Reserva.find(params[:reserva_id])
      @hash_comprador = params[:hash_comprador]
    end
  end

  def finalizar_pagamento
    if params[:token_pagamento].present? && params[:reserva_id].present? && params[:hash_comprador].present?
      reserva = Reserva.find(params[:reserva_id])
      veiculo = reserva.veiculo
      usuario = reserva.usuario
      token = params[:token_pagamento]
      senderHash = params[:hash_comprador]

      body = {
        paymentMode: 'default',
        paymentMethod: 'creditCard',
        currency: 'BRL',
        senderName: usuario.nome,
        senderCPF: usuario.clear_cpf,
        senderAreaCode: 11,
        senderPhone: 996151213,
        senderEmail: usuario.login,
        senderHash: senderHash,
        creditCardHolderName: usuario.nome,
        creditCardHolderCPF: usuario.clear_cpf,
        creditCardHolderBirthDate: usuario.data_nascimento.strftime("%d/%m/%Y"),
        creditCardHolderAreaCode: 11,
        creditCardHolderPhone: 996151213,
        itemId1: veiculo.id,
        itemDescription1: veiculo.nome,
        itemAmount1: "%.2f" % reserva.valor_alugado,
        itemQuantity1: 1,
        creditCardToken: token,
        installmentQuantity: 1,
        installmentValue: "%.2f" % reserva.valor_alugado,
        noInterestInstallmentQuantity: 13,
        shippingAddressRequired: false,
        billingAddressStreet: usuario.endereco,
        billingAddressNumber: usuario.numero,
        billingAddressComplement: usuario.complemento,
        billingAddressDistrict: 'Centro',
        billingAddressPostalCode: usuario.cep,
        billingAddressCity: usuario.cidade,
        billingAddressState: usuario.estado,
        billingAddressCountry: 'BRA'
      }

      response = HTTParty.post("https://ws.sandbox.pagseguro.uol.com.br/v2/transactions?email=brunosdias@outlook.com&token=05EBCA76929940BFB127EEC825809810", 
        body: body,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'charset': 'utf-8'
        }
      )
      
      if response.code == 200
        reserva.update(status: Reserva::STATUS[:pago])
        if request.format.json?
          render json: {}, status: 200
        else
          redirect_to "/finalizado?reserva_id=#{reserva.id}"
        end
      end

      puts response
      return
    end
    render json: {error: [message: "Token de pagamento não preenchido ou veiculo não selecionado"]}, status: 401
  end

  def finalizado
    @reserva = Reserva.find(params[:reserva_id])
    @veiculo = @reserva.veiculo
  end

  private
  def set_token_pagamento
    response = HTTParty.post("https://ws.sandbox.pagseguro.uol.com.br/v2/sessions?email=brunosdias@outlook.com&token=05EBCA76929940BFB127EEC825809810")
    if (200..299).include?(response.code)
      @session_id = response.parsed_response["session"]["id"]
    end
  end

  def set_veiculo
    @veiculo = Veiculo.find(params[:id] || params[:veiculo_id])
  end
end
