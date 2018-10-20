module Api
  class PostsController < Api::ApiController
    before_action :set_post, only: [:show]

    # GET /posts
    # GET /posts.json
    def index
      @posts = Post.all.order("created_at DESC")
    end

    def create
      @post = Post.new(post_params)
      ext = %w[.jpg .jpeg .gif .png .pdf .svg .docs .docx .xls]

      respond_to do |format|
        # unless params[:post_attachments].blank?
        #   params[:post_attachments]['attachment_path'].each do |a|
        #
        #   end
        # end

        if @post.save
          unless params[:post_attachments].blank?
            puts " Data: #{params[:post_attachments]['attachment_path']}"
            params[:post_attachments]['attachment_path'].each do |a|
              puts "single: #{params[:post_attachments]['attachment_path'][a]}"
              # decoded = Base64.decode64(a.to_s)
              # # decoded = FilelessIO.new(decoded)
              # a  = decoded
              io = StringIO.new(Base64.decode64(params[:post_attachments]['attachment_path'][a]))
              def io.original_filename; "pic.jpg"; end
              @post_attachment = @post.post_attachments.create!(attachment_path: io)
            end
          end
          # format.html { redirect_to post_path(@post), notice: 'Post was successfully created.' }
          format.json { render json: { success: "success" } }
        else
          # format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # GET /posts/1
    # GET /posts/1.json
    def show
      @post_attachments = @post.post_attachments.all
    end

    def gallery
      @posts = Post.all.order("created_at DESC")
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:title, :description, post_attachments_attributes: [:id, :post_id, :attachment_path])
      end
  end
end
