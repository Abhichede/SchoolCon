if @student
  json.extract! @student, :current_total_fee, :current_total_discount, :current_total_fine,
                :current_total_paid, :current_balance_amount, :current_academic_year
else
  json.error{
    'please enter student ID or student not found.'
  }
end