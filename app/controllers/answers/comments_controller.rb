module Answers 
	class CommentsController < ApplicationController
		before_action :authenticate_user!
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
			js_modal_refresh
		end

		def edit
		end

		def update
			@comment.update(comment_params)
			js_modal_refresh
		end

		def destroy
			@comment.destroy
			js_modal_refresh
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

		def js_modal_refresh
			respond_to do |format|
				format.js {render layout: false, partial: 'questions/show'}
			end
		end

	end
end
