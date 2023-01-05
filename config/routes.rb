Rails.application.routes.draw do
  root 'main#index'
  get 'main/show'
  post 'main/result', to: 'main#result', as: :main_result
  get 'main/all'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
