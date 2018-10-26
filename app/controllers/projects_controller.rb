class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def show
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.save
		redirect_to @project
	end

	def update
		if @project.update(project_params)
          format.html { redirect_to @project, notice: 'project was saved successfully.' }
        else
          format.html { render :edit, notice: 'project not saved.' }
        end
	end

	def edit
	end

	def destroy
		@project.destroy
		redirect_to root_path
	end

	private

	def set_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:title, :start_date)
	end
end
