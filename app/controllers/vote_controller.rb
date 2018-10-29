class VoteController < ApplicationController
	before_action :set_comment, only: [ :create, :edit, :update, :destroy]
	
	def index
    	@votes = Vote.all
	end

  	def show
  	end

  	def new
    	@vote = Vote.new
  	end

  	def edit
  	end


	def create
    	@vote = @comment.votes.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @post, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { redirect_to @post, notice: 'Vote was not created.' }
    
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  	private
  	# Use callbacks to share common setup or constraints between actions.
  	def set_comment
      @comment = Comment.find(params[:comment_id])
    end

  	# Never trust parameters from the scary internet, only allow the white list through.
  	def vote_params
    	params.require(:vote).permit(:text )
  	end


end
