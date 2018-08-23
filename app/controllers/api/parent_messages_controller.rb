module Api
  class ParentMessagesController < Api::ApiController
    before_action :set_parent_message, only: [:show, :edit, :update, :destroy]

    # GET /parent_messages
    # GET /parent_messages.json
    def index
      if params[:student_id] && params[:teacher_id]
        @parent_messages = ParentMessage.where(student_id: params[:student_id], teacher_id: params[:teacher_id]).order("created_at DESC")
      elsif params[:student_id]
        @parent_messages = Student.find(params[:student_id]).parent_messages.order("created_at DESC")
      else
        @parent_messages = ParentMessage.all.order("created_at DESC")
      end
    end

    # GET /parent_messages/1
    # GET /parent_messages/1.json
    def show
    end

    # GET /parent_messages/new
    def new
      @parent_message = ParentMessage.new
    end

    # GET /parent_messages/1/edit
    def edit
    end

    # POST /parent_messages
    # POST /parent_messages.json
    def create
      @parent_message = ParentMessage.new(parent_message_params)
      @parent_message.save

      # respond_to do |format|
      #   if @parent_message.save
      #     format.html { redirect_to @parent_message, notice: 'Parent message was successfully created.' }
      #     format.json { render :show, status: :created, location: @parent_message }
      #   else
      #     format.html { render :new }
      #     format.json { render json: @parent_message.errors, status: :unprocessable_entity }
      #   end
      # end
    end

    # PATCH/PUT /parent_messages/1
    # PATCH/PUT /parent_messages/1.json
    def update
      respond_to do |format|
        if @parent_message.update(parent_message_params)
          format.html { redirect_to @parent_message, notice: 'Parent message was successfully updated.' }
          format.json { render :show, status: :ok, location: @parent_message }
        else
          format.html { render :edit }
          format.json { render json: @parent_message.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /parent_messages/1
    # DELETE /parent_messages/1.json
    def destroy
      @parent_message.destroy
      respond_to do |format|
        format.html { redirect_to parent_messages_url, notice: 'Parent message was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_parent_message
        @parent_message = ParentMessage.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def parent_message_params
        params.require(:parent_message).permit(:student_id, :teacher_id, :message)
      end
  end
end