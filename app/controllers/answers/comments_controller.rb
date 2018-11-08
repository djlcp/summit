module answers 
	class CommentsController < ApplicationController
		before_action :find_answer
		before_action :find_question

		def new
			@comment = Comment.new
		end

		def create
			@comment = Comment.new(comment_params)
			@comment.post = @answer
			@comment.save
			redirect_to question_answer_path(@question, @answer)
		end


		private

		def find_answers
			@answer = Answer.find(params[:answer_id])
		end

		def find_question
			@question = @answer.question 
		end

		def comment_params
			params.require(:comment).permit(:content)
		end

	end
end
