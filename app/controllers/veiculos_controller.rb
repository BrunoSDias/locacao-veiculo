class VeiculosController < AdministradorsController
  before_action :set_veiculo, only: [:show, :edit, :update, :destroy]

  # GET /veiculos
  # GET /veiculos.json
  def index
    @veiculos = Veiculo.all
  end

  # GET /veiculos/1
  # GET /veiculos/1.json
  def show
  end

  # GET /veiculos/new
  def new
    @veiculo = Veiculo.new
  end

  # GET /veiculos/1/edit
  def edit
  end

  # POST /veiculos
  # POST /veiculos.json
  def create
    @veiculo = Veiculo.new(veiculo_params)

    respond_to do |format|
      if @veiculo.save
        @veiculo.foto.attach(params[:veiculo][:foto])
        format.html { redirect_to @veiculo, notice: 'Veiculo foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @veiculo }
      else
        format.html { render :new }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veiculos/1
  # PATCH/PUT /veiculos/1.json
  def update
    respond_to do |format|
      if @veiculo.update(veiculo_params)
        format.html { redirect_to @veiculo, notice: 'Veiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @veiculo }
      else
        format.html { render :edit }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veiculos/1
  # DELETE /veiculos/1.json
  def destroy
    @veiculo.destroy
    respond_to do |format|
      format.html { redirect_to veiculos_url, notice: 'Veiculo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veiculo
      @veiculo = Veiculo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def veiculo_params
      params.require(:veiculo).permit(:nome, :cor, :qnt_passageiros, :placa, :valor, :marca_id, :foto)
    end
end
