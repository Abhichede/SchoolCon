module Api
  class LeaveApplicationsController < Api::ApiController
    before_action :set_leave_application, only: [:show, :edit, :update, :destroy, :update_status]

    # GET /leave_applications
    # GET /leave_applications.json
    def index
      if params[:student_id]
        @student = Student.find(params[:student_id])
        @leave_applications = @student.leave_applications.order("created_at DESC")
      else
        @leave_applications = LeaveApplication.all
      end

    end

    # GET /leave_applications/1
    # GET /leave_applications/1.json
    def show
    end

    # GET /leave_applications/new
    def new
      @leave_application = LeaveApplication.new
    end

    # GET /leave_applications/1/edit
    def edit
    end

    # POST /leave_applications
    # POST /leave_applications.json
    def create
      @leave_application = LeaveApplication.new(leave_application_params)
      @student = Student.find(leave_application_params[:student_id])
      @classteacher = @student.divisions.last.class_teacher

      @leave_application.save
      unless @classteacher.nil?
        @leave_application.update(teacher_id: @classteacher.teacher.id)
      end


      # respond_to do |format|
      #   if @leave_application.save
      #     format.html { redirect_to @leave_application, notice: 'Leave application was successfully created.' }
      #     format.json { render :show, status: :created, location: @leave_application }
      #   else
      #     format.html { render :new }
      #     format.json { render json: @leave_application.errors, status: :unprocessable_entity }
      #   end
      # end
    end

    def update_status
      respond_to do |format|
        if @leave_application.update(is_approved: params[:is_approved])
          format.json { render json: { success: 'Status updated.' } }
        else
          format.json { render json: { error: 'Error while updating.' } }
        end
      end
    end

    # PATCH/PUT /leave_applications/1
    # PATCH/PUT /leave_applications/1.json
    def update
      respond_to do |format|
        if @leave_application.update(leave_application_params)
          format.html { redirect_to @leave_application, notice: 'Leave application was successfully updated.' }
          format.json { render :show, status: :ok, location: @leave_application }
        else
          format.html { render :edit }
          format.json { render json: @leave_application.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /leave_applications/1
    # DELETE /leave_applications/1.json
    def destroy
      @leave_application.destroy
      respond_to do |format|
        format.html { redirect_to leave_applications_url, notice: 'Leave application was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_leave_application
        @leave_application = LeaveApplication.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def leave_application_params
        params.require(:leave_application).permit(:subject, :message, :is_approved, :seen_date, :teacher_id, :student_id)
      end
  end
end