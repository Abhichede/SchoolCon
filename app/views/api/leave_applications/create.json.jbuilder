if @leave_application.errors.any?
  json.error "something went wrong"
else
  json.success "Success"
end