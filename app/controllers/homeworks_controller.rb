class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]

  # GET /homeworks
  # GET /homeworks.json
  def index
    @homeworks = Homework.all
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
  end

  # GET /homeworks/new
  def new
    @homework = Homework.new
  end

  # GET /homeworks/1/edit
  def edit
  end

  # POST /homeworks
  # POST /homeworks.json
  def create
    @homework = Homework.new(homework_params)

    @division = Division.find(homework_params[:division_id])

    device_ids = []
    @division.students.each do |student|
      @user = User.where(username: student.father_mobile).last

      unless @user.nil?
        unless device_ids.include?(@user.device_id)
          device_ids << @user.device_id
        end
      end
    end

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @homework.save

        require 'fcm'
        fcm = FCM.new(ENV['FCM_SERVER_KEY'])
        # fcm = init_fcm
        options = {
            priority: "high",
            collapse_key: "updated_score",
            notification: {
                title: "New Homework",
                body: @homework.name
            }
        }
        response = fcm.send(device_ids, options)

        puts response

        format.html { redirect_to session.delete(:return_to), notice: 'Homework was successfully created.' }
        format.json { render :show, status: :created, location: @homework }
      else
        format.html { render :new }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    respond_to do |format|
      if @homework.update(homework_params)
        format.html { redirect_to standard_path(@homework.standard), notice: 'Homework was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework }
      else
        format.html { render :edit }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    @homework.destroy
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to), notice: 'Homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homework_params
      params.require(:homework).permit(:name, :description, :standard_id, :attachment, :division_id, :date)
    end
end
