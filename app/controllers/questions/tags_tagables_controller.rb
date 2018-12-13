class Questions::TagsTagablesController < TagsTagablesController
	before_action :authenticate_user!
	before_action :set_tagable

	def create
		super
		reload_modal
	end

	def destroy
		super
		reload_modal
	end 

	private

	def set_tagable
		@tagable = Question.find(params[:question_id])
	end

	def reload_modal
		respond_to do |format|
			format.js { render layout: false, partial: 'questions/show'}
		end
	end