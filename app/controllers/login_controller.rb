class LoginController < UsuariosController
  
  def sigin
  end

  def cadastrar
  end

  def login
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
end
