Rails.application.routes.draw do

  resources :parent_messages
  resources :leave_applications
  resources :homeworks
  resources :holidays
  resources :office_expenses
  resources :post_attachments
  resources :posts
  devise_for :users

  # get 'profiles', to: 'profiles#index'
  # get 'edit_profile', to: 'profiles#edit'
  # post 'update_profile', to: 'profiles#update'

  resources :profiles, only: %i[index update edit]

  namespace :api, defaults: { format: 'json' } do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :students
    # ==> Parents
    resources :parents
    # ==> Student Fee Payments
    resources :student_fee_payments
    get 'student_fee_summary', to: 'students#student_fee_summary'
    # ==> Student Attendances
    resources :attendances
    # ==> Notifications
    resources :notifications
    # ==> Posts
    resources :posts
    # ==> Teachers
    resources :teachers
    # ==> Student's certificates
    resources :student_certificates
    # ==> Holidays
    resources :holidays
    # ==> Homeworks
    resources :homeworks
    # ==> TimeTable
    resources :time_tables
    # ==> Leave Application
    resources :leave_applications
    # ==> Parent Messages
    resources :parent_messages
    # ==> Subjects
    resources :subjects
    # ==> Standards
    resources :standards
    # ==> Divisions
    resources :divisions
    # ==> Academic Year
    resources :academic_years
    get 'get_current_academic_year', to: 'academic_years#get_current_academic_year'
    get 'monthly_summary', to: 'attendances#monthly_summary'
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

  # => assign subjects
  get 'new_assign_subject', to: 'standards#new_assign_subject'
  post 'assign_subjects', to: 'standards#assign_subjects'

  # => fee
  get 'fee_payment', to: 'student_fee_payments#fee_payment'
  get 'fee_receipt', to: 'student_fee_payments#fee_receipt'
  get 'fee_statement', to: 'student_fee_payments#fee_statement'

  # ==> certificates
  get 'add_leaving_certificate', to: 'students#add_leaving_certificate'

  # ==> Students
  get 'students_list', to: 'students#print_students_list'
  post 'update_parent', to: 'students#update_parent_from_view', as: 'update_parent'
  get 'view_student_certificates', to: 'students#view_student_certificates'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
