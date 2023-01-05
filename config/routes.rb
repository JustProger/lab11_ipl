Rails.application.routes.draw do
  root 'main#index'
  get 'main/show/:id', to: 'main#show', as: :main_show
  get 'mains', to: 'main#all', as: :main_all
  post 'main/result', to: 'main#result', as: :main_result
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
