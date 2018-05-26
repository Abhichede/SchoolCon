json.extract! student_fee_payment, :id, :student_id, :academic_year_id, :payment_date, :payment_mode, :payment_desc, :amount, :created_at, :updated_at
json.url student_fee_payment_url(student_fee_payment, format: :json)
