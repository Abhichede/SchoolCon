class ProfilesController < ApplicationController

  before_action :set_user, only: %w[edit update]
  def index
    if params[:approved] == "false"
      @users = User.where(approved: false)
    else
      @users = User.all
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @user.update(profile_params)
        format.html{ redirect_to profiles_path, notice: 'User approved' }
        format.json { head :no_content }
      else
        format.html{ redirect_to profiles_path, alert: 'Something went wrong' }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:users).permit(:approved)
  end

end