class EntradasController < ApplicationController
    before_action :set_entrada, only: [:show, :edit, :update, :destroy]
  def index
    @entrada = Entrada.all
  end

  def new
    @entrada = Entrada.new
  end

  def create
    @entrada = Entrada.new(entrada_params)
    if @entrada.save
      redirect_to @entrada, notice: "Entrada criada com sucesso"
    else
      redirect_to new_entrada_path
    end
  end

  def edit
  end

  def show
  end

  def update
    @entrada = Entrada.update(entrada_params)
    if @entrada.update
      redirect_to @entrada, notice: "Entrada editada com sucesso"
    else
      redirect_to :edit
    end
  end

  def destroy
    @entrada = Entrada.destroy
    redirect_to :index, notice: "Entrada excluida com sucesso"
  end
  

  private
def set_entrada
  @entrada = Entrada.find(params[:id])
end

  def entrada_params
    params.require(:entrada).permit(:numero_recibo,:data,:nome,:descricao,:congregacao_id)
  end
end
