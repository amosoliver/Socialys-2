class LiteraturasController < ApplicationController
  def index
    @literatura = Literatura.all
  end

  def edit
  end

  def show
  end

  def destroy
    @literatura = Literatura.destroy
    redirect_to @literatura, notice: "Literatura excluida com sucesso"
  end

  def update
  end

  def new
    @literatura = Literatura.new
  end

  def create
    @literatura = Literatura.new(literatura_params)

    if @literatura.save
      redirect_to @literatura, notice: "Literatura salva com sucesso"
    else
      :new
    end
  end

  private

  def set_literatura
    @literatura = Literatura.find(params[:id])
  end

  def literatura_params
    params.require(:literatura).permit(:id_congregacao, :valor)
  end
end
