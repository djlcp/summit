class UsersProjectsController < ApplicationController
	before_action :ser_project

	def new
		@usersproject = UsersProject.new
	end

	def create
		@usersproject = UsersProject.new(users_projects_params)
		@usersproject.project = @project 
		@usersproject.save
		redirect_to new_project_users_project_path(@project)
	end


	private

	def ser_project
		@project = Project.find(params[:project_id])
	end

	def users_projects_params
		params.require(:users_project).permit(:user_id)
	end
end
