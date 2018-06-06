module Api
  class PostsController < Api::ApiController
    before_action :set_post, only: [:show]

    # GET /posts
    # GET /posts.json
    def index
      @posts = Post.all
    end

    # GET /posts/1
    # GET /posts/1.json
    def show
      @post_attachments = @post.post_attachments.all
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end
  end
end
