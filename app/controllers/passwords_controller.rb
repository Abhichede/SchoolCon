class PasswordsController < DeviseTokenAuth::PasswordsController

  # this action is responsible for generating password reset tokens and
  # sending emails
  def create
    return render_create_error_missing_username unless resource_params[:username]

    # give redirect value from params priority
    @redirect_url = params.fetch(
        :redirect_url,
        DeviseTokenAuth.default_password_reset_url
    )

    return render_create_error_missing_redirect_url unless @redirect_url
    # return render_create_error_not_allowed_redirect_url if blacklisted_redirect_url?

    @email = get_case_insensitive_field_from_resource_params(:username)
    @resource = find_resource(:username, @email)

    if @resource
      yield @resource if block_given?
      @resource.send_reset_password_instructions(
          email: @resource.email,
          provider: 'email',
          redirect_url: @redirect_url,
          client_config: params[:config_name]
      )

      if @resource.errors.empty?
        return render_create_success
      else
        render_create_error @resource.errors
      end
    else
      render_not_found_error
    end
  end


  private
  def resource_params
    params.permit(:username, :reset_password_token)
  end

  protected
    def render_create_error_missing_username
      render_error(401, 'Username is missing')
    end

  def render_create_success
    render json: {
        success: true,
        message: "The message has been sent to #{@email} containing instructions for resetting your password."
    }
  end

end