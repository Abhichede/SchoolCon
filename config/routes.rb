Rails.application.routes.draw do
  resources :time_table_settings

  resources :time_tables
  resources :teachers
  root 'standards#index'
  resources :subjects
  resources :standards
  
  get 'get_subjects', to: 'time_tables#get_subjects'
  get 'get_divisions', to: 'time_tables#get_divisions'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
