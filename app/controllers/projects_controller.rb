class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def show
	end

	def new
		@checked_weekdays = []
		@project = Project.new
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
		set_course_days_params
	end

	def destroy
		@project.destroy
		redirect_to root_path
	end

	private

	def mask_course_days
		@project.course_days = 0
		@project.course_days += 64 if params[:sunday] == '1'
		@project.course_days += 32 if params[:monday] == '1'
		@project.course_days += 16 if params[:tuesday] == '1'
		@project.course_days += 8 if params[:wednesday] == '1'
		@project.course_days += 4 if params[:thursday] == '1'
		@project.course_days += 2 if params[:friday] == '1'
		@project.course_days += 1 if params[:saturday] == '1'
	end

	def set_course_days_params
		@checked_weekdays = []		
		@checked_weekdays << :sunday if @project.course_days & 64
		@checked_weekdays << :monday if @project.course_days & 32
		@checked_weekdays << :tuesday if @project.course_days & 16
		@checked_weekdays << :wednesday if @project.course_days & 8
		@checked_weekdays << :thursday if @project.course_days & 4
		@checked_weekdays << :friday if @project.course_days & 2
		@checked_weekdays << :saturday if @project.course_days & 1
	end

	def set_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:title, :start_date)
	end
end
