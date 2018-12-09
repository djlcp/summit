class ProjectsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@projects = Project.all
	end

	def show
	end

	def new
		@checked_weekdays = []
		@project = Project.new
		@project.course_days = 0
		set_course_days
	end

	def create
		@project = Project.new(project_params)
		mask_course_days
		@project.save
		redirect_to @project
	end

	def update
		if @project.update(project_params)
			mask_course_days
			@project.save
          	redirect_to @project
        else
          render :edit
        end
	end

	def edit
		set_course_days
	end

	def destroy
		@project.destroy
		redirect_to root_path
	end

	private

	def mask_course_days
		@project.course_days = 0
		@project.course_days += params[:sunday].to_i if params[:sunday]
		@project.course_days += params[:monday].to_i if params[:monday]
		@project.course_days += params[:tuesday].to_i if params[:tuesday]
		@project.course_days += params[:wednesday].to_i if params[:wednesday]
		@project.course_days += params[:thursday].to_i if params[:thursday]
		@project.course_days += params[:friday].to_i if params[:friday]
		@project.course_days += params[:saturday].to_i if params[:saturday]
	end

	def set_course_days
		@checked_weekdays = []		
		@checked_weekdays << :sunday if @project.course_days & 64 > 0
		@checked_weekdays << :monday if @project.course_days & 32 > 0
		@checked_weekdays << :tuesday if @project.course_days & 16 > 0
		@checked_weekdays << :wednesday if @project.course_days & 8 > 0
		@checked_weekdays << :thursday if @project.course_days & 4 > 0
		@checked_weekdays << :friday if @project.course_days & 2 > 0
		@checked_weekdays << :saturday if @project.course_days & 1 > 0
	end

	def set_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:title, :start_date)
	end
end
