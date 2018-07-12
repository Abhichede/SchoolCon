module Api
  class StandardsController < ApplicationController
    before_action :set_standard, only: [:show]
    # GET /standards
    # GET /standards.json
    def index
      @standards = Standard.all
    end

    # GET /standards/1
    # GET /standards/1.json
    def show

    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_standard
        @standard = Standard.find(params[:id])
      end
  end
end