module Api
  class ParentsController < Api::ApiController
    before_action :set_parent, only: %i[show]

    def index
      @parents = Parent.all
    end

    def register_device_id
      if device_reg_params[:parent_id] != ''
        @parent = Parent.find(device_reg_params[:parent_id])
        @user = User.where(username: @parent.mobile).last

        respond_to do |f|
          if @user
            if @user.device_id == nil || @user.device_id != device_reg_params[:device_id]
              @user.update(device_id: device_reg_params[:device_id])
              f.json {render json: {success: 'Device id updated.'}}
            else
              f.json {render json: {error: 'Device id was updated already.'} }
            end
          else
            f.json {render json: {error: 'User not found.'}}
          end
        end

      elsif device_reg_params[:teacher_id] != ''
        @teacher = Teacher.find(device_reg_params[:teacher_id])
        @user = User.where(username: @teacher.contact).last

        respond_to do |f|
          if @user
            if @user.device_id == nil || @user.device_id != device_reg_params[:device_id]
              @user.update(device_id: device_reg_params[:device_id])
                f.json {render json: {success: 'Device id updated.'}}
            else
              f.json {render json: {error: 'Device id was updated already.'} }
            end
          else
            f.json {render json: {error: 'User not found.'}}
          end
        end
      else
        respond_to do |f|
          f.json {render json: {error: 'Related user not found.'}}
        end
      end
    end


    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    def device_reg_params
      params.permit(:parent_id, :device_id, :user_type, :teacher_id)
    end
  end
end