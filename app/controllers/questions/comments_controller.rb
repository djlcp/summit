module Questions 
	class CommentsController < ApplicationController
		before_action :find_question

		def new
			@comment = Comment.new
		end

		def create
			@comment = Comment.new(comment_params)
			@comment.post = @question 
			@comment.save
			redirect_to @question 
		end


		private

		def find_question
			@question = Question.find(params[:question_id])
		end

		def comment_params
			params.require(:comment).permit(:content)
		end

	end
end
