class UsersController < ApplicationController
	before_action :verify_admin


	def index
		@users = User.where.not(id: current_user.id)
	end

	def show
		@user = User.find(params[:id])
		respond_to do |format|
			format.js {render layout: false, partial: 'show'}
		end
	end

	private

	def verify_admin
		unless current_user.admin?
			redirect_to projects_path
		end
	end


end
