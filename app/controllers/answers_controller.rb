class AnswersController < ApplicationController
	before_action :set_question
	before_action :set_answer, only: [:edit, :update, :destroy]

	def new
		@answer = Answer.new
	end

	def create
		@answer = Answer.new(answer_params)
		@answer.question = @question
		@answer.user = current_user
		@answer.save
		js_modal_refresh
	end

	def edit
	end

	def update
		if @answer.update(answer_params)
			redirect_to question_path(@question)
		else
			render :edit
		end
	end

	def destroy
		@answer.destroy
		js_modal_refresh
	end

	private

	def answer_params
		params.require(:answer).permit(:content)
	end

	def set_question
		@question = Question.find(params[:question_id])
	end

	def set_answer
		@answer = Answer.find(params[:id])
	end

	def js_modal_refresh
		respond_to do |format|
			format.js {render layout: false, partial: 'questions/show'}
		end
	end
end
