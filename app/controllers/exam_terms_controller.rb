class ExamTermsController < ApplicationController
  before_action :set_exam_term, only: [:show, :edit, :update, :destroy]

  # GET /exam_terms
  # GET /exam_terms.json
  def index
    @exam_terms = ExamTerm.all
  end

  # GET /exam_terms/1
  # GET /exam_terms/1.json
  def show
  end

  # GET /exam_terms/new
  def new
    @exam_term = ExamTerm.new
  end

  # GET /exam_terms/1/edit
  def edit
  end

  # POST /exam_terms
  # POST /exam_terms.json
  def create
    @exam_term = ExamTerm.new(exam_term_params)

    respond_to do |format|
      if @exam_term.save
        format.html { redirect_to @exam_term, notice: 'Exam term was successfully created.' }
        format.json { render :show, status: :created, location: @exam_term }
      else
        format.html { render :new }
        format.json { render json: @exam_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_terms/1
  # PATCH/PUT /exam_terms/1.json
  def update
    respond_to do |format|
      if @exam_term.update(exam_term_params)
        format.html { redirect_to @exam_term, notice: 'Exam term was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_term }
      else
        format.html { render :edit }
        format.json { render json: @exam_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_terms/1
  # DELETE /exam_terms/1.json
  def destroy
    @exam_term.destroy
    respond_to do |format|
      format.html { redirect_to exam_terms_url, notice: 'Exam term was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_term
      @exam_term = ExamTerm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_term_params
      params.require(:exam_term).permit(:term_name, :start_date, :end_date)
    end
end
