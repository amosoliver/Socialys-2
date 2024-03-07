class CongregacoesController < ApplicationController
  def index
    @congregacao = Congregacao.all
  end

  def new
    @congregacao = Congregacao.new
  end

  def create
    @congregacao = Congregacao.new(congregacao_params)

    if @congregacao.save
      redirect_to @congregacao, notice: "Congregação criada com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @congregacao = Congregacao.update(congregacao_params)
    if @congregacao.update
      redirect_to @congregacao, notice: "Congregação criada com sucesso"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @congregacao = Congregacao.destroy
    redirect_to @congregacao, notice: "Congregação excluida com sucesso"
  end

  private

  def set_congregacao
    @congregacao = Congregacao.find(params[:id])
  end

  def congregacao_params
    params.require(:congregacao).permit(:nome)
  end
end
