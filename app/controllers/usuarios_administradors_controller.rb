class UsuariosAdministradorsController < ApplicationController
    before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  
    def index
      @usuarios = Usuario.all
    end
  
    def new
      @usuario = Usuario.new
    end
  
    def edit
    end
  
    def create
      @usuario = Usuario.new(usuario_params)
  
      respond_to do |format|
        if @usuario.save
          cookies[:usuario] = @usuario.id
          format.html { redirect_to '/usuarios_administradors', notice: 'Usuario was successfully created.' }
          format.json { render :show, status: :created, location: @usuario }
        else
          format.html { render :new }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @usuario.update(usuario_params)
          format.html { redirect_to usuarios_administrador_path(@usuario), notice: 'Usuario was successfully updated.' }
          format.json { render :show, status: :ok, location: @usuario }
        else
          format.html { render :edit }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @usuario.destroy
      respond_to do |format|
        format.html { redirect_to '/usuarios_administradors', notice: 'Usuario was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      def set_usuario
        @usuario = Usuario.find(params[:id])
      end
  
      def usuario_params
        params.require(:usuario).permit(:nome, :cpf, :endereco, :numero, :cep, :estado, :login, :senha)
      end
  end
