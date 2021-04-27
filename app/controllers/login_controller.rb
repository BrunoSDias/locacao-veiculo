class LoginController < UsuariosController
  
  def sigin
  end

  def cadastrar
  end

  def login
  end

  def login_pagamento
    if params[:dias].present? && params[:token].present? && params[:senderHash].present? && params[:veiculo_id].present?
      @dias = params[:dias]
      @token = params[:token]
      @senderHash = params[:senderHash]
      @veiculo_id = params[:veiculo_id]
    end
  end


  def login_api
    usuario = Usuario.login(login_params[:login], login_params[:senha])
    if usuario.present?
      render json: {usuario: usuario.encoded}, status: :ok
    else
      render json: {status: "Não tem permissão"}, status: :unauthorized
    end
  end

  def logar
    usuario = Usuario.find_by_login(params[:login])

    if usuario.present?
      if usuario.senha == params[:senha]
        cookies[:usuario] = usuario.encoded["id"]
        redirect_to '/'
        return
      end
    end
    render :login
  end

  def logout
    cookies[:usuario] = nil
    redirect_to '/'
  end

  private
  def login_params
    params.require(:usuario).permit(:login, :senha)
  end
end
