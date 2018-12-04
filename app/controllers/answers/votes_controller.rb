class Answers::VotesController < VotesController
	before_action :set_post




	private

	def set_post
		@post = Answer.find(params[:answer_id])
	end

end