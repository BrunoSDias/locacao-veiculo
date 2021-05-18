class CheckoutController < UsuariosController
  skip_before_action :authenticate_user!, only: [:get_session]

  def get_session
    response = HTTParty.post("https://ws.sandbox.pagseguro.uol.com.br/v2/sessions?email=brunosdias@outlook.com&token=05EBCA76929940BFB127EEC825809810")
    if (200..299).include?(response.code)
      @session_id = response.parsed_response["session"]["id"]
      render json: {sessionId: @session_id}, status: :ok
    end
  end

  private

end
