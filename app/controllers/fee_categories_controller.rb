class FeeCategoriesController < ApplicationController
  before_action :set_fee_category, only: [:show, :edit, :update, :destroy]

  # GET /fee_categories
  # GET /fee_categories.json
  def index
    @fee_categories = FeeCategory.all
  end

  # GET /fee_categories/1
  # GET /fee_categories/1.json
  def show
  end

  # GET /fee_categories/new
  def new
    @fee_category = FeeCategory.new
  end

  # GET /fee_categories/1/edit
  def edit
  end

  # POST /fee_categories
  # POST /fee_categories.json
  def create
    @fee_category = FeeCategory.new(fee_category_params)

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @fee_category.save
        format.html { redirect_to session.delete(:return_to), notice: 'Fee category was successfully created.' }
        format.json { render :show, status: :created, location: @fee_category }
      else
        format.html { render :new }
        format.json { render json: @fee_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fee_categories/1
  # PATCH/PUT /fee_categories/1.json
  def update

    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @fee_category.update(fee_category_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Fee category was successfully updated.' }
        format.json { render :show, status: :ok, location: @fee_category }
      else
        format.html { render :edit }
        format.json { render json: @fee_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fee_categories/1
  # DELETE /fee_categories/1.json
  def destroy
    @fee_category.destroy
    respond_to do |format|
      format.html { redirect_to fee_categories_url, notice: 'Fee category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee_category
      @fee_category = FeeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_category_params
      params.require(:fee_category).permit(:name, :standard_id, :amount)
    end
end
