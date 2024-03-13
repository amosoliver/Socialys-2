class RelatoriosController < ApplicationController

  def relatorio
    @relatorio = Relatorio.relatorio
  end
  
end
