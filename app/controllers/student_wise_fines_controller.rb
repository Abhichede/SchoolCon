class StudentWiseFinesController < ApplicationController
  before_action :set_student_wise_fine, only: [:show, :edit, :update, :destroy]

  # GET /student_wise_fines
  # GET /student_wise_fines.json
  def index
    @student_wise_fines = StudentWiseFine.all
  end

  # GET /student_wise_fines/1
  # GET /student_wise_fines/1.json
  def show
  end

  # GET /student_wise_fines/new
  def new
    @student_wise_fine = StudentWiseFine.new
  end

  # GET /student_wise_fines/1/edit
  def edit
  end

  # POST /student_wise_fines
  # POST /student_wise_fines.json
  def create
    @student_wise_fine = StudentWiseFine.new(student_wise_fine_params)

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @student_wise_fine.save
        format.html { redirect_to session.delete(:return_to), notice: 'Student wise fine was successfully created.' }
        format.json { render :show, status: :created, location: @student_wise_fine }
      else
        format.html { render :new }
        format.json { render json: @student_wise_fine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_wise_fines/1
  # PATCH/PUT /student_wise_fines/1.json
  def update
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @student_wise_fine.update(student_wise_fine_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Student wise fine was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_wise_fine }
      else
        format.html { render :edit }
        format.json { render json: @student_wise_fine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_wise_fines/1
  # DELETE /student_wise_fines/1.json
  def destroy

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    @student_wise_fine.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to), notice: 'Student wise fine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_wise_fine
      @student_wise_fine = StudentWiseFine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_wise_fine_params
      params.require(:student_wise_fine).permit(:student_id, :academic_year_id, :desciption, :amount)
    end
end
