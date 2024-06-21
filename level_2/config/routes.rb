Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
  resources :messages, only: %i[index show create]

  get '/tags/:name/messages', to: 'messages#messages_by_tag', as: :tag_messages
end
