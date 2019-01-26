class ExamMarksController < ApplicationController
  before_action :set_exam_mark, only: [:show, :edit, :update, :destroy]

  # GET /exam_marks
  # GET /exam_marks.json
  def index
    @exam_marks = ExamMark.all
  end

  # GET /exam_marks/1
  # GET /exam_marks/1.json
  def show
  end

  # GET /exam_marks/new
  def new
    @exam_mark = ExamMark.new
  end

  # GET /exam_marks/1/edit
  def edit
  end

  # POST /exam_marks
  # POST /exam_marks.json
  def create
    @exam_mark = ExamMark.new(exam_mark_params)

    respond_to do |format|
      if @exam_mark.save
        format.html { redirect_to @exam_mark, notice: 'Exam mark was successfully created.' }
        format.json { render :show, status: :created, location: @exam_mark }
      else
        format.html { render :new }
        format.json { render json: @exam_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_marks/1
  # PATCH/PUT /exam_marks/1.json
  def update
    respond_to do |format|
      if @exam_mark.update(exam_mark_params)
        format.html { redirect_to @exam_mark, notice: 'Exam mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_mark }
      else
        format.html { render :edit }
        format.json { render json: @exam_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_marks/1
  # DELETE /exam_marks/1.json
  def destroy
    @exam_mark.destroy
    respond_to do |format|
      format.html { redirect_to exam_marks_url, notice: 'Exam mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_mark
      @exam_mark = ExamMark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_mark_params
      params.require(:exam_mark).permit(:student_id, :exam_id, :exam_subject_id, :written_marks, :assessment_marks)
    end
end
