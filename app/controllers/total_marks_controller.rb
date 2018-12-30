class TotalMarksController < ApplicationController
  before_action :set_total_mark, only: [:show, :edit, :update, :destroy]

  # GET /total_marks
  # GET /total_marks.json
  def index
    @total_marks = TotalMark.all
  end

  # GET /total_marks/1
  # GET /total_marks/1.json
  def show
  end

  # GET /total_marks/new
  def new
    @total_mark = TotalMark.new
  end

  # GET /total_marks/1/edit
  def edit
  end

  # POST /total_marks
  # POST /total_marks.json
  def create
    @total_mark = TotalMark.new(total_mark_params)

    respond_to do |format|
      if @total_mark.save
        format.html { redirect_to @total_mark, notice: 'Total mark was successfully created.' }
        format.json { render :show, status: :created, location: @total_mark }
      else
        format.html { render :new }
        format.json { render json: @total_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /total_marks/1
  # PATCH/PUT /total_marks/1.json
  def update
    respond_to do |format|
      if @total_mark.update(total_mark_params)
        format.html { redirect_to @total_mark, notice: 'Total mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @total_mark }
      else
        format.html { render :edit }
        format.json { render json: @total_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /total_marks/1
  # DELETE /total_marks/1.json
  def destroy
    @total_mark.destroy
    respond_to do |format|
      format.html { redirect_to total_marks_url, notice: 'Total mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_total_mark
      @total_mark = TotalMark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def total_mark_params
      params.require(:total_mark).permit(:exam_term_id, :exam_id, :written_marks, :assessment_marks)
    end
end
