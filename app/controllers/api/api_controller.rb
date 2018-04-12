module Api
  class ApiController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    protect_from_forgery with: :null_session

    before_action :authenticate_api_user!

  end
end