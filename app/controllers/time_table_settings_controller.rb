class TimeTableSettingsController < ApplicationController
  before_action :set_time_table_setting, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /time_table_settings
  # GET /time_table_settings.json
  def index
    @time_table_settings = TimeTableSetting.all
  end

  # GET /time_table_settings/1
  # GET /time_table_settings/1.json
  def show
  end

  # GET /time_table_settings/new
  def new
    @time_table_setting = TimeTableSetting.new
  end

  # GET /time_table_settings/1/edit
  def edit
  end

  # POST /time_table_settings
  # POST /time_table_settings.json
  def create
    @time_table_setting = TimeTableSetting.new(time_table_setting_params)
    
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @time_table_setting.save
        format.html { redirect_to session.delete(:return_to), notice: 'Time table setting was successfully created.' }
        format.json { render :show, status: :created, location: @time_table_setting }
      else
        format.html { render :new }
        format.json { render json: @time_table_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_table_settings/1
  # PATCH/PUT /time_table_settings/1.json
  def update
    @timetables = TimeTable.all

    @timetables.each do |t|
      t.destroy
    end

    session.delete(:return_to)
    session[:return_to] ||= request.referer
    respond_to do |format|
      if @time_table_setting.update(time_table_setting_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Time table setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_table_setting }
      else
        format.html { render :edit }
        format.json { render json: @time_table_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_table_settings/1
  # DELETE /time_table_settings/1.json
  def destroy
    @time_table_setting.destroy
    respond_to do |format|
      format.html { redirect_to time_table_settings_url, notice: 'Time table setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_table_setting
      @time_table_setting = TimeTableSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_table_setting_params
      params.require(:time_table_setting).permit(:school_start, :school_end, :period_duration, :num_breaks, :break_durations, :breaks_after)
    end
end
