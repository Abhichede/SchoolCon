class ReligionsController < ApplicationController
  before_action :set_religion, only: [:show, :edit, :update, :destroy]

  # GET /religions
  # GET /religions.json
  def index
    @religions = Religion.all
  end

  # GET /religions/1
  # GET /religions/1.json
  def show
  end

  # GET /religions/new
  def new
    @religion = Religion.new
  end

  # GET /religions/1/edit
  def edit
  end

  # POST /religions
  # POST /religions.json
  def create
    @religion = Religion.new(religion_params)

    respond_to do |format|
      if @religion.save
        format.html { redirect_to @religion, notice: 'Religion was successfully created.' }
        format.json { render :show, status: :created, location: @religion }
      else
        format.html { render :new }
        format.json { render json: @religion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /religions/1
  # PATCH/PUT /religions/1.json
  def update
    respond_to do |format|
      if @religion.update(religion_params)
        format.html { redirect_to @religion, notice: 'Religion was successfully updated.' }
        format.json { render :show, status: :ok, location: @religion }
      else
        format.html { render :edit }
        format.json { render json: @religion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /religions/1
  # DELETE /religions/1.json
  def destroy
    @religion.destroy
    respond_to do |format|
      format.html { redirect_to religions_url, notice: 'Religion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_religion
      @religion = Religion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def religion_params
      params.require(:religion).permit(:name)
    end
end
