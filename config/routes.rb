Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'home#top'
  get '/home/about' => 'home#about'
  resources :users
end
