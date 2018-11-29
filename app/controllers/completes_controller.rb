class CompletesController < ApplicationController

	skip_before_action :verify_authenticity_token, :only => :update

	def update
		@step = Step.find(params[:step_id])
		@complete = Complete.find_or_create_by(step_id: @step.id, user_id: current_user.id) do |c|
			c.save
		end
		@complete.update(complete_params)

		# respond_to do |format|
		# 	format.js {render layout: false, partial: 'completes/update'}
		# end
	end

	private

	def complete_params
		params.require(:complete).permit(:completed)
	end
end
