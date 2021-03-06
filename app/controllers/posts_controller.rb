class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'Posts/News', :posts_path
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

  # GET /posts/new
  def new
    @post = Post.new
    @post_attachment = @post.post_attachments.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
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
          params[:post_attachments]['attachment_path'].each do |a|
            if ext.include? File.extname(a.original_filename)
              @post_attachment = @post.post_attachments.create!(attachment_path: a)
            else
              @post.destroy
              format.html { redirect_to new_post_url, alert: "File extension #{File.extname(a.original_filename)} is not allowed." }
              break
            end
          end
        end
        format.html { redirect_to post_path(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
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
