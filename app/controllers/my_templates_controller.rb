class MyTemplatesController < ApplicationController
  before_action :set_my_template, only: [:show, :edit, :update, :destroy]

  # GET /my_templates
  # GET /my_templates.json
  def index
    @my_templates = MyTemplate.all
  end

  # GET /my_templates/1
  # GET /my_templates/1.json
  def show
  end

  # GET /my_templates/new
  def new
    @my_template = MyTemplate.new
  end

  # GET /my_templates/1/edit
  def edit
  end

  # POST /my_templates
  # POST /my_templates.json
  def create
    @my_template = MyTemplate.new(my_template_params)

    respond_to do |format|
      if @my_template.save
        format.html { redirect_to @my_template, notice: 'My template was successfully created.' }
        format.json { render :show, status: :created, location: @my_template }
      else
        format.html { render :new }
        format.json { render json: @my_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_templates/1
  # PATCH/PUT /my_templates/1.json
  def update
    respond_to do |format|
      if @my_template.update(my_template_params)
        format.html { redirect_to @my_template, notice: 'My template was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_template }
      else
        format.html { render :edit }
        format.json { render json: @my_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_templates/1
  # DELETE /my_templates/1.json
  def destroy
    @my_template.destroy
    respond_to do |format|
      format.html { redirect_to my_templates_url, notice: 'My template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_template
      @my_template = MyTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_template_params
      params.require(:my_template).permit(:name, :desc)
    end
end
