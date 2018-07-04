module Api
  class TimeTablesController < Api::ApiController

    def index
      if params[:standard_id] && params[:division_id]
        @standard = Standard.find(params[:standard_id])
        @division = @standard.divisions.find(params[:division_id])

        @time_tables = @standard.time_tables.where(division: @division.name)
      else
        @time_tables = TimeTable.all
      end
    end
  end
end