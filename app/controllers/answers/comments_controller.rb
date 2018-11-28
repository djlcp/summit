module Answers 
	class CommentsController < ApplicationController
		before_action :find_answer
		before_action :find_question
		before_action :set_comment, only: [:edit, :update, :destroy]

		def new
			@comment = Comment.new
		end

		def create
			@comment = Comment.new(comment_params)
			@comment.post = @answer
			@comment.user = current_user
			@comment.save
			redirect_to question_path(@question)
		end

		def edit
		end

		def update
			if @comment.update(comment_params)
				redirect_to question_path(@question)
			else
				render :edit
			end
		end

		def destroy
			@comment.destroy
			redirect_to question_path(@question)
		end


		private

		def find_answer
			@answer = Answer.find(params[:answer_id])
		end

		def find_question
			@question = @answer.question 
		end

		def set_comment
			@comment = Comment.find(params[:id])
		end

		def comment_params
			params.require(:comment).permit(:content)
		end

	end
end
