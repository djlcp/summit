class QuestionsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_question, only: [:show, :edit, :update, :destroy]

	def index 
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def show
	end

	def edit
	end

	def create
		@question = Question.new(question_params)
		@question.user = current_user
		redirect_to questions_path
		@question.save
	end

	def update
	    if @question.update(question_params)
          redirect_to @question
        else
          render :edit
        end
	end

	def destroy
		@question.destroy
		redirect_to root_path
	end

	private

	def question_params
		params.require(:question).permit(:title, :content)
	end

	def set_question
		@question = Question.find(params[:id])
	end

end
