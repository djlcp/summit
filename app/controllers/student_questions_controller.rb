class StudentQuestionsController < ApplicationController
	before_action :set_question, only: [:show, :edit, :update, :destroy]

	# GET /questions
  	# GET /questions.json
  	def index
    	@questions = Question.all
    	
  	end


	# GET /questions/new
	def create
		@question = Question.new
	end



  
  	# GET /questions/1
  	# GET /questions/1.json
  	def show
  	end

  	# GET /questions/new
  	def new
    	@post = Post.new
  	end

  	# GET /questions/1/edit
  	def edit
  	end

  	# PATCH/PUT /questions/1
  	# PATCH/PUT /questions/1.json
  	def update
    	respond_to do |format|
      		if @question.update(question_params)
        		format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        		format.json { render :show, status: :ok, location: @question }
      		else
        		format.html { render :edit }
        		format.json { render json: @question.errors, status: :unprocessable_entity }
      		end
    	end
  	end

  	# DELETE /posts/1
  	# DELETE /posts/1.json
  	def destroy
    	@question.destroy
    		respond_to do |format|
      			format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      			format.json { head :no_content }
    		end
  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :comment)
    end
end

	


	


