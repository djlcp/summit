class Answers::VotesController < VotesController
	before_action :authenticate_user!
	before_action :set_post




	private

	def set_post
		@post = Answer.find(params[:answer_id])
		@question = @post.question
	end

end