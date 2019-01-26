class ExamSubjectsController < ApplicationController
  before_action :set_exam_subject, only: [:show, :edit, :update, :destroy]

  # GET /exam_subjects
  # GET /exam_subjects.json
  def index
    @exam_subjects = ExamSubject.all
  end

  # GET /exam_subjects/1
  # GET /exam_subjects/1.json
  def show
  end

  # GET /exam_subjects/new
  def new
    @exam = Exam.find(params[:exam_id])
    @exam_subjects = @exam.exam_subjects.build
  end

  # GET /exam_subjects/1/edit
  def edit
  end

  # POST /exam_subjects
  # POST /exam_subjects.json
  def create
    respond_to do |format|
      if ExamSubject.create(exam_subject_params[:exam_subject])
        format.html { redirect_to exams_path, notice: 'Exam marks saved.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /exam_subjects/1
  # PATCH/PUT /exam_subjects/1.json
  def update
    respond_to do |format|
      if @exam_subject.update(exam_subject_params)
        format.html { redirect_to @exam_subject, notice: 'Exam subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_subject }
      else
        format.html { render :edit }
        format.json { render json: @exam_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_subjects/1
  # DELETE /exam_subjects/1.json
  def destroy
    @exam_subject.destroy
    respond_to do |format|
      format.html { redirect_to exam_subjects_url, notice: 'Exam subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_subject
      @exam_subject = ExamSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_subject_params
      params.require(:exam_subject).permit({ exam_subject: [:subject_id, :exam_id, :max_marks, :pass_marks, :written_marks, :assessment_marks]})
    end
end
