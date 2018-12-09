class QuestionsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_question, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index 
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def show
		js_modal_refresh
	end

	def edit
		respond_to do |format|
			format.js {render layout: false, partial: 'questions/edit'}
		end
	end

	def create
		@question = Question.new(question_params)
		@question.user = current_user
		@question.save
		redirect_to questions_path
	end

	def update
	    @question.update(question_params)
	    js_modal_refresh
	end

	def destroy
		@question.destroy
		redirect_to questions_path
	end

	private

	def question_params
		params.require(:question).permit(:title, :content)
	end

	def set_question
		@question = Question.find(params[:id])
	end

	def js_modal_refresh
		respond_to do |format|
			format.html {redirect_to questions_path}
			format.js {render layout: false, partial: 'questions/show'}
		end
	end

end
