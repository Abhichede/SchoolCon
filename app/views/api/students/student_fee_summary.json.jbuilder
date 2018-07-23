if @student
  json.total_fee{
    @student.current_total_fee
  }
  json.total_paid_fee{
    @student.current_total_paid
  }
  json.total_balance_fee{
    @student.current_balance_amount
  }
else
  json.error{
    'please enter student ID or student not found.'
  }
end