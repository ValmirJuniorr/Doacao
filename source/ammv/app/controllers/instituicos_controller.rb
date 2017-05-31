class InstituicosController < ApplicationController
  before_action :set_instituico, only: [:show, :edit, :update, :destroy]

  # GET /instituicos
  # GET /instituicos.json
  def index
    @instituicos = Instituico.all
  end

  # GET /instituicos/1
  # GET /instituicos/1.json
  def show
  end

  # GET /instituicos/new
  def new
    @instituico = Instituico.new
  end

  # GET /instituicos/1/edit
  def edit
  end

  # POST /instituicos
  # POST /instituicos.json
  def create
    @instituico = Instituico.new(instituico_params)

    respond_to do |format|
      if @instituico.save
        format.html { redirect_to @instituico, notice: 'Instituico was successfully created.' }
        format.json { render :show, status: :created, location: @instituico }
      else
        format.html { render :new }
        format.json { render json: @instituico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instituicos/1
  # PATCH/PUT /instituicos/1.json
  def update
    respond_to do |format|
      if @instituico.update(instituico_params)
        format.html { redirect_to @instituico, notice: 'Instituico was successfully updated.' }
        format.json { render :show, status: :ok, location: @instituico }
      else
        format.html { render :edit }
        format.json { render json: @instituico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instituicos/1
  # DELETE /instituicos/1.json
  def destroy
    @instituico.destroy
    respond_to do |format|
      format.html { redirect_to instituicos_url, notice: 'Instituico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instituico
      @instituico = Instituico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instituico_params
      params.require(:instituico).permit(:nome_instituicao, :id_cliente_parceira, :codigo_produto, :codigo_empresa_parceira)
    end
end
