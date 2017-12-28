class TimeTablesController < ApplicationController
  before_action :set_time_table, only: [:show, :edit, :update, :destroy]
  before_action :set_required

  # GET /time_tables
  # GET /time_tables.json
  def index
    if params[:standard_id] || params[:division]
      @time_tables = TimeTable.where(:standard_id => params[:standard_id], :division => params[:division])
    end
    @time_table_setting = TimeTableSetting.last
  end

  # GET /time_tables/1
  # GET /time_tables/1.json
  def show
  end

  # GET /time_tables/new
  def new
    @time_table = TimeTable.new
  end

  # GET /time_tables/1/edit
  def edit
  end

  # POST /time_tables
  # POST /time_tables.json
  def create
    @time_table = TimeTable.new(time_table_params)
    
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @time_table.save
        format.html { redirect_to session.delete(:return_to), notice: 'Time table was successfully created.' }
        format.json { render :show, status: :created, location: @time_table }
      else
        format.html { render :new }
        format.json { render json: @time_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_tables/1
  # PATCH/PUT /time_tables/1.json
  def update
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    
    respond_to do |format|
      if @time_table.update(time_table_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Time table was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_table }
      else
        format.html { render :edit }
        format.json { render json: @time_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_tables/1
  # DELETE /time_tables/1.json
  def destroy
    @time_table.destroy
    respond_to do |format|
      format.html { redirect_to time_tables_url, notice: 'Time table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def get_subjects
    @teacher = Teacher.find(params[:teacher_id])
    @subjects = @teacher.subjects
    @filtered_subjects = true
  end
  
  def get_divisions
    @standard = Standard.find(params[:standard_id])
    letter = '@'
    no_of_divisions = @standard.no_of_divisions.to_i
    @divisions = Array.new
    while no_of_divisions > 0
      @divisions.push(letter.next)
      
      letter = letter.next
      no_of_divisions -= 1
    end
    @filtered_divisions = true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_table
      @time_table = TimeTable.find(params[:id])
    end

    def set_required
      @standard = Standard.all
      @teachers = Teacher.all
      @subjects = @time_table.nil? ? @teachers.first.subjects : @time_table.teacher.subjects
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_table_params
      params.require(:time_table).permit(:standard_id, :division, :day, :start_time, :end_time, :teacher_id, :subject, :color)
    end
end
