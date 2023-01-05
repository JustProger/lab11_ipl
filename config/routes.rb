Rails.application.routes.draw do
  root 'main#index'
  get 'main/:id', to: 'main#show', as: :main_show
  # get '/calc/:id', to: 'calc#show', as: :calc_show
  post 'main/result', to: 'main#result', as: :main_result
  get 'mains', to: 'main#all', as: :main_all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
