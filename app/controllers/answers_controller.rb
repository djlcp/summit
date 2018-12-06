class AnswersController < ApplicationController
	before_action :authenticate_user!
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
		redirect_to question_path(@question)
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
		redirect_to question_path(@question)
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
end
