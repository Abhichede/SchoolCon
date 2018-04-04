class StandardsController < ApplicationController
  before_action :set_standard, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  add_breadcrumb 'Standards', :standards_path
  # GET /standards
  # GET /standards.json
  def index
    @standards = Standard.all
  end

  # GET /standards/1
  # GET /standards/1.json
  def show
    
  end

  # GET /standards/new
  def new
    @standard = Standard.new
  end

  # GET /standards/1/edit
  def edit
  end

  # POST /standards
  # POST /standards.json
  def create
    @standard = Standard.new(standard_params)

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @standard.save
        format.html { redirect_to session.delete(:return_to), notice: 'Standard was successfully created.' }
        format.json { render :show, status: :created, location: @standard }
      else
        format.html { render :new }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /standards/1
  # PATCH/PUT /standards/1.json
  def update

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @standard.update(standard_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Standard was successfully updated.' }
        format.json { render :show, status: :ok, location: @standard }
      else
        format.html { render :edit }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /standards/1
  # DELETE /standards/1.json
  def destroy
    @standard.destroy
    respond_to do |format|
      format.html { redirect_to standards_url, notice: 'Standard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_assign_subject
    @standards = Standard.all
  end

  def assign_subjects
    @standard = Standard.find(params[:standard_id])
    respond_to do |format|
      if @standard.update(subject_ids: params[:subject_ids])
        format.html { redirect_to new_assign_subject_path, notice: 'Standard was successfully updated.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard
      @standard = Standard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standard_params
      params.require(:standard).permit(:name, :desc)
    end
end
