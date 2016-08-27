Rails.application.routes.draw do

  get 'static_pages/resume'

  resources :projects

  root 'static_pages#home'

  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
