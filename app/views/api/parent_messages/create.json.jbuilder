if @parent_message.errors.any?
  json.error "something went wrong"
else
  json.success "Success"
end