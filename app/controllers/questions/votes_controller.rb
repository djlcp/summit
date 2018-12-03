class Questions::VotesController < VotesController
	before_action :set_post




	private

	def set_post
		@post = Question.find(params[:question_id])
		@question = @post
	end

end