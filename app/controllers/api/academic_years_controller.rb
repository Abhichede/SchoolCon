module Api
  class AcademicYearsController < Api::ApiController
    before_action :set_academic_year, only: [:show]

    # GET /academic_years
    # GET /academic_years.json
    def index
      @academic_years = AcademicYear.all
    end

    # GET /academic_years/1
    # GET /academic_years/1.json
    def show
    end

    def get_current_academic_year
      @academic_year = AcademicYear.find_by_is_active(true)
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_academic_year
        @academic_year = AcademicYear.find(params[:id])
      end
  end
end