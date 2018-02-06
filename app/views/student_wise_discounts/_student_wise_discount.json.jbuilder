json.extract! student_wise_discount, :id, :student_id, :academic_year_id, :description, :amount, :is_payment_done, :created_at, :updated_at
json.url student_wise_discount_url(student_wise_discount, format: :json)
