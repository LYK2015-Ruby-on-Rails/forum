class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :set_topic, only: [:new, :create, :show, :destroy]

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(post_params)
		@post.update_attributes(topic_id: @topic.id)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @topic, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @topic, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_topic
    	@topic = Topic.friendly.find(params[:topic_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content)
    end
end
