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
		@question.users.each do |user|
			Notification.create(recipient: user, actor: current_user, action: "posted an answer to ", notifiable: @question)
		end
		js_modal_refresh
	end

	def edit
		respond_to do |format|
			format.js {render layout: false, partial: 'answers/edit'}
		end
	end

	def update
		@answer.update(answer_params)
		@question.users.each do |user|
			Notification.create(recipient: user, actor: current_user, action: 'edited their answer to', notifiable: @question)
		end
		js_modal_refresh
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
