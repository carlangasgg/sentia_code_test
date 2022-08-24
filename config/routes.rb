Rails.application.routes.draw do
  get 'home/index'
  patch 'upload_file', to: 'home#upload', as: 'upload_file'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
