Rails.application.routes.draw do
  # Defina suas rotas de aplicativo conforme o DSL em https://guides.rubyonrails.org/routing.html

  # Revela o status de saúde em /up que retorna 200 se o aplicativo for iniciado sem exceções, caso contrário, 500.
  # Pode ser usado por balanceadores de carga e monitores de tempo de atividade para verificar se o aplicativo está online.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :congregacoes 
  resources :saidas
  resources :entradas
end
