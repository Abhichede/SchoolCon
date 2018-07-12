module Api
  class DivisionsController < Api::ApiController
    before_action :set_division, only: [:show]

    # GET /divisions
    # GET /divisions.json
    def index
      if params[:standard_id]
        @standard = Standard.find(params[:standard_id])
        @divisions = @standard.divisions
      else
        @divisions = Division.all
      end
    end

    # GET /divisions/1
    # GET /divisions/1.json
    def show
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_division
        @division = Division.find(params[:id])
      end
  end
end