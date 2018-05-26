module Api
  class ParentsController < Api::ApiController
    before_action :set_parent, only: %i[show]

    def index
      @parents = Parent.all
    end


    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end
  end
end