Rails.application.routes.draw do

  resources :question_papers
  resources :questions
  get 'divisions_and_subjects', to: 'questions#divisions_and_subjects'
  resources :student_marks
  get 'fill_marks', to: 'exams#fill_marks'
  get 'student_report_card', to: 'student_marks#student_report_card'
  get 'divisions_subjects_marks', to: 'student_marks#divisions_subjects'
  get 'students_marks', to: 'student_marks#students_exam_by_div'
  resources :exam_marks
  resources :exam_subjects
  resources :exams
  get 'get_divisions_exams', to: 'exams#get_divisions_exams'


  get 'reports_dashboard', to: 'reports#index'
  get 'student_report', to: 'reports#student_report'

  resources :teacher_leave_applications
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
    mount_devise_token_auth_for 'User', at: 'auth', controllers: { passwords: 'passwords' }

    resources :students
    # ==> Parents
    resources :parents
    post 'register_device_id', to: 'parents#register_device_id'
    # ==> Student Fee Payments
    resources :student_fee_payments
    get 'student_fee_summary', to: 'students#student_fee_summary'
    # ==> Student Attendances
    resources :attendances
    # ==> Notifications
    resources :notifications
    # ==> Posts
    resources :posts
    get 'gallery', to: 'posts#gallery'
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
    post 'update_status', to: 'leave_applications#update_status'
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
    get 'attendance_monthly_summary', to: 'attendances#monthly_summary'

    resources :teacher_leave_applications

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

  # ==> Parents
  get 'send_auth_details', to: 'parents#send_auth_details'
  get 'send_stdwise_auth_details', to: 'standards#send_stdwise_auth_details'

  # ==> Issue certificate
  post 'issue_certificate', to: 'students#issue_certificate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
