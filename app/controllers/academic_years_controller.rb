class AcademicYearsController < ApplicationController
  before_action :set_academic_year, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource
  add_breadcrumb 'Academic years', :academic_years_path

  # GET /academic_years
  # GET /academic_years.json
  def index
    @academic_years = AcademicYear.all
  end

  # GET /academic_years/1
  # GET /academic_years/1.json
  def show
  end

  # GET /academic_years/new
  def new
    @academic_year = AcademicYear.new
  end

  # GET /academic_years/1/edit
  def edit
  end

  # POST /academic_years
  # POST /academic_years.json
  def create
    @academic_year = AcademicYear.new(academic_year_params)

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @academic_year.save
        if @academic_year.is_active
          AcademicYear.all.each do |year|
            if year != @academic_year
              year.update(is_active: false)
            end
          end
        end
        format.html { redirect_to session.delete(:return_to), notice: 'Academic year was successfully created.' }
        format.json { render :show, status: :created, location: @academic_year }
      else
        format.html { render :new }
        format.json { render json: @academic_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_years/1
  # PATCH/PUT /academic_years/1.json
  def update
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @academic_year.update(academic_year_params)
        if @academic_year.is_active
          AcademicYear.all.each do |year|
            if year != @academic_year
              year.update(is_active: false)
            end
          end
        end
        format.html { redirect_to session.delete(:return_to), notice: 'Academic year was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_year }
      else
        format.html { render :edit }
        format.json { render json: @academic_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_years/1
  # DELETE /academic_years/1.json
  def destroy
    if @academic_year.is_active
      AcademicYear.last.update(is_active: true)
    end
    @academic_year.destroy
    respond_to do |format|
      format.html { redirect_to academic_years_url, notice: 'Academic year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_year
      @academic_year = AcademicYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_year_params
      params.require(:academic_year).permit(:start_month, :start_year, :end_month, :end_year, :is_active)
    end
end
