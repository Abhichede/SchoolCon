module Api
  class HolidaysController < Api::ApiController
    def index
      @holidays = Holiday.all
    end
  end
end
