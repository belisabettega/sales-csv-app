Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'data_files#new'
  resources :data_files, only: %i[new create]
end
