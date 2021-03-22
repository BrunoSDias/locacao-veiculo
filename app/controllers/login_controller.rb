class LoginController < UsuariosController
  
  def sigin
  end

  def cadastrar
  end

  def login
  end


  def login_api
    usuario = Usuario.login(login_params[:email], login_params[:senha])
    if usuario.present?
      render json: {usuario: usuario}, status: :ok
    else
      render json: {status: "Não tem permissão"}, status: :unauthorized
    end
  end

  def logar
    usuario = Usuario.find_by_login(params[:login])

    if usuario.present?
      if usuario.senha == params[:senha]
        cookies[:usuario] = usuario.id
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
    params.require(:usuario).permit(:email, :senha)
  end
end
