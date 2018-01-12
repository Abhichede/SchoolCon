Rails.application.routes.draw do
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
  root 'standards#index'
  resources :subjects
  resources :standards
  
  get 'get_subjects', to: 'time_tables#get_subjects'
  get 'get_divisions', to: 'time_tables#get_divisions'
  get 'get_students', to: 'attendances#get_students'
  get 'get_divisions_attendance', to: 'attendances#get_divisions_attendance'
  get 'get_subjects_attendance', to: 'attendances#get_subjects_attendance'

  get 'get_divisions_students', to: 'students#get_divisions_students'

  get 'teacher_wise_timetable', to: 'time_tables#teacherwise'
  get 'non_teaching_staff', to: 'teachers#non_teaching'
  get 'admins_staff', to: 'teachers#admins'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
