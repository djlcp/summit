module Questions 
	class CommentsController < ApplicationController
		before_action :authenticate_user!
		before_action :find_question
		before_action :set_comment, only: [:edit, :update, :destroy]

		def new
			@comment = Comment.new
		end

		def create
			@comment = Comment.new(comment_params)
			@comment.post = @question 
			@comment.user = current_user
			@comment.save
			@question.users.each do |user|
				Notification.create(recipient: user, actor: current_user, action: 'commented on', notifiable: @question)
			end
			js_modal_refresh
		end

		def edit
		end

		def update
			@comment.update(comment_params)
			@question.users.each do |user|
				Notification.create(recipient: user, actor: current_user, action: 'updated their comment on', notifiable: @question)
			end
			js_modal_refresh
		end

		def destroy
			@comment.destroy
			js_modal_refresh
		end

		private

		def find_question
			@question = Question.find(params[:question_id])
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
