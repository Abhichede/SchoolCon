module Api
  class SubjectsController < Api::ApiController
    before_action :set_subject, only: [:show]
    # GET /subjects
    # GET /subjects.json
    def index
      if params[:teacher_id]
        @teacher = Teacher.find(params[:teacher_id])
        @subjects = @teacher.subjects
      elsif params[:standard_id]
        @standard = Standard.find(params[:standard_id])
        @subjects = @standard.subjects
      else
        @subjects = Subject.all
      end
    end

    # GET /subjects/1
    # GET /subjects/1.json
    def show
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_subject
        @subject = Subject.find(params[:id])
      end
  end
end