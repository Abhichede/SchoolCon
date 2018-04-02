Rails.application.routes.draw do

  devise_for :users

  # get 'profiles', to: 'profiles#index'
  # get 'edit_profile', to: 'profiles#edit'
  # post 'update_profile', to: 'profiles#update'

  resources :profiles, only: [:index, :update, :edit]

  namespace :api, defaults: { format: 'json' } do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
  resources :school_infos
  resources :my_templates
  resources :notifications
  resources :student_certificates
  resources :parents
  resources :events
  resources :student_wise_instant_fees
  resources :student_wise_fines
  resources :student_wise_discounts
  root 'dashboard#index'

  resources :student_fee_payments
  resources :fee_categories
  resources :attendances
  resources :class_teachers
  resources :castes
  resources :religions
  resources :divisions
  resources :students
  resources :caste_categories
  resources :academic_years
  resources :time_table_settings

  resources :time_tables
  resources :teachers
  resources :subjects
  resources :standards
  
  get 'get_subjects', to: 'time_tables#get_subjects'
  get 'get_divisions', to: 'time_tables#get_divisions'
  get 'get_students', to: 'attendances#get_students'
  get 'get_divisions_attendance', to: 'attendances#get_divisions_attendance'
  get 'get_subjects_attendance', to: 'attendances#get_subjects_attendance'

  get 'get_divisions_students', to: 'students#get_divisions_students'
  get 'get_fee_structures', to: 'students#get_fee_structures'
  get 'get_sibling_info', to: 'students#get_sibling_info'

  get 'teacher_wise_timetable', to: 'time_tables#teacherwise'
  get 'non_teaching_staff', to: 'teachers#non_teaching'
  get 'admins_staff', to: 'teachers#admins'

  # assign subjects
  get 'new_assign_subject', to: 'standards#new_assign_subject'
  post 'assign_subjects', to: 'standards#assign_subjects'

  # fee
  get 'fee_payment', to: 'student_fee_payments#fee_payment'
  get 'fee_receipt', to: 'student_fee_payments#fee_receipt'

  # certificates
  get 'add_leaving_certificate', to: 'students#add_leaving_certificate'

  ## Students list
  get 'students_list', to: 'students#print_students_list'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
