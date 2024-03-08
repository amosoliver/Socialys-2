class SaidasController < ApplicationController
  before_action :set_saida, only: [:show, :edit, :update, :destroy]

  def index
    @saida = Saida.all
  end

  def new
    @saida = Saida.new
  end

  def create
    @saida = Saida.new(saida_params)
    if @saida.save
      redirect_to @saida, notice: "Saida criada com sucesso"
    else
      redirect_to :new
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @saida = Saida.destroy
    if @saida.destroy
      redirect_to @saida, notice: "Saida excluida com sucesso"
    else
      redirect_to :show
    end
  end

  def update
    @saida = Saida.update(saida_params)
    if @saida.save
      redirect_to @saida, notice: "Saida criada com sucesso"
    else
      redirect_to :edit
    end
  end

  private

  def saida_params
    params.require(:saida).permit(:nfc, :data, :nome, :valor)
  end

  def set_saida
    @saida = Saida.find(params[:id])
  end
end
