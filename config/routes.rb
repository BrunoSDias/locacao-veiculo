Rails.application.routes.draw do
  get 'usuarios_administrador/index'
  get 'login/sigin'
  get 'login/cadastrar'
  get '/login', to: 'login#login'
  get '/login_pagamento', to: 'login#login_pagamento'
  post 'logar', to: 'login#logar'
  get '/logout', to: 'login#logout'
  get 'loja/index', to: 'loja#index'
  get '/loja/locacao/:id', to: 'loja#aluguel'
  post 'alugar/:id', to: 'loja#alugar'
  post 'alugar_guest', to: 'loja#alugar_guest'
  get '/confirmacao_pagamento/:reserva_id', to: 'loja#confirmacao_pagamento'
  post '/finalizar_pagamento', to: 'loja#finalizar_pagamento'
  get '/finalizado', to: 'loja#finalizado'
  post "/login", to: 'login#login_api'
  resources :usuarios, except: [:show, :index]
  resources :usuarios_administradors
  get 'administrador/login', to: 'login_administrador#login'
  post 'administrador/logar', to: 'login_administrador#logar'
  get 'administrador/logout', to: 'login_administrador#logout'
  resources :administradors
  resources :reservas, only: [:index, :show, :destroy]
  resources :clientes
  resources :veiculos
  resources :marcas
  root "loja#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
