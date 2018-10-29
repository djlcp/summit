class CommentController < ApplicationController
	before_action :set_post, only: [ :create, :edit, :update, :destroy]
	

	def index
    	@comments = Comment.all
	end

  	def show
  	end

  	def new
    	@comment = Comment.new
  	end

  	def edit
  	end


	def create
    	@comment = @post.comments.new(comment_params)
  	end

  	private
  	# Use callbacks to share common setup or constraints between actions.
  	def set_post
      @post = Post.find(params[:post_id])
    end

  	# Never trust parameters from the scary internet, only allow the white list through.
  	def comment_params
    	params.require(:comment).permit(:text )
  	end
end







end
