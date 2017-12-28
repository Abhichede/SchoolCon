Rails.application.routes.draw do
  resources :time_tables
  resources :teachers
  root 'standards#index'
  resources :subjects
  resources :standards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
