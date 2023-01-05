# frozen_string_literal: true

Rails.application.routes.draw do
  root 'main#index'
  get 'main/show/all', to: 'main#showall', as: :main_show_all
  get 'main/show/:id', to: 'main#show', as: :main_show
  post 'main/delete/all', to: 'main#deleteall', as: :main_delete_all
  post 'main/delete/:id', to: 'main#delete', as: :main_delete
  post 'main/result', to: 'main#result', as: :main_result
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
